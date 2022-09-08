Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 039175B2402
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 18:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNlbF6b7mz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 02:54:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kNBPUJoY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kNBPUJoY;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNlZY2bcDz2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 02:53:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wbmln1kNR8hccItKJCnaBOvzDTVXLhiF2eeXL7RfOdI=; b=kNBPUJoYroA5CfTIFh1rNg8JFg
	zvLWUK9xW6DknydoZv0ZcuDLCxx6OVKDkzFzsJ3O31nnfOApNaKIKoniPycWmIj7V9R68Lrck5ocI
	z02G3Kbb+maqNEAj/Drn9u6GGvvG8nuoUZlEMnPvOSVGk+Pt2w3u7tOLfNmqQzWRTSn1qkELxrDbB
	HR7hM7o6IgwIClt7nXDgK9wqY8ZcOuD857XMNUxEFbOpDy0KLaTdq520qith2gdKh4KyURGg+PlVj
	63j0OML/QTh4q7ZWc3etjWlvfzVweV3yLhLrwIaSnQQjtZ0J/GjguY2kw8ZCtCGWvB+W4qHfcryOx
	KMyRAYYg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKmb-00CVbD-Tc; Thu, 08 Sep 2022 16:53:41 +0000
Date: Thu, 8 Sep 2022 17:53:41 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH] fs/hugetlb: Fix UBSAN warning reported on hugetlb
Message-ID: <YxoeFUW5HFP/3/s1@casper.infradead.org>
References: <20220908072659.259324-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908072659.259324-1-aneesh.kumar@linux.ibm.com>
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
Cc: David Howells <dhowells@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 08, 2022 at 12:56:59PM +0530, Aneesh Kumar K.V wrote:
> +++ b/fs/dax.c
> @@ -1304,7 +1304,7 @@ EXPORT_SYMBOL_GPL(dax_zero_range);
>  int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  		const struct iomap_ops *ops)
>  {
> -	unsigned int blocksize = i_blocksize(inode);
> +	size_t blocksize = i_blocksize(inode);
>  	unsigned int off = pos & (blocksize - 1);

If blocksize is larger than 4GB, then off also needs to be size_t.

> +++ b/fs/iomap/buffered-io.c
> @@ -955,7 +955,7 @@ int
>  iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  		const struct iomap_ops *ops)
>  {
> -	unsigned int blocksize = i_blocksize(inode);
> +	size_t blocksize = i_blocksize(inode);
>  	unsigned int off = pos & (blocksize - 1);

Ditto.

(maybe there are others; I didn't check closely)
