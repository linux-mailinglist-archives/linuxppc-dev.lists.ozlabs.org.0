Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E86C7E9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 14:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjjSv2HByz3fTS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 00:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nqBnS2bo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::608; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nqBnS2bo;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjjRw02Lxz3fFD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 00:17:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG0LnDbApXhX1Tdec5y1BN0Ql4CJ1dnxOjB1c02F3xVuDItlMl8Q9glituEWarJavSbbwfzBkgiIe9vzBkvK7eVxp7AC37tDYIVo00CiFa8OEfXx7u/UnqpAgiM9eEcVxz2xrk+3TCpaygYtMgb8QGCIy0wLDgl2fagWJuz2zV6s7nX/ZcchzLLs5hQfHdCUhPWaQyykI+DCjelbROffbPqaPcVUhNTrkniexLH0+rPMd275oFjgHctTBXiZLJrtgOfa8RuOd8d2LsPAO+n2Mkk8vB/lVM7/fmHgFzIpqXFChQ3P5km6QVaCaWV5rMtNrKOjwKWauiKucKNbfDqKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ll1U7tV6Vaes6ux8Tn9BeE4m6zMkrazQmszni+mKumA=;
 b=E+cOkS8ZChLfWlyX01N1SQ9fHVfrBvazU+zm/RnwiByxFhSh4cMvGC7PMEblsGqIEgAWfztl0kINvDexFXnv7fGazulA3jd9vP4TW2GyaKdj9sW/pMF4qiRmhfOeFo+qG+xRhAljg/nC3fqsaPVhmTRpu0y994a27sTdEyza7g0Igfe3sSEwX5Lptz1P50HXbe9sNreThlLH2JCF8MvG2/XZplcaBWbuO/efxti4p2taQZfW/b8Vqd8R8nlF8KfE2q5+7Fxu212ZDRg413Vmyhw5WMT0MWEEjnvp2u1minJAyV8eDrGDZd4UX0KEXcp1z6gJRrTOrRQTHmqBV0aZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll1U7tV6Vaes6ux8Tn9BeE4m6zMkrazQmszni+mKumA=;
 b=nqBnS2boTiYLfGzQxwT1z3ce3vV8zM/OScZp1ATMOcoJ08yQKpnpbhimevzer7vbPvwkRtQC2xBH9yI4qqd38Gu15bHMsbxoXejLRbEb1uZXN2lc+KF+FRoj7HAZXeCBnlbxTJQb7whNjzM3ykCLrdvotnLhzB8VfPl9BUUFLPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22)
 by VI1PR04MB6958.eurprd04.prod.outlook.com (2603:10a6:803:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 13:17:06 +0000
Received: from GV1PR04MB9055.eurprd04.prod.outlook.com
 ([fe80::9c6d:d40c:fbe5:58bd]) by GV1PR04MB9055.eurprd04.prod.outlook.com
 ([fe80::9c6d:d40c:fbe5:58bd%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 13:17:06 +0000
Date: Fri, 24 Mar 2023 15:17:01 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Message-ID: <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-14-sean.anderson@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321201313.2507539-14-sean.anderson@seco.com>
X-ClientProxiedBy: VI1PR07CA0129.eurprd07.prod.outlook.com
 (2603:10a6:802:16::16) To GV1PR04MB9055.eurprd04.prod.outlook.com
 (2603:10a6:150:1e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9055:EE_|VI1PR04MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddacc8a-5973-45be-ade6-08db2c6a106d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  Ijii1cr1RFnHoaEAenRahE8qP3Ik5tGWq7YiLg1PL2+dT+1hop1RsvMyaJJQaYk4J1660jzdZAdUaWGi1ZjQJ2KGAHEubye4g08AiFx+J6/qhfrJrhjtQcvMZjD6NYU9M3miM6spglWWDAftKoXH7mlmfOkhzE8DEXViYnIBVQdffUSHfRdQqBox4mseAHZq3IKSXjzooyHavP4yESP8ZU4mwY0XOXj1Boi54ejPSxkyOkAxUJqRTMJBLjWgXNWWGGl2jxDW1ua5TRLcg/nvqg6F6Sd775S7/fQLFliY5IXE1PHg1B4ojSy2OvXSyRVOdJL/f+k2aYSeqav6qQfibkcqMusz/yb7mMMvgvjctfqCE8jqMOZkHQSTl5klIDHCbaGfW9r0OMTUBNlR8Et5VrAOIle11bvtHTeS4wtz/vRWaVNeRcjBJ8bNthDqgnl3mbk3L93lS2cDTS/5jezkbx5e4SCZ349+MDYf/Iaq7hWx+L7J2+Wm4dWVuv1YdxmHRgjYUT5JXNRRABguOeAWz7WizwBgSpEFQOKuTd8XlzRhHkY0H2RhegzxImKI9VSH/cw0NpWfL42/XrW+D0aYn1F0rxoDs8o0qK7kAbtLdfDMb7oAudLn0Wp2XfdyotLx6NLyEZZYHncJ9hI9/x1cTw==
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199018)(1076003)(6506007)(6512007)(26005)(186003)(83380400001)(6486002)(6666004)(86362001)(478600001)(54906003)(66476007)(66556008)(66946007)(316002)(7416002)(44832011)(4326008)(8936002)(8676002)(5660300002)(6916009)(38100700002)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?wkQWKWaTC/VSUo40Fs/Pr3EKyLHr5+D8cdfC/ljBrENpckIhNt0KSnBPQZxv?=
 =?us-ascii?Q?jyGoi/Qoum0kgOLz90CmhfXlJFlqH7sfWh23vDZjF0964a3yUAx3QvA3F76L?=
 =?us-ascii?Q?pHyctMV/8QYKn8AFSKCEtWW+OQjlo5sarnem8Pg9qoj+wnSWqlvmx7x90gls?=
 =?us-ascii?Q?iXhFAgiGs5x1xkjUbFSwEj4fCsOGGQHFC9hNa+EHWJdUcnIQ976VqJojbQdm?=
 =?us-ascii?Q?VnlgG/t7fDViLm+MdBPfrlvl7vUqNpJWv+fvSfL1cE0R7ERPRfRsHeucnJ2o?=
 =?us-ascii?Q?z7F7UBjFUyZxQPyq24oo3K20mkEJM+TiunVA0GjZSm6oEekhcTmMoOsGTNev?=
 =?us-ascii?Q?BuMadYXoWyqpkBvXz18xg9ohvORTpIAHB6OMqLq1PpfYsF9iySSy3SyuWku9?=
 =?us-ascii?Q?YE7NwAcN6sEp572mcfOuPqhmCqBFcyQEEbrDOyNzkeQ/kpnuWxkTKSJDlWh6?=
 =?us-ascii?Q?CbToQXA1uEZpsXOBb1nkUtmIuo0t73yWJ61ydjeVe5fdRp0iS1yS6DsRQ5f3?=
 =?us-ascii?Q?2ldQoaVppKvgJXEnRZ4PTGIEblrY13CY2IHcJG71Q5CZj4H9/1q4HQLrRluH?=
 =?us-ascii?Q?t4g5hR3zh2d0d+q++WKGwtzBBYOHv3Ue43hnBYxwhdNCFQUw20cCafN73qjL?=
 =?us-ascii?Q?roXy5/VoiWAwb/sVyN6UMe6u79QEL/HO2UI+4s48JZlWQql5vd0ib3/q8V76?=
 =?us-ascii?Q?GHMYTM5VRsCepjr/DpVCG/NMNntMQ4lFCHCEjBXY7iY0SkCkeXzehieaWgmg?=
 =?us-ascii?Q?dScywzMYEwDvBXJVSpmJSP3bP0hfq8vs8zCRM1aFc09IkyzE0MFqHU99KZtl?=
 =?us-ascii?Q?OG0gQvRrcY1scxjK8l1RgfBInHLPAy6RMRiyF92kqG2Kz75a7zAniaoLv9Xu?=
 =?us-ascii?Q?sgKzgSlFlOw9da+8xg0uAhbHjXXXnrT5yv1EnF43g1nzzGv0kAsrZ+beRSo5?=
 =?us-ascii?Q?eDwbPrvOyCLMCbF7Ao0vXtTF7/3CL9Bq1nBHiqK50bqEglAP5pxaf6q3vKU7?=
 =?us-ascii?Q?AgAIes2LKWLXLdelJaSYSrfYP92Yc6F2+M015NHT9y4wiD/8CcUKSHc5pdZc?=
 =?us-ascii?Q?hhvcW3fRt6sfA4FsoAsSgwjDqdFwCuA5JHUU/3Y+TykB99u4JRleRQlu2fA2?=
 =?us-ascii?Q?bWNOkCCGl7gAV8cq9elNSqbLhDrwghpMNs0rWozAlwOpBYlwFVcblpeanGrz?=
 =?us-ascii?Q?zK2e0GC7KvdC2RVJA+tm/qFakQz4sHYVNf98qhvcDm3J9PzelYXOnxbwNa0+?=
 =?us-ascii?Q?o0WpREm4Bf0R0/xv4iXwxJR8I4dyiy/6uwGDVe5hcPM4fjoPCNPdcw2slTS1?=
 =?us-ascii?Q?IN9uy2wil2IEyvHqAy6gB4Qsu4V48l03Qwdp30ZeuYRxoScDY+RVUBAbny3J?=
 =?us-ascii?Q?9nRJ2sQQIduxG2s/RgiqzbGRqLHLy0Gdpk40zpbyHcoaFuqKRwojsJE4OwOm?=
 =?us-ascii?Q?xVvdhIV9PQBQH3gcnu5e6+/kGQKniPdcXFtl9qRbtvldRPWyOgjFfc9TMTtq?=
 =?us-ascii?Q?2EObLFllDAjJzXrksc3pcqxXbTF5aCZlNFEvSOlVTYVRoYEFGRN/d6BsZWTz?=
 =?us-ascii?Q?mwLhYA1Qpv6Q9b2F2Q6XWgmBNDEx2RtVrzM2at1l7tP/hpkY2eZeUwEXsrrj?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddacc8a-5973-45be-ade6-08db2c6a106d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 13:17:05.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/+QWcrMjVEOJr3Qv4wVc40grBmlcCe9WtubuTCVXMHbecp9kCDErmKzSActFdex+POdPhuyukjMaHAlwxC4hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 04:13:12PM -0400, Sean Anderson wrote:
> This adds serdes support to the LS1088ARDB. I have tested the QSGMII
> ports as well as the two 10G ports. The SFP slot is now fully supported,
> instead of being modeled as a fixed-link.
> 
> Linux hangs around when the serdes is initialized if the si5341 is
> enabled with the in-tree driver, so I have modeled it as a two fixed
> clocks instead. There are a few registers in the QIXIS FPGA which
> control the SFP GPIOs; I have modeled them as discrete GPIO controllers
> for now. I never saw the AQR105 interrupt fire; not sure what was going
> on, but I have removed it to force polling.

So you didn't see the interrupt fire even without these patches?

I just tested this on a LS1088ARDB and it works.

	root@localhost:~# cat /proc/interrupts | grep extirq
	 99:          5  ls-extirq   2 Level     0x0000000008b97000:00
	root@localhost:~# ip link set dev endpmac2 up
	root@localhost:~# cat /proc/interrupts | grep extirq
	 99:          6  ls-extirq   2 Level     0x0000000008b97000:00
	root@localhost:~# ip link set dev endpmac2 down
	root@localhost:~# cat /proc/interrupts | grep extirq
	 99:          7  ls-extirq   2 Level     0x0000000008b97000:00

Please don't just remove things.

Ioana

