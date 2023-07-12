Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF7751397
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JvhnF33r;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wMer49T9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XbH4tJVz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JvhnF33r;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wMer49T9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCp3gZGz3bvn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:38 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiE7w015836;
	Wed, 12 Jul 2023 16:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=JvhnF33rFZ8UFXuCLALFgYWqpduByCWDiU9z1oviN0sp8kzwvY56OXWPhQzCYhhs/2re
 CzmwAVtd6T6VdWF1TC11IDv1wj4V6M4q5m1X92mX3mDIKTcj2rKlJbb0iZvlThMDbvnA
 Lvr6osQZBgQ8KbV0PqPHrifGmi2ptuJGcHt5v5niqb+q4LbDHnTArOx9OeOdoYlrIx0J
 FfPWmeU3wSf03546a2vi30+zRyDAzocQZCGghh7Y9Sj/qt09mU9EtY3Wi1/vQUWtLhMR
 QgU/cWAt+CB0GQsWb6TfeVYpY6w7VEDbPbUHZF7gE8gbr866M5IdIr773i0DduqOep3q 8w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpyud7sxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:20 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CF0hcF004209;
	Wed, 12 Jul 2023 16:16:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx8d4ks9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciAMEpC3plp8P9Ts7Ym++sb4av1CgIvnjdXAgY7X8okHvidUIaYX87emLpfiheg/aOwaSR8uJWE0heOcq7gFG3d6HIzS4hWD4Y+WKYDH0XnUdwG9jBkGwhuY1UvNZCSuuhYzWgIqRDrnsnB6bIqoX8usoQ5kEM/yTQdN7SDYRUjcuaIv/u7g9wlaG1DDyfs10MecNhp06Qa4QwhNCUtiH96tLqCHt4ihEZPrL8uZZhjnSspYHc7BS93SyEOKMlBLFgdvtV3XJUhc03sEKsp2tBej4O0GtOe5dXM2wuX/LyZkv7RdvkfrU0gCey1/j74tT/W8Tie6d/1Q3glCZbMEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=kJ+u1oLiX7fWPmBZVPwLn80vx+io3FW7gLwhTDfEwUo5s0xVyzJaWzMN9j4EGoLaeEbA5ag7I6yvkku+viOPDQJ/JsukF7wgxboDGynyRdg6wehUiZVhnTHrSecmMtBGhSZTM0qte6zShry3QW6Iac/ns8scI9iZVNr0yUD1XqcXOrIV1bsDyYLBLr/gXlFdZZiLa/ED/yoDkGPNdvo5mnUnUksPNoGu7tRN1BGaAtlJ26ktyOpLvYUpqcCYP6OWup75ml8KxV+sR4094mSzxe6H2cH+K4E/cA8MOUJj2fcjuQrz64J64sy7nSChE5As4r6Y+PT+GCIOXkKUBwjuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=wMer49T9BBbyXsboV3EVLks0w5jv6M26A9rHoZnqn7+KsVpXUnECjXTbSyte8E8qJvon/mUjrLQXP8aae+cD8k/pi7FzLQngViZ/zSInJeXlyPyrIYiWHjSTMcyiWBzHji9qXP4hw3z1yXOT+kwwPzY3fhCJlRENYN/Dm3soxI4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:16 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v6 08/14] mips/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:39 -0400
