Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AEFE2F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 17:38:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F3tr11XnzF5w5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 03:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="dEfG+Ykp"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F3rY4Rn8zDr0B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 03:36:11 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 205so8597160qkk.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 08:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtSwqjb/O+JShEO7psi0XI9QMQbkChHHPCsWNqeh08o=;
 b=dEfG+Ykp868S2vDhK4tAOHeNCmNiIbhZHpPvNyJtToKINWX8/n1ew0259PTvr1AMpO
 6h9gKFapJ4QJCdDnB1Q4nK8YmrJpowLWQN0sUiKq5rpixLaUmRqcD3EJB7Md3QQMWXf9
 O7RoZHRjiMTsEMlHzkZuppI8HQZUtlmS5cTezQkAdKEPTWz789EInrOBU/Wzw1TXwaOA
 7hEQozfullraW290QacOXh+qmP9nSs2MvMbPP9Q0MX3Hu9hfqClRuxLEMc3l6E/mDEJZ
 LnuIfOrKCT9oRNRkMy/ka7DTAlewcd3BHYkwbqGk/gqT77tGp35O9S6s4cbt8G165IYx
 seLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtSwqjb/O+JShEO7psi0XI9QMQbkChHHPCsWNqeh08o=;
 b=gJ/z6jdwVqhdNl3+xN6cB7iVbj51iENr/kaGZRu25kQXWHgjz6g7h8NFNg4f9E9Npa
 EqiQTL4WEufH6mQJbnzhqSAX/x2SvBnyB4+TLbly1+GIUCcabqZTd7C5A9+fVSOUjI+d
 m5t6/tjtt+avIodf8jhj8kyFX31W/unVkh/aA0TkEXFtN/MdQNLGoHEmuXrKhGqcj/Fu
 OxaMZiDIv9RKo58sdAWnYs0EuDJRRXj3oElnIc1T9MSfWnH08Uo+CFauJdhtB/wFVrf2
 gYo6Bul9A5EirFHUAPL31RwOyBuDXILV5BtGXMzjVEYuXTezvAGWaD/1QJxZx6U070ML
 TVkQ==
X-Gm-Message-State: APjAAAVVsjdMzdDYarwVImc0/ufMQ875lfJGFp5sRubp3ycCNIX3H6Hl
 finYHkL3ZHWYL5Ogl6fjTKTG4w==
X-Google-Smtp-Source: APXvYqx55v4uJX3he6kQDj/K8/PTkWtatwrPIAL7hFpJmfW4erAdqEtwHZuW1cUpx4XcOnPXhqgEsA==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr13613338qkn.249.1573835767628; 
 Fri, 15 Nov 2019 08:36:07 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id f39sm5214223qtb.26.2019.11.15.08.36.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 08:36:06 -0800 (PST)
Message-ID: <1573835765.5937.130.camel@lca.pw>
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
From: Qian Cai <cai@lca.pw>
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, x86@kernel.org, aryabinin@virtuozzo.com,
 glider@google.com,  luto@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com,  dvyukov@google.com, christophe.leroy@c-s.fr
Date: Fri, 15 Nov 2019 11:36:05 -0500
In-Reply-To: <20191031093909.9228-2-dja@axtens.net>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 20:39 +1100, Daniel Axtens wrote:
>  	/*
>  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
>  	 * flag. It means that vm_struct is not fully initialized.
> @@ -3377,6 +3411,9 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>  		setup_vmalloc_vm_locked(vms[area], vas[area], VM_ALLOC,
>  				 pcpu_get_vm_areas);
> +
> +		/* assume success here */
> +		kasan_populate_vmalloc(sizes[area], vms[area]);
>  	}
>  	spin_unlock(&vmap_area_lock);

Here it is all wrong. GFP_KERNEL with in_atomic().

