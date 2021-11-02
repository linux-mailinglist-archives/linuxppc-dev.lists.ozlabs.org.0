Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C7442CF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:42:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7L70htnz3dhq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:42:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fg2YzYz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fg22bMz4xcw;
 Tue,  2 Nov 2021 22:38:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
References: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/8] powerpc/booke: Disable STRICT_KERNEL_RWX,
 DEBUG_PAGEALLOC and KFENCE
Message-Id: <163584790135.1845480.2173070961841776938.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:41 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 12:02:42 +0200, Christophe Leroy wrote:
> fsl_booke and 44x are not able to map kernel linear memory with
> pages, so they can't support DEBUG_PAGEALLOC and KFENCE, and
> STRICT_KERNEL_RWX is also a problem for now.
> 
> Enable those only on book3s (both 32 and 64 except KFENCE), 8xx and 40x.
> 
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc/booke: Disable STRICT_KERNEL_RWX, DEBUG_PAGEALLOC and KFENCE
      https://git.kernel.org/powerpc/c/68b44f94d6370e2c6c790fedd28e637fa9964a93
[2/8] powerpc/fsl_booke: Rename fsl_booke.c to fsl_book3e.c
      https://git.kernel.org/powerpc/c/3a75fd709c89cb45b8b1044b8ef0d15027a69f9b
[3/8] powerpc/fsl_booke: Take exec flag into account when setting TLBCAMs
      https://git.kernel.org/powerpc/c/01116e6e98b08ab0641fa516ddafb1b1b2088e64
[4/8] powerpc/fsl_booke: Enable reloading of TLBCAM without switching to AS1
      https://git.kernel.org/powerpc/c/a97dd9e2f760c6996a8f1385ddab0bfef325b364
[5/8] powerpc/fsl_booke: Tell map_mem_in_cams() if init is done
      https://git.kernel.org/powerpc/c/52bda69ae8b5102fe08c9db10f4a1514478e07d3
[6/8] powerpc/fsl_booke: Allocate separate TLBCAMs for readonly memory
      https://git.kernel.org/powerpc/c/0b2859a74306b2b89f6e77c216fe0992ff890fa6
[7/8] powerpc/fsl_booke: Update of TLBCAMs after init
      https://git.kernel.org/powerpc/c/d5970045cf9e266d9a43941ac0866865fd22a36a
[8/8] powerpc/fsl_booke: Enable STRICT_KERNEL_RWX
      https://git.kernel.org/powerpc/c/49e3d8ea62482625c3835f0a33ae9c1dda39ea8f

cheers
