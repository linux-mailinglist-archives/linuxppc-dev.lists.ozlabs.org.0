Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461D3C240E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 15:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLts10JnCz3blw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 23:13:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=windriversystems.onmicrosoft.com header.i=@windriversystems.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-windriversystems-onmicrosoft-com header.b=SFRe09yq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=2824001f51=paul.gortmaker@windriver.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=windriversystems.onmicrosoft.com
 header.i=@windriversystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-windriversystems-onmicrosoft-com header.b=SFRe09yq; 
 dkim-atps=neutral
X-Greylist: delayed 1468 seconds by postgrey-1.36 at boromir;
 Fri, 09 Jul 2021 23:13:10 AEST
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLtrQ36VGz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 23:13:06 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169CmRQE009162; Fri, 9 Jul 2021 05:48:27 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-0064b401.pphosted.com with ESMTP id 39pjap85ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 05:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY6fWy1WzwApOOKjEHSX7JCCTmpFo7GqlmXMFKNjk4/7KyCTvG9u3qEjTaSWXNi8ahW+7NhntRJ61I8ZSq86gEpmx81kKtqDwxGErEGyIYpRzS4GEDygohipRJaVcfEUhAi55ZXNhIFgbglUg42+29rux7DdwyrSHP0pb1429egvDnWY1lXowvRmS6rAIVpD2qjxBklAX32K+xJd7SN/ePHaUg5QXKAMydJx4HiMd8NZte0B/rbh/mMdEeeQtpDxEYehSS70aSQqveI8/+eU38n463cpTcJIpW6/Bizg++vi8DxPdaeU+oEPy/FwAlAIFj5qlZuDwAujghAYo5Midg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWc+jFcrKk6KCzcD5qp5BA0wiV041f1hTzPkImwbKTI=;
 b=DvHhup4zV32DwjY1pddkhFEdBurTM/pk6apNcA2HZ5dQ3JGRknVz9zoBrF9lQhwvrlMRWqV+wQ4O2U4l9bEzYTrJAGC06LIxaeDjMR9EMlYpnOcjuQxOv+bZ99avCGlPqWmSdeTLU4rw4dCo0rFtZ6QDLaTOeV8sqyxtzaeKWQILe63NdBn+sgVyJP2L8dR+vH+DmZ2cW72dkgL0MU3+N9p9ODve78bGN00Z7GPhN6MRSqmxXZ2X5nYp/6zU+fpE00gJP2M7BcnZit6SfwoaREJrF5pQ1G6KPkCqwc+ZfE1y1wj1Z4pHRNgag8Vu+6awQecfoOYG1K19bjgstiE6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWc+jFcrKk6KCzcD5qp5BA0wiV041f1hTzPkImwbKTI=;
 b=SFRe09yqVX+71fiuNb4b2oWjyRwzKvucAII0VJTZH/iAn3pSdXIJP4TtIz0nfqXCbmDP3fCZuGfi1N6ywxlMdJXIuc1/mBaKrCqLtPTHI+i2b2Yu7vSwClHMMINJeK4nBQ9bwPi1Ig9g2/0O1fY1nJLgNtQBH71TB0Apel6FC3o=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM5PR11MB0009.namprd11.prod.outlook.com (2603:10b6:4:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Fri, 9 Jul
 2021 12:48:26 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::f5f8:89db:a73c:d1b7]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::f5f8:89db:a73c:d1b7%8]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 12:48:26 +0000
Date: Fri, 9 Jul 2021 08:48:22 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/3] Retire remaining WindRiver embedded SBC BSPs
Message-ID: <20210709124822.GA56045@windriver.com>
References: <20210111082823.99562-1-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111082823.99562-1-paul.gortmaker@windriver.com>
X-ClientProxiedBy: YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::45) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from windriver.com (128.224.252.2) by
 YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 12:48:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4741360d-aa4b-44d4-e0c7-08d942d7d803
