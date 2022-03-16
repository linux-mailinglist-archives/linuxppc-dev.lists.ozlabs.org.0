Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C383B4DA729
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 02:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJBmL4nzLz3bSy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 12:01:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OVYxdnUC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJBlg6sqsz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 12:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OVYxdnUC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KJBlb3Dljz4xLQ;
 Wed, 16 Mar 2022 12:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647392427;
 bh=yCdn2OfBru67nMJKT3NwGQ4LYVJb2NsO9wYeAEVcL6I=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=OVYxdnUCchEFKwcLWPMLR9vUvvgIf0Xs5xi175FSx0qpei3cSLBZEFtW4XpANmC40
 JMydKbe3A+ib1SJRoch5EaTFInUUlTcEOZ8rftFL7bSA/ODXGYtw5w1HbP+paA4+KU
 8wDoWHHLreo8jYa8+tIkb2aLTXJ71ev7szYz2TzCb4IAauJHoJ9r+ySt+lzcl7Y47N
 AIOWFAtN4XeYGIGNZcjd99vNDjPCcX2IF5VMDpcq/Ikp3OL7XlE33Cxsq63w9gVVR2
 yyOBN1uX/Xz7Od7EXledguG6j4K3DaVScLbxXq9w9rfBAYRtf9nkOFwzgxYptBzGA4
 cXTBelK1vLpsw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/tm: Fix more userspace r13 corruption
In-Reply-To: <b7ddaf945ed35c0e072acc41b7bbc6d8c4c5d69f.camel@neuling.org>
References: <20220311024733.48926-1-npiggin@gmail.com>
 <b7ddaf945ed35c0e072acc41b7bbc6d8c4c5d69f.camel@neuling.org>
Date: Wed, 16 Mar 2022 12:00:23 +1100
Message-ID: <871qz24spk.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> On Fri, 2022-03-11 at 12:47 +1000, Nicholas Piggin wrote:
>> Commit cf13435b730a ("powerpc/tm: Fix userspace r13 corruption") fixes
>> a problem in treclaim where a SLB miss can occur on the
>> thread_struct->ckpt_regs while SCRATCH0 is live with the saved user r13
>> value, clobbering it with the kernel r13 and ultimately resulting in
>> kernel r13 being stored in ckpt_regs.
>>=20
>> There is an equivalent problem in trechkpt where the user r13 value is
>> loaded into r13 from chkpt_regs to be recheckpointed, but a SLB miss
>> could occur on ckpt_regs accesses after that, which will result in r13
>> being clobbered with a kernel value and that will get recheckpointed and
>> then restored to user registers.
>>=20
>> The same memory page is accessed right before this critical window where
>> a SLB miss could cause corruption, so hitting the bug requires the SLB
>> entry be removed within a small window of instructions, which is possible
>> if a SLB related MCE hits there. PAPR also permits the hypervisor to
>> discard this SLB entry (because slb_shadow->persistent is only set to
>> SLB_NUM_BOLTED) although it's not known whether any implementations would
>> do this (KVM does not). So this is an extremely unlikely bug, only found
>> by inspection.
>>=20
>> Fix this by also storing user r13 in a temporary location on the kernel
>> stack and don't chane the r13 register from kernel r13 until the RI=3D0
>> critical section that does not fault.
>
> s/chane/change/

Fixed.

>> [ The SCRATCH0 change is not strictly part of the fix, it's only used in
>> =C2=A0 the RI=3D0 section so it does not have the same problem as the pr=
evious
>> =C2=A0 SCRATCH0 bug. ]
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> This needs to be marked for stable also. Other than that:

I added:

Fixes: 98ae22e15b43 ("powerpc: Add helper functions for transactional memor=
y context switching")
Cc: stable@vger.kernel.org # v3.9+

cheers
