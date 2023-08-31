Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7AB78E541
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:06:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbndp4LKyz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:06:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncH20m1z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncG49ZSz4wy6;
	Thu, 31 Aug 2023 14:04:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c90780017b624b91771a3e4240dcbadc68137915.1692684784.git.christophe.leroy@csgroup.eu>
References: <c90780017b624b91771a3e4240dcbadc68137915.1692684784.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/85xx: Mark some functions static and add missing includes to fix no previous prototype error
Message-Id: <169345455027.11824.1278535983200395426.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023 08:13:13 +0200, Christophe Leroy wrote:
> corenet{32/64}_smp_defconfig leads to:
> 
>   CC      arch/powerpc/sysdev/ehv_pic.o
> arch/powerpc/sysdev/ehv_pic.c:45:6: error: no previous prototype for 'ehv_pic_unmask_irq' [-Werror=missing-prototypes]
>    45 | void ehv_pic_unmask_irq(struct irq_data *d)
>       |      ^~~~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/ehv_pic.c:52:6: error: no previous prototype for 'ehv_pic_mask_irq' [-Werror=missing-prototypes]
>    52 | void ehv_pic_mask_irq(struct irq_data *d)
>       |      ^~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/ehv_pic.c:59:6: error: no previous prototype for 'ehv_pic_end_irq' [-Werror=missing-prototypes]
>    59 | void ehv_pic_end_irq(struct irq_data *d)
>       |      ^~~~~~~~~~~~~~~
> arch/powerpc/sysdev/ehv_pic.c:66:6: error: no previous prototype for 'ehv_pic_direct_end_irq' [-Werror=missing-prototypes]
>    66 | void ehv_pic_direct_end_irq(struct irq_data *d)
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/ehv_pic.c:71:5: error: no previous prototype for 'ehv_pic_set_affinity' [-Werror=missing-prototypes]
>    71 | int ehv_pic_set_affinity(struct irq_data *d, const struct cpumask *dest,
>       |     ^~~~~~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/ehv_pic.c:112:5: error: no previous prototype for 'ehv_pic_set_irq_type' [-Werror=missing-prototypes]
>   112 | int ehv_pic_set_irq_type(struct irq_data *d, unsigned int flow_type)
>       |     ^~~~~~~~~~~~~~~~~~~~
>   CC      arch/powerpc/sysdev/fsl_rio.o
> arch/powerpc/sysdev/fsl_rio.c:102:5: error: no previous prototype for 'fsl_rio_mcheck_exception' [-Werror=missing-prototypes]
>   102 | int fsl_rio_mcheck_exception(struct pt_regs *regs)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/fsl_rio.c:306:5: error: no previous prototype for 'fsl_map_inb_mem' [-Werror=missing-prototypes]
>   306 | int fsl_map_inb_mem(struct rio_mport *mport, dma_addr_t lstart,
>       |     ^~~~~~~~~~~~~~~
> arch/powerpc/sysdev/fsl_rio.c:357:6: error: no previous prototype for 'fsl_unmap_inb_mem' [-Werror=missing-prototypes]
>   357 | void fsl_unmap_inb_mem(struct rio_mport *mport, dma_addr_t lstart)
>       |      ^~~~~~~~~~~~~~~~~
> arch/powerpc/sysdev/fsl_rio.c:445:5: error: no previous prototype for 'fsl_rio_setup' [-Werror=missing-prototypes]
>   445 | int fsl_rio_setup(struct platform_device *dev)
>       |     ^~~~~~~~~~~~~
>   CC      arch/powerpc/sysdev/fsl_rmu.o
> arch/powerpc/sysdev/fsl_rmu.c:362:6: error: no previous prototype for 'msg_unit_error_handler' [-Werror=missing-prototypes]
>   362 | void msg_unit_error_handler(void)
>       |      ^~~~~~~~~~~~~~~~~~~~~~
>   CC      arch/powerpc/platforms/85xx/corenet_generic.o
> arch/powerpc/platforms/85xx/corenet_generic.c:33:13: error: no previous prototype for 'corenet_gen_pic_init' [-Werror=missing-prototypes]
>    33 | void __init corenet_gen_pic_init(void)
>       |             ^~~~~~~~~~~~~~~~~~~~
> arch/powerpc/platforms/85xx/corenet_generic.c:51:13: error: no previous prototype for 'corenet_gen_setup_arch' [-Werror=missing-prototypes]
>    51 | void __init corenet_gen_setup_arch(void)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/platforms/85xx/corenet_generic.c:104:12: error: no previous prototype for 'corenet_gen_publish_devices' [-Werror=missing-prototypes]
>   104 | int __init corenet_gen_publish_devices(void)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   CC      arch/powerpc/platforms/85xx/qemu_e500.o
> arch/powerpc/platforms/85xx/qemu_e500.c:28:13: error: no previous prototype for 'qemu_e500_pic_init' [-Werror=missing-prototypes]
>    28 | void __init qemu_e500_pic_init(void)
>       |             ^~~~~~~~~~~~~~~~~~
>   CC      arch/powerpc/kernel/pmc.o
> arch/powerpc/kernel/pmc.c:78:6: error: no previous prototype for 'power4_enable_pmcs' [-Werror=missing-prototypes]
>    78 | void power4_enable_pmcs(void)
>       |      ^~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/85xx: Mark some functions static and add missing includes to fix no previous prototype error
      https://git.kernel.org/powerpc/c/c265735ff5b1f13272e2bfb196f5c55f9b3c9bac

cheers
