Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35774394A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 13:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdCCS3d2bz2yMN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 22:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X9Ouwhtq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdCBr3WXnz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 22:19:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X9Ouwhtq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdCBq0gMqz4xZ1;
 Mon, 25 Oct 2021 22:18:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635160739;
 bh=q2w+1Ixl2mryFLxgvQRnX8bXQAX4fFunUvPWxhDUOcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=X9OuwhtqadHhk7tjAZIg6c6ioV4Xduz445XgQXBPGVu9ijCScrlkNdlND6fYEHv9F
 K1YPjkiba1QM3n7v+xDUxaNp4orCLXweMmMoGDtjrrV0VwevbEe/4z/gVIxivINVi1
 JDIyNbOEWf52IWim9R3zSY2OPJWlHy7pnWRdYVAciz+N50g7puFU+zOzjj1WN69U+I
 0deHyhlgfz0v8TwGC0fNxGYoA38x3tojyhCHZcb2xkOBWrS7ItS/y0IEeg9uwtaS66
 Eh3KNmSYIFYjnWAh2hfwh14tyfjIdrEu9vIv5auqqM0byqn/mPBvvtSJftuAsZo0rh
 8lm1AZVwpJmVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: oss-security@lists.openwall.com
Subject: Linux kernel: powerpc: KVM guest can trigger host crash on Power8 
Date: Mon, 25 Oct 2021 22:18:54 +1100
Message-ID: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Linux kernel for powerpc since v5.2 has a bug which allows a
malicious KVM guest to crash the host, when the host is running on
Power8.

Only machines using Linux as the hypervisor, aka. KVM, powernv or bare
metal, are affected by the bug. Machines running PowerVM are not
affected.

The bug was introduced in:

    10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")

Which was first released in v5.2.

The upstream fix is:

  cdeb5d7d890e ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337

Which will be included in the v5.16 release.

Note to backporters, the following commits are required:

  73287caa9210ded6066833195f4335f7f688a46b
  ("powerpc64/idle: Fix SP offsets when saving GPRs")

  9b4416c5095c20e110c82ae602c254099b83b72f
  ("KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()")

  cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
  ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")

  496c5fe25c377ddb7815c4ce8ecfb676f051e9b6
  ("powerpc/idle: Don't corrupt back chain when going idle")


I have a test case to trigger the bug, which I can share privately with
anyone who would like to test the fix.

cheers
