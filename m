Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B76A8DD4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 01:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSTKz6kcHz3cgx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 11:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=of24h+1a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=2426d6b7e7=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=of24h+1a;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSTJz6gspz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 11:25:37 +1100 (AEDT)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322NrPbe012186;
	Fri, 3 Mar 2023 00:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=dFNmAfqW/MEbA0+zUaXfKrBZVY8niKsqL3/r66gBuOU=;
 b=of24h+1auylRC01XLXsQaRuNFmGvHg0/3MA4Vw8WscFdEHX49XXKSoGYa1yFsgjYc/2s
 xLQ1s/n5bBOl6EYuTQ3sejjctYDnDEh+IHUxnk5djezSRUGVr6du6v21iN+jbjKrJAXj
 MFWsXr2YgW71PRBaQaj4x/2nCtjcyHowDqDfDS3n3Rmhus4WrFB+uwRTPbuXkkSZLcnu
 IsTFp7M9FbWOW5A16LSLAV1pXBUrHbVRP2Xg6AyaVbCL0aUbOsFiwrVEG4/1erW6vs63
 KeXhe6WblUZanqK52RdMSQBZchu12TMvRQ37+a1WBhuyU30l/T4c7D+CrQno40DNF4jC DA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwp3ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 00:25:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc/eYm4INT1ubX/Sd+6lekDoTvuUOmletF/w87YSgat7ovqqStMT69nUV+ssbmYf5JuYDQojf/jb7pTVdilwr2hTmbkFMJhR0FmFn7uYH9FlUNI7487s4rCYOyvJVFY+IT2aFHLhHzx+lEPQ8aaUAGhq3SZWgeFCt2J7JCVCYZw3v/35Gm+qQ9ssV5Gr88bcPRpDqT2qAklTlWrqPwEjs+Se21+P6ygbPUsV3EVr++0su1bcLYyWl83ibzsBYqasds06NOgN2JuELW13JFbdbGFg6YDrhL/7+VVGSKpEQg2BQloN5NCQMg4Xm3eTtmSdMQs+y7jyuwODFUSQGEO8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFNmAfqW/MEbA0+zUaXfKrBZVY8niKsqL3/r66gBuOU=;
 b=B2qYLJ98M6GbX6U3cOaTEOg6R2hxV+WxvrUsJ01ImEJpsTvgW9iAHhKSViYOMhgrUjWa8mG7hvesSM8rlvKxmrmHIm7+lXK39l07ccKhycJbrbAej/ow584G+fmtaYIpYbOmiigI//NRC1eDPMPzkrBaqMfmRsxYx/VHmTnJ1dAQqiisZCtHMgTXCfYZd8StvnxUdYLRnqZ6xOJfQ/m3K/mvI+uhrd1muBg0ADTDfkzGmVxvNqI4UMhQ/AmhV0iiy9gPNMGj1xnlU46j4oLIZQfj681bEdj/m9nzVZ0Y/NvgCAsVsypSxQWtMS4Uu4RVt1eIW9BtRXL40ieYjst3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 00:25:11 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 00:25:11 +0000
Date: Thu, 2 Mar 2023 19:25:04 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Crystal Wood <oss@buserror.net>
Subject: Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
 fragments.
Message-ID: <ZAE+YBeCB8ql/qrj@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <20230221194637.28436-5-paul.gortmaker@windriver.com>
 <20230221200308.gu3pwrg7layxzkpt@pali>
 <Y/U3vIKzkKJAc5iU@windriver.com>
 <20230221214930.35ttgzntv2vfwlo6@pali>
 <8f1b02433cbeb90fab982a0b5377e8558e4eb5d3.camel@buserror.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f1b02433cbeb90fab982a0b5377e8558e4eb5d3.camel@buserror.net>
