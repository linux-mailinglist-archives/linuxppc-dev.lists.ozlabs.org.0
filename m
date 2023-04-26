Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDB96EF424
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:17:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yY950clz3g2Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMZ1nV0z3fBf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMZ0LH3z4xND;
	Wed, 26 Apr 2023 22:08:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Pali Rohár <pali@kernel.org>
In-Reply-To: <20230408140122.25293-1-pali@kernel.org>
References: <20230408140122.25293-1-pali@kernel.org>
Subject: Re: [PATCH v5 00/13] powerpc/85xx: p2020: Create one unified machine description
Message-Id: <168251050523.3973805.4035474722236512162.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 08 Apr 2023 16:01:09 +0200, Pali Rohár wrote:
> This patch series unifies all P2020 boards and machine descriptions into
> one generic unified P2020 machine description. With this generic machine
> description, kernel can boot on any P2020-based board with correct DTS
> file.
> 
> Tested on CZ.NIC Turris 1.1 board which has Freescale P2020 processor.
> Kernel during booting correctly detects P2020 and prints:
> [    0.000000] Hardware name: Turris 1.1 e500v2 0x80211051 Freescale P2020
> 
> [...]

Applied to powerpc/next.

[01/13] powerpc/85xx: Remove DBG() macro
        https://git.kernel.org/powerpc/c/6faab5d7ac49d40bedf348a879042681755c14b0
[02/13] powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
        https://git.kernel.org/powerpc/c/0abc1eadd605d461b9a953e6a27d810ed169ed7b
[03/13] powerpc/85xx: mpc85xx_{ds/rdb} replace BUG_ON() by WARN_ON()
        https://git.kernel.org/powerpc/c/1bca2f8219da51a1119d1f4054b44880cbf0494e
[04/13] powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
        https://git.kernel.org/powerpc/c/15c6ba7992993fecdac52a424ce35b6e4a272c75
[05/13] powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
        https://git.kernel.org/powerpc/c/f435f67024cbee223083aa843f9b69888c8de8a8
[06/13] powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb
        https://git.kernel.org/powerpc/c/b1a54cb693724b6212efa64d877126769ece4d4c
[07/13] powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
        https://git.kernel.org/powerpc/c/ba5a7ca277afc0e9083a7a2021725425a493cfb2
[08/13] powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to p2020.c
        https://git.kernel.org/powerpc/c/c30aa8fd6cabd12917277facbd2bd81dc3a226d6
[09/13] powerpc/85xx: mpc85xx_ds: Move i8259 code into own file
        https://git.kernel.org/powerpc/c/92189c902c2e2f8c0d4238310686e93da99156b5
[10/13] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
        https://git.kernel.org/powerpc/c/7d8ae6e081428699999c9d128c4e9d3927c1da03
[11/13] powerpc/85xx: p2020: Define just one machine description
        https://git.kernel.org/powerpc/c/1a170efec56ba4707cd33e711dbafb60b7f94626
[12/13] powerpc/85xx: p2020: Enable boards by new config option CONFIG_PPC_P2020
        https://git.kernel.org/powerpc/c/b5340a094b5c753ee3490716bcd86546dfd3e078
[13/13] powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
        https://git.kernel.org/powerpc/c/40f7b523e31fd68163d9dfe639f2f34b6a726ecd

cheers
