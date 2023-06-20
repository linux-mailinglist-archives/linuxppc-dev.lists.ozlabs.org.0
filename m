Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D125738EF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:38:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=g/YTsHhD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=k/V9wS7x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXLr2rBKz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=g/YTsHhD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=k/V9wS7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=joao.m.martins@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 36175 seconds by postgrey-1.37 at boromir; Wed, 21 Jun 2023 07:57:04 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm0pm5L3jz30dm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 07:57:02 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KBivSW029358;
	Tue, 20 Jun 2023 11:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=wkhyajIKpQidWQhCnm2a+HPlxj1g70Pcq0Piz206vT8=;
 b=g/YTsHhDBEVXelrgs8esIz9JgMZLpl/YD2ufuSW/SHA0WEUkz5XebfJ3TOyV5EH2s2Id
 wcqN6nSUKZ1q/UxaMrPmIAKbcYPXt0Gwd+XGs4neFb+Yld+kJLzE6qMbCSs56W6dwH0k
 40KR3/Oo9o2c7Gq1RQUxQJr6pt60zyDIy+yuYeHL5YI9t7w7HRmUe+8IWv+N0X+TRlNp
 BfwK3LmubfIp92DPWYIBVx+eGYTsThxRq6uUnsx+7wexe9UpPYNZSIQbIUN035kbSvpz
 zixSgTKHgV0g0gFKd5ioc9DpfXoxquAuLEZve2gwj03eMXKpIqAckWPFjFK1aOX3lPY7 Lw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r95ctvemc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 11:53:41 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KAv5av028861;
	Tue, 20 Jun 2023 11:53:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r939afmua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 11:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z34PUHwdV9EM3RPD4vmI3Psgr20WPWZcnRAddyt0MrMIGUSdEQ/3CLSybe1zHP6j8143YOrgNCsVHEgruHCf8dlv+JO4A4IL2lIP667w8muHMV7AHCjEvPlG4+dh3JdE3pEXcwu5kXbeA6oRUU7F9x76JIiXF2a29UW00QN6EfzaY9W+pKfk0a8eKI2aoELWTdMQvp1rosX57Yh4w1NGhEdjvtx8ai7iiAGCx8ODotlQPKMXW4l7YRwY1Zbdwal7IYuR/sVhWYGV7ecEOiITMJ1tC+eutJ3xNN/11AlSkpFqjTbCjgDGalD9g6cu84FYE1eRhO66cOuHd34d1AkkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkhyajIKpQidWQhCnm2a+HPlxj1g70Pcq0Piz206vT8=;
 b=fDhWGreBnGAONpbDvMFZ1jGaQ5er3JJ6srVa72sQDOZdr4taI+9zpFzxIN2y8quRYmUy+0tPmZ/cT6mUkFH//t1fHSrORc/365Dk0TV3y4XfBYQBAq/JDtJFSo1AXFdOZZztRyvOT6Oz95px6yGRYrg/m6iCoAyYBHqYz1ovuHGv3d+/DXpbCEteCs8+Wzj2mGpxeEQ6Ukjvt+uJVjpI65Lx3myRY7u0uLltmRHrmmsNe3MkOrfEIaq2TIxa9RcHP1Lx5glrvCYDeB3S3rUGeTeyCvHsJmIZnpTYCRTddEKGvGkcHa/CIfJXq3I7Ky1RySFpbXtbqlM9EtHIXNH+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkhyajIKpQidWQhCnm2a+HPlxj1g70Pcq0Piz206vT8=;
 b=k/V9wS7xI7eMIHmD7avDDrKNmawG8ojp9MznUv04lhueJRig8RmbKWt17w1XqOJIltz3sSFgGlBmpiD4tjBS/B/JS1qqdX6CKQwzF6v9GWSJ+247JnQUju9y48+XfIURMvnX8L073QVW9jGJDC4aFs0USUy6u+CqprRyURLhKZo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH3PR10MB6715.namprd10.prod.outlook.com (2603:10b6:610:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.30; Tue, 20 Jun
 2023 11:53:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::f7ba:4a04:3f37:6d0f]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::f7ba:4a04:3f37:6d0f%5]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 11:53:37 +0000