X-ClientProxiedBy: BYAPR08CA0065.namprd08.prod.outlook.com
 (2603:10b6:a03:117::42) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|DS7PR11MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac2dd1-12f9-49f3-a72e-08db1b7dbfbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RdBY6ULwslVH23lYt6ptjdPiCX4LcdcaNlmFJ0YOsN/p/lPY5AcbBt8rCGHsyj+1sfCu6LqpvSsk79/euoftnQC2eaAR46UKTx0gcTTD3RRJVX/vspUjvQt0wFYJ4RYunoHUJdFhbyJJGYgDd5GZIEkLVap4WcBRd0+INlon8uqE+xY6IWx3uwc+5espm54PUqAdbDNSHYrvlf0mM8mI2FjtJ4GBu3b/BlYRdImw4MiX5HyjzODRHi3BbxKBQhWBbWp6hTwl6qmhS3lLfnu+yqk8P0YB4IOvWg+gwAU5E24A0LF7fWI2JS3U4gxDE0Jv6aOddl14iav/8QyAS3/V6Owu1U2hNjmqcbekocpWm53y8oc+/4NLatFt2VwTrq2IRutD1t0WtIEHmHRNJLHUoNQTQcehZg6IycBEbl8L0iVHnM6K+lCq/8LOVa6OdDJy39DNNPU2fFKxSML6E3tbScJS5sK3cVQabHYWvK2P3+I53hgs0h9q3XbP1z4AP9ztpVsaTHVflc2n3nn3nx0TW0q6vE7+TwjiseKlmo4Nix3exvmEc8krlGcsRkDKjOFBIKNPZe7RPk2q3SB8ngx4/9C8OmZmWKQ2rPwAKPwiNi0ap1dBCOtykt+WVsdiF1bMUdw5FXdc60VRnEh430Imyg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(451199018)(86362001)(66556008)(36756003)(2616005)(8676002)(186003)(4326008)(66476007)(66946007)(6916009)(54906003)(8936002)(41300700001)(6512007)(478600001)(6486002)(5660300002)(6506007)(26005)(6666004)(316002)(38100700002)(83380400001)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/FauhhMnPNb/nOzkX8yGlgoG5Fmrq6Qi0skYuPHKTyNaxUyYDAmxF9VBFu6Y?=
 =?us-ascii?Q?uxKN3gTjgnMbEOT27M4b7rCXPVAflQenDa6voepE/QpeNATyZYkRQ8+p7Qbm?=
 =?us-ascii?Q?X9RgD5POzGbaFae1XE5G89vCllgnYRDayZg2fLBhqwKnvCvjLbA5HqS1MKNK?=
 =?us-ascii?Q?ttan3bKQg4da9vFIqCI7poC9Hy/K2Km6ayRMEshv0+tAeYg/PzKXuhVthtXH?=
 =?us-ascii?Q?QGUWUNJI7hDaq5Gl/PwduGtbgFvj5EIvVWARfe1Mrwnx7GIzSsA7oQP8prMA?=
 =?us-ascii?Q?HfcyhO7cCkI+zXeGzHf9X8he+uG6xY3mF8pxqA+Rw6YlcpptpqmHXgDCeF/M?=
 =?us-ascii?Q?OGDUbH1SvONFyj9tT48b7iRsx5gvQhy0LWJ3SleUx0Vl8io0hrBX1awXkofO?=
 =?us-ascii?Q?GD72ygvlq7mngh8Ja7rstL5EJiokHACFF3EwnYRhQhlXEfNgJ3fmG2FWKoMC?=
 =?us-ascii?Q?LY5eDEpLbHRQm48Wtlmr/obJ6MDO4OWF/GOcJwKJNwuAEYpyqnjoHUc32j3D?=
 =?us-ascii?Q?achG+TjaDomP57G9YdVOYvDsmuBMFer+1/i9uqRYQfFcoUrjV1AJKjmMldMH?=
 =?us-ascii?Q?I6txBHFMliDFAdrfZIVIQM6IxF1O5eGqNmUHfqzq8wOnmX4QQyd4IZzCbdKr?=
 =?us-ascii?Q?/S5BBfImdnR0EguNfl41TM6vzDDFYOPyTyz+IZqpryK88lSbp1ogBAyFW/fi?=
 =?us-ascii?Q?gT64mldsrbR2MGhJUEpocahRrdaLxXgBCFTcSlC7ths9djHCPOZ2GABhzOD7?=
 =?us-ascii?Q?SP+QW1IlMYdIxotk/fjkz2H2P9bCFlxZiYDvSQfrEwRoIAESirkuVrq+lNKS?=
 =?us-ascii?Q?ouM7s/3FyAkJJFJ+gF3r82k0hga9iPOZl/2D2QH3zAQIzrikr6okUr+yYqvs?=
 =?us-ascii?Q?7HPLiqil817ZeLfqLDrEIR28trUD6QHE+vqBRQfxiSHvyiRiFxwKVYAHK81L?=
 =?us-ascii?Q?LLu2MJUk3iI/kkL3j3N+LNbYtKQldF/gVjRsWoqN/NQH1jilXBAtVWYztP7M?=
 =?us-ascii?Q?SGPNMmYlxFxcXHHAwlWaF/JoBv39ap12G8ATTmWQVCtlFpjMnkg7ncwRnGIm?=
 =?us-ascii?Q?90OVRODhR5WWChzlAAOxPu8niK4TyVL5JlcU3nlqSqjBlYOAZQYjwc32c2/4?=
 =?us-ascii?Q?pnC1dMsJp1qUUKCPeVqSg3WnbX1gsSCT4tLIqG/3pMM1zLNFTfme1e20htwB?=
 =?us-ascii?Q?jQYc9j3EsR5aQuUE3Qa5femINRSKIX8v7iu8LY6WERKZQckmN/U4nPBBYhrM?=
 =?us-ascii?Q?UF7tLo/0zo7mBVf8H3pUykjZ622+KU7+Knr9BZBaiXgcdGeaH1fJySg0h+Jy?=
 =?us-ascii?Q?3IR1HUC/EdJYEXXivMowZvRyNPmB1RxFbsoczfw8qynRmUvauc9KALxdQ62N?=
 =?us-ascii?Q?mC5jrMuE3iPKnGlBIRG56VI+6wHFSU0UK1xArvndF9ge9YHjFvbo+Ufl6DQW?=
 =?us-ascii?Q?UeDtOqBazHdMzFboOVu3wgVZa34dnn3cQPYD3Rv3sMUvagENaL7RiAByhElX?=
 =?us-ascii?Q?Qm/MnrCEZwQyJFsrXLQhhnXbzscwFQEjT0u+xEOrEmY7dkpm4AQYA36aaT34?=
 =?us-ascii?Q?d7R8s4Bn2SbiWoOLm1RyplKfJXdt2JomlO+z/IRRbYnbt4T7jW9fo6XbPaO5?=
 =?us-ascii?Q?cN5ql24ZuzY3NVRzJuKna0M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac2dd1-12f9-49f3-a72e-08db1b7dbfbd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 00:25:10.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rH3oY3eR6Qxo/QJJr01BazbKbcjuCo25ivMG23ZY+MOpNR+88MIkGf4u5YBr4sqq1Ku8XQY7DBRvkBcR3vetqC6sFAm5NY23ac53Sa2zAN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
