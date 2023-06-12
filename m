Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF8E72CB35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 18:14:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TfEMBC2k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qfxb46t9Nz30Pp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 02:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TfEMBC2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::61f; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QfxZ554NFz2xqc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 02:13:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hffRUX47Ei7KEMnQLv491YIOukWx0/IPZ1+XWiy9/DmzNwiq2kneJ2RAms1SgXcI/2V5g0zdlIcPnjvy00DeiTBFCK3c/7y4v95Yw32NiDbweolnKCvIKSiHbPPSNA7zm7eflsaol3Yqr7sCemYojc9McnbSGSc+IdySbv0wP3ORx1v1JaN0/B/W4/KDBjyRnSPGEEPpBbKh8riyQxc3tLC8UK+ynnUuTuo2oPg63LLaLmsb5NW7S0h0hoh2rYk9PbyRNAiM9CIB8xlXwS8IJ74ztzKalNCseTTSS5hxwKs/g+6H63amGozI6d7+2XZRLEEgHz8qMy7WKGs4h9L8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6ngzwQnEw2DISScUpSMhqU3R6b7WmB0u1Zdod8zg3Y=;
 b=iz30qfSdsIYWEq4KBq81j0zErpA9qoCWidWsqohx/omIJslIAE5FabcduDL6dMzb8jH9I7+8j/EP+LA6Rp5JHpGpUB3gwl6uy6qjRZRp/meJxTvZUNBg/qdPl5OnUhZZNzC850q71GPNpZn1ponSfk0XH2hVfmmSWn0w5C0jYSBINjlxjo3+Jd/+CR9QPNLJp7wublm9x7HkLf1x2GAV6+U5hGSeGydeabm5y0IALpLAj85bRyO9hAeGydzMth4YMgtXhBde/5km7S1Z8sy161iOsPxxVotBPxrkIEvFHiCU5+TO/xcRG3fV/FM/BirSKygOZoAgj5SCXUejohU7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6ngzwQnEw2DISScUpSMhqU3R6b7WmB0u1Zdod8zg3Y=;
 b=TfEMBC2kDBhk70v3gvIUb7uQ2iwFi3dtcVE4PVKdNh0JUo0DTTBQmpV5krZ1I+lszLzFGc3em+LuikJzSGoYY8nbOM3ViIfAvyjUTQRUaq0OZQvO4I28UEcdiYIM9YBYJ+HZgx+pq6E/Z+wNN9kRP5B33vY4ay83FspoNwcj1fQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 16:13:09 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 16:13:09 +0000
Date: Mon, 12 Jun 2023 12:12:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: manivannan.sadhasivam@linaro.org, Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] PCI: layerscape: Add the endpoint linkup notifier
 support
