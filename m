Return-Path: <linuxppc-dev+bounces-7973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 040C3A9BC51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 03:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkFdS2bdCz2y82;
	Fri, 25 Apr 2025 11:30:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745544604;
	cv=pass; b=KNWOob/W/6Sn75A4ibYQIeOTxisNT9KGXTEZgsMNA23s1qcknJYOPM86M+h7tfBHXx1AXtSUIPdlSjKHnyq2P8wBg81tpH4Ejpdw2g53wtUHqMr8Hcg/i5BKkCIXfunpEJSRevzwqDKv2pmuW6YfRUBEfji/+N6yCxMtJ9aXDnBXny0pxzan49saeG4GikGC+NkXnnf5snGUOg+UyHDJLo8hzyzR7DP0aqR9LS9ZN6WfYmEtL3IsEZbmVqzOryHcT8ksZkwrauGtKlp3q/luC37WuEhZNNMizRX0nIcZ16D2uNPejBa/nQYl0mIxDo9A7rDdyMgpbNisjrQarFQKbg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745544604; c=relaxed/relaxed;
	bh=i7NfukhXAzTymU68yEfpZpPfeHHWyKOAzDioaYt1Dig=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=CjihhihS8jrS19NVYck+gUZU+27CF1MdsqPvIqs8awxE/GS7DIkQhvHsvjZklD4PE2lgGAiZMxLFcWogHk58WG/M1JAs5iGExEA4tIyMDvXzePsS/hUo/mOd+TDvlePtHySfQTR4m7RS2Wgk2ElfKCxsiki+uae3WYWT0nPvpGlTQa2BC/eeaANSIAsAz3yVx7rAfu4in0zLQQLQYlYzOTq/UveJ0Hf4rvqfHcfR3xNdVfIFxiDekBz6OWGl/oV+Tok9XUe+sWk08pd+cwGVxUOV4ev9T/V2J0KffH4Siy+FUJB8o4W2I7sqr7YqqgTzIas2FdHgQL4hOO4UW25W4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=gXue2xQF; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=crhyDK+e; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=gXue2xQF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=crhyDK+e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkFdR1lMLz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 11:30:02 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P0XYi8018023;
	Fri, 25 Apr 2025 00:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=i7NfukhXAzTymU68yE
	fpZpPfeHHWyKOAzDioaYt1Dig=; b=gXue2xQFEIvjD9susvVRFUSwr6y4btEld8
	HrPWERyZRGiAQ9PlE2K5/VK7k0ASwEKyZk7hw706/s59EZ0+9m2rh8mbR85CS4ey
	9FBbK1a0fj8otVo3GUS7wc3Y3bN+ktOVmaJH/Er0rBFNcPgBbVxB0b0THWN1Yuof
	Yb6VQTjL2k/38AFTkZ914Bxnj09kU5hSFUm52GZf578Az9lTD1QE5Jlh6LdOUE2r
	YSJcS08+P7IwC8P/op05iv+h5Yx2DXGYogcoU/PvXD93i2Th0QLf9yJ5ppOQzXl7
	F1UtAHCsyZ9tHv4bIRYBvJdXHw80P9LMKf7kDGOAeKtzthzdLo0w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467yy7015d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:51:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53P0VSbN025226;
	Fri, 25 Apr 2025 00:51:09 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010005.outbound.protection.outlook.com [40.93.13.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jbst9f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 00:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnxhaG1pl+Si1DJeyqsLUNVu+fj3P0RDxATcsvUfAlbfru6XX/ms5yUZxx+ysyHzXPCRwvlA0/GIb5isxxCev+aYZ2V1C7/edHY1axeJqLslEXFj0dTM+yT9rc+OuCaF455YKINVP4Lm2iXOK1pI3kHN4f8dCATmS0i4Rh9PgszhIAdW3WQOn+cPnxLx6YHAZA8v213wWEXcd4QBdal39E6vVAFBlkorsqOm1Od9eBN+bNLpw77jWU/6LEnA6I7/J5vD6pPdLJcegL7Rzxwib3syRG9cFUia+XnoUHjxtmujUForhXRSSh9Bt3wPWNzi4Qj/OwO/qpnYBe4eeyPmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7NfukhXAzTymU68yEfpZpPfeHHWyKOAzDioaYt1Dig=;
 b=mrrzDBrxIc1ENT03cAVgl4tFPrK58LGyIKOK0bExluPkMFB7iNWnHTzitITLuK6BiJu23NF8Dg6VpcVoh4hxPz7eaIcO+3+4FguSsOenoAsFArRBCb7uXhcoOQHwVbZDVzilBvDBcuzExXsJa+V61HqhCseIQnXfdS8LTgBQzKWXMPYn4RSQ8vkDocMDPMcs8Fl9duagKxh2ksPX1RhoxPzj4ASfJZ/PnSXSpVXertn3OAHeUYMvhBcSuv5HJeXrkyAlQe2JK/RgMoquZOifBpYrGEDBZHULLs0YSyT9TSy7NBFkJjhaGMxeP7rtShCmWYcFIL3T3RWkynZdq0gDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7NfukhXAzTymU68yEfpZpPfeHHWyKOAzDioaYt1Dig=;
 b=crhyDK+eG1ojkQyNB8wfiNyYIdH1quYydbDn86obF4c7fJMUZIrYiJRnqj4PzS3WK921wcz34RpYRGtRsOmrAfOmjABy3bLkmd0y9WKxeA7XyaB/CC6R59lVPTukl7jxwBiXTc2KiFfZFERFgylDG9SsHXkRtc/UY1yEwLmulE4=
Received: from DS7PR10MB5344.namprd10.prod.outlook.com (2603:10b6:5:3ab::6) by
 IA1PR10MB7167.namprd10.prod.outlook.com (2603:10b6:208:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Fri, 25 Apr
 2025 00:51:05 +0000
Received: from DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680]) by DS7PR10MB5344.namprd10.prod.outlook.com
 ([fe80::b527:ca1f:1129:a680%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 00:51:05 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/7] lib/crc: drop "glue" from filenames
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org> (Eric Biggers's
	message of "Wed, 23 Apr 2025 17:20:31 -0700")
Organization: Oracle Corporation
Message-ID: <yq134dx6p3o.fsf@ca-mkp.ca.oracle.com>
References: <20250424002038.179114-1-ebiggers@kernel.org>
Date: Thu, 24 Apr 2025 20:51:03 -0400
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:408:143::22) To DS7PR10MB5344.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5344:EE_|IA1PR10MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c0370f-6c9d-4713-f6d3-08dd83934258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i90Fh97DN9/sChCA+NYfa9EY25oYoXWOyYYeT+ESS2hGWv3E80WShMY4RBc0?=
 =?us-ascii?Q?q38yVNSfnQQRzIvgZ312lLi6iQFYdlKC35doN793EboBkIbgK+Lz3lBySNvk?=
 =?us-ascii?Q?whHI5VJEfCiHaPUHLoLBrBa1VJ2GJRyQYiLIFiYuPaAFFZXihyLWHFP068A5?=
 =?us-ascii?Q?o1CFBvxAjjTceeOkfV2o2I1D0I5DkHAKJ809jZCy3x2MBhUxQoHRPKhyXcIL?=
 =?us-ascii?Q?wbowEXTUjKcqqk3wfQeS58Lx4v4UPg2jI9d0tAX/qfYoQGWiCwBVKNnZ26Hj?=
 =?us-ascii?Q?k9X8+9IASRxI3IBw8EjsttxucXFh4Z1ZwpB6k/aocBBIqiyNuZBUrtEQNM+2?=
 =?us-ascii?Q?CexFJdfdv0RKGXRuGKo0X2iPZCU1oa3WxBz3GA/iYad9IRUPhl/hm5bYRFMi?=
 =?us-ascii?Q?FIIiaVAwzc+Gm+bI7WHM1Lbiw4+DGNsN+wnMRWaWY82/+ivNgVrsyEtOQDpJ?=
 =?us-ascii?Q?8LNhNkTMXYh/JszfXKl9HO3m9Y1VpS/zlfX129OcVZ81EACTlrz31gpwu3Th?=
 =?us-ascii?Q?ODX1toLxYIXRxBzAX+uh0T9O4e+XKidUgQysPI8PgX/LAPiIRFkEmdq5do/w?=
 =?us-ascii?Q?9uDMlXZDAI+c8rHv5473Iam8IWoWz0zHcFhLsHEBpebjZmHhPryo0g0ljC1i?=
 =?us-ascii?Q?z/dYo2OAHG6LWjVSbbpBTbaGNzKGHoRoc09qw4m2rirjn19Vfs3JtoK5i0Qu?=
 =?us-ascii?Q?d4aj/G71M309XlrLpquUIwAoaQdLyqcwPU+UQ7/gTOtO1k20eaxm3mOeF8f0?=
 =?us-ascii?Q?+qNL+00t+Dg0PGD/xa3ZrrtYRdexAnxGjBfQWN1oc/nNb+b6JPdTrpg7jPAi?=
 =?us-ascii?Q?PyTYm3647inJK0fVBfNqQy36T50CI+D1qgNYsV2PQs+6MjcZX1+DNTdgE/ZU?=
 =?us-ascii?Q?Tf97zaGsS13fqVq95T/ixR6PpLRIUdxFvdlRuTokvHyz+raAxntZ7XkkscHU?=
 =?us-ascii?Q?iDmxubrtfyCb6RKA4gV9MagEnkf4WAvskcnz5aieGGuJEoUJqFprfCeE0n8H?=
 =?us-ascii?Q?OlgZzHIEXR+U744wZ6OugW+tq7nZ+rWB9xcCIfqR0k6ZUkXtFC3e+NV/2Etw?=
 =?us-ascii?Q?H3bodyt1rtbmgFG0WCS3EptzukFC9GKAoGK1JTyiY6zamFqY/Hts41nrn+6a?=
 =?us-ascii?Q?8S9zskkhR/B6QddyA+s3gPqg6YIqAGAmdNbkw9M9uV+jLGZOEHjvXzJGHzKK?=
 =?us-ascii?Q?s6C1W8R4cWz7Nz1WaezF9rehPAPYbEsR3eBZWkJVOfMAMrBHT1GI3dXWFiHr?=
 =?us-ascii?Q?DMvJCKUVL71EucCLqeCeiWK+b2yXnuqBOPKp/XZ/FyUE/kxALhZdmIKj3kDb?=
 =?us-ascii?Q?oT/l7phdCX/honpni0wG2L+0TuxxpfnHs3kN3vBMYoGL97nTTfsa+Z1TKP41?=
 =?us-ascii?Q?hz7VN8tsPRk2yeBVOibPQFA2mheco7JH1+NbeKNF5/L7uRfZ7uoCnqDKmpMJ?=
 =?us-ascii?Q?Ik/fb0wipWk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5344.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cm7SJtsz0QM3BylkOO/7tEpliHp2ZCP9svSBJ4qjsc2DobKfcyoT1lh9LX+t?=
 =?us-ascii?Q?6waRKe7xX++2iDCFEy4zglMuY2Kne6hGiKEojjBlk/fHO/C5nyd9DVi8ctfl?=
 =?us-ascii?Q?BJNmHzg+pjUU/vW+K+DnTit7O1jZL6EwNDygVcswrYT51f2PHTQd7uXtJw37?=
 =?us-ascii?Q?LJZf/Cmnxip2eqJrnWJLaqQAWrjRdwNcJk9YnP7HHNQ2isRHulBtovorMmqG?=
 =?us-ascii?Q?fyb6tAtIINMBIKjTkxZKK7HlXuTptjQSVxy2UlTi6OS2H4q5bQ3eutzZst1f?=
 =?us-ascii?Q?BIe62fPvd2HvwM2uSh1FAx3xnrXgiwcpNQC9+Xw8HCDau1V3B75O0UOdrY9V?=
 =?us-ascii?Q?28KCAc6uRmxml+ULkRhyLQEivam73XAVCo7I7yol4ZC5kWEnA3EvAiqQhiHv?=
 =?us-ascii?Q?YTddRVnkhwpyK8RvJsKJna1jRGRTFNxMLimxS2ftSqwhakr9lLjh2WK6qjK0?=
 =?us-ascii?Q?2pJj88C4w6K/xBGKLNTKL+iV11Cvjpu3oEIG7mVVQPjkpV/iRb4gKeiDbCVX?=
 =?us-ascii?Q?eDLPclYWCANMH6+KTDQYx3wbpHRrFMQDFlaei4ium0kLurrRxRmiuQhtBCeQ?=
 =?us-ascii?Q?wcLvLJXMvuYnMdmWNcs7hUD2E6cxOFqNaZpNGWzzmmajtjyPgfuWboTplT6V?=
 =?us-ascii?Q?X0tvn1I/tzxb234VbcvQ01PzAymrXcdlahsi20Sy+scc403LWmzxDnRCuwkr?=
 =?us-ascii?Q?SW9dVdbmk9mjhG9lR9oMqFjnfpl81FEUSIA8VE6P0jt2mChp+Id+A1IuZt5g?=
 =?us-ascii?Q?h6nuJeL204a87g96BuTR8IHnN4L05h9qzIAA3MFO/VZlG25Va/Z0BLbllwXt?=
 =?us-ascii?Q?X3a6Mnt2j8tY+PZFC4mIYfnap6vVdyiVJ94KKpj90mm6CbhUXhiHnb7uMXbW?=
 =?us-ascii?Q?di2t5Y+px445gql7sJtfNRc3rsxU4fwjQqh/O58WmRjWffshq+fm87dkLG2T?=
 =?us-ascii?Q?ybXCwYuhm7GHKTIwaJFZSrACtc5tKoedjI3Wpw506YhCJ6w6MBsLwHCZ9nRw?=
 =?us-ascii?Q?LzblB3ca9LPqcDsaUZBj5zyamrJwEPUzDf9t/ssvwtdYVtpFYrLTWjMznUHe?=
 =?us-ascii?Q?XQFEmA1IRlxomyVRkFvP4jFU0MOF3SLUDVsGmkywL2ND9anhti3+eKO8WaUG?=
 =?us-ascii?Q?aHfgXWbc7DGidTymx++0rpY0EAmyofFk4zQCImYslQd9nQR3RdHGw0eVLED5?=
 =?us-ascii?Q?0YXDbpUynAzJHZqZQGbI1yDHyi+n2zgJePA9Nh0pGJfn9SA75bISZ7PINlwC?=
 =?us-ascii?Q?5uUGljKbcO19Ljj6PKUt9SBe9rvSpAAKApPKRt+gCFYos3+iUKGBZ7OpgYjw?=
 =?us-ascii?Q?Bdfjz2i2cxnDEqIf6HDIIOxgnsMRlh3HSYoojxCAd5OA3Ln02S0YLNS9l1jz?=
 =?us-ascii?Q?/jrbxgqJqECXBRSlOcCx+xy70g3nPtSynSIrBSz4S6jfJrD5/jh+yA3Vxx3B?=
 =?us-ascii?Q?d/Kj0WB78HKJyty4XLxqxscbNwgSxAHUz+bZafGURhyMHPLPgaiussUCmtys?=
 =?us-ascii?Q?ja+JFIr86eM7LBhvuuJAyX6VQbbQocmEkeZBjW1RMknu8+gUr4X214DpxMKp?=
 =?us-ascii?Q?VJqrnLAKlHey1C5o1qJr13HQgs9CP/QsAa4JL4PoNnqtI9iip1tfQRLI5pDR?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H8QztZBfSlW5NUfFQ+XZ/qdJJF6XpFmPCC18kXVVAnFUwUDTwMM4Ok54OnqgpEAHktyMUR+I6D+NXbwfB0bW8HVb73USbu/UvQCfaCc6ZpzbuNi+V2UUiz7Xk3nY5nOXzCbM/PL9i1cDd0rzis/JM/bG4AUmV1Jp8/hFDQPYgZzwCKo7j+u4ExK9EWKvfutWULvwyGiUd6zv3BfbtHfX8UaZ1a9Aun/o36xvS7a8JArdttDC7lqWbI9wQkf/L/SAdzuWVYC5osZI5FomxKnnilawWrDKPmXJyOP4DkCte5QsBLb/kHt3TrGS+Bf/l4gBGDRhbvPikARhaO0z6quvhXNooqrKdPlltXKu9HX/Tcn0P+C5CQIuj+tiVS68vdm1wBbY4VSvloxi7XlogwsuSGO+jbVCym0Ha3OAEFmkxBrRmnDwrSo+jl0FiQbvcX4QKNnOH9X9QicPCdgU8ZDY5ibj5Tkf+Nf6ifOe/WOfZNVU7pCRzRRXcczbDw33EPZwYZqKw3qzQ1vI7dpohv1Te6J9nF1hGDn/H8knotdZQgoP36Vh41OCbacBNoJ3gsRS4CS1xFeEMMMfEeQC9tf1Hg4FzJviY0uofc0/KQZtBH8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c0370f-6c9d-4713-f6d3-08dd83934258
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5344.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 00:51:05.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4O4BanKku7sfReq3veirVOUv64YISSA3B5NjcKD4vL3Hco4I3l8DVv93ZsZkkUyo8P7fhPFy372zaZVQ2bhWbGxKYVPdDtZuqAW4EwiG/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=664
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504250004
X-Proofpoint-GUID: jErg9ZTKxFx6sf4wdj9NJ4H2JyR-4NF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAwMyBTYWx0ZWRfXwaZam67S6REq 8qTgn0J+WvJY1+ivxhI3jPoxoq6PoS9HTewlPjmuXwTl4BpkwMjMk0CXe7MPvqMADDHxFzK3y+r ySzz2k42R5ZHz56/tFJU/BLjQcLBV19stH8H6NcaJQNQuFhkduXrkhENt1JmAFUFjP6jDH8hNj1
 /o7je/97dvVG0FVwTKi4olkO26z4VSbh4etfiUpYglfOXqVI6Ye7vYYcLNOpIwZL6KMC1LfmK/F M2VBgdh7//Cj4WSVjF1hc7toLu0FkDYYei+Zr9YpJiwRWK1w3TKlxgbHKM6zLM5vOrg94Ndko1b /LGQcXN0zKrT0q+a02fsjTMgR5HPB9eeGnW5e862kBPChdW12x7EssNzaqwctsoMFwrMCjTJjQE XtF/K/bL
X-Proofpoint-ORIG-GUID: jErg9ZTKxFx6sf4wdj9NJ4H2JyR-4NF2
X-Spam-Status: No, score=-2.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Eric,

> This series fixes an odd naming convention that was unnecessarily
> carried over from the original Crypto API code.

LGTM.



-- 
Martin K. Petersen

