Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F99806483
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 03:03:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nSyd/N0Y;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pIXjG4tP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlLKF6L2rz3dBc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 13:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nSyd/N0Y;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pIXjG4tP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 244 seconds by postgrey-1.37 at boromir; Wed, 06 Dec 2023 13:02:24 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlLJJ2k67z3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 13:02:23 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B61xA4h029542;
	Wed, 6 Dec 2023 02:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-11-20;
 bh=lke4uZRb/q22qW4sYF4uVDKvHCjTPpNA9lTOQnW41Y0=;
 b=nSyd/N0Y/PpTL3wk5xbpz65CXZD8Iqix2Kl2gU9KN+q3AFRrZqV93tXZ1H0b1xBj0NOs
 E26deA6t02vdsuV69QnLfSyEJV5USTeTvdempcDZmordCXgBwUjcgVdUBn1Mc3+Sb2sc
 IJfG6IOC8FPqAl67RMnEVx32uhrZ9+DDV033IN+LELVgoiDYSXWWQKEOV24Jay73aXCz
 jl3i2ly2IlxiD2Ci+ODxbHz9J4KN8lngcKhxabvYEivALgRsx36eZj6aX7C5/CZkkYTo
 UK1v1SnKQ4vDB/jsSMNhViV+1ubl7P9pg3hM1zJDZjXzczD0Q3eeomG/h49YVOAgUN28 4g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdda04xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 02:01:37 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B600kpn039912;
	Wed, 6 Dec 2023 02:01:37 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3utan545ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 02:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JS2ERP1MtLT7ogqdSul2BMn/xltKqYQfuKV1AAaSknAMPPX2puYecnS1Gu/kzwOFYR7xkR/gpneyHkBoxghs8b2w98+xlsBoufG9OPTbAf6LBaJ/l/kc07NTuRBInMPNVYL3YYIaXmRoFW/nvcjW57+NDCJZQ+Z+WwUfvvvmeUZKVjG7THXVPZ9yckszzvN70+dvsKoQ+T00sZixLwTozM6i4cFnDHm6GaHq4QhYzqBLEaIgmbPEO6DQXIueQoNDTLykHtg0swYxv7yeS7jVTD2RpJm8HmKXAV+GZRO5maj1tJL3HDai7qlMfZf3B7KHqw2PsPtHLTvqUzZs/Pd44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lke4uZRb/q22qW4sYF4uVDKvHCjTPpNA9lTOQnW41Y0=;
 b=lIea36HempST+knFAn/wq8DiFSfjYqyVQZSZZpjQjyQRlvutS/rxt2eHAFF5ezwqlH2NkB22ViBxG3jOIsNOThE8ssQhhkveIvT3qKTfIEPIXqUkaqvNaraD1s2cWfhtR1HhAmiG1f+7+FaKglBk9ZlCvE+JbhWPvQv+jynm+zhmnpeG41SnOUSWNOCD3x5Opbrzi335Xc0eKoQ8Ltho+Hzr0CGO2X4jkMMOzHEHBNveGHBaAJy7RnGcpPlwgrnc4s4ceG/Jk7sG7oBSQdkxAgGcRbl3ndqih5vPYv1+UxoPE1PobBHV8MN4mwqdmVCyzavPmL6yaXZlOIuI8OKTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lke4uZRb/q22qW4sYF4uVDKvHCjTPpNA9lTOQnW41Y0=;
 b=pIXjG4tPwqpwRpdgCB8iKrhO++jT4Pa+8UsW5lcOFhRH80YnvnxHDvv6+FIHC30DzOJ7HYkNDWkhdCdMb7wfMk6tGb4iWhb+FNBcL97pkEB+3H7cZQcijRU3aeFY5gy7q8e0Nc+pAZWZiE2vR++hwK9Q0cbDvUwnOA5zpwW22ws=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DS0PR10MB7204.namprd10.prod.outlook.com (2603:10b6:8:f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 02:01:34 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::2b0c:62b3:f9a9:5972%3]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 02:01:34 +0000
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/6] x86: Use PCI_HEADER_TYPE_* instead of literals
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1jzpsnl9q.fsf@ca-mkp.ca.oracle.com>
References: <20231201225609.GA534714@bhelgaas>
Date: Tue, 05 Dec 2023 21:01:32 -0500
In-Reply-To: <20231201225609.GA534714@bhelgaas> (Bjorn Helgaas's message of
	"Fri, 1 Dec 2023 16:56:09 -0600")
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|DS0PR10MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: b37eb6ce-13ea-4ad7-a0ff-08dbf5ff462a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5o+vE8eHIIjm0E352WxI3Mt7CFkWbBMbPnveF/VqhKw/kIz9nN+jlez6gckTTinKjCsQMeXCgO2rzKGF+LJKAjw6tTLIL6eki59YQv5i95Brvk0nppNgAlSq5HWZv83PnfzY8GPQ+GgpcY5JPkvG9yLezPbeuPSx8HuGZpqtcyVFrqfi6NymUozY2b23GUxuKDGkE35C7ALo8JCnwKVFXWyM4TR48A9uR9VPRMcaYaFM1QfjEea3uk+BWssmZN97XV5TEKG2ttLnOLmo9YMbRQvjwCtTsjSxeQ12JmCbV/woGlTyEwPS4tb0pnyB9TTrVy9DB+Tk99KlajK2XT4NfszfFObhTNn2bzdNLqqVaKp4hgtltsc+G2b1uZUXbcdkWKUdgXMBbvhdrOik2d0OkHgb+AEseei5o3Y8naia84gR1SjJGpewsbokZeDdtpaKep6rYkV+Uhj3+Iketkmc9ukYqkI0fBsFC0jEL58pmQ8+9bePdOeLsSEPvE+kojgad5KV5tAd0omlacfe/IVDRXoiovPLpmDgK2/KUX1TexiE//FeJDIkXNWU+yhu2+1Y
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(7416002)(5660300002)(2906002)(41300700001)(38100700002)(86362001)(66946007)(558084003)(26005)(6506007)(6512007)(36916002)(6486002)(478600001)(4326008)(8936002)(8676002)(6916009)(54906003)(316002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HEymCL5lzjblxy+KiMcw8sk4q3QEsT6hLv1uc++qYsSmeqGsL4eNhifJqKB/?=
 =?us-ascii?Q?BJ+THAgDSa9miecxcH2iiFgWso+XID5zJxClcKhcdmldeKZubqet2I1PM2L5?=
 =?us-ascii?Q?ts/eCJosmeHsTRnoUIYYsunaVG4xZypDz2KaYMJrCn/PUKqmWvQ+y1ZSYAns?=
 =?us-ascii?Q?cXviAXyN7HiF/MDT6LDh7VLNyCXJF7UNbYv0lsIZrPuvstni9AXwmjJ6EOaG?=
 =?us-ascii?Q?KEBpjeI4MAo4s0I/0HOXQ5fOG2qJSgIi5JSS42Ot0+IoeXWyV8vK/KxIPsrH?=
 =?us-ascii?Q?1cqiwhkqtoKrasovWEefl1G7HjIXwwiKSRj42MLmECslR3YIhd6YP6MCYC9f?=
 =?us-ascii?Q?MlMq461HIsAOAXI+4XJ7ia4qLMzUY6xoNqEf7CB/xc/k51OsfsYfso3SNDjC?=
 =?us-ascii?Q?RDOrUMIq4/KZl6vaB2zTzkgXkHNNqrTPr5J/Bu0XaCWyST1vTeQjz9F6x1IQ?=
 =?us-ascii?Q?ogwhp6EDx6KePAZj9FJVdcmG5m3E/RyZEwXKYR5+J1P4xN0VIRgMT9L85eoM?=
 =?us-ascii?Q?RV3YEVCUCkELLE2WG701mlUqfY9PnhN9ydx6i7fFqtWae4sC9iwDT9XB0JTU?=
 =?us-ascii?Q?7vziaat5cz07j1h/HftdQvmxFbQOK7HwXMf2CjDg7tazyec5x6ejAHut07pj?=
 =?us-ascii?Q?KwY5vT0Jn6dggMTaikqDKhXxOdY1T0dbR0zI72W0hxQF7vyTMrMFylNMPOge?=
 =?us-ascii?Q?MIyBqZQlqgAUX+2RDe3Xz3qDIwdRQTFRJUs5rmJxJRV88ew1uzTOTBsVgQWU?=
 =?us-ascii?Q?vcpTgrdhFXs9Div5oa9HGYJk6wfxLezJJqFT0AmuEdj3tapnE5/TSFt5DjLz?=
 =?us-ascii?Q?aKNK1wat9HVk6NMRXIPbu3loSVySX9JJecPi3hxcc/nCi6hh0hmjTDZvV7GW?=
 =?us-ascii?Q?YW9C24eNkKiKCyYOVEZxWkiovnSFUbTg5+TF0IYFnfhn1ZJ9yVHqFzn2/1+T?=
 =?us-ascii?Q?DZWEXuXd23wA5PwkLE1e/NAfi8mb65Xw92zN8+eYdDuRdZjjsSORCnqBHONb?=
 =?us-ascii?Q?77FEwHLtQC3GawzbyNzb6zwwHJ5NlSLhtTpQFQqk4f3qvMnmWSw98ljHGQbb?=
 =?us-ascii?Q?dhTfZ4Y8IWbGuneFtBeqz2ReNf4TvRKVbpMZ4ocHB2qu7zscD+bglSEyrLsQ?=
 =?us-ascii?Q?NFav52v7WCpeie3sypGrem2By9s2a6cCOm9wipetxDen7NmpfSqh/OcSkD5D?=
 =?us-ascii?Q?Lb+jJ9sOCv4VjwBS3GvhjDItbR85iVUILk2oXbv+zrsN6uG3WeFtBD3hCNHU?=
 =?us-ascii?Q?GgIqOow+MWHt8Me5XGVzkwGWujrJVseczL1f6ICfK0jFq2OPPl4FocyuOKs0?=
 =?us-ascii?Q?kmI91emzAtoKLlJ+WWTT236Gc6UMBPuOt3sdff/lJ0mpmtEWOMiJBUYqdQ5V?=
 =?us-ascii?Q?/lLidqZM7oPr2fFDqu4Lup05Hi/xhGaggTv/O4mR6suqCbt4VuDDWKOkXP3D?=
 =?us-ascii?Q?9IgriADXoJXnJROitm6TktU4EW9JJlJmhn7wF+YrsNeetf0+EqRA+fPYi0Kl?=
 =?us-ascii?Q?X9/jaUX2QarImEU5R0OHHkmJn5rD4CFg+n1maSKKFidJmq2EkVnesDoblA5E?=
 =?us-ascii?Q?H5cEWvfq5HSszyy3tzydstsHyQMahPahrCsrU3IfAUyK5ppcfePArIl7fehZ?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?LH/UkvximtkneCysU924YzY7rqhgz/w473Fsdab+/VZopmiAeQLE+/iH6ux4?=
 =?us-ascii?Q?mLZsdQfCJIasa3SnJqkSf3tgPMho9CZn7euFLA+bMGkYUbaWhqpYF+3JWP3L?=
 =?us-ascii?Q?lZLoiphNrizBFxkgJ+907l1x78mU6tWoVDNy9oBqNjphEgbGBlHTkVlgoSUn?=
 =?us-ascii?Q?0lDPf7H1v9p4avbLQD2uexGsCIdSs91/0HyMG37dZd8tz2Dk6i9TaQKoemrX?=
 =?us-ascii?Q?Ct6B/xh2OSz7eA02t6BqAjBclOLJR95LTB2ra4MxL/FZ5ibUdGTDWShwuF/S?=
 =?us-ascii?Q?ssV0bb2j82iNz8qFqG7Uz39QCmex6puuET5i2IGza4Vf8yI+kFfJk4naDm7j?=
 =?us-ascii?Q?qA78c+wuf0O8xXmdDAIA77cPRp0aVfr6St77JKa9aDLO6WbrBAmI6+1H5ylf?=
 =?us-ascii?Q?PcVpZrqh9fp4v3lxm/9a/nkJxHZkZbOuR8FgTeYW6CHirrwM4igft56ykKPz?=
 =?us-ascii?Q?gHHzPxTuMT+KwcxLe97cnb50zAGlq6k+qodWq4vCSFfPtSMsbKA9ia9gcdRl?=
 =?us-ascii?Q?TGr06c5OhkOrafZ+BkeHECswfcLCKFgjBl0MhBE7qZS3ftzTFBtpCyVqgwTL?=
 =?us-ascii?Q?PJL42JX4rEaMjlaUYpUISfGYkvOF/OENqzCM3AVg2dYBZ5AHi+yvSWMh+6rY?=
 =?us-ascii?Q?ldYPXeQ/f5kYlZjj9crz4bHEMLe00JL6q1ilsCWXPnl7m9BvrtPAlD0cwMGs?=
 =?us-ascii?Q?lM3PAeI8zoHJ6NxpVc/b8YgbG1OQbOtQY1IMI85jAzIedlVGDu9qsWJrXcLZ?=
 =?us-ascii?Q?jqX7q+NWM0z4jJkjZjoWg8+D4X8sbZk4ZCt+gkq4UFZp4ao92AbENS8YNRc1?=
 =?us-ascii?Q?mTtonxgxtaoPtNzdT/lKCunzUPFcrtV7v7n7oJNq+M6mGniJe+9eXMUimG+1?=
 =?us-ascii?Q?iPdMjUUXq1PZMGv7c3sf5tECl3EvVUrPrjtFc+NmEHWrN+8VjL/rZe8Elzwm?=
 =?us-ascii?Q?hcUoQ+sQ6+RdLF4lplmFsW1o0HUvVW8sn41PIsd9dxZHWh/yIewssydLyPps?=
 =?us-ascii?Q?/ffdZxgMx79ttp3M+TrDMoPF5mAPacXSl3ZsigWhs8DMSUAYJhAyxRTMkUma?=
 =?us-ascii?Q?SzPby5kUHt0LT5jM2d1mPV3E9JmPQKe9iToLcG2q2lRmjRY5tKgZwMGkQT+T?=
 =?us-ascii?Q?ssh/iZ2Aali60CkOGGLGwbdDOLI4N/T/D/Aow0GWEdiQYDBU3G5i+xOWeS9v?=
 =?us-ascii?Q?uzR+HT3DSsbPG0XI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37eb6ce-13ea-4ad7-a0ff-08dbf5ff462a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 02:01:34.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az/buwu+qH3bmSZN5XudQzEqr2MQXJ5ndwOAg5G4FQ4QHxXySiQhuaq4bxplNVNzHF3/z3RbTJYZFEBbhpGjJKwE/J0xqBMprEBguM2zTMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=950
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060015
X-Proofpoint-GUID: QbedeKwSn7aucwIsw24JWcer28UadLDA
X-Proofpoint-ORIG-GUID: QbedeKwSn7aucwIsw24JWcer28UadLDA
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-pci@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, James Smart <james.smart@broadcom.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Bjorn Helgaas <bhelgaas@google.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Bjorn,

> So I kept these in the PCI tree:
>
>   420ac76610d7 ("scsi: lpfc: Use PCI_HEADER_TYPE_MFD instead of literal")

I merged this without seeing your note but I haven't pushed yet so I'll
just drop the commit.

-- 
Martin K. Petersen	Oracle Linux Engineering
