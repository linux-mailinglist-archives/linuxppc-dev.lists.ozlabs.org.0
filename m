Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 308BD899140
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 00:23:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=hx2t9KW5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PA0HV1T+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9bkM6DVxz3d2j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 09:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=hx2t9KW5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PA0HV1T+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9bjT4kBcz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 09:23:07 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 434KwxG4001413;
	Thu, 4 Apr 2024 22:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : in-reply-to : message-id : references : date : content-type :
 mime-version; s=corp-2023-11-20;
 bh=fowMNG3UD4T2Nu94z5LPdvN1cuyl4buX4ZxinLiMWVM=;
 b=hx2t9KW5K6MoVhGfId1h/9LdygqrBDrTq/rsmLPgxntbPlGq/xzJi/M7VJrwOdP+PCt1
 3tkvak0862Lhv3rHYF6YFe0gBy6hdkJ4QrOXgOGRvYHm8UhW/0W/xI2huAvmVvXVACrK
 Y1dfrJsLNkpdXxrIghyzM3iJsmZnMeS18KChFKw3xOnXAXNNIsWhcrA64NOr37a0dR8R
 GnRoXdbRy9KlWylh5BOYed0OGc38/4G5DjdKPimQYbXOThLdSvwby9vR1fmN8zyzxwJV
 DTLMmo0ZWgZpxpG/I8lQmmL9PJIvokccK3LZA/GtUDNrh1FzvBOknEpV23LbVbiph5Dz FQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x9f8pa9qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Apr 2024 22:22:46 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 434LZKcc024244;
	Thu, 4 Apr 2024 22:22:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3x9emncm5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Apr 2024 22:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEzCYFHKb7tYogWjqZCnyBj04NnckizuLhDLr5aFiS5uJsSuleSr3kBLB1bh/kgKbqs2dxOe1Thodj3cWY1CAl/ke3gF4U3HCL373Ihq/E8upMS21GPOJlGEmUlDq2u769gh4fPjQJsdRz5ZUbGP3/jsaS5w1wNA/fjVF7duqY3yTVHTdQ43lvDbRMdjzoySVk2OsrMVRJTuCMW2ySb/dR2rStV9tKOJsHWrOdEPqwCuh52jQLgTmETWMkMdPSrs46UgVmhCSnnQKWzKc2JcDUGvubgNqCTO+q62mpWO4EBcyF63xJR4R4jof6+Z/jKCTDhrHW67jaEWhi7qUKdLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fowMNG3UD4T2Nu94z5LPdvN1cuyl4buX4ZxinLiMWVM=;
 b=UJV9nHVy2cLQcQz505NBA81HowdKQ90SdqVyZiASTljpo5HfC3rC4PJYcv1iRgUUNK68MS9+l4iG8QClYRGrgsLnIr2QZljxCzPxqhADQ8p8KCltvpn5G1jX3cZuQd9+bViqyD2670wnXHaXlZ/xn19iOptC1XGCAPyxVOCTqG6B/zp1A/mF6XwgqWgUWjerM73QnDogv9kQrXNO0bYP85a3efAR1eRwLaC26LmZUUjYY26aaldhY8pFb5Rs8VgzSW8OPRzziAo05A4fkmkSnZ7WHg7mcrmStEUsK1FYrczuVg8JiQetQ6zCS0JNMvsIosisrHQZxXoY0lvle9IlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fowMNG3UD4T2Nu94z5LPdvN1cuyl4buX4ZxinLiMWVM=;
 b=PA0HV1T+Ztv7qbvHvkuCD1qH8A5bLwsOO84vl0A0mv/4TQKHTkBu2UKcEk+MJixGj7dgJ4+RgQ4XZIYBbm23YReOO0wVAEdP9D4M+Xs08nLrhCMEvMzOOdtV1sBU2ZBdVlCMkKL06jAgyENNperCAsFhRJgHy5bFor9GrfwtxjM=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by CH3PR10MB7138.namprd10.prod.outlook.com (2603:10b6:610:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 22:22:43 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::7856:8db7:c1f6:fc59]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::7856:8db7:c1f6:fc59%4]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 22:22:42 +0000
