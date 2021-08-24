Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D1C3F68A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 20:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvH5H5ds1z2yn7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 04:02:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=c7E4Bsl8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=3870d3f41e=paul.gortmaker@windriver.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=c7E4Bsl8; 
 dkim-atps=neutral
X-Greylist: delayed 1161 seconds by postgrey-1.36 at boromir;
 Wed, 25 Aug 2021 04:01:56 AEST
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvH4N6jtDz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 04:01:53 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17OCtoTV027931; 
 Tue, 24 Aug 2021 10:42:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=date : from : to :
 cc : subject : message-id : content-type : mime-version; s=PPS06212021;
 bh=NU5s4T4waGeZPf0L7BmciLPYF3Yvgcd3IKComxq6cvU=;
 b=c7E4Bsl8yPBdnbHWIgvh6pOfCIDaZmOA+DKsmsEVqpBD+SRqOAq196MLOS+5NR1K8x8v
 AWcU03D69Fj6ci6EKVqjbKORY1r8n6CBGAXWf6xmnccVr+sDHwx0zZtOFUso3LXNB1m2
 2foH8hW3+LLs3vyzi5WY7Z5ljVPPuzKT1vMOMXP9JZX83+SJL82Y22lCkLHJlNLxyQV4
 U4g5N48wOKUCf8MZAYzC/uHLSkmGCXrKkyMzcqR10mkAZnwg/iHxtUToUlwdC0d8fXHA
 VYgaTSgeyx2AaMS0Myy3/pJxv98rfPWgnHWyDwukBYk65nTxwsznVaQERhGvMlHSz5Jl /Q== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-0064b401.pphosted.com with ESMTP id 3amtg3gg8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Aug 2021 10:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDaDsAql6qeec6xRmYxoCwZCBYzlrRTYYh8aiaAoB6NqWO7VDtS/ggdaYGmuPNK3mUTjTRqhmH9Tl1HqvkjNJmvaso8DFitGFaGvA+1tyakU6hFvZwwgq/Q6yYn2jRxRM4O7y/tiA6qyCjSHu/KB4i0CMyhzedl92NaH962Piq91uZpxRSKOSIZ0Q0Sb/txSyk9gb61AmaYelov55DlI2eiRs4y565JFVL79GBD/c0AtUsTGReWMhMhwft7gwDM3jay+i1Bi0CLevk83mdTnxM4MWnxy01xPWwSMyMYZdxESLdU8ps1YLYNfWs/eul4Hju6mN7+3dxXqbI7XoVt6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU5s4T4waGeZPf0L7BmciLPYF3Yvgcd3IKComxq6cvU=;
 b=ajyMPwtF7YrDWDImFQ2W9tXG0jP6MFCzNW/kng1l6EJBMqlEoalBROsmADhaJNmQkmjk6cDCVZ9qaTrBZ7r6gALUENzVu3f4tVeVk6OnBWa/S7AMIcZMAjWZTBw4sMzG73qIqhGgW/LRPeyjC+w6+9Ave2ErINn3360efwBnnc0QqD2+GQuwz7+atw/U0rHzUazHXgtXRDU7UcskDuPF6idFi2o5kZKkLJP1lYMon4NSIjLZ0VSpsq0tM6/VyeqfaLWtewyGZTPImlPUTYBsnP6SQEheQnsnrtDHIXNcIPayC9joacbaWtZtf5/OggSCUzdPUolO46qkVfDJ5uJTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM5PR11MB1756.namprd11.prod.outlook.com (2603:10b6:3:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 17:42:14 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::6812:a5c2:8fcf:52d9]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::6812:a5c2:8fcf:52d9%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 17:42:14 +0000
Date: Tue, 24 Aug 2021 13:42:09 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [GIT PULL] retire legacy WR sbc8548 and sbc8641 platforms
Message-ID: <20210824174209.GB160508@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from windriver.com (128.224.252.2) by
 YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 17:42:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1bd37ad-f03f-492a-949d-08d96726825b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1756:
X-Microsoft-Antispam-PRVS: <DM5PR11MB175648FDDB9BD12E18D0E4CD83C59@DM5PR11MB1756.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qqrvb+B4CIlkOdUHqXr1ER42U6oXsDaVk+f9X4Ka29un02n8rD+QgT1iRQwMA4Xidbb85FgAc4lW2cnspnjIJIwTNb3V7Veo8F5ZkM/jzyK+dRjIpYtBFInYI0yB/6FIgpiXl2KIBJQ3CLWDkEkWtkdoO+pUW3nsTNx+rfwAsvD2a/b0YMWZkCYqxhPKTj13bGT4/ayPKeRlJ2Kka+yVUPJdfg0mWVU5/cthdFdSdx0itBt7wdhvle14f0X29DE7KFcaNbHfQnMUE6gIhR3D6j2Sq4cvzV6yaxI4ugcHxShKfICpIHjlz1dhs0+SaD4t+55ytxWPRCJ0K8C5YEUvSHe9syyl3Jt13px+EC83f8RlGgGvMzb1+PGTFYMZIk37F4rw9l7WNI1SSMecYF9/eQEK5o4Xh/zeH3gsmyWuuiWYv8Spw6qqIRLm9wsvtyh/ntF8ruQiPnHk/bY2bRbHBS4kWaMiKef9/c6YIMZaeiTWloKkQlLxIsrKMJsCXC2MJvUNR1gI2YjQpAwpBJeAs2dZNuIv0rgzdPb0XPKDxeuCNuFp1bY67VpjIUHVYzURJfI2R2w2ymQCCEBkEtm40aKEXAirYXxMJV4Ulcwd4Xp/kTxYrKGcpaVae2P86DXcPQtkhqRT0koMIaLTnCQkEMz+JBTYuLAoAFqn33ua+Sj50IJJN+V72gCqjJ+RrM4VohIDWQoTwXoBdmHMOXQDokR1Rzn0WiOe6G+V6Mw3zTHBljj73nAMawzvFcT5bfEZ+ZkCzABLlw17TNsOSc1OQbleMcdLsrNgvwtkuf8XgIQOBcbmkNTTFso4/i1gigLF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(26005)(966005)(5660300002)(7696005)(52116002)(186003)(86362001)(6666004)(956004)(2616005)(44832011)(2906002)(83380400001)(33656002)(55016002)(1076003)(54906003)(8886007)(478600001)(66556008)(38100700002)(66476007)(66946007)(38350700002)(6916009)(36756003)(4326008)(316002)(8676002)(8936002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3NZZqh8Re9I63f3z2x0hI43loUEV3NbMKaC/+UUvAYeUjaFF6wVG2gMFH8P?=
 =?us-ascii?Q?SAPb4lbLLvjjdj5djqOUzZlZmzcMxOgrf5ULfCGrFdlsMMKM4CTk02rzAN8P?=
 =?us-ascii?Q?TmYdiu8QiB+J0LYC3hyqJ71EACYeIG/7bT5hmOE/11zGZf3UwCz0B6QIcbqB?=
 =?us-ascii?Q?mTklUvzm3bJRSmbN3r/JhfaIvKCLhs9Oh1Bu/UQjoTu8jNv/x19fTyulutO2?=
 =?us-ascii?Q?429YAFqc49BvtKYmvSx0iGBjfMz7W4VRebN7H5fiJ/Mt7UwhWxMOmiPcAgLl?=
 =?us-ascii?Q?lZEpnj04nAj6pj+ii9iNAKHJCxxP2u+WnMfAIiwJV9ZNHM5saF2JdQ23Cwqg?=
 =?us-ascii?Q?YrqTSg89lTnc8BERbjDQAm7xa4rTmYpwZcc4kA1iib0snnTcoVUnL7g1QCJl?=
 =?us-ascii?Q?ph7J/4iCO1jZxDxp7FhbV5qoWrIE8+oac8YJ+BjWrISPNdU4fMGCcf9S9Skm?=
 =?us-ascii?Q?XRY5hsRDTTE4z8Dx3CsF8OmQBcZ6mexMypTUQWOI/vylI9nSvuWfbZFyI6KV?=
 =?us-ascii?Q?reNKFq7GWBZG34yDDL2l3P/gDE8cOcPmuBFp7yEckAQZRzwitWFw23AC5WSC?=
 =?us-ascii?Q?Kraq0J3sp5S4pXrD6ZqsQn2lWopZMXqqAc9PiF8IZbWA29iSBxY7zW7Ulm0N?=
 =?us-ascii?Q?6dLqo+dTK4rS9EEG5OmYElNQmQ0GEhSKFX9D7MItxvi6pi0ikYyOQq9EzyvO?=
 =?us-ascii?Q?hEoBsFnmHdLnXK62eiR7iwAm0MDNP1mcpuX4IH9MZpelKf0k8IDDcRr6pLCN?=
 =?us-ascii?Q?rUHe8UWE1qDLGYHlTpTvZCh8MpC0bDR0XMlXvqe0D5Y4Uw8zPAUqKqn+4q47?=
 =?us-ascii?Q?nHjfbseChuqq5h3+qnO0eRVh4g1T2xMJLvjsxnjAXrsedziscQ2pU5eYN6mZ?=
 =?us-ascii?Q?zUcF/WWBpxjacE1NUzD23R7MlPQSZM84DiXMnRL7sjQ9YIvU4n+FwJYDcRCy?=
 =?us-ascii?Q?/sr3+Ez9loiSO3aVSKF8jPVceexvBZccZa/vpu6qFMpnirD+trN7HY6+Iczu?=
 =?us-ascii?Q?CAzJH8hItrcZ1mVj5Ds93UuEfsZcCGKYk1EPIFOtStjtQ6UecGuos1XT8fU4?=
 =?us-ascii?Q?4UMugR0CjvsNTV+gTFjgqk+oVKlbb12Gv9yQJBtFMhb5EpugUkg9bn+62k+5?=
 =?us-ascii?Q?uG3XRu558MPN3qasfJIfIR35gzAkFg3VxKdY6VOiVVs5BrTF595gbGi8ChD/?=
 =?us-ascii?Q?G/l9vnGIjZdmrkSNntrj2oP6WYOMBBGPvR4ZmgvcWzkdioCk/7+9IS4mfmH5?=
 =?us-ascii?Q?M3QLG6+g7o3vQatg9aBY8ZwAYExlFV3FPB4WrgUWnlfPDTRVDoYRSMOZ24wi?=
 =?us-ascii?Q?Z7Db2Cs3Vc+9tx8UAXYRGkMV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bd37ad-f03f-492a-949d-08d96726825b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 17:42:14.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svVMgSKyoe+rfXX72wyy2h1EQlTVqV6di8VLuBwOQN1Wud7Bo2MVwBSNrZWON8LwpIO8Kt64GlaxiXV3ybhuxc427s01q10rYMoxpx0b4Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1756
X-Proofpoint-ORIG-GUID: 74HJMSOVhE3xZMizPaNk7eZYgpb-Zxdh
X-Proofpoint-GUID: 74HJMSOVhE3xZMizPaNk7eZYgpb-Zxdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-24_05,2021-08-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=548 clxscore=1011 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108240116
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

This is unchanged from the original wr_sbc-delete branch sent in January,
other than to add the Acks from Scott in July, and update the baseline.

Built with ppc64 defconfig and mpc85xx_cds_defconfig and mpc86xx_defconfig
just to make sure I didn't fat finger anything in the baseline update.

Original v1 text follows below, from:

https://lore.kernel.org/lkml/20210111082823.99562-1-paul.gortmaker@windriver.com

It would be nice to get this in and off our collective to-do list.

Thanks,
Paul.

  ---

In v2.6.27 (2008, 917f0af9e5a9) the sbc8260 support was implicitly
retired by not being carried forward through the ppc --> powerpc
device tree transition.

Then, in v3.6 (2012, b048b4e17cbb) we retired the support for the
sbc8560 boards.

Next, in v4.18 (2017, 3bc6cf5a86e5) we retired the support for the
2006 vintage sbc834x boards.

The sbc8548 and sbc8641d boards were maybe 1-2 years newer than the
sbc834x boards, but it is also 3+ years later, so it makes sense to
now retire them as well - which is what is done here.

These two remaining WR boards were based on the Freescale MPC8548-CDS
and the MPC8641D-HPCN reference board implementations.  Having had the
chance to use these and many other Fsl ref boards, I know this:  The
Freescale reference boards were typically produced in limited quantity
and primarily available to BSP developers and hardware designers, and
not likely to have found a 2nd life with hobbyists and/or collectors.

It was good to have that BSP code subjected to mainline review and
hence also widely available back in the day. But given the above, we
should probably also be giving serious consideration to retiring
additional similar age/type reference board platforms as well.

I've always felt it is important for us to be proactive in retiring
old code, since it has a genuine non-zero carrying cost, as described
in the 930d52c012b8 merge log.  But for the here and now, we just
clean up the remaining BSP code that I had added for SBC platforms.

--- 

The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:

  Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git wr_sbc-delete-v2

for you to fetch changes up to d44e2dc12ea2112e74cdd25090eeda2727ed09cc:

  MAINTAINERS: update for Paul Gortmaker (2021-08-24 08:19:01 -0400)

----------------------------------------------------------------
Paul Gortmaker (3):
      powerpc: retire sbc8548 board support
      powerpc: retire sbc8641d board support
      MAINTAINERS: update for Paul Gortmaker

 MAINTAINERS                                 |   1 -
 arch/powerpc/boot/Makefile                  |   1 -
 arch/powerpc/boot/dts/fsl/sbc8641d.dts      | 176 -----------------
 arch/powerpc/boot/dts/sbc8548-altflash.dts  | 111 -----------
 arch/powerpc/boot/dts/sbc8548-post.dtsi     | 289 ----------------------------
 arch/powerpc/boot/dts/sbc8548-pre.dtsi      |  48 -----
 arch/powerpc/boot/dts/sbc8548.dts           | 106 ----------
 arch/powerpc/boot/wrapper                   |   2 +-
 arch/powerpc/configs/85xx/sbc8548_defconfig |  50 -----
 arch/powerpc/configs/mpc85xx_base.config    |   1 -
 arch/powerpc/configs/mpc86xx_base.config    |   1 -
 arch/powerpc/configs/ppc6xx_defconfig       |   1 -
 arch/powerpc/platforms/85xx/Kconfig         |   6 -
 arch/powerpc/platforms/85xx/Makefile        |   1 -
 arch/powerpc/platforms/85xx/sbc8548.c       | 134 -------------
 arch/powerpc/platforms/86xx/Kconfig         |   8 +-
 arch/powerpc/platforms/86xx/Makefile        |   1 -
 arch/powerpc/platforms/86xx/sbc8641d.c      |  87 ---------
 18 files changed, 2 insertions(+), 1022 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
 delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c
 delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c
