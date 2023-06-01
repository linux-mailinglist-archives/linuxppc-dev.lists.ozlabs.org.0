Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD126719CAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 14:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX5hd2yB5z3dxS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:55:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gzr/Hmhj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX5gn3nv8z3cfJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 22:54:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gzr/Hmhj;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QX5gm3jPHz4whk;
	Thu,  1 Jun 2023 22:54:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685624085;
	bh=OZ/5HE/soAZZFHMXDiilpjDsIee5iu2+4q2X3qd67Kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gzr/Hmhjs2KUDi4nnp0MTHzIyL0PHDDlwEtr+CBgyllamdBOtERawuTPq1+Z0snRe
	 RqvCFjm/AWFD80J4BeLp2QSQym1ZXeBiTft476K8ziJUbnMOsjsA8RguD3AXyBM5ye
	 BB8D+ZLSQhYU4+sMbj/eMXeZOxXpMmvnOSbuYx4SljrZQOjCTWzd6GgU2ijA91cw2e
	 hBlD1wH6lVO9+LZrJWD78PbLEnkVDbcqxmqj/xz6NryKP4Qh8wL5EamqBP+0kxiavr
	 heyBgrKUWteT0TNw6HQ7F6eykkAzJNWrx0xo+P2Vm3YnPQiCg8krOBryTkoo95eIfg
	 HINee5Siuuv1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
In-Reply-To: <CANiq72nf-MC36hHzv0ZpR+qUyaf3mhF+rfqpMcVbw0AheuRBpA@mail.gmail.com>
References: <CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com>
 <20230529111337.352990-2-maninder1.s@samsung.com>
 <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
 <87ilc8ym6v.fsf@mail.lhotse>
 <CANiq72nf-MC36hHzv0ZpR+qUyaf3mhF+rfqpMcVbw0AheuRBpA@mail.gmail.com>
Date: Thu, 01 Jun 2023 22:54:42 +1000
Message-ID: <87jzwngx65.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, linux-hexagon@vger.kernel.org, ustavoars@kernel.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, Maninder Singh <maninder1.s@samsung.com>, Onkarnath <onkarnath.1@samsung.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> On Thu, Jun 1, 2023 at 4:02=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>>
>> > Side-note: in `get_function_bounds()`, I see `kallsyms_lookup()` being
>> > used, but the name seems discarded? Can
>> > `kallsyms_lookup_size_offset()` be used instead, thus avoiding the
>> > usage of the buffer there to begin with?
>>
>> A few lines below it uses the modname, and AFAICS there's no (easy) way
>> to lookup the modname without also looking up the name.
>
> Hmm... I think you are looking at the `xmon_print_symbol()` one? I was
> referring to the `get_function_bounds()` one, where the `modname`
> parameter is `NULL` (and the `name` contents are not used, only
> whether it was found or not).

Yes you're right, apparently I can't read :}

cheers
