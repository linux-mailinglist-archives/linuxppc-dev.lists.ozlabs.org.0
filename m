Return-Path: <linuxppc-dev+bounces-9545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9BAE0215
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 11:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNGCH31ZJz30WX;
	Thu, 19 Jun 2025 19:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750326827;
	cv=none; b=ZKGTAdiNNdaXf6eKreFmdDDdjP+FPbhBOpqlxIU4Q1yC2MKRdDq0rXNaZdqw4DiLfLEbJSKof7xW61KLYerL4+SVZPFwXtBgun27XpPjeCpWuz6AfG7VMST2+jpFxJQYvMRtG9+cwtA37hQZUYtjLFbZsIbB9PeozMVS3fWFAn6LCXRdbicIUw8nLWelOeP43ho18varbPVXxwjq2QvNUWl4t5k14VcSwMxdcKiLaRhG98D7/ufaV87cjdF3SNSgpgz1Ko/hBbOk0+0zDgTU6JfdHVRi9+G9Q4Hv8ccv2o+2cjvqnuG4tBxaOvheGyte/4o77NeVZPMILqYhuXnjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750326827; c=relaxed/relaxed;
	bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGl/WL2YcdfUlBzi/EvfQsHXxXvLClyo8lHLjHNsZqY79IqjMVYwq6t75z3/qhlF9x3Dcg3KuAMjjdvyeDqlsW/HRO5qzJoPfRH7vDCOjQKIcZ8ajAhP8ZEofsC6X+9qz3d/kdZasD4FpZ99SEqS22MvUGLdQd8DpixlAOFqMg0Zl9RD6dspZwVASvC30x/sOLgkYEuy6V7BLs3y+37+0fCuf65lIwwzCw1Sl4/KSGoyjq+F6977JHCCPqypcea3WxLVgCpa0/Qa0YV8zpS8lToPE+qNkSgYawFy4slQUdJqCBLCnVOXVWE8zkWQglezv7C5g4XHUBqMfcG2qRCYLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AH6hUm3Q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AH6hUm3Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNGCF5pzWz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 19:53:45 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54b10594812so588654e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750326822; x=1750931622; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=AH6hUm3QWW8cpo1Q33oidup99UHkVO7jQD62LA5suugyVCC3NvNRMgP9EsbPVY9gXQ
         rxbw60PhfHzePCmIcpvPOMX6WX87hbBFY867OaKGFDqCU8lOti46PwLmHAxnxn2NTg2k
         ndkzQtILBDOFy7YOgSGtM76bo+E8EyJ+CA5wxWFxtR7TQdggynubIf0Djr+WcvnBYZmT
         SGfYxo6feTCDHOxJT8iNyKmV+dWT63kvlCECtH55crCr63xFJipTKD+IwvBz+kX+dfs2
         eV82JY4gWUzjUYhWDdhqi65y/zeelelsD6kKqnOzquYfhwwoYEChGiKTTfnv58RPjrJK
         nBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326822; x=1750931622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=WwVQLeX2PUbOJ9jUUACv363nw0vSir7a9r/7kgCAD6EH8ERpp3RPYL658wnvvUEei2
         qvxdc4SII6e2ZT0AmVFhPxR6AIjgcweu0+FMy2AYwUhe/5XG83QckJb5ULjSHMnQoxP9
         3vRsEBp/Bs5SLyUrxMnZn920nIN8vaZ/K3h0VXp/+kvP+40PKPcCq2oQ1c842TXNK7us
         fZXkKy/rtX6XzB4ALPVwinS6vtvIVuRCMLDFVEjWD9xEsGW/WuOxf1/ODwHPb2LnIptO
         FyVQLhi9/nhLjSDliQBl2ozmzZg5ymVU+IuaKP3XcKffGvZkfoNVdLqeWf/Y7+enocs0
         Ve5A==
X-Forwarded-Encrypted: i=1; AJvYcCXBZqeLRHGNhwKoSQO/lJuthTizvPq/SyEzs63Wdzr5pAi0J7KVxBoGPGtfkRQhax686kTuoQZr/oQBl5k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZ7pQKaI7+SYSsSaVWYPHIpFdos+/LFhGCHWU2zRkgE8hT27W8
	N9MVRYHeoMYH1CBWzR1h2qZIYFxvozE5tejQEgTAa6eoZd03o6v607ZI
X-Gm-Gg: ASbGncuxTGbVl/e4eOoaor7GWckPoLdoUd4kIPy98M5EMkMN7EKbcVcN0AucSamLeKR
	MSQN/JEAntEPkyZyBL6laYsRWLIgYkAjBDVZAivEcY1sluSMDjcWsQjbTNDU1hszSwF7P1DINGy
	fN9Yx8EeQw+znf0/BAuVuVXl2sbN1Ejpn8NsHxDv5ZLvJ4p0XA8keuk8LXl7iVy5rQ4A9XHscma
	OkURGUNgFRvAYpIJYoos1cJbHMjCqGAiItXaopdxO7OajYjYrychAEQdQQ6tfRCCRpYV5CsfuWE
	kSxwxG3ih48W4srWmFb0mWLSE9cj+bfdoPFiI45y949+BIgFPosYA8vR0LGETKEQk+kdjMX/6lN
	si4/CrmVVNT8=
X-Google-Smtp-Source: AGHT+IEJV7RqZa9E1nD948cD6oSgemriE8btKJowGkw8tp48NbrB1jrcDoGclBvee7YrwcLZgS368g==
X-Received: by 2002:a05:6512:1049:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-553b6e74ae6mr5656846e87.13.1750326821436;
        Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1367e9sm2541889e87.79.2025.06.19.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 19 Jun 2025 11:53:38 +0200
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <aFPeIisE3ufUGEUq@pc636>
References: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
 <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:32:28PM +0300, Dan Carpenter wrote:
> Hi Alexander,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
> patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
> config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> 
> smatch warnings:
> mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.
> 
> vim +552 mm/vmalloc.c
> 
> 0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
> db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
> db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
> db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
> db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
> db64fe02258f150 Nicholas Piggin   2008-10-18  527  
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
> dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
> db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
> db64fe02258f150 Nicholas Piggin   2008-10-18  537  
> c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
> db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
> db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
> 4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> 4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;
> 
> These error paths don't unlock &init_mm.page_table_lock?
> 
> 4fcdcc12915c707 Yury Norov        2022-04-28  544  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
> dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 
This patch introduce a huge performance degrade when testing this by
the test_vmalloc.sh performance tool. We return back to a single, not
serialized global spilock where we spend 90% of cycles:

<snip>
+   91.01%     1.67%  [kernel]          [k] _raw_spin_lock
-   89.29%    89.25%  [kernel]          [k] native_queued_spin_lock_slowpath
     69.82% ret_from_fork_asm
      - ret_from_fork
         - 69.81% kthread
            - 69.66% test_func
               - 26.31% full_fit_alloc_test
                  - 19.11% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 13.73% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.38% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 13.32% vfree.part.0
                     - 13.31% remove_vm_area
                        - 13.27% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 25.57% fix_size_alloc_test
                  - 22.59% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 17.34% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.25% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 11.59% vfree.part.0
                     - remove_vm_area
                        - 11.55% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 17.78% long_busy_list_alloc_test
                  - 13.90% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 9.95% vmap_small_pages_range_noflush
                             _raw_spin_lock
<snip>

No, we can not take this patch.

--
Uladzislau Rezki

