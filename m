Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7B69E984
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 22:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLssY283Gz3c99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 08:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=QPm3r6gp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=QPm3r6gp;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLsrW6twDz2yJv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 08:30:01 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LD0O1a000966;
	Tue, 21 Feb 2023 13:29:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=PGABX99ZZnH6MgZrLGIO5w87TUK5ogbDjmBRkCev9d8=;
 b=QPm3r6gpecNsgfIH2b2xWx88t0dxM70FQAChRaon2zSCEWsW0OccnKtDYeBBaFZ88G9F
 UHDL3exwcmpZ0JC9Ts/dmGIdLLjPlwp7LtBdc/fF0SuQikenE/Pvnvy4+SCW42Lb2xD5
 SVaE0K1M3pzVfrO+CUKKvCfFe9PniaA/oDEMGG/0dZiOhVAfQ4V1HhGYKQmIX25uz/5f
 eSydthuI9irQtoXbpPI/9pAFnJh8AhsZt+Kj5d6Y5EMgA54eaTxBjwUkI2oAZ1brhgyc
 ycxE/mYxpDa0wG02XgPwvFWudN4hzeFLEAHZXC5YPyThVL/KRRV02W6ShT6Ph4C7FFsv Jw== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u1qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 13:29:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyb4aIOqaj4jIyd+m8Pd2VLGmaYwKCXd0mwsryVjnRFq2FUVX3nBBl4FimxWnx9AMC+GEPZQSONhDRHQvuxntD7bKuJRpguTmReX++70WmrahiJwaQMyLXpPxh4vD1mGJhAfys84FHoQdHYalXq45TMkgt9nGuc6h6kahnLYPYQYq1FOp+G0ZsAMAw8SATWr0BpdZSXxuhLaAsPpFEfSUOdR9TnpeE5YjVCZDpD2IVzxLsO68UM0lEtztKf0aoSz3ypO8dNrQrhS/zaGY72hIz7lqmhWqMOFSumI+Isl+XbrwAPvyh2sXwxeRwZTJTQ2rH4zX011jGauYTAb86FHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGABX99ZZnH6MgZrLGIO5w87TUK5ogbDjmBRkCev9d8=;
 b=fVgt9t61kGMi5DiCEOomMCfDW6m9QQwI6h/1Mxp9FA/GXbbuvRJLRSo/Ks0sKvSDjP8bajfqlhQjm+871B3+nEGekM1gPGXhbc1dUN2zufvR0IGN+ALkG5k2qCPH7uCRmjc1k48Yr1COANzH/dXymaYsUifl8OKoQqaing07AU7TBFpS2swKn6c3x6HB7dSdAlx1t4aiB58oXfc+nOUCMdU1ecRcOgSl93f4jW5+XsSVYX7ZuUssZVx6S/USIz2fzzYS+STRUmQ4zbia2RBJcxKsz57lwNMgeZJ+fGNHbQKkfnkQv+zHctNqRo5vDS5KleC3yIiI7PJLrCisBaAagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 21:29:38 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 21:29:38 +0000
Date: Tue, 21 Feb 2023 16:29:32 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Pali Roh??r <pali@kernel.org>
Subject: Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
 fragments.