Message-ID: <ZIdEBXH5AztZ/jz5@lizhi-Precision-Tower-5810>
References: <20230515151049.2797105-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515151049.2797105-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8d95ad-267a-4fa6-cc08-08db6b5fe9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NUOtldtFrEvJp8/nuk1z94xyKN+fmwSL+5CIGAVBegsv1I7XkJLFUMpLcDQqgcWIrx60aQphQy1ahAkek56Zwl85w2MS1rguSg5pktEluUIdAE30zqt5DlGzBQzZV5/EFjsolU73QTpIqrp8PpqBuuWYb3Z4EHD8SFb5fYDauaksVTAH6eCbJPoIbpqSIsQ68KN+opAhkQyJAjbNvqVoTDrSGa9qDRUEv3zv4jzufs7zVIuNgaU2qNIl9qiORwMU50eSVGEw6KEH8QSxR2sBq4a3VNt59wTuZZPgaFzt6I63q0FqS0HkWr4yaugzhsJ1vNL5h/vFV+fku9DPxMTetvlCd6XbSe1vgqDQjMFuqCbrPRLpqWOCzMW4TrpGWMiRCHM38OJZnrqAtOJ+iXeqXh2qMyJfukDiVgkVS458axRhN+aW9/DVFnis6/svl+SRVYAqt+z88/aTHN1Bi91uJ2frllQ1DL1xSBIzvxNbxjlljrorMzVcmCipsrYdRc+vS7KRGFQPkATg2x88Yr3OC0zpOyyW8STgWewg9dVZmWkyE7Q8poKGCqk/iRNgGxD5XNudg4srdsSgb9U24UDFgyzg6tuw8q2CB7xfAP4DRVMgc0Jmm7SgCpO5BqLf9sIOO3NrQQbjMeqFaVO4DYuCgw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(83380400001)(921005)(86362001)(38100700002)(38350700002)(33716001)(478600001)(110136005)(4326008)(6486002)(6666004)(8936002)(8676002)(4744005)(2906002)(52116002)(5660300002)(7416002)(66556008)(66946007)(66476007)(41300700001)(316002)(186003)(6506007)(6512007)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4Jsw7fDXo7pFzFK4IisrWmaomqYBGrAQctK6bLoTJ1Qzn62UmJ2rYDtjVjiw?=
 =?us-ascii?Q?gu27IdhpOv06HEhnYuHGzFNZKYzuKs0DIJH2DmnGKGJfaPF55j7/sLGj9b8D?=
 =?us-ascii?Q?6MquazXTpKDqkkVL+uIjsKGMg6TvjcOGkWA+rmxRkO+xyaaXVKJ8/ecjzviU?=
 =?us-ascii?Q?+1n/T4a9e0/cd60/bW6GQ+6LhFoVTojiGDTQDe55ZpEtgjqYK2SsIznOuzPA?=
 =?us-ascii?Q?tQKhUx1nBjte8+1a5+xsU3Wz3eSbgV/WVLgrkTusuMKxaSQlJuWe1YWC/z5G?=
 =?us-ascii?Q?O37s3RRN+a5PM7pqk2ue7nHe9DDCrJ4EUzNrulmCQqWy/oAuru9i6ne+P/fA?=
 =?us-ascii?Q?duOtZWMYmMWsP7miPQZ2g5+hGbBEMe/VxVUClQyDoH2gocqxE/a6++eG2XlS?=
 =?us-ascii?Q?h5BRKQgvcQ3iw94JEj1j/uzupczytkULoNbN2zgHlOoIhCnNPYxtlhxRfp37?=
 =?us-ascii?Q?l4caZxPu0ayykf7OwKPTNcvWMJa7L9b7VkAjrjx2mch5y9sPX/RYjrOpCVBL?=
 =?us-ascii?Q?9IKAoPlOaWQmZOT6vPUI2JBWeLnhkiF67xPP7VgFs06ylbD7GZalyVnzdJqL?=
 =?us-ascii?Q?Y/L+S5Nzjf0hXDdEJwLWwEldZaYh+xHqzTAxJKwWEktk59+Y4ymX1e3bYIQ8?=
 =?us-ascii?Q?NDJEahHpMCm2KYiSwVt6Wg4F8U4QT9JrrmmsSWdyJZu8pyXuam6krunig6NK?=
 =?us-ascii?Q?YHYUEKCxYQyYSoe7YLfXVx0ZmJlJ9/QZFl6Srzo2ov10+Al6y+07u7GJCAu7?=
 =?us-ascii?Q?v8I1PVAhjIgZM/RBft+P6LHFFkoBTeI03NpV3IrUWyNk167oGX2Rx5lhTFad?=
 =?us-ascii?Q?1k0KURP1oRhrdTiNnL/3wTXaHhVpExpXeYQwIOJ+DacSI5VBNoxy3MwB2ecs?=
 =?us-ascii?Q?BkMQona/O/v/mWdT6akHM6Qg6UlRkFnYZXiSx/Hqb6AmRbZmRGThzvDousP4?=
 =?us-ascii?Q?Qvvkn8N1fviinbqeHVHy1drLKSUvt0YwPPbIHJK5hO8rtCbcTtV+A6LTROPK?=
 =?us-ascii?Q?ydyWEv7WkmNav0jZmiW8MqpaBRfuvnlSzPO4BA0k4oAJxhFcJLGKXQqdQ9QF?=
 =?us-ascii?Q?DhDOSMOpA/1Ciqs8okWkjnMyNwhiAkoCC2XSVy2aGXrj46xiXDPxrn4dRIDu?=
 =?us-ascii?Q?fUinXgSdQpBBFcnqt0R3XZfWjdO0IqUFlEQM2X1eDgAQu99iikXQY1ltyhkl?=
 =?us-ascii?Q?I8qJbCkIQ5FlJDgnqgPd6JtJ8zXpEGVnooOdP2e2rLkitxvYURuaDDts4n+E?=
 =?us-ascii?Q?X+QJC4srn90zXpx7kBlzCaumRNXxjJIM1k6eQXtZ1gb/Lt1e7nMP9ZYAvqYh?=
 =?us-ascii?Q?y89h0NECqJo6B3TshQrmU1z/X/JZK7SlUEPM2Nrn5y9lrbLXDjR7v4L5xr3G?=
 =?us-ascii?Q?78L67gwKDYdZHNU4yVhnaykvz3IiNZsAc41JIr6KwwMU4YHNSATXy4zfOxum?=
 =?us-ascii?Q?LoGlqDpj7DQDyhshrkTzKmfU0B89f1DnQiZ67PL+HQM1HvpztMxWQCY7EOGD?=
 =?us-ascii?Q?Ua0UiM3lxU37fxj/NlHvJ3v3MWbITNExecIE+H3J0Rv6Sqk5mczimvFzO+zr?=
 =?us-ascii?Q?Cs8FwZLlQnL9CyoYbsrqHESmmSa8tglIaQDcT+xy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8d95ad-267a-4fa6-cc08-08db6b5fe9e8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 16:13:09.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ght3SHwtDIBcAnfvQ8FlTxtdJWiq1hvlNu8HMrUVNyK67N3Wgq2rK+arKm7VU0lIV9GI8hdCPe3c0Ow0IcnD2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 15, 2023 at 11:10:49AM -0400, Frank Li wrote:
> Layerscape has PME interrupt, which can be used as linkup notifier.
> Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
> when linkup detected.
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Ping, not comments almost over 1 months.

> Change from v3 to v4
>  - swap irq and big_endian
> Change from v2 to v3
>  - align 80 column
>  - clear irq firstly
>  - dev_info to dev_dbg
>  - remove double space
>  - update commit message
> 
> Change from v1 to v2
> - pme -> PME
> - irq -> IRQ
> - update dev_info message according to Bjorn's suggestion
> 
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 102 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
> 
> 
