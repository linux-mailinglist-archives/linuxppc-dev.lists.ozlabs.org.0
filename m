Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCD78368B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 02:00:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P4Be3k9Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV8cg1rjtz3bvP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 10:00:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P4Be3k9Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::61f; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV8bk6fYCz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 09:59:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLTE5fOXH71ptrUZ761FJmzwOSUmjp2i1LpcID/KzLWGuo84y7UvZSjK1zsIBiYKyziR3SmrhD+c3/rJE9BsKineB7LzD63vkGsUZ7xhVq5WtFjwI4W+z10mjzK8HYFo2sr+PXJzDPjWsiU5vd1V/gKXVpS4vN6LmO2ExhigDNkWGV6ndK7Mczff8kMXYJjKfVEuZVjZ4lWX1/T3JUxPcWyGrW6/v6ceEfsGlPvjOlCalFvHeF7rKBzyWyx41vZEc/nG+xt7VFhVVTUgE7E48VYLRnApxiiUak9b1d2zg7iRbNyl7UppOXO7GXrW+lHXbwb+ILgynlf8NdvE6hjWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcbu1paDGnFGdmehKihMdeZWwu/qsfxIDhk8wq0uJYQ=;
 b=D/J/sI1d1QWvegq9mCO3pfpi7kP03P4CGa9pScsiElFTrzXfp+zXmcCHtNjxN78RLIhcm5T8PO+oj9W3AS8zSmRqSS/Yn6gENxKo0huKx6Nim45XGbAYE9eErnOIw1DUrxOPa5gEQSaco660u91U2lJGFjNel5UJU1f2u89lph1x9efZEd/epxZpLx1XPakVijz0uEkH6Kv8sU4I9btBz6Cs7kjByQTTfLicyG63Q5jdx8184nKVx12XL/FFzcmadOEtUObvrClxzg6XkDX7KTEeA14SA4tEDWN738jN1s1lufBlexZMsedNJYWAkAxt5qdbPJsHmgykupITsawoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tcbu1paDGnFGdmehKihMdeZWwu/qsfxIDhk8wq0uJYQ=;
 b=P4Be3k9QspU2VHIPOuThxoV1u8wyeSw2GbdaZmyTzDCP15EuSoe3Z8Jp5xZJfiB1VP7cvV43YWpR2U86xNuzHSROH3oiw1zbJ+FOFf1AHYmi11GGQVfbVRfXFNpdSs1mOqZGF3aIa3TCGjIPqc+fHsvxy5MlaaGrDBWN+7Wc4kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by AS4PR04MB9242.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 23:59:21 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::d4ed:20a0:8c0a:d9cf%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 23:59:21 +0000
Date: Tue, 22 Aug 2023 02:59:17 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230821235917.mzawnkoi7oj4zgm6@skbuf>
References: <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
 <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
 <20230821224834.ppk4hmjyajupy7va@skbuf>
 <a4828cf7-9cac-286f-0aba-fcd1688c8422@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4828cf7-9cac-286f-0aba-fcd1688c8422@seco.com>