Message-ID: <Y/U3vIKzkKJAc5iU@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <20230221194637.28436-5-paul.gortmaker@windriver.com>
 <20230221200308.gu3pwrg7layxzkpt@pali>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221200308.gu3pwrg7layxzkpt@pali>
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6381784e-4d5d-44f4-5567-08db1452bc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gBZRkD+aU8vaN5KSX8ZyXb4CTN+jwsUsbM2UJzTX2KSaQOZlafpvNR4dJ+FRbsMH36aegJF+1qP7Ui+svs2IxA7jM6K/LfJ84QIsyWqXGUVUhYR7iQqvRr9vrYBU4cft/urKBPG3aMOMbSQT+YTg0ectf0wfjcSm7H7FkdME7aD7Lqwqwzalr/XJTxvzXTJSRMnpTLrqEQ9FI3iNnehkQSF060wSD1G6xv/q+Ui33mSPJ6tAtqsXUhZS5ZS8pJkNiYM38ZTyODvFOMHQNUD3GSlYTsWR7V61kCxZPxot1oHJNSTsE/uoexA/zwumURvOE/8+CEppRvW5AsUAHmvU/WhTn0+BXtQgiX67uMrXM2MJsAm1novcj3zGblGyjfh2CMHmFQCDOpzb3kBmeqsO/tkK1q5vJ2BEu1UmVUhfFBMEcUz+yOxaH9gVhNNdLNKc0cPYV2QNDxxebvwKIpw4VxIksYuvxZE9p1fKLfPbZjPxlxnj0+c6BJTWNMRsMZC8W6BqzyBb7xgjRita8QdY7qFm93FetvgkjnCQeCu8M7U0atqJhbXCxhi9vseUMQB+N+HZQAACYhyzgxZf0jSmfh/EJoAGSfNlERVgSfwXHwPc2D/kCY7gRrR6j2mwPj1lmDGzBy4VA1w8QRqSRjztwA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(451199018)(66899018)(2906002)(2616005)(36756003)(83380400001)(38100700002)(86362001)(6916009)(8676002)(66476007)(66946007)(66556008)(4326008)(478600001)(44832011)(5660300002)(8936002)(41300700001)(54906003)(186003)(6666004)(6512007)(6506007)(26005)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4nQn3SCQwf60vY6XOkPTx56UgNbtL29rBi+4ykJIffQeDh/ygYYUYpG8dXFt?=
 =?us-ascii?Q?JhiHpz3dG5m7G+v6wb5YdV0Si5i6tLc3kNCTA+vkUTaFrgPFcXR5+So3f4kC?=
 =?us-ascii?Q?otxyCOraqHmIK9g0XYQhviGmM7bqOZ263txt0ywm0A0j4hT8ZVxrVmq7QZNu?=
 =?us-ascii?Q?ClBf9GlDR4efq1DGNWfQ/PiBCdRqnt8zTdZvqjuFdSqTlaCC5Ulr0AvgL7L7?=
 =?us-ascii?Q?KzCWXcFoeHsOhzSodZQU2ChA1Yd8PlBCzHv0PP+7fWwR0vuzYDQIkIiH8GOQ?=
 =?us-ascii?Q?HWhakUEJb7VfyjqX4tY5wgp564nfwo/rlODE+5zXr/+yc/SwgytahOMHkmnL?=
 =?us-ascii?Q?WJzsI8MZEojOnYy17fxp5znFbe3IX5dYuq9IbRXUi6QKf3EPT3DEqob8QeDz?=
 =?us-ascii?Q?WsefEsMxCJiwgiHCfGPtLqXQkc9lKW+BgBFaGGRme8NP94IzZTKMfNhM3rrp?=
 =?us-ascii?Q?gSD4dW6WlHqjfZLJ3YDBtb+9UoElsaD9U4sHe7JUR6iZLYaM30NcOUra20eC?=
 =?us-ascii?Q?mQUl/dYrUxcHdWtOpWijoSvOTRO12WYwlMaQK2fba66+LtaC4Qmy4whVlFns?=
 =?us-ascii?Q?VUgFZYeTYhP4ti5f/dwY99HtdX8x4Q5NVKD1ZW0OwsM43WKoHpWW1ATHG/FX?=
 =?us-ascii?Q?0jzyX3gSpS+IDVFY+b+ZH84on8cC4f9ZPyGJRVUEAF21Y51tZKVGQG68pf79?=
 =?us-ascii?Q?asN6GtBj8bsYRB5sGm+6S1sGix9L33x4pf7fp6FXVAbrRF0um1rPS0m/+NoQ?=
 =?us-ascii?Q?wZ8bJ6buBmmd3pLl1Fl6SFFOoaVOl/iRRjeab9KP0pueLUHlfT/6kwZ/UjUG?=
 =?us-ascii?Q?cJUcI88Y30N7kPdrNJ1Qe0hEHizrODaoT2edPuGPW00frInndORE/vUjSpU8?=
 =?us-ascii?Q?4lRAeoa7Cm1k1oeRqnAJaMH3v9uXbel3LnIZvLUSkXHruA5MZC1Bs6fbjTaj?=
 =?us-ascii?Q?tVTlJHcH679PraUe0zS58Ddog/ZRd84aTp36y7i7+c5fjpyWCioXckIg6eba?=
 =?us-ascii?Q?tOGE4VyS1+1ASDqg48OEgPnbJOQQYoCgEwnyJcah9YdR3LhwvD7BczSrWEVv?=
 =?us-ascii?Q?MDgM9PJktTAWPbbFvW9c9DPnAU3rxUgLfDojbKcrZQ+4emHNPDZKTZdNdclq?=
 =?us-ascii?Q?l/scto5LGBAsQC0iSOZl80RE4oWWUDEILfZlyskvNacT5USyjZKQ/95a6GAs?=
 =?us-ascii?Q?Ok6Z0u+YpclaECLA25QQ5bdx86HCGAzWBaKesZb/cOtrTii3eQabbGMCyeP9?=
 =?us-ascii?Q?L5s+QCb1oGRT93FLL+77ea9y+B5uUeqI58YRaqPq6f+wom93eLAEMRZgCuJM?=
 =?us-ascii?Q?BNiHMZTvhf3drBfl7cXXSVO7Gkwyq/y0UsmD4uWqI7gRDOYGaZqEJgYcBmkE?=
 =?us-ascii?Q?pVbiBIIhxgc6mXHwLFlXO4GXF+9ZBnRZ/0zs2P5jq/MiCZ2LyvuvFZsuDfFb?=
 =?us-ascii?Q?qchJdTk3VOo1+X9GnW+5emP+fP3wmyb2sU0aDP+w1y3hyCzj8GdL31EhJ/WA?=
 =?us-ascii?Q?V+eH3Li+jV2FiY5t7gab94Ibq0RULrIoNpzLjoeHTYfaLEownhVE6Zcjpucb?=
 =?us-ascii?Q?LWjIxcq1fGWIXTuq0Irqx0/rGgFxsew2c/OL1+DY9ZP+dO/BMSl+EqWYA6yx?=
 =?us-ascii?Q?Xc3Gz9zefA2FsF7OXwAa0sg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6381784e-4d5d-44f4-5567-08db1452bc7d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:29:38.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuYhVS/tYhrlTF7BlpOKF4mdmjkBPJhn5YXInhztgJq5PikhjavBuMjTpJGlYgLaEZHxkXhCD3BcgMbnKyFBAnczUA07QeEOyDJ9YYhG1fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-Proofpoint-ORIG-GUID: suj_Ku2vpfFFCTwXzm5LkCfDmnne5Hja
