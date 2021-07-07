Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB893BF285
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 01:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKwm149xLz3bqm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 09:36:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=eckelmannde.onmicrosoft.com header.i=@eckelmannde.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-eckelmannde-onmicrosoft-com header.b=nyoOMG2E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=eckelmann.de (client-ip=40.107.6.81;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=t.scherer@eckelmann.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=eckelmannde.onmicrosoft.com
 header.i=@eckelmannde.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eckelmannde-onmicrosoft-com header.b=nyoOMG2E; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60081.outbound.protection.outlook.com [40.107.6.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKtSN7212z2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 07:52:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGlI00tOYmH5JlziKq/YJEi2G81qTDnMLXD0g38ik6DfnM0fAeopR4eLT1hdnPRnDZ8i7uO633WimO/ulohWRnVDoKLAj4ILVrE4zuY9aQ6LEKOQmLg5l8BRTZXvolUV76N/CHs2wIIPjO50NILCtNWIwpD6kbr3U2UpK06tAsjz9TMSIk9eZ5yVZ46e+0twVfz/6v+r9lC8p/2r0BXU11Hyu7ysatrFHXI026sSArYV19vJcH/xiqTRCvRpqFWea/lksv3CuKfidvMK+fsJNku2nB1PNOaXbiqtp+HcVtui12vXXAr69WiFh7Rd0y5kvtAS5fPPGYTSiAGbgLI9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOlcEdl7QPNc6aw+1dLvTyRyvVtdMsDxOzlMGNdOHQA=;
 b=AiHB8XcWUzftmRQ8B4O/zoeQlhLDIu4bcW+pvwfO5IsHVyUGscy/I9slvdI4WgQVktekfnhryaEwdFwTFR9imSMoCc7ARUnSrm1lo0QSMZZylMpO9wmjhJstddGpfrjQzsjZ6jsxhAkML4Y7hsoIfHC6tg++Wry/XcWXGJSlXi8DgBGUqDzUjEat06vi2vUN3x6vP4m+8BkhOlq3PsVo58xAjDuzfXE5VEmUY9jJo9CFe09LXvRtMvEygejTKmsr77qKSu+EoDaglo0q6aconvgiVlPLTKovwKAKscuSXmhWqg5tGP1bUJuT5wpB6DoQThzZyVtb5TI5bWVDfJIrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eckelmannde.onmicrosoft.com; s=selector1-eckelmannde-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOlcEdl7QPNc6aw+1dLvTyRyvVtdMsDxOzlMGNdOHQA=;
 b=nyoOMG2EmWX7k1wjdqkZw23W20Vbar7Ie7yaBQcRChgP48y90jPdfJOftoeeMoO4Jvuck46m4ECg7nBFX2PDldDe9whxUm102xMg+bGkcq6MSVWb/aizip8qyVPN1ROdiJG6B3GhSHSNuHYFfZgsJa7BNBB0tyB8MvXV6LjD+K4=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=eckelmann.de;
Received: from AM9P189MB1700.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2fc::15)
 by AM8P189MB1411.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 7 Jul
 2021 21:51:56 +0000
Received: from AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 ([fe80::cc15:eec3:792a:3310]) by AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 ([fe80::cc15:eec3:792a:3310%7]) with mapi id 15.20.4308.022; Wed, 7 Jul 2021
 21:51:56 +0000
Date: Wed, 7 Jul 2021 23:51:54 +0200
From: Thorsten Scherer <t.scherer@eckelmann.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <20210707215108.ervxrkmbitp3l2ej@ws067.eckelmann.group>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: PR3P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::6) To AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2fc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a00:1f08:400:4::2) by
 PR3P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 21:51:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8987669f-0789-4189-d163-08d94191700f
