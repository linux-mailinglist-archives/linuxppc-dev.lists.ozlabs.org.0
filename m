Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35E899395
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 05:07:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nt7LyYr0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9k1L23B3z3vZh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 14:07:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nt7LyYr0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9k0d1f9wz3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 14:06:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712286396;
	bh=rQll83np3ZgmfrTNhgz1E+J4NbFfxMVThydcSzQ/0Mk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nt7LyYr0VgKC2PN8Uh4OBsDE8MRTMWxElbEIkAPup4qXOCqn6AeSByhif9P5ytgiV
	 Y0b9YCVHe1603OzGz1CuS1UAonEljsDSUXb5aXtmNm2o9cF2iq4pQFZqtJIChURkSw
	 9Vt5EdU6CLx1RvuzF9z1OvCmkN9sZhtAHHCCj4sIWvoMK2OVCaJcbR1qBuG6pLcPbs
	 P8Cy/gvYiz9sm+Bzo2/y8VephuLdily3Dwf/bvYfJWL4L0jnQ6kLLqnzyvVClaF+3a
	 RSl6KVE7ivbi9liHBQ1OUQ5K6a71jyuPucAmq3YfgXcEbtZfpIPt3ZoJgTWSh7Y0kd
	 Qj08GU1zIAhJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V9k0V5tFtz4wcb;
	Fri,  5 Apr 2024 14:06:34 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Finn Thain
 <fthain@linux-m68k.org>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
In-Reply-To: <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain>
 <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
Date: Fri, 05 Apr 2024 14:06:33 +1100
Message-ID: <87y19s7bk6.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> On Thu, Apr 4, 2024 at 2:57=E2=80=AFAM Finn Thain <fthain@linux-m68k.org>=
 wrote:
>> On Thu, 4 Apr 2024, Andy Shevchenko wrote:
>
>> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
>> > > Cc: Nicholas Piggin <npiggin@gmail.com>
>> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> > > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
>> > > Cc: linux-m68k@lists.linux-m68k.org
>> >
>> > Second, please move these Cc to be after the '---' line
>>
>> I thought they were placed above the line for audit (and signing)
>> purposes.
>
> I didn't get this, sorry.
>
>> There are thousands of Cc lines in the mainline commit messages
>> since v6.8.
>
> Having thousands of mistaken cases does not prove it's a good thing to
> follow. I answered Jiri why it's better the way I suggested.
>
>> > > Link: https://github.com/vivier/qemu-m68k/issues/44
>> > > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
>> >
>> > Missed Fixes tag?
>>
>> Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> I have to ask because some reviewers do not like to see a Fixes tag cite
>> that commit.
>
> Yes, or you even may dig into the history.git from history group (see
> git.kernel.org) for the real first patch that brought it.
>
>> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
>> > > ---
>> > (here is a good location for Cc:)
>>
>> Documentation/process/submitting-patches.rst indicats that it should be
>> above the "---" separator together with Acked-by etc. Has this convention
>> changed recently?

The docs don't really say where to put the Cc: tags, although they are
mentioned along with other tags which clearly are intended to go above
the separator.

> I see, I will prepare a patch to discuss this aspect.

FYI there was a discussion about this several years ago, where at least
some maintainers agreed that Cc: tags don't add much value and are
better placed below the --- separator.

Thread starts here: https://lore.kernel.org/all/87y31eov1l.fsf@concordia.el=
lerman.id.au/

cheers
