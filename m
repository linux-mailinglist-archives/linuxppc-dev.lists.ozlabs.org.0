Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37326F61C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 08:44:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt47P3QNPzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 16:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt43X13jvzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 16:40:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bPb1vssf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt43W4bp9z9sT5;
 Fri, 18 Sep 2020 16:40:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600411255;
 bh=O6V9pxOs95GofA6TfqHktbthnI7bckvJC30WL5qXDVU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bPb1vssfZRPJ9CRP7hXOCUXt4De53slpzr+FRSo3yczmUi0nHh9oUWfT4h/nUVCh3
 6u68v9U1GWxtqvY1Iefhb0ECRHcp1TXxpgVg2vmQldUhejTVqEXGXmvWhfAS5tgyjt
 oQLOvP9+Is/fGPZZoLmV3X9LUfDT9b+UzL5pvWqvjWPHrVIKSaC7pZym0oKLm/BFUS
 lH+XkEaxlUwPKeYG6vYnFBmJ+KvObrTnwRdHg76iyqtgQTT2Pg7M1hr6lPpGXXImXC
 Z9ofAEn2a0HwFObSHsxRPg6oPgH+YLt61pCkUBxpcju4EIDEIgsLH8KxsRO3+ZyMhL
 snWF1ZgCWZRiw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] powerpc/mce: Add debugfs interface to inject MCE
In-Reply-To: <20200916172228.83271-3-ganeshgr@linux.ibm.com>
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
 <20200916172228.83271-3-ganeshgr@linux.ibm.com>
Date: Fri, 18 Sep 2020 16:40:55 +1000
Message-ID: <87a6xnoadk.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, msuchanek@suse.de,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> To test machine check handling, add debugfs interface to inject
> slb multihit errors.
>
> To inject slb multihit:
>  #echo 1 > /sys/kernel/debug/powerpc/mce_error_inject/inject_slb_multihit

Rather than creating a new ad-hoc way to trigger this, can you please
integrate it into drivers/misc/lkdtm.

There's enough code here that I think you should create
drivers/misc/lkdtm/powerpc.c and put the code in there. Then add an
LKDTM entry point for this, maybe called PPC_SLB_MULTIHIT.

Please Cc Kees when you repost.

cheers


>  arch/powerpc/Kconfig.debug             |   9 ++
>  arch/powerpc/sysdev/Makefile           |   2 +
>  arch/powerpc/sysdev/mce_error_inject.c | 148 +++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 arch/powerpc/sysdev/mce_error_inject.c
>
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index b88900f4832f..61db133f2f0d 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -398,3 +398,12 @@ config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN
>  	default 0xe0000000
> +
> +config MCE_ERROR_INJECT
> +	bool "Enable MCE error injection through debugfs"
> +	depends on DEBUG_FS
> +	default y
> +	help
> +	  This option creates an mce_error_inject directory in the
> +	  powerpc debugfs directory that allows limited injection of
> +	  Machine Check Errors (MCEs).
> diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
> index 026b3f01a991..7fc102222b77 100644
> --- a/arch/powerpc/sysdev/Makefile
> +++ b/arch/powerpc/sysdev/Makefile
> @@ -52,3 +52,5 @@ obj-$(CONFIG_PPC_XICS)		+= xics/
>  obj-$(CONFIG_PPC_XIVE)		+= xive/
>  
>  obj-$(CONFIG_GE_FPGA)		+= ge/
> +
> +obj-$(CONFIG_MCE_ERROR_INJECT)	+= mce_error_inject.o
> diff --git a/arch/powerpc/sysdev/mce_error_inject.c b/arch/powerpc/sysdev/mce_error_inject.c
> new file mode 100644
> index 000000000000..ca4726bfa2d9
> --- /dev/null
> +++ b/arch/powerpc/sysdev/mce_error_inject.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Machine Check Exception injection code
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/vmalloc.h>
> +#include <linux/fs.h>
> +#include <linux/debugfs.h>
> +#include <asm/debugfs.h>
> +
> +static inline unsigned long get_slb_index(void)
> +{
> +	unsigned long index;
> +
> +	index = get_paca()->stab_rr;
> +
> +	/*
> +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
> +	 */
> +	if (index < (mmu_slb_size - 1))
> +		index++;
> +	else
> +		index = SLB_NUM_BOLTED;
> +	get_paca()->stab_rr = index;
> +	return index;
> +}
> +
> +#define slb_esid_mask(ssize)	\
> +	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
> +
> +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
> +					 unsigned long slot)
> +{
> +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
> +}
> +
> +#define slb_vsid_shift(ssize)	\
> +	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
> +
> +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
> +					 unsigned long flags)
> +{
> +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
> +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
> +}
> +
> +static void insert_slb_entry(char *p, int ssize)
> +{
> +	unsigned long flags, entry;
> +	struct paca_struct *paca;
> +
> +	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
> +
> +	preempt_disable();
> +
> +	paca = get_paca();
> +
> +	entry = get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +
> +	entry = get_slb_index();
> +	asm volatile("slbmte %0,%1" :
> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
> +			: "memory");
> +	preempt_enable();
> +	p[0] = '!';
> +}
> +
> +static void inject_vmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p = vmalloc(2048);
> +	if (!p)
> +		return;
> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	vfree(p);
> +}
> +
> +static void inject_kmalloc_slb_multihit(void)
> +{
> +	char *p;
> +
> +	p = kmalloc(2048, GFP_KERNEL);
> +	if (!p)
> +		return;
> +
> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
> +	kfree(p);
> +}
> +
> +static ssize_t inject_slb_multihit(const char __user *u_buf, size_t count)
> +{
> +	char buf[32];
> +	size_t buf_size;
> +
> +	buf_size = min(count, (sizeof(buf) - 1));
> +	if (copy_from_user(buf, u_buf, buf_size))
> +		return -EFAULT;
> +	buf[buf_size] = '\0';
> +
> +	if (buf[0] != '1')
> +		return -EINVAL;
> +
> +	inject_vmalloc_slb_multihit();
> +	inject_kmalloc_slb_multihit();
> +	return count;
> +}
> +
> +static ssize_t inject_write(struct file *file, const char __user *buf,
> +			    size_t count, loff_t *ppos)
> +{
> +	static ssize_t (*func)(const char __user *, size_t);
> +
> +	func = file->f_inode->i_private;
> +	return func(buf, count);
> +}
> +
> +static const struct file_operations inject_fops = {
> +	.write		= inject_write,
> +	.llseek		= default_llseek,
> +};
> +
> +static int mce_error_inject_setup(void)
> +{
> +	struct dentry *mce_error_inject_dir;
> +
> +	mce_error_inject_dir = debugfs_create_dir("mce_error_inject",
> +						  powerpc_debugfs_root);
> +
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
> +		(void)debugfs_create_file("inject_slb_multihit", 0200,
> +					  mce_error_inject_dir,
> +					  &inject_slb_multihit,
> +					  &inject_fops);
> +	}
> +
> +	return 0;
> +}
> +
> +device_initcall(mce_error_inject_setup);
> -- 
> 2.26.2
