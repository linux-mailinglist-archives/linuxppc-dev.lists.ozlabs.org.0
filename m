Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 135327DF972
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 19:02:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RyLzBa1K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLsCs04phz3ckQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 05:02:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RyLzBa1K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::610; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLsBr72kjz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 05:01:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldxzNEClplXFeDQ7ba9ov3IXCCf9QvbjdUZHj0BjXt2ZP7/8FFo+z4W+cFW6CvYhDbFQOiatKeoweThTeqloYh9ATz8iBoU2zC5Q4UsAJ9qtxRZqu5vW1g6v8qUE7Asq0HjIuLpNCDhnFtFps+g59c4tNUKprBn9gcqeQ9WJCJOe2GjFr6BDQGHngP3+plhnhXdJ/dzQ5YZUK4PFDSb5hRuT4MY0o9m0W7sykvQYyd604PafhJkOCV1q1p7G5l1ISFVrUNJtufuHtaFzgmICJpFJ+wUpjAM2w+IeVtOFmrcB7BblhRuqC8H8IQ4uY8QFtiA93i6cZTJICHIgBTxADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9pOne0rk8TXYYlz3UyvrYZSMZM+bLJV8xYmmdt5vII=;
 b=maPjgTISglA961avLbDqWMbKskxuMJGnoLWSMcTAZ/7KBqmscGu3zzEB+Fr25feRTykticYM/A6GprYqGQXEiVHEuVcnLXsLeW83P8Z7GeSnvZBu2SRxJePScDbFB7Mhb+78hqWqWjlAs1yzfT/pNTJZsdZOPIvxNFyvLVXqluJu75kAk1+Do6leKEYh8TBlIl89+JrnaF1xYq0no95FFbbZ74nGUbEC/1lYTIxycXoG7nwVO5hpPkhP55vaibgfy9nyoeMkK0E1XPRjqum+pqfaguL/oXgEqNFGTDrLV2IEI9+9WEMyFSXXvgCOAv87+paKRznaQoARQrhii9ROsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9pOne0rk8TXYYlz3UyvrYZSMZM+bLJV8xYmmdt5vII=;
 b=RyLzBa1KyhPrk1ihb+C1tlWSsoMlv2U8l46VdkBDolY1IYO0j3y4R99YTUpIwtws/uZi71R1EHwqBXxZwYSolTE6Ds71vwRJ1rLQWZZ09gmEsVbf4+KHPcj46IwCCu2ZOSrwggxOaL5f/QXPlYKDmcCZmgQT9FGtxlVvVsN6MiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7666.eurprd04.prod.outlook.com (2603:10a6:20b:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 2 Nov
 2023 18:01:16 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098%7]) with mapi id 15.20.6954.017; Thu, 2 Nov 2023
 18:01:15 +0000
Date: Thu, 2 Nov 2023 14:01:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 1/4] PCI: layerscape: Add function pointer for
 exit_from_l2()
