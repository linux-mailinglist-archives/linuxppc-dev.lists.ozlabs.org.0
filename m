Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376B764F9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:26:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LQaLxXqi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBQP328W8z3cRK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LQaLxXqi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBQNB4Qqtz3c3C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:25:13 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2D751F383;
	Thu, 27 Jul 2023 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690449910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoQwkBmT1hyeapFwp/0+cDin0BjEYAjkQ4/FeLmHSp8=;
	b=LQaLxXqiZ+u0anFqzvE4WU+pTxV/aJXBb1yG+TbXXnZb7h22/YtntjxTQ4yY/gFg4wC/on
	Xaw0soB/AUEhd1+kUoHh9FgVaEV1f8tnpO291+dFschB65/AO6yN0QpsIpEoK+1iPSJMuI
	5Iz6tGQsIY/QiUxsU+O0cPQEK99UriQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4149138E5;
	Thu, 27 Jul 2023 09:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tn3lLPY3wmQvawAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 27 Jul 2023 09:25:10 +0000
Date: Thu, 27 Jul 2023 11:25:10 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Message-ID: <ZMI39umu4DZbQ8Iw@dhcp22.suse.cz>
References: <20230727080232.667439-1-aneesh.kumar@linux.ibm.com>
 <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727080232.667439-7-aneesh.kumar@linux.ibm.com>
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

On Thu 27-07-23 13:32:31, Aneesh Kumar K.V wrote:
> With memmap on memory, some architecture needs more details w.r.t altmap
> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
> computing them again when we remove a memory block, embed vmem_altmap
> details in struct memory_block if we are using memmap on memory block
> feature.
> 
> No functional change in this patch
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/base/memory.c  | 25 +++++++++++-------
>  include/linux/memory.h |  8 ++----
>  mm/memory_hotplug.c    | 58 +++++++++++++++++++++++++++---------------
>  3 files changed, 55 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index b456ac213610..57ed61212277 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -106,6 +106,7 @@ static void memory_block_release(struct device *dev)
>  {
>  	struct memory_block *mem = to_memory_block(dev);
>  
> +	WARN_ON(mem->altmap);

What is this supposed to catch? A comment would be handy so that we know
what to look at should it ever trigger.

>  	kfree(mem);
>  }
-- 
Michal Hocko
SUSE Labs
