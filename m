Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CE7610C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:26:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RKVIVtfV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Cqf2yMxz3c5R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RKVIVtfV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=kirill.shutemov@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 25 Jul 2023 20:25:27 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Cpc04YHz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:25:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690280735; x=1721816735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z2JgSRr57QfGjyG/fWEsaikXL6iwmaxUOjUdDAVtI0A=;
  b=RKVIVtfVNyXGOZAdRGgKuAERGkMtUlvf/CPBsm+zBu8E4WZnwY8HwCh5
   lka+USeFPocOV0SoPAwsbsGsgsw9FVjU8pwi7gnsT35so7RQ3Ovg1xglq
   Agt4aGeky9tcSBn7BfWLDu0JkbVSQp19eniDoyNRLxb2/m3C3XMRcfmIk
   Pi6Eo2dZKc7attnEHcxDUrctV80oOa964n+gYf+muLAzAxS+iR7GuVila
   HPfC4VXxTi3Lt7VigpEl5/CzAdv8qyN7tRSVIXhcijatFnjx1A8jOWS5W
   x1LaAEZUNPCVM9cHrwrQdd0eyT931nlt5veriH8UQnv/QTDu0kPcFIUmc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347956832"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="347956832"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="1056753039"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="1056753039"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.57.129])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:24:05 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 171E4103A12; Tue, 25 Jul 2023 13:24:03 +0300 (+03)
Date: Tue, 25 Jul 2023 13:24:03 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Message-ID: <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-11-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, l
 inux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> diff --git a/mm/compaction.c b/mm/compaction.c
> index dbc9f86b1934..a3d2b132df52 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
>  			goto isolate_fail_put;
>  
> +		/* The mapping truly isn't movable. */
> +		if (mapping && mapping_unmovable(mapping))
> +			goto isolate_fail_put;
> +

I doubt that it is safe to dereference mapping here. I believe the folio
can be truncated from under us and the mapping freed with the inode.

The folio has to be locked to dereference mapping safely (given that the
mapping is still tied to the folio).

Vlastimil, any comments?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
