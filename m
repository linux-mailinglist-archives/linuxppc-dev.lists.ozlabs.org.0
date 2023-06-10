Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7F72AF7B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 00:22:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdsrx2l1Vz3f8h
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 08:22:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RoDL4XiI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::624; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RoDL4XiI;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdsr03vSWz3cXX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 08:21:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHUPoe26JP4KKeYEAqUju3M8UgysECKZgH2ZJxFktRgNNJyjIsqwgfXUN3hZZNjiSwfDAT/2BLCzGnutexLUeTRZoMut3ubGSEzyuaiG/HrE+1U4nN4rhE4xzpxeHQ9sNd69zoCpwj1y0+WTNNKFJZWrOuNN5V5TXKwCquhiO2Sl6XrCdMfqsNcDbxBELHzETpknLUCINH472EOmEdNPoXMlwp9a2kOZTfuL14qJWZ6d1ZisA6QnAyhuiFy89iZ/3LjMlx3JPpU/59lOerIxtc2QWPEZyCxPw6lqh4sa65kkys6lth1gDXdAoU0PG+MEYHvrhrmfTjltcEws408vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKSZO/0Qi5yRSL/CE20ZtCxT6d4ihwnB8xx0vBz0nME=;
 b=hZ8ySEBba+mM3U/rY2J00mr7RS3eJ/u+LOp9X0lH/c5UFM5mpEPWYSiUm2HtvGyHP2CkWh1Wjt2hUE9C8k/EHPnixMzXzTk50rxbczlABwD+ulucPplMz+sw3XUnC1kt8/3qM6Ddl6TR/1eT/hi7k2ZoqRXU522/jkqA6LoUaep30aqwtBsCnaB2SgfbxEYoVrf+DOWpeh1z0s7iiDCfSl1ecBbGcidbsRgMnTSVZBsNqBmvUzDA6RCeFx3JVRkmwQedGA2WBUX8KMLWdk5OqFnDKpc4T6XskQwZl/2NGT8zZ0QhmUiNLHRv0cMnKfW0xpU4BWOeHuVzToLdr3XbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKSZO/0Qi5yRSL/CE20ZtCxT6d4ihwnB8xx0vBz0nME=;
 b=RoDL4XiIn7u9sWubX5Tv9b9JhwdyzZQ+DjWlylErVP/sZGtZ7S8ZhWWHQY/faLbe5ty01hEvQ3DYMIqfx73FGQJQW74bm1LZVhsognmvJmOM63lguu4qv12bBMm0QL8qm9OvYD+fAQpZyCw0D8eX9/1YAH1vX3LJLqeXYOApBW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Sat, 10 Jun
 2023 22:21:25 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::c40e:d76:fd88:f460%4]) with mapi id 15.20.6455.030; Sat, 10 Jun 2023
 22:21:24 +0000
