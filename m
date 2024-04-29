Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC258B607F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 19:49:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=bJ8+VEU+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D2Fgf0/6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSrSX1s3Hz3cnZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 03:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=bJ8+VEU+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D2Fgf0/6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSrQx1Jq9z3cWq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 03:48:22 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGwuwV030171;
	Mon, 29 Apr 2024 17:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=7S5CCPWZC3yvWQk7iHzLzlhKUtoexHsWty2EfUmAKIY=;
 b=bJ8+VEU+xIX+yAq0eUNV9Y+tEdZZExO3Y3oV0Oyz2sIOrny936BACe+jXSMPuaTkm79y
 kls8apDeNfG859D6d3GnCqOnk8kP4CqvVtY9kEpLmWBSKxRtpR1HDoyENuROPH57XC2I
 8OczI3/74qcbcLe0fcE1I9X8Lz2rwWWoCVzv/NxgLMp0add+CEX9RowRhWMV+ODP7jzO
 DuRxpebNOALcBI/AjPyj83pSfuP38EnwLxF4+dten9MfCRJqe1mKq1rIYAAp5ZyrGssf
 nBT61j2TeHM5BFS6rsO5wX5Cr8LFNSVZaqkJ6nrWrAdTtxGaZ6m+xwz0mrXPCK30k1vM eg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv363v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 17:47:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43TGYOC3004276;
	Mon, 29 Apr 2024 17:47:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqtc7muk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 17:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJhifzk8zW5d0llXHIQ/mxdFWZ+whUwsxeMtujZol14ugjliqQo2Z0jO/EBs0w/i1Q/vIslyeE9tVQxl8nOg/kdy4huHt59W8MlAheBWFYWzA+jRWFUY4hA0AsnXz2QwXWz32gj1yb1gRTGvlxT6l7JPV3K7mm7FIhZClccrQf6bFLVonXYUAnWtuqsDrLRLV1wlHYqIegPp7Pr6dHO+b1cSQEvMJbs1AN6uAshsAhz8Y0lAQciCteOAG7jTtYo5g5lDBfKrVNi8OYdg6SyDKBbvqHBFrM4l3pV5oPC1S7xnxslyR2d48sEf9PoLpaNXrqnfQr6xHcpcBVuBt//iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S5CCPWZC3yvWQk7iHzLzlhKUtoexHsWty2EfUmAKIY=;
 b=JxjM5ifEoNPF7W0MM0bV6GgUcSXdYl1fH8Ltptf8cxJER75KIOrxzfDx+INWey3HMcx7uUCUuu7FZYMKU3TcwUOJk1DmAn5Sdnl81ZMQQtB8SrrrUHVaGD26Sgw2gHRFOjPcpsYMYmuiyPG0Y4Bdj7yXIFboTDp2XmlQT+64woC1Au7jW6Hm5o0nTgcCX1uOHrMiQY1mmZTqVBXNbL4M+RV/JKzN6bm0DNch+eIzxhQDg3LCEa6e+xUdn44cEGQxdLm6z7sDfmcZ7Nrmr6UAzxCiAgxHYaOiv1k1TUJT4cSbT02C4GabKWpQMO8gl58MQT6UIq7HDCdXFbVwa7mkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S5CCPWZC3yvWQk7iHzLzlhKUtoexHsWty2EfUmAKIY=;
 b=D2Fgf0/6ydAsZS0z+IfCZzZ6ix0AXvdOyLvIcIAmMSe+FyHOfwJ/qoohKzaBQsFu3s26zZ4AuAh8QIreyH7bgPU/hKYLoc3Vpgq0B16H2Xb6PR0iuSF+8o1f8HMYZgNtST+Qi9QoCoJQ7Cc2k838dvJfWWmleRwtaHdVzhjDzyk=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB6318.namprd10.prod.outlook.com (2603:10b6:806:251::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 17:47:27 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 17:47:27 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] kprobe/ftrace: bail out if ftrace was killed
