Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4B4F95CF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZd0f2cDNz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 22:31:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DiZ9jvoK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DiZ9jvoK; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZd003SPCz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 22:31:11 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id b24so9855142edu.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MdB4ANwvghcG4fkQozdLA8gRjmcacHbkquFwAsn8CRc=;
 b=DiZ9jvoKF93GbRCqokSIJWSa1Cgz/AAF7qnZXRgs26kl2t5t/RnDVPs+M1q6PNMbRx
 HPeTZEHveI4zWPG8wAK5IGmRrvLHNXG7uhwya4CpBOWeDH6HVCFW4quBofsxSwCaYHsU
 zGUq+ETYq/9PuZF0oCFJPBVyL0du9IY5LGiM6mPebPK8DLte4lamuL//mpS90Qto0ldD
 bwIMw4MHHNRsImr51cp2Jsw4tTJnDoQ0ekoCIeoYZHigcEhcfJXSW3qDVnSDy5l8UrO4
 XKqBOGz8DWnUVdEtAxFi7bNJP6Y+xFAmLkn9uGSZWeA9A7r7vXseb56pXiLvAHR2+ZeK
 HXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MdB4ANwvghcG4fkQozdLA8gRjmcacHbkquFwAsn8CRc=;
 b=oZrDwRW4/8VtP7fCgD0Fi/eoQKFFAdfdctdrVHdqw1OE0w+NgBtCeRPWkOMxDmSn1z
 50/Ur+wJ51XNm/YP/WvsOEdXjsE9SB9q83015XAuONScxaIO067M4EhXxzrDVnvdedck
 vEApIFV2QDUIZTkoWRtZ6tR3E0Vr5Nk8o2MfwedBC2YYY17qKYaISAYhVUO0FM/C6i5l
 yNiI2PWroZDA4TZuNHSM0VEGtyOEg9aDOnl8J++8r75sZBIyzcZuKEg2hrclUy5aquZ5
 llFkoyfvRrzSjY6+iv2VwW7wFsaNNr11g+3AmZhaTJDVk1mXx8tzYu15CHE9aCP2umR/
 Lv4A==
X-Gm-Message-State: AOAM533VghQVr6yWfhGpC1l7aFvh7uCz6XEmNrU8M2ceg56gTjMGc0wk
 3iOdelXHs5L6KZjKytCuQtQ=
X-Google-Smtp-Source: ABdhPJyAZrneojIBn7WVn8l4/2ymdhQ3RO+ob3K825lN5od6g+iFNxw2mpyIJef4bqmid+dNV8h1ug==
X-Received: by 2002:a05:6402:289f:b0:41c:d9af:ce39 with SMTP id
 eg31-20020a056402289f00b0041cd9afce39mr19631558edb.415.1649421064812; 
 Fri, 08 Apr 2022 05:31:04 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm8703503ejd.46.2022.04.08.05.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 05:31:04 -0700 (PDT)
Date: Fri, 8 Apr 2022 15:31:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 03/15] net: dsa: mv88e6xxx: Replace usage of
 found with dedicated iterator
Message-ID: <20220408123101.p33jpynhqo67hebe@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-4-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407102900.3086255-4-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jakob,

