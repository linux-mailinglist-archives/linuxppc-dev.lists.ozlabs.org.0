Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7A7CB0DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 19:00:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fZODKLAf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8NfQ16wnz3clw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 04:00:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fZODKLAf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::620; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8NdT00xdz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:59:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhuSH6x4WQ++KwOtsBpuGjZxOC/Do3/h9ewq381efiovgrCYpAPViqiDomLYNjME139JsyZ6Dd52ulre28sdzbpGU6pKnT/wuGf3OCHN8uy7QuoxiryS/0SepM2bJZ1xjRt9hB4SCyq+ch8vBlruXzb2A2TMAZO03xcPqzOkcrsvqMqRaKFeM4zk9+Q43LxoL6I8qYzgXTReNRjNicqx8Wtwam6yTZnhVgi/w8g5THOkOFkwH8uRm4C4D/7/Dg64ejTzeWgFoQfdTa7ktjfsJq0rPFO/ln5HYAE1qhA1v+H0vVgJJs5e8XF9O4/qeSjPdha6W3DRd+b/ibaTHPtG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJP0ntG6VjuoxF7xvZXTHCvI0iXD0OVJD51dxDSjHks=;
 b=M14CPPi6283d53BKsktKFltwdj87JLZZEM0/AJGotiOcWBjweXZnLmpPaejMQcxLPf90Ym2hwFhmMGTsZseRHcyfUQj/ynwpmVFb1hCudAmjiuxBe5lY1p28BrKkazcEYqJQw7TAzrfBHmeobVA6cUfJmCxChfjo4ZCOWYVe836e1SicK88M3HJpyqFU5ilEiLDRUP0yO0T1c7sbmYVaqCLvLzSzA1dFI2elPc0ZsgE18K8Q25boSr/tI7WVp6fu8MV4L3jpXGicTGTOZk0EfJt/hyJlgszroyUQzh6F3cE/ZQVoMvGuJ4gyNSlbHbTJGq4bnOerteHkfLg9BQGzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJP0ntG6VjuoxF7xvZXTHCvI0iXD0OVJD51dxDSjHks=;
 b=fZODKLAfLldOipWfIOF+Q0h693Az736Bs6FQzdRqNIekiYHnayGx5hxjL3haY+Uo4fw5j4uiJ6EeD2fYa1f6geTxgD60qPw+ovMMKWOzpWUYtMSiXPket5O8Xzy1/6CK0w0DUJrOa6P35fp6zJT7oygYch9tZI17hOqiaLg5zU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PR3PR04MB7401.eurprd04.prod.outlook.com (2603:10a6:102:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 16:59:36 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:59:36 +0000
Date: Mon, 16 Oct 2023 12:59:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZS1r8JvJJZTf4rNW@lizhi-Precision-Tower-5810>
References: <ZS1gmJiz8+PKIuwp@lizhi-Precision-Tower-5810>
 <20231016162512.GA1212231@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016162512.GA1212231@bhelgaas>
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PR3PR04MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 444854dd-975b-4ae8-364a-08dbce69470f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	P3o9QqydWAa8NEPg0SrYwqCIkxm4AVSwNQXOka6FbgWYH/tO6lMHjFJxyS6u18u34vuZLh+0sK0PdK9N4nVlwujCP5XQvzvajGql85PYKRpaYK2nOE+EiCdEw4ZmJyX/e7wK12NKde5nAIosvXgua1LeXm42+LUbAS5p2YslCleVSWA5BlZwqXzuDK4LdlkY+SKR45n9rfmXjxSwGshBVM4ZP2c+ubX3EVtGGNgBJDxNaWwPhSi+cCOpo2lMIVz+Krnky+BFqn3V+SbFBtR6Qu7FJXBafuzoiif5WuBqO/hjgVupyBMBJUEcwfYnG26yNL2OD18g9aLb0ktHnqlBhFB2hmRrpOKEenYB31Ita+wvMHz1DV0Dd35Hj8Xd/ykGffDkt9MuIYsvfuknUDlHCwK0/cYS7aUu/G6T589ZDfEC+TvOc71N21v5Y/BNPl41+ajehdPCCy8xM1NttyAE2214l2am511VGwIYy8/3X8ZpLpSKLprFY8SiHBlAd+NYuRWtny7uq90DNOodxhXwaZnYDztsaBA18iKTGQKvN8dmmqVw77GH5qCvvKheu//Be/AHc/gX+E94JhhKGdPW79Yd80ehnG9wN+tZDEdLasc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(38350700005)(66946007)(54906003)(66476007)(66556008)(41300700001)(38100700002)(86362001)(6916009)(83380400001)(52116002)(26005)(33716001)(9686003)(6666004)(6506007)(6512007)(966005)(6486002)(2906002)(7416002)(478600001)(316002)(4326008)(15650500001)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qeC/ptcmepL2CKqybsBjkVqrhcFhwDT3hOGMf5s5ZzIVz4rnvreSgFBiAlRJ?=
 =?us-ascii?Q?G7NOXHHddsWvhIcavpCCwGgYZsyl+jdQ8Nj6g5OGJlAJ3ZmRDc6SSvQ2YDYh?=
 =?us-ascii?Q?gXkLb4UCoCJQWZaz9807UzuHum+1SazvyFI8eFmSpyNcTbBJoYFwmIsRnPo0?=
 =?us-ascii?Q?vjuGNQyXUPEhm1bvXprs8dqMnovg6C+eI2ytDPCYANfeQicbLAmCK242OKrt?=
 =?us-ascii?Q?NI0HDVHsL1Y/A20MA+aLdMpaf+Ai80jc2LOMWt33oq3lgNPO8hWpbAIk1hrL?=
 =?us-ascii?Q?wQje5+yfsnRTjN/MGjRiEwsbSKjKWFRIvRQ0kp20rf9EKrhLA1l+pBKAS6SC?=
 =?us-ascii?Q?ajh+wD/B4xhvoOrZX0/N6/+mjXj93QYzOMhJYZyj9AFNgXMdwAMuLd5o90+Q?=
 =?us-ascii?Q?ttOJ8se4QmI/Aws8lZ2ASIAVFVd8T9M1Oe+c1zLGQwhmUR3sOHGa0193cLGt?=
 =?us-ascii?Q?XiQP4ox311eUasTT+eE5gHO0lm+A0Q5w1E4L5icVcCcCs6RUFEb7xzU+snPW?=
 =?us-ascii?Q?Lyu4v5jUSSVzesZj5gGzQ9Tup/vGFdMX/nJTGnHv3OGnNHGjk4qJNB3wg+3i?=
 =?us-ascii?Q?jrsif2hqvwG9FZfs8GvMlRzesaUHHeeMEd2UiYsjjvO44zf9vDRjI9vtV86/?=
 =?us-ascii?Q?OFTDv67fjKQxNgvTrmi6SBQMjqPdmshWgmy64FqEtUoGrnlN3RmNpKKRTf1F?=
 =?us-ascii?Q?l/IrBNUJypNtb054+IWbyrDGO27sx24C8BmwpkqO7eZwZgA8e92NS8R7h54L?=
 =?us-ascii?Q?09toY8dZSm2ZoUfKWmH+pWjD17nFV36OJwOT++mNYl3Wvsx0FEvGb6f/kbWZ?=
 =?us-ascii?Q?aZVET4B3qjqmzZp0DM+iYIpOVLvCVz65dDSxoMUPBYjfsvOG0sCcBVcM8lsV?=
 =?us-ascii?Q?X3PBbilDrJFtv+m/9sC1X10MTf749UC1vNOioNrduurgYl5XUUiZONKuyULD?=
 =?us-ascii?Q?09sqTL6RBhJlGoufSKsIUlr8qK5f53XTrm8aPKz9IUxbPX+cguqCRiZtdaQG?=
 =?us-ascii?Q?2dax069KAFakBLTX9saM+7H5W0lWCQ1qgQTBmWAjM6jTKpTGRYwG91ZzZKot?=
 =?us-ascii?Q?Crl27mc7ebyHEqPJqC/aE5LWrUbkOleQWqn33NgwCwS/2rtHc1UEI2sR0XDB?=
 =?us-ascii?Q?REhxgfrPimh2zCIydkBFF8JRM4Hy3xnQDzfhp73R77GrtDjixHxM1eRzjEWe?=
 =?us-ascii?Q?BKe/sGkPx84xlJ7UOQEK9VV16JaqsnDFfmg6OaZz0obTaKGh10K4kdZmYKj4?=
 =?us-ascii?Q?CX5kCPXUv1l65TProjyjE8knDw7gF41QZczpKwPUwASlrvDmDESb25mvit+U?=
 =?us-ascii?Q?k/rIUtVj/53fOiSiyqry7LcrkUA4yR9e241w1cjapTUhSJfAI/XJbyrmbIao?=
 =?us-ascii?Q?vwwAG0thv13QB6O4G/3UMOl8Jb+zrzidaYUCLS2izSJB7Uj/UNaZsRhkyaZr?=
 =?us-ascii?Q?P3QngtUS2KLxQx346nkvHg1GuWLZ7rnyM6iuXEdsLtWWSUoAjicCJVgJp7LD?=
 =?us-ascii?Q?Ztaaxhzrp6Ad+8UD8D8PESAQM+dc6PWZaJIwGHpbQEtirOe1mzn4XXwQ2Rfb?=
 =?us-ascii?Q?SkWXJhmKYYqNPVENbU8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444854dd-975b-4ae8-364a-08dbce69470f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:59:36.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QH3M7M9Qq6gfDORdY7RHzj659w0/0muM/wvX3iGXXv0q8aXjLc2RPzew6uku1ryRewm8YGKYPLSBt/tk2qRodA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7401
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, imx@lists.linux.dev, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 11:25:12AM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 16, 2023 at 12:11:04PM -0400, Frank Li wrote:
> > On Mon, Oct 16, 2023 at 10:22:11AM -0500, Bjorn Helgaas wrote:
> 
> > > Obviously Lorenzo *could* edit all your subject lines on your behalf,
> > > but it makes everybody's life easier if people look at the existing
> > > code and follow the style when making changes.
> > 
> > Understand, but simple mark 'a' and 'A' to me. I will update patches and
> > take care for next time instead search whole docuemnt to guess which one
> > violated. I know I make some mistakes at here. But I am working on many
> > difference kernel subsystems, some require upper case, some require low
> > case, someone doesn't care.
> 
> Right, that's why I always suggest following the example of the
> surrounding code and history.  English is the only language I know,
> but I speculate that this typographical detail probably doesn't make
> sense in languages that don't have a similar upper/lowercase
> distinction.

If everyone thinks it is important. I suggest put it in checkpatch.pl
script. The only script check can prevent to human make mistakes.

I asked the same question at:
https://lore.kernel.org/imx/ZSV1sINV%2F2GrAYFr@lizhi-Precision-Tower-5810/T/#t

It lets teach kid mulitplication,  kid did 20 questions. only 1 failure.
The good teacher should tell which one is wrong and grade as 19/20 instead
of just grade 19/20 without any comments.

We are using email communication instead of face to face. The efficient of
communication is important. We have differece background, difference
native languadge, live on difference area in world and do the same jobs to
make linux kernel better.

The simple and straight forward's feedback can save both our time and
efforts.

Frank Li

> 
> Thanks for persevering; we'd be having a lot more trouble if I tried
> to send emails in your native language ;)
> 
> Bjorn
