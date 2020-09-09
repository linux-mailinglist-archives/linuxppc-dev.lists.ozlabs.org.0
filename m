Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C59262DC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 13:26:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmfq84pvRzDqBV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 21:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmfmV0rx2zDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 21:24:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SmXDZKzA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmfmN3SGmz9sTd;
 Wed,  9 Sep 2020 21:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599650649;
 bh=McxY0vGyvNVlrIIx6KzYtU4PcHnFzd9G9dek0Ykf36c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SmXDZKzAAkIskfZPfi7qrbi2STOAaRgkLgLUwpRIri563PnPrs5blw/OlSwl2MX5i
 69HKj9JHLONl1Qz3CbYvZy/4cbddpiJHmROqXSbmg8WJh+BTuQXH9dKNRHILZpAo1t
 hze5cgR0ZcFpNy/5f5QSzsCR/ywLKY3MFV1MB2evwZ2HPd+YxWui6TnWbMXUjz3bFE
 Dflejkj7ciOj6dUGOWs0UizA/kfuOX43D8JH9M1T139ttlnt9G8+OPWPLzwt3iVOxx
 uuXIzjXH4T67FDy3bvc2QCqjoeC0dD5axnVjQL4imxfeD2KhwwbuLyb1WJFKSm2qYS
 /CHKbJLh3kYdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] mm/memory_hotplug: prepare passing flags to
 add_memory() and friends
In-Reply-To: <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-4-david@redhat.com> <20200909071759.GD435421@kroah.com>
 <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
Date: Wed, 09 Sep 2020 21:24:02 +1000
Message-ID: <87eenbry5p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org,
 Heiko Carstens <hca@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Libor Pechacek <lpechacek@suse.cz>, linux-nvdimm@lists.01.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> On 09.09.20 09:17, Greg Kroah-Hartman wrote:
>> On Tue, Sep 08, 2020 at 10:10:08PM +0200, David Hildenbrand wrote:
>>> We soon want to pass flags, e.g., to mark added System RAM resources.
>>> mergeable. Prepare for that.
>> 
>> What are these random "flags", and how do we know what should be passed
>> to them?
>> 
>> Why not make this an enumerated type so that we know it all works
>> properly, like the GPF_* flags are?  Passing around a random unsigned
>> long feels very odd/broken...
>
> Agreed, an enum (mhp_flags) seems to give a better hint what can
> actually be passed. Thanks!

You probably know this but ...

Just using a C enum doesn't get you any type safety.

You can get some checking via sparse by using __bitwise, which is what
gfp_t does. You don't actually have to use an enum for that, it works
with #defines also.

Or you can wrap the flag in a struct, the way atomic_t does, and then
the compiler will prevent passing plain integers in place of your custom
type.

cheers
