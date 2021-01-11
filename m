Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 241082F0E2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 09:31:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDn3X4yR6zDqVx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 19:31:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=40.107.220.48;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=windriversystems.onmicrosoft.com
 header.i=@windriversystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-windriversystems-onmicrosoft-com header.b=dNpLR6Xj; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDn156V6XzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 19:28:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFWWlyW23lTVdhIvsfOiUOcq1RwCCFpIfl0ntXNRBneR/PVf8vCljFQdH48F5JiIC010X70OpY6GZNKDValW+qzbkgudk25V3XTI0pffLMAtbNmG7ciyS6++61kST7A8B+5YfPCGEfeo4Y6GOdpV65SJEqlRvamiyuJYrDMPh+5FJdPqnVtPD8CBZTUD9qgycRnZWAxQhPZHACxFNTGaHSQsMe34dq0Q0acVtT5DiTZkD33QFGldm+GDG2t/yDLkr7bojlcKUdqA2ly1TqxnTD4QhtxCqPgaYnV0ZyYLXqBh/ZotVkBfq5xdHnEV52kyagpONvNwSNmnq00rBSbiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4lKGdK+lHy6HBkhXMfESlpwT1Uc6c6Kg8+QyVjsMPE=;
 b=V+38VFjf2T6O6JXXr6FKvO+5YpoWqnmm2nGE29kLk2yW4Ibqndgjs0nfsyNlhI2kTSLsOvSdTmQAF9d8cGnfEjqDnWkRZeHo0KS2HCIXAj5EJFosJyYgzl26yhD6GPWxztWc68rV2Ww+lkJ/3EhjLU8SZ81/G7HUQ/RFSVXNPpCuiqiUQ3Wz9rgb4edW/WPGiXCgJfiX9J4zf16BHAQZS9muJqeU0a7/fgc7Mq/qYDMZdl9a9+F4MyBtMKkRfBPRRxsTkt0mSpC2kG9/yIm+iug+OCcQXYUhyC2aikzSm2kCrWw9/W+01G1SvC/zW1pRs2MlqUOSNEy5Wf+lbfUJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4lKGdK+lHy6HBkhXMfESlpwT1Uc6c6Kg8+QyVjsMPE=;
 b=dNpLR6XjvumQLyI2VPT0RaNmscnxpf1CsWyIcR/jodUI3v4DsuP1O4k4Nzcf1fngCmoXJfS8xADiJr5doo2woc8hpPuA217Jsv+ODjDMLdAIdLlwvkQMWEk/muMdQKzrl86xgoty6VV/oTWtZYKpye6nFVWVC116idQBWR65bhE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 08:28:49 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 08:28:49 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] Retire remaining WindRiver embedded SBC BSPs
Date: Mon, 11 Jan 2021 03:28:20 -0500
Message-Id: <20210111082823.99562-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-pgortmak-lx2.corp.ad.wrs.com (128.224.252.2) by
 YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 08:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 694b73e1-dbb0-4bde-809b-08d8b60aebed