To: Alexander Wetzel <Alexander@wetzel-home.de>
Subject: Re: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus
 warn
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240401191038.18359-1-Alexander@wetzel-home.de> (Alexander
	Wetzel's message of "Mon, 1 Apr 2024 21:10:38 +0200")
Organization: Oracle Corporation
Message-ID: <yq1h6ggvkd7.fsf@ca-mkp.ca.oracle.com>
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
	<20240401191038.18359-1-Alexander@wetzel-home.de>
Date: Thu, 04 Apr 2024 18:22:40 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|CH3PR10MB7138:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	saltS6Wz/wBMyqqreQtRh3hQoHvJUH3+jlzwS0/XRcmR9iz3BAG3RtbORpQrDDbYGQkU9NmF0I/mk7Rvli8VhkVWqLlCakicCgITmbgiwx96sFFo//RNkbd1BHHzMeu9j9DzAaSCFNuGKlXCIAzyKklLwZCsW992NlMhuvsb0UGFS8ary/ViJyS0XOCQUyPhlp6fXyToKU2wCDLNxFELuk+m+1nEBqoPLgou+bg15G5urit6yrqFTWk0BC25EkdVX9hnBOT3uUMPe2s5Y6XOyXoYoKjYTuVY4pDQaYzkjjiB/A70KZ4GTUp9eTw4Rd6lUHGk1oDSWTpwuQt4Q5UcdUnVtk2Wn772Hm4WGJglmA1o5S9PmTHj5/mHrH5vw3z0pV05l1o2ehPUVJqqZXMSswfGqmVA8IlKw/5CvEAllvpRwT7T5OAASA9YxKrUmH/vGsUFxKBIKqS1nvE07rozOwGsmjBKF0R9P9GwtXcIqcGf+kCspgfZhAddDt7BM6gSS91mBY9gcEUJwRP+/a7+VZOsr6K3uMx+U8oTnXxdxsTQAFDFbin+NeXt6IdSZWSR4uKQPiHQOXKqC20xXU0GSpzPVpuS756viq6AiPmHj0CfnQ9BbqpgP+nwZYHpNOIOf26XmCQzYrwUnOIjLhl4lm0lYwe7FZaCBBYnw5PaeoI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TXxry6vP2qmmfoT8wq5qeaMABN37affh3tJXK6jsl2muZ4Wqjf11fttt3ILJ?=
 =?us-ascii?Q?vPXMHEvrUUh0bDbXZxp4R2HnTrK5r7e6NvS1ih9P1041qWg8yluziDcXuOoy?=
 =?us-ascii?Q?V4g+QhvkMGhYiUYcGHhZatR1Z979/sQPa2dZ/zmDYcDhH56PAEqq3i/ryoFe?=
 =?us-ascii?Q?uOFOAG7+8h8KlCePnELHYQ+o9fQoPKbac+3OvLEVOD5vBpwxce77EFzCjlkS?=
 =?us-ascii?Q?Cjue45QvPhwrmjH3echDT423Vb8bnx/FfRzImEfp7SU7On/JftBhgDSctBmq?=
 =?us-ascii?Q?2hsevX3GRJdfZ/gu0Ygd3p/d1bQmw7vIDZ3Wl8s7viFnx7ygLgNGIOuV7vFN?=
 =?us-ascii?Q?YUtkcwVCVlszOzTZQZcEphYL0/fgWO9VdVVmP0JQDt6fpU1TqVAwqIIuVI89?=
 =?us-ascii?Q?ahPtBqpp0FKCzUVMGYCPSTVv5+33nqZfdETaK+mJVHNAzDFBxUVeQFKlB6CT?=
 =?us-ascii?Q?WsKrW7kMEktcDxBEBnlbPopG3sy7esw7Of52mR77JwlX8Q29tP5GLkzmUTz1?=
 =?us-ascii?Q?X50Z+362nLun503drVCeLNY6WWJtp2p3iSAkv1JnykcwXFePbkRXJUAIP/nw?=
 =?us-ascii?Q?O3iUZfcftpemtvNfvXuugLr2zw6MJwTN2D+KzxKGb7GMPmkj8Cfy3wCEGpMZ?=
 =?us-ascii?Q?swPRSlfiBScsZpkQP+IOxYThbPcT1EXTAKusYnlUeR/MpmXDUFlaPckYBNk4?=
 =?us-ascii?Q?bQl8hQbW5nSmgHXjsPRj6TtToKFXTiRgFnkEfw84DVlo0PJYZ7Jhoz0s5Mso?=
 =?us-ascii?Q?kPFTnrmLjS0g/J8wP7ulcoFlRugw87q3hmLHjWvfzpujebmtk9Qexdri/ihJ?=
 =?us-ascii?Q?3odMoU8wQGTxMUGIVJB1fHcwv2FnCJ52FSzGznuODSLSnpZQoD+hDmHozFy6?=
 =?us-ascii?Q?xIv+nRC2TjEwTSiqMBxwmSrmHvDUKLIhUbKOa+w/JBqGE/l7e+U2WCwm5jHw?=
 =?us-ascii?Q?CjMVcCpmdUejMF+HGcdLPxn88mDo0UtMRghTce8L4zqKA2yU6ECK7kZKfwSL?=
 =?us-ascii?Q?xV+UpnnagSR2UWvg6DFw4tS+/l2olkDMJnxSN8L2ypAu3WaGzwXoDF16mFjC?=
 =?us-ascii?Q?Uv2ix8oq4nRcBkEoeT9Pd/XD9SWj+DcZQ6dQGsiYE4nelyAnT6WUN8tgcZV2?=
 =?us-ascii?Q?G4uuFxK2zLIA6MxEQcX8yNHfTU6XQ/5mwhu9h9V7RmKL2q/8xSRraxmud9eC?=
 =?us-ascii?Q?eVhuhm/6k0uKdyM6tqRRRSgegKafyNN8ojoQhj0yqdV7F3MbS2ZjUP5iXupO?=
 =?us-ascii?Q?wWbTyzOuuvjrrt1ngkF+qD6f/0tT0Y0VJTbJkew/PeiSKe68z6YqbqBQu2/2?=
 =?us-ascii?Q?CPQnyVcckxtlmjPtmfp06OJu1SZQjhrHU4xd0CRBY8U7z7JKcdaBzwnNxRTC?=
 =?us-ascii?Q?MSloLu2H33jmEAEM9XCuOiDgHX8lyb8adm1dLTDyS8VuefgD9vRWXA2UCz++?=
 =?us-ascii?Q?8+GhcVoaquE847a6KsIOibsj3hHPba6rDeydky2W4qRxCfrhbNgEBykr8/Di?=
 =?us-ascii?Q?VuSGuwTjCe+xTsirx7r0nim5SrJg8OYklrX4/r8cACb3iemUleeFUGSk9vzz?=
 =?us-ascii?Q?reH+tLeiAPJ//zJkOBmYt6WPfAaFuwLJQoZrpIh7LiDZL5ycEe0MZrk1wS7a?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	kOTXU9ELnHAZDONthlSJCEcgW4JOnEQZAFENzttzL1F4QKquruVDoAJzS3JU4g8uYgefEPHa24NNWY/gju8PCVrWGdtdAew1CS8KgRMclK3QIaWV0+GRaBzwrjRo2Tuys41vEC97f36U3IJxFTy+x2cQGhvwH4GJQCw9+cUlAqOfjRjQp6zb5HejZ1iYTop3k91O76hLTTxuchnj+gkJPn+1OLwmNd445+Joej7xwH1uFS834kyufLrT54KRBgQ2sLEkQNOO/vA1uwxU4/uLoZDLy0ux3yscBzZF/zOSy/gidUq6uDdt/1Ycr6kJI84hA2RO/q9QGWMrDJxrksPLe99vcCIkidqxe3MT3FLil+tngQYJMFnPOluR+4oolAvF8+0082CInkv7LKLdL4YqjbslKxH64uKIj2NScFxJuf2cvd/huSXGwePCMj3VMV4ovceODcFEYarjMXS2nlTQtmdzY7bSULy+BvD0BQBORPwECxhwxOWyRQdzBDtUPr1spMxStLTiBw9lD7VG0Y0qiqmE73xizQozMEuwMz0Y9QBTCMim1fJqDtokYd+MagzsQ683LSj+SBIYYq6X6kYpQgC2hBqczjhaf0actUolI2U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8495d4c8-4945-40a4-8a5d-08dc54f5bea6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 22:22:42.3621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZfinf9zJJ7lLMJZTUh/fG49ssmt15QfWOW/Pme8e4/WD6XYTTfALP+E1IPt/yvNaNhH5vHFuYMVuuHIYgSbOJabMKmTMgW96bFSzwZbDFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-04_18,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=967 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404040160
X-Proofpoint-GUID: BbynzmSrBZIQ0YSo9u1LX5x8LlZ27Axi
X-Proofpoint-ORIG-GUID: BbynzmSrBZIQ0YSo9u1LX5x8LlZ27Axi
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org, martin.petersen@oracle.com, sachinp@linux.ibm.com, dgilbert@interlog.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Alexander,

> commit 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
> introduced an incorrect WARN_ON_ONCE() and missed a sequence where
> sg_device_destroy() was used after scsi_device_put().

Applied to 6.9/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