X-ClientProxiedBy: AM0PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:208:1::45) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|AS4PR04MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: f61a58de-31a3-4e1f-c5a0-08dba2a2a375
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  pTV6WApPrrXPnYm9WoctDI/QZMlkY9otTM0871/FhQ4X17qaQAZyv+OsXLlptWtoJPI1+CAxpYn6ob2tz6SIpCFXmXrg2/v+49TfuwOFsVuoVDd/Z9W/ib+OyWtKuQZvbCbdV88Oq2d7mFD6+i1aYs5bSHYTnU2gmZwYfUDo8dAwWD2fk3gR9fgx5YhbsJCO2v6/dV7Bc9Uph8yymM5QMVp+OIJEnAF0RJA0Q4BvSFBFNE2JJLMd6px6UyHSyeQ/2QnFuPs4Fa7Fe+tnhVVw5B8jxFueKUBPKAwt/MyUFwqBLr/TcJMJWC9211mSJsha78hsq3g01/2K6nc2PjKJNaO9/x0/8uQxt653WcaU8g8dT0w+yMRFB0muEcXozGaNIaLdf7DFWT7/IJ8lVO6hkqIOTqCly+hoh2cGI4fYmik1frpECJ3sB7wcqOv75cX/0kb+PT+zW7Q9zZ4xDIqXRp7BEx8UFyhtVzbpFObYv7JvflhQjB0DMIulVmbIQChK0fgsAFEXImBCQ8Yh3XTOsYSHFtqJUmy8lQPGiKyQXvj7PAkdmLQEHhx5LDyrfovJ
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(9686003)(316002)(6512007)(66946007)(8676002)(8936002)(4326008)(1076003)(33716001)(41300700001)(478600001)(6666004)(38100700002)(6506007)(6486002)(4744005)(2906002)(7416002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?hEvuIxMcHtlqYLGDTrZot0olTNhXyYTr9TyQwZgBxUWCn45Aum+uV+fXVDYf?=
 =?us-ascii?Q?J4aMgra2dCtMROIqDWTcnMBxNnFPxmTyCdZciH/Hk3x8EfoPM948YG0C0qOT?=
 =?us-ascii?Q?XY5olS8Id4cWHpqDvkL3OG8IIMa26aik7RJhOqL2QHDiMWkdKY5/8Nh9MHCj?=
 =?us-ascii?Q?k4bVY686qvSh8Jijg+CSqHcKDVWM13njwYBil7vF5vLEW75Grhi8rX1K5z8Y?=
 =?us-ascii?Q?qBWcqr8jT7tthyNNsJWu6SKSsVInIW3oMeJnYghjjBuVUQrecYwaRjGuV5oN?=
 =?us-ascii?Q?0XOZ/uSFlp84avWoT8cjHxBrlEDhvhPBJzOpsVFbCdx+KGcTxXXoL4MrFlrx?=
 =?us-ascii?Q?UGdF8uaN5iw4TC2MdTdUGKJwzcZdoQWfl0Xo5vCTJFPMLWcky3NFk7v8f5qU?=
 =?us-ascii?Q?48qQlSkJcEeqoCagb9TcfQPBEWQttFV78apiB+UjzJkJFHZFkTjyFdCnbFI9?=
 =?us-ascii?Q?ToBNYvI+l4e+H40xEWtb58u5oFE8GHvLOmthEESgMKrh2Z0WpIgRg83kM3th?=
 =?us-ascii?Q?z0CSSBiAIXbL0aDnO9z0MmkDyBTOPbr3wtT9itOkA38AKzYdQRCdAu4QoksH?=
 =?us-ascii?Q?llplfsnFJuusOi3szCsSVTh9w91ygs1q061zH2IRhb0a6eVRp7509RUruzb0?=
 =?us-ascii?Q?sFcoFgxAafVNReH212KIGAnc58CAvsB3ph7DQEBOc8dCOXxJDxHxSUXrkY/D?=
 =?us-ascii?Q?mJNdOQTr8poYvy17kdrJUqpzFnjrg1RQNXyFaLNhxlH6gRdk1oCSRsCiRLXH?=
 =?us-ascii?Q?e5juN7jbJjFDYtoKs4/1v8miwaWaoDRjPuIuLcJkGnagLuIIq/f04v9Wc2+b?=
 =?us-ascii?Q?E3xz6Xa3PV5Aw2Yaf5ovnoIP4oGeaqcjXB4TZqkJ6l+vMA5Dy5M8ijG/q5Q+?=
 =?us-ascii?Q?G6gf8R4J18DMae770xGmiQ/Dsp+H2yfOY1P1K7QKPu7tjQpPDaIz6jq3Hj68?=
 =?us-ascii?Q?owiq2B6tbsdkTppuDRvaJ1OQXlonDHyJJkgcpt10h+oGXkhWBpFIuXQhRwQM?=
 =?us-ascii?Q?zXM6YwhLtR02JT5F7fN6ersdGC19c8kSLyr58H+uK1E6vJSR4fE7rnbYqDZR?=
 =?us-ascii?Q?GyeYJpsKwLS6TjaK4f3ACptfKljqH/d8z9+Yq+Rwl+aHFTIx3FhVb1mfeL/j?=
 =?us-ascii?Q?327ZW7YoAP57tz62HE4oFyh8WUN41v58Wd2RPT98dmOAKnP/fSknXKZvwZVY?=
 =?us-ascii?Q?GQFBoopjGbokW4aFe2f3YpXXTLPU+Av8+2scYdGCO9jP6LNiuwfH394Dob3A?=
 =?us-ascii?Q?7SwNBGAzu1v6P9f4DyIb1Z+A5+8m55bJlv8qluvs1z1COe2lUxr5JYpUYUC0?=
 =?us-ascii?Q?BdKNV4wV0qgmdeBx8axNWVnm3FUsWkmHv86gP/skFY0TG/VlmGvifVy4lbGg?=
 =?us-ascii?Q?yS6nJ+e9EvVQ70d8seB99Bq0L45StkJrFmilYXVodzwxkt1/KmdVeGkJQ9Li?=
 =?us-ascii?Q?hum+LO5DWnow4SJ8Tbdg0aMUPe5xA2N09a5c4NrtshMu/Y3BBRyDtQ3gjdvL?=
 =?us-ascii?Q?ZCmVqFfqpbFESGBbj5Mpv1cAtvCTpMQQhEOuCiXTAIQdegZneXqWmMm5V3HW?=
 =?us-ascii?Q?jbYHl6hdsYM2gekHAvZ/TmBv1rzMuRDiDVyydpjFoXTgCX8uF9eyOamX1LS4?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61a58de-31a3-4e1f-c5a0-08dba2a2a375
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 23:59:21.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qR9oHOjqYqVgZeNkrdUnY4E821p3S6ASo0J+3ARUpwJmxh+H1kqVLfuyWIVtFslYcFCkktLC0+Zodhco8XaEAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9242
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
Cc: =?utf-8?B?RmVybuKUnMOtbmRleg==?= Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 07:39:15PM -0400, Sean Anderson wrote:
> Well, I think we should take the opportunity to think about the hardware
> which exists and how we plan to model it. IMO grouping lanes into a
> single phy simplifies both the phy driver and the mac driver.

Ok, but ungrouped for backplane and grouped for !backplane? For the KR
link modes, parallel link training, with separate consumers per lanes in
a group, will be needed per lane.
