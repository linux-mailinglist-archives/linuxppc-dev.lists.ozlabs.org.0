Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE02D3865
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:50:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrKk92LtLzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 12:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.47; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=peter.chen@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=BwcFcqyi; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrKh33yjqzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 12:48:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCQvMee49DBPJg/VCuazOMaWJuomnoqc+Ee6/ySE/2Oj0pEuwmG+gB1bV+9EHKjUY+iJAABSxqTrRXObOpF8WQOycdqTVrVSsYyVGfTYD9wmI15mi1u1gcJmhjakN7Ru7BE77lqPoepRH+dDJK6hxMC6kiwUNqU9xyIvvEexehURAufMqZb9EtGM7Mh1RNMxSuUiMeybOYBkYKLuhS3lya21fm8aRezWbRTjPhbreq2LWOzFL/2i3E9iJl84IY4WTasp7GCQJHXvymchKdw50RooUJrISynEa0mbxxIjyWGkN1wnvFiZstRnmchFAIE7ei/HFa0lM6qqAxNmAx8tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFfpRAB/9e1bSBgLaaFr73M+YEn/SOXhRhU3qiTcYcM=;
 b=EJi8/W8m4dPJtNfom0KzcBggKWt+JxiFknwRQRUCK/x42kSFeMnIqtCZkQzbYqpAM9Q7YJ5Oj4sjiuCnG5QeUa+Wq9rJulwGApJT08t5pl4iY4bx39evyCsbOZZJKub/OMo5VpZPa/9xDgYPAq+VF69+4ol1YLJbqx0Ql2bLJfVHcndr0GIra/h+oZnr1SttZLBgwPwHf82ePZ9Aobn0zStCFV74fFPvAzEMKq5stdRuCW9xqeeZbo5pbkfYfg+u3TZl/MJyc4791wRzqySiz8jNey2bFpGJWeAYwQHLifSkQ1N2mqs6NBshq5+TzchebRGtIc+oLrZ9SWpiib1m1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFfpRAB/9e1bSBgLaaFr73M+YEn/SOXhRhU3qiTcYcM=;
 b=BwcFcqyiBcHljFz0kL0JK0qdbodDseBaQzKIF3rt3mPDb8pQJjE4RSLzEnsgpK1hraGNKTUc9TGFf8T0Ce4B2hKX7rgPNzxBnlolqZ/5jo518NvIE94YHQd3DvUKF9CJuCx/ZUW74lYf7HjejZvgrV4VWbf2xkuWLlLZcOO3h28=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 01:48:10 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 01:48:10 +0000
From: Peter Chen <peter.chen@nxp.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
Thread-Topic: [PATCH] drivers: usb: gadget: prefer pr_*() functions over raw
 printk()
Thread-Index: AQHWzXD+d7Z0zfq3eUmbS2B/2ZpcmKnt/6wA
Date: Wed, 9 Dec 2020 01:48:10 +0000
Message-ID: <20201209014740.GA995@b29397-desktop>
References: <20201208144403.22097-1-info@metux.net>
In-Reply-To: <20201208144403.22097-1-info@metux.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: metux.net; dkim=none (message not signed)
 header.d=none;metux.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5982ce73-75dd-49b0-dfd3-08d89be47b97
