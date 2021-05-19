Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8E388C38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlVHx53Qjz305q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UTkT1J4s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UTkT1J4s; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlVHV1bg9z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:59:15 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d78so8755601pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=qSDquWF5C/3kPSaisv5VvJ1hs65zlvqZ/KYndLXZBHA=;
 b=UTkT1J4sM7q+60Slm44Nc34SGgZppdCky+kG+U0w6IHxdZqOozXUhBnDf634kQsZE9
 stagF2SzjdN6bP1a0sdhTYCyvFmhZrzLDUdTBz6Ddm+lpmnVBanrYxO/3KZwENLBPCc1
 yO0Ys0hlwSwIMmwDKupVUe87eTPQe1IF+BPKUZJtKIHJpb2jOWtZCIUSV1ayH6RU5AZI
 B/+OTymu/jC771VJ7deDGbNi77c3hegXjZU1FXeAX4OtGBfRjrkYTY2GuHXyXi+E2K3i
 +uuYCpchPxOn+EaiU6hyDpwdgBymfQopity5cUs4T3KiB8J5sFPP5jKiqgtOh1JZLgtX
 g1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=qSDquWF5C/3kPSaisv5VvJ1hs65zlvqZ/KYndLXZBHA=;
 b=iDUBhFt5NlLP8TESKNRcb6tg4X7XRFa5DM9F8f4s6sLr5aBNQiiCZPjlz4wKqDQoGD
 Lw6XvFLUvoxCunNskvE1DZW1GH/0Qa7Ahw1tXlj+2xEIGNN5MkEToi5TKJD4HC6QbEVn
 c3crvbl8MGK4XTiKkx2J+uOxPZsttFiCSPa+Q2MAcpkM4Pgd3Edqq5/EXRKBe2HIXxoj
 XlGdUZPcHnz6QLz30t9v6IXsBm3+P5TJSJQSOyLWuTaNpds5iKB3yg8Lz89RqFaFwBDU
 BXHJ5tAd266EB8xJegXFlfo9kNfqTE14+OQKqyEmBXIiykdKzb6vpIvSZgxZ0gsdYDP2
 3Jsg==
X-Gm-Message-State: AOAM5322V0syYZKnPKb4De5/9XfAsqKxmYCCJcB6ZeLDfm6OfLLFGYG+
 3wPwSZUYjiBkmbKz8TULZTk=
X-Google-Smtp-Source: ABdhPJzasKvvWtp1iiKJ1oNvcHYkSjfgkycSA7T5giWeXtEipqymW1BGFzU8Y2yuUSLENyMzmOaqLg==
X-Received: by 2002:aa7:8a56:0:b029:27d:957f:5993 with SMTP id
 n22-20020aa78a560000b029027d957f5993mr9862449pfa.27.1621421950920; 
 Wed, 19 May 2021 03:59:10 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id o3sm15095254pgh.22.2021.05.19.03.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:59:10 -0700 (PDT)
Date: Wed, 19 May 2021 20:59:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <20210519102403.GA15207@altlinux.org>
In-Reply-To: <20210519102403.GA15207@altlinux.org>
MIME-Version: 1.0
Message-Id: <1621421721.r9fefebis8.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 musl@lists.openwall.com, linux-api@vger.kernel.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dmitry V. Levin's message of May 19, 2021 8:24 pm:
> On Wed, May 19, 2021 at 12:50:24PM +1000, Nicholas Piggin wrote:
> [...]
>> With this patch, I think the ptrace ABI should mostly be fixed. I think=20
>> a problem remains with applications that look at system call return=20
>> registers directly and have powerpc specific error cases. Those probably
>> will just need to be updated unfortunately. Michael thought it might be
>> possible to return an indication via ptrace somehow that the syscall is
>> using a new ABI, so such apps can be updated to test for it. I don't=20
>> know how that would be done.
>=20
> Is there any sane way for these applications to handle the scv case?
> How can they tell that the scv semantics is being used for the given
> syscall invocation?  Can this information be obtained e.g. from struct
> pt_regs?

Not that I know of. Michael suggested there might be a way to add=20
something. ptrace_syscall_info has some pad bytes, could
we use one for flags bits and set a bit for "new system call ABI"?

As a more hacky thing you could make a syscall with -1 and see how
the error looks, and then assume all syscalls will be the same.

Thanks,
Nick

>=20
> For example, in strace we have the following powerpc-specific code used
> for syscall tampering:
>=20
> $ cat src/linux/powerpc/set_error.c
> /*
>  * Copyright (c) 2016-2021 The strace developers.
>  * All rights reserved.
>  *
>  * SPDX-License-Identifier: LGPL-2.1-or-later
>  */
>=20
> static int
> arch_set_r3_ccr(struct tcb *tcp, const unsigned long r3,
> 		const unsigned long ccr_set, const unsigned long ccr_clear)
> {
> 	if (ptrace_syscall_info_is_valid() &&
> 	    upeek(tcp, sizeof(long) * PT_CCR, &ppc_regs.ccr))
>                 return -1;
> 	const unsigned long old_ccr =3D ppc_regs.ccr;
> 	ppc_regs.gpr[3] =3D r3;
> 	ppc_regs.ccr |=3D ccr_set;
> 	ppc_regs.ccr &=3D ~ccr_clear;
> 	if (ppc_regs.ccr !=3D old_ccr &&
> 	    upoke(tcp, sizeof(long) * PT_CCR, ppc_regs.ccr))
> 		return -1;
> 	return upoke(tcp, sizeof(long) * (PT_R0 + 3), ppc_regs.gpr[3]);
> }
>=20
> static int
> arch_set_error(struct tcb *tcp)
> {
> 	return arch_set_r3_ccr(tcp, tcp->u_error, 0x10000000, 0);
> }
>=20
> static int
> arch_set_success(struct tcb *tcp)
> {
> 	return arch_set_r3_ccr(tcp, tcp->u_rval, 0, 0x10000000);
> }
>=20
>=20
> --=20
> ldv
>=20
