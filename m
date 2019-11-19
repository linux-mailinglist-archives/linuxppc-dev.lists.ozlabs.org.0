Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B61E4102672
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 15:19:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HScn1xwgzDqKS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 01:19:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="R/1Pi1Ki"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HSYc3wgSzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 01:16:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574172992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VC3V3Jxjtko1SYQH3MBBOMxUY3xpVbVtJKD+tE80Bi8=;
 b=R/1Pi1KiUOvQqx/1+G/iAMHYZvPE8TdGYz58x8AmfUnVzq/+Y3dBBw6EXY8r5sTZlh4qKU
 lOGlYrQ7sI8lqt1x5CmEiPGd8m0grUEfhtOaTJxhaUizf69h1ikLi618MSr6FZI9ryA9dY
 kkDpLjFeG9wSWhYavDS3j3ABORf0Z/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-9OzMB_CeNSaU2ssn_ay_0g-1; Tue, 19 Nov 2019 09:16:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017E99A697;
 Tue, 19 Nov 2019 14:16:27 +0000 (UTC)
Received: from [10.36.117.126] (ovpn-117-126.ams2.redhat.com [10.36.117.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33435E7A6;
 Tue, 19 Nov 2019 14:16:23 +0000 (UTC)
Subject: Re: [PATCH v6 04/10] mm/memory_hotplug: Don't access uninitialized
 memmaps in shrink_zone_span()
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-5-david@redhat.com>
 <5a4573de-bd8a-6cd3-55d0-86d503a236fd@redhat.com>
 <20191014121719.cb9b9efe51a7e9e985b38075@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8bbbd4f1-e2c9-b654-ab73-aa4314135f21@redhat.com>
Date: Tue, 19 Nov 2019 15:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014121719.cb9b9efe51a7e9e985b38075@linux-foundation.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9OzMB_CeNSaU2ssn_ay_0g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Alexander Duyck <alexander.duyck@gmail.com>, linux-mm@kvack.org,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Toshiki Fukasawa <t-fukasawa@vx.jp.nec.com>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.10.19 21:17, Andrew Morton wrote:
> On Mon, 14 Oct 2019 11:32:13 +0200 David Hildenbrand <david@redhat.com> w=
rote:
>=20
>>> Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
>>
>> @Andrew, can you convert that to
>>
>> Fixes: f1dd2cd13c4b ("mm, memory_hotplug: do not associate hotadded
>> memory to zones until online") # visible after d0dc12e86b319
>>
>> and add
>>
>> Cc: stable@vger.kernel.org # v4.13+
>=20
> Done, thanks.
>=20

Just a note that Toshiki reported a BUG (race between delayed
initialization of ZONE_DEVICE memmaps without holding the memory
hotplug lock and concurrent zone shrinking).

https://lkml.org/lkml/2019/11/14/1040

"Iteration of create and destroy namespace causes the panic as below:

[   41.207694] kernel BUG at mm/page_alloc.c:535!
[   41.208109] invalid opcode: 0000 [#1] SMP PTI
[   41.208508] CPU: 7 PID: 2766 Comm: ndctl Not tainted 5.4.0-rc4 #6
[   41.209064] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.11.0-0-g63451fca13-prebuilt.qemu-project.org 04/01/2014
[   41.210175] RIP: 0010:set_pfnblock_flags_mask+0x95/0xf0
[   41.210643] Code: 04 41 83 e2 3c 48 8d 04 a8 48 c1 e0 07 48 03 04 dd e0 =
59 55 bb 48 8b 58 68 48 39 da 73 0e 48 c7 c6 70 ac 11 bb e8 1b b2 fd ff <0f=
> 0b 48 03 58 78 48 39 da 73 e9 49 01 ca b9 3f 00 00 00 4f 8d 0c
[   41.212354] RSP: 0018:ffffac0d41557c80 EFLAGS: 00010246
[   41.212821] RAX: 000000000000004a RBX: 0000000000244a00 RCX: 00000000000=
00000
[   41.213459] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffbb1=
197dc
[   41.214100] RBP: 000000000000000c R08: 0000000000000439 R09: 00000000000=
00059
[   41.214736] R10: 0000000000000000 R11: ffffac0d41557b08 R12: ffff8be475e=
a72b0
[   41.215376] R13: 000000000000fa00 R14: 0000000000250000 R15: 00000000fff=
c0bb5
[   41.216008] FS:  00007f30862ab600(0000) GS:ffff8be57bc40000(0000) knlGS:=
0000000000000000
[   41.216771] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.217299] CR2: 000055e824d0d508 CR3: 0000000231dac000 CR4: 00000000000=
006e0
[   41.217934] Call Trace:
[   41.218225]  memmap_init_zone_device+0x165/0x17c
[   41.218642]  memremap_pages+0x4c1/0x540
[   41.218989]  devm_memremap_pages+0x1d/0x60
[   41.219367]  pmem_attach_disk+0x16b/0x600 [nd_pmem]
[   41.219804]  ? devm_nsio_enable+0xb8/0xe0
[   41.220172]  nvdimm_bus_probe+0x69/0x1c0
[   41.220526]  really_probe+0x1c2/0x3e0
[   41.220856]  driver_probe_device+0xb4/0x100
[   41.221238]  device_driver_attach+0x4f/0x60
[   41.221611]  bind_store+0xc9/0x110
[   41.221919]  kernfs_fop_write+0x116/0x190
[   41.222326]  vfs_write+0xa5/0x1a0
[   41.222626]  ksys_write+0x59/0xd0
[   41.222927]  do_syscall_64+0x5b/0x180
[   41.223264]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   41.223714] RIP: 0033:0x7f30865d0ed8
[   41.224037] Code: 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00 00 =
f3 0f 1e fa 48 8d 05 45 78 0d 00 8b 00 85 c0 75 17 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 41 54 49 89 d4 55
[   41.225920] RSP: 002b:00007fffe5d30a78 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[   41.226608] RAX: ffffffffffffffda RBX: 000055e824d07f40 RCX: 00007f30865=
d0ed8
[   41.227242] RDX: 0000000000000007 RSI: 000055e824d07f40 RDI: 00000000000=
00004
[   41.227870] RBP: 0000000000000007 R08: 0000000000000007 R09: 00000000000=
00006
[   41.228753] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
00004
[   41.229419] R13: 00007f30862ab528 R14: 0000000000000001 R15: 000055e824d=
07f40

While creating a namespace and initializing memmap, if you destroy the name=
space
and shrink the zone, it will initialize the memmap outside the zone and
trigger VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page) in
set_pfnblock_flags_mask()."


This BUG is also mitigated by this commit, where we for now stop to
shrink the ZONE_DEVICE zone until we can do it in a safe and clean
way.

--=20

Thanks,

David / dhildenb

