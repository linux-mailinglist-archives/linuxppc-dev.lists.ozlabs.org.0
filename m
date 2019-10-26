Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E6E58DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 08:42:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470WcT2LD0zDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 17:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+332c21a18e206945ff7a+5907+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="hwuUqh5O"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470WZL0dQCzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 17:40:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6s17gBBg/6zRKAY7SPudjFKm/VgEPnz4H38+RtC8BxM=; b=hwuUqh5Oi86w7OEh0JFjKFc8b
 CaaHHIRIZh8BFLDE00o2RIuqYJN8J44I+BA2Uaiv6+03YhJ9NPS/dnmjKIGkQ8AGMCTNGyWc08uIj
 Dfv8hAHuN2M1xVu7n8X89L+VtGxT6TYPqnHZbGDqyST66bOya7xp7pBpirj2CYrGpLamJWn+ILDkt
 n1DXFkqsfRIfl7rfcYSoia1dZKHIiiQXOjXzTnmZNzQMNz2gUT4HyUAdG+hxGk06/DIur7wWmVFu3
 sSfh58f3kS+L28JMI+Y14hGdNdOR92GR0vB1uW8ctz/ZY53tlv5FTJI6BQ0anwyMF8AxPBiGc5utx
 91/NCE3QQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iOFjK-0006J7-QH; Sat, 26 Oct 2019 06:39:18 +0000
Date: Fri, 25 Oct 2019 23:39:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: Onboard SD card doesn't work anymore after the 'mmc-v5.4-2'
 updates
Message-ID: <20191026063918.GA24015@infradead.org>
References: <7b549219-a2e1-08c7-331b-9c3e4fdb8a8f@xenosoft.de>
 <3aeae0d8-e9be-2585-cbbd-70263cb495f1@xenosoft.de>
 <20191015125105.GU25745@shell.armlinux.org.uk>
 <5611f3bc-68aa-78ec-182a-1cb414202314@xenosoft.de>
 <20191015131750.GV25745@shell.armlinux.org.uk>
 <87muds586t.fsf@mpe.ellerman.id.au>
 <31d58f086f964937b27209bc18b334d9c9791767.camel@kernel.crashing.org>
 <CAL_JsqJpFy-g3earNjZs7jANx4pyRd=CDvZN3emMdXL5YNkYHQ@mail.gmail.com>
 <20191023143159.GB25745@shell.armlinux.org.uk>
 <CAL_JsqLZV1sXc053QMLcV-dV1BbGcRtX3eu1zbtNA_N3hzQE4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLZV1sXc053QMLcV-dV1BbGcRtX3eu1zbtNA_N3hzQE4g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, mad skateman <madskateman@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Paul Mackerras <paulus@samba.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2019 at 05:28:45PM -0500, Rob Herring wrote:
> This doesn't work?:
> 
>         if (IS_ENABLED(CONFIG_PPC) || of_dma_is_coherent(dev->of_node))
>                 value |= ESDHC_DMA_SNOOP;
>         else
>                 value &= ~ESDHC_DMA_SNOOP;
> 
> While I said use the compatibles, using the kconfig symbol is easier
> than sorting out which compatibles are PPC SoCs. Though if that's
> already done elsewhere in the driver, you could set a flag and use
> that here. I'd be surprised if this was the only difference between
> ARM and PPC SoCs for this block.

I think the right thing is a Kconfig variable that the architectures
selects which says if OF is by default coherent or incoherent, and then
use that in of_dma_is_coherent.