X-MS-TrafficTypeDiagnostic: DM5PR11MB0009:
X-Microsoft-Antispam-PRVS: <DM5PR11MB0009081CAE541479A4489EC383189@DM5PR11MB0009.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXpTzpvREKbqMP+3rvWwNojtwnyLG+EGHXmtD1z6r2HQtwayB/oIaWQrpa4RvYBqToQ+3vky1Ep+J4FDhNb6lLixyaxJgWeJUuslAW6aS51q8VR80q0ZXnFzfOzx+YY7+14nCBY4kzPvIiMje7CBjtgNDv5/2uM47ENuvaQIjzy3u/hNM2cHz2PmMVg6RBCzEHTmjhZJanTnBzTGSarIp7MqfggX1QKRr+W6WQJYRY9v8V0JWY3jFjh57hUDNWyv81bXKDMrKqVIfZFpLdD4Yz/pttp6scDNHC6M+0oyDQo7JHdwBJUp0/8nlW8g6jDAWnTxxl07jvHdEzRuHmgdUwuLwSYHldH4i+5BpynNenCjNSYlN8LJk0LFRjNrjQdJ+mRXRjzifrcSlSlYd/GZd/Jw+KZvu2ZHWBgeQFc113IHUtvSgcbi6fqALbme/SBnMUec6eZQGEA0OzYOJRCvR1PSIc4G9eMtRs+VntlsBvPUolEmp6VINbxdRBBAC3qhoN5hKP2De3PO505rNp3zYiAwcU2OcGE/Mt8wmkbV9pmieMQMbVvtENUhYWaOrpqY2HYIkS4VoZdO772hbMK/hsxb+ohZxRH+outwObvnazu5Tf0nyj+esKjGNiDh2TjfSAM0FM7DBJixwXIUlOb/1A9St0KdLQ2ebT+A65QvHQRY4K/kgzeR8S5Gn+/FnmS/6cgGKA2aNfJU++X9TvTuJYAFtb4eGv3oYVI9xPcOfK0IN0ZKCMw2600OUobiCDBmicq3McrXijkgUpGNl8+jDAzaq2XZ8oF/fcUmpelG1VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(54906003)(7696005)(33656002)(36756003)(2906002)(2616005)(316002)(38350700002)(55016002)(5660300002)(38100700002)(86362001)(8936002)(6916009)(956004)(83380400001)(8676002)(52116002)(66556008)(1076003)(6666004)(66946007)(478600001)(44832011)(26005)(4326008)(186003)(966005)(66476007)(8886007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJftRnbGAO4eEG3JtNKGCmtV1Nau8u4fpzTxpEkVF/1KoLPqtUpsdXPHvuI+?=
 =?us-ascii?Q?i0HvgTrhgsjEN7+8Udq3ZPVVWDBEBj043YBAz36He3+TYx7bkLwL3GrgE4pe?=
 =?us-ascii?Q?/yPotf0j4VM0hq51PoTeXrSmzl3sX8x+Wh4JWVuKrsK1J4yt8zXn5jf6pcb1?=
 =?us-ascii?Q?SRkfPXcMoBkwFY/EQPT0l4UujTgq/JSGatvVc2U2ErveDKbOPp7+Vnyr5Xkl?=
 =?us-ascii?Q?1Y4TDYPL03a8VVtDMHFWnt/LmDtH/MRdEsIvmanX/QAEk8Eh3MUGsyaYPEL5?=
 =?us-ascii?Q?oaJXjgaSQBN+dQyuIn/hlREcmfq94ShDj23g1ZFDQ/BHY69FYsz3UQ/AeE8U?=
 =?us-ascii?Q?PRjpr24RzhuEWj4jM7jg3jOV5RzRIlef+0/jg3R92IjJB4gqsm3Ijmoj1Jwn?=
 =?us-ascii?Q?KOIPP2fOv/aaQue3PmDd0M37+MQIU2zMHiE4Q+8S+lQIhqhChDFDGO01rIWd?=
 =?us-ascii?Q?I2HBgx37fqf+CqqVpIFj4cxKTyAzRBCPGPYxgpqdinNcKpOKTBNcX0Auz5dM?=
 =?us-ascii?Q?8yOAybotOJztYF1ViBiGSA9jo4FdwKJ7LocH9x6l5M23g3DVxWzjHfwVXbRy?=
 =?us-ascii?Q?eEIxbR9B4aNxGpExOUA2D+Rai1SeKgxBxtZmSKyVXRJLlayYDIZ3UyMdAu1h?=
 =?us-ascii?Q?QVb7yhZ8VQzMUZZTW0X1jLjpIx4Pdlt5pJ1oRtBBeJnraSMd7mdQCI5BIHCQ?=
 =?us-ascii?Q?LpmIfRdIW1UNs8FI7z3RKB9GDOjf1dsGhP36J3Q8gkKqpo4MAGahX0p1oV9r?=
 =?us-ascii?Q?9D/BmV/zosP6cigR5o3coMOESd1Qoy/K4CgnLkq/5znAlFqZjbgL1e+n7jYE?=
 =?us-ascii?Q?kc/dCQvCQfP8SSnYQ4IN/lIT8wbdNhmm7r+W0A00Jmsuz7wLJy/smQZaxSGD?=
 =?us-ascii?Q?Qm+YHpMEGmSocDpEwDD+ihUaZ/T3hyFBcwMc0m1hNhZFvy/J+2OfeUqYmr6r?=
 =?us-ascii?Q?sZa5WTGfyQpCOG/KZYE300xkD2TTfLjcd91j5PYdX+mx5ZraFiTr42CwvqX7?=
 =?us-ascii?Q?52ftiCr4xGBWWDHAFXsD8VylmtLujC2zckHt26swa+f2wT5HGB2sAKXneQQv?=
 =?us-ascii?Q?b9MSlLqg5+qC5DrYDUAa4XjuVoSxWT8BKF0+nSc3e5eQtjb3ArIyKmi8nQmJ?=
 =?us-ascii?Q?CvUEqrEwnOb8L+9UgfwqwRDa2ZptDMYJe0UpPFiVcCG70oPoXCWd27iwoBAW?=
 =?us-ascii?Q?dDI/paSeIRmxZ+La4it9V7FasR5kP0BjlQBzfTtsiW9mFfz9Zno0AxaGk1Kr?=
 =?us-ascii?Q?lj4tTvYBqfCfSknVfldsMC2nph9m+NGw/VFLTd1cxjRLVt3uRPCaUWFbt+r0?=
 =?us-ascii?Q?qxe4O/7k5X8eLNb/mhOFD+RL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4741360d-aa4b-44d4-e0c7-08d942d7d803
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:48:26.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh51oI2ogsYT372WUn3KJLB6vdEIsaLVGbT6uWe+IRcTBK3fhnFqL7Pl0qNxnxZiYUcXHam6PpgY0NScdRAsHgHtl30qgU4O3/D7HhqKw2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0009
X-Proofpoint-GUID: GUFdB3WQSDMy6ZvlEmt7EeGXEnO1eIAp
X-Proofpoint-ORIG-GUID: GUFdB3WQSDMy6ZvlEmt7EeGXEnO1eIAp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=892 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107090064
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[[PATCH 0/3] Retire remaining WindRiver embedded SBC BSPs] On 11/01/2021 (Mon 03:28) Paul Gortmaker wrote:

> In v2.6.27 (2008, 917f0af9e5a9) the sbc8260 support was implicitly
> retired by not being carried forward through the ppc --> powerpc
> device tree transition.
> 
> Then, in v3.6 (2012, b048b4e17cbb) we retired the support for the
> sbc8560 boards.
> 
> Next, in v4.18 (2017, 3bc6cf5a86e5) we retired the support for the
> 2006 vintage sbc834x boards.
> 
> The sbc8548 and sbc8641d boards were maybe 1-2 years newer than the
> sbc834x boards, but it is also 3+ years later, so it makes sense to
> now retire them as well - which is what is done here.

Any chance we can ensure this gets queued for v5.15 once the merge
window closes?   I don't like to nag, but it has been six months, and
even the U-boot guys have since removed these old platforms.

https://lists.denx.de/pipermail/u-boot/2021-July/454081.html
https://lists.denx.de/pipermail/u-boot/2021-July/454089.html

Thanks,
Paul.
--

> 
> These two remaining WR boards were based on the Freescale MPC8548-CDS
> and the MPC8641D-HPCN reference board implementations.  Having had the
> chance to use these and many other Fsl ref boards, I know this:  The
> Freescale reference boards were typically produced in limited quantity
> and primarily available to BSP developers and hardware designers, and
> not likely to have found a 2nd life with hobbyists and/or collectors.
> 
> It was good to have that BSP code subjected to mainline review and
> hence also widely available back in the day. But given the above, we
> should probably also be giving serious consideration to retiring
> additional similar age/type reference board platforms as well.
> 
> I've always felt it is important for us to be proactive in retiring
> old code, since it has a genuine non-zero carrying cost, as described
> in the 930d52c012b8 merge log.  But for the here and now, we just
> clean up the remaining BSP code that I had added for SBC platforms.
> 
> Paul.
> -- 
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Scott Wood <oss@buserror.net>
> 
> The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:
> 
>   Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git wr_sbc-delete
> 
> for you to fetch changes up to 1dfb28199572e3f6517cada41f6a150551749da1:
> 
>   MAINTAINERS: update for Paul Gortmaker (2021-01-11 00:06:01 -0500)
> 
> ----------------------------------------------------------------
> Paul Gortmaker (3):
>       powerpc: retire sbc8548 board support
>       powerpc: retire sbc8641d board support
>       MAINTAINERS: update for Paul Gortmaker
> 
>  MAINTAINERS                                 |   1 -
>  arch/powerpc/boot/Makefile                  |   1 -
>  arch/powerpc/boot/dts/fsl/sbc8641d.dts      | 176 -----------------
>  arch/powerpc/boot/dts/sbc8548-altflash.dts  | 111 -----------
>  arch/powerpc/boot/dts/sbc8548-post.dtsi     | 289 ----------------------------
>  arch/powerpc/boot/dts/sbc8548-pre.dtsi      |  48 -----
>  arch/powerpc/boot/dts/sbc8548.dts           | 106 ----------
>  arch/powerpc/boot/wrapper                   |   2 +-
>  arch/powerpc/configs/85xx/sbc8548_defconfig |  50 -----
>  arch/powerpc/configs/mpc85xx_base.config    |   1 -
>  arch/powerpc/configs/mpc86xx_base.config    |   1 -
>  arch/powerpc/configs/ppc6xx_defconfig       |   1 -
>  arch/powerpc/platforms/85xx/Kconfig         |   6 -
>  arch/powerpc/platforms/85xx/Makefile        |   1 -
>  arch/powerpc/platforms/85xx/sbc8548.c       | 134 -------------
>  arch/powerpc/platforms/86xx/Kconfig         |   8 +-
>  arch/powerpc/platforms/86xx/Makefile        |   1 -
>  arch/powerpc/platforms/86xx/sbc8641d.c      |  87 ---------
>  18 files changed, 2 insertions(+), 1022 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
>  delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
>  delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c
>  delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c
