Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3C3D563F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 11:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYDkX3862z3bSm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 19:13:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BTtsSmHk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BTtsSmHk; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYDk85zFPz2yZb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 19:13:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GYDk31Hh6z9sRK;
 Mon, 26 Jul 2021 19:13:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627290811;
 bh=EmXfaftT1IqjptCL3mh1XdTbojOaazXywA0uGYqoaU4=;
 h=From:To:Cc:Subject:Date:From;
 b=BTtsSmHkS6RTzkHf/fs8kiC/3IGxOPUYUlxhWZUeEWaLu+LY8yD4AIULbqmZvoxbW
 LXj9z6XyW1vbg130FGfWZNWfLzfHGyqZUHeu2H7F/jtTZsztvhVxnflkuc1XPXZzqV
 6O1py/wIEQsRFqwW8Y1/AtRpwYa0yt4Ud+IRcTxO91+toq7FapMT+LHS8Su7kLVbxx
 WweyD7OvrsWhwqyBQEkCqZutmq9+2LOSOj2v2xbDfvTgosepryCtMEYbPSqxJ+fiDI
 saMdArM4ATStEOxbcm+y9Lg6sqogN85Xp9uZT13kUOSSUix6BoUf5qD4tjshpDd9z0
 BWxPjy6OSMeHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: oss-security@lists.openwall.com
Subject: Linux kernel: powerpc: KVM guest to host memory corruption
Date: Mon, 26 Jul 2021 19:13:25 +1000
Message-ID: <87im0x1lqi.fsf@mpe.ellerman.id.au>
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

The Linux kernel for powerpc since v3.10 has a bug which allows a malicious KVM guest to
corrupt host memory.

In the handling of the H_RTAS hypercall, args.rets is made to point into the args.args
buffer which is located on the stack:

	args.rets = &args.args[be32_to_cpu(args.nargs)];

However args.nargs has not been range checked. That allows the guest to point args.rets
anywhere up to +16GB from args.args.

The guest does not have control of what is written to args.rets, it is always (u32)-3,
because subsequent code does check nargs. Additionally the guest will be killed as a
result of the nargs being out of range, so a given guest only has a single shot at
corrupting memory.

Only machines using Linux as the hypervisor, aka. KVM or bare metal, are affected by the
bug.

The bug was introduced in:

    8e591cb72047 ("KVM: PPC: Book3S: Add infrastructure to implement kernel-side RTAS calls")

Which was first released in v3.10.

The upstream fix is:

  f62f3c20647e ("KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow")

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f62f3c20647ebd5fb6ecb8f0b477b9281c44c10a

Which will be included in the v5.14 release.

cheers
