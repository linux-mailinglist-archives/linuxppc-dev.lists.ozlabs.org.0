Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816D67C7E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 11:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2bpF1lvcz3fHm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 21:01:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmyjvNON;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmyjvNON;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Ztr1fR1z2y7W;
	Thu, 26 Jan 2023 20:20:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B276EB81CBE;
	Thu, 26 Jan 2023 09:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7DBC433D2;
	Thu, 26 Jan 2023 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674724832;
	bh=73aMcUob1WYX+/b4rggndOJ7N9caL088plxdfjSDDEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmyjvNONg1SgIhjqFFggxa6D/d0DdvOOGuNt2dtDINzMuck9VRm1yrgcKsMjflpW+
	 SwTLsN9QAcAPFlEDt4IXaVuzKuvw/QTFDgiE6iXZrjCF1Dk77N344FV6FZLMxl/SIh
	 YCzWCtWMyri2S/VxFa8w5izmma6QvGZR6W3LW+HhZQLDOEjS2QQ4+yWFtPAWXwzXjB
	 8sjW4u5olaD4DQ8+tTWSGydqMOF+S7T6bSIcqdA9DZQS+/0Qnjc5pNbohtILz6vsxE
	 pH2w8v8IDyyC1JX/SGY55iAqC16GztTVGkZPd8qlGsAwBxzWAs0I60Xu7VFg5IVHwG
	 yDtfzpUFPYi0Q==
Date: Thu, 26 Jan 2023 11:19:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 2/6] mm: replace VM_LOCKED_CLEAR_MASK with
 VM_LOCKED_MASK
Message-ID: <Y9JFqaE4n/eGoWWi@kernel.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-3-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125083851.27759-3-surenb@google.com>
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:59:36 +1100
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
Cc: michel@lespinasse.org, nvdimm@lists.linux.dev, heiko@sntech.de, leewalsh@google.com, dri-devel@lists.freedesktop.org, perex@perex.cz, jglisse@google.com, arjunroy@google.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org, qianweili@huawei.com, linux-samsung-soc@vger.kernel.org, aneesh.kumar@linux.ibm.com, chenhuacai@kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, rientjes@google.com, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, robdclark@gmail.com, minchan@google.com, robert.jarzmik@free.fr, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, npiggin@gmail.com, alex.williamson@redhat.com, viro@zeniv.linux.org.uk, luto@kernel.org, gthelen@google.com, tglx@linutronix.de, ldufour@linux.ibm.com, linux-sgx@vger.kernel.org, martin.petersen@oracle.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linux-medi
 a@vger.kernel.org, freedreno@lists.freedesktop.org, joelaf@google.com, linux-aio@kvack.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, david@redhat.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, edumazet@google.com, target-devel@vger.kernel.org, punit.agrawal@bytedance.com, linux-s390@vger.kernel.org, dave@stgolabs.net, deller@gmx.de, hughd@google.com, andrii@kernel.org, patrik.r.jakobsson@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, linux-graphics-maintainer@vmware.com, kernel-team@android.com, jayalk@intworks.biz, soheil@google.com, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, mripard@kernel.org, shakeelb@google.com, haojian.zhuang@gmail.com, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, nico@fluxnic.net, muchun.song@linux.dev, hjc@rock-chips.com, mcoquelin.stm32@gmail.com, tatashin@google.com, mike.kravetz@oracle.com, songliubraving@fb.com, jasowang
 @redhat.com, alsa-devel@alsa-project.org, peterx@redhat.com, linux-tegra@vger.kernel.org, kraxel@redhat.com, will@kernel.org, dmaengine@vger.kernel.org, bhe@redhat.com, miklos@szeredi.hu, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, willy@infradead.org, gurua@google.com, dgilbert@interlog.com, xiang@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, quic_abhinavk@quicinc.com, bp@alien8.de, mchehab@kernel.org, linux-ext4@vger.kernel.org, tomba@kernel.org, hughlynch@google.com, sre@kernel.org, tfiga@chromium.org, linux-xfs@vger.kernel.org, zhangfei.gao@linaro.org, wangzhou1@hisilicon.com, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-erofs@lists.ozlabs.org, davem@davemloft.net, mhocko@suse.com, kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, alexandre.torgue@foss.st.com, dhowells@redhat.com, linux-mm@kvack.org, ray.huang@amd.com, adilger.kernel@dilger.ca, kuba@kernel.org, sparclinux@vger.kernel.org, airlied@gmail.com, anton.ivanov@c
 ambridgegreys.com, herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, richard@nod.at, x86@kernel.org, vkoul@kernel.org, mingo@redhat.com, axelrasmussen@google.com, intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, paulmck@kernel.org, jannh@google.com, chao@kernel.org, maarten.lankhorst@linux.intel.com, liam.howlett@oracle.com, hdegoede@redhat.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, amd-gfx@lists.freedesktop.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, yoshfuji@linux-ipv6.org, linuxppc-dev@lists.ozlabs.org, dsahern@kernel.org, kent.overstreet@linux.dev, kexec@lists.infradead.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org, tzimmermann@suse.de, hannes@cmpxchg.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net, mgorman@techsingularity.net, linux-accelerators@lists.ozlabs.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 12:38:47AM -0800, Suren Baghdasaryan wrote:
