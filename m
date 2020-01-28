Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A158614B0B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 09:11:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486K7h0zJYzDqFZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 19:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+99a02e0d02778047748b+6001+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486K584KR6zDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 19:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fu3XLdvdr0IP82rYkgFcpjUv0Mxvp/OR1gY+ZDGdVqM=; b=dfbLU+6xsIWrtOs6Oft/5Nz4rl
 4GhQ96YPPd/+WCWPfzjxryOhu4o2nBMynHYhi+iExb5SndS+xEnPu35mIqiblHZyA8ftLG7qMaJ01
 mIacK+l5KlpyWYFmkenj+92PNgY8Um1sYFKSxpDDSs4ss86oVKSAH/T8qoOKCWhGZhze03fu0Ig6L
 GTCyi/Vrg40gVv+26SePbmLjwCSMdHAHFNAOcZjIm+FFef7eOAeg7TJTHg+9Tzjjl4Y/rkw4mDTT2
 2REMyFqJkGWeHsdlVpD0ARVaAU4OmHFnbzJtJxIm1gg/Wo19sAkE4kzkURfjd9/G29BM9aV8kIguj
 RLXxvUkg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iwLvF-000473-UG; Tue, 28 Jan 2020 08:08:33 +0000
Date: Tue, 28 Jan 2020 00:08:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI PA6T PPC] Onboard CF card device with new SanDisk High
 (>8G) CF cards
Message-ID: <20200128080833.GA14099@infradead.org>
References: <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
 <8736c5hyhr.fsf@mpe.ellerman.id.au>
 <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <688f1943-5b81-6200-d4d9-38d21b69e180@xenosoft.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, Christoph Hellwig <hch@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, "contact@a-eon.com" <contact@a-eon.com>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 08:58:29AM +0100, Christian Zigotzky wrote:
> Hi All,
> 
> Which mailing list is responsible for the pata_pcmcia driver? We are using
> new SanDisk High (>8G) CF cards with this driver [1] and we need the
> following line in the file "drivers/ata/pata_pcmcia.c".
> 
> +    PCMCIA_DEVICE_MANF_CARD(0x00f1, 0x0101),        /* SanDisk High (>8G)
> CFA */

Please send a formal patch for it to linux-ide@vger.kernel.org
