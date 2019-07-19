Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C342E6E17A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:12:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhzL1nC3zDqNG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:12:46 +1000 (AEST)
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
 header.b="YxP9Bk+x"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhwV3G4lzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fCAFMFVKMsCRL+nAdt1jODuT5j2EQrIWmLalmZbKK9k=; b=YxP9Bk+xTWvC4oCTSSmPrzmk1J
 sCpTnNygkbtUu6hvWQP2IFukEFZE2uR/ugS6avDtpbvlHmLpTRQ++VQobeSnyU7MhG4fbBK7xu1BN
 zD2W2YhoSB//HXSFrcKafHM2hcWqNBZG13XiQmKJYqciLVPo2JF05k+veg7HwGM4HFBnc+JUo5mkC
 pIW8PrHfuWDnyCYvKFIx6/JhzVS18JvG9EsGTdzYVl3OXvacZraoipY9bh/ixusMZ77dqJHF5ZTdT
 UGIT8GaeTbpy4P1I9vy1lwsT7bR5SLY/VLdxh1GTspV9HyfyWZF5IlGrRNP2nLc05DsxiW7MNhsq7
 5wVBFcUQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hoN1y-0001sp-FA; Fri, 19 Jul 2019 07:10:14 +0000
Date: Fri, 19 Jul 2019 00:10:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: question on "powerpc/pseries/dma: Allow SWIOTLB"
Message-ID: <20190719071014.GA1922@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey Alexey,

what is the use case for the above commit?  Shouldn't we handle all
addressing limits using the iommu?
