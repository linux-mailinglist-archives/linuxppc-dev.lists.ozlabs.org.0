Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF37186E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 17:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWYqZ5Zdyz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 01:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=mVkVN2GJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::629; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=mVkVN2GJ;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWYpf68Lxz3ds8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 01:58:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BONIg+p4Rb02tFFBaP/yXrSp7mW3fJ+Yl6WQavbJTILte4vjjfeig1CDiOSvjhlwkYnn/r8kGvHz0kRYJ3iKGeMBcG0mJcOqUUWUkjeVWD9n9TRDNpgTpgVDVNzzKrUZ1FKQ/RpAyBh/fye2qSuwCDTLLIlVQujH9tBQtpwZytolvVoJAzP7kYj9olhA8bzbTDzmyrRNdci0tkzjcT3ZEiGzHkjuGXZjRY+ogiyrkXQ7oIQPo8zYnUku1sEg+cl9+huqRrg2O9e11SFfwWwCkE5qV9Om33bafLZ32LhiXvcLmBn1RyT34oB+QqVc7y5RLmhj2v3OB+frNoFAPbXjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boJlvwA8GXBA8Kbfaa8ROG681FSTNsQ7fqM7Un8FSbw=;
 b=lL23/PbQF4C71BCeoD6y+yjfjRnInb/5QXYYFG6aARu/IgipDsybYWdNRqZ5Lk/FKyK2fUw8EoB737pke2rvZifCADnE9J+D6dy94egj/Rb5e/BSr0ThW8h0UviSbfP19O8VwHcsqC6CIIfr1EGUu1huLA9Lc4KJ3nbrsnFRBXL5JZyojwyjcx5bErp7OMCdGrnGCvF5ffdbQb0jJkjAh9jY8zwccPCwX0Au68Ku6GHzbYbFdrKX8IRTIm2E261KbwtxqEL2doBDJNhv6TWMHON6zV27HW2autLQbZ1ZwenMex0KNkaknlyo5sBv4kNQSX6/A6RzBqP93L04DAZH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boJlvwA8GXBA8Kbfaa8ROG681FSTNsQ7fqM7Un8FSbw=;
 b=mVkVN2GJfbR5Tka57Y1MbhDTjTiHxhEgJP9YrTq54CFiTcK0DYBmEx/hSsC3AZXR1fKfQLtglX3hZpLbxAGDoR0VEYz21Syu3tvtXeYY4JDPTf0xQWD/XE8qXUDEf8eh3KyQfz06t6/D41I0bFtP7vQMK9K71XV3yTOulBI3ipo=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by PA4PR04MB7568.eurprd04.prod.outlook.com (2603:10a6:102:f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 15:58:26 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::3231:e5e6:ada2:3443]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::3231:e5e6:ada2:3443%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 15:58:25 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 RESEND] soc/fsl/qe: fix usb.c build errors
