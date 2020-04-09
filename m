Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 661491A3045
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:36:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yXxx2gQ0zDr9y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:36:05 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=QfX+iiMV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yXtG54JMzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:32:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586417571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y6qMltfal0fl2P6YWyS5WSepv82iHZRo2B97emGwRs0=;
 b=QfX+iiMVmwsWS5gh1qxsFtvPcFl0eXXf7gZUNWeR9OKGEjr1yKa1YF+hpXbxgzWkmYNg4d
 NjUrOrvvYdsWsnMf7mSWF1VNx8DGF2tXVM7lLmGAg660VtNFMJLLF4BHGAVwLi+BD9ot89
 bt3NN4fA0NmfDsD7PbMnnEYKLUqWgc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-NPJ8xQUvMS2eCihXJ5X4LQ-1; Thu, 09 Apr 2020 03:32:46 -0400
X-MC-Unique: NPJ8xQUvMS2eCihXJ5X4LQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 107578018CD;
 Thu,  9 Apr 2020 07:32:45 +0000 (UTC)
Received: from [10.36.113.222] (ovpn-113-222.ams2.redhat.com [10.36.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0681A0A7B;
 Thu,  9 Apr 2020 07:32:42 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com> <87sghdjf1y.fsf@mpe.ellerman.id.au>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <82376163-412f-e5bc-65f0-a37c129ecdf2@redhat.com>
Date: Thu, 9 Apr 2020 09:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87sghdjf1y.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> It's also not very pretty in dmesg.
>=20
> Before:
>=20
>   pseries-hotplug-mem: Attempting to hot-add 10 LMB(s)
>   pseries-hotplug-mem: Memory hot-add failed, removing any added LMBs
>   dlpar: Could not handle DLPAR request "memory add count 10"
>=20

Thanks for running it through the mill.

Here you test "hotadd", below you test "hot-remove". But yeah, there is
a change in the amount of dmesg.

> After:
>=20
>   pseries-hotplug-mem: Attempting to hot-remove 10 LMB(s)
>   page:c00c000001ca8200 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc00000072a080180
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 c00c000001cffd48 c000000781c51410 c000000793327=
580
>   raw: c00000072a080180 0000000001550001 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001cc4a80 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc00000079b110080
>   flags: 0x7ffff000000000()
>   raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000=
000
>   raw: c00000079b110080 0000000000000000 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001d08200 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc00000074208ff00
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 c000000781c5f150 c00c000001d37f88 c000000798a24=
880
>   raw: c00000074208ff00 0000000001550002 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001d40140 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc000000750059c00
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 c00c000001dfcfc8 c00c000001d3c288 c0000007851c2=
d00
>   raw: c000000750059c00 0000000001000003 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001d9c000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc000000002370080
>   flags: 0x7ffff000000000()
>   raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000=
000
>   raw: c000000002370080 0000000000000000 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001dc0200 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc000000002370080
>   flags: 0x7ffff000000000()
>   raw: 007ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000=
000
>   raw: c000000002370080 0000000000000000 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001e00000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0x0
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 5deadbeef0000100 5deadbeef0000122 c0000007a801f=
500
>   raw: 0000000000000000 0000000008000800 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001e40440 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0x0
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 5deadbeef0000100 5deadbeef0000122 c0000007a801e=
380
>   raw: 0000000000000000 0000000000400040 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000001e80000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc0000007a0000640
>   flags: 0x7ffff000000200(slab)
>   raw: 007ffff000000200 c00c000001e5af48 c00c000001e80408 c000000f42d00=
a00
>   raw: c0000007a0000640 00000000066600a2 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000003c89d40 refcount:2 mapcount:1 mapping:0000000018c4a547 =
index:0x10a41
>   anon flags: 0x17ffff000080024(uptodate|active|swapbacked)
>   raw: 017ffff000080024 5deadbeef0000100 5deadbeef0000122 c0000007986b0=
3c9
>   raw: 0000000000010a41 0000000000000000 0000000200000000 c00000000340b=
000
>   page dumped because: unmovable page
>   page->mem_cgroup:c00000000340b000
>   page:c00c000003cc0000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc000000f3000fd38
>   flags: 0x17ffff000000200(slab)
>   raw: 017ffff000000200 c000000f3c911890 c000000f3c911890 c00000079fffd=
980
>   raw: c000000f3000fd38 0000000000700003 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000003d00000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc0000007a2ec0000
>   flags: 0x17ffff000000000()
>   raw: 017ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000=
000
>   raw: c0000007a2ec0000 0000000000000000 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000003e2c000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0xc000000f8b008400
>   flags: 0x27ffff000000200(slab)
>   raw: 027ffff000000200 c000000f8e000190 c000000f8e000190 c0000007a801e=
380
>   raw: c000000f8b008400 0000000000400038 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   page:c00c000003fec000 refcount:1 mapcount:0 mapping:0000000018c4a547 =
index:0x0
>   flags: 0x37ffff000000000()
>   raw: 037ffff000000000 5deadbeef0000100 5deadbeef0000122 0000000000000=
000
>   raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000=
000
>   page dumped because: unmovable page
>   pseries-hotplug-mem: Memory hot-remove failed, adding LMB's back
>   dlpar: Could not handle DLPAR request "memory remove count 10"
>=20
>=20
>=20
> It looks like set_migratetype_isolate() and start_isolate_page_range()
> can be told not to report those warnings, but we're just calling
> device_offline() which doesn't let us specify that.

Yeah, but these messages can easily pop up (to a more limited degree)
with the current code as well, as checking for movable pages without
isolating the page range gives you no guarantees that no unmovable data
will end up on the lmb until you offline it. It's simply racy.

I discussed this output with Michal when we changed the
/sys/devices/system/memory/memoryX/removable behavior, and he had the
opinion that dmesg (debug) output should not really be an issue.

We could make this output

a) configurable at runtime and let powerpc code disable it while calling
device_offline(). So user space attempts will still trigger the messages

b) configurable at compile time


--=20
Thanks,

David / dhildenb

