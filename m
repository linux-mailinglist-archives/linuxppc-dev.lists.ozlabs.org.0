Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D943A7C8D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 20:29:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=SR+qLsPF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iqmzzlxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Zlt4FVNz3cjv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 05:29:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=SR+qLsPF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iqmzzlxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 659 seconds by postgrey-1.37 at boromir; Sat, 14 Oct 2023 05:28:25 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Zkx3hsyz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 05:28:23 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DI4Nna020290;
	Fri, 13 Oct 2023 18:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-03-30;
 bh=eaNrGCo+b3j/2QXZ68UuMyTgs5Nrb2lqx40o3Rw+agQ=;
 b=SR+qLsPFfiBQxax7NIDlCA5YxL9reJHWWi2Ern5W5AhwQxsYr9rxqamRfTPSoGctZS//
 L07dtugLbruD74Ljv1MADwKXUkNH2sh68iZHnrzAjzu1JdDItt4gIjW49XZmcqdTzHLM
 gh5+3SU/jLt1/HEn5mbzTNXQgj1WdfAgXvJlJRxlv2DQXY4GV2v5Rk70ZjFTOWqy3MG+
 B181n+lI0lD4DMmNgUqjUWCfk1IuECcy17s9qoBms1XmDi4tc7voB3JPCvWLjJi3f/+7
 pzm2/wvBaUFw5aGze+XiBEzvvC5hfEPAYmyYNnSluGqC44PhK4urjWPS45klxmeGsIYc eA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tjycdwpvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 18:13:15 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGln7v036813;
	Fri, 13 Oct 2023 18:13:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tpt0uqwyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 18:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0Or1jM6Q6aDXw1WvjTk7ZNNYbYkHmUhuK4LbNqXZwGlt6cc08putzCSh0TGOifaNyIvMIdlPFGVz2DkeEXV5RheMvfzshDHLgnRX6oz+aSel36a1OD9mSjlHbH8bQKNQ5v0N1V2QEkgS9z3fMIP9FIGkfXH+8E8EeaMlfz2xBYocnnLhkgxUGOjrvuPp3aUriTRhomobKiShp2IRv/u4Vu5/3f2jjlaFpG8P5kxnj8URRz5fn68aHrl7dqKPU3/RHpD9e139Utnqeqjoy1el7hQrEo+7X0yEbPyDn48gHVYGNT85lSjVHkK4lA8HLBSlm3lAb9Yl9PIcQLkBU+ahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaNrGCo+b3j/2QXZ68UuMyTgs5Nrb2lqx40o3Rw+agQ=;
 b=gkwYS9MxGXZlASl0bs0im4mHkMwiC4PPr4LzBf94EdoIOl3Rn9WUelS5OL2GmCXAHRaCX4JOPdDjpW48IyWupApyMkjtoe1cONpfl8jixUDUQVnnEKgQiDRMNilYEXpDJaaFvpwAtL7PoHSFF/g25FpzgUcTHjEJYaPkdrH3xhM/Ppryy9dID9Sl8qqkwuKNQpFMsOhIbqgQAcTEe53sM7V5030uZce7g+3nveix93M0GoibiWBhcXAazxx2ZUpv1zaVjCK584yOU/Hg1Lec1qiCs4qSCqI+K2WsyqbneJRq5KsPxG/X3fUyz+KeHNEj0Gg0AG1/lcxB5cd7+wEqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaNrGCo+b3j/2QXZ68UuMyTgs5Nrb2lqx40o3Rw+agQ=;
 b=iqmzzlxncK0PT/vgbZCJkrK8qqdXysCCNWm71v/5uRcTAXO7ay0ryIJXsozrB3+tU8iSBEqhnObgyfSLc44niPHUe2DkfRiuQymKKHQzvofy0GokeZ5VqXUwFZraKCjWXxRASt71iIFluuVUFoNhXuG7a48NxRbse6N7lh2GPc4=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by BN0PR10MB5222.namprd10.prod.outlook.com (2603:10b6:408:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Fri, 13 Oct
 2023 18:13:11 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1ae3:44f0:f5b:2383]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1ae3:44f0:f5b:2383%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 18:13:11 +0000
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] scsi: ibmvfc: Use 'unsigned int' for single-bit
 bitfields in 'struct ibmvfc_host'
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1r0lyl7bp.fsf@ca-mkp.ca.oracle.com>
References: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
Date: Fri, 13 Oct 2023 14:13:09 -0400
In-Reply-To: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
	(Nathan Chancellor's message of "Tue, 10 Oct 2023 13:32:37 -0700")
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|BN0PR10MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 283311d2-fa4c-4da8-b7c7-08dbcc180f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ob+6GPqwMrgYm/TU5lmiJQolhtkpz4kjH8Iz11J+8www3d/bY1lXkHgPFwcX2Wy81OzYoZCfG86yIBs5OJuJYE8EB1hFSaLqGMjkaIdFzrtCryFBnG9qGoiJh/cDlPnGd85LxCmvW4bZ1t1v40LCHZdtReA5ubg8SQseIefNCV/dPdvK0xpqoBvoqvaqboEKEoIVq+Q3E4rp95i1RgHRIy6Kh14PSqbMxwviEUkZOwR9J4FNJvbqf3OBkgz/n2YfV7e6Pt+xfJotnmr3xpG3y3BB9mD8XeFnT+BEt+lD432aeDXaTY+YULgRzONYf1CKW5xKXDvbey/Rmyt7PPM4u3gy/cYE6sUEGcwwFFzwCFHCq70DVIuZ26ZQGTFLo8tf8ncsz2ilFF2MUDBpfQCVaS6rPVaG2qP5U3QTRYeq07ItYsQPHTOHpzcn99lzayn5Qwwx2dUNP80CAfzfCXbyJ5ierVbLIpmAshqazel1HwdcYJSn7i8eex1IYCNJmoOFnmDuPwlqCB3SDLO5sOG/Khlidv3bomwjhiolVGRHRzlTUPBWefq1B5cTU4EH6mCr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6486002)(478600001)(66946007)(6916009)(66476007)(66556008)(86362001)(83380400001)(26005)(316002)(6512007)(36916002)(5660300002)(2906002)(38100700002)(4744005)(8936002)(8676002)(4326008)(7416002)(41300700001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HB3fR9ZVDAEhL1NVIQr2zW0fjqWTwTovCDsLK0YHKKSnA/ZBRUBS4EnBLzwC?=
 =?us-ascii?Q?NEf31YCP2gpbCDgLYWL3f4/xLaKCgSAYuA2d/GBoxzNVgtEzOCIQ+JrYW+oa?=
 =?us-ascii?Q?CHXnlGYh/iOmKMLDbDUbbTX92ZMEvywoFpl25W6+E8TQwXnzlS81JqR3QiPL?=
 =?us-ascii?Q?aOG/ZTCEFjpxsDvEqOPgsYDxWwPiRk4DRn9OffUle50UJE0fBBB5zPtrnfYk?=
 =?us-ascii?Q?aX9FjdHqHWoOf7rl+4FLf1cNdR4LRb954VBoqndDlFFfBS2Q7/0Z355dmY8E?=
 =?us-ascii?Q?m/V6ls+RImgaQRssXbgERYTXkZ0da+1LrpzqCAzJQzL/LtGGwYrRWwfBlquA?=
 =?us-ascii?Q?4ZGyjk6UHr7aqunlbvxm2GkRcPWjop0x9cE6c0WOLw6mHKsMKBu6LuIpuudy?=
 =?us-ascii?Q?SCpY2fXmNCD37FexXJe34etQxqYP7Xck+EU+nlf/IdrowfZyaFHsPIe2mNGi?=
 =?us-ascii?Q?2c+XowwOCnRvLyG1yvUHxohLriuQX8wSi7LZ0HoEqTpVDbZ85wA2WNkKAmSE?=
 =?us-ascii?Q?/J7i5KHgfP1zNXwHe1khQqCFD2x5BWBIzF1qnj6OXgPffxcvjozqV1A34q9H?=
 =?us-ascii?Q?91TEuT9zkeM9DfI74iSVXjXB5lH4sUERrS8xeiBH1MK9/SNy4/LCGTrBP+q9?=
 =?us-ascii?Q?YpgTZpbA9GaT04EV81SSayfJ0a/gDOpAdRaSEs67WSDZIGw0KhjHRK1kV2dA?=
 =?us-ascii?Q?o5Bla7EMRHKv5hPkq0F7a65kU0ki3SE45ZAUSfjAleIIokfyqfAW+j5BWPy9?=
 =?us-ascii?Q?NCxqpE2rENXTbaWyIoq8qbQoPdOnT+F4gD1CsbA3ouvbqxayfP1+1zMpLFbo?=
 =?us-ascii?Q?uE0rGjRf/o78HMylflbU/vxwnPjEcfkySo1ekJdWjlcLWWTrtIrnIBZrwN1W?=
 =?us-ascii?Q?SYtMbAX43WkowaMRYbwyyaoiNlmp3sEc0j6CAAtaMd28EDJGF0wb9cjR2TX2?=
 =?us-ascii?Q?FN7+BvwgpuDetMhbaZryWE8oUz5tYNcgT3XWxL//WIe0KvRaU0ArKRwBUI+k?=
 =?us-ascii?Q?1pAC+ZdpgCAXq81km+JTMcEIDhHN9hXVUni93Et3/TsNPruFunoZjL3qMkIl?=
 =?us-ascii?Q?jv69dSuxVC+tY2mb2w/AXeXRr6/kjDWUwV5x4X2K0rkooqrzYcbaVNJAZEhG?=
 =?us-ascii?Q?l+9g6k1aOWnwtadlc85NjLxWAsHjVvtlmkBQUw3rN0/2wU7tpGZoD+s9gMar?=
 =?us-ascii?Q?PibjLZIUqD3E4uriHXSqsyng/cNBPqAlOZmah6gfUwa4MhdSgGBNpZp4/eeG?=
 =?us-ascii?Q?UYDzMUEPA148neYr/CmHdMblm3BMkBdbHPYKI10PCIwa0nJTb6iAvaI+pMwg?=
 =?us-ascii?Q?9Rhp0ZjcYP3e7v/PCytLu/g6QCnQcyeSIl7JFkhM+mRDnz3JQ+HqIV7xUefL?=
 =?us-ascii?Q?WdVQHs/kMTDb/mFIFIz6rX8BXAwAa/KeZqXSPSkca7MFRrjI06T59LRK2pvR?=
 =?us-ascii?Q?2U1mDZEizL28SPF5kdJqaJEeX67dKznm4wIZJsAN4bfXBh/a/6A7/sidR9KJ?=
 =?us-ascii?Q?WDydl6QrQRC8hEm0Nc8cpK6eBADELx/Loc3OId8B4cN7JLbSRk3+a1LKR0QU?=
 =?us-ascii?Q?4BrZASaBOGL8AjezOZVYCtumldeSbILtTgxissRl3ix+RGK0lunc7dywxPed?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?c79dWS9rp4sJOi37qz2EbzXlMgnuwjBc+bDp9Tz2RpDsp8vQnZ1zKSpyOZYe?=
 =?us-ascii?Q?EUu/L0zOPe4yQFCcbW6ZOdCvjKU2HuuRoS19hmUV/vyTptCOaZXs0+cjUS5r?=
 =?us-ascii?Q?Dar8DblbRuqlSGv+huqd+wdt/gtxShydWgrm9JK2WVUDZ+sg0w3EJcjd7tZO?=
 =?us-ascii?Q?yEA/fBvnrG1Ljy1IsMu5wGrW9s8nJT0UAwKHvmWa7FQfaRi3Z8b91QuIKHwC?=
 =?us-ascii?Q?0sOwJlsiVCwMIex54ahUZP2ieQcwdgVqQEa/JKJ7c28Hp1L26lVKxRxNGBdd?=
 =?us-ascii?Q?BRGFWPBNoVzCFE/rhomL49E/ryCCj/bKWNkcqivpRAjqkrwu48qvN1cZO1Q1?=
 =?us-ascii?Q?Pdh9w3NT7IRpLE1u7H9+lwbXZMw4GIxfLQDTWwaxjp6xRVgpaXD2jFPXdRsm?=
 =?us-ascii?Q?/vDQwP91KTt3DZJbu9PS0fumxFPtHqTIBXo+zF/eOyEfxWrKorM7tbHwbU/u?=
 =?us-ascii?Q?OoprbhR3nLyKKV1wg9NLLcKNWTARB++lPFC7Jr1iT1rfoSPaMz30Y8Gu2VLJ?=
 =?us-ascii?Q?EuAHmPvLvdAZRINx8XDH1YglkpEy6afyfAJHnp5+ApnJB/kixKXY++mABTlB?=
 =?us-ascii?Q?3hnXZpRhJJTWTKXPT47T1taB7aCbNRh31fI1Vhqu3ljmbzOZ47spYkYLVw8t?=
 =?us-ascii?Q?w0ntoJU82a2eyfTO+1rCnW1eN1qsZnv6robh9o9BGI/0PuliefqSKN7f8SMj?=
 =?us-ascii?Q?R6PXiYE2a9h360PM+jGgi9QV5KPiRBQ1mAQ67YPvM8XANz7UlhqGQ3Vy4IT6?=
 =?us-ascii?Q?BgCiyw+TyyIWP9IcIzrksw0yqDxHuKAQ8Mj6/fvlBeN6ofm5IA9DXyCJHh43?=
 =?us-ascii?Q?w+PBacVEHOV1f2h9jeerCyv7YPGjfGz04SMflHDWAUE1VFWK/G7g0cZlCIpH?=
 =?us-ascii?Q?lUM7MnKA54mUL4IhoIFbh4YFKHwoOMsyq6HjTB9Y476QZOhnRxiTpmEzhZr9?=
 =?us-ascii?Q?F9W48VsQgxT8DHslGmPOJ2HO8Roaksp75VQ4j65EBJ4CR7XH7O7iGwJoKCXB?=
 =?us-ascii?Q?0IuyWm7UeaszwCTCMUChzAU24g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283311d2-fa4c-4da8-b7c7-08dbcc180f87
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 18:13:11.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYl+c59h+6PuYw73+7nvaokd4yNSaMdY7kD4Fxox+JN2N/KiBjTNLvT1tzltPn5IulRH9JxPol4DuAN6N0tfuRyDAZ7qQ+5ebErjrDCOk9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=825 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310130156
X-Proofpoint-ORIG-GUID: FiHofuElK_lQ5H7RX-S-6_HrSvVuWktD
X-Proofpoint-GUID: FiHofuElK_lQ5H7RX-S-6_HrSvVuWktD
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
Cc: tyreld@linux.ibm.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, trix@redhat.com, jejb@linux.ibm.com, llvm@lists.linux.dev, ndesaulniers@google.com, patches@lists.linux.dev, brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Nathan,

> Clang warns (or errors with CONFIG_WERROR=y) several times along the
> lines of:
>
>   drivers/scsi/ibmvscsi/ibmvfc.c:650:17: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
>     650 |                 vhost->reinit = 1;
>         |                               ^ ~
>

Applied to 6.7/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
