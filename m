Return-Path: <linuxppc-dev+bounces-36-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96394F975
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:15:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Qz8k5Dob;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=GjuWjazV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTP80m9Rz2xdl;
	Tue, 13 Aug 2024 08:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Qz8k5Dob;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=GjuWjazV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjRKB2sC7z2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 06:42:19 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CKXVJj004831;
	Mon, 12 Aug 2024 20:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=zoWTTVFy7QrKeQL
	ZWY+u9onMM25Iy0E50aFiAeERpSU=; b=Qz8k5DobQif5X6giiRuaCxmJIcy+wDM
	FkjOszA83iR4XJeBiZfGQPtwXn88r7O0ZSpNqp5041HM7OVeTWqb+NSsxof8Pa5C
	tWb+nCw3BJiX5WaKS0AyAlSm0JH3z73rfpAGgDE/uddNeqlPT0FroUl+z4dSPiEa
	ZDsOiE4qh3SkVwHi9PlK08imzQSGWGa8cwNGEZcATy4q+ejf6oG3s6ct5sAQTAnE
	Pi2zcL14xik2ZPMtp6xw9o+w1a1m5lAq4JorQ/H90FP+1xmliqHDuXY3DmNuMBNx
	x781Ey1+n07bwmBwetNkSKMrHMaBM23b1g1DiHwOAUEUMQak9dsQ2Ng==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wyttccyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2024 20:42:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47CJL8bE017856;
	Mon, 12 Aug 2024 20:42:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxn8hvpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2024 20:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTqj4gSxe06q0Z9Edd9Ars/yBAd2UXlDc0T/am+v/5shKwo7CjpIr0FWgHCLpSJlyyNLWgBsxqk0zUzeyQWd+MoYiXB9/Q0jXSzALzml4c8b820gcuC4KYUFiAY9FKVg6kFbQvXtsWaKHqpC5ZWCRnof4fe3NG54SB+3HOf7QcgTIFujhXxHcOB3sw0UWdss1/42KH8/ZRxlJYEnrak4YuzI+cuIdMiN42yHKirpakHoV01EmcfqjKiCHir5sq7hSLRKD+n7WdgM3PbDa5x/a+YG/wGBcKTCzZ4s8FxPrUWZT55BOckok8rZp9Hw1Pgo5hwB8YnGIlPSfuWcdDPBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoWTTVFy7QrKeQLZWY+u9onMM25Iy0E50aFiAeERpSU=;
 b=i9wVawrqepBrRusd9umsiC9S00TD1siji2RhCjJ5CSHM1DY0LHmNOOA76f2HZnQrVpbV2/YQZZn6GLxIaxALpadXiLoiNJh0CQOmGSzB0wvhncehVcWlz5ALZjcJDKLQu0zgJ7+6+8wDj1xoS/lY1j7vEFJ5/v3vyQNic1+nb1dD+TE+Veacxj2/YO0IZA5kpT5r5UcSIjm3mGfrd9eDdlvlW1ZTZHYoyWfQFFfNWpY7n6tAEOulUtzzsK3nlbvOnZLsbNbfJ/orDBoLa/gswvm1A4hJs+8mryQVTtSjS2OI29l1gpYQilruA9HZALE+cBEIOycPmYCLWTLEH6DilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoWTTVFy7QrKeQLZWY+u9onMM25Iy0E50aFiAeERpSU=;
 b=GjuWjazV9tHDK+so9OjLg7k6/DrR/rJgqgVJgMrtpgiCR10W+x0/E1j18KhispT51r4TSkslwcL0dp/KcVo3k7PLzcE4MBFppqALnsw0Vt1OZEYkbNyZ0uk0fywpijt4faBYZhsLTe8uFqxrTe4+E5NN8OyccMJk1EAR1OpHJUs=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by MW4PR10MB6557.namprd10.prod.outlook.com (2603:10b6:303:22a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.13; Mon, 12 Aug
 2024 20:41:56 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7875.012; Mon, 12 Aug 2024
 20:41:56 +0000
Date: Mon, 12 Aug 2024 16:41:54 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        torvalds@linux-foundation.org, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, jeffxu@google.com,
        linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
        pedro.falcato@gmail.com
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
Message-ID: <ndbsqhqigfnuusjsrnigqaih4yx7utfveqxmt7d5kiquxv64p7@z63e6za36d74>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	jeffxu@google.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, 
	oliver.sang@intel.com, pedro.falcato@gmail.com
References: <20240812082605.743814-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812082605.743814-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0219.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::24) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|MW4PR10MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b698b7-9267-49ba-eff0-08dcbb0f34e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2QSaC9IHxDwOxP9uKJyOR+nx6p8zUS1YVRhrwQXhnJxTXjVciybDzmW3YYRS?=
 =?us-ascii?Q?eb0PwI03FOwVV5P07GC7AvJoujIDeYc1HaZyFhn3WSIy8ily2gH6iI0XiCMr?=
 =?us-ascii?Q?M1gAXsVQ2VH1npWvkHq2sHvc/c2LaI3OzprDT4M6uomVUYuurj3dTZ3DK+jf?=
 =?us-ascii?Q?nU2dM1GtDzqmwZMNDUOqLA2WwFG95VcFQPTJBG1Gev3mJqVU7qqA+SYEKKdL?=
 =?us-ascii?Q?3GRmEiurlq4y9cGxCS6IKHYasxm0BO9sAC/reS5eaVWXvqwnNeF6kK4u5b9w?=
 =?us-ascii?Q?mOhp7eBKN2m2c8jwnJyoaiUqPAa/FU9DduXbIJX+QnWrCeTCXyV/jajolw2m?=
 =?us-ascii?Q?kqk7mqvDW0iHQolEnnsKKr5LOWNfQNBOBfU5qjyB6teP79huIX+9HlGcrm2D?=
 =?us-ascii?Q?heACi12o1VlLWf+WP1BKG/8nftAWVd1fZgL2U/ukmab7T5OHMDdMP7Jf/JCL?=
 =?us-ascii?Q?OfVmlBLN/PbEE3EhNrJZHJ4kXgKamKL1m6owro30c9V1W0vP4VWwI5ucQjJn?=
 =?us-ascii?Q?gwHaOzsZ4CS1D5ze5Qyb3rz8ybYiSyUKXe+ZcWi4XJFtXi0mea+QpHuVyVQT?=
 =?us-ascii?Q?VlaNIzeDf0P9G1OLUqbvWVD7yaRWm76N/mJOMZgjfRhH4umt6qJsujx6gFSn?=
 =?us-ascii?Q?58SZ4v7NyQy0agQrjFjaNI0YGLxaEK6pgvgucUtPrZ8oiaZJ7kBDvfbrQH4x?=
 =?us-ascii?Q?ROu9BcAERkg4nh464tbCBrlLvq8Xbz4evyns/U8u0VCGOT9q1v+Mi0XBFhDw?=
 =?us-ascii?Q?TImlb8i7W3hWr5F3QqPhRjxqcnoQrS/1gYlimvwAeusOfPFRbHTGLNqsJwVu?=
 =?us-ascii?Q?oW+K4OKcUWpbYiw2Fae7/W3rLK+hGkGt6+Xk5nzt0L/y/YAkUkTDOZi0TwvJ?=
 =?us-ascii?Q?t5O1SbqCb0JUk8/0u+hQkebRdBOWN7hpoGGyamy+pd3dcs5X79P5meOUCdb0?=
 =?us-ascii?Q?uwU/A7CQmYnfKZmT7GMc8tw2LX1HsOaiK/c7YS/UJQ4IkjL26sxUczQmBbvo?=
 =?us-ascii?Q?rIZhKVtlCFZa5WRGVU9dzacBRf6GGG+zIm/gAzGDllK2xUSRZ7gVbaMeGWj+?=
 =?us-ascii?Q?LJlQ/yZaJ8He5HzAX0pqAyyNh0gQbggLzzyDEMoTpldh1rmH0bMx9GpAYDnS?=
 =?us-ascii?Q?l13uwCcUkCR5ydKHzT2T3IHBDSp/xmJ+XPY/Y2QYtbUeyymg6repW0OzOCru?=
 =?us-ascii?Q?7j02ubp1e11g2FuEkA9wcwuCiI2XSleSWg0qQGmYUeNWhJIk1idHjE30G9nZ?=
 =?us-ascii?Q?b3orAUhGXCFYHMTnO0GArNgUaxV3dof+J/mWBRaXgdTU7UWq4Gdi/b3TYAbK?=
 =?us-ascii?Q?PHkdPn2jwmRVIAGrdNBt05np?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZqfXdj+lQjuX6V2I+m+4+q0n1g8o1LZiesm4cqlAqhNNhQnqosG96mokDi9?=
 =?us-ascii?Q?qEJtd8dr2Nc04zeerZxbSTohM1i1axi8mAqPsG8lfDW20PrLv1Wotg9o7Baj?=
 =?us-ascii?Q?tymkUw0p7UTWzw2iqAROpgq7Aw9VI/yZkP6bpKjeJE+q3wAghyskBV7FXJun?=
 =?us-ascii?Q?zyjiiEnqAUcwaDaj1NKsQiQYczQHXAo7XXEcBuu1S2yU8y0EE3BNF5dTHoAG?=
 =?us-ascii?Q?pv7jEyfTww1/z/2cMbS8Dlp7khUGDvriaZzZkZLXPbfvKAs4OyChZF8qvx0E?=
 =?us-ascii?Q?dJCmjc4PC1L/vKbHIgCJA/LidPg2kqqey83Xs1trbBhecdHTqwH1J0Y0B8yw?=
 =?us-ascii?Q?pSFmQhAYxlx6gLMqsWMaW9y6jLrGDg/oYbIMrxV6x5PQ2OXZ4PygjfsdnjS6?=
 =?us-ascii?Q?U1YcVQHmgldbBerZXQa6RLMRoyLF0WOFHlu37j7DfOrANas3fnRmdQ/hXjp7?=
 =?us-ascii?Q?Gsck1Ken75Ks2qdCK3+cISHqRCvL1brNTmVLDt8cks1N8l3xtZG3rS2AfF7B?=
 =?us-ascii?Q?zBhcPOJqmN8+NVzNBfHdotAg8CUw5Q0T7NH2VjQsagQEOB0VPc5kT4IEbp5e?=
 =?us-ascii?Q?XiaQHDz9m45b/DWbOLF86styK8zMgvQLKfkf7054ce9MKc4FHUMP5YaO6H1g?=
 =?us-ascii?Q?lizZm4U2x6GeIgaNRLCMb4xo2e2MyIaZMCsmptLSToYttUFUO6/0UlA04B5c?=
 =?us-ascii?Q?swonatjRjnNeSCHcoceWrl3nMwC8hTTZcZb0E+HJdiRvK5ymouDBfURTYAPu?=
 =?us-ascii?Q?DVNy8J4qQTnE0BunBtMYZD8OlCw6dYI2bWax19CpNuBP6zna6Ibf0NW1jZC7?=
 =?us-ascii?Q?ilmuxAuXZ2WUqBs4V2DHR5hn3CRBYCQgBKgLiSFYZcbhdkaGXAEhrP8LqEBp?=
 =?us-ascii?Q?JucdpscQoelRVkpu7yvWZi8GWrqPVnScuTRHkUx7piriQtC13Q6KcqGlJyqF?=
 =?us-ascii?Q?X5k9Ao/l0w3Aj6jhSaNlJWkWJQOrMSqEV3/vDBu5skb7z/gXs1ekQ0f/yDcW?=
 =?us-ascii?Q?+5tKBFyjAwJ7gS8N29ckHApMQQNSn4q00F5wPnec90Bp+DfGknxAKiAxGlmr?=
 =?us-ascii?Q?4UgQBxi7IXJLD/JaoL2EIa1UB4upg8UPTLDU2s6W5XPRuz23fTEQQL7ORQ6C?=
 =?us-ascii?Q?V+NF/HcbfV0uFXqCtFYFHLqzydFPks0p0UeJZnXNv+EqKMAO2SGlUGS44ki4?=
 =?us-ascii?Q?bs7rWDTIRnahxFFK930/az1ddI0T62XZWcgj2vTPKBZZDoEKI8AgH3Ho0g6+?=
 =?us-ascii?Q?dDgQsK6HYS1kJ7viLPeQGWBreJerN+CFDAY18FRPO3A/OCAV5vx/447xsrHB?=
 =?us-ascii?Q?vA7MMQiS9TiQZu1IZ5v1o9e/bWviHMolL1Hi2+6IrMtLuiGzBxdMmeFT0ok8?=
 =?us-ascii?Q?gk8yyBBV2DIRoKKCuDs2VMxs96N9hJh6L+5ynQTSRktDPTFjgLrddVokqX/g?=
 =?us-ascii?Q?en77xbwHYOucuiailsJsihWXQA0ioZkfnKIiRzXsdMnu0G5RJX63Xsdu6910?=
 =?us-ascii?Q?yreGPXLAum/+R41NPdf2U3k35bkhsov2JgM/10P+QvV7f6en6Z5ShiSHMFQ9?=
 =?us-ascii?Q?pHsN++sIIGHp7vxe28fGZh+pcU4/U7ubQW2WH5D+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jKdwDpPSSycPegPzW7xbrVr+zT70xdcyPoJ9g26odoy5Cmk9Ipw5D+Uhd+UvuwabzoVxoaCx44w68qPI8QQUR6dZAy+qSpSoVxf/gxjVOtjTNxfS8PaFilnlaZ4bpdnm8Tmfd28vIHXbUFjsqp9/ZT0G3YIHE30Up25geKiOVUcqwQk1Bpr3GjB8z0D1gVt9NPGTWl7lU33d2EiVYJt5mhU+7PPZuTHTrpvVo3KrblrMh6P3ImM9ucUY+V6E921/zpyvNhcNP7sXXmQWfWD+wmioMOBt1I1Ol0jE9ekl2o+HP/FwDvm4GrSN66Yc10Sk5pB/qSqjVlVl8Hx5gXYypG5qbd/hVij40wXvtX9ex2PXiU2vvKr2lYrocnWIHDcNITRnYpzJSC87b2f5EskmLp/5JF/jCy03mi6tLW7YPgAPNK222wu1B9Yf+dSdeENSqR668qarr3ibXxRcAvG1nnBiV9Lx+n3UqiUIaWZQswEjPXbSg37jafekNMUJPaXExQD4kvZbai1Slv8N241meZYWLg4KhKbid9HSykBxsLIHIpmm5w+21PjDTQhj1umAmo1bzvBJf0KG8sQYe7q/ZFdvBBuDqrAnjqhCxQ2BlU0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b698b7-9267-49ba-eff0-08dcbb0f34e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:41:56.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5PkzY6wy+KWdSYMT2wkvi4tteHEBA9gL1OzazPKB4UqihIBNmmBSAjoz7w+Qf3qbt7QM9Jg83/KgQT/b7XTxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408120153