x-ms-traffictypediagnostic: DB8PR04MB7178:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB717882FCD70B9D8BA8562B108BCC0@DB8PR04MB7178.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +hYl9K0YNFo4+mgFzu11dNP//EoPVAVeY9ulcASAPuA3iD0z+tj1/4MkF7N2/Sa1wUHAM0qU64qf4EnrpV84+7+C7EH8NX8Uc5Lei8erwIUH+y+1l1kbayR2UcbK3WTcEjho3PnaxBISytJ7b311y0zCTt23tUAnKfSSALPPXw7ZDwQ2b7bDcs4pIETcMpMew7iB2TvP0IPOWifbkC21FAk7lwfLq6acxyyjkbfk+rKt0AwFkhXyjEt7MKNEtsS+Q3FxvjjZ9b+Ppo/DiDS0UXMzFxGccGPCEN9djDUwXxPFGOEaOXkaz52mVAVXC4uQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7979.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(54906003)(33716001)(9686003)(76116006)(2906002)(6512007)(33656002)(53546011)(8676002)(64756008)(508600001)(44832011)(30864003)(6486002)(4326008)(8936002)(91956017)(5660300002)(83380400001)(66556008)(71200400001)(26005)(66446008)(186003)(6506007)(86362001)(66476007)(1076003)(6916009)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dyhi/TqBVY2fZ8c8vVJwNR1OYVpeMBWJ+0eoOUG2n5mUp4xRZIz7AaWT1vqO?=
 =?us-ascii?Q?UVRmV0QlQZ/LmkMLRTg9qNjhpbEnZSLEd0tEPQpFX2dXWHn67YpY0KF0Lm8x?=
 =?us-ascii?Q?VFOHyGAz592sK8W9D4dRhj20xyj8NfMMa/vhrymNudZ1QWB0wSl816qxsyPm?=
 =?us-ascii?Q?5uV+kZPYgSnySTR/X/Llbpt4UAXamnd6zFBf4tAbmvXcJ5HX1CqKEwHZwMXS?=
 =?us-ascii?Q?EImHk5I7+S/H3qBM0lrJQNDXpVeoNxA31wJfCRUuey38XgSQCCirjM+tAU08?=
 =?us-ascii?Q?+V+VngnZeOW0BFPZ72rD6DXrtDrDEsJFu67lVii9GxTMAfWIF/XZK/izD30D?=
 =?us-ascii?Q?ixKrx8Qxy+K1LSNU9Mhse05nM3l/Yd5XYVInTmpT2o9rVnoVKhWnl/4je7UE?=
 =?us-ascii?Q?Ahv7M4mgU2ApZ22YVhm1+kT9VK1YCNExILZYruFBHXmxLbpSSVGLTZinxHte?=
 =?us-ascii?Q?4NW6S8LnN9B17sOgb8M+YYs7SyUI6/qTQHxnUMPALCUKoPCiNl61MiH6v8Cp?=
 =?us-ascii?Q?nMaf38Y16yoOU0I734zqNASW00I8eGNDArAJlWWLoatOhTDayDI+qo0kPhL6?=
 =?us-ascii?Q?c8n9oUbi+tEGd88pqutUQbNkEvPLOQ/buitCpOjT1+1nORdJKmoHjzycpL2C?=
 =?us-ascii?Q?3uSOCJa7a5h7u3cjJwNMe7L4Wgj0WYlXLV+iMNfkEfSga/T9kQbfHA0auOai?=
 =?us-ascii?Q?a+9nqjAFKCvqNGvfPiG0EqCLgleI5xwZcigxnYgIfstqUaGCCP0LkkCNZ0Jq?=
 =?us-ascii?Q?IbS0XRkt4Ev+X1eAIAs9M9JjnFSK67Ro2mNv46oUHiAq/0nAwsYYqPDbOE16?=
 =?us-ascii?Q?zgTousYDH033Gq57bLJdj9c17emFKFU7S9Y6dJf3HpzLwM4elBfAP1OUgrPw?=
 =?us-ascii?Q?BbAgVNas8L5geTiB+HPc4CdAT3/pt4qt/RgDRZXGmccjKPJxNdw/KD9hmo65?=
 =?us-ascii?Q?KO33SVpKKH4jds3P0ofJ4U+UmhVbhhUCImehfFk0k8buzXGwx/YKWXBDkssR?=
 =?us-ascii?Q?4wVL?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A771545CB75891428A6DB7958560E31C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5982ce73-75dd-49b0-dfd3-08d89be47b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 01:48:10.0558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTqq0+vBa/UieVX0N7ok2jTT7li+G2JYjCgaN7z+GX/U8QIxXmQzqArVjijHI8h7cng8IramJPvPZxEIRvR6WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20-12-08 15:44:03, Enrico Weigelt, metux IT consult wrote:
> Reduce a bit logging boilerplate by using the preferred pr_*()
> macros instead of raw printk().

It is the device driver code, it is better to use dev_info/dev_dbg.