[   32.231000][    T1] BUG: sleeping function called from invalid context at
mm/page_alloc.c:4681
[   32.239934][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1,
name: swapper/0
[   32.248896][    T1] 2 locks held by swapper/0/1:
[   32.253580][    T1]  #0: ffffffff880d6160 (pcpu_alloc_mutex){+.+.}, at:
pcpu_alloc+0x707/0xbe0
[   32.262305][    T1]  #1: ffffffff88105558 (vmap_area_lock){+.+.}, at:
pcpu_get_vm_areas+0xc4f/0x1e60
[   32.271919][    T1] CPU: 4 PID: 1 Comm: swapper/0 Tainted:
G        W         5.4.0-rc7-next-20191115+ #6
[   32.281555][    T1] Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385
Gen10, BIOS A40 03/09/2018
[   32.281896][    T1] Call Trace:
[   32.281896][    T1]  dump_stack+0xa0/0xea
[   32.281896][    T1]  ___might_sleep.cold.89+0xd2/0x122
[   32.301996][    T1]  __might_sleep+0x73/0xe0
[   32.301996][    T1]  __alloc_pages_nodemask+0x442/0x720
[   32.311564][    T1]  ? __kasan_check_read+0x11/0x20
[   32.311564][    T1]  ? __alloc_pages_slowpath+0x1870/0x1870
[   32.321705][    T1]  ? mark_held_locks+0x86/0xb0
[   32.321705][    T1]  ? _raw_spin_unlock_irqrestore+0x44/0x50
[   32.331563][    T1]  alloc_page_interleave+0x18/0x130
[   32.331563][    T1]  alloc_pages_current+0xf6/0x110
[   32.341979][    T1]  __get_free_pages+0x12/0x60
[   32.341979][    T1]  __pte_alloc_kernel+0x1b/0xc0
[   32.351563][    T1]  apply_to_page_range+0x5b5/0x690
[   32.351563][    T1]  ? memset+0x40/0x40
[   32.361693][    T1]  kasan_populate_vmalloc+0x6d/0xa0
[   32.361693][    T1]  pcpu_get_vm_areas+0xd49/0x1e60
[   32.371425][    T1]  ? vm_map_ram+0x10d0/0x10d0
[   32.371425][    T1]  ? pcpu_mem_zalloc+0x65/0x90
[   32.371425][    T1]  pcpu_create_chunk+0x152/0x3f0
[   32.371425][    T1]  pcpu_alloc+0xa2f/0xbe0
[   32.391423][    T1]  ? pcpu_balance_workfn+0xb00/0xb00
[   32.391423][    T1]  ? __kasan_kmalloc.constprop.11+0xc1/0xd0
[   32.391423][    T1]  ? kasan_kmalloc+0x9/0x10
[   32.391423][    T1]  ? kmem_cache_alloc_trace+0x1f8/0x470
[   32.411421][    T1]  ? iommu_dma_get_resv_regions+0x10/0x10
[   32.411421][    T1]  __alloc_percpu+0x15/0x20
[   32.411421][    T1]  init_iova_flush_queue+0x79/0x230
[   32.411421][    T1]  iommu_setup_dma_ops+0x87d/0x890
[   32.431420][    T1]  ? __kasan_check_write+0x14/0x20
[   32.431420][    T1]  ? refcount_sub_and_test_checked+0xba/0x170
[   32.431420][    T1]  ? __kasan_check_write+0x14/0x20
[   32.431420][    T1]  ? iommu_dma_alloc+0x1e0/0x1e0
[   32.451420][    T1]  ? iommu_group_get_for_dev+0x153/0x450
[   32.451420][    T1]  ? refcount_dec_and_test_checked+0x11/0x20
[   32.451420][    T1]  ? kobject_put+0x36/0x270
[   32.451420][    T1]  amd_iommu_add_device+0x560/0x710
[   32.471423][    T1]  ? iommu_probe_device+0x150/0x150
[   32.471423][    T1]  iommu_probe_device+0x8c/0x150
[   32.471423][    T1]  add_iommu_group+0xe/0x20
[   32.471423][    T1]  bus_for_each_dev+0xfe/0x160
[   32.491421][    T1]  ? subsys_dev_iter_init+0x80/0x80
[   32.491421][    T1]  ? blocking_notifier_chain_register+0x4f/0x70
[   32.491421][    T1]  bus_set_iommu+0xc6/0x100
[   32.491421][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.511571][    T1]  amd_iommu_init_api+0x25/0x3e
[   32.511571][    T1]  state_next+0x214/0x7ea
[   32.511571][    T1]  ? check_flags.part.25+0x86/0x220
[   32.511571][    T1]  ? early_amd_iommu_init+0x10c0/0x10c0
[   32.531421][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.531421][    T1]  ? rcu_read_lock_sched_held+0xac/0xe0
[   32.531421][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.551423][    T1]  amd_iommu_init+0x25/0x57
[   32.551423][    T1]  pci_iommu_init+0x26/0x62
[   32.551423][    T1]  do_one_initcall+0xfe/0x4fa
[   32.551423][    T1]  ? perf_trace_initcall_level+0x240/0x240
[   32.571420][    T1]  ? rcu_read_lock_sched_held+0xac/0xe0
[   32.571420][    T1]  ? rcu_read_lock_bh_held+0xc0/0xc0
[   32.571420][    T1]  ? __kasan_check_read+0x11/0x20
[   32.571420][    T1]  kernel_init_freeable+0x420/0x4e4
[   32.591420][    T1]  ? start_kernel+0x6a9/0x6a9
[   32.591420][    T1]  ? lockdep_hardirqs_on+0x1b0/0x2a0
[   32.591420][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
[   32.591420][    T1]  ? rest_init+0x307/0x307
[   32.611557][    T1]  kernel_init+0x11/0x139
[   32.611557][    T1]  ? rest_init+0x307/0x307
[   32.611557][    T1]  ret_from_fork+0x27/0x50


[   32.054647][    T1] BUG: sleeping function called from invalid context at
mm/page_alloc.c:4681
[   32.063814][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1,
name: swapper/0
[   32.072444][    T1] 2 locks held by swapper/0/1:
[   32.077104][    T1]  #0: ffffffffac0d6160 (pcpu_alloc_mutex){+.+.}, at:
pcpu_alloc+0x707/0xbe0
[   32.086227][    T1]  #1: ffffffffac105558 (vmap_area_lock){+.+.}, at:
pcpu_get_vm_areas+0xc4f/0x1e50
[   32.095478][    T1] CPU: 53 PID: 1 Comm: swapper/0 Tainted:
G        W         5.4.0-rc7-next-20191115 #5
[   32.105115][    T1] Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385
Gen10, BIOS A40 03/09/2018
[   32.105450][    T1] Call Trace:
[   32.105450][    T1]  dump_stack+0xa0/0xea
[   32.105450][    T1]  ___might_sleep.cold.89+0xd2/0x122
[   32.105450][    T1]  __might_sleep+0x73/0xe0
[   32.105450][    T1]  __alloc_pages_nodemask+0x442/0x720
[   32.105450][    T1]  ? add_iommu_group+0xe/0x20
[   32.105450][    T1]  ? bus_for_each_dev+0xfe/0x160
[   32.105450][    T1]  ? __alloc_pages_slowpath+0x1870/0x1870
[   32.105450][    T1]  ? check_chain_key+0x1df/0x2e0
[   32.105450][    T1]  alloc_page_interleave+0x18/0x130
[   32.105450][    T1]  alloc_pages_current+0xf6/0x110
[   32.105450][    T1]  __get_free_pages+0x12/0x60
[   32.105450][    T1]  kasan_populate_vmalloc_pte+0x2a/0x150
[   32.105450][    T1]  ? register_lock_class+0x940/0x940
[   32.105450][    T1]  apply_to_page_range+0x42d/0x690
[   32.105450][    T1]  ? memset+0x40/0x40
[   32.105450][    T1]  kasan_populate_vmalloc+0x69/0xa0
[   32.105450][    T1]  pcpu_get_vm_areas+0xd44/0x1e50
[   32.105450][    T1]  ? vm_map_ram+0x10d0/0x10d0
[   32.105450][    T1]  ? pcpu_mem_zalloc+0x65/0x90
[   32.105450][    T1]  pcpu_create_chunk+0x152/0x3f0
[   32.105450][    T1]  pcpu_alloc+0xa2f/0xbe0
[   32.105450][    T1]  ? pcpu_balance_workfn+0xb00/0xb00
[   32.105450][    T1]  ? __kasan_kmalloc.constprop.11+0xc1/0xd0
[   32.105450][    T1]  ? kasan_kmalloc+0x9/0x10
[   32.105450][    T1]  ? kmem_cache_alloc_trace+0x1f8/0x470
[   32.105450][    T1]  ? iommu_dma_get_resv_regions+0x10/0x10
[   32.105450][    T1]  __alloc_percpu+0x15/0x20
[   32.105450][    T1]  init_iova_flush_queue+0x79/0x230
[   32.105450][    T1]  iommu_setup_dma_ops+0x87d/0x890
[   32.105450][    T1]  ? __kasan_check_write+0x14/0x20
[   32.105450][    T1]  ? refcount_sub_and_test_checked+0xba/0x170
[   32.105450][    T1]  ? __kasan_check_write+0x14/0x20
[   32.105450][    T1]  ? iommu_dma_alloc+0x1e0/0x1e0
[   32.105450][    T1]  ? iommu_group_get_for_dev+0x153/0x450
[   32.105450][    T1]  ? refcount_dec_and_test_checked+0x11/0x20
[   32.105450][    T1]  ? kobject_put+0x36/0x270
[   32.105450][    T1]  amd_iommu_add_device+0x560/0x710
[   32.105450][    T1]  ? iommu_probe_device+0x150/0x150
[   32.105450][    T1]  iommu_probe_device+0x8c/0x150
[   32.105450][    T1]  add_iommu_group+0xe/0x20
[   32.105450][    T1]  bus_for_each_dev+0xfe/0x160
[   32.105450][    T1]  ? subsys_dev_iter_init+0x80/0x80
[   32.105450][    T1]  ? blocking_notifier_chain_register+0x4f/0x70
[   32.105450][    T1]  bus_set_iommu+0xc6/0x100
[   32.105450][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.105450][    T1]  amd_iommu_init_api+0x25/0x3e
[   32.105450][    T1]  state_next+0x214/0x7ea
[   32.105450][    T1]  ? check_flags.part.25+0x86/0x220
[   32.105450][    T1]  ? early_amd_iommu_init+0x10c0/0x10c0
[   32.105450][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.105450][    T1]  ? rcu_read_lock_sched_held+0xac/0xe0
[   32.105450][    T1]  ? e820__memblock_setup+0x10e/0x10e
[   32.105450][    T1]  amd_iommu_init+0x25/0x57
[   32.105450][    T1]  pci_iommu_init+0x26/0x62
[   32.105450][    T1]  do_one_initcall+0xfe/0x4fa
[   32.105450][    T1].781281][    T1] pci 0000:60:08.0: Adding to iommu group
63
[   32.831700][    T1] pci 0000:60:08.1: Adding to iommu group 64
[   32.883138][    T1] pci 0000:63:00.0: Adding to iommu group 65
[   32.933084][    T1] pci 0000:63:00.1: Adding to iommu group 65
[   32.940474][    T1] pci 0000:62:00.0: Adding to iommu group 66
[   32.991631][    T1] pci 0000:62:00.2: Adding to iommu group 67
[   33.042553][    T1] pci 0000:61:00.0: Adding to iommu group 68