X-MS-TrafficTypeDiagnostic: DM6PR11MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB474055CD31F0523524B672B983AB0@DM6PR11MB4740.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5cZRuCjtvdJzbNr32eAVvq9zzq7YFepPu81uop8qQyN23A2MT95dAv1xKo9VA+QoKh+nDs1m7EBYWFO9yFYPcmbswLoQs+/65UQEQ46cWg3Zi3uXPTfcsRPL/p/9SwRUnEQJITUWFp2PMYK/KRzcnnMNS3dCB2tk/fn6zCUH4HEoZS46RdPyonXHZ/yphARC/324h5u+ZYAWRS356RIvSgtIIfF9w5XVG4XpFHtRmPDv+m01Xq3hNup8ziGIkSx7xvQfSzzOxLrVxoWCPcZsfbKb7LLwB6ZcrL36qn2jpXKrxekpupyP2pSRlpq8tN5Kf9yXBqX4V287/yZth3sypRp3b7btxm2QdLJi/cDZwQnpg/jfKd5X3BQC0KQNGHJfzD29FcYWhbU3nkfLah0+Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(366004)(396003)(136003)(26005)(186003)(54906003)(2616005)(6506007)(16526019)(6916009)(44832011)(86362001)(956004)(478600001)(83380400001)(6512007)(36756003)(6486002)(66476007)(66556008)(1076003)(4326008)(5660300002)(8936002)(52116002)(66946007)(8676002)(2906002)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lgcKA28ha77ihQgwUI/qxMgDcBvocnRmZVbqXSjYOnZecIJ70vjge/3cDZ6h?=
 =?us-ascii?Q?gLqLz5T7/pyfWxzLcoBsN1CGrou4+y7gsgFBIx+KVL4O2XFF/lpqm0TO4/xz?=
 =?us-ascii?Q?Q+2CBrtuBDlfnUBexlAyQnuCkVQTobIQbWU/hz0VfKoMJs85xRHJuXcVvbEf?=
 =?us-ascii?Q?IlkA+jJtbDH4HOxoqRZmDbsV7ImLDQ6YzStl2zVJJAAev0ZgEx29iAkgDs4P?=
 =?us-ascii?Q?cSZWdA1A00l52Ahwvt8MU3xqq6MlYwG0+MU4nNKrhOZeETHsC+fDBpnKk9OL?=
 =?us-ascii?Q?YPO/5jB5We6zSnGcExf8GX8VxjGtVzFxs2kinkKUdbnDB6gFfFi7CjLa9LCA?=
 =?us-ascii?Q?Ok3T/+yuNaVSMZEEGy5viKb/ZEN779dPRHGwmMNU32DErBiLShgROuIjZ53+?=
 =?us-ascii?Q?L7B953d+G0lhibb1ww9G36GORGwXrAPLJxPHEnCvX2FwWUv5SXrSu8/CbyfF?=
 =?us-ascii?Q?i1ie8k1M/+yyL0es1V1qG5awAoSsyVVuHvNeR8GpD2VtZ3ZxgyIcV3rxj64o?=
 =?us-ascii?Q?rZHOUmdGPduVD2LfNhJsnLZwknQ6q7+QqlEhy5bA46CSiNV1S/Hz1aIsJAmz?=
 =?us-ascii?Q?Jn8vat4RcbhZRMOyaiWfWanVsA9l3SVZ977bYN7WmkCE62AVVTews3+EprdC?=
 =?us-ascii?Q?oLZXZ3RIhFhizJIQz2PHKfKoM8gbmto0mJRgAD8ilvxMkTHRalWjELw6rkJj?=
 =?us-ascii?Q?D4tkDe5O7ToMLP+LCCGSySf+ijohycOxJJEmzMxvd5R9DHcmOJ20d1Unr+0u?=
 =?us-ascii?Q?dLrhMXMc9ZH4hI+MF3zoRY5Ve3LDYLKBmFT6O3zRXC6VM8Q3YBpD1PBASVmI?=
 =?us-ascii?Q?lEJK3w5C34BgcCWbBzewsiXVPk/+plLL9Co/stnt2t6h1yj8By/J0K4VvIGx?=
 =?us-ascii?Q?KQYToAKfU4BDPAsodiHwrVhvZBvgviA8C5XvZ3rhCQyOjstDHuB0QYrq516N?=
 =?us-ascii?Q?OAsNUHTzQRQ31DXUArJw1c+xDZZfy/X5OEOLiHpkDWZ6WymZlXJaB4ijwpRy?=
 =?us-ascii?Q?opyL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 08:28:49.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 694b73e1-dbb0-4bde-809b-08d8b60aebed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfUJslox3CJdlbjw/Mpph4MT/iKbZ5jwnkQB2XuNB+nmJzWDRUcrT6PtB9Drhi3LWrWC7qZMZYGed7IjgUbsC9IYWWCHnbFVCvhfP7SM630=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Paul.
-- 

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Scott Wood <oss@buserror.net>

The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git wr_sbc-delete

for you to fetch changes up to 1dfb28199572e3f6517cada41f6a150551749da1:

  MAINTAINERS: update for Paul Gortmaker (2021-01-11 00:06:01 -0500)

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