In-Reply-To: <20240429224803.49d420b514e22d51412e1602@kernel.org>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
 <20240429224803.49d420b514e22d51412e1602@kernel.org>
Date: Mon, 29 Apr 2024 10:47:26 -0700
Message-ID: <87jzkgawnl.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b73fe3-a5a1-4723-5905-08dc68746f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?x7JTWbGR1AgcI96uHYacxk3In2AkukrmTYl9Nzt2JUgVf0ao/HhUI/fqj3sQ?=
 =?us-ascii?Q?rtMu18IDJrcK2l1jjLhKZ+mcvECVte+gsNDMv+PcF6juBjabijFqMGTneh2r?=
 =?us-ascii?Q?PLh3Bkq+9uc6t5W/Obu6/UHs7ZLSAkqHVZrQQRLvrLYofjo8gk8UtcNmrdcL?=
 =?us-ascii?Q?Uk5JVy0M47s81rkIXq07nxW0oUJXS9wZkSlZMK/AD6vxLXlJrWEBLkiHPmtN?=
 =?us-ascii?Q?gZUkzlPjcFmt4gDQCJvPX+Xyhi+AxJm/c0zC1+dERDA4l1gTTkiScd2yoRsM?=
 =?us-ascii?Q?K6woBcfxvRqeb5Ti+ucxUBJV0FG8VIdenl4ZXigr0wWgwsaDxSHuPMl9hb9r?=
 =?us-ascii?Q?qFWpfSp2Gm9Pzxq9y/Nny79DYByq6B1VjyTs4pM5bCDyF/saanlgVOI3F7LG?=
 =?us-ascii?Q?iIWeHdL7Q4meVnXmtVZaKs8vCATWDgvRmCR2pz/fEMv/VMNtbcRsbpOQZnnd?=
 =?us-ascii?Q?dlHeqSCvd0SVbuCjfvLVdtro5AH8to6Ol2BJIniMiMKcjIw0/M51mu8xN61/?=
 =?us-ascii?Q?WAyqaBqBrgaz55rcQobsskZSNzAbYgW8NxGtrT2TXpnR8izF56gLdpYb+3Nv?=
 =?us-ascii?Q?G+i9TGxp6WQwVo1tAC9lO1IXT4jwtI5xNzwZUPw1Gl/HgnTGpUGE1ct7/WyG?=
 =?us-ascii?Q?ZNtMeFj5hP7zAVlBTenzkeJDTQUotfo61kpO7xgOBDxUTlHGWh459GcoXi0T?=
 =?us-ascii?Q?W9133tnedU8SKMnxFGX4lwXesR9W/8vY5oEfooc/23G6hyNIEnGOYu7yIuky?=
 =?us-ascii?Q?wRFj2ppdp4lmPB6q1eccuH905V5OzwpWfcGXXjbseDwiiEBIB0c2rlL9ihTn?=
 =?us-ascii?Q?IjvDO17qDwznOouzujZV1GA03x9RgOsTBWh7cxSVLCqbFu2BUajSGqfyhF29?=
 =?us-ascii?Q?Ahh/VCpyHY+2e8kABOANR0HJ33v0OkSDGKjvNO2oOzd3ZT1Vx+iwzqDnVBkS?=
 =?us-ascii?Q?xnlEc3/W6f/Z+4Z59pugkcKakh7PDlB2fIF+akdHd2NBT0x//4fddBovkf6f?=
 =?us-ascii?Q?uwxUg2jdM6q2+5Qzueyyhm8xa9yiLOh7feSw+p0a4gps+QPLS+9m9PPGQBH7?=
 =?us-ascii?Q?8E5xZAAlZcmZ0wLNcAGr9HWRW0jAvFganpIHvUMyukm+u4byApZMDyFfLOMM?=
 =?us-ascii?Q?q23iaF9I6eVRsxSojvCsBMElDJJSWlUsWQOyvQ4pa5ndz+73sEbfMe0uwqFI?=
 =?us-ascii?Q?sTOZ6r5D/o62RDadshPLyfELNTo/EwTKuhfzpTCA1aN9AoXpEn9cwvGynRhS?=
 =?us-ascii?Q?Ltqx9vTISj+f23ULacwWF6c1wMjVe76dPrrO0izOiA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?StVJN1mOo8/T508V8NrwQxReaeU2VOxhYax332GUwfAkXmU874Lxltfr44lo?=
 =?us-ascii?Q?OBhzjqOVFP4rjit6SQ7MllWLMnqt7hvlpbiQGH6SO4up9PwpJ0b/ZTagD7yw?=
 =?us-ascii?Q?MSo3bYl1wR0rN32BFoUCN+D8avwBWZZIZTliLu37xJWXD/NTrO0LkyxigZc4?=
 =?us-ascii?Q?CIvJYAwaYE266AeEXeLcILwWQ5gaj97xGnJOgH6WNDhhEbxxmau+RpJV7Hd6?=
 =?us-ascii?Q?dkwhnfzrkJJCnjW44x/UaK1txIxKJzfZvAX30b5L4HfVn424/JcwetroVRdi?=
 =?us-ascii?Q?8hY0ZZZVPeOh87cYadneec4lZTySTUqQ1hAxBoKxD4LpD26VwAqyu1oHLtSi?=
 =?us-ascii?Q?vg91DTdLsX0gizWPTdTStribqZ2TNW6c3nw89+DeBoZ5Co5NMjayzYK11SYj?=
 =?us-ascii?Q?ubyf12oDOWo1gQoNRPA/N1M03k2FojN0dEC/pcHCzTIwf5GYuJkIDZLrRwDJ?=
 =?us-ascii?Q?4DdNKDGnJG+3WssvgKpp58NSMnESpYiufJO5R/Yvqcl+hYtJxHi1llKPcbB9?=
 =?us-ascii?Q?PE+g9AdZHnrAeF59cB6aqAfhpX59W3EWQ9rLFRCoLQAFTEohVDX3DfUnuaRA?=
 =?us-ascii?Q?1a0aWVPJCByzpGkqfj/iMUG9lRRigpP3G+pYRVf+A/xjOLU1apbOeZs+4lz2?=
 =?us-ascii?Q?XW1VYCE3EQkRTBSGNFFl65Zy193DEVArwkSwTI6YfZaw2TPzyhhsOEtgIVLr?=
 =?us-ascii?Q?4zxWNZtqpPqCU6UKsV7VOEFOVxgBgsy3QHxwaunx1/IVVgpte/RC3fy73nqA?=
 =?us-ascii?Q?BnmMqC+/icCcoS8frWP5JR5yVKBKtmW+BHX6LeaqxcbL7DhjRmoOJkL+Jm/A?=
 =?us-ascii?Q?xlB267NHpCIQXQ9xehcvRM6ZzlAbJnxiHqUYsolNsZRfTniI5F9DXVeOpGn5?=
 =?us-ascii?Q?DKRFGtjYcga291FczQWlwOdBnSV5mfCfuzLmA5EtyVvWcInARsgUluMLqhlS?=
 =?us-ascii?Q?koQM80BURi4o6t2UFAYLjwYrD6WFJ0pav9n9KMQ6GJVfOn4QKye/KpEp62by?=
 =?us-ascii?Q?pkxAMMmsBOxmoldk8JFSZRJzauQraXOS7+YR7kS2Ge5vJ+v9mveUXQ5BsUgg?=
 =?us-ascii?Q?K0p245v7P0rlwBAkBdMNejTRPRnBsICjghVAMEIwoA9gzP4S60ftI+JSVJnn?=
 =?us-ascii?Q?W3lCdgWXfa3aTcEo6mvz4df2TSzAbmpHhCJ/YNkRbJiuUxUO/rHVpYm+hLPA?=
 =?us-ascii?Q?O4ZHDTsIF+QFPeNbThhAiypx/nVDaAGT8dBzGfFYda7qxkdNF8Nv0aEUmOBY?=
 =?us-ascii?Q?b3dx93qqxF1rthorMydil6Fz8y1eTsHNCHqOOzDwcREOMtayL+edZT3POkmw?=
 =?us-ascii?Q?JJ1bi85CIkfXkMKKzqF2h9iOq2kpXpNgZVyD1D2XqMaW96FArREthyy2+q3D?=
 =?us-ascii?Q?JfGKbi2z8lf9amrNq31HPDjBiv7AwtXvP+TdqLGIO/vfABdL6XX5W8G2o2GK?=
 =?us-ascii?Q?Ea64So/0vdans9VB0rmVO9VkIcWkQwsuDSiUYK8108Iej6uGvT5da5lW5/FT?=
 =?us-ascii?Q?D/qGw/89x6OBOiN1Y5HNemU2APenswRBa+M2QVc0zjFDhYrbuu/vzBZb7fbt?=
 =?us-ascii?Q?7Wpw2hOc+1Mk6J/4TOsx2uFlhxdweRwhYh0ErZDBEb5B6m9QW7dNz1R1oEgF?=
 =?us-ascii?Q?31Wa0J4+yi2pbiNOUsY2DQo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	PkfwBj7fTIDJTedffS4IGnbUab4kuoApnUu/zbn1P/Wpy7dGP53gLlzhqRtiUM5vdnDTLyZ943kXrCw7tqeqBPxvE3trS5HBdDN1TW3cDBzVFVHvYm13ynF/PJeiMVQNREyN3S45fj7TZCDSmHJ36BGU9ajbzAcU5EGr8/3L8S6IR9nwVBMvePVNoINzRkDIY7d24okD53oSdPbIXKljzKhWIpFlAXbQzMfYy9Tw7okwC/GFi4oNO8MHrUEHPz7osn+mmTe9v8p4eBOCwrCZxN69D9o4stKuZ+Khkobgp68p860d8UXEQbZaHRB+ceqfmuGTAQZNAr9cX8Eu/B2FC5S8EGEsWF7lTc0ChcaWKFXz2gLednEZhPd05CW8RpEF+nf7xx290LSDFNxQ3MPkOrtPg7h7GISvyexAk1ch1Lo+iQyINaiH9M8Dzr6PY80/X+U8t6b9ONVwjk5o4+jjtJjNUurUF+aVUbG1UR1xIAMIecagnWwu7RXvHJHSlSDugGbLH+/iP/c0lMv4gmWNtR7CL4VSrCqXOQUPmzE6np71f+Gap72r48lvpVMd2kdDw7QZmNkxC48Pw0SKTqW1ZGyh1Hc3y6Bczig1lF/Xi6g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b73fe3-a5a1-4723-5905-08dc68746f39
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 17:47:27.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm8Y16QOBqnR/hSp3geHQDd/s/B+biAubvg9XESqcudFXIGlKetscf/jbBZjHaG+k9oQNEhidlev87F/vx7u7jH2k+Tn44ijImFZMM/6ywc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6318
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290114
X-Proofpoint-GUID: cmW9DUuK3hyTSbya-l_k4rsmy1fzObSc
X-Proofpoint-ORIG-GUID: cmW9DUuK3hyTSbya-l_k4rsmy1fzObSc
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@
 linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> Hi Stephen,
