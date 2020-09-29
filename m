Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6527D7C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 22:12:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C19Y66GzlzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Sep 2020 06:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C19W63cdDzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Sep 2020 06:10:58 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kNLxY-00Gno4-QO; Tue, 29 Sep 2020 22:10:48 +0200
Date: Tue, 29 Sep 2020 22:10:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 devicetree 2/2] powerpc: dts: t1040rdb: add ports for
 Seville Ethernet switch
Message-ID: <20200929201048.GG3996795@lunn.ch>
References: <20200929113209.3767787-1-vladimir.oltean@nxp.com>
 <20200929113209.3767787-3-vladimir.oltean@nxp.com>
 <20200929191153.GF3996795@lunn.ch>
 <20200929193953.rgibttgt6lh5huef@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929193953.rgibttgt6lh5huef@skbuf>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Madalin Bucur \(OSS\)" <madalin.bucur@oss.nxp.com>,
 Radu-andrei Bulie <radu-andrei.bulie@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, Vladimir Oltean <olteanv@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 29, 2020 at 07:39:54PM +0000, Vladimir Oltean wrote:
> On Tue, Sep 29, 2020 at 09:11:53PM +0200, Andrew Lunn wrote:
> > > +&seville_port0 {
> > > +	managed = "in-band-status";
> > > +	phy-handle = <&phy_qsgmii_0>;
> > > +	phy-mode = "qsgmii";
> > > +	/* ETH4 written on chassis */
> > > +	label = "swp4";
> >
> > If ETH4 is on the chassis why not use ETH4?
> 
> You mean all-caps, just like that?

Yes.

DSA is often used in WiFI access point, etc. The user is not a
computer professional. If the WebGUI says ETH4, and the label on the
front says ETH4, they probably think the two are the same, and are
happy.

I have one box which does not have an labels on the front panels, but
the industrial sockets for Ethernet are colour coded. So the interface
names are red, blue, green, to match the socket colour, and the cable
set is also colour coded the same.

So long as it is unique, the kernel does not care. So make it easy for
the user.

    Andrew

