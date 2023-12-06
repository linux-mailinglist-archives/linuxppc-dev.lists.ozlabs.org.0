Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B580657C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 04:12:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=ii5Hidwq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bBOtSXcK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlMsM6T01z3cGb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 14:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=ii5Hidwq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bBOtSXcK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlMrT6LrRz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 14:11:52 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B61Y6bT011286;
	Wed, 6 Dec 2023 01:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=F2ZqlFM3XH8srMLCcSEB3mgrNznqyjCnP+WgnBfVMd0=;
 b=ii5HidwqHkmB+La5SCvDs3pRsM4CsrtpReHEGtJG4KuQpI6wx/6FlECLaG21D83c4zAY
 a+PxXuS8n+spc6+l879kKQBP9sJCrs0qfBudmr/gszaw0TDUpEUnJeKrjdTaDSp/2zQk
 KYDrssGuFhiPe4cAi3Z2HG9FftKk8zK5AucjGtiugwS6EANp1LXjAbxZAWoSQiUL+EmY
 Kr8PPwmM4t00K3X+amP/j4DzuNp9oKc7VnhYNTuubMghIhgcCLvhXWdnqIT6wublwlfm
 p1JgHov2YXhGabF84RyizCkQKNa8i9m1JZomdGgJvKoJPrdpHfjK7qU+k/9n8GmiwBGi xA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdc184td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 01:58:04 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B606rl2039939;
	Wed, 6 Dec 2023 01:58:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3utan541kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 01:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/rrShZiOZhiTMzAh1YbjflkLrFk28lzatY1FxDjNo56GCdPq3vJrYLvmCUutK2eWk6hXdCtCW9BD/XsNMgNdMqadddb2K+G/nDz4/T0SSOZLStuCmS8AR5jeV2p3G0QQaWlh4WkNBU9SlrPo1NvPuUNCqPnQxRgTr1bqBnLYtdZ3BEFxTvT4cGMzU8YD94tdbyYwIbRXXWHyRz2BUfhYZV7uLqCzYBv1e8mklKiItirbcisARAab+Vz/dbSpZZBXgvwzlGu8+z3QslUp071Kh+9pjY6YHjAc1WBnEGdzhYh1UyCuDjT2iYGUcuFHAeSgLOKA4LfKv7oLZejHR+TiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2ZqlFM3XH8srMLCcSEB3mgrNznqyjCnP+WgnBfVMd0=;
 b=VBscAWP7gIH9BjCRJXNb8rOv/quP//f0nDU1Z0YEAmuWdyE6EQVAlGvZgpFHSpARuLtJbq6nmQwKlrHzsq2VtNsXtcygbHiU1tiah7Q43AWvZHCfFZS2ILsI2OHKCNguoBYJLty4r56UMSGXfKXXo6XbLmo9ZJOX6lug0L8ZDD8PopsU77hqf79C6YRx1s9Yi9KpJ4pd6DmAbGqLxrB1i0aSTFWzwMAZ7GP8+doSKogmaNtBQc4s4EPgRdlHErOSXH2ZBlKJHRMxiq5a+U8vGudGIPcvVKYNbbwGFBmzhUvaXwW8xtLEJ/kOTwwFrLLesu/DQKw0cpizifgKjEVkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2ZqlFM3XH8srMLCcSEB3mgrNznqyjCnP+WgnBfVMd0=;
 b=bBOtSXcKz/M6DQx+9AEJS0e+yXP8tD5VOu2zdvZ42YH5/OHRHwrAAJyAToRBhk3xJ3CePSWRzDYKzb6UJxDXxRzVyCOXCAK9ddw7jYy5Z6PVdqtiJFul+j24GIGGaU7+/y7lt17y/vFFLl4zXfTA2wRGOY2ZvKzmL3O/BeamysQ=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SJ0PR10MB7690.namprd10.prod.outlook.com (2603:10b6:a03:51a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 01:58:01 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972%3]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 01:58:01 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] scsi: ibmvscsi: replace deprecated strncpy with strscpy
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1plzknld5.fsf@ca-mkp.ca.oracle.com>
References: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvscsi-c-v1-1-f8b06ae9e3d5@google.com>
	<87jzpy1cqx.fsf@mail.lhotse>
