Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F513CED4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 22:21:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ygJ34Bt4zDqT3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 08:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64;
 helo=hqnvemgate25.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=jj9z8sIt; dkim-atps=neutral
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ygFc14PgzDqKq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 08:19:47 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1f81da0000>; Wed, 15 Jan 2020 13:19:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 15 Jan 2020 13:19:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 15 Jan 2020 13:19:42 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 21:19:42 +0000
Subject: Re: [PATCH v12 04/22] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Christoph Hellwig <hch@infradead.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <20200107224558.2362728-5-jhubbard@nvidia.com>
 <20200115152306.GA19546@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <4707f191-86f8-db4a-c3de-0a84b415b658@nvidia.com>
Date: Wed, 15 Jan 2020 13:19:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200115152306.GA19546@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579123162; bh=GeG6npnwyerPXrXB3bHbzqY7iBJ1oGmlF7ZkUct1x7k=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jj9z8sItAejAXuqLJp407Y0oGvSfSmMgC2Khnl/UaD4X75Jfs+E4VVRGeSQsgj4wP
 14n675+NVsxapYKvaJVbv9kK8eZuWxvO3Y6Z1FaTdzbTeZYm8ghKmuNIE5C0gACdNX
 GRKd75x36rcOJr0kw/HdaVzIwMxuti46gF1ZGWWpciXiVKzpgvI3qlfJhfyWO1skXq
 uplmy/sgWDjhYQkuOFvVaYpZjSy0ueb1q0Sh/SzXH1k9SEC0ZieDiM/hkNzj/S5EwR
 OOf7dWtMC6wOQv1+ifMLfIwYfX7dbiwP1/6cV/7beAaEJMsZqU2lquKgjSAKnqyNBE
 3XR6j/+C8nurA==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/15/20 7:23 AM, Christoph Hellwig wrote:
...
> 
> I'm really not sold on this scheme.  Note that I think it is
> particularly bad, but it also doesn't seem any better than what
> we had before, and it introduced quite a bit more code.
> 

Hi Christoph,

All by itself, yes. But the very next patch (which needs a little 
rework for other reasons, so not included here) needs to reuse some of 
these functions within __unpin_devmap_managed_user_page():

    page_is_devmap_managed()
    free_devmap_managed_page()

That patch was posted as part of the v11 series [1], and it did this:

+#ifdef CONFIG_DEV_PAGEMAP_OPS
+static bool __unpin_devmap_managed_user_page(struct page *page)
+{
+	int count;
+
+	if (!page_is_devmap_managed(page))
+		return false;
+
+	count = page_ref_sub_return(page, GUP_PIN_COUNTING_BIAS);
+
+	__update_proc_vmstat(page, NR_FOLL_PIN_RETURNED, 1);
+	/*
+	 * devmap page refcounts are 1-based, rather than 0-based: if
+	 * refcount is 1, then the page is free and the refcount is
+	 * stable because nobody holds a reference on the page.
+	 */
+	if (count == 1)
+		free_devmap_managed_page(page);
+	else if (!count)
+		__put_page(page);
+
+	return true;
+}
+#else
+static bool __unpin_devmap_managed_user_page(struct page *page)
+{
+	return false;
+}
+#endif /* CONFIG_DEV_PAGEMAP_OPS */
+
+/**
+ * unpin_user_page() - release a dma-pinned page
+ * @page:            pointer to page to be released
+ *
+ * Pages that were pinned via pin_user_pages*() must be released via either
+ * unpin_user_page(), or one of the unpin_user_pages*() routines. This is so
+ * that such pages can be separately tracked and uniquely handled. In
+ * particular, interactions with RDMA and filesystems need special handling.
+ */
+void unpin_user_page(struct page *page)
+{
+	page = compound_head(page);
+
+	/*
+	 * For devmap managed pages we need to catch refcount transition from
+	 * GUP_PIN_COUNTING_BIAS to 1, when refcount reach one it means the
+	 * page is free and we need to inform the device driver through
+	 * callback. See include/linux/memremap.h and HMM for details.
+	 */
+	if (__unpin_devmap_managed_user_page(page))
+		return;
+
+	if (page_ref_sub_and_test(page, GUP_PIN_COUNTING_BIAS))
+		__put_page(page);
+
+	__update_proc_vmstat(page, NR_FOLL_PIN_RETURNED, 1);
+}
+EXPORT_SYMBOL(unpin_user_page);


[1] https://lore.kernel.org/r/20191216222537.491123-24-jhubbard@nvidia.com  
    [PATCH v11 23/25] mm/gup: track FOLL_PIN pages

thanks,
-- 
John Hubbard
NVIDIA
