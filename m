Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5B3FE36B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 21:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0F8L056Pz2yWT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 05:52:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=c36j+KGO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=4878cd775d=paul.gortmaker@windriver.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=c36j+KGO; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0F7T61hcz2xY7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 05:51:47 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 181HRVlf013704; 
 Wed, 1 Sep 2021 12:51:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=0kik7opNwRhq9wrsr/+J5rhwBd9aXrpsslFs/S2NUgA=;
 b=c36j+KGOKHAAL+4cFZzoFMgZaKQOXo9q06ncW/lbsi6uYyFR+bxKMMXga6pVtQ94ydfp
 ThNGSh2cc9TvP4AIrT45rzfHGqR/0SonKAAwZt8lgAH3VO0y/gqNWrbmZzbqjD03XBC+
 pnb0FnXbX7BBq1Ln20z2w7RvuZc1re/bCccxp6ziPk+amhVveyF/2V2aIvbrPHUvNHV0
 9ukN7464lcZguSpShKuuNOrff9pkXnD9oVC92b7ghaWigx3uHDmIXRZjcaM1rnIIssAH
 PFtAfBWIiFfb0g6sfhWSh0SpSkORB+mIonJpk5Ur02IKahDu+gs3qnIK9zsZYzlQrdqt pA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0a-0064b401.pphosted.com with ESMTP id 3atdx6r42u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cw5btOyhSi7cl1M2LYX9LYR71r6MJWMfWbQFPLebL8BWf6mPurWY0Z/hjf1hV+6R3pbSlw9RW8+AAbDtMJbtorYZdji7A1Uz+qgc0P5TduutTIm+kKqOxiBQWpJoCtOrQEABsjMclP6Bn4SG9ZB848Rg/+LgXhG7jW4a081HTp0h814AkGCyLrfa/awz3ipkM9PsOyFeT8TFFi/tGOJUXbh5JAlnyVaNYxRhBylO6bhyAwiP+t6tfPjyd+kdV5Hw6gxruwEEpVaUFBApW/xB+pgon3kahcF1tFCq1jph4DsJPRIg9z+y1FWRnmBfVqb86UzXoaRIesDopi3Y9dKLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kik7opNwRhq9wrsr/+J5rhwBd9aXrpsslFs/S2NUgA=;
 b=K72JwYK7a7u2xC8qBY6SsF6rfjYYVtjB5LW3l7d+zfJODlo5G7J+L1zVU/iAs5ujY5z0VQK2nGR5fhOpDaAZqDpwSjoW5Imig+QJiJebQ2ge5J2ah4f/R4Mqtv44AuBzPlg+PK6cfnIosPiYALELHuQtkhAPggRm8A1Q0gbaets7MXpYm0nXEUmsFuhK6EswGKGR6BVyzSZLBfdRbVTr7LMvqpCV13w3Rgn8Si6hUXmWjo7HKW/RDATDEI9oZ8WrFkgyzEUN4mOgWBExy+JVAUhsoPniz9t+ilDb2eIYHZiGhflN1F9OR81WJzjuGlYNzZJc9Kgm4C+xQa5OXtzg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB3465.namprd11.prod.outlook.com (2603:10b6:5:b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19; Wed, 1 Sep 2021 19:51:26 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::a055:cc52:8dae:404d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::a055:cc52:8dae:404d%6]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 19:51:26 +0000
Date: Wed, 1 Sep 2021 15:51:21 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] retire legacy WR sbc8548 and sbc8641 platforms
Message-ID: <20210901195121.GB165712@windriver.com>
References: <20210824174209.GB160508@windriver.com>
 <87pmu09rg1.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmu09rg1.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: YT3PR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::31) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
Received: from windriver.com (128.224.252.2) by
 YT3PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 19:51:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b69a79ab-7655-44a7-d1ef-08d96d81e1e3