On Thu, Apr 07, 2022 at 12:28:48PM +0200, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
> 
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/net/dsa/mv88e6xxx/chip.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
> index 64f4fdd02902..f254f537c357 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -1381,28 +1381,27 @@ static int mv88e6xxx_set_mac_eee(struct dsa_switch *ds, int port,
>  /* Mask of the local ports allowed to receive frames from a given fabric port */
>  static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
>  {
> +	struct dsa_port *dp = NULL, *iter, *other_dp;
>  	struct dsa_switch *ds = chip->ds;
>  	struct dsa_switch_tree *dst = ds->dst;
> -	struct dsa_port *dp, *other_dp;
> -	bool found = false;
>  	u16 pvlan;
>  
>  	/* dev is a physical switch */
>  	if (dev <= dst->last_switch) {
> -		list_for_each_entry(dp, &dst->ports, list) {
> -			if (dp->ds->index == dev && dp->index == port) {
> -				/* dp might be a DSA link or a user port, so it
> +		list_for_each_entry(iter, &dst->ports, list) {
> +			if (iter->ds->index == dev && iter->index == port) {
> +				/* iter might be a DSA link or a user port, so it
>  				 * might or might not have a bridge.
> -				 * Use the "found" variable for both cases.
> +				 * Set the "dp" variable for both cases.
>  				 */
> -				found = true;
> +				dp = iter;
>  				break;
>  			}
>  		}
>  	/* dev is a virtual bridge */
>  	} else {
> -		list_for_each_entry(dp, &dst->ports, list) {
> -			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
> +		list_for_each_entry(iter, &dst->ports, list) {
> +			unsigned int bridge_num = dsa_port_bridge_num_get(iter);
>  
>  			if (!bridge_num)
>  				continue;
> @@ -1410,13 +1409,13 @@ static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
>  			if (bridge_num + dst->last_switch != dev)
>  				continue;
>  
> -			found = true;
> +			dp = iter;
>  			break;
>  		}
>  	}
>  
>  	/* Prevent frames from unknown switch or virtual bridge */
> -	if (!found)
> +	if (!dp)
>  		return 0;
>  
>  	/* Frames from DSA links and CPU ports can egress any local port */
> -- 
> 2.25.1
> 

Let's try to not make convoluted code worse. Do the following 2 patches
achieve what you are looking for? Originally I had a single patch (what
is now 2/2) but I figured it would be cleaner to break out the unrelated
change into what is now 1/2.

If you want I can submit these changes separately.

-----------------------------[ cut here ]-----------------------------
From 2d84ecd87566b1535a04526b4ebb2764e764625f Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Fri, 8 Apr 2022 15:15:30 +0300
Subject: [PATCH 1/2] net: dsa: mv88e6xxx: remove redundant check in
 mv88e6xxx_port_vlan()

We know that "dev > dst->last_switch" in the "else" block.
In other words, that "dev - dst->last_switch" is > 0.

dsa_port_bridge_num_get(dp) can be 0, but the check
"if (bridge_num + dst->last_switch != dev) continue", rewritten as
"if (bridge_num != dev - dst->last_switch) continue", aka
"if (bridge_num != something which cannot be 0) continue",
makes it redundant to have the extra "if (!bridge_num) continue" logic,
since a bridge_num of zero would have been skipped anyway.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 64f4fdd02902..b3aa0e5bc842 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1404,9 +1404,6 @@ static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 		list_for_each_entry(dp, &dst->ports, list) {
 			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
 
-			if (!bridge_num)
-				continue;
-
 			if (bridge_num + dst->last_switch != dev)
 				continue;
 
-----------------------------[ cut here ]-----------------------------

-----------------------------[ cut here ]-----------------------------
From dabafdbe38b408f7c563ad91fc6e57791055fed7 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Fri, 8 Apr 2022 14:57:45 +0300
Subject: [PATCH 2/2] net: dsa: mv88e6xxx: refactor mv88e6xxx_port_vlan()

To avoid bugs and speculative execution exploits due to type-confused
pointers at the end of a list_for_each_entry() loop, one measure is to
restrict code to not use the iterator variable outside the loop block.

In the case of mv88e6xxx_port_vlan(), this isn't a problem, as we never
let the loops exit through "natural causes" anyway, by using a "found"
variable and then using the last "dp" iterator prior to the break, which
is a safe thing to do.

Nonetheless, with the expected new syntax, this pattern will no longer
be possible.

Profit off of the occasion and break the two port finding methods into
smaller sub-functions. Somehow, returning a copy of the iterator pointer
is still accepted.

This change makes it redundant to have a "bool found", since the "dp"
from mv88e6xxx_port_vlan() now holds NULL if we haven't found what we
were looking for.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 54 ++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index b3aa0e5bc842..1f35e89053e6 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1378,42 +1378,50 @@ static int mv88e6xxx_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static struct dsa_port *mv88e6xxx_find_port(struct dsa_switch_tree *dst,
+					    int sw_index, int port)
+{
+	struct dsa_port *dp;
+
+	list_for_each_entry(dp, &dst->ports, list)
+		if (dp->ds->index == sw_index && dp->index == port)
+			return dp;
+
+	return NULL;
+}
+
+static struct dsa_port *
+mv88e6xxx_find_port_by_bridge_num(struct dsa_switch_tree *dst,
+				  unsigned int bridge_num)
+{
+	struct dsa_port *dp;
+
+	list_for_each_entry(dp, &dst->ports, list)
+		if (dsa_port_bridge_num_get(dp) == bridge_num)
+			return dp;
+
+	return NULL;
+}
+
 /* Mask of the local ports allowed to receive frames from a given fabric port */
 static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 {
 	struct dsa_switch *ds = chip->ds;
 	struct dsa_switch_tree *dst = ds->dst;
 	struct dsa_port *dp, *other_dp;
-	bool found = false;
 	u16 pvlan;
 
-	/* dev is a physical switch */
 	if (dev <= dst->last_switch) {
-		list_for_each_entry(dp, &dst->ports, list) {
-			if (dp->ds->index == dev && dp->index == port) {
-				/* dp might be a DSA link or a user port, so it
-				 * might or might not have a bridge.
-				 * Use the "found" variable for both cases.
-				 */
-				found = true;
-				break;
-			}
-		}
-	/* dev is a virtual bridge */
+		/* dev is a physical switch */
+		dp = mv88e6xxx_find_port(dst, dev, port);
 	} else {
-		list_for_each_entry(dp, &dst->ports, list) {
-			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
-
-			if (bridge_num + dst->last_switch != dev)
-				continue;
-
-			found = true;
-			break;
-		}
+		/* dev is a virtual bridge */
+		dp = mv88e6xxx_find_port_by_bridge_num(dst,
+						       dev - dst->last_switch);
 	}
 
 	/* Prevent frames from unknown switch or virtual bridge */
-	if (!found)
+	if (!dp)
 		return 0;
 
 	/* Frames from DSA links and CPU ports can egress any local port */
-----------------------------[ cut here ]-----------------------------
