Return-Path: <linuxppc-dev+bounces-2161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B7099B793
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 01:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQzWJ6bgzz3bs0;
	Sun, 13 Oct 2024 10:01:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728774076;
	cv=none; b=meos94fPBT4Wal6y9xOLStVg2TuqkIR+E43xVlK3KJnnwpUC35tnav0hnlNoMnf9w/uvCL9Nvb7BN3R9++wa7TYckZMQtK/l6+vafLLotkyYmv95sGWxUSUcKHtCSCDYQrrXnvbC1LmFezKv5qEVsBvAfP2ibmowryz6GX3aHiLRoOaRLEzRVk9gymic5toUimTtBIIYw3/Tfzy/wF4CfsaPPLO9EqgX4Y+/pX4OGQUNLEQBm+Sj7YxITWAd8yPEO+Dn35DrdqKIe7VeUcWDfStffEgPnI4fYRP6XV5/RBMrkyh818FnlNJRj8Rps5CyGdxvZN3ATbAzkWyoJnY41w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728774076; c=relaxed/relaxed;
	bh=4aU2nl6tLvom+i+sZeM7Uw3RWtjRV1QtoP+sWiq08zY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a7yoWrIJudicqt7kzlNPDbcAJlS7LXyJQsQ+qQvMBMxt7ZTc73DOqfZvp9v0+up1TlwUtALHpzQv0D95dNzSm1khHAbVWXndX2o1/ioJcRsf56hKCh/5RBe2Bd7llIxfzaDlRld9lE1Ey1xvb6mOeXpKhDni4AyuKb/TCgzD9kcqBxpQItxR7sgP9utZSXoZCWePasmusQh7tfGAmb0qDQ2rvl85pPPQ4ZVqgJ2nZMYlfAOtP8r7hoDXIlMPidRgX/uFoxNQPbYQrG/owAMEvexVHQ5ZlZVeCElvlAU+cPAI8jxyXFxW0hJ5nhLKH3HqbRY0vP/KwIaParoggghHjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fix23e89; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fix23e89;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQzWF60xcz3br2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 10:01:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728774072;
	bh=4aU2nl6tLvom+i+sZeM7Uw3RWtjRV1QtoP+sWiq08zY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fix23e89gyJdW6xHHRlrS3tJfuy1H2o9HEepS+pomfJuTaf4GCjlnk6B3r4hS2kpT
	 CTI6ZgP9Mvr0cRxVKTlU0ugjoCw264aEYgdl0IdqBE6/hwW+H6gxC7ut4FmVm7h8Ms
	 a6AYR4p0TPVh5osyW3jwzKe7R5zJHPJx1VhRymgL84+9O7o11NCh3nFnjKo4sEqAVX
	 Mt71Q665b5G6L0u9sMyjLdG8NGzrDHTqV4Lo93QD7+Cs0W3/KIQ15h13vMOm/QO+Py
	 WgXCAeb/c5ToOqQyPe2leZ3hQKOT+OR6Qi6xR4k8yNfPqjsndso5oqdBL6Bd7vMHws
	 OMb20AplXi+8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQzWC4jw2z4x8Q;
	Sun, 13 Oct 2024 10:01:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <2b851399bd87e81c6ccb87ea3a7a6b32c7aa04d7.1728118396.git.christophe.leroy@csgroup.eu>
References: <2b851399bd87e81c6ccb87ea3a7a6b32c7aa04d7.1728118396.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Fix kernel DTLB miss on dcbz
Message-Id: <172877404775.499764.16227434899101631721.b4-ty@ellerman.id.au>
Date: Sun, 13 Oct 2024 10:00:47 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 05 Oct 2024 10:53:29 +0200, Christophe Leroy wrote:
> Following OOPS is encountered while loading test_bpf module
> on powerpc 8xx:
> 
> [  218.835567] BUG: Unable to handle kernel data access on write at 0xcb000000
> [  218.842473] Faulting instruction address: 0xc0017a80
> [  218.847451] Oops: Kernel access of bad area, sig: 11 [#1]
> [  218.852854] BE PAGE_SIZE=16K PREEMPT CMPC885
> [  218.857207] SAF3000 DIE NOTIFICATION
> [  218.860713] Modules linked in: test_bpf(+) test_module
> [  218.865867] CPU: 0 UID: 0 PID: 527 Comm: insmod Not tainted 6.11.0-s3k-dev-09856-g3de3d71ae2e6-dirty #1280
> [  218.875546] Hardware name: MIAE 8xx 0x500000 CMPC885
> [  218.880521] NIP:  c0017a80 LR: beab859c CTR: 000101d4
> [  218.885584] REGS: cac2bc90 TRAP: 0300   Not tainted  (6.11.0-s3k-dev-09856-g3de3d71ae2e6-dirty)
> [  218.894308] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 55005555  XER: a0007100
> [  218.901290] DAR: cb000000 DSISR: c2000000
> [  218.901290] GPR00: 000185d1 cac2bd50 c21b9580 caf7c030 c3883fcc 00000008 cafffffc 00000000
> [  218.901290] GPR08: 00040000 18300000 20000000 00000004 99005555 100d815e ca669d08 00000369
> [  218.901290] GPR16: ca730000 00000000 ca2c004c 00000000 00000000 0000035d 00000311 00000369
> [  218.901290] GPR24: ca732240 00000001 00030ba3 c3800000 00000000 00185d48 caf7c000 ca2c004c
> [  218.941087] NIP [c0017a80] memcpy+0x88/0xec
> [  218.945277] LR [beab859c] test_bpf_init+0x22c/0x3c90 [test_bpf]
> [  218.951476] Call Trace:
> [  218.953916] [cac2bd50] [beab8570] test_bpf_init+0x200/0x3c90 [test_bpf] (unreliable)
> [  218.962034] [cac2bde0] [c0004c04] do_one_initcall+0x4c/0x1fc
> [  218.967706] [cac2be40] [c00a2ec4] do_init_module+0x68/0x360
> [  218.973292] [cac2be60] [c00a5194] init_module_from_file+0x8c/0xc0
> [  218.979401] [cac2bed0] [c00a5568] sys_finit_module+0x250/0x3f0
> [  218.985248] [cac2bf20] [c000e390] system_call_exception+0x8c/0x15c
> [  218.991444] [cac2bf30] [c00120a8] ret_from_syscall+0x0/0x28
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/8xx: Fix kernel DTLB miss on dcbz
      https://git.kernel.org/powerpc/c/8956c582ac6b1693a351230179f898979dd00bdf

cheers

