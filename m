Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8F7513A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:36:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=t9WqqB9Z;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aBxOvsZT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XfG47bKz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=t9WqqB9Z;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=aBxOvsZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCx5Msxz3c1B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:45 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiFw7015929;
	Wed, 12 Jul 2023 16:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=XjSKP5O9Qvz1o4MFR00yYopNPOPRQmNhadXQ7adxl1c=;
 b=t9WqqB9ZSCrGCZSQYClVVjiK3tL6X+7tI+QnqP2hZtfAjUc6C3/G6Fob//HlWGtIKfWt
 5uA3pt9U9kAg4zEuG6CzglaURUs4pUsatINZU5fYGcdmhBTBKsJMMaBTfdN9g8FFzVNp
 24x+yIsiBtOmgE2JJvYWWPnhQB3Jw0SF3eAlEG5FANkgbxZiSz07rQAbJX0U9eaTb0nY
 oMj14rqpC3U5PMrAaJiThUB027CEmE9IMXnBdrg68zmaR1dUtnGuDwBFeRB9wmxZCezn
 ax41XfRaWjQPUCIurxI2ssSW/CJinTXDh+D2HSfNX+QgD/5LnLXXMmpIRBOOlLT3zNB5 /Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpyud7sxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:29 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CF4bmE033338;
	Wed, 12 Jul 2023 16:16:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx87b32f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9ntsV/CsVcuPEh7pVD3SGEhKfNrDbQmKpGM2jeiqXJn2yot9AfPr0SciaAcsyDmicIls//4s1xCLygHW/EZwyDY2f2LQewKe2Ls0giHK+DucYITBy6zOe4rmNRowe0HQY8eZFZk4nFJkzFUQ49at0rig0Qrpb80PqJ3KGXgtE5lzF3a7RtvBCImlTjCndDB2nBCUjglQU+HJXOZxfAEnwx1i0b1jRDhHf8xrUZq2oAmeZpvq2LHrtHIp4yrROs4Qv3msmp02oT5qQiBEhysrimgU6J2YBKmSp/wMhObOVV6JgifnPwqWkkr7wF53Xmb0kcm+NBXtGnAu0Z/fVTr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjSKP5O9Qvz1o4MFR00yYopNPOPRQmNhadXQ7adxl1c=;
 b=elV1vhe1O4Z3MDKDluU6Ioln6e1VwePB9shBAStAppzJP9S/pfzidQnKQey4grjm/HklokkIkCtQqTVtesaqsB7naYxfkGXpuHtrWqxHH7uQempdGs+BO77av5wZanefa7VWjOcDeCO8eImQ/9UJ/SNJJL2TU/kcBlvLq1jcpJ5k68hlCqBfRjNi2DiprgyACHW+ifxKI/wys5COJzAepqojLjoDtRxPJ0Vpx8m1luAO2j9k5Ih1gbJcqFngNGzW/RJYmZznITH3fjTfsFAJcIZ2KAxitSkmdAssSK4Ar2Xraj7kijvVGARNeSn/B/Cp0iXQ83yhvWAoKXVYUhPTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjSKP5O9Qvz1o4MFR00yYopNPOPRQmNhadXQ7adxl1c=;
 b=aBxOvsZTp+SPnPqQJ/ku7k4dmYK31nqYuyWHRKoQOZ2JX6qxpCnsH7/Ut5MnkyTYsvZ6fopS8RRwwCyy42pdm7TjnJ1TjK86mmgoJAWAE1556A1nvGkql20TbyIBpY1b+PDJ5aO2P9m7Qta/bSADnxGkLm/ORGdUNkuj/CZSQi4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:25 +0000
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
Subject: [PATCH v6 11/14] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:42 -0400
Message-Id: <20230712161545.87870-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:610:52::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 964c9fc0-9255-460a-637f-08db82f356cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TTVU+NgX7vrjn1ec1j+gAnuuyb4NqOEKbklaeZNy6uMnGFw6HMleLyg+XETOsA86Sia6ikIfSBO0YJ3cYRQgI3aNVCf2SVQuKBNU21Sr9T09ZyzwrRIkwMNCNnFQ5LfcZL7uh57bNuVzn594Tq3Bbz1Oo6zpovHTZbbdJmCnMWu8K9/yHrX4i2Y3caXxLAgqBunGjgJV7W8RJxQ8KDF9/4Kg3Bu7lwk2FBImTOLvUlYKA3gNJ6Lll8Ai+VXovZrdQsR1vhMp5WxB1Bi/xyoolciGyqievkt4WfskODZ4YcrM4a07ynGdDJstRRc6+zxtwNRzOvQnhWS9VcyRRqVEOnzCtW1n7uGHtuqCOvtWYp7nAQPLiu/mnj1q20/fssSmB6THyWkY1NDartx9XobdYj0bVGkyrJdxtiLNn/jojOfzzLvKEr4HRpPNgz7KcXK6ZdBucmIGqJTRQQadANzjc/TWVwbDJr2PvIrBgP8BiM0jv/fpLTlsvr2ircjKlbC7cJlWVWlntkHWUrxqx/RcB/Bg6f48wSB+bUYlfT9SH6mYB8Uh4sQ/RdNc7TN94b/NB47Iv88qBTdGmiZjnGrOwbPBrf9JHBjbUflceQB8fVY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(316002)(41300700001)(921005)(186003)(2616005)(2906002)(7416002)(7406005)(7366002)(8676002)(38100700002)(8936002)(1076003)(26005)(36756003)(6512007)(5660300002)(6506007)(107886003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?edJwElHhMMgfHaF08rVhPmvpb4RwpIKeqwRtjjx6IuhFRM99jyMYLi60G76g?=
 =?us-ascii?Q?7yuCDCQOLzQ4n/g2g3x6bMCXnzLW1PJ5Jkg3tS9PanaFlMRQ+0PcEecbEVju?=
 =?us-ascii?Q?4fY2GAJckXSTCFIeoSsnlPcdpQt8xzhgdSNU71M5KPFz8sbnKTQSNAxkFyyG?=
 =?us-ascii?Q?xU9vT0Ai2rb9jKLJA1Ink1te7OMprO4fyIYY8suUuXqsVZNFlgHKKowW3AlY?=
 =?us-ascii?Q?8aZJm3RIRwDpC7+mMoVB8KUFdKQHNQ5QMEKpN6/60l320Nz1RhswpS9uiGNZ?=
 =?us-ascii?Q?D1CeOwUvGlqOIAASrzkYxFG3Q27s1NHHeEZbhC8D+pNlJuVG2O44fhMOYoSE?=
 =?us-ascii?Q?dAq4EbrLLqgcghaxnZ5uilwsmGtYkCdO6TcL+Fj/N5uTOQgof0KDa5UPkV4i?=
 =?us-ascii?Q?atO+XkTlVu3HupiaFC8L4YZKBp4xNqr9IpnVvrDWJT0wU8AbKDgvfm9k+SM1?=
 =?us-ascii?Q?6TrdvVjzvT1jPjDqp6Lm+KUfvRAtgVWROGCtEDyV0kcESHMzl1kT7xxAJevX?=
 =?us-ascii?Q?fG8KgieiumPje2l7eN2uvqt8red5bW2eYHVUGSS1mF0If88XmIqHbaL8Y+DH?=
 =?us-ascii?Q?Tu11gA5hC+iEzptgM36a+QYWconAt/WyVUqf4n6cOiV5wX7BtJqAfDFRnEve?=
 =?us-ascii?Q?wXZ8qjpRoxJEExiizC1b3rEEQeb3UmLf76IjOIGlmt2bQMpmbFi86mdvu617?=
 =?us-ascii?Q?p9H0m6FxYr1PzpJXi+1kp+pd8kK7dlTU4+uLTkyDvoAXjmT41iNLnOOqyg7d?=
 =?us-ascii?Q?KlejU1QM+bSV3paJvYxW1QCwg769QQ4H+1Wb4CC/hPIr20mf3XwR0FsR6yFj?=
 =?us-ascii?Q?v5g/MPoI8oiyFRGQoxZZKrhLLkUrzxhP18VhwFTkhuk50sVlKTeOy1G2noWF?=
 =?us-ascii?Q?qIKDlCfNLFd/XZjh1O7Y5wfkyUqW1X4VFJ4Dh+eMG4Qd93xxy2xpHIAPcVft?=
 =?us-ascii?Q?owBGOHXKfwRfDzWTDBaDE/bsiIKIYOwI7vohH0k4GkZTiUkC94rFYqIQ6k+v?=
 =?us-ascii?Q?lttN23Yhr5QgtVMy1YV/+/Xif1bnAUzpRmVfVyV+K8lxFP1eD0r6J39xgDWq?=
 =?us-ascii?Q?uGWVkCjDuTcOx0w3lChyQ86Ls5boLoDHjUFKaVdHJ6C2bYJS1qzZJGVrJHmI?=
 =?us-ascii?Q?fo2NSTG9zci3iVINhCZHaQz9o82RhrbNCyPvbBuRmNf5gXypWctiPsETWJeN?=
 =?us-ascii?Q?b8jQZ6tHHfkM7uh0p48mHYPBOMKYo/UK+w7/jclp8IWqq1xEqkRdn9rdIgnI?=
 =?us-ascii?Q?hByh8EOHmqvZs25ctGJUij+82RIYTIC0rkAuWzPEEZ1ZPweYFfU493/u1MnH?=
 =?us-ascii?Q?ThW4hFNOxCslBxVpLixBYbqWRPM2vN0NI1dAi/3BJji6Mu8klE0jAG08xioH?=
 =?us-ascii?Q?ze3FDOxb+uGDaq2FQDvPovsICL5pamDOKNkHnyT+zx1bh7e+hoHzhfTIcUgl?=
 =?us-ascii?Q?NGSsCwkm5oHLOKtcUFtKIH4pLbu8LCEVV84gZpD7u4AAXZnhO8GBGdgO6x0K?=
 =?us-ascii?Q?8P7I7WXKfHY3G7ok3d4wD9Yurpih+wAR1pjuUk6gjDkuPyjKofnmQOHMpXrV?=
 =?us-ascii?Q?0wtcDkq4OaGu8Ty3Ntq6QdePCAGPgHuF+57m6bKSLnSfuxOyYvEvTbGVAwek?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?GDKuxQgUp4gcRXu5QvEq8spK+0CuuPMlBb/liYDlBInLKxCJuvf3Php2WDDv?=
 =?us-ascii?Q?4yN3SzVusV2rLc/36Rqb0aFJR1twYELHS6QC5/+fg+MW1NqpyQbKnbi6bi5I?=
 =?us-ascii?Q?eKVaer+grTh8J6I18z22n7++TBM8eub7+abpNJ++WpFbpFjlBuxQcfRz1+R2?=
 =?us-ascii?Q?EpC0iet+y5mOUwiprkd0mu1t9zX7Uep6KdHJQjD6xY5wk+D5d5TBTs0q5+hn?=
 =?us-ascii?Q?hjMlx2sYTzoEcwFqi/5xMKGBOg5UypHjCDl0jb2nnI81I1qPcXX9tWUPtSjC?=
 =?us-ascii?Q?tSqWGctUdNarxR6JtBdRIJKOvBq6lhv5b2aBeMP4RNfMNnMmkI3kF7vqs6gX?=
 =?us-ascii?Q?6zikOYg8GCMmY3n8NsMWCpLQoQIA/tvL7uS9sx1slml/wNb5lccCeUfTP8VO?=
 =?us-ascii?Q?lFZoUOkD7HhdLEEWt/6DtlV2H/NWUXx9Qox8P6aBo/DimJ3JjH0EYi2mCKBr?=
 =?us-ascii?Q?tf60aINz9r6hGIzIJBDVc700ZShC0eKsZH+7+fftZ+KbjDxFAsZsxX8f8o17?=
 =?us-ascii?Q?3yxR5fwT/JMgmQVdmPbdgV3914b6ZYH8OJW9UafykMvF1uT9Mo877+H9MRmO?=
 =?us-ascii?Q?ljdZcGOR7tDsqnk9zJmmCEy015xvk8IWLrTWyiGaEhqLwYxW8yD82Sy2nyTB?=
 =?us-ascii?Q?PY/yUqp5ojqGHp0QfSqNzKbiqWZhjBXqXVyZwWJiV6IwOrvSeOak0sENpFpI?=
 =?us-ascii?Q?lW4j3yvWiXmJcjT6cFYR12+kXwWjkeZcKVudQgqGBx0xf/7QPpVqXkh0qx2S?=
 =?us-ascii?Q?9tGxYg1/kM4BxISxsfBUYW2ZrEl3VQ9t6ickhSiYCBjqFBNNxgMOqGfp2PWT?=
 =?us-ascii?Q?v026iqxrpYk75vEOMZziCxgJm2NdqpBON9VLkKsfMei7NXeoQHpB/YudbO7s?=
 =?us-ascii?Q?oZLPhj/mTAhdMZvQWyL7on7yzeurHB2TEqR35a+YyYVjHSJSUYiemuk8pYOn?=
 =?us-ascii?Q?JMG53Sel5Ro3CKOcp0Hc61rHI0ydZNCl6FpqPVwi22DT7g4fbvHkFZ01H6e3?=
 =?us-ascii?Q?fQ/18fRfQf7naBejulLRU/q1QOf5MsD0LXGmIyJssJK95p8XSSH4/fuYTxH2?=
 =?us-ascii?Q?Dw+SJ4n5XP4HCb3QBQY7CgCHayCWKqBNg+PW4VQCpvEvVOukuDZvbklLcYOQ?=
 =?us-ascii?Q?uXTa+2UgER+cJUz66dNjJ6eQ06O/9Wc26KQU0vktMT8kmumyXop0EhQvs20T?=
 =?us-ascii?Q?pMlyej+sPMn2ciIcDeFPbEinlfAL9/szg2h9+CMshhmLytam57qZ4unB2FU7?=
 =?us-ascii?Q?+nLscfrrbnImSzOmdyVcBRqW2APIgGa6393mPHb5zRrh39OdAmRvo9SzPXIv?=
 =?us-ascii?Q?k7eXkeJU9VaMIXyw27Y/ofgqDCASVKikD0Tfv9Qf/KJR2MIpiYYfoQ8xqwMC?=
 =?us-ascii?Q?+uYRIrQWJ2+NhCP5QmYV6nHbg+dghgKJz+HJJ7GFc/5yYawd3svme0r/FDjE?=
 =?us-ascii?Q?aCFo0PEI1LcgVQTZ4CUp6wgWgEw84eS3RZ1zIYXrbftaPsteY135M/dNl2au?=
 =?us-ascii?Q?Yc/vRjo6NIhSWyKpgP3MP2IINESaX8Ppl45duHbxX8ZrcJVWCwQPG1iujfKL?=
 =?us-ascii?Q?4QomHTktQj0hjE20JUaiM1PdOlsgp5O8ZjOtE69MMjuMaPH932vqjHtSh7Mj?=
 =?us-ascii?Q?9k/7IFbj8xmMSYXM3tSqLzgZWVDCsuib3fDPZH3HIP/9HiyiWlnsX9qc3hFy?=
 =?us-ascii?Q?SjSk8MCNiqkrZHtMdsp/uOl1I2ZwZubtHXfQiJJlvpUSj2bt23yuTI+o7pM8?=
 =?us-ascii?Q?4eAOg5y1KO7RDidc7JONvwzYXSCDcgShFwQunOO1fIAcbyr5zzIon230Dw2H?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	e0D6g2MT/BN8TRqP2gc41RErbMs/cqTGbY6gGH0GgTXnTKGQhEkpdgQgjO98gLZDE3sKAad1t6W06mTLwE4RP7E3wl9a4sXrIVy0MtzWX8GL01dCkM1E7edI487igefoz5dUBUMRyfDmW6mR8Ina3axrYiqxRjZVGmwPY0M5PkrE84uwGu84b81Fqyyn3Y+dFND4vs2rIaTIH7d1uWHyOzuqRp8zWlDnn2eLdSvkUDZpzaRRDy6vjwSe6qEeQlR0Gw/3iZSL/ZFisq0KAVhkeN/K29V29xh4Izn4VcqbQ2hJGj6Gp8mOb77j458Tq9Bn4qJwIXqsmR0aMup6Salan0eF8ENTUtGRsVHKmX0jRwyTikSIYSoQHMo0QY8QcPeNRU0AivvPcf7fDjOsu7lps715zjq2RlTlvPI35uPSZXDCI8CbXLoFzMEvXnDOvpZv1WlHnZJev47NcQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964c9fc0-9255-460a-637f-08db82f356cf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:24.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qA07Zjf9Z5ezEZipNsY8yLnbab7hNv8/7E2wt9ms0Z7nxpzq14TqONXfeicr8oBIRh0BnYfu0/Fw+c3ZVqhd+T1BJv0Q9V8n+9NRkqVcB4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: 1PM19TDoCoxjlbvecwTEiEc97-Qyo04w
X-Proofpoint-GUID: 1PM19TDoCoxjlbvecwTEiEc97-Qyo04w
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..23d0fbbe1367 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,48 +650,30 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool 64BIT && MMU
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1

