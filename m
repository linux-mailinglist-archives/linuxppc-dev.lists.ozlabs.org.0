Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F0736008
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:14:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=nogpKUnV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NyxrDd5x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQb12Gf9z3c4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=nogpKUnV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NyxrDd5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCZx5pNTz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:05 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nRsd004221;
	Mon, 19 Jun 2023 14:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=nogpKUnVGckuNk7xegK5oXEtuLpkbQHvOnNmg51bYJDNRse1JUum9W1mebu1ucRzIFXA
 oVqhVaqFzMM6aTVPMCE+uKWCB9DF9NC+doKjtHXYacTwfS/GoDqVXUFk92rEnuh4iWTS
 Z+X/kSpxGZaO/KK5tbECT1VMVCiPiyGU/5bPdO+eVYepC0pdjgbItf5XaMGr04Y20Med
 0nt6hCy21C4PChVoXCC3Uf6GneW6g2jCAjJ6dpk3oyUHpp2f4xB1MYsN3A4W52xDClJO
 vDKYfrQ4kuxh9pI3ECF7iwn7fU092XVPDDzWuCwVrX6kpetIi6SrPZiY3+ho/mkGaUyG Dw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94vcjwca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:48 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JClHwB008306;
	Mon, 19 Jun 2023 14:58:47 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393sphj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avO3kjlrAmwsLawfBGGCXpuTlyoas3hdkcSbb+G4bYrZifIuAK0/YanUswjqJb7+Awf4QrMZcNir5Zx59w/SMNsLKrG3EXMvglTk8ugJwyf8Fbpa2+NtBNJBHuamBxrfL7Wz1SzxBrsOwFNOf3I6juY5ScGxtz8A5c3znO+dkodMpMRUUJ7wPMLLkfe4klxE+SxkEMzvLJqfgKWOFjewW1io2JTV7bI524e8OUjv0On3auL9Z+nt9LYa5wXYbH5h595sxp3hrXzzXUf98B8Wo5Ve2eE5BLBholztW4wCm59M2SFzZ/54TP5SoSwZ8t4Q5lUXEWDr1aziRXZASJzHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=YONIvcEcYYF1Bmg4q33hw2vlnsJMuJtwCvW1AXDEUsD9reCq+Hs08QKrRZeCqE+ZHWTQd6rLAZVlbMgp1C+TW11iZg+2g173wQzFJk4rg5rtw43pS/Qg6EIT1UPKC/7AKZC2CiCZh1/L0eORxw2MwdcMs9Wsnyfnrw7RSY2mk0vYN4rhU9ILOV2zCkLc49jgTAzvgSiUljn5GRPnX8zjxBivt/7evkBSh8+d8URQ0iZ3sPwRI336QROPTbvq/7QDzig/mJSvTz0ODox1ZROELXogMeJWBIrrVOolzHQdfQLrcGZ/HxOtFHgGPDIxuq7iHnHH588ljywQz//p8/HrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=NyxrDd5xm8btJ5J72fsjajQfjgDc6pEFwziuNCn8ZADceIn+EjuynwcHXWlwe0JERijIuPO3REs8sSs00Yp3Ww62LPLlmZapqN8tn6VVYogMa+kO0qKlTI7odDuSBShfHpeVLghVwStlH4H3j/p0qppTb3cziRBkLL2CRcKd+FI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:33 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:29 +0000
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
Subject: [PATCH v2 07/13] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:55 -0400
Message-Id: <20230619145801.1064716-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:5:bc::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 1044f97f-a13f-4960-2d30-08db70d5a4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	a6kxiWQje5HYsUpfI2rXxUPtk1F4y5xhplcqdbTX1WhL2Q1K+BIPpAavpBxJ0jwl1bFw1I6ix9Hwe9uU0aB3Ft/MRdwrn7AqVh+mxOz6I8oiWB9Ipuihztn/NllelPYUnF70CNMBnJ7KLRFdMXTiR641/CxOEKDaUa3wHuuNFzSfQi5nohpC9p3W98lMUqOG1lYQphhXt3RmBBcIkyJ51LtiHmo7vbOHjELPedDMm1u+IOfQhoOBzckQjW3orw7/DcoLUfPZtz5g+9KdQckzAOf8YTSJvTl8tPiBjo3VMTQNNUFmjbe58+Md8Y/s301eqvirMRdJmYX0AXvfECwPbbidP1TU6guEgNuQ5mLpWQ39XvC5Du8VnQs/WwAzIdls97hm3xiCjd8mwg+V9//6yAQ7RCQ4RG0h1vnM/I475mywNXQE78oynqy//C0UfY2wtsuy2HUIUDw4Mli5XMx0QIVs+L/fWmL7FDs/3oJrd9YPObrFEfK/ydL24rw6daD/ZQTcLjWZHLGLvQtqB1Jdv4n0EKR0JzgkYrqYJ93kf0jKvXdExSFTaya/l5b6UaJEcxI2KnqrKeeQ/p0NJaba/lmMG1K2w6Ca2E1ZrA9I5io=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fSPyZIyXyIP6+7P1zJdWil9qiTImWBPyf4EkWozkUDfCEEZysXZkA+pJSoKs?=
 =?us-ascii?Q?YYQN3wBOHevws2/Cg7OkhMmMstNWDDbaVz/m48sLGIbHl89O0+JXiFFtIuBA?=
 =?us-ascii?Q?75h1MYDlu/gIsGImtoMeDHqqcP2g8jsl+vUZnJBxdEDUqD2SpbPtZXvZBJOm?=
 =?us-ascii?Q?ztJ75H+izP84HZ985BsbULQnTQ3f48yrH6DZnywdDzZC1MG1JuN9j5TouZBL?=
 =?us-ascii?Q?EBLx7Q5p63+ZAmXW02l5+eVe9jpwlTZgM2t7Dt/gUmtqniTFZCRbI8KEc7jE?=
 =?us-ascii?Q?3boQMnou69oW+ydC0cFKYMu9wZGrDB1pcG9a/5eK3K2VqNmlW+3fs5bL/KGQ?=
 =?us-ascii?Q?mxmtOsRFOOsXdc1pc6xhxJ0iiUlCVmcSTU55BO998wogptEBCL4HMTiQZOF8?=
 =?us-ascii?Q?N8Ap0cPTYpgp1fa3V0g7rmQjZim2evyYsg/a0QpeN9iyHLiQaCrTkBLs7gyN?=
 =?us-ascii?Q?qwH8LplucHm+pDF559DHN9gs1d+cYkFq557yxKQ3MwBCpp6zPtkaMFYoMhl5?=
 =?us-ascii?Q?SAnV/bZyBD64v5YDOeZG9pKV8FBoyoabz05k1DKXinfXUa/CpsVotHA5e9zB?=
 =?us-ascii?Q?tVycOdxPdayWcQ5EogWTSiweXckVQtD+Wdx2qtoTRi2ddz3prLTQzaiZXvoJ?=
 =?us-ascii?Q?+cnDMcDhIvEhsRnLrpZmQclsf2dp1couVnRM4tCr6wHi2twqZASQA2qwIZKS?=
 =?us-ascii?Q?w6X3GnkqqwhN+Sr4P++JLL/RgoSHK8rWf8C3t59xsOdBqhzzfT/bAlLpB0nE?=
 =?us-ascii?Q?ZjUdtrBoYxWEh7+bLzCQ6ixjTGG7t3Y+9+/4PxthQqGwASNY0Xbjmzz+WRc/?=
 =?us-ascii?Q?VXQZfb+akAnCTMxC+nQAthKJixDv7uK0CVIfWSEEauIAKm2A21o3pGA2+wOI?=
 =?us-ascii?Q?CQpcElO7bLwKWqPgxFiIyHN8fvf+XesgmmLU6MFZXuf2E5IUUbXhWx3fbP98?=
 =?us-ascii?Q?8+R2RebV7IUvH08hz9drON1VOjT7GwX1VABwAjzZmoGjy3v2ITa9SwrFU7rL?=
 =?us-ascii?Q?miz0xqzklhmf+uhXUc8auuDXphcHAUy/gnD2BSaoydT4IEQFCp8q55apUn6+?=
 =?us-ascii?Q?1xCOFn42YAmdSAiYQgPM8AULPOMAc107h3ITBTCj3QYRc5jKLqn0vvqCe8Ni?=
 =?us-ascii?Q?5WAgJf5Wt4NNmrWKc/CS6JBL48l5ibhaEzPmEnAVEGZD3i115QT5A95Hjo8v?=
 =?us-ascii?Q?x4COxNJjtUEo8YktFC+UpAKsHlHuD5EQ1UOFgKujvtPU/THfI54XjBfamU0N?=
 =?us-ascii?Q?fWz12qwHKpNW4kKUAiL9001WbFk2myobT3aHUm+UHNsz6DbIR9/WLl4vZcTR?=
 =?us-ascii?Q?Kpoc5b2w1RzT1eDOxIponYjKPwmDepn7bCpXoFQZvDuYb1qtg/Lp/8inAu8B?=
 =?us-ascii?Q?s3V1/dquR8aBPad1d82wjGVt68FEtGjRyNLxs7gxjLrqvVdDSMbcP0hUlqzz?=
 =?us-ascii?Q?YxcDTOXTQVsgU+9aUqQrxkxY3pRx/QkNogituFvHOrb/ZYjQbiXBG2cGB6nu?=
 =?us-ascii?Q?i3NYQ8hGyw/w1LJMRUV5XreEJUCOyDVxM1KfqcALjE/NMWwVwTNYSTL9TRbS?=
 =?us-ascii?Q?dAARZauyRh1zSkZ/45vqEAE00SigsDwBBZuxqcRJbjzxrvmjN2IFE36GR72M?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?Y6nkyKXfGyu5ro1Okufwuwb8Sumodw5vm6d6gL5BngesvkdKVSql673b6wac?=
 =?us-ascii?Q?8hojzGHWKg/kJ1RoKiP0ZC1eDnTH6L5AIpGjzfQYe0fCIIvY0DoROlDkEoSX?=
 =?us-ascii?Q?jmMce/Mj79Sw52c4cxwnqObeMbLmONPCiODgCDuzIHP6FYCTCTAwpm3JuTJP?=
 =?us-ascii?Q?AW69YAPOutE1n6OSWU4xGafgD9us+BBweBg7lFhQP0Bno2SNP6LNUpeqHcY/?=
 =?us-ascii?Q?rhWsFUWc7XoFze+Dn7q3btbG3nPtI9JZml0klYH0nMLtc3HPdx34WYilES1E?=
 =?us-ascii?Q?mqo7HlFYja4DdAtBMlQDkMSvKubYGNq+LN9vmuAvGAJNDvFvJBUJ3DIrDIF7?=
 =?us-ascii?Q?cHrvvJPGKsuU9RUijTy1V0CMthpwolHF25wLHXBFcN4DnecsEMVNUeXcNfGe?=
 =?us-ascii?Q?pCgZnfdmwvFHom0yxLrT+M6SlUijG+0T74lYylY9vehPmtxvH92YhFC1BphX?=
 =?us-ascii?Q?BSuQ0PAeFV2BYzA3WjGxhBN83yyJ4JBJRFIS5P4PEXXm2RhO/EiEuyMMuM+w?=
 =?us-ascii?Q?Hqz0EJ9+0TvtlXDeGbrcmXFpFugExIrw177CtB96BRV2gMAmMUMBafoq/+9Y?=
 =?us-ascii?Q?/2QV53CEUqgcu5Lbb4LXFQXyPbx4IoLuQ1fxaq6YGv/DipNbg7QDPAa+odJ9?=
 =?us-ascii?Q?6SWXUCThxR+TiUPnpKccDNoSXcdre2YoNDpmJ+gN98Ti8NvQwvJofiNKDxay?=
 =?us-ascii?Q?GtXHH/jVNtpOXgRrK5Yun6fcUqw7UPCl9KQlDAb/qoHP9EXbpJ9n5B90T63P?=
 =?us-ascii?Q?9P0NqSxufya5PSDIhyfTKkiAcFDNjpKZ0tK+j65TRj1DTmFtqqxUmP6z/CvI?=
 =?us-ascii?Q?tr0zImMu2zPbVfhUSCEvjf2Udo5bqSfuW8NTcbuIBKXEiQhDXka8GgMb+Ipy?=
 =?us-ascii?Q?wZEGazt1GrbLsG6Nt9tceRmyzx0rcwscbgtxkYGeCMMOqkKIkQRPhsVvELL4?=
 =?us-ascii?Q?q4/urja7+hHWquZN616tJbkS1h/rlXFGeQbtPrWKmxkYbV4vq40WAxhsLIxL?=
 =?us-ascii?Q?CXoMpMtLCoTW3N0MUD23JKIK7qdtYEMWXqS+YGe22YGcv9BvDvkPqcdxirSd?=
 =?us-ascii?Q?1OY1F6VITcF0YBsuzzbHCNZ+poWQB7JYxZ0lCSTa7b8ZFq9XFj1JFl9x79qY?=
 =?us-ascii?Q?hvF5+ck0RR03h8NyHyGbTyFYthdnq5N7ilhiwQVwlmVGvQ167kvXgOgLYSHU?=
 =?us-ascii?Q?hD9uCert36K9GzWvBRbDhaxGRxzL2T6rwBlXJxtmrH/b+mukLhmiRPpGw5+D?=
 =?us-ascii?Q?j545ONCMnHvvkonfT8Tj/CdNuPCAUfwVq80rLl4bd5w7PwvO5tFUyYUMnrdF?=
 =?us-ascii?Q?w5DO7JUkhasFStnhw7sTGBMfD8hp4xzPOzg+i12ptTAp2F3ktJf5xVvaqJ2k?=
 =?us-ascii?Q?XuodSPKnMR0leSRbPO1AyrsqB+q/T39DdD/NJ5/oyAIyyLvIqgJmRbysblm2?=
 =?us-ascii?Q?tPgvYPPx2HSp8Ht2XqihwDYCiijGP4TxTF9nXO4Dz4YHvYKp/Kjcu0qigSby?=
 =?us-ascii?Q?qXY4gXprzFJIGu7sJSf66is6sHU5za4hFanT3q0qveu6hOuLahtwJbAZGX9t?=
 =?us-ascii?Q?3dfGc7whH591L9ns6UpZqtuYd2Qxo5gBn8QE5YHMnh0WEUtOKzomrE+1h6gA?=
 =?us-ascii?Q?/O+rvpmGeExwn3l/rV5PB4E5UzvmPpYtV3oDMECVzDCnAG3dx+zmMa4+WFXD?=
 =?us-ascii?Q?r8WnQN6NF0+MVdZ528iSvNG1fVqVwFCo4WrreFq+bGDEJ5Mtrwu0ip6tbwmX?=
 =?us-ascii?Q?aqm1IHyRRWSobrjpau/GTVvwsmH2w6Jmm3CJzUCTWx1BkYI/OBUT+j0oSORa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	wEMzzKMj8ENyUuaJ2QhNPBx4lRS3OcH88PBARTh9RVrC/aaEaRJ9ufhpS4BEp4s+61K5xpCU5fbL34gXZudF8h56j9KP+0HuQAwyCIpvj/+FWTX/Fi9cM/mu0LlIl4Z4BnM6Rh6cmrNFPed6KIQa1nSgopsEUSTIhAifEO/VELD3WodhlgXaL5FzpEM8c697KkrAIWFSSjBvwrJ/Xcfk+KONYGCdvHmECUz0GUbdKDBoyvfvbP8yKCZv5SkQD+ML99467PcOU+O/Ls9zVXYvRMzk3RXp/PGXU+ntFHXFgVX1Ll8YNDRk2Bil2htGn8s7rrZ81cgmo38dzYa04D2O5+TKlPuHZYP7x6l/FePJ5s29ZG7gmDHbSSN5IBzgrZyBWSoRQPCm8HZ1ra7llyLh5IjzE3Bi13eGK3uO40lgpETem/xlvDHuk8XGx1AyGnxt7km40B/HtUlJKw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1044f97f-a13f-4960-2d30-08db70d5a4c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:29.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vuKtT6u+WyIUk0viXyxG5ELUUBq1kQpCOS0o6LJj2MfDBfb/9JXwtfyL9RPmkYcHod6AWOHH7F2hO3LhJXI//JnoKTXN5OaP6Zb/8rgltY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: v4JSn8tpw94ZlOpmbglPv-yJ20vFcCQ-
X-Proofpoint-ORIG-GUID: v4JSn8tpw94ZlOpmbglPv-yJ20vFcCQ-
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 40198a1ebe27..7b71916d1519 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,23 +88,8 @@ config MMU_SUN3
 	bool
 	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
-config KEXEC
-	bool "kexec system call"
-	depends on M68KCLASSIC && MMU
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1

