Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566F7651B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 12:56:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HoIxeaM2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBSP11Bcmz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 20:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HoIxeaM2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBSN70vbsz3cJS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:55:17 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B9371F37C;
	Thu, 27 Jul 2023 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690455308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03ocS2CkLhvohMqLX/92YU/WWyH6YW59W+34dQnBH7s=;
	b=HoIxeaM2rz7MaAKAhiqORT7me6xBbcPKIr31jxIYx8uWwbVWYrSTo8dPykyD9QOXdZQQWX
	HQYMsbxEbe78wrPz2+FV4yMp8GXACgiMk1lYEHkcD3+ymg4i1eUJW2dR3f75WAGUOO4j8L
	rR+3y1YahibbdCfuIK14UoE+Qric6F0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48D8013902;
	Thu, 27 Jul 2023 10:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NyvYDgxNwmRNGQAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 27 Jul 2023 10:55:08 +0000
Date: Thu, 27 Jul 2023 12:55:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 4/7] mm/memory_hotplug: Support memmap_on_memory when
 memmap is not aligned to pageblocks
Message-ID: <ZMJNC7F+BsOj6YDV@dhcp22.suse.cz>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-5-aneesh.kumar@linux.ibm.com>
 <ZMI3o8k/+QKbhRol@dhcp22.suse.cz>
 <f977e09b-6a09-901f-96c3-e59cd0b3470c@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f977e09b-6a09-901f-96c3-e59cd0b3470c@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 27-07-23 14:57:17, Aneesh Kumar K V wrote:
> On 7/27/23 2:53 PM, Michal Hocko wrote:
> > On Thu 27-07-23 13:32:29, Aneesh Kumar K.V wrote:
> > [...]
> >> +	if (mode == MEMMAP_ON_MEMORY_FORCE) {
> >> +		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
> >> +
> >> +		pr_info_once("Memory hotplug will reserve %ld pages in each memory block\n",
> >> +			     memmap_pages - PFN_UP(memory_block_memmap_size()));
> >> +	}
> >> +	return 0;
> >> +}
> > 
> > Why should we print this only for the forced case? Isn't that
> > interesting for any on memory memmap? Also is this the above sufficient
> > on its own? the size depends on the block size and that can vary.
> > I think it would make more sense to print the block size and the vmemmap
> > reservation and for the force case also any wasted amount on top (if
> > any).
> > 
> 
> For the other cases the space is completely used by for struct page allocation. What
> the information is indicating here is that for each memblock we add we are loosing/wasting so many pages. 
> May be I should have used the term "waste" instead of "reserve" ?

OK, so I have clearly misread and it just confirms this would benefit
from a clarification. In any case I still think that it would be
benefitial to also report how much of the memory is used for vmemmap on
the hotplugged memory. Maybe as a separate patch.
-- 
Michal Hocko
SUSE Labs
