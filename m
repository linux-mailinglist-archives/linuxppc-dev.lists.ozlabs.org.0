Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78DECA24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 22:06:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474ZWC24ZWzF15Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 08:06:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="hDrqjZRs"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474XGk3ykWzF761
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 06:25:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572636346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjjm7Uw5loPShvkS5aQcZzMu+cIOGO3TF0cBurKv6Fo=;
 b=hDrqjZRskOEpHOV2LA5kveI03177TyfzmHbUXtfRBT4GpD7UGodxUkTsG0p6XgchjjaEor
 7bSXNwVgvY9UyBaDwxAHSGlj6wzXctVMBz4W6PimhAqC1t87OpsuAEXu+AyeFgkH9xCY0o
 KvLRnjgkACKRlmlUdrTfL51neFFrRAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-GxUhE1sJOai6Nmi9ZYzjFA-1; Fri, 01 Nov 2019 15:25:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC95111;
 Fri,  1 Nov 2019 19:25:30 +0000 (UTC)
Received: from [10.36.116.26] (ovpn-116-26.ams2.redhat.com [10.36.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D01719C58;
 Fri,  1 Nov 2019 19:24:44 +0000 (UTC)
Subject: Re: [PATCH v1 00/10] mm: Don't mark hotplugged pages PG_reserved
 (including ZONE_DEVICE)
To: linux-kernel@vger.kernel.org
References: <20191024120938.11237-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8564fdc7-9a82-6455-50a8-6943cfd6b885@redhat.com>
Date: Fri, 1 Nov 2019 20:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: GxUhE1sJOai6Nmi9ZYzjFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 02 Nov 2019 08:00:22 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.10.19 14:09, David Hildenbrand wrote:
> This is the result of a recent discussion with Michal ([1], [2]). Right
> now we set all pages PG_reserved when initializing hotplugged memmaps. Th=
is
> includes ZONE_DEVICE memory. In case of system memory, PG_reserved is
> cleared again when onlining the memory, in case of ZONE_DEVICE memory
> never.
>=20
> In ancient times, we needed PG_reserved, because there was no way to tell
> whether the memmap was already properly initialized. We now have
> SECTION_IS_ONLINE for that in the case of !ZONE_DEVICE memory. ZONE_DEVIC=
E
> memory is already initialized deferred, and there shouldn't be a visible
> change in that regard.
>=20
> One of the biggest fears were side effects. I went ahead and audited all
> users of PageReserved(). The details can be found in "mm/memory_hotplug:
> Don't mark pages PG_reserved when initializing the memmap".
>=20
> This patch set adapts all relevant users of PageReserved() to keep the
> existing behavior in respect to ZONE_DEVICE pages. The biggest part part
> that needs changes is KVM, to keep the existing behavior (that's all I
> care about in this series).
>=20
> Note that this series is able to rely completely on pfn_to_online_page().
> No new is_zone_device_page() calles are introduced (as requested by Dan).
> We are currently discussing a way to mark also ZONE_DEVICE memmaps as
> active/initialized - pfn_active() - and lightweight locking to make sure
> memmaps remain active (e.g., using RCU). We might later be able to conver=
t
> some suers of pfn_to_online_page() to pfn_active(). Details can be found
> in [3], however, this represents yet another cleanup/fix we'll perform
> on top of this cleanup.
>=20
> I only gave it a quick test with DIMMs on x86-64, but didn't test the
> ZONE_DEVICE part at all (any tips for a nice QEMU setup?). Also, I didn't
> test the KVM parts (especially with ZONE_DEVICE pages or no memmap at all=
).
> Compile-tested on x86-64 and PPC.
>=20

Jeff Moyer ran some NVDIMM test cases for me (thanks!!!), including=20
xfstests, pmdk, and ndctl. No regressions found.

I will run some KVM tests, especially NDIMM passthrough, but will have=20
to setup a test environment first.

I would appreciate some review in the meantime. :)

--=20

Thanks,

David / dhildenb

