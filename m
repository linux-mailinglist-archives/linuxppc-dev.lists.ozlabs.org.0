Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B793518A952
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 00:37:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jRKj5w97zDr8s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 10:37:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jRJ73lMYzDr6q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 10:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Y3qHO+96; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jRJ617n2z9sPF;
 Thu, 19 Mar 2020 10:36:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584574582;
 bh=1wPd69g706f1HjFfq9A1c68BcRSf6tB8V7w5oED57sM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Y3qHO+96wskzfknqGg/UlEnfIqCdso3oDbRgMS0Dac4PRP15nGV4cX6mlLOSw2rzY
 AysVFPwCCecrESjxP0uFDE36gveIubypVLh6FtB0HfzfLd8yxnFwiPXHkkBjFtKqIn
 bLUHjitp5jZomJ2w709RjolUQ3BUd7a+jJaMWVfdhvlK2KXxTqD0qz4gEMZeR5u19B
 +sDUVcHtt38CupYOthm7diYgSoRJFk/+h78MgrnHIyM0idckC92+y0MaZ8/cntNOoP
 V9dMzkAAGi/04pQxC4UKnXS+iKcuyUvpNUSCqA8qRWCPRpvSjXc1IA9DCZsTfYD1rS
 S8bQh6px1tAkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 12/15] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
In-Reply-To: <20200318212726.GN22482@gate.crashing.org>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-13-ravi.bangoria@linux.ibm.com>
 <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
 <87zhcdevz7.fsf@mpe.ellerman.id.au>
 <a7829a23-9b4d-0248-415e-85409f17dd77@c-s.fr>
 <20200318212726.GN22482@gate.crashing.org>
Date: Thu, 19 Mar 2020 10:36:22 +1100
Message-ID: <87wo7hdymh.fsf@mpe.ellerman.id.au>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Wed, Mar 18, 2020 at 12:44:52PM +0100, Christophe Leroy wrote:
>> Le 18/03/2020 =C3=A0 12:35, Michael Ellerman a =C3=A9crit=C2=A0:
>> >Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> >>Le 09/03/2020 =C3=A0 09:58, Ravi Bangoria a =C3=A9crit=C2=A0:
>> >>>Currently we assume that we have only one watchpoint supported by hw.
>> >>>Get rid of that assumption and use dynamic loop instead. This should
>> >>>make supporting more watchpoints very easy.
>> >>
>> >>I think using 'we' is to be avoided in commit message.
>> >
>> >Hmm, is it?
>> >
>> >I use 'we' all the time. Which doesn't mean it's correct, but I think it
>> >reads OK.
>> >
>> >cheers
>>=20
>> From=20
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html :
>>=20
>> Describe your changes in imperative mood, e.g. =E2=80=9Cmake xyzzy do fr=
otz=E2=80=9D=20
>> instead of =E2=80=9C[This patch] makes xyzzy do frotz=E2=80=9D or =E2=80=
=9C[I] changed xyzzy=20
>> to do frotz=E2=80=9D, as if you are giving orders to the codebase to cha=
nge its=20
>> behaviour.
>
> That is what is there already?  "Get rid of ...".
>
> You cannot describe the current situation with an imperative.

Yeah, I think the use of 'we' and the imperative mood are separate
things.

ie. this uses 'we' to describe the current behaviour and then the
imperative mood to describe the change that's being made:

  Currently we assume xyzzy always does bar, which is incorrect.

  Change it to do frotz.


cheers
