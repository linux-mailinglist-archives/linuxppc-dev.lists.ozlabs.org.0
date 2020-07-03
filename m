Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D021395E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 13:34:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ytCN3nPLzDrJ5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 21:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Q3eOGzrf; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3eOGzrf; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yt9Y4DcwzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 21:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593775950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hb1UWxAnn7/Fe4jKGIVRIiHiBgwzd2HjUrmALs/0Vxg=;
 b=Q3eOGzrf7UmQMprfgDATudF1b1SRoYoIVfeedttx4B/Vyi0QBFaR2XDtE7LbwDDua/iTSd
 5eu/6Nozdg8gfzm47G0vXw4Uwsln+Sl3icFW6eRJxt55ijjvMDQK2FMuRhi63bolPVo+wR
 Z2LvnjyuoZaOssRGA8Y/nSpg63rLzlY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593775950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Hb1UWxAnn7/Fe4jKGIVRIiHiBgwzd2HjUrmALs/0Vxg=;
 b=Q3eOGzrf7UmQMprfgDATudF1b1SRoYoIVfeedttx4B/Vyi0QBFaR2XDtE7LbwDDua/iTSd
 5eu/6Nozdg8gfzm47G0vXw4Uwsln+Sl3icFW6eRJxt55ijjvMDQK2FMuRhi63bolPVo+wR
 Z2LvnjyuoZaOssRGA8Y/nSpg63rLzlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-rOfMvUF0On-h-nHIQajpUA-1; Fri, 03 Jul 2020 07:32:28 -0400
X-MC-Unique: rOfMvUF0On-h-nHIQajpUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0634107ACCA;
 Fri,  3 Jul 2020 11:32:25 +0000 (UTC)