>
> On Fri, 26 Apr 2024 15:58:34 -0700
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>
>> If an error happens in ftrace, ftrace_kill() will prevent disarming
>> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
>> freed, yet the kprobes will still be active, and when triggered, they
>> will use the freed memory, likely resulting in a page fault and panic.
>
> Hmm, indeed.
>
>> 
>> This behavior can be reproduced quite easily, by creating a kprobe and
>> then triggering a ftrace_kill(). For simplicity, we can simulate an
>> ftrace error with a kernel module like [1]:
>> 
>> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
>> 
>>   sudo perf probe --add commit_creds
>>   sudo perf trace -e probe:commit_creds
>>   # In another terminal
>>   make
>>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>>   # Back to perf terminal
>>   # ctrl-c
>>   sudo perf probe --del commit_creds
>> 
>> After a short period, a page fault and panic would occur as the kprobe
>> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
>> is supposed to be used only in extreme circumstances, it is invoked in
>> FTRACE_WARN_ON() and so there are many places where an unexpected bug
>> could be triggered, yet the system may continue operating, possibly
>> without the administrator noticing. If ftrace_kill() does not panic the
>> system, then we should do everything we can to continue operating,
>> rather than leave a ticking time bomb.
>
> OK, the patch looks good to me.
>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> Thanks!