> To simplify the usage of VM_LOCKED_CLEAR_MASK in clear_vm_flags(),
> replace it with VM_LOCKED_MASK bitmask and convert all users.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 4 ++--
>  kernel/fork.c      | 2 +-
>  mm/hugetlb.c       | 4 ++--
>  mm/mlock.c         | 6 +++---
>  mm/mmap.c          | 6 +++---
>  mm/mremap.c        | 2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b71f2809caac..da62bdd627bf 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -421,8 +421,8 @@ extern unsigned int kobjsize(const void *objp);
>  /* This mask defines which mm->def_flags a process can inherit its parent */
>  #define VM_INIT_DEF_MASK	VM_NOHUGEPAGE
>  
> -/* This mask is used to clear all the VMA flags used by mlock */
> -#define VM_LOCKED_CLEAR_MASK	(~(VM_LOCKED | VM_LOCKONFAULT))
> +/* This mask represents all the VMA flag bits used by mlock */
> +#define VM_LOCKED_MASK	(VM_LOCKED | VM_LOCKONFAULT)
>  
>  /* Arch-specific flags to clear when updating VM flags on protection change */
>  #ifndef VM_ARCH_CLEAR
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 6683c1b0f460..03d472051236 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -669,7 +669,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  			tmp->anon_vma = NULL;
>  		} else if (anon_vma_fork(tmp, mpnt))
>  			goto fail_nomem_anon_vma_fork;
> -		tmp->vm_flags &= ~(VM_LOCKED | VM_LOCKONFAULT);
> +		clear_vm_flags(tmp, VM_LOCKED_MASK);
>  		file = tmp->vm_file;
>  		if (file) {
>  			struct address_space *mapping = file->f_mapping;
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d20c8b09890e..4ecdbad9a451 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6973,8 +6973,8 @@ static unsigned long page_table_shareable(struct vm_area_struct *svma,
>  	unsigned long s_end = sbase + PUD_SIZE;
>  
>  	/* Allow segments to share if only one is marked locked */
> -	unsigned long vm_flags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
> -	unsigned long svm_flags = svma->vm_flags & VM_LOCKED_CLEAR_MASK;
> +	unsigned long vm_flags = vma->vm_flags & ~VM_LOCKED_MASK;
> +	unsigned long svm_flags = svma->vm_flags & ~VM_LOCKED_MASK;
>  
>  	/*
>  	 * match the virtual addresses, permission and the alignment of the
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 0336f52e03d7..5c4fff93cd6b 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -497,7 +497,7 @@ static int apply_vma_lock_flags(unsigned long start, size_t len,
>  		if (vma->vm_start != tmp)
>  			return -ENOMEM;
>  
> -		newflags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
> +		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
>  		newflags |= flags;
>  		/* Here we know that  vma->vm_start <= nstart < vma->vm_end. */
>  		tmp = vma->vm_end;
> @@ -661,7 +661,7 @@ static int apply_mlockall_flags(int flags)
>  	struct vm_area_struct *vma, *prev = NULL;
>  	vm_flags_t to_add = 0;
>  
> -	current->mm->def_flags &= VM_LOCKED_CLEAR_MASK;
> +	current->mm->def_flags &= ~VM_LOCKED_MASK;
>  	if (flags & MCL_FUTURE) {
>  		current->mm->def_flags |= VM_LOCKED;
>  
> @@ -681,7 +681,7 @@ static int apply_mlockall_flags(int flags)
>  	for_each_vma(vmi, vma) {
>  		vm_flags_t newflags;
>  
> -		newflags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
> +		newflags = vma->vm_flags & ~VM_LOCKED_MASK;
>  		newflags |= to_add;
>  
>  		/* Ignore errors */
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d4abc6feced1..323bd253b25a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2671,7 +2671,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
>  		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
>  					is_vm_hugetlb_page(vma) ||
>  					vma == get_gate_vma(current->mm))
> -			vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
> +			clear_vm_flags(vma, VM_LOCKED_MASK);
>  		else
>  			mm->locked_vm += (len >> PAGE_SHIFT);
>  	}
> @@ -3340,8 +3340,8 @@ static struct vm_area_struct *__install_special_mapping(
>  	vma->vm_start = addr;
>  	vma->vm_end = addr + len;
>  
> -	vma->vm_flags = vm_flags | mm->def_flags | VM_DONTEXPAND | VM_SOFTDIRTY;
> -	vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
> +	init_vm_flags(vma, (vm_flags | mm->def_flags |
> +		      VM_DONTEXPAND | VM_SOFTDIRTY) & ~VM_LOCKED_MASK);
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  
>  	vma->vm_ops = ops;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 1b3ee02bead7..35db9752cb6a 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -687,7 +687,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  
>  	if (unlikely(!err && (flags & MREMAP_DONTUNMAP))) {
>  		/* We always clear VM_LOCKED[ONFAULT] on the old vma */
> -		vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
> +		clear_vm_flags(vma, VM_LOCKED_MASK);
>  
>  		/*
>  		 * anon_vma links of the old vma is no longer needed after its page
> -- 
> 2.39.1
> 
> 
