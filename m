Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E0730BC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:51:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aULKd6lj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=h8zCpH8O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhMd16R0Xz30Ns
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:51:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aULKd6lj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=h8zCpH8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh3xp2Jj3z2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 22:04:28 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAJSc0004119;
	Wed, 14 Jun 2023 12:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=AqjFkXaIfUhEbAsAYcFyGqXZDgq0PzMZRxbgfW+gpoo=;
 b=aULKd6ljcym0nzaizylELmMJv6jJjRPtmsW8VmzrMWElnaiqQrRufE2fx+XGT8UuxKV1
 Cj0jiTONJA4ZNjvZQ6DohoBk8qWGrrwBr3mMNL4fr4/G0IyK8CGvwtqTj4xd/yALrTfW
 T1NKdvhvlXtVKpIZTNeNkDq/6EHIOS74u9ZBeOd3poTFc9HR9GiFkHuwWifVZm0TKUoh
 JZp7uSeI9EvaT+svW3+iSrd7LMBxweSTWevX83t31idX2uOuMfn6kAdVT9ULlAHWZvDF
 iAj9JC12MV4h9S1sAQ0w2wkyNH8TF6QadznqWdTUk7kcCqX1SraCsJQ5c69EChhbWxy2 nQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3bqfpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 12:01:19 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35EB13pt008917;
	Wed, 14 Jun 2023 12:01:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm5qrq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 12:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TesALFWsgABkdQbgeW4Y9q2uGusLMDk1h4HAHWUPAl4Y0FkBC+rtBvlk/ksNMe5bSDnhOyax9JFR6krn7LiZA40kxHxXkg2i9vqI9W4oN7AfSEGUe/xDptBkzMnI1387kkL1IZcL3O43sJdnytnYnZwCiWyMmm63RCUVo2Gf3zvpMPB7x9DO+qj0CCYsoH7tCZELjB5HlhnBYviTnkzEq3DboBrmoVPOkx2ABDkj8Yb0GRqDvO2LCDDD8hez6s5id/YIuKFsNT/75ot1hX7ZYoEIyi9NhCaa/ThJlmgLQquy01/Wd1vj9gD1g76DrOixSCWq5+eKNnOPVDfyN/nZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqjFkXaIfUhEbAsAYcFyGqXZDgq0PzMZRxbgfW+gpoo=;
 b=eMC9zXgrBUgJMIwr6CaqNcOAaVSdihJJekV0JRxWsJ71ChkzJlwu63CAQrbFg5ZyX0/HRkv6KP61C9eiTIBgDhzjKnZrD0umj4tt+3hXQraD45MnGwkeJV6S4hAidsJy8ugEY33E9+ufH0NDHE7R/0LC4+RPvAB3/s5dfXs6wQClnVG9eEBFdpak1H5wGeLy6XhXI4z0UltQE930aaqO6eoxA28WMYCl6U/8IydFWbFFDU/FUdKIi8jsHYNWjyvlgDACYmGPjvyVcsXTJMLQfhJp/Bk5r5GqctAk73eFvfhse5WuIw6rXpJylXydG9akzVK9qyy2WYvvXJ9Kau6wyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqjFkXaIfUhEbAsAYcFyGqXZDgq0PzMZRxbgfW+gpoo=;
 b=h8zCpH8OjZGcWVWXnLwdEUSVDvbIlLHRIysD6gBmuF2DuCF0LRSW2981wXQHl2rxPe6jROUF33b+HP/F+bXVmFgRDPZdcS8gJOY1jmckF/8KL91UML0n3G/bjgms7dDdGx6oovRu5k592ZROEJ5XH1r4TaBRSH4MHDaL7f/addA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BLAPR10MB5169.namprd10.prod.outlook.com (2603:10b6:208:331::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38; Wed, 14 Jun
 2023 12:01:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 12:01:14 +0000
Message-ID: <8a97f096-2bdc-0298-a1c5-8d48dbf94179@oracle.com>
Date: Wed, 14 Jun 2023 07:01:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and CRASH
 options
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <202306131314.EFA558B7@keescook>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202306131314.EFA558B7@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:805:de::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BLAPR10MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6c5ca2-d735-4c27-0e8d-08db6ccf0d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	b1kA+MStDADGoBYahUCDNSu92lM5KzTVPqPoVhBHFsQdC99AmTYTX4Gdmaij/0VHCzqRCr3yipSr8TfVZI3lCvKDt94Y0l6aHgDR87P/QlsbEfJVIayEv2vesm83ayaDDNTFG/xoLARAAJ1Bz9XHkAAzwhQiOxvfTVHoB5xrzhZhyKBT4h1B603RMnrMBb7Wn0TY6cFB4J1305Coo7LEABym0vgkNwPnyPYbWKr/uNp/f4iz0IP3SuYQAFIJs5L0RPd5o4kc8X8c3te7j1y4tGNKi2l37eLgWeV1YnEEwxG53SjUqIVAUCKb2LeYSuPf/4SPBWC/M9aGjy9AXkwoqbsgyLtZKHcuJhGfEYhEIhBnIQ1Olgvv51ZatLt/l6uEI75fy9ctdpZFzQOoMTed8OSB56dgOgaa5j5Fg6V9re32ej9S9SQ7PMOyGK5L3SF5DmhhzHMaDUjNLNxZy2GWNpAHmfIsp7Q8IwbFS9eHVL2qhcZriQFNJ80IXrYyEDRTsC3aS18Ll0N+x4HzX09HxJaMcMG0tldY0UUqNRjUXvZPANfw3PU8e0XXDGzPFykGJZR513ZEbgffjaXrv3kdelpDWJnnWfWz0W5xPCmlLWBHIZpEs1luJbwI4ofcWD98zr4EKnSLXg4CZ11Sv8uZ7A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(8676002)(8936002)(2906002)(5660300002)(316002)(66476007)(66556008)(66946007)(4326008)(6916009)(31686004)(38100700002)(83380400001)(41300700001)(2616005)(36756003)(478600001)(186003)(6512007)(53546011)(6506007)(26005)(107886003)(7416002)(7406005)(7366002)(6666004)(6486002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eTBVbkxpWERENDRTcldzek5QRlYwSUZFWmxPUU9zTTZjSGEzMCt0VzVETEFj?=
 =?utf-8?B?aVdyZTU4b0JhbkZEQXlNNnoxb2xDdzRqOTRscWU2V0VpSi9YL1pZR29sM3BM?=
 =?utf-8?B?Z0ZyNWtWRkNoL21RRWxWYjI0L3luSW5WeHFaK2VyUTFXOEk5cG05U3N1RHRj?=
 =?utf-8?B?TVlwVlhjamxoMGt5N2FMcFYvNDZRczJXNmR5Sm8zdGRIV1AyMW4xMXdlTEtD?=
 =?utf-8?B?L25yMDk3K0lpYkhVdkZ6c0FiOG41VWsvTVA0Z0RNbGlsQkVYQ2NEZHVmdVE2?=
 =?utf-8?B?TDdzOWNCUk5RdmhWWmN0OVc2TW8vZGZMdk8wdFBPZWN0bVFiL3l3OTZ1bmlD?=
 =?utf-8?B?UEFQalhZSzQvTGxsY25LQUhsVE9Wc2N4dUh4SGxzTlorblZRcW9JWmpDajBk?=
 =?utf-8?B?U2EwTm04WE5GcTR5VkxtQStvS3ROd1RUaE9TTU1PU2dmRFhTRHNXZlJmVnlu?=
 =?utf-8?B?YlJzSVl5NTlDT1hWNFFaaDNaL2l2R3VWemkzdys2L3dQMHdWMTZMSlhKaUsv?=
 =?utf-8?B?OWxZM29iV1cwWHZzVTA1VHNsV1ZkRWc5UUMxOWJpN2tWYncyb2h3OGtrQkFJ?=
 =?utf-8?B?U29xOFhlOUFxTk00c3RrTVd4ZlU2R013NXJEQmxQUHdNV1M0U0g4Z2k1VUlE?=
 =?utf-8?B?WDl3dTNhNGJwQlE5TU94RzYyWHFSaHd1STJPZ1NPcjRpVnJJUm5VbkpHRHox?=
 =?utf-8?B?YVVWbzZESURXYWdtTlpQMkc0eDVFeWVQV0Y1MEZvS0d6SDUyZW5KWGhvMTc2?=
 =?utf-8?B?K2MyTElDY29kalQ4TzQ1Sm9IVE1PQXNiYll4L0Z4cUdHMVJoMlQ5MWZQZGpz?=
 =?utf-8?B?Q3J0UlZDczBBWk45ZkJTWHFoQWQxU3E1WmphcTczekxGVnhMdjFRdkNSN0RE?=
 =?utf-8?B?SjBsaTZnV1pPb2RwM2pSeUplZU1lMUM2NnNtcXNraW5nY0tyOXlZRndqd3pv?=
 =?utf-8?B?RmhQVG1FU2lhRVl1NW1WbFF4UnY4UXVPL3ZoNTV1MXpZVXdUanVHZGxZaElT?=
 =?utf-8?B?YXlGTFM1SjhGYmc4YytST0FNR29CL0Q1SmtWLzhicjVmVzFGdkszU3VZYktO?=
 =?utf-8?B?aTdFS0R6K0lXRVJUdFdDeHBoSGpQRGJFVmo0dEx1S1pRK2wxRTc3MXo2ZXN3?=
 =?utf-8?B?allDOGd5dG9PMHNOWkE2R1oxMUpIR3k5Q3MyMjJZTWNpYU1NNDZFYVI5cWVZ?=
 =?utf-8?B?TWgwdThXd0VRY2IwYnRNM1FtRklhNVZTVlRnUzNsN0lUaG96M2ZONUVsbUc2?=
 =?utf-8?B?aDMyUFpibTBpR2NJeDlDdncrSVEvb00rSE1abUZ5bnhubFlERVVkaDVyM3FD?=
 =?utf-8?B?MlFaMUdOYWhsT0VwWDRidWQzYkQ0Vk9VM1NWT2dtdkh5TVo1c2R1RjhqenBo?=
 =?utf-8?B?VVhGWk50N2FDYy9haEtTZlRxZ21Od2tFdllvdjB3djlNY0ZlMmdQYjd3OEhy?=
 =?utf-8?B?cWJPZXdHWHhadncxa2RvdTM4OU5Vbll5cVdRelR0bktRbkt4b0hVd05RUWM2?=
 =?utf-8?B?UzV6eGo4cjFNOGFJRlZzVWFRL3h0RU1oMGdjSjBrV1ZhMVZWcHV4Rm5xNncx?=
 =?utf-8?B?azg3YTlaTkliS0UxT0pEbXh6MlVXVzh6SWY0WVdVa1grZ2NyWGhLTmw3b0Iz?=
 =?utf-8?B?cDRnUURSeGNYMExnbEY3TXVPVWhYd3lZKzcwTXhYalVidFlhMTB5WXAvck1D?=
 =?utf-8?B?S3ZhWldIdUFNL2hUb0hkcTFsYlRGRjVkQkNVTHNEM3ZRY2NzcWw2NEVndHZL?=
 =?utf-8?B?QU5jaE5zMVJORzlRT2tqSXNnY1JqSmU2TGRwK2hQa2piN0NlMy90SUFnWXc2?=
 =?utf-8?B?ekYwNFhISVNRTm9qTy92UkVnVHhrbk9vMnZldFI5N2d5S3p2NFdEdkJYVGtL?=
 =?utf-8?B?TVVSaVdsS0wzTHVqNk56cFBOTlE5Qlc1R2xDcEJQSnBJV0dFYTgvaDUrcEdm?=
 =?utf-8?B?SjJ6bDFacktoVG43c25nOUpzMFZHWDlPaXp4RVZZQ0pVS2RZNk5xcUJMdlBs?=
 =?utf-8?B?UWUyWjQ2UmQyRUdXNEIxc1BrUTFGV1YzNDYzcEp5N25tMmZmOUwwZlZxdGVQ?=
 =?utf-8?B?eEd1dVVBZHdHNGFkSGpNZkRGT0hGR1hjc09haUpLODVGK0xqUGNFQXVZY0c0?=
 =?utf-8?B?OWpVRkc0UXpCU3ZkcnhBT1JEeVhLQk94d2VVb2huMnJtTWRtUnZaRjZkeVBz?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?ZitqNmJTYkFuZllOY3JEdzFISzhML3c5RmYvallpdFNtL0plUy9yTXhlVUdF?=
 =?utf-8?B?d2s2OEE2alA2WitKTmVNNnlOaTdKUHB0enY0bFRPY1dKVnIzSlhqRUJDRjQ5?=
 =?utf-8?B?cmpydVVoNVJQL2NjZVlTS1N5K3p1LzJ3MU1Xc1c4WUlNVXVvSHJ3S29TSkRY?=
 =?utf-8?B?STNmT2FtNzBvSHRmMjNUcWpMaXB2bnYwQ2pVOS9kQWFJVWxvS1JQT2x4bXpW?=
 =?utf-8?B?ZE5TNzNEeWZlK3hveDlTMUdnekYzNzliZ3dmQkNUS25uS0pMK0hpUmR3UFU1?=
 =?utf-8?B?TlYwZGpDbjUvZk5xVjdUYVhsYlh2UG8wMDJtaldyeGpQODRZNEovWk9ubW9u?=
 =?utf-8?B?Y1JLOUNUUXlEckxDdDhaTDNSS3lBRTBET1U1MnpwQ0hvbmpsOGx5ZTNsMnpz?=
 =?utf-8?B?dU02QndKd1JWZHFnTEVlRGVzSUN4MjB1aTNNZk4yTVo2bkQyMS9adFdVMzAz?=
 =?utf-8?B?cVVSNE5ES2pobGQ5RDlheVhuU2NhUmVpQllFS2czbjZ1c21jaXZkaHMzMGs2?=
 =?utf-8?B?UisybGZpTmk3UkV1UGVCazdIeDZ3UHRmT2FRK1J4TDdPbXNPTFZhSXhPc1pH?=
 =?utf-8?B?QkhGalB2M1N0M3gwWHpsdG9uWmNZcG9sV3pleFNoSlJJQlBmQ1MxR3VJcmdU?=
 =?utf-8?B?TkRhWVZad3BCOGVISDBDT3Eva3k1YkJUaFZkTzMwQWx0d2NTcGNiR044aEUy?=
 =?utf-8?B?Q29SRWdsekRvQ28yMHJjRGpVdit2cm9uTi92WVBQMXVSU1l3L3k4M0xSYTgz?=
 =?utf-8?B?MVFLL3NQT2g4L3BGd1lnQkJaeGlyVEpYR21KN3M3Tk5DdjZ2OUc5UHFhWGM3?=
 =?utf-8?B?KzNleXdJTnR1YjlvekxzMlNQRk1JWDFrSG4rZC95RXZFNC9aN0tKWkM5NFlp?=
 =?utf-8?B?OVk1a1pxUWxUU0ljSm51YUV0UHhrWWtzNnpONS8zSFB0elJvVlR6cXFXc1FV?=
 =?utf-8?B?RUFyMlg5YXhsaXV4TlU3bzQ5WC82cjFRUnpFdFRDN0NuTC82Y2NQQytzWG5F?=
 =?utf-8?B?RCt1TXhRQXZIR0RIUkFkN2ZUWmwxbUJMRWVickw2elYyWks5VG1lNW9OdXhL?=
 =?utf-8?B?enB4eFdmWDl1QTg4WDFDVk1nZElDcHBhOEVFRi8vcmdQck0wQW4zRFRRMXlW?=
 =?utf-8?B?dnQxenlpU21NZzZBajkrUXNTK3VkWTNLVFlpUlJJZ2dtUlE4Q0EyOVhDcHpN?=
 =?utf-8?B?N0JVdUFROHY0MXM1WFdRUXRSTmpSUXltUnNDZnZWaTlwYStXOWZzYjRrektJ?=
 =?utf-8?B?QStXaTNMaFRPNWdvcEZkRWJJNzZ3OFY4UUVLTTQ2eDgvSGxsL1FXR1RTOC95?=
 =?utf-8?B?aEtFODhZby8vQStBRHprWHpaZS9tTit2L0pzSDlKOTk2RWI0ZUNNZmdySlI2?=
 =?utf-8?B?bUVqTWFBRVd1amNCbXIvM2xYWVlqTkFpNE9JUVZSYVNUTXF2akhqOFJ1Rm4v?=
 =?utf-8?B?UkZweWxXRm42b3dmQkdKUnJwaU4yeGpYMlBIR1d0UG1WOTFPWmt4YlBvN0E0?=
 =?utf-8?B?YkxtQXV1ZVFMNkxHam9ZMlBUZ3htVzUrVmhQMk02c3hCd05JcCtNNS9FQVgy?=
 =?utf-8?B?VjF6ZGF6M1oydVhoQnJhcjFWV1FvdnJpU3IzcUM2RUVDSm1Eb3JvWG9qOW43?=
 =?utf-8?B?dkFXQUxSSldHQnhVNEVOYXROei8zK043cFVONzdzSlRGTkNLdDBLaE9PdTFP?=
 =?utf-8?B?SlM0YzQrVTRza0xSeFdrY3dyZHZYNGh6ckJOODBUUjhCZEpEYldCRUx5ZkFm?=
 =?utf-8?B?anhUSnZPZzRLT2w5dWovUXRocWJQemlmb1lCT1hGY1FmckhidjNFaXNNKzlq?=
 =?utf-8?B?WXJWODRXRjBVOENLT3Zrd1FEeDNOOXhscWVpVC9FT1k5elpBbXArRmdSa2do?=
 =?utf-8?B?MHhrMEVKQ0tvdzJkQnNkTVVwbkxLQTNFYm1sZU0wcitQKzRkcFEvb1RxeHd0?=
 =?utf-8?B?NFBCd0ZQNHpZQ3l3UVRUL1VlZkFPenRwZzg3dW9zZkV5YzA2WnRudXJvenJR?=
 =?utf-8?B?RHI4V053eHdaWlZ6RFREMmhwRWpmREU4dUVraDR1NEZRbUx6THJJcTZKditV?=
 =?utf-8?B?RmU1TVBZT2dQSmlTdWpRSlcrVXlBMzdKTVlpTlpabjRlZ1V3U0Fmb1FWeVFO?=
 =?utf-8?B?VUJ1ZWxXU2tXTnN4QkRWL2N5bkN1Umk5VXRDQ3cySE9tMXVZaGJCR0k3eDgv?=
 =?utf-8?B?TGxGME90RGlFUjgrcU1ITmZIK2RyN3lyaDMwc1k2RVZtUUMyV0NETGNTbS9X?=
 =?utf-8?B?cCtlSWU3aGtpR0dRTXpFcjRUeEhuS0REWFI5WHV1N3c2Tjl0OWFSQm92QWlw?=
 =?utf-8?B?aTNKeVVxMjhxdzlOV28yeU45RkJIMzRkRUs1clErd3Z5UjE1Um9qNHJSNk9G?=
 =?utf-8?Q?kOZU+M4detpg87jVzmkzHJWO6osRzfPnm05mGA5gYN9q+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	vu1avyyyglxjrsH3Gd9kfAWLvxNAAxQH1vFaDpc2TNi+6lxAPbtINnHo/IIJU50HsqZqJhgsaEmzvrjrbOoStlKgIFGG7r/abuMRpR69ILyBDTwt/etarKdnUD4fW0KI5YEAf08Gla28RtQYNNBw8Ed7x2WXOizmOj46aSOASARQ9YbLi1kSPdQsgVUR2cY8PqnExtbtSL2KY4C1hST5c804IoK3+pzVd6ciI6GcT87+C0qzZ09IjriRVi1OsUzC02ben+hrg8Xz+OfsjHkNRGrmwHOwIFAoSMUYybv98BxGomNqBKLpiD8BfKiH+UHSrzsC3iPPz4QODXZucXVP0jRIXLbv3P3Yj5mnSRXnvpBbJycr3P9rtFKelgiVDmChdq4SYWAxsLHQbNfzGFUm/Nlt3/w9KmmjQdF9XKvClTZrM6PS4BAtKGZNCTzbInRnnSpbHjjegLaKyQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6c5ca2-d735-4c27-0e8d-08db6ccf0d44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 12:01:14.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awVN52BdBv6VDsqLcXtxuPWMpMkXkWK5YjSlQTeOy/T4t9JlQQo7XW5JO4SrNuwPRnHXv94g3llzzR23kNr8sob7PzRlHyND29nE0txpbm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_08,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=964 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140103
X-Proofpoint-ORIG-GUID: J5gQBbViGzSPsSToak5sZKj7RKbhD-bC
X-Proofpoint-GUID: J5gQBbViGzSPsSToak5sZKj7RKbhD-bC
X-Mailman-Approved-At: Thu, 15 Jun 2023 09:47:36 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, ziy@nvidia.com, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/13/23 15:21, Kees Cook wrote:
> On Mon, Jun 12, 2023 at 01:27:52PM -0400, Eric DeVolder wrote:
>> The Kconfig is refactored to consolidate KEXEC and CRASH options from
>> various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.
> 
> This looks very nice!
> 
Thank you Kees!

>> [...]
>> - The boolean ARCH_HAS_<option> in effect allows the arch to determine
>>    when the feature is allowed.  Archs which don't have the feature
>>    simply do not provide the corresponding ARCH_HAS_<option>.
>>    For each arch, where there previously were KEXEC and/or CRASH
>>    options, these have been replaced with the corresponding boolean
>>    ARCH_HAS_<option>, and an appropriate def_bool statement.
>>
>>    For example, if the arch supports KEXEC_FILE, then the
>>    ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
>>    KEXEC_FILE option to be available.
>>
>>    If the arch has a 'depends on' statement in its original coding
>>    of the option, then that expression becomes part of the def_bool
>>    expression. For example, arm64 had:
>>
>>    config KEXEC
>>      depends on PM_SLEEP_SMP
>>
>>    and in this solution, this converts to:
>>
>>    config ARCH_HAS_KEXEC
>>      def_bool PM_SLEEP_SMP
>>
>>
>> - In order to account for the differences in the config coding for
>>    the three common options, the ARCH_SUPPORTS_<option> is used.
>>    This options has a 'depends on <option>' statement to couple it
>>    to the main option, and from there can insert the differences
>>    from the common option and the arch original coding of that option.
>>
>>    For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
>>    KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
>>    'select CRYPTO' and 'select CRYPTO_SHA256' statements.
> 
> Naming nit: "HAS" and "SUPPORTS" feel very similar, and looking at
> existing configs, "ARCH_SUPPORTS_..." is already used for doing this
> kind of bare "bool" management. e.g. see ARCH_SUPPORTS_INT128
> 
> It looks like you need to split "depends" and "select" so the options
> can be chosen separately from the "selectable" configs.
> 
> How about naming this ARCH_SELECTS_<option>, since that's what it's
> there for?
> 
I'm OK with this. Let's see if others agree?

Thank you!
eric

> -Kees
> 
