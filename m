Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98310806535
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 03:43:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=FaNY04CB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qJlhHFwU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlMCp0Yz5z3dKm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 13:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=FaNY04CB;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qJlhHFwU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2776 seconds by postgrey-1.37 at boromir; Wed, 06 Dec 2023 13:42:48 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlMBw0DHkz3dHc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 13:42:47 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B61XpME027556;
	Wed, 6 Dec 2023 01:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=mKBNJ1UosQo4FdJEiAipSpLPoDtCdOS/6jbRXjr1smo=;
 b=FaNY04CBVWHlwI7qyFGiomRXCyeVd0MhesKRFcSJIuHdWNE/0oWOR8tuuJJcbzwVC58S
 Tsy0I5umTPj6ulOoS68y9Vgslx3Dv6QRD7FcYhlLnrhtQnipJiaFZ5kDczO8Puy6CeOj
 L7WGmfxGFWzxCvkZIjzw/beMla2QL5DlFtxaTjlCoFFTALgtftimFdnLW5xKuehTCyWY
 /GUxrrqYzNUeepInAPwXHYPn69YYvS6qIK/V/0Ed8jMTXzKUzGHOtGR8IrYfBzq62fg5
 +GbnxDaVOP5qZEZjr97pz1Y7EbBPMmOqtYO9XR9tT/ffq2O33npKwLuLS+rlhbyxleUU TA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdrvg3y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 01:56:15 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B603KQ5039778;
	Wed, 6 Dec 2023 01:56:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3utan540av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 01:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHtALII0z2SSvghpWoWUdy7vtJUZd/zM/LXOiWGEqM1gEUlJcZOux5iq5QvpD2Gz7rAVfNbNP3YaiJOlZN7hrEt9g3bdxJItUMRl3YkrE8JclhKSXOeERwC+fyW3G5ElgrKMjbE8Fb1t7fv5p5AbN++mexhkvh2ulkRiupcgKZZN6N1hr94smZg49REOgI0lz7xv2SZPHFLyNbu5QsC+GKLA+koACfv9aIvwWNdjeE9e0QCRvyzu3MXB4Xk5dqMwOLRgSHet8M8nteoi75PeAU7OoiPSXSODWBS7wUcZ5vdCg/S/vzWpOPc5HU4Tafz+ZU+lNNpVVvjMhFgoegrAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKBNJ1UosQo4FdJEiAipSpLPoDtCdOS/6jbRXjr1smo=;
 b=ieW4kcQIVwk/0r9ABP9bmE5pIeZ+CxXt8vExSCUTRoYPZUZHls+DwDcdQLaOLgMrTRX5rjcyiDsD0aAueTEadsZEaeTblT5BnHkVuPXeHWKpN4YbKLsBhKw/vo5pRYa3UuYqwUg6MDEn6WjoCfYD7aWrUUUo42MwkYJThVKg4ZagabldgAbiwBmvz9daRydmGjnZBWMtz9/l2mGUFPvjW5QxOlgh851JLeOFnQyqB2xZCFiRhoeatQqT+XpnzT4Hc//ua/3OA4fS29F7PyklZFuehIpnkQ6pLX4YVtWGDnxs7F0EPbVbeItHsa63kKM8vVfZuuPl7N+C/x+rwVMYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKBNJ1UosQo4FdJEiAipSpLPoDtCdOS/6jbRXjr1smo=;
 b=qJlhHFwUoXjyzmlZ18iiXUU8LWYzm2Ac1sm/lwIeLu/7ppvTYcGn0OF/j4eJHvJ3d1o3xP6/982Obwc5aeepefR5dnFD+PFKrE6K/Tq6teQa192gEZg8JUchisfc671TT8riBY9+R9ZH4MCgEso8qWh9zKvOfGFKEM/DfVfc7S0=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CY5PR10MB6096.namprd10.prod.outlook.com (2603:10b6:930:37::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Wed, 6 Dec
 2023 01:56:12 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972%3]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 01:56:12 +0000
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] scsi: ibmvfc: replace deprecated strncpy with strscpy
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1v89cnlg6.fsf@ca-mkp.ca.oracle.com>
References: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-v1-1-5a4909688435@google.com>
	<202311301311.717549FB@keescook>