Message-Id: <20230712161545.87870-9-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:5:190::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a1082e-78fc-4537-574c-08db82f351b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ieKnYATvrUvzBDoijVQKot67k+2kn7NTG4djkTVB7FOxGRYIPoVm7Y0ta0vhGljfJkV3IPMxj4yMc7HKjSv1sf+hU0kL8dzTlVjGUmsJpGWgI6fkZleyfTYlc5u+thC8qSIUo/brNYCwQ3cPL2X9O42IWXVDFLHXMjc63vJbmhbjFEpJir35+gbNSVvqAzFJUCLGToS9VhkzKFMo+RrKItw5iCzljOh+OnbZVtco41xILUPLOJCiYDoAHloIuGzQebt4BILB5ihn3bLNwI2Th1T+OR7MJFjDbp+JtnXf07eRXTuuwoHnli3fChkEDpIepZvOq8GBWUun6/1n8y27Gc1+GvKOuchvfCW/lPgKjFeaeEyqHjeQ/a4zPnRo18b5pc2jEP449He7P+YiCII7OZpennkueJBw9aU5+YVQSjVMtIodlM4/njnp6lBZz4Z6OCxWviYGuXGpg+YrR0RxQO/ntrxRXcOwqD+6S0pvqQF04iDEEZ39c4HQpmZXaj4K4I0SuzITxdFnyZDnpoM9VhguDtJIj9lB/hf690Xfl2p0Cs1t2S8Ko3ZQv+CCsubZaAyi2A2Uceqb6bmAGU/8AUdE4zBTixp+My8G1sYVkPg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WzuzCBrwb0MSYg3f/KqhNobpCYM1Sg2U9NQv1u+NZ5IsJ/RGCE/uBGc/fMWQ?=
 =?us-ascii?Q?VMCIu1Q7ISzI4CmIY6guWnrM7BTVd60WNqvNeeq3UFnlPk57eiwDHS5VOElo?=
 =?us-ascii?Q?YXjCBMF+apDcsqUEs2gXk6zm12/gE5eKWtGzPekmlzfVy+TJFdq3Sgw4/epW?=
 =?us-ascii?Q?vbhGeTn2wEHW76pMH9X4FRnES2WN97hS5+wdJgNq61KEokSN45/YwFr1m68w?=
 =?us-ascii?Q?hBwM3n8G57U4ZCsUhwVYQb1wZMwwVnQaeGuCZReyZNjZv47YhgXtM0Xm9WBT?=
 =?us-ascii?Q?pIazuGP/8pA2ZuZYuMAmMlVJeJ0+JDczNndX2EKtZ3pjU/EW8FZKmEmNzda3?=
 =?us-ascii?Q?BopNAqBPnzLxm3TQRddD64g3yKBsO9Z6u1MilNGyPOoIhk0pOGb2Cg2aF9pw?=
 =?us-ascii?Q?046IwQbC2fW3iZubHvYp8H6idGDjNVLxO8TUSYEzD9eBsbxGZy8FO053oskp?=
 =?us-ascii?Q?FynaljAhdsMYYIhC3oHidSPiQ2w/xtA+BGoAw+MNfhZy7vkogWzKIL+4R9eW?=
 =?us-ascii?Q?swKXHW6sWZrsBADTFd0FPDtE50vTH9ysmgfgtEtLybi1hsriNpJzWuxPSbBq?=
 =?us-ascii?Q?6crivyIlheeXWNjW6Fzglq5xcPT9qLeX6ItUZQany7GwscfDT1rgwYYQtmWq?=
 =?us-ascii?Q?Y/smYYc0K1gK53xMduKiyouQa7FAegzk3s76c1kwK/ABceLVFc0IE9WAKe+/?=
 =?us-ascii?Q?EezguMPMMxG/3OZ2dkJoddbDL7mhD1GlAMfTHw5r9ZiFANbgfqipjFgB/uFN?=
 =?us-ascii?Q?HPF/UXxwV1DM+DILjqgK2+9AdhfLQxmy60FSyVmbe3M0z+ki/WBgo1eeAiMV?=
 =?us-ascii?Q?5Q7mgznhTfgefkf/kmKNMyuy9NHKzebxiC0C3DEqrmFLuwxkcQN9mo5Qh4Lc?=
 =?us-ascii?Q?Vbuq7xie8U7EmJ9/tz1iN0UcUj25J/NTPTM/eBMwtXDkm/yOHaD682TrLK66?=
 =?us-ascii?Q?n91qojwl6bMXq3V86VGgamiUAXf+qP3o61+Bbw3yociykANQpYmcKHUCPrVI?=
 =?us-ascii?Q?iCM44lz+oOD6uEeCaRH3NL3qZt2vZydbdjNYLQWmIpnr+eqiyO/VsK+Pqhvv?=
 =?us-ascii?Q?jLEaORZ3/nWNgV5zPbeWwkGX+ZRWPwvj77YXozGaS9pwayqgvfgtd0PBhGyU?=
 =?us-ascii?Q?yX/aO1eiS61RNPXzEP/pF5cw2NrCzrzXbZdpUbLI+0er2KDjDxMVps9jQycZ?=
 =?us-ascii?Q?0JdowjpdI9MSGT/PiItdlkJMSXHBllOc5LRphs/v6VTw4iOECxahxBsghhiu?=
 =?us-ascii?Q?7vY6fVw6m34v42ESjJL8sSVv/5ZwPHyODqP6sMmb9dTzGCIZIzymj1IQs65j?=
 =?us-ascii?Q?mt32nCJktKNspH/uT1dZVs1xrTQMVDp+aSg8H3oBHYYpny7/oh4lGczkWD+g?=
 =?us-ascii?Q?mx/nPFDRW9eBYqdk7wUIVIAWlHoAII+N84kCzyq/Pp8XpIUK1B7/QYULmP4p?=
 =?us-ascii?Q?P/sc+BQifYkwpYuzi755tG5FLNedUfd0Aqst/DlBuXWOavbA00F0XaFaO67/?=
 =?us-ascii?Q?vHnPG3hKXWFdeCGQ1/nCayCJfq78belGseAEphaQJV/VeJU53jtJTrwu6gdc?=
 =?us-ascii?Q?0ZV/f+iegxWLuIT4fCTU1jZJF2O6pC4Z6dv6sgFnhEN79u0akIXIA+FDfw4N?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?x9tAiK8LdEMqt+oYjp6XZEPb45CQ833B6Nt4cxSzu9EiypuT0h6TaaMq7s7j?=
 =?us-ascii?Q?fapX2fr0L84ph4+lC4ZaZsNeJnF9iQ6P1Pk46y8N0TwwnFucC7jYXvoahEwe?=
 =?us-ascii?Q?qZ7O1driHaaOegIbI/C/YpQkTPBWtOXaWWjTPbbgty6WRdvrS0SYjqzaYUH/?=
 =?us-ascii?Q?dBA0bEoIzzU+aGtk24peDsKwPDEzt4+HUtCMzs78vI+idqRTpY5wKdykzd6+?=
 =?us-ascii?Q?M2uF6vTCWGsCk6YtRCbREDDbwqKlwiKE+FW3E4cdvMEm/Q6s+PODTZXJZfrH?=
 =?us-ascii?Q?hD3m2RXyTvwWwD2/8HdApDcOHYMVudHT/OQEmgP8rCmMSPb4+Mcc3orJp4HK?=
 =?us-ascii?Q?Esy4ZHVwiS//aMY0YSaFXCUKcyrB0cR0t7cgHdWFey43u9YvdgLZ4nc3YhkQ?=
 =?us-ascii?Q?MGa5Z+8Mo/c3tjn5uqDiJxdCOOnn4aEjjeD/pjovCtfxtiUwBZOZNGeCns88?=
 =?us-ascii?Q?+BBgvld5lnixk9r1qcVVZIZTqCV1HT1813tm8UpTW3PzpJGzANc1JkAK0vm0?=
 =?us-ascii?Q?c7G+bVyuf6y5wIePkjqojiV4KzVCtEupOQCJwodT/wdRmyffU+9+Ng6ijffM?=
 =?us-ascii?Q?ZEsr0QkS1hzEtWbz+GCD7mtMrF+YvNx2bOesKMZkGZe0ZdotSxvFc5Wr0PLO?=
 =?us-ascii?Q?l8dqUgbN3svK3W9BrbpwV/xx9eNTuY6IbIdgA6astU8e2aLnxLZjXWRsddWL?=
 =?us-ascii?Q?5eFApXfIqEWoy+0PvXe2JU8Y+X/s51ifGbjYAa45miD4CDRitWwqHISNRV+a?=
 =?us-ascii?Q?ZbVCMEPLNADDA4e3cKyFiCTTQ8R46BZm8zsT/CFSfSwauAZ7EysCaGwwkEzv?=
 =?us-ascii?Q?RuEM+JO2QEGY45uFQOaoj1i6OMMm6hojCEYVbUu2YU5prCiZiByMjbMWP8N3?=
 =?us-ascii?Q?z2imKMmAXH8x3sUOQr5T1xx+/RG2JrVIc55sK5Glg3mh0GyOj9NLbn3Z5n1Y?=
 =?us-ascii?Q?0OnCfQYHtoZivUun/J5jJGiJifFj/zEyCjQZN9p2T4QJ7OWJCg9YTofCFecd?=
 =?us-ascii?Q?8uGBdobdOYL+Ml6A4zjHcnUwYkeZDz7Y9Mwvq8tBX7kf+AjFI+6F6gGN8cUW?=
 =?us-ascii?Q?HeTtP8YjytD//2EXtetPNIm0/wNsRFsQ4GHmcPx5MZT3cexksfGVzP2v/ps/?=
 =?us-ascii?Q?QY8LI4QIbV66VJm4Pr8GxwLTq5r9t4HTowZaKpQK93x/hyyQ2/6AehL7JzAl?=
 =?us-ascii?Q?8bqg7GVYPEL4Grt8gOEGdMsk6ur/xwz/SWXYrtsvtALobPDAFWzut7FdTJCF?=
 =?us-ascii?Q?qrO7jdb1l7cqy3QaBeHfxIQcmdrOZ55LMHqj+2EBDjlROtewPvp6yhBlFoUF?=
 =?us-ascii?Q?lHvCert3CZ9sZRTO1p+E2xk2m1BD/owitBWPvkYAf6y+xRjjWkweK44M9l8q?=
 =?us-ascii?Q?OtKsOh4r2jy89c/Oso+G8tlDRpf4C5NKLzPOcp6K+tGp24nAg0v3O63iyIJs?=
 =?us-ascii?Q?AZH4YjRTAe3yzn+/1Vp4EFnPuy4roxdF2tBdJjsMTMUPHAgku7NazwDQKSVb?=
 =?us-ascii?Q?DNFFQGnpyEK88tV1zMGKTps+NFJsMsUZPH/V3+pCBeioB2uQ4RPo7u5P5gKa?=
 =?us-ascii?Q?X1pPMYvmgv+TgdFhE0GtfmnuAYqnCImIdHGFbtasu4WIvBVp3QyFD6tjfDUX?=
 =?us-ascii?Q?ZmcvZA54i/M6lZxbHRUeioelp4wAvCjfNc40gsd1g1GWI+77pytG7b234XWm?=
 =?us-ascii?Q?zRdKGUrh8/y0N2rcbNzymxHK6pGncVR1GYNaDJxaiNnvYNzWlDiJdSSyqSmO?=
 =?us-ascii?Q?fC9FLWcJQGn9t0n06/H1ztzAlytL486maC8hMbYBUykPNsPKXO3FmjjCo4gZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	4zEM3YwpUtrphjjT4fpjxf4bvmTfSEepS64TZmgHHTWlDxzA+d6d2PMZm9od9intlGLaRelV4CuLxATFde9qq5qBJ4dwDbT7z+Tzseom6V7HnbymH9jta0Q+fCD+uRDlAOp93ItM+yGd6r2saVDrybVo4oJwzFE8TC/PeGIG7siu3iddQnRu1rLsgT9gQwXb7Ir9VXi8KKFvq8pdI6KG/Etailx+4M74JF4i4ArVgjFVYOFdrSjOd19NavYjuySQXnGprJ+hDwiihoYnCiGOm/Va9sFudqo1GLfCM2idQ1Y0z7fuBEUGHpiQumBEBk/mXg9nVHWAm37sAjIlHrghHGDMtaKKhHm9jqJtg+rHwISRxAAy+CbA9Yj1oTGTfJL3bZVJn1pV4RzhDmKm4cgX3VennpErG1ucTbyBCKkh8mTSymxdfm7/CtBPXJSnMNy9DN1QiAMMEowrlw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a1082e-78fc-4537-574c-08db82f351b0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:16.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biJjN63r6Wonthvq+3LGkqw9uUuH9EskbJ+2b7yPLIU4L07xWJZM2M943ID3EtO67+mfYS23aSk4K41IZ7VzjDGLYfmOSAs3MNfwx1taBdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: shrOTRg6UmS0M4cE_P-QynmxnbYu5zel
X-Proofpoint-GUID: shrOTRg6UmS0M4cE_P-QynmxnbYu5zel
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc6fba925aea..bc8421859006 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2878,33 +2878,11 @@ config HZ
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-- 
2.31.1

