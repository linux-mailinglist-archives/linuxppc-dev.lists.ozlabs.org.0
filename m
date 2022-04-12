Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6844FDDA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd3ZZ2vZgz3bd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=FJsGgOd6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=FJsGgOd6; 
 dkim-atps=neutral
X-Greylist: delayed 353 seconds by postgrey-1.36 at boromir;
 Tue, 12 Apr 2022 21:35:30 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd3Yt2GlMz2xDw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 21:35:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k1kFbr4PJFmsHiVyh3odwUpl/FEunR2slPc9KbivmVs=; b=FJsGgOd6Jog/SVqJqtG82tp8gF
 GmofMqvYUa9rQRC13PSTLfmhxejGCEF6gS4x9w8uLHIZWizN5tXQvJ85FM+OjXDsvvshki/tqrWTR
 ijKqokXU7UeOILCkJWOmQfRrdgFUmI7ulHIUz6O//1a80snecUa4eRrVm1MTENQUInqEPHbeZPb2D
 unRlctmv3BT82g774UuWb9bM94zmpSy9Tu///xUdzOrE+iYwjfidcGftFycGjXYqjyemYE5BVqNNI
 TfjxE7pcrSZTtu7dijAp8lI9sMPrOI9Ksv+/xDzYHzORtMtioQ+vO+NNavrO13alkrr6dMoe/et7D
 lyMXRLFg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58226)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1neEh4-0001o2-0I; Tue, 12 Apr 2022 12:28:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1neEgf-0002LH-Jc; Tue, 12 Apr 2022 12:27:57 +0100
Date: Tue, 12 Apr 2022 12:27:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next v2 05/18] net: dsa: mv88e6xxx: remove redundant
 check in mv88e6xxx_port_vlan()
Message-ID: <YlViPWWKhvoV2DLN@shell.armlinux.org.uk>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
 <20220412105830.3495846-6-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412105830.3495846-6-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 12, 2022 at 12:58:17PM +0200, Jakob Koschel wrote:
> We know that "dev > dst->last_switch" in the "else" block.
> In other words, that "dev - dst->last_switch" is > 0.
> 
> dsa_port_bridge_num_get(dp) can be 0, but the check
> "if (bridge_num + dst->last_switch != dev) continue", rewritten as
> "if (bridge_num != dev - dst->last_switch) continue", aka
> "if (bridge_num != something which cannot be 0) continue",
> makes it redundant to have the extra "if (!bridge_num) continue" logic,
> since a bridge_num of zero would have been skipped anyway.
> 
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Isn't this Vladimir's patch?

If so, it should be commited as Vladimir as the author, and Vladimir's
sign-off should appear before yours. When sending out such patches,
there should be a From: line for Vladimir as the first line in the body
of the patch email.

The same goes for the next mv88e6xxx patch in this series - I think
both of these are the patches Vladimir sent in his email:

https://lore.kernel.org/r/20220408123101.p33jpynhqo67hebe@skbuf

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
