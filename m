Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D581A4C0D91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:47:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3SnH1dGpz3bb4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KuGl+SxV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+94e795790efaf498204f+6758+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=KuGl+SxV; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3SmY5dbpz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iy5Ofm6AWn5S0+TPzZqllkgh84EUFfIT9WUD1UClXn4=; b=KuGl+SxVwgaXgh5hLAVT1UAi4x
 Mdf6Uz6m2y23+0SrvtSnU9O8BhDGXxKAatQH1UV+1HLTZS6EKiTcNTlvQr6XJI6pv0KEXE3xvFiKZ
 R/Jky7QdCF8UDa+v3Z/QM6f/ERD1b/x8syFTQf7TpLLbwqST8AacGpmpD66qiLMZMpUOKXyZjimX2
 dqd43SyR3QIvd4Ydjgs3/d/7SKJAn7H0MEg/DJhCNfnBiuUH1CugGaRKAQv+oCwF98QBvMo4HOU/T
 ucaRKTd4ozFy8kNCn3ThNjnNyyDuUTB+nnvKoGQIx86jvBLxFv0AD8qU8mHYnOj4lkd3DtKX03IFR
 DEkug9Yw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nMmLj-00DALX-99; Wed, 23 Feb 2022 07:46:11 +0000
Date: Tue, 22 Feb 2022 23:46:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Message-ID: <YhXmQwvjMFPQFPUr@infradead.org>
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

Hi Christophe,

do you know what the state is in current linux-next?

I think we'll just want to queue up anything left at this point in the
dma-mapping or PCI tree and get it done.