Hi Masami,

Thank you! Sadly I took a second look at the patch and noticed I forgot
to remove the existing declarations of ftrace_is_dead() from
kernel/trace/trace.h. I've sent v2 in reply to v1 in order to correct
that. I'm sorry for the churn.

Thanks,
Stephen

>> 
>> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> ---
>> 
>> Apologies for the wide net cast here. I recognize that a change like this
>> may need to be split up and go through arch-specific trees. I hoped to get
>> feedback on the patch itself. If it's satisfactory and the architecture
>> maintainers prefer it split out, I'm glad to do it. Thanks!
>> 
>>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>>  arch/parisc/kernel/ftrace.c          | 3 +++
>>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>>  arch/s390/kernel/ftrace.c            | 3 +++
>>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>>  include/linux/ftrace.h               | 2 ++
>>  8 files changed, 23 insertions(+)
>> 
>> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
>> index 834cffcfbce3..3931bf9f707b 100644
>> --- a/arch/csky/kernel/probes/ftrace.c
>> +++ b/arch/csky/kernel/probes/ftrace.c
>> @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	struct pt_regs *regs;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
>> index 73858c9029cc..82c952cb5be0 100644
>> --- a/arch/loongarch/kernel/ftrace_dyn.c
>> +++ b/arch/loongarch/kernel/ftrace_dyn.c
>> @@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	struct kprobe_ctlblk *kcb;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
>> index 621a4b386ae4..3660834f54c3 100644
>> --- a/arch/parisc/kernel/ftrace.c
>> +++ b/arch/parisc/kernel/ftrace.c
>> @@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
>> index 072ebe7f290b..85eb55aa1457 100644
>> --- a/arch/powerpc/kernel/kprobes-ftrace.c
>> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
>> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>>  	struct pt_regs *regs;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(nip, parent_nip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
>> index 7142ec42e889..8814fbe4c888 100644
>> --- a/arch/riscv/kernel/probes/ftrace.c
>> +++ b/arch/riscv/kernel/probes/ftrace.c
>> @@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
>> index c46381ea04ec..ccbe8ccf945b 100644
>> --- a/arch/s390/kernel/ftrace.c
>> +++ b/arch/s390/kernel/ftrace.c
>> @@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
>> index dd2ec14adb77..c73f9ab7ff50 100644
>> --- a/arch/x86/kernel/kprobes/ftrace.c
>> +++ b/arch/x86/kernel/kprobes/ftrace.c
>> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
>> index 54d53f345d14..ba83e99c1fbe 100644
>> --- a/include/linux/ftrace.h
>> +++ b/include/linux/ftrace.h
>> @@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
>>  #define register_ftrace_function(ops) ({ 0; })
>>  #define unregister_ftrace_function(ops) ({ 0; })
>>  static inline void ftrace_kill(void) { }
>> +static inline int ftrace_is_dead(void) { return 0; }
>>  static inline void ftrace_free_init_mem(void) { }
>>  static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
>>  static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
>> @@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
>>  
>>  /* totally disable ftrace - can not re-enable after this */
>>  void ftrace_kill(void);
>> +int ftrace_is_dead(void);
>>  
>>  static inline void tracer_disable(void)
>>  {
>> -- 
>> 2.39.3
>> 
>
>
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
