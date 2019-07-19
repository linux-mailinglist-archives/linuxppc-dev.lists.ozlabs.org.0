Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C004A6E20A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:56:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qjxk1bN9zDqng
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+0127b854950d050a2cef+5808+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="hQKpsRV9"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qjtm08rczDqsq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:53:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qHj/6pNPEwWWuV9woTW9uKbYACUydwzNXUd0+DeO4ME=; b=hQKpsRV9hIN5Alld14uj/HQdM
 xsMnTZIdWwVb1i4wsIw+1tN8agi/HZjEGq5vXzaSho0+UrEFV/sQE+kDVf3Hzie39GXjxbttHxB1u
 awGMyfbFv5lDvBOhxdOEOaeQapK4Rd3vGEZFNiGQDCuo8jWjvP+zI1is8Bh2CpimBraXIWLX+CS9+
 dsSHKCBhltf1eZOwYCoD9MlVIwpcqF4g2TAngRRGMx9SULHV8r085ks9XHvVlFHnZ4d0W/H5MSMmx
 zXLvUyVAySRWTaynDTSXy7fEskd6l8fBMPwRAR2xJK+ry3FKjzs26T9nXfezqDhgch7bWE7rNopQp
 2mexL95Yg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hoNi8-0003g4-B0; Fri, 19 Jul 2019 07:53:48 +0000
Date: Fri, 19 Jul 2019 00:53:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: question on "powerpc/pseries/dma: Allow SWIOTLB"
Message-ID: <20190719075348.GA2892@infradead.org>
References: <20190719071014.GA1922@infradead.org>
 <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2019 at 05:52:37PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 19/07/2019 17:10, Christoph Hellwig wrote:
> > Hey Alexey,
> > 
> > what is the use case for the above commit?  Shouldn't we handle all
> > addressing limits using the iommu?
> 
> Our secure VMs is the use case, when only a fraction of system memory is
> available for DMA.

But shouldn't we force usage of the direct ops in that case as the
IOMMU is not neededed at all?  Also isn't that support non-upstream so
far?
