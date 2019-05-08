Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8E182DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 02:29:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zvNb3sN5zDqQF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 10:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.com
 (client-ip=195.135.221.5; helo=smtp.nue.novell.com;
 envelope-from=osalvador@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
X-Greylist: delayed 1213 seconds by postgrey-1.36 at bilbo;
 Thu, 09 May 2019 09:29:51 AEST
Received: from smtp.nue.novell.com (smtp.nue.novell.com [195.135.221.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zt3z2lnNzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 09:29:48 +1000 (AEST)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 01:09:30 +0200
Received: from [192.168.1.138] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 00:09:14 +0100
Message-ID: <1557356938.3028.35.camel@suse.com>
Subject: Re: [PATCH v2 5/8] mm/memory_hotplug: Drop MHP_MEMBLOCK_API
From: osalvador <osalvador@suse.com>
To: David Hildenbrand <david@redhat.com>, Dan Williams
 <dan.j.williams@intel.com>
Date: Thu, 09 May 2019 01:08:58 +0200
In-Reply-To: <edd762a1-c012-fe05-a72e-2505cd98188a@redhat.com>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-6-david@redhat.com>
 <CAPcyv4ge1pSOopfHof4USn=7Skc-UV4Xhd_s=h+M9VXSp_p1XQ@mail.gmail.com>
 <d83fec16-ceff-2f6f-72e1-48996187d5ba@redhat.com>
 <CAPcyv4iRQteuT9yESvbUyhp3KVVgTXDiGAo+TwPCM_4f0CzBgg@mail.gmail.com>
 <edd762a1-c012-fe05-a72e-2505cd98188a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 May 2019 10:26:55 +1000
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux-sh <linux-sh@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-08 at 09:39 +0200, David Hildenbrand wrote:
> However I haven't really thought it through yet, smalles like that
> could
> as well just be handled by the caller of
> arch_add_memory()/arch_remove_memory() eventually, passing it via
> something like the altmap parameter.
> 
> Let's leave it in place for now, we can talk about that once we have
> new
> patches from Oscar.
Hi David,

I plan to send a new patchset once this is and Dan's are merged,
otherwise I will have a mayhem with the conflicts.

I also plan/want to review this patchset, but time is tight this week.