Message-ID: <ed1057ce-2d8d-1053-9f54-2801cfed9de4@oracle.com>
Date: Tue, 20 Jun 2023 12:53:21 +0100
Subject: Re: [PATCH v2 08/16] mm/vmemmap: Improve vmemmap_can_optimize and
 allow architectures to override
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
 <20230616110826.344417-9-aneesh.kumar@linux.ibm.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230616110826.344417-9-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CH3PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 52734da2-c048-413e-c37d-08db7184fb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fm8T0OEY/I5Z5gokUAuT8TXbKjuXyN/mIRqdu7SDb7QiUkBz/BxPVFgMPd34jL5WWn3VCEHFUlqRgK9l2qxJpABSZTQ+gOlZQgVlKyPjBOuogdhtIVZxUjafcZD/1sue/hQkWmU4nZs45u9mBhwyelzYkh9gar4S3K52+Obd64uYap8wiXMpMnRi+BemcvGSS8aE3t/MUoFqrJqKDRkSBvhrlE74vi03i3MJImQxnTup1FAzTmUf3nnUivIaC3WVDFT3RG5/isyI+rpDF+zIMlGuDZ4zK0RWcwclQt0vUkO1m7ymkVn0x+lk5xawxAURDz2daHQr6WJWuwXuN0lpBZS6lz1sPUtJe7m3U+PeRouH0mLCCIDUAembyhY33ikuF4MPgqukK9LCtmocFxfF21Sg7UJJPnswtZ/vxmYdgERch60xHHEcnZvTDyiMmcPS3G0oTYoqdMSF/n+ZFt4E3leWsi/fxuek7/BUDUs8rrO+Bghjv/eNMuIneSWz1r7oT5320vOl2WPSCd2SJnUv+HV/RNDMXsHu6PhU4mP3VcJ2PvItoPbvzreEl8V0f2xCl3frDuneU/NVraRs2GGVAw1KOF+qS5Ct162T9cnPuINeP4hCwqZz9m4QsNlDo7HQ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB4835.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(83380400001)(2906002)(2616005)(36756003)(31696002)(86362001)(38100700002)(8936002)(5660300002)(8676002)(31686004)(6916009)(66476007)(478600001)(66946007)(66556008)(54906003)(4326008)(41300700001)(53546011)(316002)(6666004)(6486002)(186003)(6512007)(6506007)(7416002)(26005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cEwySU1VOTJEYzNObnJMM3VRNDZMWkFFUDNOTkl2eHAyekp2VEIxUmErUXly?=
 =?utf-8?B?N0xSejBiSElOTEhjcnJHVi9uZ0VOVVRPeXYyUSt2dXdVWEppSmkrcklVdzVw?=
 =?utf-8?B?alp5ZUlETGFoYWxrRXRHeTJyMEN4ZzFVMkFEQ083cmpqTkVsV2tWSlpETWZl?=
 =?utf-8?B?ekx4SytUVzQrQ1g5YUN1cGpVOTRYV0gybDhDS1Ayc3lVZW03cUgwVnRjWitn?=
 =?utf-8?B?a0hjUG5VYzJaMnBJdzNlKzBBM2wxcVFDUWJGOGlITS9SeHlxbTBVbkY2OVlC?=
 =?utf-8?B?SzYrQ1hoV1dDNXNXclFWMjRiUEV0T0tLSzMzVVdVSjFHalFpZnk5b0t6TE1S?=
 =?utf-8?B?ZDhZZXZCRk5yU0dCdUlDZFN0c0IxeDRpTU1OSlBHdlo1TG5henMyS0I0ZURt?=
 =?utf-8?B?b2JhVW14bDFsb2liWnJzR2VXTXNLdCtJblVxRWR1b1B6aUhzaXVVaDFyOFJj?=
 =?utf-8?B?VkZpWHVOeTNCNnh2RzFFWWE0Q2llditEU1ZlOSszd3BnMWRCWTFCd1hLcVA0?=
 =?utf-8?B?M1c3SzNidlFWanEwdGN2S1p3R0lxaXNOZnNySUFFMGYzZUFmZjVxdFBVQU5V?=
 =?utf-8?B?MjFPbFh6elNia1YwQkpSaVhqSlN2VGZKeWxrK1BYUnY4UmVnb2lZYjZPRjZK?=
 =?utf-8?B?cS81Y2FWNDEyNndZb0V3YmpkQ1Ira1Vtb1JzOERtYkxVVkhiaU9aMWJtYVIv?=
 =?utf-8?B?Yzh4RnA2RUVVYUdydFpYdXdjKzZ0Q3hnbldWaUxjRGtDZ2wwNFFUbnJZa1Uy?=
 =?utf-8?B?WlZVMkdtN0l3cjBTOEJITHNaaVAyQ3BkbFpRSTV3WStTMGttSzhhRkJsdVF2?=
 =?utf-8?B?dS9XT0R0MlhWR1BiWENPQjBEdFhBbFRWU3k0VFdLTWRPVkVKUDJaY0pnVnRz?=
 =?utf-8?B?Mm9MN3EvTm95anNBdjg1dFNvam9YSU9nUzAvZTkwbkRRVGdDUHQvT2lTTTc5?=
 =?utf-8?B?SDdDa2pJakpQL3d1bWtUVklwNnZYclByeGFQdFFHTmcwYlAya0htQVVlVXdL?=
 =?utf-8?B?bFZHUzE0aTBBRjRvUmdxUlNId0E5bjBlRVNXWmhmQnhwaU5QWFlMNnRwek8z?=
 =?utf-8?B?WVAzT2I2VURUT040UW1jcHgwMVBWVzIvRlZLZUhFOVd2eWNoNjNITXVVQnZQ?=
 =?utf-8?B?NGp5ODJFNlptNXpRZGY1SEUzdVBWZ0tib1NEQkNSZ0NISDVxZjVzTVRWNml5?=
 =?utf-8?B?aEg1M0p0dGw4eG5DNE5TNjkybGpDb0VVRlRxaWhyeVhKSHVMZ083ZGx3bXlN?=
 =?utf-8?B?RFdBTWNLNEl2N2g0K3V5ejExT2J1L0k1MlFPNExST1d4aHlOWnR1Umx1STY4?=
 =?utf-8?B?UFo2SXVZdmZXYjBibUlZSGJ1cUlXRVhGZURTcTAyUmxTaEc1dTZkbm43czQx?=
 =?utf-8?B?UkFrc0lvT1FNNktMYm9oS0diMUVvVngyOTFYSFBpcFY5T2Q1M0xOQktXMUI5?=
 =?utf-8?B?Vm5tdG96USsvODQvM0tkcGNFRTdadWY4ck9Ec0xNcUlpRkRJalFBTU0wUG9E?=
 =?utf-8?B?N0FTU1VXNk05WEFIRWNTU3M5RWo2cENIaG14K1VvaXhYWnVrRFJCcUwvSkJl?=
 =?utf-8?B?RmllbFFLbUdDOTJRODJaZmdSMzdidUllYkFxNWpzOWxwOHNTdjE0K1Z0SWZ6?=
 =?utf-8?B?NiszQW9MSkZlMXJwa2tYc3dFRDhmbURvREpLZFJPMGVnQmNZSWR6dXVxN280?=
 =?utf-8?B?U3VXK2JTdGlzei9hcFZ0bU9KOXNVQlhocTNiV2k0anpKMkxOTWg1V1ZDMTFy?=
 =?utf-8?B?clJ2Y0lKTnEvS2d6ZVlFM1ZVaFIyeml0NFN0cnJ6R2FFbmREL1ExMjk3NTFC?=
 =?utf-8?B?ejBTVEJsVFNPRjhianZqOGJMaTAvQy9XTXJrMU9aVk50OVZiVnNKeUlLU2pR?=
 =?utf-8?B?MUNLRWtmOWtxM0lnckY3OFlNbC80aHJabW1IVjdRRUtOZ01ZdWQ1M3hpS2xK?=
 =?utf-8?B?cmM2aGhVUU9kYWRCTEk1QWMwdWp1eFNPWjNtUC8wRi9EU29ZQ0FyRUJpV2p2?=
 =?utf-8?B?S3huS2thY2FKaTFtVnlJNzBqRm5TeXE2ellxOVdsdzBmYjNRL1RoejFyOWxn?=
 =?utf-8?B?SkppNWRsQlVlbWR0K1JtM3owWTFad1d3Z04waEZZM1ExSDdHQ0xuYUtZUWxY?=
 =?utf-8?B?Y1BXejFVczJwOVdncUxkbFgwbmJLTmU0WThLNFJ0ZHk3d0VwSk1XcHhGeks1?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RUhNMm45bCtOb0FvNUYxTWE1MkgvaE41Nm9vbnlFMXhSQ1hkclNGVjN3U2Z3?=
 =?utf-8?B?TXVqSGxHaFVHZHpJOC9IMlh6L1ZqRWc1NjlxSEFMV0dkU1d6U2s0ajI2bGNa?=
 =?utf-8?B?SVdtcm1Vd2l4NUgxVzFpZjYxNW95QkQ5SmpRRm5qSFo5YmU1eXlkN3dKTTQy?=
 =?utf-8?B?TTlqMWlwZEszaVE2M25tcUdPcjNDUGRLMTUxQ3JCK2oxb0ZZVjFNMUVLRXJq?=
 =?utf-8?B?SWlVWGRqd0NYV0RCK0w2WWhMM3FEa3ZuYlY4anJsWGVIMytzK2N3UzlPU09Q?=
 =?utf-8?B?c0xBVkxPVSs1NVJVZ1NHV3B2ZGNqNU5kRDlEWjhBNDA0ZXF6R0hwcU0vU2N3?=
 =?utf-8?B?U2d0UlpZc1J2OXllMTNTNnNHZERBZk9YOGFhY1RUWmdhc2lFamN5RTkrR0Nx?=
 =?utf-8?B?VENSTytXeXNmVUV1NmJWZkFNTmlxVW9pSVVVWUZ3U0Yrd2VoQ2s0N0RGVGhW?=
 =?utf-8?B?TTQwYmlqSlNGK0owS2lOT3JkR1ZBZmVkcUdHdUVFWk1Na1Y1WmxLZHRsRUtK?=
 =?utf-8?B?dmQxNmJhWWRHcy9qM09ZYkxJNEl2WFhKSXE3T0prMW5NTCswQ3dkSkpvWjZE?=
 =?utf-8?B?L2QwVVBDZEJPRDZIUFdCQXE0dGxtOXBrNitLRWo4VFFGdWd0eUs3ZDlwRnBm?=
 =?utf-8?B?VWcrRGdxdW03U3N5cWJsSzVMVkZQcXFmRE4veVd4WjdrTUcwK1pqVDZLRzNP?=
 =?utf-8?B?eXZ0UXhkVDRmUEJNMisranVqZ0l0R0VralhpQzY0WllpNlBJdUZkayt0eDhl?=
 =?utf-8?B?cy85YW4wR3pvN2JZMDJxNE9VM2RtN2NUSDIwVnU4TTBMKzhyODNkM1J5WDk2?=
 =?utf-8?B?RDZiNDRUcGNMczcvUDI1emdheHdmMndaeUZnd3h4MElYZkcxVGpVVk9zNG8z?=
 =?utf-8?B?dUJkRVdsV3ZRUU9mUVVmai9QV0h3dk9tdTJsaWhuRXJWdEdzc3d3OXZqVzVP?=
 =?utf-8?B?bnFNTE01enVjM2lWYkpmOWx4SGZTV05WOE9pU2hweHhBaloxSUpGaHJHckNt?=
 =?utf-8?B?RmFXci9LQU9FMWhFcHJad3JVOGx5VlZWVTRORUN6UUJJbW5hc21sN2VFTDAz?=
 =?utf-8?B?bnN2UGVwMExzTy9ocGdoNTFqcXYrcTR5USt1MzNJaVUramRMWkRFRGViMXFB?=
 =?utf-8?B?NG9GZVVreXpzekF5N1NFY1JRRGdCdkx5RnN3RjVWR21ZZG5wU3JxdzVzUDVE?=
 =?utf-8?B?L1Znb1hlS3c4UGluNWpaNU80dDJMenVuUlkrcHgyb0pLRTVMc1BZMVl1N0Zr?=
 =?utf-8?B?SlN0a2F4WEFzWW5ocWo0cFg1aHJ4TWVqSWwxMFN6MnA3WmhSNHg2WHV1WU5v?=
 =?utf-8?B?UWlEZzUwbExtTzJmalg0Q3RIaUw0SEsxVSs4ckMyMFE5TkRIS0VsbTFMczBs?=
 =?utf-8?B?WHg5L2RUYXZSSGUyUHJpTGFIblZiMDdkeW5zdTlXaGZJUkllYm1KdnNXVDYw?=
 =?utf-8?B?TEM3ay9JUytDYTBHcEdMd1J4OCtCVlRSbW5wdit5QXZpdG5OdnNXWWZXWU1K?=
 =?utf-8?Q?4gjsp4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52734da2-c048-413e-c37d-08db7184fb3c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:53:37.1349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vA8ZrSoV1Mk9jM+Cqnt+aORfZlGZPOpVG3RZzmnbwJDWnVXKolFPvR+yuUUJa79pzRfWpuZp/1VMx6YXiqxz8AaGS7+YdwnhAQdWfGdWYtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200107
X-Proofpoint-GUID: HnYGxkVA8H3BUOwt6gDkl1mDQfupx4Cn
X-Proofpoint-ORIG-GUID: HnYGxkVA8H3BUOwt6gDkl1mDQfupx4Cn
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, npiggin@gmail.com, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, akpm@linux-foundation.org, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/06/2023 12:08, Aneesh Kumar K.V wrote:
> dax vmemmap optimization requires a minimum of 2 PAGE_SIZE area within
> vmemmap such that tail page mapping can point to the second PAGE_SIZE area.
> Enforce that in vmemmap_can_optimize() function.
> 
> Architectures like powerpc also want to enable vmemmap optimization
> conditionally (only with radix MMU translation). Hence allow architecture
> override.
> 
This makes sense. The enforcing here is not just for correctness but because you
want to use VMEMMAP_RESERVE_NR supposedly?

I would suggest having two patches one for the refactor and another one for the
override, but I don't feel particularly strongly about it.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  include/linux/mm.h | 30 ++++++++++++++++++++++++++----
>  mm/mm_init.c       |  2 +-
>  2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 27ce77080c79..9a45e61cd83f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -31,6 +31,8 @@
>  #include <linux/memremap.h>
>  #include <linux/slab.h>
>  
> +#include <asm/page.h>
> +

Why is this include needed?

>  struct mempolicy;
>  struct anon_vma;
>  struct anon_vma_chain;
> @@ -3550,13 +3552,33 @@ void vmemmap_free(unsigned long start, unsigned long end,
>  		struct vmem_altmap *altmap);
>  #endif
>  
> +#define VMEMMAP_RESERVE_NR	2

see below

>  #ifdef CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP
> -static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
> -					   struct dev_pagemap *pgmap)
> +static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
> +					  struct dev_pagemap *pgmap)
>  {
> -	return is_power_of_2(sizeof(struct page)) &&
> -		pgmap && (pgmap_vmemmap_nr(pgmap) > 1) && !altmap;
> +	if (pgmap) {
> +		unsigned long nr_pages;
> +		unsigned long nr_vmemmap_pages;
> +
> +		nr_pages = pgmap_vmemmap_nr(pgmap);
> +		nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
> +		/*
> +		 * For vmemmap optimization with DAX we need minimum 2 vmemmap



> +		 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
> +		 */
> +		return is_power_of_2(sizeof(struct page)) &&
> +			(nr_vmemmap_pages > VMEMMAP_RESERVE_NR) && !altmap;
> +	}

It would be more readable (i.e. less identation) if you just reverse this:

	unsigned long nr_vmemmap_pages;

	if (!pgmap || !is_power_of_2(sizeof(struct page))
		return false;

	nr_vmemmap_pages = ((pgmap_vmemmap_nr(pgmap) *
			     sizeof(struct page)) >> PAGE_SHIFT);

	/*
	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
	 */
	return (nr_vmemmap_pages > VMEMMAP_RESERVE_NR) && !altmap;


> +	return false;
>  }
> +/*
> + * If we don't have an architecture override, use the generic rule
> + */
> +#ifndef vmemmap_can_optimize
> +#define vmemmap_can_optimize __vmemmap_can_optimize
> +#endif
> +

sparse-vmemmap code is trivial to change to use dedup a single vmemmap page
(e.g. to align with hugetlb), hopefully the architecture override to do. this is
to say whether VMEMMAP_RESERVE_NR should have similar to above?

>  #else
>  static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
>  					   struct dev_pagemap *pgmap)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 7f7f9c677854..d1676afc94f1 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1020,7 +1020,7 @@ static inline unsigned long compound_nr_pages(struct vmem_altmap *altmap,
>  	if (!vmemmap_can_optimize(altmap, pgmap))
>  		return pgmap_vmemmap_nr(pgmap);
>  
> -	return 2 * (PAGE_SIZE / sizeof(struct page));
> +	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
>  }
>  
>  static void __ref memmap_init_compound(struct page *head,
