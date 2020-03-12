Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 773EA182C80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 10:32:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dNrs48JNzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 20:32:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dNqM3fbLzDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 20:30:55 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C0B6AFB4;
 Thu, 12 Mar 2020 09:30:51 +0000 (UTC)
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
To: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
Date: Thu, 12 Mar 2020 10:30:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/12/20 9:23 AM, Sachin Sant wrote:
> 
> 
>> On 12-Mar-2020, at 10:57 AM, Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
>> 
>> * Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:
>> 
>>> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
>>>> A Powerpc system with multiple possible nodes and with CONFIG_NUMA
>>>> enabled always used to have a node 0, even if node 0 does not any cpus
>>>> or memory attached to it. As per PAPR, node affinity of a cpu is only
>>>> available once its present / online. For all cpus that are possible but
>>>> not present, cpu_to_node() would point to node 0.
>>>> 
>>>> To ensure a cpuless, memoryless dummy node is not online, powerpc need
>>>> to make sure all possible but not present cpu_to_node are set to a
>>>> proper node.
>>> 
>>> Just curious, is this somehow related to
>>> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
>>> 
>> 
>> The issue I am trying to fix is a known issue in Powerpc since many years.
>> So this surely not a problem after a75056fc1e7c (mm/memcontrol.c: allocate
>> shrinker_map on appropriate NUMA node"). 
>> 
>> I tried v5.6-rc4 + a75056fc1e7c but didnt face any issues booting the
>> kernel. Will work with Sachin/Abdul (reporters of the issue).
>> 
> 
> I applied this 3 patch series on top of March 11 next tree (commit d44a64766795 )
> The kernel still fails to boot with same call trace.

Yeah when I skimmed the patches, I don't think they address the issue where
node_to_mem_node(0) = 0 [1]. You could reapply the debug print patch to verify,
but it seems very likely. So I'm not surprised you get the same trace.

[1] https://lore.kernel.org/linux-next/9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz/

> [    6.159357] BUG: Kernel NULL pointer dereference on read at 0x000073b0
> [    6.159363] Faulting instruction address: 0xc0000000003d7174
> [    6.159368] Oops: Kernel access of bad area, sig: 11 [#1]
> [    6.159372] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    6.159378] Modules linked in:
> [    6.159382] CPU: 17 PID: 1 Comm: systemd Not tainted 5.6.0-rc5-next-20200311-autotest+ #1
> [    6.159388] NIP:  c0000000003d7174 LR: c0000000003d7714 CTR: c000000000400e70
> [    6.159393] REGS: c0000008b36836d0 TRAP: 0300   Not tainted  (5.6.0-rc5-next-20200311-autotest+)
> [    6.159398] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004848  XER: 00000000
> [    6.159406] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1
> [    6.159406] GPR00: c0000000003d7714 c0000008b3683960 c00000000155e300 c0000008b301f500
> [    6.159406] GPR04: 0000000000000dc0 0000000000000000 c0000000003456f8 c0000008bb198620
> [    6.159406] GPR08: 00000008ba0f0000 0000000000000001 0000000000000000 0000000000000000
> [    6.159406] GPR12: 0000000024004848 c00000001ec55e00 0000000000000000 0000000000000000
> [    6.159406] GPR16: c0000008b0a82048 c000000001595898 c000000001750ca8 0000000000000002
> [    6.159406] GPR20: c000000001750cb8 c000000001624478 0000000fffffffe0 5deadbeef0000122
> [    6.159406] GPR24: 0000000000000001 0000000000000dc0 0000000000000000 c0000000003456f8
> [    6.159406] GPR28: c0000008b301f500 c0000008bb198620 0000000000000000 c00c000002285a40
> [    6.159453] NIP [c0000000003d7174] ___slab_alloc+0x1f4/0x760
> [    6.159458] LR [c0000000003d7714] __slab_alloc+0x34/0x60
> [    6.159462] Call Trace:
> [    6.159465] [c0000008b3683a40] [c0000008b3683a70] 0xc0000008b3683a70
> [    6.159471] [c0000008b3683a70] [c0000000003d8b20] __kmalloc_node+0x110/0x490
> [    6.159477] [c0000008b3683af0] [c0000000003456f8] kvmalloc_node+0x58/0x110
> [    6.159483] [c0000008b3683b30] [c000000000400f78] mem_cgroup_css_online+0x108/0x270
> [    6.159489] [c0000008b3683b90] [c000000000236ed8] online_css+0x48/0xd0
> [    6.159494] [c0000008b3683bc0] [c00000000023ffac] cgroup_apply_control_enable+0x2ec/0x4d0
> [    6.159501] [c0000008b3683ca0] [c0000000002437c8] cgroup_mkdir+0x228/0x5f0
> [    6.159506] [c0000008b3683d10] [c000000000521780] kernfs_iop_mkdir+0x90/0xf0
> [    6.159512] [c0000008b3683d50] [c00000000043f670] vfs_mkdir+0x110/0x230
> [    6.159517] [c0000008b3683da0] [c000000000443150] do_mkdirat+0xb0/0x1a0
> [    6.159523] [c0000008b3683e20] [c00000000000b278] system_call+0x5c/0x68
> [    6.159527] Instruction dump:
> [    6.159531] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088
> [    6.159538] 3ea2000c 3ab56178 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a
> [    6.159545] ---[ end trace 36d65cb66091a5b6 ]—
> 
> Boot log attached.
> 
> Thanks
> -Sachin
> 