X-Proofpoint-ORIG-GUID: 0cxYHpPf4tvhgMtHfa1nMwbXPdXhP2ae
X-Proofpoint-GUID: 0cxYHpPf4tvhgMtHfa1nMwbXPdXhP2ae

* Michael Ellerman <mpe@ellerman.id.au> [240812 04:26]:
> Add an optional close() callback to struct vm_special_mapping. It will
> be used, by powerpc at least, to handle unmapping of the VDSO.
> 
> Although support for unmapping the VDSO was initially added
> for CRIU[1], it is not desirable to guard that support behind
> CONFIG_CHECKPOINT_RESTORE.
> 
> There are other known users of unmapping the VDSO which are not related
> to CRIU, eg. Valgrind [2] and void-ship [3].
> 
> The powerpc arch_unmap() hook has been in place for ~9 years, with no
> ifdef, so there may be other unknown users that have come to rely on
> unmapping the VDSO. Even if the code was behind an ifdef, major distros
> enable CHECKPOINT_RESTORE so users may not realise unmapping the VDSO
> depends on that configuration option.
> 
> It's also undesirable to have such core mm behaviour behind a relatively
> obscure CONFIG option.
> 
> Longer term the unmap behaviour should be standardised across
> architectures, however that is complicated by the fact the VDSO pointer
> is stored differently across architectures. There was a previous attempt
> to unify that handling [4], which could be revived.
> 
> See [5] for further discussion.