X-Proofpoint-ORIG-GUID: rnhknrscX_ZGB0hhyDxN649ACQVmuBA_
X-Proofpoint-GUID: rnhknrscX_ZGB0hhyDxN649ACQVmuBA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=512 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030001
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
Cc: Pali Roh?r <pali@kernel.org>, Li Yang <leoyang.li@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config fragments.] On 02/03/2023 (Thu 17:30) Crystal Wood wrote:

> On Tue, 2023-02-21 at 22:49 +0100, Pali Roh??r wrote:
> > On Tuesday 21 February 2023 16:29:32 Paul Gortmaker wrote:
> > > [Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
> > > fragments.] On 21/02/2023 (Tue 21:03) Pali Roh??r wrote:
> > > 
> > > > On Tuesday 21 February 2023 14:46:37 Paul Gortmaker wrote:
> > > > > None of these have a reference anymore anywhere, such as like this:
> > > > > 
> > > > > ?? arch/powerpc/Makefile:?? $(call
> > > > > merge_into_defconfig,mpc85xx_base.config,\
> > > > > 
> > > > > As such, we probably should just clean up and remove them.
> > > > > 
> > > > > Cc: Scott Wood <oss@buserror.net>
> > > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > > > Cc: Paul Mackerras <paulus@samba.org>
> > > > > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > > > ---
> > > > > ??arch/powerpc/configs/85xx-32bit.config |???? 5 -
> > > > > ??arch/powerpc/configs/85xx-hw.config?????? | 139 ------------------------
> > > > > -
> > > > > ??arch/powerpc/configs/85xx-smp.config???? |???? 2 -
> > > > > ??3 files changed, 146 deletions(-)
> > > > > ??delete mode 100644 arch/powerpc/configs/85xx-32bit.config
> > > > > ??delete mode 100644 arch/powerpc/configs/85xx-hw.config
> > > > > ??delete mode 100644 arch/powerpc/configs/85xx-smp.config
> > > > 
> > > > This change is likely going to break mpc85xx platform because defconfig
> > > > files includes all these files which you are going to remove. For
> > > > example in arch/powerpc/Makefile is:
> > > > 
> > > > PHONY += mpc85xx_smp_defconfig
> > > > mpc85xx_smp_defconfig:
> > > > ????????????????$(call merge_into_defconfig,mpc85xx_base.config,\
> > > > ????????????????????????????????85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)
> > > 
> > > OK, it seems you've answered a question for me.?? That being "why didn't
> > > grep find a reference to these fragments?"
> > > 
> > > It seems the ".config" extension is optional?
> > 
> > I really do not know. (And I'm not sure if I want to know answer :D)
> 
> It's not optional; you have to leave it off:
> 
> # Used to create 'merged defconfigs'
> # To use it $(call) it with the first argument as the base defconfig
> # and the second argument as a space separated list of .config files to merge,
> # without the .config suffix.
> define merge_into_defconfig
> ...
> 
> > > This seems inconsistent at best, to reference some files with the
> > > .config extension and others without it.?? Not blaming you for that,
> > > but it is probably something that needs looking into.
> > 
> > I agree it is inconsistent. But it was there before I looked or touched
> > any powerpc code. So it looks like something which nobody wanted to
> > cleanup because "it works" and had no motivation.
> 
> No, it's intentional to reduce verbosity.  If by "inconsistent" you're
> referring to mpc85xx_base.config, that argument sometimes refers to _defconfig
> files (i.e. the pseries targets which were the initial user of
> merge_into_config) so that argument can't autoappend .config.

Thanks for the detailed explanation.  As I believe I said elsewhere, I
wouldn't be submitting this change once I understood the use case.  Plus
it wasn't significant in reducing our overall maintain/build/boot kernel
overhead in v6.4+ in linux-next etc.  --- as that was the real goal here.

I deleted our various BSPs years ago because I didn't think it was fair
or reasonable to expect other people to update/carry them on our behalf.

I would hope that is a statement that everyone could get behind.

Thanks,
Paul.
--

> 
> -Crystal
> 
