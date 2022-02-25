Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65B4C4A88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 17:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4w5R3HStz3bb7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 03:21:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHdUVHs4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+6b5af05920c596b7f535+6760+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4w4g2lT8z2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 03:21:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FZ+MIKFcY92n2eEbmV05gJlf+p4zCLQ/l4UmfykudCI=; b=OHdUVHs4ssN+cZff1Cz5+pI0bS
 ACNDnitCkCgOeMfk5gHAdYVGGQ6ME1qo4qkJR7TLTp2sJqfXgC26sejwftaWRuLSQ2QgdEaTHgKcS
 LumBh6cyD5rIHpzntIup3R4VIph/iP/IlDryFo7261s9jLf+pgqyQuTn/+hNcDMQY4jujjArIhda2
 TF4OI8Z1yT7KkgU/aiDktotaDlqJVWouebA4emJYnv0RIB8s5A0kdloko8BGbhBYl2zUpg8dVEWaQ
 +xZrdNzW+wzeWegSUfiXFYR5A0q3GL3p/8ExZszbBLmFxq2xIrxmNwTCzjjZtgaXkpm+Zzz73lf8O
 f+1824/A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nNdK8-005sWo-3G; Fri, 25 Feb 2022 16:20:04 +0000
Date: Fri, 25 Feb 2022 08:20:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Message-ID: <YhkBtBdBhvCAtNH9@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
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
Cc: airlied@linux.ie, trix@redhat.com, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, paulus@samba.org, sparclinux@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org,
 sathya.prakash@broadcom.com, hch@infradead.org,
 MPT-FusionLinux.pdl@broadcom.com, hao.wu@intel.com, arnd@arndb.de,
 suganath-prabu.subramani@broadcom.com, sreekanth.reddy@broadcom.com,
 ink@jurassic.park.msu.ru, bhelgaas@google.com, mchehab@kernel.org,
 mattst88@gmail.com, rth@twiddle.net, awalls@md.metrocast.net,
 linux-kernel@vger.kernel.org, davem@davemloft.net, alex.bou9@gmail.com,
 vkoul@kernel.org, linux-alpha@vger.kernel.org, dmaengine@vger.kernel.org,
 mdf@kernel.org, akpm@linux-foundation.org, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've applied patches 1,5,6,8 and 9 to the dma-mapping tree.
