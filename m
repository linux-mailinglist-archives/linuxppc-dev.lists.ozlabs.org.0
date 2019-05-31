Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6943127D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 18:35:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FqnH6FmCzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 02:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+1238baab1fee290d454e+5759+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="kOSaHrM1"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FqlQ5tdQzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 02:33:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WTUY7NBoeWu3HANU6zgkoF6y+9haCI+guBTHb7hiLQ4=; b=kOSaHrM1/+3xoN7VP+2/XAyIb
 e2QtjGyy6cSvbl/o1vYjkLd9UlvTqQ3mm0osfb8rbpd5JocxX/TJ8slNK25rmAkmmpzM7HgwR2+eh
 WhiVeFQoAkEXli0htbkyT8C4xqyupYhtfraT2e/HuM2PihzxLv41Zp/zyI/Twlegfm0D7EkDYyPFc
 Urxd8U+ppSjxaKeq3usHNtKhUFV8ynCvX2UTJrF1qyctEahR+7/X5xVCn33Z77FGT0ffmDGH/67fg
 rnXrVyphgRP2hQou3fjvugCONiaJ4p08WN3boxSUPDHssbhRpPHHGrTaR8l/9CC6dZn1vzu17VZpc
 lgdC359cQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWkTW-00044S-Uo; Fri, 31 May 2019 16:33:50 +0000
Date: Fri, 31 May 2019 09:33:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Message-ID: <20190531163350.GB8708@infradead.org>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
 <20190530.150844.1826796344374758568.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530.150844.1826796344374758568.davem@davemloft.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 iommu@lists.linux-foundation.org, camelia.groza@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 laurentiu.tudor@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 03:08:44PM -0700, David Miller wrote:
> From: laurentiu.tudor@nxp.com
> Date: Thu, 30 May 2019 17:19:45 +0300
> 
> > Depends on this pull request:
> > 
> >  http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/653554.html
> 
> I'm not sure how you want me to handle this.

The thing needs to be completely redone as it abuses parts of the
iommu API in a completely unacceptable way.