Date: Tue, 05 Dec 2023 20:58:00 -0500
In-Reply-To: <87jzpy1cqx.fsf@mail.lhotse> (Michael Ellerman's message of "Fri,
	01 Dec 2023 20:41:10 +1100")
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:510:4::8) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SJ0PR10MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2a6757-cdb6-4b79-2a16-08dbf5fec74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Wp1Hz9McCuwsRDP4nTxQiPqaJ+gKwTIkr1ZT5zvandm2iUHLr2Hc0bkbAu4b7HhEOm4gaZscfh0VOSfG9PEZBuQsMSQQC9/ptSmr97XxDi9SPb2YQaCU4TDw08af73uW6u9MiExxNjY7zanU3pyOEL7y0Ee78XOZsPY5tbOtdrZsnprmUtvF3snQy7KOOJYCul4IIjxlB2IZVv/5OjrCMLNg9Z5OD/HKOuuLzxdYXl5zZ6RbW7HUV2Gdn5mUnTCjRYJWP98ADtJiHBcwN5GvpfApSn6PVAM+KzAH30cPKyVqHOpFTWi6oAHmaaFWODjy2c92bRkdYtNa4KgawUJTVjHP+6gFerLRSjEWZr2iE17n7TfnUoqEoG1THEd0J3CG8zBRnRph5cAInfl+kNuAulsxc8DVWOC0/bK/BkstXgO0/kuuXPn5/R6c7iPbf8V4YvnLAeAKXY5ogq0hOUesGoRRa9lFNpIew1WqrBJCNFgRGsRSryU91uYjMfNtsWfvYCOPCRS24pLT2OIhj2B76VTkt+qQ1tPSc2Uw66iW/cddc/w3wFrmdxIon+PwdcZUUFyj6DySQo6mPUG2PBfeOaOI+gqeaJAfAJ4cRJUW1r5vzXCmKG4jpJ4ywCuLw/Mw
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(5660300002)(7416002)(4744005)(86362001)(41300700001)(36916002)(6506007)(478600001)(6486002)(6512007)(38100700002)(26005)(8676002)(4326008)(8936002)(6916009)(66946007)(66476007)(66556008)(54906003)(316002)(156123004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jY70zGQeypkmQRvFg2iNV62adkJuBblt+Wk4bLvXgj63ucGMwbZnbtl92Gf3?=
 =?us-ascii?Q?troyniCEQu9NfTpjkY4dswdxYEHCOGtmlwk/8DEypTuOl4dJpgnWXDnxuQZ5?=
 =?us-ascii?Q?ZXXTlXuEnNpM5PUQTOQofxDdiehbi4+52pEcwtpuriTnsInX5Cduh0IhP3+A?=
 =?us-ascii?Q?xnOaQCSK4FSgb/5UwnDlCpOmZW8pqSdOLgpmrD34z1eiE7jjDAlNLyGdJUH7?=
 =?us-ascii?Q?ctwXbilhCKsEsYfCl6vtwbUTUlv1KEBv3Fd7R+rc+0oyPaSP4HbQK29wqFdT?=
 =?us-ascii?Q?gfp388D20PuizCWE9kk7d2oV8VlE4e0ziOTWSJSK23AxLav5twbp7UHAvQFu?=
 =?us-ascii?Q?yfSUi9S9GnzzUwvDNW6Z0HCB1ye8GcF/Ftznzxz7eiG+o8kZt3zrSZcAeCrv?=
 =?us-ascii?Q?+HVEFyLgZWgU0C+N4fpVVV+947gii201Mk+yx/Q8JKoo06RdaIDTgVtbgpLF?=
 =?us-ascii?Q?HUuvVfS2E/DnSzNZtjdXpy9YvktmFLdlAnZD8A9XEDNJ3e+ST0vys7BRLD2G?=
 =?us-ascii?Q?HQsuxwvuSnU8CWXlUBKIljm9djX/RwGA9VI/Uw4Jue6eQf/o/CEM9LZUtZO4?=
 =?us-ascii?Q?cB636/PoH8BhJplmd2L/Dn83a9WP8S13WWlOm9psBNZ3ijwRxGzuAvSJ7zX8?=
 =?us-ascii?Q?yXLrcyy1LHBktVdGLZbheWZBoVtUKBGJjI56E20hEcdhKlxlcxGnRmiK20nR?=
 =?us-ascii?Q?/E43oijInvB94cJjNo6h+b/SzDb5/wsb5Z5hEN3TP1u7zu3ByWGVE2T8iKIy?=
 =?us-ascii?Q?oU+v4abjEFyeAGou9vCskk+ZLdfyWMSShBRZ2ibX3mRe/uhK4i8nin/ILwtN?=
 =?us-ascii?Q?v8GnnPOTiOyqpRJWqyWChFlExxXDLE5XhyT3TzzjUbu4i5lITW9pMFvVmGhO?=
 =?us-ascii?Q?Bqr6fxSumSjuL5Hi1zpPAh0xmzrb2mPtDy9c0kH724goGypw2j2mRoU9m2iI?=
 =?us-ascii?Q?/39S//NOdG19EMhJmhnEvco+yJzEqTVDpdyxJcyh21KW+xs3bB16TPORGhGf?=
 =?us-ascii?Q?xgg9XzUQ549/bR9YTRZKV5ML7lM98hHMi0sYp/Pskaz/YFqVDVz5g+PvYjrm?=
 =?us-ascii?Q?lYO5s2uF6PXF9O1zoI3V1262aYsRzMnFCsnGqpsXcJGAZe7hgx26357zey2z?=
 =?us-ascii?Q?JKuj4CJhqizi8FpEnkG0XaRWmMXXW7B4p96MdSkU1HvVY3PC1aq/OQ9K3PT4?=
 =?us-ascii?Q?MIcqjuxuMbf0xZyjE0wLPal0jKAuhPGMTMzPZpRAi536CdlvL/Wdn1ASbCsL?=
 =?us-ascii?Q?1GeJGSjSkbEYmVRC58eRgYlx61Utk6lW0ZkmEezQZHHfzIUFwz0bpVDV0yQ4?=
 =?us-ascii?Q?xKVusss0qK87rJOAfskztaRMUwZeq3OxYNEYp2A/V0UGHPYKy/UPULZhmfi3?=
 =?us-ascii?Q?fsuIr6YtWACngjNlFywV02TVjhitYh1FNTLVdAPDm8RgymzS9IAM8v1gdF07?=
 =?us-ascii?Q?kXmzkDiQf21ZyRRfFxc0owCsBsir8O2M8UY6rs9UMivnFBtr9pDwVKO6N7UV?=
 =?us-ascii?Q?phad7Ue1hV3ZvyOqIZnd0nHm0Gg7EMX3bTpSxYhh9/vLw7esmPn28ye3S5aV?=
 =?us-ascii?Q?+rOWmPIYvDqxRw8bp8Tm+4ZmPZNSN7X0rwKARi7Sxqx/5EnEMTtW3n+LRgqk?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?n0wKJ1u9lLgdHW0fTDNdAho5F5n4skhPm1hrAxi3TtSUS23U0rqUgE5R4Nml?=
 =?us-ascii?Q?nXJfgXsHYGzezGrnBUGn5iPj7AKHvaafF5PKX6WW8pv726Vy96MCwMYIjtfN?=
 =?us-ascii?Q?AWbNDYAQcaGWbfZ8W3JpKYVx0/xOsA4BRJi90XVHXkvwgV4u51Q7LVjEYSr8?=
 =?us-ascii?Q?ZOsE2WG2DvV/1ezcqGbGmgqXfQuet49+2CgYULUFLVHAhfxglmM59CeZclGU?=
 =?us-ascii?Q?nsnJFrtrAa+zN75Qop/v73fKiLfUUB/+YeBZNyxVzge9rT7k2w6d/04tlYS/?=
 =?us-ascii?Q?5J6+v3sefXoXRronC8aHuKmE+T4R8r1G7fbPuLGz8/3MHP4Pe6XR9Bx+/etI?=
 =?us-ascii?Q?IBa6rM2BKgJ2b9Y9jtsI5EcEThYy6lmvBVrIrlw9wJDxxwvzpAPSaqINUjH1?=
 =?us-ascii?Q?eU0BjfQu9eoK5LsT3lL/wJH4PEJLW1zhaJu7+meazGv4OxMltC59PXhkEcxv?=
 =?us-ascii?Q?Uq9xyn/7N3I4dfT+W6qzthu+fYxOJfvBOQWX+dN1ke6AYjl0wYI9u+E7EyD5?=
 =?us-ascii?Q?Gh4INMveBBhaZZnSloXOTbXpOFsp+Y7W8I2+zJUAW63IAOtMpRcfN4vnQDu+?=
 =?us-ascii?Q?9+cnvn0UEAIvIjdiUrSXWewUqnmH+jYMy7hZgLr0iRMlxf9yfOFzbrlmpBxz?=
 =?us-ascii?Q?nBdFtCatpjdwMWoBYjGdbLFXzLS0ipH9PLX124cCHEw9/pl8kofA3r8rVR69?=
 =?us-ascii?Q?Fc9jDHKUZZrWKmfNmrrjLXdnqjdS9Li+4utIHnHvZSqzP3vQvT1xla9facr6?=
 =?us-ascii?Q?+gzfTZKc5BVOKAIgsWzkArGuNNrkGYzrFvW6QrtYITGtK3YGrfa1CWIp0a1d?=
 =?us-ascii?Q?C0xjELT9BgQ6YCBTtSGpHtBCLgSrn8b5MzxDJNLUxQ8nI+KrSxydKoniCW+W?=
 =?us-ascii?Q?DWanvAIYDdVUrUOxhRRVq+8pYyNGKK59zs6LKWz43kQY2+y6uj67GPFhXvrP?=
 =?us-ascii?Q?tdYNQbzyDu5f+OwHnCa42Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2a6757-cdb6-4b79-2a16-08dbf5fec74d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 01:58:01.8391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGYQ7NOHqp6F5DFBEdUGThknxxLpiRcDVeRR3jJdiE3I5ejOtjJ9N3wwlNmNIUOtw8lJ3mIqIuuEiOM9B9METzYaFOagYncj9I79sK26aAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7690
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=784
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060014
X-Proofpoint-GUID: cEukIiCq6OHiIvhwa5PZ2dGuYZ8yr_ts
X-Proofpoint-ORIG-GUID: cEukIiCq6OHiIvhwa5PZ2dGuYZ8yr_ts
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


Michael,

>> strncpy() is deprecated for use on NUL-terminated destination strings
>> [1] and as such we should prefer more robust and less ambiguous string
>> interfaces.

> I gave it a quick boot, no issues.
>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Applied to 6.8/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
