Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39275A06B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:16:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=QChVRu7t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5pXP0Hpyz3c4m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 07:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=QChVRu7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::615; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5pWS2C78z30P3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 07:15:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/fjxIIfRx2PznDWXmUo066WIUbfiFW/QAQWmyyRYwAf+80GFk8Pu6Oks4+Xs3MxitrZg89skcvbrueAYnqAI7Tm5liI1dE1/xVuM7+cnnXGdrqUsHuZGcgpO1hi6XPTLviHid38Oi5kTAwXM+ut6ZzkmHElsRtiQ1XmdtQt/7dRTLWTz6FmoYcBZnVGW76400zUEw8Ziog/xGz+1Gc22QZ8HID7wHRmUBjJipFwxVEMQK7d25kp6RH53PfF8/0N8Fj8CQYsYcdCzevT0qzJKaH8s9XX49bH9frO0zJASq1EGUIl8coT3m5kqQShKcn5J39SJ77/PJoNrhGWlNW/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz3brBpmjxJG6fPFlrGOYwJ8tbaYbmg5Ru9ChWh6H0Q=;
 b=eCzNjZeq/Y/fTcoI/HBZ4iYTBUPx/xmUqQD9WKEErb55883C72XUmWpzOoJNb90/ojDUvjxBKOXGwSdkCSwJ3hKjU9tH6cbanAjKkVP8wl3j/NLrCx7PbffRn9XL7ster75uz8j6721eHd3YNEbpOxMz6HTs/Nf9iNY42I/0q/y/8ZuvaAtrAGhWZYVscgBEnzRpJhwP7RadzJGZEgvEVcWGLMGYhx5JhB/M5Oo+8sm1nXffVL0ipN+lfWj6evfpJsrBAnF+MXzKuHqEHiKBsLFI5a23qo9LP0ayrbvCxqwbqysJTBsnXkKr25fgviEdVB9VqHzFiuLhuihRvnzanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz3brBpmjxJG6fPFlrGOYwJ8tbaYbmg5Ru9ChWh6H0Q=;
 b=QChVRu7tyeBr/qnK2mPSkyYenMY7TKnCP5coDsZ6i/rXfpVdfIdk8dQnXjgMLMiQS2LOIZy8aAElU7wAwP4RixWPuRf5SijVL0LXr+v1QUjFvmhP/QzKnFq2hYndHol+9YvlZlev5RT41ZdhIIBo7vIbaVg3pQCZoTzQ0kqKt4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PR3PR04MB7372.eurprd04.prod.outlook.com (2603:10a6:102:80::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 21:15:06 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 21:15:06 +0000
Date: Wed, 19 Jul 2023 17:14:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [v3 1/2] PCI: layerscape: Add support for Link down notification
Message-ID: <ZLhSTH6M3XWgxMFy@lizhi-Precision-Tower-5810>
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
 <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
 <ZLg9Mw/FvmMdNLjX@lizhi-Precision-Tower-5810>
 <065b12d7-d46f-adf9-e806-40802fe888cf@web.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065b12d7-d46f-adf9-e806-40802fe888cf@web.de>
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PR3PR04MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 851ed36b-6c3c-4345-5507-08db889d3974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4enW4njal3RWASt2SLdtZWAtZxDWpr7GcPC1r5JOXLLNJURNEyAPws0IZoH1xurOQIqVqU0VtucuSrSCiZNqmQ5zx9vtMmwpe0wRrZ3wGetrOwUbGI/zaNmm0tuKtm2t2fXAdah+zzpiVAW2yxH9NN2XVn9gHeVtYY3r9JMtctIDxqF9jUO9ScqWn8kvAqP/dtmpXIySUqrVM+OkzMZ53Wk7yYTk/3Df1UtkmZDllbk4eepg1P+LRr1VIzbrP9iKIGlnrGz9zkJx3ezBf41zhksyqfVNR+rERfMHW/X+1pp0v4fdtG4Ab/FpWxFnH17XENsH8EgXepDv5Q2dTMmeY5S1GofDhLRssKSxPsjsITrCNRlkOaNgpAJheFkjAyXclPG7Cq5BxT4ugfCrNYR+EccemnCavxNSj5Q3sOM+IdDCat4hy5EJ+JIGThir3H+9QUYC8LSZFGNLeOxPIRoxEovmMK4L5XCQni+gkbrN9NXmFQUX3iihbKRiIqEngZuc5EJ64tWf94oMQZRcJ87MuYlILOzS3Bhuds3VoPRBrT95qk1oE00kAyUdqg/DKAz/lI6MNLckmxcHjLZ84kKGBfQnWwO/h4CAx4WYATAtuK8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(316002)(41300700001)(66476007)(66556008)(66946007)(4326008)(6916009)(5660300002)(8676002)(8936002)(33716001)(86362001)(38350700002)(38100700002)(6486002)(9686003)(966005)(6512007)(52116002)(6506007)(186003)(26005)(6666004)(54906003)(478600001)(7416002)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/kOEMF0CyZ7iJU0s/QOVnyu50fEEDQtf8qdtrFjA95rd6cJfBd2XwMJE2zTv?=
 =?us-ascii?Q?X1DliFSLNkVFVmmb3TqBPfr2/oMJXfbbfVHZuCyNkB65zt1i6XNYsvugStVt?=
 =?us-ascii?Q?44T4KlmWWNelW7jKItb2CrJNs98MRnaAWJNFyfORsESQqS1YCeNRnEUEAz+b?=
 =?us-ascii?Q?cf6VKRu72CLgvqDTpgYPsUxSE9raSkXptHipd15KEwzaGktAAAOP74GRVuGa?=
 =?us-ascii?Q?KtutrVArrecAHSfRVDmSBJ6VxKy7IimIEEEEtOnlhLiakGg2LQtIqKAXQAK9?=
 =?us-ascii?Q?JrEFIAAtWMe9PNakaZyTE6+5APtyO2UGO4oM/7sOCa1goVHwfKCBuf9ZbB24?=
 =?us-ascii?Q?KwloVKHVZiUVMG+1B2Ujv2X8Ij8/RIaVNyG4xsXsHPb1u5rH6NfkxsPsouL8?=
 =?us-ascii?Q?UK/Znjlhqjx9q/K/mYqGmxIPq7YS930vEgv1EcrD9xzZCN3RKZL13mLQ86CR?=
 =?us-ascii?Q?lKfswwipJ0ibWHwX9sLuSYXmmKPocBHq72503JZcyMGusneAoz3pX7mSWG6P?=
 =?us-ascii?Q?rq3Lp8RPw8xjpCCUcbJGAdzulVbYfUHJKRzbCBSXGPlX6y3zSzWBEDxDwcxS?=
 =?us-ascii?Q?67hLwRxEAezx398mNuJPWv8QAb2P+9c8fiSDNJpUBabYfztoHB8JFso6sMRi?=
 =?us-ascii?Q?n7oxYygGnjQEYcdH7Pefhtfo8spZaVNneMvX7j+yXVDcriN/AncqFBmgArdx?=
 =?us-ascii?Q?o6Bie10VQnyRhUjaKbMZKh7VYrAyrwr1NK0Av5ZkeDROzvzVjbms8u546HbK?=
 =?us-ascii?Q?SKFstsR8LJxrqZLx9uKBcfXKzLDrFIzx1orujDVZAwtDtQQl1QWwuGAkLyE5?=
 =?us-ascii?Q?aLU3LQfzOlwOOi4xhxVSMtoDuzB2u2A+5LXXvruCgmiTuuhyqr3nBiLHSMEw?=
 =?us-ascii?Q?mfmc/tDbAdbKongmJovOMo9o7eJDB9sBJoxCOXj0zGdTRsMfs18tSf7vgcJW?=
 =?us-ascii?Q?FEHNre2Cj5vXrS9eLKNfboYEy6pS5ZY8utVWRGIHkfPQHRdZMuUfbL4kgaPR?=
 =?us-ascii?Q?M+Nil8vyt6Qrdt7n0u62Heem5tI1c9RLZARytrb96Q1ixHcxqWSljwu2zxEd?=
 =?us-ascii?Q?enBDpO0z3EPvrAyN7zqTzEfYocxx/TBGO44jwc428PxBdGdLPn26LObLWUr5?=
 =?us-ascii?Q?LliN3asM16ceFgrr3uRHf/39grdP1Iv0+7Bxjiv/OQz7sGu55bzu1xb+4czc?=
 =?us-ascii?Q?PHoGZm/8n2xwtqdDQvQMXEQSGdFJTdr3T9iR+UmNvI81FMJ+R8I3cTMmB4J1?=
 =?us-ascii?Q?hUjBN+PsIPlIgs3lKk8RjMVIEMK0wnsQmh+ardXaT18dZqELJJ/IT6jJNzd1?=
 =?us-ascii?Q?HDA2uYNaoqTs3COBODk6mtxriPuCqGVydYI9oadJi17Od8hew2igBuSB1dE5?=
 =?us-ascii?Q?Bf6mgggMfpvl361w3Sk9xFROqMzNyEdbFUiz/Ho3uh4PGf0hODi7vzaXgXuv?=
 =?us-ascii?Q?qz8Sf8yc1LXMI2nhxF+Q1PcZpHTnWwJ3/lHf6VfemBUYhdyCY2zR2RlDv99b?=
 =?us-ascii?Q?Z9x3grikAEkHM9et5HqhuF5K+xnj0kPgXUFq9RXfSnzNxmVTaP3OiNYtND02?=
 =?us-ascii?Q?q9QNmtouUpJJz+6+V2QQkPXOPW16LxzTLkFXKhg6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851ed36b-6c3c-4345-5507-08db889d3974
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 21:15:05.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SqRxIdM6S5pKjIMHSu8ZKetH7y0chXtTrdrCdySYhUwSyoR2Cf6gQMa+XGC6BqzfdleX3dBCJ4Pg32CxKKXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7372
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
Cc: Rob Herring <robh@kernel.org>, imx@lists.linux.dev, Xiaowei Bao <xiaowei.bao@nxp.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 10:08:16PM +0200, Markus Elfring wrote:
> > Cover letter just annoise people here.
> 
> How do you think about advices from another information source?
> 
> See also:
> https://kernelnewbies.org/PatchSeries

"You may like to include a cover letter with your patch series."

Generally, I think cover letter will be needed only if it really
help reviewer to get main idea about patches. 

Such as my on going pathes(with cover letter):
  https://lore.kernel.org/imx/ZLglBiSz0meJm5os@lizhi-Precision-Tower-5810/T/#t

Similar case without(cover leter) and accepted.
 https://lore.kernel.org/imx/20230719063425.GE151430@dragon/T/#t

I don't think cover letter real help reviewer to review these two patches.

I more like to get "real problem"(such as comments about "typo").

It is just waste time to discuss if need add cover letter here.

Frank

> 
> Regards,
> Markus
