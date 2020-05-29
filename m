Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE21E797C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YKCk50KSzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 19:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YKB55vYjzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 19:33:17 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6692AE69;
 Fri, 29 May 2020 09:33:12 +0000 (UTC)
Date: Fri, 29 May 2020 11:33:10 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: jack@suse.de
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
Message-ID: <20200529093310.GL25173@kitsune.suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-nvdimm@lists.01.org, oohall@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding Jan

On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
> With POWER10, architecture is adding new pmem flush and sync instructions.
> The kernel should prevent the usage of MAP_SYNC if applications are not using
> the new instructions on newer hardware.
> 
> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
> the usage of MAP_SYNC. The kernel config option is added to allow the user
> to control whether MAP_SYNC should be enabled by default or not.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  include/linux/sched/coredump.h | 13 ++++++++++---
>  include/uapi/linux/prctl.h     |  3 +++
>  kernel/fork.c                  |  8 +++++++-
>  kernel/sys.c                   | 18 ++++++++++++++++++
>  mm/Kconfig                     |  3 +++
>  mm/mmap.c                      |  4 ++++
>  6 files changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredump.h
> index ecdc6542070f..9ba6b3d5f991 100644
> --- a/include/linux/sched/coredump.h
> +++ b/include/linux/sched/coredump.h
> @@ -72,9 +72,16 @@ static inline int get_dumpable(struct mm_struct *mm)
>  #define MMF_DISABLE_THP		24	/* disable THP for all VMAs */
>  #define MMF_OOM_VICTIM		25	/* mm is the oom victim */
>  #define MMF_OOM_REAP_QUEUED	26	/* mm was queued for oom_reaper */
> -#define MMF_DISABLE_THP_MASK	(1 << MMF_DISABLE_THP)
> +#define MMF_DISABLE_MAP_SYNC	27	/* disable THP for all VMAs */
> +#define MMF_DISABLE_THP_MASK		(1 << MMF_DISABLE_THP)
> +#define MMF_DISABLE_MAP_SYNC_MASK	(1 << MMF_DISABLE_MAP_SYNC)
>  
> -#define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
> -				 MMF_DISABLE_THP_MASK)
> +#define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK | \
> +			MMF_DISABLE_THP_MASK | MMF_DISABLE_MAP_SYNC_MASK)
> +
> +static inline bool map_sync_enabled(struct mm_struct *mm)
> +{
> +	return !(mm->flags & MMF_DISABLE_MAP_SYNC_MASK);
> +}
>  
>  #endif /* _LINUX_SCHED_COREDUMP_H */
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 07b4f8131e36..ee4cde32d5cf 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -238,4 +238,7 @@ struct prctl_mm_map {
>  #define PR_SET_IO_FLUSHER		57
>  #define PR_GET_IO_FLUSHER		58
>  
> +#define PR_SET_MAP_SYNC_ENABLE		59
> +#define PR_GET_MAP_SYNC_ENABLE		60
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 8c700f881d92..d5a9a363e81e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
>  
>  static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
>  
> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
> +#else
> +unsigned long default_map_sync_mask = 0;
> +#endif
> +
>  static int __init coredump_filter_setup(char *s)
>  {
>  	default_dump_filter =
> @@ -1039,7 +1045,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  		mm->flags = current->mm->flags & MMF_INIT_MASK;
>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>  	} else {
> -		mm->flags = default_dump_filter;
> +		mm->flags = default_dump_filter | default_map_sync_mask;
>  		mm->def_flags = 0;
>  	}
>  
> diff --git a/kernel/sys.c b/kernel/sys.c
> index d325f3ab624a..f6127cf4128b 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2450,6 +2450,24 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>  		up_write(&me->mm->mmap_sem);
>  		break;
> +
> +	case PR_GET_MAP_SYNC_ENABLE:
> +		if (arg2 || arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = !test_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
> +		break;
> +	case PR_SET_MAP_SYNC_ENABLE:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		if (down_write_killable(&me->mm->mmap_sem))
> +			return -EINTR;
> +		if (arg2)
> +			clear_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
> +		else
> +			set_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
> +		up_write(&me->mm->mmap_sem);
> +		break;
> +
>  	case PR_MPX_ENABLE_MANAGEMENT:
>  	case PR_MPX_DISABLE_MANAGEMENT:
>  		/* No longer implemented: */
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c1acc34c1c35..38fd7cfbfca8 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -867,4 +867,7 @@ config ARCH_HAS_HUGEPD
>  config MAPPING_DIRTY_HELPERS
>          bool
>  
> +config ARCH_MAP_SYNC_DISABLE
> +	bool
> +
>  endmenu
> diff --git a/mm/mmap.c b/mm/mmap.c
> index f609e9ec4a25..613e5894f178 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1464,6 +1464,10 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>  		case MAP_SHARED_VALIDATE:
>  			if (flags & ~flags_mask)
>  				return -EOPNOTSUPP;
> +
> +			if ((flags & MAP_SYNC)  && !map_sync_enabled(mm))
> +				return -EOPNOTSUPP;
> +
>  			if (prot & PROT_WRITE) {
>  				if (!(file->f_mode & FMODE_WRITE))
>  					return -EACCES;
> -- 
> 2.26.2
> 