Date: Tue, 05 Dec 2023 20:56:10 -0500
In-Reply-To: <202311301311.717549FB@keescook> (Kees Cook's message of "Thu, 30
	Nov 2023 13:12:48 -0800")
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::7) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|CY5PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: fc83e938-61ce-4101-18ed-08dbf5fe860b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DybQHsRnt0KeSDlWopMwXD9L4wZADDVvyfa28kDzOsRzDZ+1mMIi5AkRPZSsmOZdJ3T6ZKy2bsUqHYJBZxgXHFJ28F6Ba+8EmCr/0tk/AiVB9He0wLQuon+kl0ZrFHRvdqKvdEnCTJCrd535U3t8oXh7skdYUGCN4zxeOE6LJ+DepqV2AX3uGtLP8M6fzSoCgVOtm/MPyGQUubFUgEUraDkaLwbwHVFym5bgpoj1R60QKPZTK3x4hbQH/giiiD4GYRS6myrvGnU+uj3v7CXxwGPgvR3ykzZKB4x06/47donEmdFJlUiU/ABGOa4S/B2dS9B8k+z1H7w7OXFwJfKCC/lv3iKuRMUVdXl34m96HjPUwMkMgy5fxgUe9oBCSoXJUE3rGcRWGdUQH6ctWPdmQbyuDMB3vgomxzFDdbx4XCWZGvvQSB+XA5Y9o1b3j1GaaKzKRejFB8ya45VHWD+bz9rHLOBT8gLaPYeQQF+8LK5arUO4xEvumkwPf/qF52kxeVbKvrCgYO1IyjHhhBJTkORbIz3yhiQlsWN1eiYGIsVSW/aJMgmjnkk8wKdDzWEPTLXS6gxjPtg0A7gdmUsBrwdeTkoOPbWZDfQUm9hxTsub+TjCtbP2w5Uyyl0IW3AC
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6486002)(8936002)(6916009)(4326008)(66556008)(54906003)(66476007)(316002)(66946007)(8676002)(478600001)(7416002)(41300700001)(86362001)(4744005)(2906002)(5660300002)(6506007)(26005)(38100700002)(36916002)(6512007)(156123004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/PcasLxYPU3ozvW6EyQJJRT680QVErq7qkEWKHamGtz20bC3xKeCQQLYThK6?=
 =?us-ascii?Q?jAt+gCtnqAl+J/eNr7GiZmDgalioeu3bJ5jEvCEBU958ZiqXE1sX9L9BGngh?=
 =?us-ascii?Q?etcSr5mO6RS4vEVDEQajr9MPmXTdC6ysHR/xV6Y5q16IaFhbuT00vfUIarrp?=
 =?us-ascii?Q?n9wWEw09waFdBvvlp/9/P486lkWpK9pBMstjduy3xraVthJQB9c7recnCAIF?=
 =?us-ascii?Q?GtcSOkT1GKm2oCeMWrS3dyDNx8mwU0r3Ou/R1LZ9yLDL7kJcsJipHuRyrdoQ?=
 =?us-ascii?Q?/897tUvtYyGJjfzaw8B/l7f5x8AO+ITM8R6iX7hQyWuGFUGVGQjzPbQta0yv?=
 =?us-ascii?Q?aQiryq5lE6HE2JZFP7n99WvDY2Fi2bs3fA9kM2UpQLp3p4cNJCIhQgIA0aZJ?=
 =?us-ascii?Q?amvwDVLElSRxEPrOPcMP2fSyuWWi7+fW+fNVQLLLpRPKKVoArZH9+rc6/8nk?=
 =?us-ascii?Q?XopiECUOxDsQNqsjHFyhak0mgKJgLe12KipL0kOHofPrrb09FBpxQ9aEXyj9?=
 =?us-ascii?Q?Lnk1KSQGHPYXXqwvZ8n7K23kv9pGfBVkatJVgxBO1bZMzeL8W7yqZJWCVE7c?=
 =?us-ascii?Q?ADxd0ppxfBbaqIz7Jj5BSqLoqFhpWT2/zYTxxRquEOK4JXvg4u4y9K4yBkGI?=
 =?us-ascii?Q?ekaL5qsXdArHj98N8XvQy2uzd5AVE7KQJ/AepoFmL7egvtDl40h9/tNNIrab?=
 =?us-ascii?Q?qlG+wpoQajeckBqd66oPQCIWn6xGytGVmzTjLX/Jt9Q59nU6gkq4WNPhlPC8?=
 =?us-ascii?Q?6ymZ3G2sE07gWwi7WZBoCSyJB6co9vrvyGmP6aeFATK4OcRz3uy5gSC0UaI1?=
 =?us-ascii?Q?veSG+NK/UV1qAA4bBo5NXVEfswSp251+gzLxpTS43TQwpkPYr++/1Nf9A1zu?=
 =?us-ascii?Q?2PfqN8WDaoo+Kwf2ckUQ7iuZ3mAuhatxr/fIhoMEvPXN/3ob+2BiVtN+KuEd?=
 =?us-ascii?Q?HD6Lo7KeZxj/ENqcHpaCk7Uii0rW2eCyDhrKvYpm7eDTsR1fOoDsqFrxSxwu?=
 =?us-ascii?Q?Fwqi6FdeAg/BiVJzipIYS/2z/dLzBtwNmL3e3Em9v0KOpFWdikhM42gTxfdM?=
 =?us-ascii?Q?blDombO+wlIcAfCwIO5CLX2p2KLtWe5xoBOvtM/G5e2IeG0/Mrc/gfK1ABTE?=
 =?us-ascii?Q?r6s+ptPBRptPw2+8xaHkHn6Z1Jjn9swBrUbgtuf1T9JWeR14iTai41EKGbz/?=
 =?us-ascii?Q?Fvn40NtsBg4Xbge0neGsZFbjpHuLDyWX7WJhVENTAonqct2aiLAVJ5+yFllF?=
 =?us-ascii?Q?iq49DGZBc+JSfo2i1+R4xUjAJhHOm28XgPsyM28XPTrLKdcB6Qq5F0c5gDtM?=
 =?us-ascii?Q?JPrHQ4c1J+7OlJ9HlN6fV21VySbryVyRqPPCVUtSxrYGw/1hmUPSlYBUmKu1?=
 =?us-ascii?Q?eEF+ZBVQwb+vqyYVyom5zpYDVG7Y8X8DDwj3eBnwXjzAuLYh8DXc8hKxtxUg?=
 =?us-ascii?Q?re2a/dPlwFQBcnhYc5cMNR5K1p9th753EQ8nNMCJjbpMvYuSRhi7qeklXqox?=
 =?us-ascii?Q?y4j4u+PDlP/KQELB3oTJ31sor2/tdhLA/1C+Sje1W9ywv4v/bBXUDOanp+Y6?=
 =?us-ascii?Q?qvQ2GbOz3WkjcpFPKgFdrbWFW9cRHgOQ5d2BAFsOGRvkJtWqiDUdFr/98rUO?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?DTQzZOnAz9NBQWQz5LI45ZqKvU/PAXowRGSRammwnJ1qltCEL8ockEGrxFjO?=
 =?us-ascii?Q?/t8KGyF5bcCDCWrw29+XVGKkiUnVrWB0bBMtrBIEq45Bys2vQn3jDYkKT83f?=
 =?us-ascii?Q?YsCYFjdv8yNh8kc9WylDlKCZBgGIqfn/XjMGkPWx10ZllRlouTB75nJLoN2j?=
 =?us-ascii?Q?+1Ky4r7d+w72za5NATj8yLHjzu7nRT+1TaN2QBZbY+D01IsjxU+fqlklvJRs?=
 =?us-ascii?Q?DLE7SCkUF97fLVxYEOwWEf8hKT8NUXKjag6CwgvCvvrM5vJOwMfrbCyLGKEV?=
 =?us-ascii?Q?jO6ctAQ52/CsRzATry79K9dacfSeHS8vD6nQ03DYQVib+Up0ozE7lRaFJiF4?=
 =?us-ascii?Q?eD0+NQ0SAgTbEac0DQqJ93Z9E7xNwlZ0j6aOFiM36y2NNXNPvulJJZPTt3mJ?=
 =?us-ascii?Q?aJiZMXgErQVmCO08yPKx7vfHqAJah8FKVSffZ/pPtbcS2UcT2crOcHZ9AY4G?=
 =?us-ascii?Q?KdR6X05ddprQ7HuYKdK99XPGgGpu3hbZKTOezxVrxMBy94z6gJ1Gp+K4nnAE?=
 =?us-ascii?Q?4u/6RSpo+8sWcbfpgjYwFislNY/s0fYpcZ36vXkHqS/ADN1PaB3dd+H98dw0?=
 =?us-ascii?Q?k0zEzyrtkEYZ9vIN1IXolE6TMXslh6USyz3N5/JOGCMiuHw7ZfHISyTJhGMJ?=
 =?us-ascii?Q?4wiuHWavi8eIpchD9M7m08baafVXjQDNXyNBseNZMQPmXmlrP9Nx0Sr2fITs?=
 =?us-ascii?Q?j7v5tj9e95C+Kx8d7mlGgFdVu2M4yDlM7txnhbnmITDwMpWAnRg+B8qoXqxd?=
 =?us-ascii?Q?Lfw8SmJ5iPKZr3VU9vfoxwVKBNNipRfdHkY2F8tavuPdZoswbN91EAkaJ7+K?=
 =?us-ascii?Q?n48WXRB9hZ3DWCj1cPUykOxgAg2Fz7xmghDA6EdsFHtw45fmjGmFvu896xx4?=
 =?us-ascii?Q?yXVk/QOzHYuSq5jEy7aFhGC+yrSYODUAapilkih3YwmPgGU8CIIDVk754xz7?=
 =?us-ascii?Q?1W9/cm57l2hSKlePmqsU46e+A74dF6SMNW7fpktgp0jfDuYbDPUHI51s+FCY?=
 =?us-ascii?Q?fDni?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc83e938-61ce-4101-18ed-08dbf5fe860b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 01:56:12.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18M+zS+3qG+/U36c+J+dLGQqdLDZb7Ua8wubyJePjuU6tSU4w15EPLdQQ/p4tVVZ9/FT8kbnMifRr6PLZAYuayTx6ugDFlcKSeptykFB8/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6096
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060014
X-Proofpoint-GUID: gFsAE0FaRKvkiN4D6WCACp-byxLXHLiq
X-Proofpoint-ORIG-GUID: gFsAE0FaRKvkiN4D6WCACp-byxLXHLiq
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Kees,

> On Mon, Oct 30, 2023 at 07:04:33PM +0000, Justin Stitt wrote:
>> strncpy() is deprecated for use on NUL-terminated destination strings
>> [1] and as such we should prefer more robust and less ambiguous string
>> interfaces.

> Yeah, this conversion looks correct to me too.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Applied to 6.8/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