Thank you for tackling this issue, it's much improved.

For the whole series:

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> 
> [1]: commit 83d3f0e90c6c ("powerpc/mm: tracking vDSO remap")
> [2]: https://sourceware.org/git/?p=valgrind.git;a=commit;h=3a004915a2cbdcdebafc1612427576bf3321eef5
> [3]: https://github.com/insanitybit/void-ship
> [4]: https://lore.kernel.org/lkml/20210611180242.711399-17-dima@arista.com/
> [5]: https://lore.kernel.org/linuxppc-dev/shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/mm_types.h | 3 +++
>  mm/mmap.c                | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> v2:
> - Add some blank lines as requested.
> - Expand special_mapping_close() comment.
> - Add David's reviewed-by.
> - Expand change log to capture review discussion.
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 485424979254..78bdfc59abe5 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1313,6 +1313,9 @@ struct vm_special_mapping {
>  
>  	int (*mremap)(const struct vm_special_mapping *sm,
>  		     struct vm_area_struct *new_vma);
> +
> +	void (*close)(const struct vm_special_mapping *sm,
> +		      struct vm_area_struct *vma);
>  };
>  
>  enum tlb_flush_reason {
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d0dfc85b209b..af4dbf0d3bd4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3620,10 +3620,16 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
>  static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>  
>  /*
> + * Close hook, called for unmap() and on the old vma for mremap().
> + *
>   * Having a close hook prevents vma merging regardless of flags.
>   */
>  static void special_mapping_close(struct vm_area_struct *vma)
>  {
> +	const struct vm_special_mapping *sm = vma->vm_private_data;
> +
> +	if (sm->close)
> +		sm->close(sm, vma);
>  }
>  
>  static const char *special_mapping_name(struct vm_area_struct *vma)
> -- 
> 2.45.2
> 