X-Proofpoint-GUID: suj_Ku2vpfFFCTwXzm5LkCfDmnne5Hja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=593 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302210186
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config fragments.] On 21/02/2023 (Tue 21:03) Pali Roh??r wrote:

> On Tuesday 21 February 2023 14:46:37 Paul Gortmaker wrote:
> > None of these have a reference anymore anywhere, such as like this:
> > 
> >   arch/powerpc/Makefile:  $(call merge_into_defconfig,mpc85xx_base.config,\
> > 
> > As such, we probably should just clean up and remove them.
> > 
> > Cc: Scott Wood <oss@buserror.net>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > ---
> >  arch/powerpc/configs/85xx-32bit.config |   5 -
> >  arch/powerpc/configs/85xx-hw.config    | 139 -------------------------
> >  arch/powerpc/configs/85xx-smp.config   |   2 -
> >  3 files changed, 146 deletions(-)
> >  delete mode 100644 arch/powerpc/configs/85xx-32bit.config
> >  delete mode 100644 arch/powerpc/configs/85xx-hw.config
> >  delete mode 100644 arch/powerpc/configs/85xx-smp.config
> 
> This change is likely going to break mpc85xx platform because defconfig
> files includes all these files which you are going to remove. For
> example in arch/powerpc/Makefile is:
> 
> PHONY += mpc85xx_smp_defconfig
> mpc85xx_smp_defconfig:
> 	$(call merge_into_defconfig,mpc85xx_base.config,\
> 		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)

OK, it seems you've answered a question for me.  That being "why didn't
grep find a reference to these fragments?"

It seems the ".config" extension is optional?

This seems inconsistent at best, to reference some files with the
.config extension and others without it.  Not blaming you for that,
but it is probably something that needs looking into.

I am fine with dropping this config frag patch as we figure that out.

Paul.
--

> 
> And for P2020 boards I'm using mpc85xx_smp_defconfig configuration as
> this one compiles SMP kernel, ideal for P2020 which is dual-core SoC.
