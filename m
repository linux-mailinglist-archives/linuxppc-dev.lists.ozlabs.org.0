Return-Path: <linuxppc-dev+bounces-340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10495B1A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 11:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqHtd6DGHz2xfR;
	Thu, 22 Aug 2024 19:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEexj8Dj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqHtd2LFGz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 19:28:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724318889; x=1755854889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nlZScaTrGwKship0z+lXTgDsPGh1Ywve0c6RRdSRLZg=;
  b=OEexj8Dj3nMU3ffgmIij5bwYZNy/9vw3LPrvD7buvfR5T4ip80LgyhbE
   EYX4nor2N2dEgLjZmOBtNk7Qgki/Cw6vBlDCQVuDfFuDxEom+wxn53Ide
   Kqss86M/7GMXulBL4cRx5IjRJSLwD3zOmICFvK8xNpZfVZk8CmUBQWy3R
   wu5Vy8vt7XTkyaSCLzaQmACV3FeIl3I3TDHgm3QPEphWDVMXOMAcbmo6w
   0XMcY46c3b+J4hAMMVcoe66/6vN/J9zggItIFIeecAgOYD2vnmEPoQcN0
   hUYONbJHr0Sg0t5M0X5PpTXVQ0pPM2gStEdviqxjYe6R1UCNCJC6rH4kT
   w==;
X-CSE-ConnectionGUID: LgJmvCqESkyvLTn6rfTsDw==
X-CSE-MsgGUID: TVOlahxcT8ymDMGzD/kvhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22892103"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22892103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 02:28:04 -0700
X-CSE-ConnectionGUID: UT1P0CR8QaKnNEUkDDv+4w==
X-CSE-MsgGUID: cZ9XR265RGKO6NCTGgFwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98882337"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 02:28:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh46n-000CdC-28;
	Thu, 22 Aug 2024 09:27:57 +0000
Date: Thu, 22 Aug 2024 17:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>, david@redhat.com,
	hughd@google.com, willy@infradead.org, muchun.song@linux.dev,
	vbabka@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	vishal.moola@gmail.com, peterx@redhat.com, ryan.roberts@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH 08/14] mm: copy_pte_range() use
 pte_offset_map_maywrite_nolock()
Message-ID: <202408221703.ioeASthY-lkp@intel.com>
References: <05c311498fc8e7e9b2143c7b5fef6dc624cfc49f.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05c311498fc8e7e9b2143c7b5fef6dc624cfc49f.1724226076.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on powerpc/next powerpc/fixes linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-pgtable-introduce-pte_offset_map_-readonly-maywrite-_nolock/20240821-162312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/05c311498fc8e7e9b2143c7b5fef6dc624cfc49f.1724226076.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH 08/14] mm: copy_pte_range() use pte_offset_map_maywrite_nolock()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240822/202408221703.ioeASthY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221703.ioeASthY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221703.ioeASthY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'copy_pte_range':
>> mm/memory.c:1086:15: warning: unused variable 'pmdval' [-Wunused-variable]
    1086 |         pmd_t pmdval;
         |               ^~~~~~


