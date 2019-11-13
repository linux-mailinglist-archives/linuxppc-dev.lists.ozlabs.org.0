Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147CFAB17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 08:37:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cc083DpbzF7Bp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 18:37:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b6a0ef5c1751a0763e03+5925+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="LNJe/uLK"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cbxw0FYqzF6qn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 18:35:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w81mLVUH+kMl9z6rXix29An8Vg8TBtLdHfGE4Bvr4U4=; b=LNJe/uLKQVyS9Bl6y6WwQp5oe
 rhYUV2JjoHfm8Y5vvtdVw3uuUUxyIYoGg2IWK26uCNzAqi6g57t56VPwIxwsMGQBqx8VqFL8V6Frr
 OJC0Ba7f/yBpt8Qby5mUwovEb0bUBAlw22lMChaSQX0p4DEqZaeBMnhWhxuUfjsxssoUvamG5bCHw
 zxBuhf1aIE7JzBYE0GAAnIsDD/zUyrBueFev/R3Yxf1NxsA2Dm013QJsCkmUFHCBzQrSpVxbzk7wn
 VS9uspp0SIGqdalmN6Ja4MCsTI/0ufcwEXnrE/DGsE1rzXx8wu+z5sasokmTRIT8B0A5wK955MQyr
 gQX+azQ4g==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUnBl-0008RU-Nm; Wed, 13 Nov 2019 07:35:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>
Subject: unify the dma_capable definition
Date: Wed, 13 Nov 2019 08:35:36 +0100
Message-Id: <20191113073539.9660-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

there is no good reason to have different version of dma_capable.
This series removes the arch overrides and also adds a few cleanups
in the same area.
