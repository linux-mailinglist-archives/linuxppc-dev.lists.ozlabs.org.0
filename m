Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B781A5A7E6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl4R6vWTz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl2v0bcjz3c3J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:12:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl2r5mBlz4xGF;
	Wed, 31 Aug 2022 23:12:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20220820165129.1147589-1-masahiroy@kernel.org>
References: <20220820165129.1147589-1-masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: align syscall table for ppc32
Message-Id: <166195152285.42804.18346309084097390915.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:12:02 +1000
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
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 21 Aug 2022 01:51:29 +0900, Masahiro Yamada wrote:
> Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
> symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
> mpc85xx_defconfig + CONFIG_RELOCATABLE=y.
> 
>     LD      vmlinux
>     SYSMAP  System.map
>     SORTTAB vmlinux
>     CHKREL  vmlinux
>   WARNING: 451 bad relocations
>   c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
>   c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
>   c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
>   c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
>   c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
>       ...
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: align syscall table for ppc32
      https://git.kernel.org/powerpc/c/c7acee3d2f128a38b68fb7af85dbbd91bfd0b4ad

cheers
