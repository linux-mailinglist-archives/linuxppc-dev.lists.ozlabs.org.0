Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8472D038
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:10:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=U/VOCbw/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=irha6PS7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2q53DhSz3cGD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=U/VOCbw/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=irha6PS7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0wB148Hz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:44:25 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNr8j031979;
	Mon, 12 Jun 2023 17:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=cmUYvwwgn+Sxx2Sblcva4l+0Kv0al32F4azmXdcANOk=;
 b=U/VOCbw/Oit5S/Dk21zCzZIqTRTikXy4N8YYw9uwC/vEOf43ktPbPGrDH3ATu5UQzUpB
 eXfeVHxg8YZYupTPnuS6ES0huQNcmog9ixXEd+QBkMlTQJ9VegeTOssyeqM9i+QJZTRp
 XV8UnGiix4qS839iyKLXRuTQztDqa0cpT8DOlztC/8XKF9EkvX49mugsTbYeoWWlPA4M
 bOwSnrDNff9RIVFAv/V70tTkADneojG9kUuyTknrt8IjT0qLRPnP2GQw3FgAqgRS2OXE
 900l8WEGC7EhsxoJE5mUH6StUsG4B88M7yp2s05xTHrluj/bcyraHdclq0NsVu3Yd40U +g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h7d3fda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:43 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4Ml5016344;
	Mon, 12 Jun 2023 17:28:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN9SyZfg+zaVpTtVXyI4quS+FODw8B5xc99J861eavrPxWPkSfQWZpHOedtQ3RvOcQ6xTRGFffhG+HYQQpBeIo7tAFkggeGPVb+iSrJRAPudXPhsUWi900TnEybfDOT9KuAKSHOYBZA2YXI5jqM8BQuJgWBF1spnMD8rxd2+oE0MsWpIep+xhnigfFL0Bw6v18Nz8IRYSg+k26eT24zYm2PXLH77pYVADg92NAd8/J10hVacdgw0upzL8olvF7wmvbmnpJegOZrAZdQCP9N0e30Q7oXkxIOwZc+5nULX2g11rHqGB7E+qkO+STowPrFnn9R+Nu60XKICSAE7Sh2p4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmUYvwwgn+Sxx2Sblcva4l+0Kv0al32F4azmXdcANOk=;
 b=V3+YrV/Ykp1UsIwVvigM78ZUOxNSCPT4eg48qPJRCyBQpA/BtcHqRNce/G4GLFjIq7KG8X2MwZARBnzDxGuZFbz11IljzweAU9Rrsf0kuqBVvR2VfxOK8KBc9KUGsUYttpEzwpSd0LU4KqHcrwuVLl/wxnOmTbOJREIilqaQsv7GJY/yE6pw72sUjbFMgVV9X74Pe8bQkORsXq6iYXcQt2yuATwMjQwxYIcyrI1KkOAI4hqoFP6BaxctcxOfd0kv19MQ/bQBLqb94cxE8h7NCKiIX3G5CqTG2UUnkOuSIatJvQwcNJjRlSI5+zBDqB+LQMMRPoxHy2MVGV3oDziiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmUYvwwgn+Sxx2Sblcva4l+0Kv0al32F4azmXdcANOk=;
 b=irha6PS7IDdbhvzynabObVzS2+in31OkR4YWcX2uBY+3eZAeLVhIkQqo7vJj4mBh6XIBoY4I4Eh291Wl2bASv0uo5MTCsXy6WUH/+OjmsynAo6K/HUgse5h/ivqtg1pv8950+Z0hkmCau7Gd2YS25IdAnMASNkpFg0VcaJk4jEc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:37 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:37 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 08/21] mips/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:00 -0400
