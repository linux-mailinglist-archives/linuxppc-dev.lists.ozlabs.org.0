Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C55116C2B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 12:17:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wgf90sjYzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 22:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WgbS455KzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 22:15:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="ICflxezx"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47WgbP58Jyz9sPT;
 Mon,  9 Dec 2019 22:15:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575890132;
 bh=ivv4mE7Cr1A3kfsmagNzfPIiXMkqIAmjoGySHTdZaAc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ICflxezxfXgKJj2TRHo09PDXTraGDxZcWeBZTgTzH+exDGc5sfNSJtteSmALMo6wo
 +xGFAmmj9EMgYtJ3g0PR0ekeoO+N6Ros3jf/BcrWAyrO/l4o8gkoBlcKNVA0BMNk3P
 BkExbGo9kBfcQIgVHiXmwUgsyIK/DcisYja4s0FeDH0xtkT0uTcayOAnq8ygAkMGN1
 MZuCTNGeZmxNUEu06CCARatSHqlxKRp4H9x3t3ZetkQduwregnmEb6ICzjAcUmeFnl
 vvHvM5TJNsW2k4oa3jTbFih+LomGYOdYWUulN+nXKTHZCDifgsXGktZo8oT5u56fT5
 Pew9Pt07D3rUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/2] mm: remove the memory isolate notifier
In-Reply-To: <990e19a3-b758-aaca-0ea2-c04e191cb6dc@redhat.com>
References: <20191114131911.11783-1-david@redhat.com>
 <990e19a3-b758-aaca-0ea2-c04e191cb6dc@redhat.com>
Date: Mon, 09 Dec 2019 22:15:28 +1100
Message-ID: <8736dtrbqn.fsf@mpe.ellerman.id.au>
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
Cc: Qian Cai <cai@lca.pw>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>, Pingfan Liu <kernelfans@gmail.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Arun KS <arunks@codeaurora.org>, Wei Yang <richardw.yang@linux.intel.com>,
 Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:
> On 14.11.19 14:19, David Hildenbrand wrote:
>> This is the MM part of
>> 	https://lkml.org/lkml/2019/10/31/487
>> 
>> "We can get rid of the memory isolate notifier by switching to balloon
>> compaction in powerpc's CMM (Collaborative Memory Management). The memory
>> isolate notifier was only necessary to allow to offline memory blocks that
>> contain inflated/"loaned" pages - which also possible when the inflated
>> pages are movable (via balloon compaction). [...]"
>> 
>> Michael queued the POWERPC bits that remove the single user, but I am
>> missing ACKs for the MM bits. I think it makes sense to let these two
>> patches also go via Michael's tree, to avoid collissions. Thoughts?
>
> The prereqs (powerpc bits) are upstream - I assume Michael didn't want
> to mess with MM patches.

Yes, sorry I meant to send you a mail saying so.

cheers