vim +/pmdval +1086 mm/memory.c

  1076	
  1077	static int
  1078	copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
  1079		       pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
  1080		       unsigned long end)
  1081	{
  1082		struct mm_struct *dst_mm = dst_vma->vm_mm;
  1083		struct mm_struct *src_mm = src_vma->vm_mm;
  1084		pte_t *orig_src_pte, *orig_dst_pte;
  1085		pte_t *src_pte, *dst_pte;
> 1086		pmd_t pmdval;
  1087		pte_t ptent;
  1088		spinlock_t *src_ptl, *dst_ptl;
  1089		int progress, max_nr, ret = 0;
  1090		int rss[NR_MM_COUNTERS];
  1091		swp_entry_t entry = (swp_entry_t){0};
  1092		struct folio *prealloc = NULL;
  1093		int nr;
  1094	
  1095	again:
  1096		progress = 0;
  1097		init_rss_vec(rss);
  1098	
  1099		/*
  1100		 * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and the
  1101		 * error handling here, assume that exclusive mmap_lock on dst and src
  1102		 * protects anon from unexpected THP transitions; with shmem and file
  1103		 * protected by mmap_lock-less collapse skipping areas with anon_vma
  1104		 * (whereas vma_needs_copy() skips areas without anon_vma).  A rework
  1105		 * can remove such assumptions later, but this is good enough for now.
  1106		 */
  1107		dst_pte = pte_alloc_map_lock(dst_mm, dst_pmd, addr, &dst_ptl);
  1108		if (!dst_pte) {
  1109			ret = -ENOMEM;
  1110			goto out;
  1111		}
  1112		src_pte = pte_offset_map_maywrite_nolock(src_mm, src_pmd, addr, NULL,
  1113							 &src_ptl);
  1114		if (!src_pte) {
  1115			pte_unmap_unlock(dst_pte, dst_ptl);
  1116			/* ret == 0 */
  1117			goto out;
  1118		}
  1119		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
  1120		orig_src_pte = src_pte;
  1121		orig_dst_pte = dst_pte;
  1122		arch_enter_lazy_mmu_mode();
  1123	
  1124		do {
  1125			nr = 1;
  1126	
  1127			/*
  1128			 * We are holding two locks at this point - either of them
  1129			 * could generate latencies in another task on another CPU.
  1130			 */
  1131			if (progress >= 32) {
  1132				progress = 0;
  1133				if (need_resched() ||
  1134				    spin_needbreak(src_ptl) || spin_needbreak(dst_ptl))
  1135					break;
  1136			}
  1137			ptent = ptep_get(src_pte);
  1138			if (pte_none(ptent)) {
  1139				progress++;
  1140				continue;
  1141			}
  1142			if (unlikely(!pte_present(ptent))) {
  1143				ret = copy_nonpresent_pte(dst_mm, src_mm,
  1144							  dst_pte, src_pte,
  1145							  dst_vma, src_vma,
  1146							  addr, rss);
  1147				if (ret == -EIO) {
  1148					entry = pte_to_swp_entry(ptep_get(src_pte));
  1149					break;
  1150				} else if (ret == -EBUSY) {
  1151					break;
  1152				} else if (!ret) {
  1153					progress += 8;
  1154					continue;
  1155				}
  1156				ptent = ptep_get(src_pte);
  1157				VM_WARN_ON_ONCE(!pte_present(ptent));
  1158	
  1159				/*
  1160				 * Device exclusive entry restored, continue by copying
  1161				 * the now present pte.
  1162				 */
  1163				WARN_ON_ONCE(ret != -ENOENT);
  1164			}
  1165			/* copy_present_ptes() will clear `*prealloc' if consumed */
  1166			max_nr = (end - addr) / PAGE_SIZE;
  1167			ret = copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte,
  1168						ptent, addr, max_nr, rss, &prealloc);
  1169			/*
  1170			 * If we need a pre-allocated page for this pte, drop the
  1171			 * locks, allocate, and try again.
  1172			 */
  1173			if (unlikely(ret == -EAGAIN))
  1174				break;
  1175			if (unlikely(prealloc)) {
  1176				/*
  1177				 * pre-alloc page cannot be reused by next time so as
  1178				 * to strictly follow mempolicy (e.g., alloc_page_vma()
  1179				 * will allocate page according to address).  This
  1180				 * could only happen if one pinned pte changed.
  1181				 */
  1182				folio_put(prealloc);
  1183				prealloc = NULL;
  1184			}
  1185			nr = ret;
  1186			progress += 8 * nr;
  1187		} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
  1188			 addr != end);
  1189	
  1190		arch_leave_lazy_mmu_mode();
  1191		pte_unmap_unlock(orig_src_pte, src_ptl);
  1192		add_mm_rss_vec(dst_mm, rss);
  1193		pte_unmap_unlock(orig_dst_pte, dst_ptl);
  1194		cond_resched();
  1195	
  1196		if (ret == -EIO) {
  1197			VM_WARN_ON_ONCE(!entry.val);
  1198			if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
  1199				ret = -ENOMEM;
  1200				goto out;
  1201			}
  1202			entry.val = 0;
  1203		} else if (ret == -EBUSY) {
  1204			goto out;
  1205		} else if (ret ==  -EAGAIN) {
  1206			prealloc = folio_prealloc(src_mm, src_vma, addr, false);
  1207			if (!prealloc)
  1208				return -ENOMEM;
  1209		} else if (ret < 0) {
  1210			VM_WARN_ON_ONCE(1);
  1211		}
  1212	
  1213		/* We've captured and resolved the error. Reset, try again. */
  1214		ret = 0;
  1215	
  1216		if (addr != end)
  1217			goto again;
  1218	out:
  1219		if (unlikely(prealloc))
  1220			folio_put(prealloc);
  1221		return ret;
  1222	}
  1223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

