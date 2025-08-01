Return-Path: <linuxppc-dev+bounces-10507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94903B18244
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 15:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btmgT3M88z2ymc;
	Fri,  1 Aug 2025 23:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754054197;
	cv=none; b=ZmgWfxjqNLIhSlVNGI0jAMojQwzMlhC0G3nST5jf40yl0LpXTWwSe/zRf/rkpV6/EE6iW/s8uavJyzt/Sha+xcChDhvK6BlvfuVAeWKCNjdKNv7kNChIGt+cNLYbFe+dz3oYY1HzFS8gPvcyyJad1rB3za6i+gxpfC3OuuIkuXHpenp9B0ePHJlyVbCv+1KebOdspGCjB6U01nVHF/dFkTGKQ/IuJEsGtbAO/TPatMaVO9qfyKzjlIx6cx82KNcn97nbgRSkC0nhKxQQ38IgrKP9YzuEVf/yDq9Z6fTyL/32NciF1dI+z83xkZWs1L+pgq+/ndA4IC6x9p8IpzBdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754054197; c=relaxed/relaxed;
	bh=RMrH+ccIggL/45LTvgz8T+IwuqRVbSrcaHTSZDqE92c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVx5iTKtzy4xPzGKtRf90PknWTeKNVysnLbP3FO/AgDrrlZQb3wGnpvdnuFnKKuud35mI1NydmT5OTdLTH521QnYwzPjQnpWRK2jO/7UdeIgAaOt6b+6NxbY30bKvYErVSZk4CoeLL+RjZyIN7pI45Ib9bg1jTPUJNPG+R8kqzNPcYb67R4zMXi959eVH5AR7CUI13ZU/7X8akeldNVnMA2BRPWDGFPaMaU7tHyVITw4DAmX4/onVaA+k6HqNJjHWnferQS0oZutLxRXd0oPvRghaLIqZ/u+6uKyjXDmFFPsMKFIes+UySjFs+zFUP5ZLyuBtz7U3FYlJUpuIl0aHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btmgS30V3z2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 23:16:36 +1000 (AEST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af910372ab3so431812266b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 06:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754054193; x=1754658993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMrH+ccIggL/45LTvgz8T+IwuqRVbSrcaHTSZDqE92c=;
        b=mWvqQzd9il0Oe5cmmaFUbjI3/7Kzq9ofyDZVbuRschUX9vTjVNw2XTuXltc9dAunJ6
         sjwExwN8TwfjyrKLTWDDsx2Coc9eH0hXMocKxyrTZaecNV6oQaPwAyoIYmbn6t9xxX5h
         m8kZClQ+/tZ28cGhoTZzkWbVWLrkTxLdK/CnUImWlpba+qjx0K6Ep50ouBzh4glZsE/i
         52LEWATMD0k5ZGKnwTiig+DrcDQ5xXm0Y+NbQid5aqzFCWz+aFFa10MZIJZboC4tlGJ6
         TJ+ESNr/ZCaOwdiaMAIz97l4wd527BP5zNcr9d1XvgcpmIuBQdCkg8WkI9s/xM5eyl5a
         uUbg==
X-Forwarded-Encrypted: i=1; AJvYcCVMVeZI9j1epWcZnLGo5jwYgwOBy4Bc11bFmQqesRWoJtuujqCskVV+ODAG4SbdzQQQ+7L10zPimXVbYFQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMYF3ecbtPC16Mt57DxT42un60cRlzjWqr7/+XKV3YLfUdWNbE
	NnHAZuBYZMuHVf/Ii+5QKEWcM6IfL3kUYqfN0df0F3NqhzqzISz0nrvX
X-Gm-Gg: ASbGncsBCgPVGLRsz33bYDBUyXX0XopMSfd8kyPqcpk//6d6V5qrh1aw5v6MowrtYfo
	+ilNQNq6waSSUnNKlKpqEjaCe+VKA8NXCfuxEdPm6XWO+S+V2djfF69vWRJrLtTvsF8GAPuKWLW
	zf7/LlWHPimjQ56D3TRQkxfIs3sdw9uQJzt5eqsLlEvn9YH3UEheaYczn8mJoYgHKI/Gt9eXG+m
	ETGxSBTuIrDq6jBTEoL0/Df6lulVyNw226iWgL0rXnM7AJbz8Tt2vn3YRLutE9fNHQVCLKo5Rq6
	c0UkS9fqYIFWFfJrI5KUBEK9rvaD0I284zoRA+Gn5Sgfw/YTturlUf2tUPrC288LjDGrmXKWBzm
	ezLFbQZXbJjoy
X-Google-Smtp-Source: AGHT+IEVOh0CHDtD/I/qk/2ZYJN6LV+LNWejGdhXTL9zufeK0Y9Nx64OPz6Q0K6PBGG7aamBSiOtqQ==
X-Received: by 2002:a17:907:fd01:b0:af8:f896:fe63 with SMTP id a640c23a62f3a-af91b97fc72mr723775666b.0.1754054192786;
        Fri, 01 Aug 2025 06:16:32 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c14csm293197866b.112.2025.08.01.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:16:32 -0700 (PDT)
Date: Fri, 1 Aug 2025 06:16:29 -0700
From: Breno Leitao <leitao@debian.org>
To: Bjorn Helgaas <helgaas@kernel.org>, pandoh@google.com
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
	Karolina Stolarek <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller <ben.fuller@oracle.com>, 
	Drew Walton <drewwalton@microsoft.com>, Anil Agrawal <anilagrawal@meta.com>, 
	Tony Luck <tony.luck@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Sargun Dhillon <sargun@meta.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
	Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kernel-team@meta.com, gustavold@gmail.com
Subject: Re: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457>
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-19-helgaas@kernel.org>
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
In-Reply-To: <20250522232339.1525671-19-helgaas@kernel.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Jon, Bjorn,

On Thu, May 22, 2025 at 06:21:24PM -0500, Bjorn Helgaas wrote:
> @@ -790,6 +818,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>  	trace_aer_event(pci_name(dev), (status & ~mask),
>  			aer_severity, tlp_header_valid, &aer->header_log);
>  
> +	if (!aer_ratelimit(dev, info.severity))
> +		return;

I am seeing a kernel NULL pointer in the aer_ratelimit(), where
dev->aer_info is NULL. This is happening on linus final 6.16 commit id.

Here is dmesg:

	{1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 0
	{1}[Hardware Error]: It has been corrected by h/w and requires no further action
	{1}[Hardware Error]: event severity: corrected
	{1}[Hardware Error]:  Error 0, type: corrected
	{1}[Hardware Error]:   section_type: PCIe error
	{1}[Hardware Error]:   port_type: 4, root port
	{1}[Hardware Error]:   version: 3.0
	{1}[Hardware Error]:   command: 0x0540, status: 0x0010
	{1}[Hardware Error]:   device_id: 0000:00:00.0
	{1}[Hardware Error]:   slot: 0
	{1}[Hardware Error]:   secondary_bus: 0x00
	{1}[Hardware Error]:   vendor_id: 0x8086, device_id: 0x2020
	{1}[Hardware Error]:   class_code: 060000
	{1}[Hardware Error]:   aer_cor_status: 0x00001000, aer_cor_mask: 0x00002000
	{1}[Hardware Error]:   aer_uncor_status: 0x00000000, aer_uncor_mask: 0x00100000
	{1}[Hardware Error]:   aer_uncor_severity: 0x000e3030
	{1}[Hardware Error]:   TLP Header: 00000000 00000000 00000000 00000000
	BUG: kernel NULL pointer dereference, address: 0000000000000264
	#PF: supervisor read access in kernel mode
	#PF: error_code(0x0000) - not-present page
	PGD d4c32b067 P4D d4c32b067 PUD 4e4b84067 PMD 0 
	Oops: Oops: 0000 [#1] SMP
	CPU: 0 UID: 0 PID: 1553927 Comm: kworker/0:0 Kdump: loaded Tainted: G S          E       6.16.0-0_fbk0_rc1_0_geb76fb6facf5 #1 NONE 
	Tainted: [S]=CPU_OUT_OF_SPEC, [E]=UNSIGNED_MODULE
	Hardware name: Quanta Delta Lake MP 29F0EMA01C0/Delta Lake-Class1, BIOS F0E_3A21 06/27/2024
	Workqueue: events aer_recover_work_func
	RIP: 0010:___ratelimit+0xc/0x1b0
	Code: 48 8b 3d ef aa 59 02 e8 72 75 31 ff ff 8b 10 78 54 84 75 da 31 c0 5b c3 cc cc cc cc cc cc 55 41 57 41 56 41 54 53 50 48 89 fb <4c> 63 7f 04 4d 85 ff 0f 9e c0 8b 6f 08 85 ed 0f 9e c1 08 c1 80 f9
	RSP: 0018:ffffc90028337d10 EFLAGS: 00010206
	RAX: ffffc900011f9174 RBX: 0000000000000260 RCX: 0000000000000000
	RDX: 0000000000001000 RSI: ffffffff827ea3c0 RDI: 0000000000000260
	RBP: 0000000000000002 R08: 8080808080808080 R09: fefefefefefefeff
	R10: 000073746e657665 R11: 8080000000000000 R12: 0000000000001000
	R13: 0000000000000002 R14: ffff8882877da000 R15: ffffc900011f9158
	FS:  0000000000000000(0000) GS:ffff8890b1cf9000(0000) knlGS:0000000000000000
	CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	CR2: 0000000000000264 CR3: 00000003cee6a004 CR4: 00000000007726f0
	PKRU: 55555554
	Call Trace:
	<TASK>
	pci_print_aer+0x141/0x360
	aer_recover_work_func+0xb5/0x130
	process_scheduled_works+0x1a4/0x360
	worker_thread+0x2df/0x3b0
	kthread+0x1d2/0x1f0
	? pr_cont_work+0x1c0/0x1c0
	? finish_task_switch+0x213/0x2e0
	? kthread_blkcg+0x30/0x30
	ret_from_fork+0x69/0xe0
	? kthread_blkcg+0x30/0x30
	ret_from_fork_asm+0x11/0x20
	</TASK>

Here is the decoded stack from the crash dump:

	>>> trace
	#0  ___ratelimit (lib/ratelimit.c:33:17)
	#1  aer_ratelimit (drivers/pci/pcie/aer.c:0:2)
	#2  pci_print_aer (drivers/pci/pcie/aer.c:923:7)
	#3  aer_recover_work_func (drivers/pci/pcie/aer.c:1298:3)
	#4  process_one_work (kernel/workqueue.c:3238:2)
	#5  process_scheduled_works (kernel/workqueue.c:3321:3)
	#6  worker_thread (kernel/workqueue.c:3402:4)
	#7  kthread (kernel/kthread.c:464:9)
	#8  ret_from_fork (arch/x86/kernel/process.c:148:3)
	#9  ret_from_fork_asm+0x11/0x16 (arch/x86/entry/entry_64.S:245)

And aer_info is NULL

	>>> trace[2]['dev'].aer_info
	(struct aer_info *)0x0

So, somehow the PCI was released at this point?

Here is the state of the device at the crash time:

	>>> trace[2]['dev']
	*(struct pci_dev *)0xffff8882877da000 = {
		.bus_list = (struct list_head){
			.next = (struct list_head *)0xffff8882877db000,
			.prev = (struct list_head *)0xffff888287674428,
		},
		.bus = (struct pci_bus *)0xffff888287674400,
		.subordinate = (struct pci_bus *)0x0,
		.sysdata = (void *)0xffff888284c94b38,
		.procent = (struct proc_dir_entry *)0xffff88828a515980,
		.slot = (struct pci_slot *)0x0,
		.devfn = (unsigned int)0,
		.vendor = (unsigned short)32902,
		.device = (unsigned short)8224,
		.subsystem_vendor = (unsigned short)32902,
		.subsystem_device = (unsigned short)0,
		.class = (unsigned int)393216,
		.revision = (u8)11,
		.hdr_type = (u8)0,
		.aer_cap = (u16)0,
		.aer_info = (struct aer_info *)0x0,
		.rcec_ea = (struct rcec_ea *)0x0,
		.rcec = (struct pci_dev *)0x0,
		.devcap = (u32)32768,
		.rebar_cap = (u16)0,
		.pcie_cap = (u8)144,
		.msi_cap = (u8)0,
		.msix_cap = (u8)0,
		.pcie_mpss = (u8)0,
		.rom_base_reg = (u8)48,
		.pin = (u8)1,
		.pcie_flags_reg = (u16)66,
		.dma_alias_mask = (unsigned long *)0x0,
		.driver = (struct pci_driver *)0x0,
		.dma_mask = (u64)4294967295,
		.dma_parms = (struct device_dma_parameters){
			.max_segment_size = (unsigned int)65536,
			.min_align_mask = (unsigned int)0,
			.segment_boundary_mask = (unsigned long)4294967295,
		},
		.current_state = (pci_power_t)0,
		.pm_cap = (u8)224,
		.pme_support = (unsigned int)0,
		.pme_poll = (unsigned int)0,
		.pinned = (unsigned int)0,
		.config_rrs_sv = (unsigned int)0,
		.imm_ready = (unsigned int)0,
		.d1_support = (unsigned int)0,
		.d2_support = (unsigned int)0,
		.no_d1d2 = (unsigned int)0,
		.no_d3cold = (unsigned int)0,
		.bridge_d3 = (unsigned int)1,
		.d3cold_allowed = (unsigned int)1,
		.mmio_always_on = (unsigned int)1,
		.wakeup_prepared = (unsigned int)0,
		.skip_bus_pm = (unsigned int)0,
		.ignore_hotplug = (unsigned int)0,
		.hotplug_user_indicators = (unsigned int)0,
		.clear_retrain_link = (unsigned int)0,
		.d3hot_delay = (unsigned int)10,
		.d3cold_delay = (unsigned int)100,
		.l1ss = (u16)0,
		.link_state = (struct pcie_link_state *)0x0,
		.ltr_path = (unsigned int)0,
		.pasid_no_tlp = (unsigned int)0,
		.eetlp_prefix_max = (unsigned int)0,
		.error_state = (pci_channel_state_t)1,
		.dev = (struct device){
			.kobj = (struct kobject){
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.entry = (struct list_head){
					.next = (struct list_head *)0xffff8882877db0d0,
					.prev = (struct list_head *)0xffff888287674520,
				},
				.parent = (struct kobject *)0xffff888287674000,
				.kset = (struct kset *)0xffff888281f19240,
				.ktype = (const struct kobj_type *)device_ktype+0x0 = 0xffffffff82a41fd0,
				.sd = (struct kernfs_node *)0xffff888287859220,
				.kref = (struct kref){
					.refcount = (refcount_t){
						.refs = (atomic_t){
							.counter = (int)5,
						},
					},
				},
				.state_initialized = (unsigned int)1,
				.state_in_sysfs = (unsigned int)1,
				.state_add_uevent_sent = (unsigned int)1,
				.state_remove_uevent_sent = (unsigned int)0,
				.uevent_suppress = (unsigned int)0,
			},
			.parent = (struct device *)0xffff888287674000,
			.p = (struct device_private *)0xffff88828771e000,
			.init_name = (const char *)0x0,
			.type = (const struct device_type *)pci_dev_type+0x0 = 0xffffffff82a03fe0,
			.bus = (const struct bus_type *)pci_bus_type+0x0 = 0xffffffff82a057f8,
			.driver = (struct device_driver *)0x0,
			.platform_data = (void *)0x0,
			.driver_data = (void *)0x0,
			.mutex = (struct mutex){
				.owner = (atomic_long_t){
					.counter = (s64)0,
				},
				.wait_lock = (raw_spinlock_t){
					.raw_lock = (arch_spinlock_t){
						.val = (atomic_t){
							.counter = (int)0,
						},
						.locked = (u8)0,
						.pending = (u8)0,
						.locked_pending = (u16)0,
						.tail = (u16)0,
					},
				},
				.osq = (struct optimistic_spin_queue){
					.tail = (atomic_t){
						.counter = (int)0,
					},
				},
				.wait_list = (struct list_head){
					.next = (struct list_head *)0xffff8882877da158,
					.prev = (struct list_head *)0xffff8882877da158,
				},
			},
			.links = (struct dev_links_info){
				.suppliers = (struct list_head){
					.next = (struct list_head *)0xffff8882877da168,
					.prev = (struct list_head *)0xffff8882877da168,
				},
				.consumers = (struct list_head){
					.next = (struct list_head *)0xffff8882877da178,
					.prev = (struct list_head *)0xffff8882877da178,
				},
				.defer_sync = (struct list_head){
					.next = (struct list_head *)0xffff8882877da188,
					.prev = (struct list_head *)0xffff8882877da188,
				},
				.status = (enum dl_dev_state)DL_DEV_NO_DRIVER,
			},
			.power = (struct dev_pm_info){
				.power_state = (pm_message_t){
					.event = (int)0,
				},
				.can_wakeup = (bool)0,
				.async_suspend = (bool)1,
				.in_dpm_list = (bool)0,
				.is_prepared = (bool)0,
				.is_suspended = (bool)0,
				.is_noirq_suspended = (bool)0,
				.is_late_suspended = (bool)0,
				.no_pm = (bool)0,
				.early_init = (bool)1,
				.direct_complete = (bool)0,
				.driver_flags = (u32)0,
				.lock = (spinlock_t){
					.rlock = (struct raw_spinlock){
						.raw_lock = (arch_spinlock_t){
							.val = (atomic_t){
								.counter = (int)0,
							},
							.locked = (u8)0,
							.pending = (u8)0,
							.locked_pending = (u16)0,
							.tail = (u16)0,
						},
					},
				},
				.should_wakeup = (bool)0,
				.subsys_data = (struct pm_subsys_data *)0x0,
				.set_latency_tolerance = (void (*)(struct device *, s32))0x0,
				.qos = (struct dev_pm_qos *)0x0,
			},
			.pm_domain = (struct dev_pm_domain *)0x0,
			.msi = (struct dev_msi_info){
				.domain = (struct irq_domain *)0xffff888281000000,
				.data = (struct msi_device_data *)0x0,
			},
			.dma_mask = (u64 *)0xffff8882877da088,
			.coherent_dma_mask = (u64)4294967295,
			.bus_dma_limit = (u64)0,
			.dma_range_map = (const struct bus_dma_region *)0x0,
			.dma_parms = (struct device_dma_parameters *)0xffff8882877da090,
			.dma_pools = (struct list_head){
				.next = (struct list_head *)0xffff8882877da210,
				.prev = (struct list_head *)0xffff8882877da210,
			},
			.cma_area = (struct cma *)0x0,
			.dma_io_tlb_mem = (struct io_tlb_mem *)io_tlb_default_mem.llvm.9097096581342952386+0x0 = 0xffffffff8477f850,
			.archdata = (struct dev_archdata){},
			.of_node = (struct device_node *)0x0,
			.fwnode = (struct fwnode_handle *)0xffff888287484010,
			.numa_node = (int)0,
			.devt = (dev_t)0,
			.id = (u32)0,
			.devres_lock = (spinlock_t){
				.rlock = (struct raw_spinlock){
					.raw_lock = (arch_spinlock_t){
						.val = (atomic_t){
							.counter = (int)0,
						},
						.locked = (u8)0,
						.pending = (u8)0,
						.locked_pending = (u16)0,
						.tail = (u16)0,
					},
				},
			},
			.devres_head = (struct list_head){
				.next = (struct list_head *)0xffff8882877da250,
				.prev = (struct list_head *)0xffff8882877da250,
			},
			.class = (const struct class *)0x0,
			.groups = (const struct attribute_group **)0x0,
			.release = (void (*)(struct device *))pci_release_dev+0x0 = 0xffffffff81b11680,
			.iommu_group = (struct iommu_group *)0x0,
			.iommu = (struct dev_iommu *)0x0,
			.physical_location = (struct device_physical_location *)0x0,
			.removable = (enum device_removable)DEVICE_REMOVABLE_NOT_SUPPORTED,
			.offline_disabled = (bool)0,
			.offline = (bool)0,
			.of_node_reused = (bool)0,
			.state_synced = (bool)0,
			.can_match = (bool)0,
			.dma_skip_sync = (bool)0,
			.dma_iommu = (bool)0,
		},
		.cfg_size = (int)4096,
		.irq = (unsigned int)0,
		.resource = (struct resource [17]){
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
			{
				.start = (resource_size_t)0,
				.end = (resource_size_t)0,
				.name = (const char *)0xffff888287645e50 = "0000:00:00.0",
				.flags = (unsigned long)0,
				.desc = (unsigned long)0,
				.parent = (struct resource *)0x0,
				.sibling = (struct resource *)0x0,
				.child = (struct resource *)0x0,
			},
		},
		.driver_exclusive_resource = (struct resource){
			.start = (resource_size_t)0,
			.end = (resource_size_t)18446744073709551615,
			.name = (const char *)0xffffffff82901265 = "PCI Exclusive",
			.flags = (unsigned long)0,
			.desc = (unsigned long)0,
			.parent = (struct resource *)0x0,
			.sibling = (struct resource *)0x0,
			.child = (struct resource *)0x0,
		},
		.transparent = (unsigned int)0,
		.io_window = (unsigned int)0,
		.pref_window = (unsigned int)0,
		.pref_64_window = (unsigned int)0,
		.multifunction = (unsigned int)0,
		.is_busmaster = (unsigned int)0,
		.no_msi = (unsigned int)0,
		.no_64bit_msi = (unsigned int)0,
		.block_cfg_access = (unsigned int)0,
		.broken_parity_status = (unsigned int)0,
		.irq_reroute_variant = (unsigned int)0,
		.msi_enabled = (unsigned int)0,
		.msix_enabled = (unsigned int)0,
		.ari_enabled = (unsigned int)0,
		.ats_enabled = (unsigned int)0,
		.pasid_enabled = (unsigned int)0,
		.pri_enabled = (unsigned int)0,
		.tph_enabled = (unsigned int)0,
		.is_managed = (unsigned int)0,
		.is_msi_managed = (unsigned int)0,
		.needs_freset = (unsigned int)0,
		.state_saved = (unsigned int)0,
		.is_physfn = (unsigned int)0,
		.is_virtfn = (unsigned int)0,
		.is_hotplug_bridge = (unsigned int)0,
		.shpc_managed = (unsigned int)0,
		.is_thunderbolt = (unsigned int)0,
		.untrusted = (unsigned int)0,
		.external_facing = (unsigned int)0,
		.broken_intx_masking = (unsigned int)0,
		.io_window_1k = (unsigned int)0,
		.irq_managed = (unsigned int)0,
		.non_compliant_bars = (unsigned int)0,
		.is_probed = (unsigned int)0,
		.link_active_reporting = (unsigned int)1,
		.no_vf_scan = (unsigned int)0,
		.no_command_memory = (unsigned int)0,
		.rom_bar_overlap = (unsigned int)0,
		.rom_attr_enabled = (unsigned int)0,
		.non_mappable_bars = (unsigned int)0,
		.dev_flags = (pci_dev_flags_t)0,
		.enable_cnt = (atomic_t){
			.counter = (int)0,
		},
		.pcie_cap_lock = (spinlock_t){
			.rlock = (struct raw_spinlock){
				.raw_lock = (arch_spinlock_t){
					.val = (atomic_t){
						.counter = (int)0,
					},
					.locked = (u8)0,
					.pending = (u8)0,
					.locked_pending = (u16)0,
					.tail = (u16)0,
				},
			},
		},
		.saved_config_space = (u32 [16]){},
		.saved_cap_space = (struct hlist_head){
			.first = (struct hlist_node *)0xffff8882867cf300,
		},
		.res_attr = (struct bin_attribute *[17]){},
		.res_attr_wc = (struct bin_attribute *[17]){},
		.broken_cmd_compl = (unsigned int)0,
		.ptm_cap = (u16)0,
		.ptm_root = (unsigned int)0,
		.ptm_enabled = (unsigned int)0,
		.ptm_granularity = (u8)0,
		.msix_base = (void *)0x0,
		.msi_lock = (raw_spinlock_t){
			.raw_lock = (arch_spinlock_t){
				.val = (atomic_t){
					.counter = (int)0,
				},
				.locked = (u8)0,
				.pending = (u8)0,
				.locked_pending = (u16)0,
				.tail = (u16)0,
			},
		},
		.vpd = (struct pci_vpd){
			.lock = (struct mutex){
				.owner = (atomic_long_t){
					.counter = (s64)0,
				},
				.wait_lock = (raw_spinlock_t){
					.raw_lock = (arch_spinlock_t){
						.val = (atomic_t){
							.counter = (int)0,
						},
						.locked = (u8)0,
						.pending = (u8)0,
						.locked_pending = (u16)0,
						.tail = (u16)0,
					},
				},
				.osq = (struct optimistic_spin_queue){
					.tail = (atomic_t){
						.counter = (int)0,
					},
				},
				.wait_list = (struct list_head){
					.next = (struct list_head *)0xffff8882877da8b0,
					.prev = (struct list_head *)0xffff8882877da8b0,
				},
			},
			.len = (unsigned int)0,
			.cap = (u8)0,
		},
		.dpc_cap = (u16)0,
		.dpc_rp_extensions = (unsigned int)0,
		.dpc_rp_log_size = (u8)0,
		.link_bwctrl = (struct pcie_bwctrl_data *)0x0,
		.sriov = (struct pci_sriov *)0x0,
		.physfn = (struct pci_dev *)0x0,
		.ats_cap = (u16)0,
		.ats_stu = (u8)0,
		.pri_cap = (u16)0,
		.pri_reqs_alloc = (u32)0,
		.pasid_required = (unsigned int)0,
		.pasid_cap = (u16)0,
		.pasid_features = (u16)0,
		.p2pdma = (struct pci_p2pdma *)0x0,
		.doe_mbs = (struct xarray){
			.xa_lock = (spinlock_t){
				.rlock = (struct raw_spinlock){
					.raw_lock = (arch_spinlock_t){
						.val = (atomic_t){
							.counter = (int)0,
						},
						.locked = (u8)0,
						.pending = (u8)0,
						.locked_pending = (u16)0,
						.tail = (u16)0,
					},
				},
			},
			.xa_flags = (gfp_t)0,
			.xa_head = (void *)0x0,
		},
		.acs_cap = (u16)0,
		.supported_speeds = (u8)14,
		.rom = (phys_addr_t)0,
		.romlen = (size_t)0,
		.driver_override = (const char *)0x0,
		.priv_flags = (unsigned long)129,
		.reset_methods = (u8 [8]){},
	}

