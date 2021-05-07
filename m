Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5873764BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 13:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc86P58CTz300J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 21:55:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=s7+ZERky;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=s7+ZERky; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc85w6qnSz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 21:55:31 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620388527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVo4dmnTS1B3YIat+/C81/Fhwd2ollcjvflB6s+6QMM=;
 b=s7+ZERkyEG2++IavH8Rzs4k3w933FNTyYNdb8CFD/nI3YXBbqrAyrCCsjKHgbK1lNbWE9r
 xYHdOfjETLkMTyWmPsTrvf41JNPbzOfWO1uA2GUq7dL9LLMPcxY1jp14+IuRwVnVg4Q7Qa
 IVwzVTvDsktZvsRj+t9jh+HvpYT86Rg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D06EB159;
 Fri,  7 May 2021 11:55:27 +0000 (UTC)
Date: Fri, 7 May 2021 13:55:24 +0200
From: Michal Hocko <mhocko@suse.com>
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Message-ID: <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[I haven't read through respective patches due to lack of time but let
 me comment on the general idea and the underlying justification]

On Thu 06-05-21 17:31:09, David Hildenbrand wrote:
> On 06.05.21 17:26, Zi Yan wrote:
> > From: Zi Yan <ziy@nvidia.com>
> > 
> > Hi all,
> > 
> > This patchset tries to remove the restriction on memory hotplug/hotremove
> > granularity, which is always greater or equal to memory section size[1].
> > With the patchset, kernel is able to online/offline memory at a size independent
> > of memory section size, as small as 2MB (the subsection size).
> 
> ... which doesn't make any sense as we can only online/offline whole memory
> block devices.

Agreed. The subsection thingy is just a hack to workaround pmem
alignement problems. For the real memory hotplug it is quite hard to
argue for reasonable hotplug scenarios for very small physical memory
ranges wrt. to the existing sparsemem memory model.
 
> > The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
> > size without increasing memory hotplug/hotremove granularity at the same time,
> 
> Gah, no. Please no. No.

Agreed. Those are completely independent concepts. MAX_ORDER is can be
really arbitrary irrespective of the section size with vmemmap sparse
model. The existing restriction is due to old sparse model not being
able to do page pointer arithmetic across memory sections. Is there any
reason to stick with that memory model for an advance feature you are
working on?
-- 
Michal Hocko
SUSE Labs
