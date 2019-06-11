Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109A3C91B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 12:39:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NRM82NS3zDq6q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 20:39:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NRKC0Cl2zDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 20:37:33 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB1C8AD12;
 Tue, 11 Jun 2019 10:37:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1C7AE1E3E26; Tue, 11 Jun 2019 12:37:29 +0200 (CEST)
Date: Tue, 11 Jun 2019 12:37:29 +0200
From: Jan Kara <jack@suse.cz>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 3/6] mm/nvdimm: Add page size and struct page size to
 pfn superblock
Message-ID: <20190611103729.GA27635@quack2.suse.cz>
References: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
 <20190604091357.32213-3-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604091357.32213-3-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-mm@kvack.org, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 04-06-19 14:43:54, Aneesh Kumar K.V wrote:
> This is needed so that we don't wrongly initialize a namespace
> which doesn't have enough space reserved for holding struct pages
> with the current kernel.
> 
> We also increment PFN_MIN_VERSION to make sure that older kernel
> won't initialize namespace created with newer kernel.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
...
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 00c57805cad3..e01eee9efafe 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -467,6 +467,15 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  	if (__le16_to_cpu(pfn_sb->version_minor) < 2)
>  		pfn_sb->align = 0;
>  
> +	if (__le16_to_cpu(pfn_sb->version_minor) < 3) {
> +		/*
> +		 * For a large part we use PAGE_SIZE. But we
> +		 * do have some accounting code using SZ_4K.
> +		 */
> +		pfn_sb->page_struct_size = cpu_to_le16(64);
> +		pfn_sb->page_size = cpu_to_le32(SZ_4K);
> +	}
> +
>  	switch (le32_to_cpu(pfn_sb->mode)) {
>  	case PFN_MODE_RAM:
>  	case PFN_MODE_PMEM:

As we discussed with Aneesh privately, this actually means that existing
NVDIMM namespaces on PPC64 will stop working due to these defaults for old
superblocks. I don't think that's a good thing as upgrading kernels is
going to be nightmare due to this on PPC64. So I believe we should make
defaults for old superblocks such that working setups keep working without
sysadmin having to touch anything.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