Peter
>=20
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/usb/gadget/function/uvc.h       |  2 +-
>  drivers/usb/gadget/udc/atmel_usba_udc.c |  2 +-
>  drivers/usb/gadget/udc/fsl_udc_core.c   |  4 +--
>  drivers/usb/gadget/udc/fsl_usb2_udc.h   |  4 +--
>  drivers/usb/gadget/udc/fusb300_udc.c    | 64 ++++++++++++++++-----------=
------
>  drivers/usb/gadget/udc/goku_udc.c       |  2 +-
>  drivers/usb/gadget/udc/r8a66597-udc.h   |  2 +-
>  7 files changed, 40 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/funct=
ion/uvc.h
> index 23ee25383c1f..d546eb7c348c 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -49,7 +49,7 @@ extern unsigned int uvc_gadget_trace_param;
>  #define uvc_trace(flag, msg...) \
>  	do { \
>  		if (uvc_gadget_trace_param & flag) \
> -			printk(KERN_DEBUG "uvcvideo: " msg); \
> +			pr_debug("uvcvideo: " msg); \
>  	} while (0)
> =20
>  #define uvcg_dbg(f, fmt, args...) \
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget=
/udc/atmel_usba_udc.c
> index 2b893bceea45..4834fafb3f70 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -1573,7 +1573,7 @@ static void usba_control_irq(struct usba_udc *udc, =
struct usba_ep *ep)
>  		 * generate or receive a reply right away. */
>  		usba_ep_writel(ep, CLR_STA, USBA_RX_SETUP);
> =20
> -		/* printk(KERN_DEBUG "setup: %d: %02x.%02x\n",
> +		/* pr_debug("setup: %d: %02x.%02x\n",
>  			ep->state, crq.crq.bRequestType,
>  			crq.crq.bRequest); */
> =20
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/u=
dc/fsl_udc_core.c
> index ad6ff9c4188e..cab4def04f9f 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -1474,7 +1474,7 @@ __acquires(udc->lock)
>  			mdelay(10);
>  			tmp =3D fsl_readl(&dr_regs->portsc1) | (ptc << 16);
>  			fsl_writel(tmp, &dr_regs->portsc1);
> -			printk(KERN_INFO "udc: switch to test mode %d.\n", ptc);
> +			pr_info("udc: switch to test mode %d.\n", ptc);
>  		}
> =20
>  		return;
> @@ -1952,7 +1952,7 @@ static int fsl_udc_start(struct usb_gadget *g,
>  	if (!IS_ERR_OR_NULL(udc_controller->transceiver)) {
>  		/* Suspend the controller until OTG enable it */
>  		udc_controller->stopped =3D 1;
> -		printk(KERN_INFO "Suspend udc for OTG auto detect\n");
> +		pr_info("Suspend udc for OTG auto detect\n");
> =20
>  		/* connect to bus through transceiver */
>  		if (!IS_ERR_OR_NULL(udc_controller->transceiver)) {
> diff --git a/drivers/usb/gadget/udc/fsl_usb2_udc.h b/drivers/usb/gadget/u=
dc/fsl_usb2_udc.h
> index 4ba651ae9048..b180bf14dd0c 100644
> --- a/drivers/usb/gadget/udc/fsl_usb2_udc.h
> +++ b/drivers/usb/gadget/udc/fsl_usb2_udc.h
> @@ -509,7 +509,7 @@ struct fsl_udc {
>  /*----------------------------------------------------------------------=
---*/
> =20
>  #ifdef DEBUG
> -#define DBG(fmt, args...) 	printk(KERN_DEBUG "[%s]  " fmt "\n", \
> +#define DBG(fmt, args...) 	pr_debug("[%s]  " fmt "\n", \
>  				__func__, ## args)
>  #else
>  #define DBG(fmt, args...)	do{}while(0)
> @@ -535,7 +535,7 @@ static void dump_msg(const char *label, const u8 * bu=
f, unsigned int length)
>  			p +=3D 3;
>  		}
>  		*p =3D 0;
> -		printk(KERN_DEBUG "%6x: %s\n", start, line);
> +		pr_debug("%6x: %s\n", start, line);
>  		buf +=3D num;
>  		start +=3D num;
>  		length -=3D num;
> diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/ud=
c/fusb300_udc.c
> index 9af8b415f303..c4e7e4b8e46f 100644
> --- a/drivers/usb/gadget/udc/fusb300_udc.c
> +++ b/drivers/usb/gadget/udc/fusb300_udc.c
> @@ -352,24 +352,24 @@ static void fusb300_wrcxf(struct fusb300_ep *ep,
>  		for (i =3D length >> 2; i > 0; i--) {
>  			data =3D *tmp | *(tmp + 1) << 8 | *(tmp + 2) << 16 |
>  				*(tmp + 3) << 24;
> -			printk(KERN_DEBUG "    0x%x\n", data);
> +			pr_debug("    0x%x\n", data);
>  			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
>  			tmp =3D tmp + 4;
>  		}
>  		switch (length % 4) {
>  		case 1:
>  			data =3D *tmp;
> -			printk(KERN_DEBUG "    0x%x\n", data);
> +			pr_debug("    0x%x\n", data);
>  			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
>  			break;
>  		case 2:
>  			data =3D *tmp | *(tmp + 1) << 8;
> -			printk(KERN_DEBUG "    0x%x\n", data);
> +			pr_debug("    0x%x\n", data);
>  			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
>  			break;
>  		case 3:
>  			data =3D *tmp | *(tmp + 1) << 8 | *(tmp + 2) << 16;
> -			printk(KERN_DEBUG "    0x%x\n", data);
> +			pr_debug("    0x%x\n", data);
>  			iowrite32(data, fusb300->reg + FUSB300_OFFSET_CXPORT);
>  			break;
>  		default:
> @@ -390,7 +390,7 @@ static void fusb300_clear_epnstall(struct fusb300 *fu=
sb300, u8 ep)
>  	u32 reg =3D ioread32(fusb300->reg + FUSB300_OFFSET_EPSET0(ep));
> =20
>  	if (reg & FUSB300_EPSET0_STL) {
> -		printk(KERN_DEBUG "EP%d stall... Clear!!\n", ep);
> +		pr_debug("EP%d stall... Clear!!\n", ep);
>  		reg |=3D FUSB300_EPSET0_STL_CLR;
>  		iowrite32(reg, fusb300->reg + FUSB300_OFFSET_EPSET0(ep));
>  	}
> @@ -402,7 +402,7 @@ static void ep0_queue(struct fusb300_ep *ep, struct f=
usb300_request *req)
>  		if (req->req.length) {
>  			fusb300_wrcxf(ep, req);
>  		} else
> -			printk(KERN_DEBUG "%s : req->req.length =3D 0x%x\n",
> +			pr_debug("%s : req->req.length =3D 0x%x\n",
>  				__func__, req->req.length);
>  		if ((req->req.length =3D=3D req->req.actual) ||
>  		    (req->req.actual < ep->ep.maxpacket))
> @@ -565,7 +565,7 @@ static void fusb300_rdcxf(struct fusb300 *fusb300,
> =20
>  	for (i =3D (length >> 2); i > 0; i--) {
>  		data =3D ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
> -		printk(KERN_DEBUG "    0x%x\n", data);
> +		pr_debug("    0x%x\n", data);
>  		*tmp =3D data & 0xFF;
>  		*(tmp + 1) =3D (data >> 8) & 0xFF;
>  		*(tmp + 2) =3D (data >> 16) & 0xFF;
> @@ -576,18 +576,18 @@ static void fusb300_rdcxf(struct fusb300 *fusb300,
>  	switch (length % 4) {
>  	case 1:
>  		data =3D ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
> -		printk(KERN_DEBUG "    0x%x\n", data);
> +		pr_debug("    0x%x\n", data);
>  		*tmp =3D data & 0xFF;
>  		break;
>  	case 2:
>  		data =3D ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
> -		printk(KERN_DEBUG "    0x%x\n", data);
> +		pr_debug("    0x%x\n", data);
>  		*tmp =3D data & 0xFF;
>  		*(tmp + 1) =3D (data >> 8) & 0xFF;
>  		break;
>  	case 3:
>  		data =3D ioread32(fusb300->reg + FUSB300_OFFSET_CXPORT);
> -		printk(KERN_DEBUG "    0x%x\n", data);
> +		pr_debug("    0x%x\n", data);
>  		*tmp =3D data & 0xFF;
>  		*(tmp + 1) =3D (data >> 8) & 0xFF;
>  		*(tmp + 2) =3D (data >> 16) & 0xFF;
> @@ -610,7 +610,7 @@ static void fusb300_rdfifo(struct fusb300_ep *ep,
>  	req->req.actual +=3D length;
> =20
>  	if (req->req.actual > req->req.length)
> -		printk(KERN_DEBUG "req->req.actual > req->req.length\n");
> +		pr_debug("req->req.actual > req->req.length\n");
> =20
>  	for (i =3D (length >> 2); i > 0; i--) {
>  		data =3D ioread32(fusb300->reg +
> @@ -649,7 +649,7 @@ static void fusb300_rdfifo(struct fusb300_ep *ep,
>  		reg =3D ioread32(fusb300->reg + FUSB300_OFFSET_IGR1);
>  		reg &=3D FUSB300_IGR1_SYNF0_EMPTY_INT;
>  		if (i)
> -			printk(KERN_INFO "sync fifo is not empty!\n");
> +			pr_info("sync fifo is not empty!\n");
>  		i++;
>  	} while (!reg);
>  }
> @@ -677,7 +677,7 @@ static u8 fusb300_get_cxstall(struct fusb300 *fusb300=
)
>  static void request_error(struct fusb300 *fusb300)
>  {
>  	fusb300_set_cxstall(fusb300);
> -	printk(KERN_DEBUG "request error!!\n");
> +	pr_debug("request error!!\n");
>  }
> =20
>  static void get_status(struct fusb300 *fusb300, struct usb_ctrlrequest *=
ctrl)
> @@ -999,7 +999,7 @@ static void check_device_mode(struct fusb300 *fusb300=
)
>  		fusb300->gadget.speed =3D USB_SPEED_UNKNOWN;
>  		break;
>  	}
> -	printk(KERN_INFO "dev_mode =3D %d\n", (reg & FUSB300_GCR_DEVEN_MSK));
> +	pr_info("dev_mode =3D %d\n", (reg & FUSB300_GCR_DEVEN_MSK));
>  }
> =20
> =20
> @@ -1076,14 +1076,14 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
>  	if (int_grp1 & FUSB300_IGR1_WARM_RST_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_WARM_RST_INT);
> -		printk(KERN_INFO"fusb300_warmreset\n");
> +		pr_info("fusb300_warmreset\n");
>  		fusb300_reset();
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_HOT_RST_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_HOT_RST_INT);
> -		printk(KERN_INFO"fusb300_hotreset\n");
> +		pr_info("fusb300_hotreset\n");
>  		fusb300_reset();
>  	}
> =20
> @@ -1097,13 +1097,13 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
>  	if (int_grp1 & FUSB300_IGR1_CX_COMABT_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_CX_COMABT_INT);
> -		printk(KERN_INFO"fusb300_ep0abt\n");
> +		pr_info("fusb300_ep0abt\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_VBUS_CHG_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_VBUS_CHG_INT);
> -		printk(KERN_INFO"fusb300_vbus_change\n");
> +		pr_info("fusb300_vbus_change\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_U3_EXIT_FAIL_INT) {
> @@ -1134,25 +1134,25 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
>  	if (int_grp1 & FUSB300_IGR1_U3_EXIT_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U3_EXIT_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U3_EXIT_INT\n");
> +		pr_info("FUSB300_IGR1_U3_EXIT_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_U2_EXIT_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U2_EXIT_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U2_EXIT_INT\n");
> +		pr_info("FUSB300_IGR1_U2_EXIT_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_U1_EXIT_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U1_EXIT_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U1_EXIT_INT\n");
> +		pr_info("FUSB300_IGR1_U1_EXIT_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_U3_ENTRY_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U3_ENTRY_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U3_ENTRY_INT\n");
> +		pr_info("FUSB300_IGR1_U3_ENTRY_INT\n");
>  		fusb300_enable_bit(fusb300, FUSB300_OFFSET_SSCR1,
>  				   FUSB300_SSCR1_GO_U3_DONE);
>  	}
> @@ -1160,31 +1160,31 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
>  	if (int_grp1 & FUSB300_IGR1_U2_ENTRY_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U2_ENTRY_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U2_ENTRY_INT\n");
> +		pr_info("FUSB300_IGR1_U2_ENTRY_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_U1_ENTRY_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_U1_ENTRY_INT);
> -		printk(KERN_INFO "FUSB300_IGR1_U1_ENTRY_INT\n");
> +		pr_info("FUSB300_IGR1_U1_ENTRY_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_RESM_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_RESM_INT);
> -		printk(KERN_INFO "fusb300_resume\n");
> +		pr_info("fusb300_resume\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_SUSP_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_SUSP_INT);
> -		printk(KERN_INFO "fusb300_suspend\n");
> +		pr_info("fusb300_suspend\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_HS_LPM_INT) {
>  		fusb300_clear_int(fusb300, FUSB300_OFFSET_IGR1,
>  				  FUSB300_IGR1_HS_LPM_INT);
> -		printk(KERN_INFO "fusb300_HS_LPM_INT\n");
> +		pr_info("fusb300_HS_LPM_INT\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_DEV_MODE_CHG_INT) {
> @@ -1195,11 +1195,11 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
> =20
>  	if (int_grp1 & FUSB300_IGR1_CX_COMFAIL_INT) {
>  		fusb300_set_cxstall(fusb300);
> -		printk(KERN_INFO "fusb300_ep0fail\n");
> +		pr_info("fusb300_ep0fail\n");
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_CX_SETUP_INT) {
> -		printk(KERN_INFO "fusb300_ep0setup\n");
> +		pr_info("fusb300_ep0setup\n");
>  		if (setup_packet(fusb300, &ctrl)) {
>  			spin_unlock(&fusb300->lock);
>  			if (fusb300->driver->setup(&fusb300->gadget, &ctrl) < 0)
> @@ -1209,16 +1209,16 @@ static irqreturn_t fusb300_irq(int irq, void *_fu=
sb300)
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_CX_CMDEND_INT)
> -		printk(KERN_INFO "fusb300_cmdend\n");
> +		pr_info("fusb300_cmdend\n");
> =20
> =20
>  	if (int_grp1 & FUSB300_IGR1_CX_OUT_INT) {
> -		printk(KERN_INFO "fusb300_cxout\n");
> +		pr_info("fusb300_cxout\n");
>  		fusb300_ep0out(fusb300);
>  	}
> =20
>  	if (int_grp1 & FUSB300_IGR1_CX_IN_INT) {
> -		printk(KERN_INFO "fusb300_cxin\n");
> +		pr_info("fusb300_cxin\n");
>  		fusb300_ep0in(fusb300);
>  	}
> =20
> diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/g=
oku_udc.c
> index 3e1267d38774..4f225552861a 100644
> --- a/drivers/usb/gadget/udc/goku_udc.c
> +++ b/drivers/usb/gadget/udc/goku_udc.c
> @@ -1748,7 +1748,7 @@ static int goku_probe(struct pci_dev *pdev, const s=
truct pci_device_id *id)
>  	int			retval;
> =20
>  	if (!pdev->irq) {
> -		printk(KERN_ERR "Check PCI %s IRQ setup!\n", pci_name(pdev));
> +		pr_err("Check PCI %s IRQ setup!\n", pci_name(pdev));
>  		retval =3D -ENODEV;
>  		goto err;
>  	}
> diff --git a/drivers/usb/gadget/udc/r8a66597-udc.h b/drivers/usb/gadget/u=
dc/r8a66597-udc.h
> index 9a115caba661..fa4d62c32ea1 100644
> --- a/drivers/usb/gadget/udc/r8a66597-udc.h
> +++ b/drivers/usb/gadget/udc/r8a66597-udc.h
> @@ -247,7 +247,7 @@ static inline u16 get_xtal_from_pdata(struct r8a66597=
_platdata *pdata)
>  		clock =3D XTAL48;
>  		break;
>  	default:
> -		printk(KERN_ERR "r8a66597: platdata clock is wrong.\n");
> +		pr_err("r8a66597: platdata clock is wrong.\n");
>  		break;
>  	}
> =20
> --=20
> 2.11.0
>=20

--=20

Thanks,
Peter Chen=
