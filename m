Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32AE7513A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:37:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=bYcnnw7K;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HzI0Ille;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XgG4lSwz3cYj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=bYcnnw7K;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HzI0Ille;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1ND41tBlz3bxr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:52 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiDMx013196;
	Wed, 12 Jul 2023 16:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=9/yh8ohc5o8Wm247LgVbSmY/dHXKXKQBrwOB5E7j0Nw=;
 b=bYcnnw7KzOLAMliS8RHpYw9y2wrEIveelxKFVe9QynGCOru84dCaU/CeXjC2Pw7wKVzh
 6+aZrseu59TgTNk4ImI7LeG52dWPHLxXNZhUsmhFMJ3sxNqdEe1z2JVwlA4fa7wjEoyG
 d4S4w3/D+lLoFqy+oWgiKURSONXjcA28A2Moehnvyfqc0dpEbaRP6AE3ya0ZXaSqp9zL
 1ihcv3b7eKvS6k+MpU1bJTLNwGhp1al/bDoxqwOu4qrktCNY0JK6QqAJQg6T/Woms8Wb
 vGV2s9frGyghKljLMjnKyAl1aRgph0tQA9NkGFXEuGFPNHYwanDJE0WibWmGQdzxVzLY 1A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rr8xup4fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:33 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CF293e004344;
	Wed, 12 Jul 2023 16:16:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx8d4m1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMpuQ4PguDsDJVEggtAgvbhyMb5yOWxYemNkB7xaotaOudzH2zr2S2njKfdPGyeHIxgQUTXEuJGUYCi+TN0LmRP+cXSlBwNWbF3RVPYNI/E2DEhQKs/NzaceW8ucigbJuuDDlC3vaxKJNcPfZywdkvafFG8yqKk0xRt4fIix8xc6FcEIw854F3Mk5STjtV2izB9Qa8aY6k2QqbPlpDeOu/nML1UB8qOu/V99xYnPJ0LocLlkXttCCHJFuzQy9zX9zCq4DPYKyUy8Q54CFjIOxFA4Nmv2oNXFhPHc5NAFWDDrfcNldq9aX7LKA8/9583QNlg2yM/BWJgVQed9yzgPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/yh8ohc5o8Wm247LgVbSmY/dHXKXKQBrwOB5E7j0Nw=;
 b=RaukyoqyzesouJ5yX1A07ES3h5WXnLae2DEa3Xi/r+MJFbn9aNpopFDCE6phCmW68672gnwEBoiwsEjXo9F0wgtONFyvohNnla1hHmwh8cRqBNcnvk3eQfotD4p5Nkdn1vIA1G8YwpawehCGUTmGZhYimfDpek9vwKJjQZ1QGO7LL1lvAwx+rjpAMh+xrZQt+C447yU3as1uJXqZtEdTH4aefS3Lhn+itrOIGjZJf9929IpdZNfCRTjAFM5jjLC2sSdy0QdQaaCfFmPn3j5fxDgYmCTVincK3LvqnMWfZnc83Qa7EeXiyKJLbyGI6Mc7Zkb4Y6AUZpO3StRugq29VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/yh8ohc5o8Wm247LgVbSmY/dHXKXKQBrwOB5E7j0Nw=;
 b=HzI0IllejzHCmXVN8r8TjrY96il4NlNp5PgfUcf+FnzSAvYMjIhn+roCLO0dhEOdZBAQmlJZ/ObtLZ0dtPrgUQ0TNg6gorbAdguxismbYz9TN7N8TfsCIMq8qOAuEIlProCEiLzRO+Qh/M7FrLhZddJObSnyEnZUdHIKMAt0ZBQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:27 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:27 +0000
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
Subject: [PATCH v6 12/14] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:43 -0400
Message-Id: <20230712161545.87870-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:806:d2::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2348622d-0be6-4789-163b-08db82f3585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fOBzodIsI+w6yRa5NZeKEcgBxzz0uAjFski5+Iongfn/T4mwzmyUjzD/ADnjTER4LixEB6fk8HbXyIpHebEMh4t0vpJYqxS7eiANNMi0K+9sQk2891pNzEQRKdSUuAogDsG4jf2ylrxiktYNrhoGVN6gbNPJfxmqji9lfHbMlOFp7hzBQ/Kh0WRTIJCQ5z9Jvpk37LGxRGYCgjD6TNE3eSn69RJ7MOehNFsB6qaw9icaqzcgI0yWPe9QxlvF+Ax6OJWk0nz70i3RrFFROR/rPRav7QA2ZVyxWVTGqgfVlmpANvLSenoD8negbbf9cdVM7gK08h4NbAAIiUrgzAv9OKz77ZvOMVKaQ/48bNiftwO4uHRWKpCFZQaxXFKJm+dFs9+8H4LhASz/w7pStDAks8z2OvXrfOjCW1lRs8crgqadmBQqHLXhz+LpWqPTl1VglWx6zaH+KfCQPDdHTGd4ffyLlj43eDZDSsiCn1uZ3KOXwzj8GgTqGoI4HrkYErSZzU6SAcrvnwM5X5lEhAs/d/zI0JMeq7PfpurApKXc2iHNq3wgbz6U8Dd44fxiO6iLBDA0/OMLModUr7VlH49cAvShfxbFOvsOY35mh6DR520=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(316002)(41300700001)(921005)(186003)(2616005)(2906002)(7416002)(7406005)(7366002)(8676002)(38100700002)(8936002)(1076003)(26005)(36756003)(6512007)(5660300002)(6506007)(107886003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pGWwTy+c4g61J1P8/T7ywTUk3TXpx7jH4MGi83D/SeTFXhVu6m7Ngy+nLi+R?=
 =?us-ascii?Q?zmcuDCplWeMYWhUzR4Pm3QyI6IPLgoxF+4Send9P3MgQnR+oV4kJeu7ul3WZ?=
 =?us-ascii?Q?IK12Z2zQ+uZCcgG5J56/Uvve4nPYjrcl7zmghO6cwTVY/S1TWSX1ljA9nic1?=
 =?us-ascii?Q?u0kfCxALgtTkj2R2NSkrqj6rym4hkTGp29oI1l2GYgqrNIShQmq3HjjWG+DS?=
 =?us-ascii?Q?i4o+BTDAyq3kPvypgiReIUfwixJdBIuCxfkjeCaE6c0L1GJJ2YyJlTHVZAil?=
 =?us-ascii?Q?qk5H41MS1Rc4vIl8zVej6HdC2Rufsl8H9Kb3tE9KjaGHE5oj2z9O582Dhu1T?=
 =?us-ascii?Q?tsoEV94m48iZp27MHK9q/a/Ihc6rrXwHJMEF2Lhs99gx17+K0sSmyAHg/eBm?=
 =?us-ascii?Q?Wx2zOSNRc2armoMTwXIe/wQJ35vf3JPuZ1jLpFrVdmNIpbA2yIs09SZxpxwB?=
 =?us-ascii?Q?Oof9/bCK/21ui0+2gIvngzHdfqiq0qJpp6NHYsEklr1agmW4BcTFlmZRRvIG?=
 =?us-ascii?Q?eHZKHKzmnCoflX7IeHJu8tqkTGDOQey1kgfY6zUuKfyy1yaFtAwXHihiT8ga?=
 =?us-ascii?Q?u9OXtEnuGGEvTxSOebCHJEdPqAr+Mqztpa4ThE5T0eCyWkIPOui5Z15lJ8L3?=
 =?us-ascii?Q?Edf/M+AsF/h8yh3F6b1ol6aqQCLMBFz5jGkUzSO0WvTFz5fi8e3Ih7I1mhH+?=
 =?us-ascii?Q?7HhNRFcHPylYRGS6ZMFv6iM8rcM58+FLbCad8ZhRtP5+D+HWyIvetEcG4WKM?=
 =?us-ascii?Q?oPdz2L4L1Ae4or1LP+WFgi5PyF8bmQSD4shRaAwbFwWoxL/mxT5yx+Uj3g9X?=
 =?us-ascii?Q?NsiS1okuOvU8vcj9yBMRu4T6lmIH3SiWKUyypn/RFUfLiinpmgYMpWifBM1C?=
 =?us-ascii?Q?SdSTX7vT1POaC9fIhSW/JFYlBkLnxwZqSe13mGog/f8dxDhfXapJo4tolqV6?=
 =?us-ascii?Q?kffEHm9EH6aCL6GuNxdSPdo+oF6A9n+Q9XpCqdKQTSgQu+TRSFsOToBq5JDl?=
 =?us-ascii?Q?CG53IS9R9v4vyRECT2+rDa57VPYak8+ruqdsyR0BxuZHRyxaH89mt81C6MQR?=
 =?us-ascii?Q?hRDMAAoVgzzvfyIsk9/y7wSZq25flxtxbLcqoRsfI12L3PRjOnLlBjt7pEux?=
 =?us-ascii?Q?XaJpg5qrYh0VrBiRbRZF1aHfUya7Pwst7T+E4CyVSfG8P5csQi3Pt9xTfwqf?=
 =?us-ascii?Q?qa51KwPegivcj1HWE9K01DGjOynYkdhJnHTq4ksf/54LKY0Y5g9Wa/aesn+h?=
 =?us-ascii?Q?LUPB2I25LL4mTil0iykCAWsG04/+ODZ+AdsRxYtYbBRENU2SbUMa4YzJsCod?=
 =?us-ascii?Q?N4ZUgDf8IplsKjU/bW7Q5GJcoNld9GNbF5Tfi81iiHECMXL4fCAZBSfMjQbi?=
 =?us-ascii?Q?z3Gk8Of9IDzDOUAY3qM+D3pBqKfGwwndMth3ecSUwp0FszzGVJRlAQhD2nzA?=
 =?us-ascii?Q?0bEsu5IRLcBHtHfk/rqqMCyYQ8i1NNdc1s/0gx5oHtr9HnOQvmpsFgquKQOt?=
 =?us-ascii?Q?8ir+Moi/+XeEUW2pC2rVjOSSOgOXOajFKeUPMtJAh0yX/tn3YpgrHamlv7CR?=
 =?us-ascii?Q?DUYZ9iQqBicU3fDD9CAXpeezDxsqR/m6lPfLzNY0eTJKpxso3+q5ib4974Bu?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?hrceUPfzqSegw6yExGqzz8tEi9hGmgDSP8KzKNXBvhVroPFXBTttrcy9vpyr?=
 =?us-ascii?Q?/pZGRQNx9qwWY2jWfqqgACiCgK89qWEfwQIozUFiEynclDAYvvrF5aOnj7sk?=
 =?us-ascii?Q?gK+AD6eqB7bYzyevrtjygsfjNf/Jh7PtGYg7giaOSLllzKW4GwC14Ril1OMp?=
 =?us-ascii?Q?OHaPO8pc3QnkBsis3sHfat5mLzWqB+TCvV3XKU2k1KFlODMGWcRX7Q7m5Hwx?=
 =?us-ascii?Q?IKZBg7y7LOTLxQ+Kl61dJHsBfklGd+kjhyqLrDSn6rRDweZ++ytZrr2tx9cb?=
 =?us-ascii?Q?djMkFCUYMFSzM2qDMPpUz2R5DtnbRdr0lIDtANPeQdC+0hIHNS36m28eADyC?=
 =?us-ascii?Q?uNSpMsojwzN9rVkBXiXwtQKSO5MBzDzrfhMZ3ZNoLMi5Fp/mkJyfw2Va+P/t?=
 =?us-ascii?Q?YJdhbJ0smV/sGzH873PSQGT8wGfmanUXP2Q75UrMdSAS39NylEBShZNc02jn?=
 =?us-ascii?Q?AoSIqLNvQplkSn2Tt1B74yLowo5JXWsPHugDoOsO5utELgkCkdxgpo0uorQ2?=
 =?us-ascii?Q?HMNYZMMEyyzE0P0dZFLwMWBluwln+pS0YP6XIQ/sbkzDfJm4zNvxASFYLCln?=
 =?us-ascii?Q?M/pz2O+ltByMpwe4HIcKsEOscfblo1j5YakPSEdC+73RR/HK+wx5/G2QEp2/?=
 =?us-ascii?Q?7Sa/myrO/COjwcadHVFYGbcQ6NO/Uh1N3T6jPLWPh90lARPnUeEyCK/r3r6+?=
 =?us-ascii?Q?UWRB2tG8YXONQfwwo6wecRJnAmrm62axNkMyT1Vf5K9sKkj1/OD1TGdKw+zw?=
 =?us-ascii?Q?GBkx5DwmB4qNm0pdn3O3qewsE8EER18U0IrlLsGPMo6XO7ZokqLToEjqWBkb?=
 =?us-ascii?Q?h14EmT4f6dLx5sYUzE14ixImsguzWmrBagVcyarw9vws8FHoLOvm1biIP7Z8?=
 =?us-ascii?Q?sdr9EAhD20Q4Rndh+GN6020cCJ9fxa/NE/9iR0sXsOHv3ALFUsa8IO0l7MR7?=
 =?us-ascii?Q?zlmZhh1qGiBJvDMo1qO89dYKhWP2kOmmLUNNwy2qp3NZxHyuObWxdTHAVe3l?=
 =?us-ascii?Q?PYx8+wvROukHrNEPbfWfyyiWZnD9MN323Uc/ZFoAtbxS5IK7JlSFeROhyMo4?=
 =?us-ascii?Q?wzQqKYUW+s9em6fCXJtUB7Gp+RJiUWBuOuYAHD2DZmHVhX5aKTYHgjGvAyOv?=
 =?us-ascii?Q?LeR4GxSsoTpT7oCaClVT2hWM/SEO7iNXiUOipsDGtvPRxil9wUYpNtnDKKnV?=
 =?us-ascii?Q?StQVlEhBHvLz27AnY+dKbOOaEg+1kzcOsKhGH4xD0Fa6Dt9rpxjy4Fg/VhGf?=
 =?us-ascii?Q?7grs07+fP/8PcvY6ddTgFVQ/tjSqQle6Usobg0KQHMyizs6LErHxZ+ZWC0GL?=
 =?us-ascii?Q?ACJd2A21GrUf+/uYYMsI7S+87YIgcWHprISI1XPsiJPMAm9ewoKvhnXkmAHr?=
 =?us-ascii?Q?HGYUHu9yhhW4Qt55lCQQn/i/OpgpEJvbb44rpOEntlsxmfgidJQg2psLudv9?=
 =?us-ascii?Q?WEQm51vYRzYf0hFpbuVIa4usmWDO0zhJeqZOyl/SJxJ/MtvkcXEbTZTUbuC7?=
 =?us-ascii?Q?T4CFGFmXjKAc1Z9rc1wswLAEaEvq9RXjMnZvEe3A3pcMTAxlfx/4ZcxFdY8Q?=
 =?us-ascii?Q?kX9gpbd2yFJX/5CQ1KzSc/Zp3Fgyx+02/avj2Ni4GxQ+BfWmlY6Re/3YzfDF?=
 =?us-ascii?Q?ZPwDHW35BvZvdeXxPmh3q4u1HVwyb/8Sg/mb9K4O+CgUL1Ofg+LAHAak+zbK?=
 =?us-ascii?Q?lMh89gL0gYahjFR5HrM7iYcQJ8zMK2pdWNGHmkaij1XWdHGQj+nEWj7A3SkU?=
 =?us-ascii?Q?BaVb/q7z2Zw/QHIsT/KwUEKZ+pjWczzStyjKTyLmwcJilrKKqwI3RzWi7czr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	jMZBZUYGi/xXNwSmv6DxrryjXONMvmW5E3lXx/9pga3uFNNKMGCcekA00vpAhRLsf61VN6PEKEC5tGgqixckjSsCoOY9qEyMIXmnPC9UiBPmv7F3PIumquTSL963d4qWnzJLFCLkq6P687RE+0JleB0w3/uDSCjJpOX9jQli+gPA5D9CbdWtmRhqUkYYaW+GW9j69ODKFSV87oxdEhxIDjA9F3aqG/++BzYFjlUZ3TUzNMiNPJ+FgyJmMWmyTDr12cwDw3/w7oRkTGda54XP+d/q0q1IRxuv1kBbuoKZQ60X1U4/m7/xMakzJwk9x37132pSthj0K2+JTrKZyUne5ChQI9+whX9h1xWmwa6jAaIPLib7GUgC4FHlIe0WQkWWoJgbCUnyG+jGrREnKjOCUYkM8g/8h9f1uHB8GczTdfkerlPVA4dCEbOuzEYkJGEaH38b4WoWyBrIdA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2348622d-0be6-4789-163b-08db82f3585b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:27.6387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53faYchIEE0T07rFnCHPMmwKz5XKWpcAl01VbVXbkBCemDRM6qWsBSnB4KtQSkbYnxa2WVxHUqAoluEKcPDvyqZgSSh437UQbYDD66Welms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-GUID: CS4pF8UlSnJwSizMZ9utcseGR2h2D3Xb
X-Proofpoint-ORIG-GUID: CS4pF8UlSnJwSizMZ9utcseGR2h2D3Xb
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
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/Kconfig | 69 ++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 5b39918b7042..40beaf1f3d73 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -213,6 +213,7 @@ config S390
 	select HAVE_VIRT_CPU_ACCOUNTING_IDLE
 	select IOMMU_HELPER		if PCI
 	select IOMMU_SUPPORT		if PCI
+	select KEXEC
 	select MMU_GATHER_MERGE_VMAS
 	select MMU_GATHER_NO_GATHER
 	select MMU_GATHER_RCU_TABLE_FREE
@@ -244,6 +245,28 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool MODULE_SIG_FORMAT
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	help
+	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  This option also enables s390 zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
@@ -482,36 +505,6 @@ config SCHED_TOPOLOGY
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	def_bool y
-	select KEXEC_CORE
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	depends on CRYPTO
-	depends on CRYPTO_SHA256
-	depends on CRYPTO_SHA256_S390
-	help
-	  Enable the kexec file based system call. In contrast to the normal
-	  kexec system call this system call takes file descriptors for the
-	  kernel and initramfs as arguments.
-
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool y
-	depends on KEXEC_FILE
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
@@ -733,22 +726,6 @@ config VFIO_AP
 
 endmenu
 
-menu "Dump support"
-
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	select KEXEC
-	help
-	  Generate crash dump after being started by kexec.
-	  Crash dump kernels are loaded in the main kernel with kexec-tools
-	  into a specially reserved region and then later executed after
-	  a crash by kdump/kexec.
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
-	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
-
-endmenu
-
 config CCW
 	def_bool y
 
-- 
2.31.1

