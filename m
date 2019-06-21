Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF444EF40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 21:09:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VpCB1cv3zDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 05:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="etM4RK2p"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vp9J2MfwzDqch
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 05:07:46 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id g18so5257243qkl.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8/jnCdqovLT0DETmXF5+dOTWuS/EOehgYEhx9YKAXM=;
 b=etM4RK2pYtxCZzUTbbT4Ov/e8sI/yVvbHzEz7yvysb6DWGLA17dHeUUt74cP9RCrSQ
 3gFoA6zye+IYBz271OtP0sXKtqExnoDJ8w0f99I2l8iRC6jqACb5BNcGlGUHzQeuRs3Q
 nKydh+4I0XJwA0iAPLdCWCki4P2sbUxwK26umTIXHm36C+4nh1OS2Tr6xe3hRVN16QjR
 kqXcm4mypolAKqoZ6oKdMiF3buufPZHL7qFFW1nT5eyC2fSEVS1eFrjHEJ7agmU90qiq
 bdu7Sm4kjkrEL7F7KRb6uwQc+bWfQFM+wCnjgfbOi7FsEE98SIywZxpYymMFiUdjQ0sZ
 2ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8/jnCdqovLT0DETmXF5+dOTWuS/EOehgYEhx9YKAXM=;
 b=OuI8VZmbXkkZW6uHm8Y2Kv+KuyTgDSM5KPoNbPYk68CMjPSslOjBrC9CtkxsVYsRHA
 ge4RokrVyupuDUK598OBXACv2hB/t+F1LU07XUjycY9kv3xPZCEMFQzKdf6aTJj97jvc
 XjSsDzjVpyOBHz8YaCWoAYYoBdALCvJrEaMwdTTIWufMKpN9PwDfackgLYE5aBeCXhN3
 iNYZAdz2a7atVKxdPKWACjdIf3/i84kjRDHEdDLCJ0A06KuRGEFpeuYHUF7T2YZvp/vS
 u91FdKEPV6+xsVIUVtgqrqDSAP2O6vdZIylQZMJquYkVtmOdVbsrifT+jmubmxq9woEn
 fZew==
X-Gm-Message-State: APjAAAVa90VsAzX0Fxpl07nM1AtxSG/st+kYnIH0m4aBsU934lOGY21X
 R4SORfrNnUvUazMF14aR9b1SLw==
X-Google-Smtp-Source: APXvYqwpuXwSGC5pJm2MEJ13C7h7Waoz8N6AtOXfQXsV7GwTD5mrkw7cgUiFwaBEMpJnxuvDrmZTpQ==
X-Received: by 2002:a37:a0c8:: with SMTP id j191mr6641636qke.466.1561144063213; 
 Fri, 21 Jun 2019 12:07:43 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id p4sm1916398qkb.84.2019.06.21.12.07.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 12:07:42 -0700 (PDT)
Message-ID: <1561144059.5154.52.camel@lca.pw>
Subject: Re: [PATCH v3 0/6] mm: Further memory block device cleanups
From: Qian Cai <cai@lca.pw>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Date: Fri, 21 Jun 2019 15:07:39 -0400
In-Reply-To: <5b4e4f85-8f3e-0a15-6c85-704512205a42@redhat.com>
References: <20190620183139.4352-1-david@redhat.com>
 <1561130120.5154.47.camel@lca.pw>
 <1c2edc22-afd7-2211-c4c7-40e54e5007e8@redhat.com>
 <5b4e4f85-8f3e-0a15-6c85-704512205a42@redhat.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Neuling <mikey@neuling.org>, Baoquan He <bhe@redhat.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Andrew Banman <andrew.banman@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Johannes Weiner <hannes@cmpxchg.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-21 at 20:56 +0200, David Hildenbrand wrote:
> On 21.06.19 20:24, David Hildenbrand wrote:
> > On 21.06.19 17:15, Qian Cai wrote:
> > > On Thu, 2019-06-20 at 20:31 +0200, David Hildenbrand wrote:
> > > > @Andrew: Only patch 1, 4 and 6 changed compared to v1.
> > > > 
> > > > Some further cleanups around memory block devices. Especially, clean up
> > > > and simplify walk_memory_range(). Including some other minor cleanups.
> > > > 
> > > > Compiled + tested on x86 with DIMMs under QEMU. Compile-tested on ppc64.
> > > > 
> > > > v2 -> v3:
> > > > - "mm/memory_hotplug: Rename walk_memory_range() and pass start+size .."
> > > > -- Avoid warning on ppc.
> > > > - "drivers/base/memory.c: Get rid of find_memory_block_hinted()"
> > > > -- Fixup a comment regarding hinted devices.
> > > > 
> > > > v1 -> v2:
> > > > - "mm: Section numbers use the type "unsigned long""
> > > > -- "unsigned long i" -> "unsigned long nr", in one case -> "int i"
> > > > - "drivers/base/memory.c: Get rid of find_memory_block_hinted("
> > > > -- Fix compilation error
> > > > -- Get rid of the "hint" parameter completely
> > > > 
> > > > David Hildenbrand (6):
> > > >   mm: Section numbers use the type "unsigned long"
> > > >   drivers/base/memory: Use "unsigned long" for block ids
> > > >   mm: Make register_mem_sect_under_node() static
> > > >   mm/memory_hotplug: Rename walk_memory_range() and pass start+size
> > > >     instead of pfns
> > > >   mm/memory_hotplug: Move and simplify walk_memory_blocks()
> > > >   drivers/base/memory.c: Get rid of find_memory_block_hinted()
> > > > 
> > > >  arch/powerpc/platforms/powernv/memtrace.c |  23 ++---
> > > >  drivers/acpi/acpi_memhotplug.c            |  19 +---
> > > >  drivers/base/memory.c                     | 120 +++++++++++++---------
> > > >  drivers/base/node.c                       |   8 +-
> > > >  include/linux/memory.h                    |   5 +-
> > > >  include/linux/memory_hotplug.h            |   2 -
> > > >  include/linux/mmzone.h                    |   4 +-
> > > >  include/linux/node.h                      |   7 --
> > > >  mm/memory_hotplug.c                       |  57 +---------
> > > >  mm/sparse.c                               |  12 +--
> > > >  10 files changed, 106 insertions(+), 151 deletions(-)
> > > > 
> > > 
> > > This series causes a few machines are unable to boot triggering endless
> > > soft
> > > lockups. Reverted those commits fixed the issue.
> > > 
> > > 97f4217d1da0 Revert "mm/memory_hotplug: rename walk_memory_range() and
> > > pass
> > > start+size instead of pfns"
> > > c608eebf33c6 Revert "mm-memory_hotplug-rename-walk_memory_range-and-pass-
> > > startsize-instead-of-pfns-fix"
> > > 34b5e4ab7558 Revert "mm/memory_hotplug: move and simplify
> > > walk_memory_blocks()"
> > > 59a9f3eec5d1 Revert "drivers/base/memory.c: Get rid of
> > > find_memory_block_hinted()"
> > > 5cfcd52288b6 Revert "drivers-base-memoryc-get-rid-of-
> > > find_memory_block_hinted-
> > > v3"
> > > 
> > > [    4.582081][    T1] ACPI FADT declares the system doesn't support PCIe
> > > ASPM,
> > > so disable it
> > > [    4.590405][    T1] ACPI: bus type PCI registered
> > > [    4.592908][    T1] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem
> > > 0x80000000-0x8fffffff] (base 0x80000000)
> > > [    4.601860][    T1] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff]
> > > reserved in
> > > E820
> > > [    4.601860][    T1] PCI: Using configuration type 1 for base access
> > > [   28.661336][   C16] watchdog: BUG: soft lockup - CPU#16 stuck for 22s!
> > > [swapper/0:1]
> > > [   28.671351][   C16] Modules linked in:
> > > [   28.671354][   C16] CPU: 16 PID: 1 Comm: swapper/0 Not tainted 5.2.0-
> > > rc5-
> > > next-20190621+ #1
> > > [   28.681366][   C16] Hardware name: HPE ProLiant DL385 Gen10/ProLiant
> > > DL385
> > > Gen10, BIOS A40 03/09/2018
> > > [   28.691334][   C16] RIP: 0010:_raw_spin_unlock_irqrestore+0x2f/0x40
> > > [   28.701334][   C16] Code: 55 48 89 e5 41 54 49 89 f4 be 01 00 00 00 53
> > > 48 8b
> > > 55 08 48 89 fb 48 8d 7f 18 e8 4c 89 7d ff 48 89 df e8 94 f9 7d ff 41 54 9d
> > > <65>
> > > ff 0d c2 44 8d 48 5b 41 5c 5d c3 0f 1f 44 00 00 0f 1f 44 00 00
> > > [   28.711354][   C16] RSP: 0018:ffff888205b27bf8 EFLAGS: 00000246
> > > ORIG_RAX:
> > > ffffffffffffff13
> > > [   28.721372][   C16] RAX: 0000000000000000 RBX: ffff8882053d6138 RCX:
> > > ffffffffb6f2a3b8
> > > [   28.731371][   C16] RDX: 1ffff11040a7ac27 RSI: dffffc0000000000 RDI:
> > > ffff8882053d6138
> > > [   28.741371][   C16] RBP: ffff888205b27c08 R08: ffffed1040a7ac28 R09:
> > > ffffed1040a7ac27
> > > [   28.751334][   C16] R10: ffffed1040a7ac27 R11: ffff8882053d613b R12:
> > > 0000000000000246
> > > [   28.751370][   C16] R13: ffff888205b27c98 R14: ffff8884504d0a20 R15:
> > > 0000000000000000
> > > [   28.761368][   C16] FS:  0000000000000000(0000)
> > > GS:ffff888454500000(0000)
> > > knlGS:0000000000000000
> > > [   28.771373][   C16] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   28.781334][   C16] CR2: 0000000000000000 CR3: 00000007c9012000 CR4:
> > > 00000000001406a0
> > > [   28.791333][   C16] Call Trace:
> > > [   28.791374][   C16]  klist_next+0xd8/0x1c0
> > > [   28.791374][   C16]  subsys_find_device_by_id+0x13b/0x1f0
> > > [   28.801334][   C16]  ? bus_find_device_by_name+0x20/0x20
> > > [   28.801370][   C16]  ? kobject_put+0x23/0x250
> > > [   28.811333][   C16]  walk_memory_blocks+0x6c/0xb8
> > > [   28.811353][   C16]  ? write_policy_show+0x40/0x40
> > > [   28.821334][   C16]  link_mem_sections+0x7e/0xa0
> > > [   28.821369][   C16]  ? unregister_memory_block_under_nodes+0x210/0x210
> > > [   28.831353][   C16]  ? __register_one_node+0x3bd/0x600
> > > [   28.831353][   C16]  topology_init+0xbf/0x126
> > > [   28.841364][   C16]  ? enable_cpu0_hotplug+0x1a/0x1a
> > > [   28.841368][   C16]  do_one_initcall+0xfe/0x45a
> > > [   28.851334][   C16]  ? initcall_blacklisted+0x150/0x150
> > > [   28.851353][   C16]  ? kasan_check_write+0x14/0x20
> > > [   28.861333][   C16]  ? up_write+0x75/0x140
> > > [   28.861369][   C16]  kernel_init_freeable+0x619/0x6ac
> > > [   28.871333][   C16]  ? rest_init+0x188/0x188
> > > [   28.871353][   C16]  kernel_init+0x11/0x138
> > > [   28.881363][   C16]  ? rest_init+0x188/0x188
> > > [   28.881363][   C16]  ret_from_fork+0x22/0x40
> > > [   56.661336][   C16] watchdog: BUG: soft lockup - CPU#16 stuck for 22s!
> > > [swapper/0:1]
> > > [   56.671352][   C16] Modules linked in:
> > > [   56.671354][   C16] CPU: 16 PID: 1 Comm: swapper/0 Tainted:
> > > G             L    5.2.0-rc5-next-20190621+ #1
> > > [   56.681357][   C16] Hardware name: HPE ProLiant DL385 Gen10/ProLiant
> > > DL385
> > > Gen10, BIOS A40 03/09/2018
> > > [   56.691356][   C16] RIP: 0010:subsys_find_device_by_id+0x168/0x1f0
> > > [   56.701334][   C16] Code: 48 85 c0 74 3e 48 8d 78 58 e8 14 77 ca ff 4d
> > > 8b 7e
> > > 58 4d 85 ff 74 2c 49 8d bf a0 03 00 00 e8 bf 75 ca ff 45 39 a7 a0 03 00 00
> > > <75>
> > > c9 4c 89 ff e8 0e 89 ff ff 48 85 c0 74 bc 48 89 df e8 21 3b 24
> > > [   56.721333][   C16] RSP: 0018:ffff888205b27c68 EFLAGS: 00000287
> > > ORIG_RAX:
> > > ffffffffffffff13
> > > [   56.721370][   C16] RAX: 0000000000000000 RBX: ffff888205b27c90 RCX:
> > > ffffffffb74c9dc1
> > > [   56.731370][   C16] RDX: 0000000000000003 RSI: dffffc0000000000 RDI:
> > > ffff8888774ec3e0
> > > [   56.741371][   C16] RBP: ffff888205b27cf8 R08: ffffed1040a7ac28 R09:
> > > ffffed1040a7ac27
> > > [   56.751335][   C16] R10: ffffed1040a7ac27 R11: ffff8882053d613b R12:
> > > 0000000000085c1b
> > > [   56.761334][   C16] R13: 1ffff11040b64f8e R14: ffff888450de4a20 R15:
> > > ffff8888774ec040
> > > [   56.761372][   C16] FS:  0000000000000000(0000)
> > > GS:ffff888454500000(0000)
> > > knlGS:0000000000000000
> > > [   56.771374][   C16] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   56.781370][   C16] CR2: 0000000000000000 CR3: 00000007c9012000 CR4:
> > > 00000000001406a0
> > > [   56.791373][   C16] Call Trace:
> > > [   56.791373][   C16]  ? bus_find_device_by_name+0x20/0x20
> > > [   56.801334][   C16]  ? kobject_put+0x23/0x250
> > > [   56.801334][   C16]  walk_memory_blocks+0x6c/0xb8
> > > [   56.811333][   C16]  ? write_policy_show+0x40/0x40
> > > [   56.811353][   C16]  link_mem_sections+0x7e/0xa0
> > > [   56.811353][   C16]  ? unregister_memory_block_under_nodes+0x210/0x210
> > > [   56.821333][   C16]  ? __register_one_node+0x3bd/0x600
> > > [   56.831333][   C16]  topology_init+0xbf/0x126
> > > [   56.831355][   C16]  ? enable_cpu0_hotplug+0x1a/0x1a
> > > [   56.841334][   C16]  do_one_initcall+0xfe/0x45a
> > > [   56.841334][   C16]  ? initcall_blacklisted+0x150/0x150
> > > [   56.851333][   C16]  ? kasan_check_write+0x14/0x20
> > > [   56.851354][   C16]  ? up_write+0x75/0x140
> > > [   56.861333][   C16]  kernel_init_freeable+0x619/0x6ac
> > > [   56.861333][   C16]  ? rest_init+0x188/0x188
> > > [   56.861369][   C16]  kernel_init+0x11/0x138
> > > [   56.871333][   C16]  ? rest_init+0x188/0x188
> > > [   56.871354][   C16]  ret_from_fork+0x22/0x40
> > > [   64.601362][   C16] rcu: INFO: rcu_sched self-detected stall on CPU
> > > [   64.611335][   C16] rcu: 	16-....: (5958 ticks this GP)
> > > idle=37e/1/0x4000000000000002 softirq=27/27 fqs=3000 
> > > [   64.621334][   C16] 	(t=6002 jiffies g=-1079 q=25)
> > > [   64.621334][   C16] NMI backtrace for cpu 16
> > > [   64.621374][   C16] CPU: 16 PID: 1 Comm: swapper/0 Tainted:
> > > G             L    5.2.0-rc5-next-20190621+ #1
> > > [   64.631372][   C16] Hardware name: HPE ProLiant DL385 Gen10/ProLiant
> > > DL385
> > > Gen10, BIOS A40 03/09/2018
> > > [   64.641371][   C16] Call Trace:
> > > [   64.651337][   C16]  <IRQ>
> > > [   64.651376][   C16]  dump_stack+0x62/0x9a
> > > [   64.651376][   C16]  nmi_cpu_backtrace.cold.0+0x2e/0x33
> > > [   64.661337][   C16]  ? nmi_cpu_backtrace_handler+0x20/0x20
> > > [   64.661337][   C16]  nmi_trigger_cpumask_backtrace+0x1a6/0x1b9
> > > [   64.671353][   C16]  arch_trigger_cpumask_backtrace+0x19/0x20
> > > [   64.681366][   C16]  rcu_dump_cpu_stacks+0x18b/0x1d6
> > > [   64.681366][   C16]  rcu_sched_clock_irq.cold.64+0x368/0x791
> > > [   64.691336][   C16]  ? kasan_check_read+0x11/0x20
> > > [   64.691354][   C16]  ? __raise_softirq_irqoff+0x66/0x150
> > > [   64.701336][   C16]  update_process_times+0x2f/0x60
> > > [   64.701362][   C16]  tick_periodic+0x38/0xe0
> > > [   64.711334][   C16]  tick_handle_periodic+0x2e/0x80
> > > [   64.711353][   C16]  smp_apic_timer_interrupt+0xfb/0x370
> > > [   64.721367][   C16]  apic_timer_interrupt+0xf/0x20
> > > [   64.721367][   C16]  </IRQ>
> > > [   64.721367][   C16] RIP: 0010:_raw_spin_unlock_irqrestore+0x2f/0x40
> > > [   64.731370][   C16] Code: 55 48 89 e5 41 54 49 89 f4 be 01 00 00 00 53 
> > > 
> > 
> > @Qian Cai, unfortunately I can't reproduce.
> > 
> > If you get the chance, it would be great if you could retry with
> > 
> > diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> > index 972c5336bebf..742f99ddd148 100644
> > --- a/drivers/base/memory.c
> > +++ b/drivers/base/memory.c
> > @@ -868,6 +868,9 @@ int walk_memory_blocks(unsigned long start, unsigned
> > long size,
> >         unsigned long block_id;
> >         int ret = 0;
> > 
> > +       if (!size)
> > +               return;
> > +
> >         for (block_id = start_block_id; block_id <= end_block_id;
> > block_id++) {
> >                 mem = find_memory_block_by_id(block_id);
> >                 if (!mem)
> > 
> > 
> > 
> > If both, start and size are 0, we would get a veeeery long loop. This
> > would mean that we have an online node that does not span any pages at
> > all (pgdat->node_start_pfn = 0, start_pfn + pgdat->node_spanned_pages = 0).
> > 
> 
> 
> ...trying to reproduce with QEMU (setting 0MB for the second node):
> 
> qemu-system-x86_64 --enable-kvm -m 4G,maxmem=20G,slots=2 \
> 	-smp sockets=2,cores=1 \
> 	-numa node,nodeid=0,cpus=0,mem=4G \
> 	-numa node,nodeid=1,cpus=1,mem=0 ...
> 
> I can indeed see that the node is online and
> "pgdat->node_start_pfn == 0 && start_pfn + pgdat->node_spanned_pages == 0".
> 
> However, the kernel segfaults in an unrelated code path, so I can't
> verify if this solves this problem:
> 
> [    0.313284] BUG: kernel NULL pointer dereference, address: 00000000000000a0
> [    0.313479] #PF: supervisor read access in kernel mode
> [    0.313479] #PF: error_code(0x0000) - not-present page
> [    0.313479] PGD 0 P4D 0 
> [    0.313479] Oops: 0000 [#1] SMP PTI
> [    0.313479] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc5-next-
> 20190620+ #56
> [    0.313479] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.4
> [    0.313479] RIP: 0010:bus_add_device+0x59/0x110
> [    0.313479] Code: 20 48 89 df e8 f8 b4 ff ff 41 89 c4 85 c0 0f 85 81 00 00
> 00 48 8b 53 50 48 85 d2 75 03 48 8b 135
> [    0.313479] RSP: 0000:ffffb4a6c0013e20 EFLAGS: 00010246
> [    0.313479] RAX: 0000000000000000 RBX: ffff8b61bac23800 RCX:
> 0000000000000000
> [    0.313479] RDX: ffff8b61bac29038 RSI: ffff8b61bac23800 RDI:
> ffff8b61bac23800
> [    0.313479] RBP: ffffffff9d2f4500 R08: 0000000000000000 R09:
> 0000000000000001
> [    0.313479] R10: 0000000000000000 R11: ffff8b61bad20878 R12:
> 0000000000000000
> [    0.313479] R13: 0000000000000000 R14: 0000000000000000 R15:
> 0000000000000000
> [    0.313479] FS:  0000000000000000(0000) GS:ffff8b61bba00000(0000)
> knlGS:0000000000000000
> [    0.313479] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.313479] CR2: 00000000000000a0 CR3: 0000000013c24000 CR4:
> 00000000000006f0
> [    0.313479] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    0.313479] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    0.313479] Call Trace:
> [    0.313479]  device_add+0x304/0x660
> [    0.313479]  ? __init_waitqueue_head+0x31/0x50
> [    0.313479]  __register_one_node+0x67/0x170
> [    0.313479]  __try_online_node.cold+0x3e/0x78
> [    0.313479]  try_online_node+0x25/0x40
> [    0.313479]  do_cpu_up+0x36/0xc0
> [    0.313479]  smp_init+0x59/0xb3
> [    0.313479]  kernel_init_freeable+0x11a/0x247
> [    0.313479]  ? rest_init+0x23f/0x23f
> [    0.313479]  kernel_init+0x5/0xf1
> [    0.313479]  ret_from_fork+0x3a/0x50
> [    0.313479] Modules linked in:
> 
> Figuring out what goes wrong here (maybe QEMU creating a weird
> system configuration) is a different journey :)
> 

That is a separate issue need to revert,

"x86, numa: always initialize all possible nodes"

and then, you should be able to reproduce.