X-MS-TrafficTypeDiagnostic: AM8P189MB1411:
X-Microsoft-Antispam-PRVS: <AM8P189MB14112A254C08C477E55D0F8F9F1A9@AM8P189MB1411.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb/VPh7eDx+8uAXqVeH7DJbNAOhaPuWa3f5CT3h/INJORJ7mDCVWkm0CgKnudmpM9LI5W5r92BSyz0MjERB/4Gl2oyYOs5kUzr701FfZiZY78zjaiiCvN937bnDKnFeBpH+5Eg0XX7n3GmrgtwbkOF74I2eM77+1VB/tY4YSiuWcARdLL6shSP45qF4FNj14/fNhVk0AUdcYfeOIsUk5I+bI5xtVyT9lRX30HosaKOFmZ7WZfL8Pedh+pb+FJSZr0vQK0xnGVagwa0sx0K5bG8EuKmDPkT/kHKOPCLtGkAy9cHH/TjUWbnenC+qYCABLS+BPXtsyhf09uojC24nCdD6qpui9tRfVEwLNN8soTS1mPqkyUjZbH2duVE8voOYUrFxoT5VB1WCHtBxJ5pf1YHLlwyNdvfjWduXRSI/1dx+pMFumUZbz4qaAIhbKhp3k0T8lKtEnVUz1tojhWXN5dkSDoOv2v09TWzbH8JNtjcm1shSJu2Ue06Lwl4vcFB4WVvzTisBKRlH4667qd3Fi6Wv0p3pLcBqXqFfUQmYbwjEjD/nEc8Xh72CCIvB6O9DMV7wGTsqVy1qgEVLiQb7fmJ1dUl9klnw57ekGd3WclklG+03/CyMV17aN8kRx6CvN4qltad8RnDU9uLm1fTUAh5SoGDVUWTVbMn1GXRNjoedSG7LnFrqmeG64bEyhrVjZW5I/ar6wxxFNkjqLmm8bNT+cimHXdWK0dPvh0tD8gYmiOnkVIw4J0AkuOz9DJBQNbLVcUoE/FBD9hslaMn1fvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P189MB1700.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39830400003)(366004)(376002)(136003)(4326008)(6916009)(4744005)(2906002)(6486002)(7406005)(7416002)(15974865002)(8936002)(8676002)(66946007)(478600001)(86362001)(5660300002)(316002)(52116002)(6496006)(1076003)(54906003)(38100700002)(66574015)(66556008)(66476007)(9686003)(186003)(557034005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eDZZLUdi0LX9JYklNk1x7DqZXpMygmSWtSlaRlIBVNvRThOPePohfCLPA5?=
 =?iso-8859-1?Q?vqTMntKBtCEzz1xuRmWc4X3UdMrUl1+m/hUKXWwf8ByXww3o0gauh+nl2C?=
 =?iso-8859-1?Q?69oPdOhoDszfyN+oGyL8lKfkoIoELQDUp0Ha/E97SArD/mEBG3+8tGTpoH?=
 =?iso-8859-1?Q?R+/Dsd7ze7SAecXrgTcbqeE58MZtNUpv6qc3jyupRynVRxr2WwsDmPuw4e?=
 =?iso-8859-1?Q?VI6CvmvETAdFJ7Ich0AROZZHaaUyJXsw/T2LNLCk+NStIuzMFGKY/Tu6Vv?=
 =?iso-8859-1?Q?O9IX5YhN0GV5QDX4Gsp/qDQURyrnlnkOC6lE8kQoPlhRq7jFr1VnQWEVGh?=
 =?iso-8859-1?Q?4LphKn/5DEwUQSIv8a7ViE8raLMb4ZH86eg3sfpHrl8s4+QoxOdloluOpj?=
 =?iso-8859-1?Q?C9Wn34IqqcUow6TqqcoR4ZBmSIL9f4N5vo+8qJiIgtqJFtTzxqKOkWerSD?=
 =?iso-8859-1?Q?BWaD4YYbjzfF2ilwbrH+rqO8VnQXI5ld4/X1jcyMYvHLz6bg568C7V1KxD?=
 =?iso-8859-1?Q?Y7zEert5KiX/SyywI0tPlAyuqfgQ+6UQlk+fc/BPS+uz6jMsoaLINQxYVi?=
 =?iso-8859-1?Q?P9LpStzEEQAWUszpav4E4QzsZArxc2DTNOGkorJY8NnkthOeL7CBmQ8uSw?=
 =?iso-8859-1?Q?4URnC8tb0wov6bGORczmFXo4v5xsDTy+Y56CvMO7rKQ+mgK3EK3ynmizZ6?=
 =?iso-8859-1?Q?N7XObtVUWYuaOWevEeC5xqeZAblK7p/xBUrOZS/l61QdC4RpPv9x9LvOAn?=
 =?iso-8859-1?Q?rj5gjedsRyLrfjqZmVJD83C87tjMqZcwwWTTJXAZOK2BL6xcf9DCZeazaK?=
 =?iso-8859-1?Q?a6QmImE/vabFEUTlnw9THp+zXcbVPVJwCtXiHoFGQXYyMCIt6eXWo8O0vC?=
 =?iso-8859-1?Q?XslR0dVr6kKfKIJQ6pn0IKWgBw90OARdiPlJO/xswtkxlwACx9NcI/a1gf?=
 =?iso-8859-1?Q?Bxw4s+R9Tq/3wzGyGeszWMKLIr9cxaPrn5ywIu/smDokwdrndWaH8PiJlY?=
 =?iso-8859-1?Q?PeZQQzAB0LsN9sLV0OTfnoaUFyOd/NO7G91skbNKrwTr67CSMLZpO0Efix?=
 =?iso-8859-1?Q?ePmY/61Phqj1rTLGOc5UUnvgvLdUKPalem/6yK0T7emq+mTJ6f2adICuEA?=
 =?iso-8859-1?Q?fIeXJzzGT9XkhMHRlK4s9uNkklGZHW8ChgBnc/l37rX3dBSq6YR1xbogeC?=
 =?iso-8859-1?Q?vIIUdfOkiaNs6trXwq5V4kjGCaGafYjiQV1vzfd2NygYMLcH0Gy1Qm5ULX?=
 =?iso-8859-1?Q?/TafMLXdYbz3Nc2PBViPY72+XuZIeTPAyFAtWijazfS7dod5Zu9NFXXH3V?=
 =?iso-8859-1?Q?J7zFPCNC7zR7ej2QYOwXouGEQM83Ck5nULNdh8XhUk5cmio9IZQll40jUK?=
 =?iso-8859-1?Q?QIQevgKi3tv9aWyxzUZyC4tJ5cZcdoug=3D=3D?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987669f-0789-4189-d163-08d94191700f
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1700.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 21:51:56.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ur8XMZiF6bwEyBALI0qg2jMFHKKsDYaGvYi6ddYfgV7bn1VoiuIVhLN4LTrTEmRStKglRvEnKtWfYKCJBBKoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1411
X-Mailman-Approved-At: Thu, 08 Jul 2021 09:35:04 +1000
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
Cc: nvdimm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-fpga@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Tomas Winkler <tomas.winkler@intel.com>,
 Julien Grall <jgrall@amazon.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Alex Williamson <alex.williamson@redhat.com>, Alex Elder <elder@kernel.org>,
 linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>, linux-wireless@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ira Weiny <ira.weiny@intel.com>,
 Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Len Brown <lenb@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Joey Pabalan <jpabalanb@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Frank Li <lznuaa@gmail.com>,
 netdev@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mark Gross <mgross@linux.intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Allen Hubbe <allenbh@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Jiri Kosina <jikos@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Michael Jamet <michael.jamet@intel.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Johannes Thumshirn <jth@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, Jul 06, 2021 at 05:48:03PM +0200, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.

[...]

>  drivers/siox/siox-core.c                  | 4 +---

(For drivers/siox)

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

Best regards
Thorsten

--
Thorsten Scherer | Eckelmann AG | www.eckelmann.de |
