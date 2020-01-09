Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC8135B47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 15:24:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tpJw1qKdzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 01:24:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c54e6258ca1ed75bca66+5982+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tpGj0XgGzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 01:22:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DxwGKPgO3D2IF3vBmmjgp81bFThWYwYhX5RdXbco5Vo=; b=B/NJisdCPQlvKBnTqKVFtn2Go
 NAg3mAMBmiN3dBFD8HAHKGw5ee+Ur9TD1HKyNvo+32i/1abY6CP2Ru/6fLY3gFHq209m04Xh3cBci
 jr+snZNNUC5MR+kYlsBiz5Ngw+VLANGRmFWYtq3EtsqFn5qW0eDDiEbjs60yj4kJ7m0O4pNs3v7Ie
 utaeWhVrty7kE6rbBn/yUyUiM1VnzaxNYRRGqLkyYvGe7XwQOT2pY6WFGk5flU9TqWIc2d5fFJYe8
 xx/2P49Gsio08YULRWfK+RrcUVEVVrKoECNvRBcvCn6D7J7BS+1nm6Dsf119Q7sqpK77yOFgt9tio
 sKS2iXZew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ipYhW-0005xu-97; Thu, 09 Jan 2020 14:22:18 +0000
Date: Thu, 9 Jan 2020 06:22:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
Message-ID: <20200109142218.GA16477@infradead.org>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578560245.30409.0.camel@abdul.in.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 jcmvbkbc@gmail.com, linux-next <linux-next@vger.kernel.org>,
 Oliver <oohall@gmail.com>, "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 09, 2020 at 02:27:25PM +0530, Abdul Haleem wrote:
> + CC Christoph Hellwig

The only thing this commit changed for the dma coherent case (which
ppc64 uses) is that we now look up the page to free by the DMA address
instead of the virtual address passed in.  Which suggests this call
stack passes in a broken dma address.  I suspect we somehow managed
to disable the ppc iommu bypass mode after allocating memory, which
would cause symptoms like this, and thus the commit is just exposing
a pre-existing problem.