Message-ID: <ZUPjaKOeBzZ9EUvg@lizhi-Precision-Tower-5810>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-2-Frank.Li@nxp.com>
 <20231102165808.GC20943@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102165808.GC20943@thinkpad>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: ae53330a-dd52-4e50-ad62-08dbdbcdb525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hKk5+Ey4IRwWBMaOzUhM+ZXjH6cRSptGbr2B8zbwypLY0kSlqftpbI9NqltOrf62Y1PECkjD7zg/4nMA9T3SfPOGPfBtgDIq/Zfk1ve9vJ2z+p9c3x9vXnPhGXPx/nta3q/JqZrN6TQp5Zcf/hewelunQkAoF7VcvmInxwpJxUj/vRySoHf9j0Xs1plcxMJ2t0ma/kzT1KZY/vHcZb+RBTZSeRSbEAbP6LlP9It1KwRGW9Kjjt6XLGUj71YzVIUfJA5A2PBQg6LwHPK0mJV68tTlnZPTZcrGwjCzFX4TOuNDsQXs3ID7w0TP315rulUJgFBBuQB3MQ7u0jRxBcxHrw21UrOCINnqBWcHYzKJtj43Wd4lHVKZXUAmmQDmvHoAQgoBIMhyoAsJbbbh9n9+Z/rAwo1Usrei8P5k7cXZzmpReuVEZ4HPLNMC1QPUZPRrEmhCgY/sC2eyMRaikZHagoLkr7mo0f2oo+Noh3OTxL9s0fErnB4MWTSAv+rcHqMGHL0pL80fKQguYa80mVEY/1pu3FU3gzoL3ewTdetkB+zZ0cs1FFpWBxES84kZLg9D/lJ4Lr4B9dLNDOQePBdKeDy0bCwUNsoRHEN10nGuYoxQ8p/COSa5K3Pss7aLZmar
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(66946007)(33716001)(316002)(83380400001)(6486002)(86362001)(2906002)(8676002)(4326008)(8936002)(66476007)(5660300002)(41300700001)(38350700005)(478600001)(38100700002)(6506007)(6666004)(6512007)(52116002)(9686003)(7416002)(6916009)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?d3lGQlNMekszZTZkZUhlTTFxS2VJbGlsWWtHdzhVYkVBc1RCZFc3UmdaK2g2?=
 =?utf-8?B?R1pPK0NHMzNVaVM1TDhadW9CYmJvRnJzN2xSc25iYzlvTUVDZUlkYk9ZTTZF?=
 =?utf-8?B?YlpGUklsaVBiN0E5ZEVxTU04cUF0YUsvcGdFWUlyZStaM2FnZGNtVFpFUG1j?=
 =?utf-8?B?VWZHRk1SbDZ3QlQ5RXVUMHlJOFNmSkRiVjJEd3JFL1RZaXF6ZzlCcDBKVmFC?=
 =?utf-8?B?S3ErSUZ6bUI3bGRiU29qbXhnOXVKRS8rTks2Tkg3Mllub1JNdmlGZlpPeXA5?=
 =?utf-8?B?WXRTLzdZQkJzMnlCZkxNMEZwMStVSG94bW5ENGtiaE12citBKy9GNGhUN1Fj?=
 =?utf-8?B?bXdTWHNFK09weXRIbkRXR1ZKU0U2a2FKMTJ6Y2FQRnFhSjVTM1M1S0tDSUcy?=
 =?utf-8?B?c0RVcE80TVlOUmtxNXJWeFlLdkIveXVWcm1TREtEdWF5WEJNc0o1T2EwczJB?=
 =?utf-8?B?b0JzQjJYTVdnOW01a04yY1QrV2tPWlVybGh6S203WUV5aEo4dTBNUzVtbTdw?=
 =?utf-8?B?a1dDZlFuRFdDYUhkNDNrNGluZlA1M0N3ak9lM1Y1c0YyZ3lTTEJnWUMrYlRD?=
 =?utf-8?B?TzlaL21EaWRkS1hLa092RDRIVm1uUzNKSTlFWFBFVXpkS1Y2VTgzSG9wLysz?=
 =?utf-8?B?K2VlcDlLd2lKNk1RcUZjZ2ZrS0RmeDdJWW9UTXZTZ2hmL2dvODNlNzhHUjg0?=
 =?utf-8?B?S3hNUHYvU0YwUTgyUzZVT0h1S0kyL0JpdHZPTmYrM3c5ZXZjbHJZa3ZtaExO?=
 =?utf-8?B?ZUtTQ21sN0UrM1l4d1huU0pqRTlMWEdqeVlqMG9rWm00U0ZkTTdWcVhrRm1n?=
 =?utf-8?B?VkdFRWY0Q1Y4WWFxeW4yREo4TFhoV1ZiSnhUMWFFRWNlTjRJeW4yK3RvaTdo?=
 =?utf-8?B?RHJHSWhkVFdtVUsySmN1d3dNRkw1S1lEeWlERTZiQ3l2SnE1QXVkK3AzSkYz?=
 =?utf-8?B?a003U0lHNE9CSS9tU054bnAzY0VpR25XdnJBWmg1MUlIL1llUWN0dVJJbHJL?=
 =?utf-8?B?ajhFTXc0V2M0WjBSR3I5RzMwdkl4a2IyZHBTWjZ5NmFQckF5R3FSY1dXNmow?=
 =?utf-8?B?MzlxR2lFNWhkUGFkTjZ5S3UrbEt4MW9DNmlFU1d6U09aNTJBNStOaWkxdlk0?=
 =?utf-8?B?SmNzazlzbEhUNHQvc3N6cWQwYW43RStoajJwWnBnZG5UOWdaOWJxeWpSNE5z?=
 =?utf-8?B?N1JzWlRBTjdBUk9NaDJRem9ocU9ZMHVYYzA3bk1Dc1I3TWJEbW1LV3NETU9G?=
 =?utf-8?B?VisyZHc0d1JNYy8xS2RhQk1XTERMYWlnMkdFSW9oaVpBVDR4bllDT1IyN0hI?=
 =?utf-8?B?d0dCTDZaT2RhY1lBNGVpN1pSM051UGlBc0Q3SGVEVkpmYUQzN1ZqVnZudVRD?=
 =?utf-8?B?YStZQXllVStzSEZlRXhxaHFMa0dVSHNLZzgySE5qS2JoOENIL2p1WDNYT01V?=
 =?utf-8?B?T3ZpUmJBZE9MdDNobUpkeUMrek5yMm53clRMYU1xdFRwVFZPOWtoc3RxMVR0?=
 =?utf-8?B?WXgvMENvSld2M1lkWkl1bGdDVkNMU09CV3RodmdkeElZNkVVYlpIYnA2akR2?=
 =?utf-8?B?YnRpK0s1b3REOEt2OUFlN0VUUEhNK3FuV3dFZEY2bG9yWUptK0FQd1FsVGFI?=
 =?utf-8?B?L1JPYWdVc244RUZZQ2QwMkMzMzk5UWdZd2t3Ymx4L29ybGFpOHkvTy9XNXRw?=
 =?utf-8?B?aG1HQ1oyaExKcEJKdDM0YVFNQ0dBUWVVY2dRYTVIT0xqVkViK3IxMWp4TU5u?=
 =?utf-8?B?RFlqSU5nelVKOWFReFZId2F6RU9BdkJvYkJFOXZmTkVPME1wd3U3b2pjNlBi?=
 =?utf-8?B?WEtPUlVob2FIZ3NSWkhDc3hVYllEbVVLbkF3Z0txNmZvRzY4T0RZSDlqVGYx?=
 =?utf-8?B?N2hPcGNVYlh6UFlkbXZpTDFMdkJvUmZwTmRWRndqeWI4YmJBa0NMdlcrMnpr?=
 =?utf-8?B?aXdKdGlxQmVKYmduemVDU0ZVR05PRkFDNWVqVXNxdEVtYUJ3cWY2WEY2dmxG?=
 =?utf-8?B?aWpHRk9GMVNGbUhXdWp4VnhkVGZ3M21qT08ydGFWWEV5SzFhc0dyUFNTa1Zk?=
 =?utf-8?B?bC9GcUpCUS9wT0NTWDBhMVAyRk1OcWU5blcyVythL0ppbmw0S3lEQlpiN1JI?=
 =?utf-8?Q?1kokAH3v/YBDhhpa+2lH6pmje?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae53330a-dd52-4e50-ad62-08dbdbcdb525
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 18:01:15.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuZwJ69+f1OQqUtZS7K+YF8wwEndvNcvDvgUCwgSunlaAIcnDAfz4rNw/IYFqkeLNkyAyCUeHtQKH/MtaYL3ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7666
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023 at 10:28:08PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 17, 2023 at 03:31:42PM -0400, Frank Li wrote:
> > Since difference SoCs require different sequence for exiting L2, let's add
> > a separate "exit_from_l2()" callback. This callback can be used to execute
> > SoC specific sequence.
> > 
> 
> I missed the fact that this patch honors the return value of the callback (which
> was ignored previously). So this should be added to the description as well.