Message-Id: <20230612172805.681179-9-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5e7fea-18e0-44ef-35a6-08db6b6a745b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ei6R6Y/dnQufdn/+Mg31UQkc5z8jdBxEgNKeAvJYWg74HywXLGcG6qEmQ24Z4rNnSaq4ff0Dy+rb9m68QKZhmfC1SKAnlCn9PPkRv4yb6WEhySUj2Q0K/6dYoZUyMK5TrnkPPMFzCPCNgLpcdvMZKvNnJJtpGw0DhPlQGq+c1jD5jsSpefltsTvJaliq5yq5mbXeCrDUqz6WrbQXpNV3PNnTHJg5AccLmoc3QGY+bHyVdueoTCwkmrAtc0LysP2YZjhYMlpgH6Seo6e4FxwxUT2hr0iS8dhldVSQDKQXf5vZA5aEADi3W9XA9B8DIQwl7tLcUbH6Z1qy2q9THWBtl6mJKTj8JtFaOdlwRUTJ91FhRPuKxCN5KruN0JZxlMpOxVR4xX4rMYbL09y0JXC5+aNPvCVS9u/U4WY3b5B3e3wpBt9lhWsmxbdSMuPu2QK5HAX2xaogWIQFMsUM0O7Zfs39pBLg5fAuzzkKZ7HSJBYEX02Dkp+JuXeAnhgszQ2xf3dzJ0AkapZmNtqh48UgEn8VYM0P2xWwIHMFzyvzmMVgCGmzUNEE6tHQ52QupQb2rpIEmAiCfZPPeYt/qH3k+IF6lUnhPF6sl0McvsGtV3M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?niDq+ijkFsa8H2QWWyWniRGEtxdPIDJnGB92Un7cvlbgr62FPvpeu+ALZSIe?=
 =?us-ascii?Q?cYLNNhCsk0fZVs3ZI1Ds0A5OgjGhJ2o9cxmrVk4Q+BsqM0pDtoMIDq0u2Pta?=
 =?us-ascii?Q?ear1eJ+8GD7CkTEmTbmSu8T8oAAdvBitnNVhl93o/qO0tbwAUGSpRmjkucMp?=
 =?us-ascii?Q?P4qgUgWxXeDMJhGw4CKyPBmQpVqMfuKYjp5xQY6KJjXuKZSx0qBe4Us7shZg?=
 =?us-ascii?Q?Qkq+eKpkFULUn17fNmdcJGBVmayjGsZfZ4A01NhjHw94YZTtXCcOOxnEjT3B?=
 =?us-ascii?Q?W4dbvTgemLwH5u2OlSduG1fF70YqpYfNjp2tEhh307UVArn71dvE3qAvMRtA?=
 =?us-ascii?Q?mfsN9yoJcZSyYHwG4R7s9DjY+JizdmeiqMK2MLaSgDvWxr9C5CIYelh9Z3TV?=
 =?us-ascii?Q?RQOIpxl5HvyXn+uZYbJbkCp5BTwozOTWzZLUikWd3MIWqJ2Exp2SNqsj2qKJ?=
 =?us-ascii?Q?MMzVtHOl3JZMuDFkIjOTMRJb8panj4yGJx/JBiIE3c1svtXocBMh3aT7VEhM?=
 =?us-ascii?Q?ICb/rEbQaBo9qyrRe1ziPP2dDVHgFQtln2QgbblRe4ALwZ9G15yMXokvzewK?=
 =?us-ascii?Q?BVv1s8JqxqA3kELq38deFAyYFtB5YPd1uyndXa9VaO8W8Uzj5Kt2IniJgMPH?=
 =?us-ascii?Q?aWtx5VaLsZA2Ava09/cC5hATnyYdkLUzL4kJV9xLouJnNrg+CLyjKUH0Uxei?=
 =?us-ascii?Q?6ZuYjRMoiF/kEoAS+GxZtqPmE2J4oT4sk0lFNgW+P1ozGOzQUtGqDuslp6bg?=
 =?us-ascii?Q?SgDLIVD5JugiRI2KL2HD4Fk6IIea5TLJMdhHq23sNRSV2jIOiUbLesQ7/okN?=
 =?us-ascii?Q?u618SKS0YMqWol5tZOQPvCq4Cb6TJb9VSqyAOYnMIaTnQMZcIZKe4JvJzNQm?=
 =?us-ascii?Q?TGl2MhpRfC6tEyxlgRWjuheLG+X2ivJxZudzDGRAF/tKghjv+ype0Q5L++JU?=
 =?us-ascii?Q?zVhiscenbKOZ0pRcp4z3PoGP9yKPl7BC8bhgLSoNzxgXdgKBx6GXmHvAkX2c?=
 =?us-ascii?Q?xovku9TWByncWHh32aNj3TklOyXVCov2HG7H6KE4td4Y/jc24wjCe2XDmyhh?=
 =?us-ascii?Q?Vr2BuInOXnz9NArx3ET/+cVSirT915PoM7ZA+WcSD0zF3sGbT7qmLLTA3Iml?=
 =?us-ascii?Q?hXHMWGuX/r+5OusxwK3ClwIoCKTD0eblNSptsRpCNpYdMr9uqWtDormpxGML?=
 =?us-ascii?Q?+RwhSOX22TtbGZZxNz+Dvc8BHME1kJlrZmNT3XXvdODAp1yQBzKEws7Kcrfd?=
 =?us-ascii?Q?Ki8L5T/92qgTEXFcGXtV6ZYV1yW7UHbULq8LtV9TweYjVjrTcNlGzWNbZUrc?=
 =?us-ascii?Q?c4BTrrO461smj6wf2GoX9JDGgsAEqDqD73KOMGMevpeqL0jqKHXM0e+f/e+W?=
 =?us-ascii?Q?nfqe//S+g8w0TRokp/x7m5wnmFdEbkBbLjKhfBGg+PCWHkdjR/eM9lMKDXqm?=
 =?us-ascii?Q?GVfawDqFYzjYTCo/sw5ddnvMuJCNbNSeLe5bbIxNpcg9e1gTF4KvZerRofsI?=
 =?us-ascii?Q?2doT79T0gNSysioo/GCu2f33OfaEYMbT/9XUnvN9FkeYt554DwVFnI3fob78?=
 =?us-ascii?Q?/B/SlPD+AuUesrWRv3g2BhDSWNK+jZU9NsW2WqDc/vNn7R5uVvzQfvqNTne2?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?hmXnDx6mHPrf8TATLy6QpWk7RWNkz3R89Ntf4RxKXXG3S2LboBnTnPjROTQw?=
 =?us-ascii?Q?RGrq0WqjODRrWPO2VQdRFAKM9o2hktFcdM4z2WxMuDWdhYm46tn5s3PotL/j?=
 =?us-ascii?Q?RGeH5CSf+6zpirh5jr0GFKy41G/8uc1ocghYY8bAQupgF7FLuJGu9IDpXpJN?=
 =?us-ascii?Q?KwZ1K6UErJHhCtGwEI98/6D9O2HmRdsp2RUpzqfsgH4DTww1vVAthCLm93UH?=
 =?us-ascii?Q?S5Rf2DGUUCnEZt3JOLcOlPBSAbK5WMgRDKhPQylCltDIYpK/P7V9TIT/pwYJ?=
 =?us-ascii?Q?xMf0yX+rlu9/BwSk4yR31UxG7kOWAZesmO6lDk/cV6uQdo+jiIUVk+fsa+lh?=
 =?us-ascii?Q?9sPHv0YW1ecW05N7WkNptCwuBydkzZXx2FLX96RmXHheWWO65pr7O63H4gqf?=
 =?us-ascii?Q?ysl2TAQ2wYww+6+QuNrZo2i9yefmYieqmeldk8QdI5SR7xQ90uci9kbDz+kV?=
 =?us-ascii?Q?CtTFdTMuaIYWybkw+8RzVO+gFUO43lJnNp6Qor5rMgpgGiG6Ul9HL1qynDkv?=
 =?us-ascii?Q?5IgmBsw/ile2f4b7Qks/SdW4vX+WPbt5+bzkx5SH4AfRbcZHfSwqM8yuNnsg?=
 =?us-ascii?Q?Ebqj0olBTNc+xxGTb5grzeklsUj31ZFOgxTCRIeHux359z/NnG156VgECQZq?=
 =?us-ascii?Q?csUYjeoMtFgBeRlt/pFgTWgph6ccJxNSEPj7K7mCoy8VSqOpjnuiMymHyQyc?=
 =?us-ascii?Q?DWNNdB46HpvQuLGF9WwTECdaihDtKMqUddXoikkAx7BAwakTsMOG2AqdIer2?=
 =?us-ascii?Q?6hrL6FMVycn0TfDNpWrVOcweO0BK5gJHuqv53CW8qKgoNzI4kxD7uatXSuoX?=
 =?us-ascii?Q?RHeNHDwL0W5H4JhiNL/haEIpSnNrUxaVo+9lsBOQppb0muuAiAyeQrTDnJBY?=
 =?us-ascii?Q?YPDUSLtzOybZjTUmF4nAY5d6vVOiMATEKYPaKGm7dWyW9YFVu374VCOqzP29?=
 =?us-ascii?Q?eoq+Cw6v9avfa+p9vm3vRTLMq0ysrxRDNQ0ICJv7Tj8p5f+DCaaEGef+vhgB?=
 =?us-ascii?Q?OPbtU0+Sv8m5nh6ukBQfYLfNb5FdHlo5mealwDEUBdwbX9fKcRG0GN2VlwXF?=
 =?us-ascii?Q?vuh/6JL5jftG5BAjWxnYMOL2cNF2O+GUscFU9RfXcPcS6k4uwlVfgcQ0WoxS?=
 =?us-ascii?Q?ofm4ZPqga8GF+1g/noAU8af+Ox6kco3AfAidsA+poO99tZzzd49m8iDSPYOa?=
 =?us-ascii?Q?RzXTZjdwSXPbKJNdTiht3lL75kAaKFRGaPRdspu19cPazWC/OExW+xpHiNrt?=
 =?us-ascii?Q?xqRyoBRm0RbGTOO2HwWFGQE7tFb16r5VINNpj++b/bNaEJKzuLjQ3vShCsd6?=
 =?us-ascii?Q?ZMp3DfZ5NDDaeh94Owk2feLFjV6CwRMruDYgr4gsNa8FR8hCjTCiuV3DLzh0?=
 =?us-ascii?Q?WVUfcFmpwrD+mA4Wr6unsQHQu3vyur5wpk9iNzJl2GOUtD6iFMBxuh540af2?=
 =?us-ascii?Q?C4YptTgLF06S6o8T9UGHc7wppLWy6e9dhw9Og+yPSIVIYvhRUeYMGs0mWPv0?=
 =?us-ascii?Q?yZ4SL12pzJ5HqOPdCaBBNhf65noi6UoMEg1m+bE2+8aGBJgR11Nm+Q+A5+bf?=
 =?us-ascii?Q?3j0YziE4b4xY4C1rFVebeiXq5WJrjoCA4IGXKIfgoRvHNqQI5w7eDGTIy54Y?=
 =?us-ascii?Q?DaR8745PS5GOXWTll9Y4sUgUaGLqebI/I6Cv3UghrgKYWv/71yXnRYj73oZB?=
 =?us-ascii?Q?viY+href9kf2tNxDOxH2TQmvb6UyQcEUqRs3Y8SxdnikK25Rph+Le9xTiujB?=
 =?us-ascii?Q?8ENk/wk2hwfd4NBM5ycprtLHx5kNbwXp0+X4i2q830TkLD9lanDwWIBDwFzk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	6MZ90bKIbTcQbvvepPasGUWk5kcHLKb98WdLOoa1WKbqVsPRT3nfe8M7jc22ANcKRL+ntpiA2abAuGh/r3zyG4aQzm/IDDGWRWBETeE+Qmo1cY8xMNda3HvXPPEe1AzkbyVv4/PnSXoCBKRH5eHuA5DWhhqey7KqNbd3QRhqhLEf2aR7egHefQo3P4f0ljI0uORo08MoXiLi714g7PzLIYQ4fpiVhREw4kVyJnCs7wIgtmZT0tjfLyDUn8uqGsKd02r3U+2yMoQo5Gl66Qg6hnypNBV4jh5q0iO0I6CFXvgT2/BCYJbocrNtflsP+H3Ehza4anaUxyHQroYHvQLW4d+YbbZdfpOtZr0WXoc0ojsMr/3B+DYjCfQRUVjopE98WuX4VgMDnwaDUqosp1IITgduGLK53ClyXoPLJX6DTZhJP3ImnlFcngOkO/CY4Y0zBiMXe8V5fmEcgQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5e7fea-18e0-44ef-35a6-08db6b6a745b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:36.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVYSI01Xs907U151DnvW8BzHaeqHyVuIyyOlpo6a5qjdE/4xWEeDWmwq707rpGbphraSdvZrePU3Xthw3aakblB1SKMokvsJvQ23QRbmaoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: J6klGuuxF3i2I8AQyAqTX7dYbEgnxQJj
X-Proofpoint-GUID: J6klGuuxF3i2I8AQyAqTX7dYbEgnxQJj
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/mips/Kconfig | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 675a8660cb85..fcf4d8b0775e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2873,33 +2873,11 @@ config HZ
 config SCHED_HRTICK
 	def_bool HIGH_RES_TIMERS
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config CRASH_DUMP
-	bool "Kernel crash dumps"
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or firmware using
-	  PHYSICAL_START.
+config ARCH_HAS_KEXEC
+	def_bool y
+
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-- 
2.31.1