Date: Sun, 11 Jun 2023 01:21:23 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Message-ID: <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dd344d-f310-4ceb-450b-08db6a0106c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  cxfts+6W42RNPe6jlSWqAJGTudt6/0I/GD3Hva0Bh/KuSt7l3jvoWPjhsJEEmk7ycggr8QnLPSvtx3dmU5w+oeOnEi6Md+Vut4yizvsWIU3J74CiTCvyk7/zFPc6L1bh7iNZaAMVnHotvsk7vL4NijccXvWRQwHe1VJmvWmD72DrTWEaeBhwGyjMd6fuH6fhc1jBpcmlN4tGAUCNWsmN4DTia68nx3qoWASphEe6X+Z69EL4ksed48tUpzhxHAuxN5/AjifOjVK5v5d1owjH8s8bs6QpcbTqQSvisYIkKIXYEqEndrn/p6g8UY890pjJLQdXU3I+RS9kxm+B3EMf8izRiHrvuwPdUwRJk1WzeiHErhR6/4TJ1yyr3JF8Vz8sxVZmUsM2BsdlRxkt1B1KKxgm+vjmMP05NmoLXYyQhOWmyP8Gb+VLgXj8HhTqxlSCuK8ErKVCeLLKaosalCuvjyDK5Ji4kHeN4Wh50vgktim9UdNOqBN0L5HZzt8vY5fDp82ga26Ni1i4QN2SWKLG+zB7CfPX1alALmTsjhBzjyb5RkSiFA0lderf55Kz2iYZ
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(6916009)(4326008)(66946007)(66476007)(66556008)(186003)(478600001)(54906003)(4744005)(2906002)(33716001)(8676002)(316002)(41300700001)(86362001)(6486002)(7416002)(6506007)(1076003)(9686003)(53546011)(44832011)(8936002)(5660300002)(26005)(38100700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?1K0qZT4SWw85bGNlvihoVn81pfaLjs3/EsQ91pwf+VwWYnuzKiVw3n/Rgq5c?=
 =?us-ascii?Q?k1NKttIl0Dw7PUSfEFUiI8s48ekx8dbHzeXmhETf/rM27bt2SenI9Ktzf2Wk?=
 =?us-ascii?Q?Pcru1IlauYstm66X9vQKY3nppMPznbV7WLBY5N1EqK6MSCDowgbvVt5s5UJk?=
 =?us-ascii?Q?QpcH9xQlwy7SmklcbT3NsBgk7AATekEOxkNjKWEhFZw3bBi8g713sHadOwYv?=
 =?us-ascii?Q?2UOin/A6GN6gh00BgB05nxSgB5W7LAwXfnVEqEzUf5XpgQ98EDwIaFD+gnjl?=
 =?us-ascii?Q?3Ji7xku/KqTt8cOxsLoxdOcRSlOmbM7jZsz6aL4Iw9tT+uhlNEPZulJTJ0po?=
 =?us-ascii?Q?id0xiSw+UrqI52ut7avrl9ZNpLyxBXdqKFpHcgyg9WJcbO4iXXO4UffwDcUT?=
 =?us-ascii?Q?vnGL07zb3OsWPmHarCh1Txt5+s2jpZsvAyKkTA8Jdfh3KTsh+jxLI9XY8gTM?=
 =?us-ascii?Q?fhndONoqkChdUA5+7oDN5SO0mZ+sQdEMBqBV9nemasDfBKkWkDUfAoMncEZ9?=
 =?us-ascii?Q?6ZIN5zyDcAbtzzS+pOLTXqW3xx/jmVB2owXNjFL6x9hCUf8B8r9PAhYcV3SZ?=
 =?us-ascii?Q?RZC6+ccAr5Eke+Zik/Bc1pU9x+bE6FnxT4xSL4+qWaXTK/v4TDt7MAQTMvWs?=
 =?us-ascii?Q?jQPhWJKopZp70Ir+wuQaImOTmz1RbnkBkvPXCTVA4ym32vcsZ+HUP76BcUGm?=
 =?us-ascii?Q?+2wOBUsPnRhKinqU3bSyFB4uHN0XZqtllAh4tSBl652NxJDqCJ/M13eYVnZN?=
 =?us-ascii?Q?bvMXVpyP09EQf+f8tezT5/tRN5tT4PUgo6YnGjnJO8MT4l12iA3xbPXPkAUg?=
 =?us-ascii?Q?1n5LVNuUOD6AYJv5yyVofXwV+VBJOTZWV2t7T03pGg4NZ4j/5tYZBujej6/L?=
 =?us-ascii?Q?GdqvjEiM2XQLZ6GoJdWjDl8UpPLExkqXgo9Ygr5H0+rUF03TZ3B0Ur8ad0oj?=
 =?us-ascii?Q?nGyyivymSkhHE9qHGgtAWG/OfBzPb/bBE1xwjndCW50ggE2DTDhZWm5jybpk?=
 =?us-ascii?Q?UpYBG1JvkIw3ddS1ueA0mzQwUxXs82d+f3dhTzuQ9d7oyYWdsXHPB/nzvW/s?=
 =?us-ascii?Q?uS1iALC5Ev2M9PR1Up7ylNLwiMsYx90hlI6apY8Gyk3N7rcmBe2GfaVMaIoE?=
 =?us-ascii?Q?sfCeNyZeFdYbB6zkqElA+HJ8le5gOPUkpUp27mHJPhUPuTWfJ2+KHqCJWZC8?=
 =?us-ascii?Q?ux4Q3gl+dEsyqKqKo4UHrykjIZ6fNxM8J4FxQ2w1wKHHOpk2EKPiJ0fWJzdU?=
 =?us-ascii?Q?dT0jdAspd61n5dZ5Ipvi+5HOiW3gI23ZSmUU5Aqx7h8zIJfslGoEjgjiVb7e?=
 =?us-ascii?Q?oIaHUNJ40EQkI+kOQ0kmXYLRRaMQGSOKKLki3LsFuILRegWfp3tpTjpvYCzA?=
 =?us-ascii?Q?9QQprOv/92w2SGuBFLyHyEWUtc7F30cgSEyeBWFwGYcK2CSg55IkZyq6mF5S?=
 =?us-ascii?Q?h9UaAMlpcmnTEeL0gb9d68RBjZKV5mv/Aa7AxanRzFBD+Iid08CyPBhstnbK?=
 =?us-ascii?Q?CFoXgjZjeIVmCY7/GNYhj+x1mMQ9OyOZM3zZ5ZYUTYF/+j7NFPJ5ja3D2g1K?=
 =?us-ascii?Q?xyqjwaGnNDUUDVOmICaw1wKE04IkjT0OfV36WmoqDC1XQbQym8XrODoTmvSP?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dd344d-f310-4ceb-450b-08db6a0106c1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2023 22:21:24.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y5AMagOdMBQtrKet/e6fYJHrZIedqOJJ2l6rlV1LXHf0PJkNyrFO5YrxTxLcCU/8ixHaqa3tKoqBkzDElQAWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509
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

Hello Sean,

On Fri, Jun 09, 2023 at 03:19:22PM -0400, Sean Anderson wrote:
> On 5/22/23 11:00, Vladimir Oltean wrote:
> > On Mon, May 22, 2023 at 10:42:04AM -0400, Sean Anderson wrote:
> >> Have you had a chance to review this driver?
> > 
> > Partially / too little (and no, I don't have an answer yet). I am
> > debugging a SERDES protocol change procedure from XFI to SGMII.
> 
> I'd just like to reiterate that, like I said in the cover letter, I
> believe this driver still has value even if it cannot yet perform
> protocol switching.
> 
> Please send me your feedback, and I will try and incorporate it into the
> next revision. Previously, you said you had major objections to the
> contents of this series, but you still have not listed them.

And if SERDES protocol switching was not physically possible, would this
patch set still have value?
