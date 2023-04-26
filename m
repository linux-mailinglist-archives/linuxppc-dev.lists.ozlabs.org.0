Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70426EF422
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:16:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yXf49VGz3gZk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMY4c3Gz3f8T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMY37ktz4xNC;
	Wed, 26 Apr 2023 22:08:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Pali Rohár <pali@kernel.org>
In-Reply-To: <20230409000812.18904-1-pali@kernel.org>
References: <20230409000812.18904-1-pali@kernel.org>
Subject: Re: [PATCH v3 0/8] powerpc/fsl_uli1575: Cleanups
Message-Id: <168251050523.3973805.17818294144253061969.b4-ty@ellerman.id.au>
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

On Sun, 09 Apr 2023 02:08:04 +0200, Pali Rohár wrote:
> This patch series contains cleanups for fsl_uli1575 driver.
> 
> This patch series is prerequisite for another patch series:
> "powerpc/85xx: p2020: Create one unified machine description"
> https://lore.kernel.org/linuxppc-dev/20230408140122.25293-1-pali@kernel.org/t/#u
> 
> Changes in v3:
> * Fixed compile error in the sixth patch when driver was explicitly
>   enabled on unsupported platform
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc/fsl_uli1575: Misc cleanup
      https://git.kernel.org/powerpc/c/821b3a471f686910b97228010861c4a99d07fd86
[2/8] powerpc/85xx: mpc85xx_ds: Simplify mpc85xx_exclude_device() function
      https://git.kernel.org/powerpc/c/485536b9f289c8c3c86ecaad0f05a1a7b633cb8a
[3/8] powerpc/fsl_uli1575: Simplify uli_exclude_device() usage
      https://git.kernel.org/powerpc/c/aa9f3d2d619b878a66dc918d8b3bf984300f975f
[4/8] powerpc/85xx: mpc85xx_ds: Move uli_init() code into its own driver file
      https://git.kernel.org/powerpc/c/c4f6d8665cff0abacd164b3cd10afe0385290db2
[5/8] powerpc/85xx: mpc85xx_rdb: Do not automatically select FSL_ULI1575
      https://git.kernel.org/powerpc/c/304e364d1f89f590b72af6bec42b5199971b531b
[6/8] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
      https://git.kernel.org/powerpc/c/22fdf79171e8509db54599fd2c05ef0022ee83f5
[7/8] powerpc/86xx: mpc86xx_hpcn: Call uli_init() instead of explicit ppc_md assignment
      https://git.kernel.org/powerpc/c/40b221daf17bf8e0f27c7f1ffc8d5179d58e8597
[8/8] powerpc/fsl_uli1575: Mark uli_exclude_device() as static
      https://git.kernel.org/powerpc/c/3ce271435b717e1dbc4fc8191a69e88deb4f8990

cheers
