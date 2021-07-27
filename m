Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AF3D6B44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 02:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYdQs4cwHz3bPN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 10:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ire/ZMXQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ire/ZMXQ; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYdQS6kk9z301F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 10:46:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GYdQL71CSz9sWX;
 Tue, 27 Jul 2021 10:46:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627346779;
 bh=9Ngvnk/KaSiH9PtAbbUjpuSC8Mf0FxRg7kOKlrs9ZOI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ire/ZMXQ31CRLukuxOOp1Lir5CBQxP+hTYJo5zUe+FxZ2lvE8jEVtVgbPXFQLZxb1
 pi5uSsy9DuKAIn6ohaHIFBLFSNWGoqICdSKt2pj8QOml5HG5iddB/4h1PK6xTV9iGI
 vlBI9tgvc6ntet5ieZkJXSXC48B3iRcII8qFSE0YurDGV2XXTGyhRzYxvM3E/6G5I4
 Pg2X6FBSswzuTvDRhgANrhrIMSLwtSBRwnzNR9/yPnSNDGQoMK2Rm9p7JiZSufD7WC
 1zlSeQMR5ar9aTm3q4jBQqriUqiS/wrC7uDIPhumJvsVrpKIXR9p7877XmbGTFwdoW
 7L/a6jsxI8Opw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: oss-security@lists.openwall.com
Subject: Re: Linux kernel: powerpc: KVM guest to host memory corruption
In-Reply-To: <87im0x1lqi.fsf@mpe.ellerman.id.au>
References: <87im0x1lqi.fsf@mpe.ellerman.id.au>
Date: Tue, 27 Jul 2021 10:46:14 +1000
Message-ID: <87eebk1t49.fsf@mpe.ellerman.id.au>
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> The Linux kernel for powerpc since v3.10 has a bug which allows a malicious KVM guest to
> corrupt host memory.
>
> In the handling of the H_RTAS hypercall, args.rets is made to point into the args.args
> buffer which is located on the stack:
>
> 	args.rets = &args.args[be32_to_cpu(args.nargs)];
>
> However args.nargs has not been range checked. That allows the guest to point args.rets
> anywhere up to +16GB from args.args.
>
> The guest does not have control of what is written to args.rets, it is always (u32)-3,
> because subsequent code does check nargs. Additionally the guest will be killed as a
> result of the nargs being out of range, so a given guest only has a single shot at
> corrupting memory.
>
> Only machines using Linux as the hypervisor, aka. KVM or bare metal, are affected by the
> bug.
>
> The bug was introduced in:
>
>     8e591cb72047 ("KVM: PPC: Book3S: Add infrastructure to implement kernel-side RTAS calls")
>
> Which was first released in v3.10.
>
> The upstream fix is:
>
>   f62f3c20647e ("KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow")
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f62f3c20647ebd5fb6ecb8f0b477b9281c44c10a
>
> Which will be included in the v5.14 release.

This has been assigned CVE-2021-37576.

cheers