Received: from [10.36.114.0] (ovpn-114-0.ams2.redhat.com [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C05A2778B0;
 Fri,  3 Jul 2020 11:32:22 +0000 (UTC)
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
To: Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Such=c3=a1nek?=
 <msuchanek@suse.de>
References: <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
 <20200703092414.GR18446@dhcp22.suse.cz>
 <20200703105944.GS18446@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <3f926058-cabc-94d0-0f92-4e966ea4cdc3@redhat.com>
Date: Fri, 3 Jul 2020 13:32:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703105944.GS18446@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.07.20 12:59, Michal Hocko wrote:
> On Fri 03-07-20 11:24:17, Michal Hocko wrote:
>> [Cc Andi]
>>
>> On Fri 03-07-20 11:10:01, Michal Suchanek wrote:
>>> On Wed, Jul 01, 2020 at 02:21:10PM +0200, Michal Hocko wrote:
>>>> On Wed 01-07-20 13:30:57, David Hildenbrand wrote:
>> [...]
>>>>> Yep, looks like it.
>>>>>
>>>>> [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
>>>>> [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
>>>>> [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
>>>>> [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
>>>>> [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
>>>>> [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
>>>>> [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
>>>>
>>>> This begs a question whether ppc can do the same thing?
>>> Or x86 stop doing it so that you can see on what node you are running?
>>>
>>> What's the point of this indirection other than another way of avoiding
>>> empty node 0?
>>
>> Honestly, I do not have any idea. I've traced it down to
>> Author: Andi Kleen <ak@suse.de>
>> Date:   Tue Jan 11 15:35:48 2005 -0800
>>
>>     [PATCH] x86_64: Fix ACPI SRAT NUMA parsing
>>
>>     Fix fallout from the recent nodemask_t changes. The node ids assigned
>>     in the SRAT parser were off by one.
>>
>>     I added a new first_unset_node() function to nodemask.h to allocate
>>     IDs sanely.
>>
>>     Signed-off-by: Andi Kleen <ak@suse.de>
>>     Signed-off-by: Linus Torvalds <torvalds@osdl.org>
>>
>> which doesn't really tell all that much. The historical baggage and a
>> long term behavior which is not really trivial to fix I suspect.
> 
> Thinking about this some more, this logic makes some sense afterall.
> Especially in the world without memory hotplug which was very likely the
> case back then. It is much better to have compact node mask rather than
> sparse one. After all node numbers shouldn't really matter as long as
> you have a clear mapping to the HW. I am not sure we export that
> information (except for the kernel ring buffer) though.
> 
> The memory hotplug changes that somehow because you can hotremove numa
> nodes and therefore make the nodemask sparse but that is not a common
> case. I am not sure what would happen if a completely new node was added
> and its corresponding node was already used by the renumbered one
> though. It would likely conflate the two I am afraid. But I am not sure
> this is really possible with x86 and a lack of a bug report would
> suggest that nobody is doing that at least.
> 

I think the ACPI code takes care of properly mapping PXM to nodes.

So if I start with PXM 0 empty and PXM 1 populated, I will get
PXM 1 == node 0 as described. Once I hotplug something to PXM 0 in QEMU

$ echo "object_add memory-backend-ram,id=mem0,size=1G" | sudo nc -U /var/tmp/monitor
$ echo "device_add pc-dimm,id=dimm0,memdev=mem0,node=0" | sudo nc -U /var/tmp/monitor

$ echo "info numa" | sudo nc -U /var/tmp/monitor
QEMU 5.0.50 monitor - type 'help' for more information
(qemu) info numa
2 nodes
node 0 cpus:
node 0 size: 1024 MB
node 0 plugged: 1024 MB
node 1 cpus: 0 1 2 3
node 1 size: 4096 MB
node 1 plugged: 0 MB

I get in the guest:

[   50.174435] ------------[ cut here ]------------
[   50.175436] node 1 was absent from the node_possible_map
[   50.176844] WARNING: CPU: 0 PID: 7 at mm/memory_hotplug.c:1021 add_memory_resource+0x8c/0x290
[   50.176844] Modules linked in:
[   50.176845] CPU: 0 PID: 7 Comm: kworker/u8:0 Not tainted 5.8.0-rc2+ #4
[   50.176846] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.4
[   50.176846] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
[   50.176847] RIP: 0010:add_memory_resource+0x8c/0x290
[   50.176849] Code: 5b 5d 41 5c 41 5d 41 5e 41 5f c3 48 63 c5 48 89 04 24 48 0f a3 05 94 6c 1c 01 72 17 89 ee 48 c78
[   50.176849] RSP: 0018:ffffa7a1c0043d48 EFLAGS: 00010296
[   50.176850] RAX: 000000000000002c RBX: ffff8bc633e63b80 RCX: 0000000000000000
[   50.176851] RDX: ffff8bc63bc27060 RSI: ffff8bc63bc18d00 RDI: ffff8bc63bc18d00
[   50.176851] RBP: 0000000000000001 R08: 00000000000001e1 R09: ffffa7a1c0043bd8
[   50.176852] R10: 0000000000000005 R11: 0000000000000000 R12: 0000000140000000
[   50.176852] R13: 000000017fffffff R14: 0000000040000000 R15: 0000000180000000
[   50.176853] FS:  0000000000000000(0000) GS:ffff8bc63bc00000(0000) knlGS:0000000000000000
[   50.176853] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.176855] CR2: 000055dfcbfc5ee8 CR3: 00000000aca0a000 CR4: 00000000000006f0
[   50.176855] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   50.176856] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   50.176856] Call Trace:
[   50.176856]  __add_memory+0x33/0x70
[   50.176857]  acpi_memory_device_add+0x132/0x2f2
[   50.176857]  acpi_bus_attach+0xd2/0x200
[   50.176858]  acpi_bus_scan+0x33/0x70
[   50.176858]  acpi_device_hotplug+0x298/0x390
[   50.176858]  acpi_hotplug_work_fn+0x3d/0x50
[   50.176859]  process_one_work+0x1b4/0x370
[   50.176859]  worker_thread+0x53/0x3e0
[   50.176860]  ? process_one_work+0x370/0x370
[   50.176860]  kthread+0x119/0x140
[   50.176860]  ? __kthread_bind_mask+0x60/0x60
[   50.176861]  ret_from_fork+0x22/0x30
[   50.176861] ---[ end trace 9a2a837c1e0164f1 ]---
[   50.209816] acpi PNP0C80:00: add_memory failed
[   50.210510] acpi PNP0C80:00: acpi_memory_enable_device() error
[   50.211445] acpi PNP0C80:00: Enumeration failure


I remember that we added that check just recently (due to powerpc if I am not wrong).
Not sure why that triggers here.

But it properly maps PXM 0 to node 1.

-- 
Thanks,

David / dhildenb