Thread-Topic: [PATCH v2 RESEND] soc/fsl/qe: fix usb.c build errors
Thread-Index: AQHZjDbsx/ZeafZtcUSGJ6gh0xsbBq90mO/g
Date: Wed, 31 May 2023 15:58:25 +0000
Message-ID:  <AM0PR04MB628927578DB64E280F0FAF3A8F489@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230521225216.21795-1-rdunlap@infradead.org>
In-Reply-To: <20230521225216.21795-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|PA4PR04MB7568:EE_
x-ms-office365-filtering-correlation-id: ffd2cbe4-a8a0-42dd-9923-08db61efde2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +Cq5e6PZG3O7aIIscINs6kM8tnwX5WTgYZUnhU9U++kfB95O0NuIBXdvRI0EO83/iMaUPVaH14vdcKMdqg248oWRUOutR3J7pg50ppJ4kr/Y6Q3ptx5SGVMqbvlQ2j1LGslw4HiayXyvt+lPJcoeKHchPpnbyAlSTYcRkHaThmcjf6zvD0iLb3faJ+gBsal5wbg64i8xOKQ7inADZ2ct5NWeqQkU/bBGt4Lva6NIYUqp5d69t5ffnnT1UtJyBch1IhDy4A045wK1XKyCDJq0JXKXGrwjS0dspGJXh9ENyLPTBfNQKl/fKkvRQao0Jd6niUqPTkKMoZAH5RK89XxMnaA+bJBuJD3aavhcAu968bqK6r1DkBJkZFe68Fy3TP9mEa/El4eBIrjkg1RVW+CF+dcfosymRKp8zD6J8ioZxNuTPL3rbdFuN9gy0babcoBp550BlFRjJ1ubP4LPoYDKmzkKu0cH/1WomAnBQ0Sib3DWrFhQlWrhZ8hceZvy4SF5yM/IQdYAKEcXJfWsjRVWARKOfWz6Ef/NGAQnGZiLTxLkPDpx0+itb5tHB4aMcs7uTHS8+Of8UMQMyf1qcDapTbCOrl4AjaClqYn6GebIaDU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(38070700005)(7696005)(71200400001)(86362001)(316002)(5660300002)(55016003)(8936002)(83380400001)(41300700001)(966005)(8676002)(45080400002)(7416002)(478600001)(38100700002)(33656002)(186003)(122000001)(6506007)(26005)(9686003)(55236004)(53546011)(54906003)(110136005)(4326008)(2906002)(52536014)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?MQkbrEySf+7RG/mfcUYGUT2Gc6mRJudFDWsKgCvR+72j12nHv836UVrXvv3/?=
 =?us-ascii?Q?+NqdoW717b1wQEIAcBcDSu39ANkr3eugzOR4rRpvtV8Aa8n4Nmxk1XhnDrXT?=
 =?us-ascii?Q?HU0vIaFCuCNokqXnCenyd8Zd3nfWe89DgwZv+KGFA/LvwWtgPRc8PfTVC+x1?=
 =?us-ascii?Q?Kn8UO+eInF8PThxaIQ+GR2/aOAywvo4UxTHlbT0+frdf+Ged6a4G+b4Nev2X?=
 =?us-ascii?Q?MAtUmFOzM3FzBcRZ5TPGaQ4RjMrPubjiIlO3fbq3/Us4gy8cfuSfbX7ik8ri?=
 =?us-ascii?Q?K706huRv5fRXxOzEvG8leA1onkXp3nkVMum5iLc/UDfVAIORxEF85RDmNXd7?=
 =?us-ascii?Q?gGPkrSK81IGS145f4AhnxUbLFOaoDSGcrq8ADO5Qi/LlV4gqbBcokl69cpy3?=
 =?us-ascii?Q?XXinBdthx1NAw/nQFaaqEwxamPM5doL/ld0W/zzDcuGSzBJpRcNrHHBwumBE?=
 =?us-ascii?Q?7nG3LfolUKjTTyU7A92oJH/xwRhOfytqpj/T6/ZJrt0n5Du3JidT32Wm8NRi?=
 =?us-ascii?Q?mGwNpk/9ZQVSkO79Rzvx343cQrp3PcKaBtJBIpdeR7rYwHD+W/oyg9Do7LRj?=
 =?us-ascii?Q?Shzg0iqJg1jsecj3VSrE5BEughXhDu+7L1BtqOoc3vFt24x9zezT5H1R/h0i?=
 =?us-ascii?Q?sWBpctW7wBAKuYUaQbXhMKPnlFUItHiViGxvu21zprOrpn1rrnNtfJaoTOjK?=
 =?us-ascii?Q?COtooIKxMVWtUBKZ81UtnCvI4HcJJ7a3CI8Z5GHXy9WrrlSfYSpNITp1eIA0?=
 =?us-ascii?Q?96fhmvMjoamcrhYHsKa9Lxy6/iF2HNqr4CnZtpvHdtzDKItR3RwsI7PHYerk?=
 =?us-ascii?Q?sIhdF5a3BbDU2gdV3x9XeFhbGCacCNBFQLHGYi9gUqVmQgtojMrmWtvc9Tap?=
 =?us-ascii?Q?/0H0qcMiwLpM56DIRBkOTuMLAQysELHNGRzi/xywVkV2FCoDivwwM6RU9tN3?=
 =?us-ascii?Q?LG/EiHyEc32MbGL+3++5xHH5s9Fv8YFvTT+4u70RH9cS8bZrGyQegPGPKHtP?=
 =?us-ascii?Q?J8m0BD79iTs2emHUdZDZGPb8jgFsEaHd1e3437fLlAY4pnR4YESSdJkYKCoA?=
 =?us-ascii?Q?yDbxWVT8Jqz7fMNQVL9jWgXhvg9BqPEVALE61d3Tl9hmCYIgYfiyU9/04y+o?=
 =?us-ascii?Q?Ulr/OPJXu0GMz8+/NncY7el5JVU0viWzWx8FRwTg/08UD+hckd7TWa17FEry?=
 =?us-ascii?Q?bZ74+EUu+Qomq9uU6My3y0Qxq3hndwscXFD1F88kN16YXb4A8gRviCDcsVjp?=
 =?us-ascii?Q?ovxK+TkK3oxR8BSuEf2xBNuLDe1Q9uh8hnIDUmpMXzssWJdgK27HsIJsjWVm?=
 =?us-ascii?Q?tC2BQA/6732bLvyxzhS1TmJfLChOpJuLjXFcK/ONMaARs4UxH4BAtnDtUhqG?=
 =?us-ascii?Q?X9XHsWGehzvwHYLDpzGC/b7Far2T81gXb077st6c4h3TqB/RYXpO4r3TOWlO?=
 =?us-ascii?Q?laUsmwe0lJ1a1FrAADLgvvQA0xT+/cBPghh6WsEx1YihgTsUY3N6KmX4hwv1?=
 =?us-ascii?Q?41/figKrFObFTML5AOl0EVd1xiEWdCneS3zofvppnaKQ21WCeVfnGlFrFlHd?=
 =?us-ascii?Q?0U4OlRKvH3RQBAMVybCkmQaWOrdpTFFvV7EM83Xm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd2cbe4-a8a0-42dd-9923-08db61efde2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 15:58:25.5340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgR8FTSJJgkbuWyfch43VZPTmCk8jBQH/HLjRWgF6s4C6Eb7TbxjOYeEHkcJd8NVmGcywSxyzD8F8+c7Gc8HWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7568
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
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, Kumar Gala <galak@kernel.crashing.org>, Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Randy Dunlap <rdunlap@infradead.org>
> Sent: Sunday, May 21, 2023 5:52 PM
> To: linux-kernel@vger.kernel.org
> Cc: Randy Dunlap <rdunlap@infradead.org>; kernel test robot
> <lkp@intel.com>; Michael Ellerman <mpe@ellerman.id.au>; Christophe
> Leroy <christophe.leroy@csgroup.eu>; Leo Li <leoyang.li@nxp.com>;
> Masahiro Yamada <masahiroy@kernel.org>; Nicolas Schier
> <nicolas@fjasle.eu>; Qiang Zhao <qiang.zhao@nxp.com>; linuxppc-dev
> <linuxppc-dev@lists.ozlabs.org>; linux-arm-kernel@lists.infradead.org;
> Kumar Gala <galak@kernel.crashing.org>
> Subject: [PATCH v2 RESEND] soc/fsl/qe: fix usb.c build errors
>
> Fix build errors in soc/fsl/qe/usb.c when QUICC_ENGINE is not set.
> This happens when PPC_EP88XC is set, which selects CPM1 & CPM.
> When CPM is set, USB_FSL_QE can be set without QUICC_ENGINE being set.
> When USB_FSL_QE is set, QE_USB deafults to y, which causes build errors
> when QUICC_ENGINE is not set. Making QE_USB depend on QUICC_ENGINE
> prevents QE_USB from defaulting to y.
>
> Fixes these build errors:
>
> drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
> usb.c:(.text+0x1e): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock=
'
> powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock=
'
>
> Fixes: 5e41486c408e ("powerpc/QE: add support for QE USB clocks routing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link:
> https://lore.k/
> ernel.org%2Fall%2F202301101500.pillNv6R-
> lkp%40intel.com%2F&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca43927d9
> 554b4434845608db5a4e0db5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C0%7C638203063513512722%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> C%7C%7C&sdata=3DLkLi6lS%2Fh3pVXW%2Bg9fauCWmptC9lRt3sTdkvn0Extqk%
> 3D&reserved=3D0
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Leo Li <leoyang.li@nxp.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Kumar Gala <galak@kernel.crashing.org>

Applied for next.  Thanks.

Regards,
Leo

