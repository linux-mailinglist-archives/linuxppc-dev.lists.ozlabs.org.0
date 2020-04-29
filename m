Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DCB1BE2AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:26:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C2Rz2bbyzDrB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 01:26:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=IIPZvgod; dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C2M26BP8zDr7Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 01:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5uO653nHnG/4hJnyU2CEzLdMTrPNF9NuNoUERL8DTQM=; b=IIPZvgod1VnhUzX/VKF2938Xd8
 4RS5iXH7UYsJCPoyi1H6YGdmh7PKXSLlcuRT/wE16bMAXBBRPfiRec2BpcmEktz4OIdz1zjN1emTp
 Q0VTQOId5fB+pKl/bjhq2FWk95Pok0qSj6qvM75p+VPXQLrEYs+tCY8N/xTcVV67sxgI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jToXY-000HjF-2Z; Wed, 29 Apr 2020 17:22:24 +0200
Date: Wed, 29 Apr 2020 17:22:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [RFC PATCH dpss_eth] Don't initialise ports with no PHY
Message-ID: <20200429152224.GA66424@lunn.ch>
References: <20200429131253.GG30459@lunn.ch>
 <77E4A243-F90A-45A9-B8D3-0F7785C158C7@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77E4A243-F90A-45A9-B8D3-0F7785C158C7@xenosoft.de>
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
Cc: madalin.bacur@nxp.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 netdev@vger.kernel.org, oss@buserror.net,
 Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 03:55:28PM +0200, Christian Zigotzky wrote:
> Hi Andrew,
> 
> You can find some dtb and source files in our kernel package.
> 
> Download: http://www.xenosoft.de/linux-image-5.7-rc3-X1000_X5000.tar.gz

I have the tarball. Are we talking about
linux-image-5.7-rc3-X1000_X5000/X5000_and_QEMU_e5500/dtbs/X5000_20/cyrus.eth.dtb

I don't see any status = "disabled"; in the blob. So i would expect
the driver to probe.

    Andrew