How about add below?

"Change ls_pcie_exit_from_l2() return value from void to int. Return error
when exit_from_l2() failure to exit suspend flow."

Frank


> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> With that,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani
> 
> > ---
> > 
> > Notes:
> >     Change from v2 to v3
> >     - fixed according to mani's feedback
> >       1. update commit message
> >       2. move dw_pcie_host_ops to next patch
> >       3. check return value from exit_from_l2()
> >     Change from v1 to v2
> >     - change subject 'a' to 'A'
> >     
> >     Change from v1 to v2
> >     - change subject 'a' to 'A'
> > 
> >  drivers/pci/controller/dwc/pci-layerscape.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 37956e09c65bd..aea89926bcc4f 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -39,6 +39,7 @@
> >  
> >  struct ls_pcie_drvdata {
> >  	const u32 pf_off;
> > +	int (*exit_from_l2)(struct dw_pcie_rp *pp);
> >  	bool pm_support;
> >  };
> >  
> > @@ -125,7 +126,7 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> >  		dev_err(pcie->pci->dev, "PME_Turn_off timeout\n");
> >  }
> >  
> > -static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > +static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >  	struct ls_pcie *pcie = to_ls_pcie(pci);
> > @@ -150,6 +151,8 @@ static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> >  				 10000);
> >  	if (ret)
> >  		dev_err(pcie->pci->dev, "L2 exit timeout\n");
> > +
> > +	return ret;
> >  }
> >  
> >  static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> > @@ -180,6 +183,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> >  	.pf_off = 0xc0000,
> >  	.pm_support = true,
> > +	.exit_from_l2 = ls_pcie_exit_from_l2,
> >  };
> >  
> >  static const struct of_device_id ls_pcie_of_match[] = {
> > @@ -247,11 +251,14 @@ static int ls_pcie_suspend_noirq(struct device *dev)
> >  static int ls_pcie_resume_noirq(struct device *dev)
> >  {
> >  	struct ls_pcie *pcie = dev_get_drvdata(dev);
> > +	int ret;
> >  
> >  	if (!pcie->drvdata->pm_support)
> >  		return 0;
> >  
> > -	ls_pcie_exit_from_l2(&pcie->pci->pp);
> > +	ret = pcie->drvdata->exit_from_l2(&pcie->pci->pp);
> > +	if (ret)
> > +		return ret;
> >  
> >  	return dw_pcie_resume_noirq(pcie->pci);
> >  }
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