X-MS-TrafficTypeDiagnostic: DM6PR11MB3465:
X-Microsoft-Antispam-PRVS: <DM6PR11MB34651B86C96FD717904DCAFD83CD9@DM6PR11MB3465.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKEJE4094z6Fg6Q5tHD9zaW0IdfirhimFCITdjxvUpwB3SkDbqjY6fl8zoKor8F06DJvMjKoi3WFYuinLaG20FToeA/voVQBxJNnN6KAjSCEGxlOmyj5gsTAKwk+TBnAQKj52mARacLLR3XWkUy9TFS5NdPkl7dx3SQSH7ymDyRim1+lLIfqw0W8y5MYXfRGmkVRbNh/X3yCOtz+QrFKc2rThq1lkEvr19oe3WBIE8U+lpxLg4kkASalkFSSjHsG8rFpNCsvjljj0I9p1/CNS5JecPCQC8kS1cOfevztEUq4owVzVid4adrvcKQwMGte+OW5gDDphky4TGGKxGWypSHfUiHHqIaA5t+sSupCCXFgBNZyZzhtfSnrYo/JYgNA0iQkog0v3cnUM5/DvKXc1KEB7nvtB82Nt3X9H1mUuISwRZQHKtRTknMGQ8ERjIR8HE3Ip8zbMyf6+jVV7JPckhBTkZFju1DXG4X0j6KV/8tVspyIEwCwrxpkJtTJpRCeVuoebANd7A3sExYII6qjnJd1sUD1ctcksVWBnEUJG2wztgqsQZtCuRla5pD9a0PdgX+V5uUYFEkWH3veu1tgjQiypDfX+trkUao0wdI1Zhxzx8R4aUa6rO739jwSwFad1l/OqLTKddkjmHnKIz37W4arSNJ2wrfkT8gEZfJMmTHJ8e0zQTcexqHGbi5NT9PMwPMcN8qSB9616TPWBynsPmnsekPuXOU+Tv47CZwUpQ/riiGfhgjRVH5Ozc1UQVU0ez5X1L/yKsUJjGBjDgnxwrkHVXv5OU+VZwlHJ9s3GXWmHR/OffPlu3uuJukZ3SdgEKqKf6mSWGHRX6H9bpCZHwXYh7eAbb0RW+e9B0PxpEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(4326008)(2906002)(66946007)(7696005)(956004)(2616005)(54906003)(966005)(44832011)(66556008)(86362001)(38350700002)(6666004)(52116002)(33656002)(8936002)(5660300002)(6916009)(186003)(36756003)(55016002)(66476007)(478600001)(316002)(1076003)(26005)(38100700002)(83380400001)(8676002)(8886007)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q70gkpS/lekVTSgyVGHpluFqee+e3LtC8v/xnomh/ciCIMP81QOPTmDbtVFs?=
 =?us-ascii?Q?jQSVeHwhNNtWtbkrZa2p6UggeRyCvZIwHUV4Ky+A8FCA1oJjK1MCezFnhl3e?=
 =?us-ascii?Q?wo9KxYB3Xdt3esCjmdL+InSjl49Gyc1iJk05FOEB5CjGLeMs79pUypjjXzAO?=
 =?us-ascii?Q?t43AYCTiypxsrEQwVjSGOReJO7KT3p2XTo0jxOdGXuCw/GI5aUXuB9EVhGTW?=
 =?us-ascii?Q?7eqp2HZRvijUG1zMzomgHeeUQIRzE/qFkUfGZfDCTmO2p+89b1wWgPbKnIJF?=
 =?us-ascii?Q?fIN/hspuiDjXjlpMttpzcAIp82FbIJvwh+MQlQQm2rxO5jkVERL3tKGbRSM1?=
 =?us-ascii?Q?ob6us6B/xeTLci/KjcMu+DhcsB82+sXvXpJwZ+fMTVsaF4Vu+7+r0/glX7FS?=
 =?us-ascii?Q?MStFstfawjotgflZca7jGGQc/Zao/ofxnH5Twwr+aCqfFFAf5gvfnL/R6i/s?=
 =?us-ascii?Q?A4TN3w3eCV1IDYc5bISI7enZ5+OjDLUBgRvTEX7o/1gxukRC1AabCKm2LbfX?=
 =?us-ascii?Q?HPOcpkuZcMQ+MnUfGqZ+pZli5N9ZvFpLXcMfE6KyCKN7E7yN3Y6cQZQJK9a8?=
 =?us-ascii?Q?l/+IZyGsX18bmNDsfcnuyAzxSbG1vh4JbP5jimmfSqbSkk8JTRQaQF8TScgU?=
 =?us-ascii?Q?K44CvCTIMcCRqLWVmcGyNCnz3s3JZFU4m/PxeCzKfpnQWoaiQ0tLRi3j4yGj?=
 =?us-ascii?Q?fJ0P24BCzkphNT4gmoxKxKr4iLX23ckEDsVhWsdgp63Ft1jxj4oYowODJjS8?=
 =?us-ascii?Q?uXOA5oPREcFRw34irZfJGZrTu99UWrUNQ/0v5augWpqml+HR1FVoXTc1dsG1?=
 =?us-ascii?Q?HK1lOfoM7EW3/8ayXwGU74W+8NtxOIdoObnCE5k8FHAYuNQNcTBXA34UULza?=
 =?us-ascii?Q?TwinWXqF5mJOsGvxBqIErRLyJnJGckSPi63kaqb4dIZjLhfIbBG1f8Xqc8JN?=
 =?us-ascii?Q?tg5k4/N8s8umgOk7Wky24X0YMvbYGF+GSTNEe5VnduAEw8+6OmJaWqnz+HBO?=
 =?us-ascii?Q?MWox++quZ+D0DWE2ihtBsr+LTCR56v2Y5B+CqXaCoi/w5HxmyT8OZ+Lpw2bj?=
 =?us-ascii?Q?YSM0BlIdCO2EvtHenocMnYrn7NlUN59Y+WlA33CwoekoaHsTC6S0Oiro8TyG?=
 =?us-ascii?Q?wLVSRQCJkKQd4AehkFqtC6BETqgT1yUkJzPrWCtKA2OPdP79YmO15jh2W1yt?=
 =?us-ascii?Q?2cSF1hfL31UvarZqWYYWNiJG5VSmdqSUotpkfEMs0ysHORU0eFAY+/fG3fgG?=
 =?us-ascii?Q?g0DpTSJiGpA1EbOPbDI/WpXgceGd8h1vOypCD+Z3qgQ561TfXYiMsj9ijUTP?=
 =?us-ascii?Q?GUKWBEDLqHAz73A4M613Jcfj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69a79ab-7655-44a7-d1ef-08d96d81e1e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 19:51:26.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdnw6Yki0G4UOO6T5r3TTDcerLQj4JbUxXKWdm5xWo2pN1B6Bmdlz+JqziE3hZ2K71KppeWEnhYQAvJtnN3tlPn4KstVnpZGSI4EifjRT2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3465
