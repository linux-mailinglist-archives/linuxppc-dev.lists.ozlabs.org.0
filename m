Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A712A7CAEAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:12:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=R7sJvleT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8MZd4NhGz2yVw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=R7sJvleT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::630; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MYk2Wh9z2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:11:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdPVsB2LDZ1kHVzGCxgDCVa4UUWsOOPPBr+AVrQD+R7ijdtl10AR0zavaye9K9C0agmr5VaM9E5HqWNDdbo+E19gUG4Z8ejAXODVo+fxLlwBm+npy9rZk31w6lKo48MtiDq7hvZuS/pz+Dcwb1TV8SRflW2TqD5cgCZ9xh0QuKbWmJCGdCGlP11jRaBJZFTqgriwzFlerjke2bPKyWw/RKDVrAHGjlOgoZ9MOMXb01pj7pwTt4eIUGbYoRR+igVjh0mktP0MCAPTXBjRlinJas3kRC+APNLDkSDO0GO2lw6aYc3OVNYL063NyI/OXkVxqbWzpjcqBH316182ABneXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGSEAiI0wn8Om4JXxTYJU/H+ysdlKP7h3jBF0DnpftE=;
 b=VsoHGW1bx8w3RqY7bWsm5sdCn7AFqBeWMYTUJIAS3cF+8OynF8XTqAQnOMocWHhrWyKNXRdhRZtk+IghELNHAPwOKkF7WnxS8BoQLl03x1xM+A9CLCgmwFJiYTJe+eTqhtf2y4CqkCaSgRd3on8Cs5h+kDHL9gZsdE1a7WsN7gldATTk8Y31Sa5XRDFYgvgmrLpCzh4zO+XUgtpenWRznClkkXcbhMZLgKyjBcFhztH7P8347M/xJNCTBkriBufIHx4bc7hGrYJZmlNDxbay0G8Lr4XXy0875i+KCArf6esJT/3lCiYTghNM0Ap2Yn9njKdDRErmXVoQtB63g/QeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGSEAiI0wn8Om4JXxTYJU/H+ysdlKP7h3jBF0DnpftE=;
 b=R7sJvleTg04XI3o3xJnPuvQcaEVK+wqAMVDg1D8WOjyaoSc94grHMlXUSU1Knmh/E/JAhinJitMeP/7HiMOJ/G/Or5vpVOueYf0NeUqMRgCammt21WBU1WbzVxcj3vp938iqvnKz8yD1ie8Oeh2iUWT5OzDffFVZdQq3Ub/EbEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VI1PR04MB9905.eurprd04.prod.outlook.com (2603:10a6:800:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Mon, 16 Oct
 2023 16:11:13 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:11:13 +0000
Date: Mon, 16 Oct 2023 12:11:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZS1gmJiz8+PKIuwp@lizhi-Precision-Tower-5810>
References: <ZS1Mhe9JOsY2JJER@lizhi-Precision-Tower-5810>
 <20231016152211.GA1209639@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016152211.GA1209639@bhelgaas>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VI1PR04MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: 20adf9f4-9aeb-4684-6d9f-08dbce6284a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lVB6nNC+lssT1WFxAP0rpeW9Yw7rq7mgzwcLfsijqREiJplnpluuCEdi4lHa/4bj8qWEFxErdL5PnwrZHFcFN+MR5XO4Sn48XJvwhSt4xiKfu6+nGXoJtN/N+20J1ZEzu4IXl5XQ5gtlRJ/CveHcNCDBPD8s3uOxo27dAfrCjUmEo11Gavf1TPyHn52Rs6CN5SIl9Z2CMstTYiMGNsmlHTJpOJM3EOsFQknEl/Y+RCxdAfO+KZYk8KelYQDhz6E+86kyk1XdcQpo2cKGmAZWEfcaEUSapChoY8PMQOwDLgCqfnDIqaaLYOTwryxD01Ze86t2Z6vT3FZB9cdJUfNgFGnJVzWmOLI/Xlai8AFJrycrGZP6BSWDVCPPrXG6IPLOcdgLKvnAjZHbbvq5V4KIlMOEENQR0CoNquxh44oGc9/hMf/wTAvZEim8aEk0epegM9cqMosKN1uo7a+m1+qxnxjQw5Swn3cjeGuWAIUsUKh4SSE5LsuG8kZs/FyNT4pQD98Or4aZU6nwrNXYFoI5NfZH8Hju7nLpKhhIcGG1tWCzIBrWtPMG/R43HX0nk3y5OejcY0qdS6miZas6rq5Rc6PYIoZK7JYYr72CYiMeyrMRQiBgMRNpvAlYYit0s109
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(966005)(66946007)(6916009)(66556008)(6666004)(54906003)(66476007)(83380400001)(86362001)(38100700002)(9686003)(316002)(6512007)(26005)(6506007)(52116002)(5660300002)(41300700001)(4326008)(8936002)(38350700005)(8676002)(7416002)(33716001)(15650500001)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ct0HVMfqiOZy67CZu+c0EnNQ8xseoolAO2vgrp6h6lGw1SBcnwBfva1ExKZ9?=
 =?us-ascii?Q?oLc6QwNIBMdt+cfJnxudSF5i09A/UPkUbTLTxuVlQPlZfyB2ror0rj2dbvcx?=
 =?us-ascii?Q?v5xXSsAOm0jPpxH6sArSjy+EyyFDLlnVbAb0ZliVyDJ78118sM2bu4ZXR3Nj?=
 =?us-ascii?Q?e+HB+1m0sb8mbChN8/yqxIpYYWJU4T2ms//UH+xz5KJSx1hf0wccaQ7R9Afd?=
 =?us-ascii?Q?dZzZAoauoYZdhA6fIHrjU671n5OGav/VEO5aCcZl+UuANq2ppoOqe3ZmPwG7?=
 =?us-ascii?Q?s98vVD5GBXfWrvMR5S86/Unh8afn/59k9pyLUJvZOGZJ4zm2nG2zjPTuRVeC?=
 =?us-ascii?Q?tRUcqlNHy4dkAUaHJ8HO9VItoCzUmy4SNyaazEPQg94kZfAP08EHwyRSNcgd?=
 =?us-ascii?Q?zH29e8A9hPsHlZ1kbpQCM3gLu2wpGYKncjweGGW6ATIOn6FrPLJniT0d/9bi?=
 =?us-ascii?Q?4FiZ3RUvb3iKU5rWk6lZBNOxiulBTCtgIMIK01i4simDUBn6FLNogOmvZUju?=
 =?us-ascii?Q?/U5Yia5GeZ8ZaDwiaWLqMCT4YUdsnjHfccQO0js6Mv9o2Zk+T2F4UJVoPp9E?=
 =?us-ascii?Q?oalkdDBybwl8lNvT76bemfZpHlSFulZnOull/RE0RjeXb9YinFlPn4x5XWAP?=
 =?us-ascii?Q?nT79nA+9KiF2eU6tElaDT1M0ALhks+TV9VSxp/AMYMziyQnfg4VQP4v+xomM?=
 =?us-ascii?Q?obW7E4ZuzaVXgUtCISig8BXgI7qqXIeRthIOBdyPVDdJElliwYMdnOsDotmd?=
 =?us-ascii?Q?iYQt6u8q1i6j2+SSWvsqw+Gy9eOpWG2QXRhBuX6KGkZOrQbTSsTZY5Y6gXfa?=
 =?us-ascii?Q?Rgn5z63t3EfdHWQ8/wuqKPvNdxG3jaQNl8ZcFbZngIDxHGVStnhcifeC9c8m?=
 =?us-ascii?Q?WR9fxzDksv8KmNR7HAsFIAttKoVHob7BhOX7QRQTmeQdEPTb/CptDdGb/Whp?=
 =?us-ascii?Q?FYMsk0pKMwnxQgC7Nnom9OFGkZ3zVzGlVmucMJFNLaIzn98jBU8HQhGPSHVz?=
 =?us-ascii?Q?L/BU9OAt4WqFd1CcYVpPMkg9d13IfC61Hf/3Io7iphMDufFl3OZHq+EvfWMK?=
 =?us-ascii?Q?quUUV7rgPj7ZlXCf0YyTpzazlGh+k7Ya974gO7Qkz7UrRFaafxtuTo3bfW5H?=
 =?us-ascii?Q?OkODZXDhYboqZ62H/8mPRBXet//oI1xo2Ga4u6l3mOzWGXg9NW5ZFazDu9wG?=
 =?us-ascii?Q?cbSngxGp/J52iiiwqOMULG2sHbTNUQLh5DmJ257ZHDI+X7un3WLufXxxJPG4?=
 =?us-ascii?Q?3O/4uIkH6tEWlVMAkeb3I/Mqg03CpWRlphz3UOSYN2y9BQyYRjXCeW5G0QDD?=
 =?us-ascii?Q?0vMQy4TvwuyQiYB+XEEiZV9AKiz8IALZPmbJpYEZeuLFQPf+ZC2OP/9wtwdK?=
 =?us-ascii?Q?ngj09PIap0/i1q+tmAbTj06O6759QaFayHPB5UA/stQNWjaRwDgFuB2Wrch1?=
 =?us-ascii?Q?Or+X++g6TPUiqO+O5rHV4qU0cSk/7vouXXtkNV5aRS/Gcxh6szWiuudOsssb?=
 =?us-ascii?Q?ssNrgTyhto779SMM9mJ4bcRAWh3oR8f8fWdXryGylF2xRm4M8ELiQ3Y6u0EQ?=
 =?us-ascii?Q?+rc8Rq1L/pPZUoel8RDe/1TbjoV4IuKd8EPXWJIC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20adf9f4-9aeb-4684-6d9f-08dbce6284a6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:11:13.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALOakVC0kLLoXrmFwLvNmF8wqqhJRwrU+1MEoMbGs+Id3CFQa+GmgQyeIKlJZQyuhslUTwi9+OOP6LkiTN98Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9905
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 10:22:11AM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 16, 2023 at 10:45:25AM -0400, Frank Li wrote:
> > On Tue, Oct 10, 2023 at 06:02:36PM +0200, Lorenzo Pieralisi wrote:
> > > On Tue, Oct 10, 2023 at 10:20:12AM -0400, Frank Li wrote:
> 
> > > > Ping
> > > 
> > > Read and follow please (and then ping us):
> > > https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com
> > 
> > Could you please help point which specic one was not follow aboved guide?
> > Then I can update my code. I think that's efficial communication method. I
> > think I have read it serial times. But not sure which one violate the
> > guide?
> > 
> > @Bjorn Helgaas. How do you think so? 
> 
> Since Lorenzo didn't point out anything specific in the patch itself,
> I think he was probably referring to the subject line and this advice:
> 
>   - Follow the existing convention, i.e., run "git log --oneline
>     <file>" and make yours match in format, capitalization, and
>     sentence structure.  For example, native host bridge driver patch
>     titles look like this:
> 
>       PCI: altera: Fix platform_get_irq() error handling
>       PCI: vmd: Remove IRQ affinity so we can allocate more IRQs
>       PCI: mediatek: Add MSI support for MT2712 and MT7622
>       PCI: rockchip: Remove IRQ domain if probe fails
> 
> In this case, your subject line was:
> 
>   PCI: layerscape: add suspend/resume for ls1021a
> 
> The advice was to run this:
> 
>   $ git log --oneline drivers/pci/controller/dwc/pci-layerscape.c
>   83c088148c8e PCI: Use PCI_HEADER_TYPE_* instead of literals
>   9fda4d09905d PCI: layerscape: Add power management support for ls1028a
>   277004d7a4a3 PCI: Remove unnecessary <linux/of_irq.h> includes
>   60b3c27fb9b9 PCI: dwc: Rename struct pcie_port to dw_pcie_rp
>   d23f0c11aca2 PCI: layerscape: Change to use the DWC common link-up check function
>   7007b745a508 PCI: layerscape: Convert to builtin_platform_driver()
>   60f5b73fa0f2 PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
>   b9ac0f9dc8ea PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
>   f78f02638af5 PCI: dwc: Rework MSI initialization
> 
> Note that these summaries are all complete sentences that start with a
> capital letter:
> 
>   Use PCI_HEADER_TYPE_* instead of literals
>   Add power management support for ls1028a
>   Remove unnecessary <linux/of_irq.h> includes
>   ...
> 
> So yours could be this:
> 
>   PCI: layerscape: Add suspend/resume for ls1021a
>                    ^
> 
> This is trivial, obviously.  But the uppercase/lowercase distinction
> carries information, and it's an unnecessary distraction to notice
> that "oh, this is different from the rest; is the difference
> important or should I ignore it?"

Thanks. Not everyone think it is trivial. Especially for the one, who
English are not native language.

> 
> Obviously Lorenzo *could* edit all your subject lines on your behalf,
> but it makes everybody's life easier if people look at the existing
> code and follow the style when making changes.

Understand, but simple mark 'a' and 'A' to me. I will update patches and
take care for next time instead search whole docuemnt to guess which one
violated. I know I make some mistakes at here. But I am working on many
difference kernel subsystems, some require upper case, some require low
case, someone doesn't care.
 
I respected all reviewer's and maintaner's time, but I hope respected
the contributor's time also.

Just simple words like , 'a' to 'A' or
run git log --oneline to check subject. I will know what exact means. 

Do you think it will better than below words

"Read and follow please (and then ping us):                           
https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com"

Frank

> 
> E.g., write subject lines that are similar in style to previous ones,
> name local variables similarly to other functions, use line lengths
> consistent with the rest of the file, etc.  After applying a change,
> the file should look like a coherent whole; we should not be able to
> tell that this hunk was added later by somebody else.  This all helps
> make the code (and the git history) more readable and maintainable.
> 
> Bjorn
