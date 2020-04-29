Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D201BD74B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:31:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BsD25gD2zDqBl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:30:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::4;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bs7Q1t6tzDr3V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 18:26:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588148806;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=BfHXos+9450rpGvIhO6jrZq3f/TYqCe6XZMBD0vryCQ=;
 b=UsRzKSfrcJfnZDdfdGrigr+07z8RmK7OeYSccRIU5hS+/10zk9Qnd+kom3ffqGyBYN
 g2ZLsjiYAYIz6fVe2bnI2IR5lQu82QGwNBz4+RuTr96Qo5cVRF6WK/HiVQq7BleJF74K
 cZpB0WjlyOYEvZVZhhqJlJAAbXStVOlqrzbL9H/EWioFGOoWJQgKzE7ZuaeauHsMwqHp
 UTfsPErTEQ6wW0yfzHxD1gSSnXP+tCsZH3bVq5cBSUnKKVNLw/LdKffDrzXzK3c9QXel
 283dXFVt5LR8coVCF54nj5NrHu0s1x+cEfK6CGyY/S+APvKqUfa3JoWAC3skCCNm7CpP
 KXPA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSdWimbfxYLit+vlzeN0mUI0H8aQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:1c94:f1a9:15ea:cac1]
 by smtp.strato.de (RZmta 46.6.2 AUTH) with ESMTPSA id I01247w3T8QYYNW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Apr 2020 10:26:34 +0200 (CEST)
Subject: Re: [RFC PATCH dpss_eth] Don't initialise ports with no PHY
To: Darren Stevens <darren@stevens-zone.net>, madalin.bacur@nxp.com,
 netdev@vger.kernel.org, mad skateman <madskateman@gmail.com>
References: <20200424232938.1a85d353@Cyrus.lan>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <ca95a1b2-1b16-008c-18ba-2cbd79f240e6@xenosoft.de>
Date: Wed, 29 Apr 2020 10:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424232938.1a85d353@Cyrus.lan>
Content-Type: multipart/mixed; boundary="------------BF1782061CAC7863F4EF23B5"
Content-Language: de-DE
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
Cc: oss@buserror.net, "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev@lists.ozlabs.org, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------BF1782061CAC7863F4EF23B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Darren,

Thanks a lot for your patch!

I tested it with the RC3 today.

Unfortunately it doesn't compile because a bracket is missing in the 
following line:

+    if (prop && !strncmp(prop, "disabled", 8) {

And a semicolon is missing in the following line:

+        goto _return

I added the bracket and the semicolon and after that it compiled without 
any problems. (New patch attached)

Unfortunately I see more than 2 ethernet ports with the RC3 and your 
patch on my Cyrus P5040. Maybe Skateman has an other result on his Cyrus 
P5020.

Maybe we have to modify the dtb file.

Thanks,
Christian


On 25 April 2020 at 00:29 am, Darren Stevens wrote:
> Since cbb961ca271e ("Use random MAC address when none is given")
> Varisys Cyrus P5020 boards have been listing 5 ethernet ports instead of
> the 2 the board has.This is because we were preventing the adding of the
> unused ports by not suppling them a MAC address, which this patch now
> supplies.
>
> Prevent them from appearing in the net devices list by checking for a
> 'status="disabled"' entry during probe and skipping the port if we find
> it.
>
> Signed-off-by: Darren Stevens <Darren@stevens-zone.net>
>
> ---
>
>   drivers/net/ethernet/freescale/fman/mac.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
> index 43427c5..c9ed411 100644
> --- a/drivers/net/ethernet/freescale/fman/mac.c
> +++ b/drivers/net/ethernet/freescale/fman/mac.c
> @@ -606,6 +606,7 @@ static int mac_probe(struct platform_device *_of_dev)
>   	struct resource		 res;
>   	struct mac_priv_s	*priv;
>   	const u8		*mac_addr;
> +	const char 		*prop;
>   	u32			 val;
>   	u8			fman_id;
>   	phy_interface_t          phy_if;
> @@ -628,6 +629,16 @@ static int mac_probe(struct platform_device *_of_dev)
>   	mac_dev->priv = priv;
>   	priv->dev = dev;
>   
> +	/* check for disabled devices and skip them, as now a missing
> +	 * MAC address will be replaced with a Random one rather than
> +	 * disabling the port
> +	 */
> +	prop = of_get_property(mac_node, "status", NULL);
> +	if (prop && !strncmp(prop, "disabled", 8) {
> +		err = -ENODEV;
> +		goto _return
> +	}
> +
>   	if (of_device_is_compatible(mac_node, "fsl,fman-dtsec")) {
>   		setup_dtsec(mac_dev);
>   		priv->internal_phy_node = of_parse_phandle(mac_node,


--------------BF1782061CAC7863F4EF23B5
Content-Type: text/x-patch; charset=UTF-8;
 name="dpss_eth.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dpss_eth.patch"

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 43427c5..c9ed411 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -606,6 +606,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	struct resource		 res;
 	struct mac_priv_s	*priv;
 	const u8		*mac_addr;
+	const char 		*prop;
 	u32			 val;
 	u8			fman_id;
 	phy_interface_t          phy_if;
@@ -628,6 +629,16 @@ static int mac_probe(struct platform_device *_of_dev)
 	mac_dev->priv = priv;
 	priv->dev = dev;
 
+	/* check for disabled devices and skip them, as now a missing
+	 * MAC address will be replaced with a Random one rather than
+	 * disabling the port
+	 */
+	prop = of_get_property(mac_node, "status", NULL);
+	if (prop && !strncmp(prop, "disabled", 8)) {
+		err = -ENODEV;
+		goto _return;
+	}
+
 	if (of_device_is_compatible(mac_node, "fsl,fman-dtsec")) {
 		setup_dtsec(mac_dev);
 		priv->internal_phy_node = of_parse_phandle(mac_node,

--------------BF1782061CAC7863F4EF23B5--