X-Proofpoint-ORIG-GUID: uPreOWnf_UKxETE7GwFsAieegsBqwr4N
X-Proofpoint-GUID: uPreOWnf_UKxETE7GwFsAieegsBqwr4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_05,2021-09-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=930 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109010115
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [GIT PULL] retire legacy WR sbc8548 and sbc8641 platforms] On 27/08/2021 (Fri 01:05) Michael Ellerman wrote:

> Paul Gortmaker <paul.gortmaker@windriver.com> writes:
> > This is unchanged from the original wr_sbc-delete branch sent in January,
> > other than to add the Acks from Scott in July, and update the baseline.
> >
> > Built with ppc64 defconfig and mpc85xx_cds_defconfig and mpc86xx_defconfig
> > just to make sure I didn't fat finger anything in the baseline update.
> 
> Thanks for following up on this.
> 
> I ended up cherry-picking the patches into my branch. I like to keep my
> next based on rc2, and merging this would have pulled in everything up
> to rc7 into my branch.
> 
> I don't think you were planning to merge this branch anywhere else, so
> it shouldn't make any difference, but let me know if it's a problem.

That is 100% fine - as you guessed, it is a dead end branch, and there is
no real underlying value in preserving the baseline for removals like this.

Thanks!
Paul.
--

> 
> It should appear here soon:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next
> 
> 
> cheers
>  
> 
> > Original v1 text follows below, from:
> >
> > https://lore.kernel.org/lkml/20210111082823.99562-1-paul.gortmaker@windriver.com
> >
> > It would be nice to get this in and off our collective to-do list.
> >
> > Thanks,
> > Paul.
> >
> >   ---
> >
> > In v2.6.27 (2008, 917f0af9e5a9) the sbc8260 support was implicitly
> > retired by not being carried forward through the ppc --> powerpc
> > device tree transition.
> >
> > Then, in v3.6 (2012, b048b4e17cbb) we retired the support for the
> > sbc8560 boards.
> >
> > Next, in v4.18 (2017, 3bc6cf5a86e5) we retired the support for the
> > 2006 vintage sbc834x boards.
> >
> > The sbc8548 and sbc8641d boards were maybe 1-2 years newer than the
> > sbc834x boards, but it is also 3+ years later, so it makes sense to
> > now retire them as well - which is what is done here.
> >
> > These two remaining WR boards were based on the Freescale MPC8548-CDS
> > and the MPC8641D-HPCN reference board implementations.  Having had the
> > chance to use these and many other Fsl ref boards, I know this:  The
> > Freescale reference boards were typically produced in limited quantity
> > and primarily available to BSP developers and hardware designers, and
> > not likely to have found a 2nd life with hobbyists and/or collectors.
> >
> > It was good to have that BSP code subjected to mainline review and
> > hence also widely available back in the day. But given the above, we
> > should probably also be giving serious consideration to retiring
> > additional similar age/type reference board platforms as well.
> >
> > I've always felt it is important for us to be proactive in retiring
> > old code, since it has a genuine non-zero carrying cost, as described
> > in the 930d52c012b8 merge log.  But for the here and now, we just
> > clean up the remaining BSP code that I had added for SBC platforms.
> >
> > --- 
> >
> > The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:
> >
> >   Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git wr_sbc-delete-v2
> >
> > for you to fetch changes up to d44e2dc12ea2112e74cdd25090eeda2727ed09cc:
> >
> >   MAINTAINERS: update for Paul Gortmaker (2021-08-24 08:19:01 -0400)
> >
> > ----------------------------------------------------------------
> > Paul Gortmaker (3):
> >       powerpc: retire sbc8548 board support
> >       powerpc: retire sbc8641d board support
> >       MAINTAINERS: update for Paul Gortmaker
> >
> >  MAINTAINERS                                 |   1 -
> >  arch/powerpc/boot/Makefile                  |   1 -
> >  arch/powerpc/boot/dts/fsl/sbc8641d.dts      | 176 -----------------
> >  arch/powerpc/boot/dts/sbc8548-altflash.dts  | 111 -----------
> >  arch/powerpc/boot/dts/sbc8548-post.dtsi     | 289 ----------------------------
> >  arch/powerpc/boot/dts/sbc8548-pre.dtsi      |  48 -----
> >  arch/powerpc/boot/dts/sbc8548.dts           | 106 ----------
> >  arch/powerpc/boot/wrapper                   |   2 +-
> >  arch/powerpc/configs/85xx/sbc8548_defconfig |  50 -----
> >  arch/powerpc/configs/mpc85xx_base.config    |   1 -
> >  arch/powerpc/configs/mpc86xx_base.config    |   1 -
> >  arch/powerpc/configs/ppc6xx_defconfig       |   1 -
> >  arch/powerpc/platforms/85xx/Kconfig         |   6 -
> >  arch/powerpc/platforms/85xx/Makefile        |   1 -
> >  arch/powerpc/platforms/85xx/sbc8548.c       | 134 -------------
> >  arch/powerpc/platforms/86xx/Kconfig         |   8 +-
> >  arch/powerpc/platforms/86xx/Makefile        |   1 -
> >  arch/powerpc/platforms/86xx/sbc8641d.c      |  87 ---------
> >  18 files changed, 2 insertions(+), 1022 deletions(-)
> >  delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
> >  delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
> >  delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
> >  delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
> >  delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
> >  delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
> >  delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c
> >  delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c
