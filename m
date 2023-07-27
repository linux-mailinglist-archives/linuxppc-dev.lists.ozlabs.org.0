Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D69357651BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 12:57:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bs32wHo/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBSQV5ZSMz3cQC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 20:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bs32wHo/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBSPf34zWz2yGm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:56:38 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C2D321B11;
	Thu, 27 Jul 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690455390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBj4cGQdUfaO0gEFLKE5gfaRoYQmAgMBhZy7l0DncPw=;
	b=Bs32wHo/vJlyXi4LNL7J8WxTQWyfU9jX5EAVkVlNnFij9rOAylREYV3bULFB6YVWfF5yVH
	Uu2J7XE6oZiB/7wjH7+M+qxPkxQbAx/tblKa8i+mPSuENGPIWtPIGQtJ2doe/lljq9NaMG
	PEaQUc3gDaAG1PX+yRT+YrFS67zjssY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AF7B13902;
	Thu, 27 Jul 2023 10:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Oj2MFl5NwmQwGgAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 27 Jul 2023 10:56:30 +0000
Date: Thu, 27 Jul 2023 12:56:29 +0200
From: Michal Hocko <mhocko@suse.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Message-ID: <ZMJNXfKdKul8tRCO@dhcp22.suse.cz>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
 <ZMI39umu4DZbQ8Iw@dhcp22.suse.cz>
 <b8068200-c692-79fc-3413-8dc05619e228@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8068200-c692-79fc-3413-8dc05619e228@linux.ibm.com>
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

On Thu 27-07-23 15:02:12, Aneesh Kumar K V wrote:
> On 7/27/23 2:55 PM, Michal Hocko wrote:
> > On Thu 27-07-23 13:32:31, Aneesh Kumar K.V wrote:
> >> With memmap on memory, some architecture needs more details w.r.t altmap
> >> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
> >> computing them again when we remove a memory block, embed vmem_altmap
> >> details in struct memory_block if we are using memmap on memory block
> >> feature.
> >>
> >> No functional change in this patch
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  drivers/base/memory.c  | 25 +++++++++++-------
> >>  include/linux/memory.h |  8 ++----
> >>  mm/memory_hotplug.c    | 58 +++++++++++++++++++++++++++---------------
> >>  3 files changed, 55 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> >> index b456ac213610..57ed61212277 100644
> >> --- a/drivers/base/memory.c
> >> +++ b/drivers/base/memory.c
> >> @@ -106,6 +106,7 @@ static void memory_block_release(struct device *dev)
> >>  {
> >>  	struct memory_block *mem = to_memory_block(dev);
> >>  
> >> +	WARN_ON(mem->altmap);
> > 
> > What is this supposed to catch? A comment would be handy so that we know
> > what to look at should it ever trigger.
> > 
> 
> I did add a comment where we clear the altmap in try_remove_memory(). I will also add
> more details here.
> 
> +			 * Mark altmap NULL so that we can add a debug
> +			 * check on memblock free.
>  			 */
> 
> WARN_ON is an indication of memory leak because if we have mem->altmap != NULL
> then the allocated altmap is not freed . It also indicate that memblock got freed
> without going through the try_remove_memory(). 

I think it would be better to be explicit here (who should free up but
hasn't).

-- 
Michal Hocko
SUSE Labs
