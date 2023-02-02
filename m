Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC26882CB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 16:38:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P72xX4R8Kz3f6Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 02:38:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=OmJGMcYx;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=o8hytrzT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P72wT70H1z3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 02:37:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=OmJGMcYx;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=o8hytrzT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P72wR0wsyz4x2c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 02:37:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P72wR0sdwz4xyp; Fri,  3 Feb 2023 02:37:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=OmJGMcYx;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=o8hytrzT;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P72wQ5bkZz4x2c
	for <linuxppc-dev@ozlabs.org>; Fri,  3 Feb 2023 02:37:26 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312Dx2WC007457;
	Thu, 2 Feb 2023 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=sbgU2RA94orvV4BZxlaer5lvSSFqQ0yPFPGBPnwGPbQ=;
 b=OmJGMcYxUUCK7peYXYwaPCRZ1RElWt+fdlOUbIEwuk7a2tKCAp95nBDBvAaECN5+lwOB
 UUdl1RvaHMDci7ic3oabM5e1A7estqTRCqgY+qA2u90w/LVM8yHjn+LYMyfgfzDsOIvh
 WkN4XoQQmVira+DrKsObuyqFNVamK23VRQFkTSX9z4Wg3RZELFH5dyG+1hKzTIeJVKPT
 dtm9gbFWp/+Mggo1U96s/xwv0z8RjX7N5RIMp9ToPjsqqiMt1boVYtvFjEEu9e/Ybl+/
 opY5Qv8cJHcXFij8SrpeIb7E3xXW8fOQN4lO8WHRrZnA2ZFWhyK9p1xn+XChWR5JjCg8 Uw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfk64bn04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Feb 2023 15:37:12 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 312EVkee005047;
	Thu, 2 Feb 2023 15:37:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5g9ysr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Feb 2023 15:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3iT9sJK50QpfWsXEJ+zO48N8wpcYZ/lH8YxhwqMl1Y5XzzI7IF1FALa+MralD8xVFAbM4t0u1JTsbDnUJ9eRtXBLGDCG+UwYUMB9IjFPAqnDBJjafYjTlbYbzUiwX07q/01muwqbbNNu9J/tLdftSkrAWRh0kT/bDePEgSEGIUEQ00cO2QZkmqyoV/fYrCtMgRam1ZaE81OZ4Q7sR59eEemY/yvxmdczVv4FNKp7nMD84XQ8oSzrTR6/Rw1X8UY97NSMZ1Mi2+LFlaYKCuhA3/a6U2Fcixb6C10zWMT686gOzwM2wkPEK2j+6UGquGZSpsTPvIrNv/6RV3qNRwY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbgU2RA94orvV4BZxlaer5lvSSFqQ0yPFPGBPnwGPbQ=;
 b=lk/IOCXLOqfFbYVwp5CUp2qUaEkCL/i+TG2cRfS9SRLLqrtpJVPRDhHmChizvc+3JkVr93hd0ylaLs73oMaiO19HIUwYJzGSsn43lD5xXw4fy7YvxiZ13wBLrlRCnhFUHMh98S8WYHU5K5qZ3BoIps5txYyiJzcCLJeOH7RrXpi0exw2C2uzukZhBPr0N9LA0Tqo9oiZHsjHDl4JyILvLAGAIxd8dmYy7NjJ38lFdQS9SY+H+7sVBxK8Msx+2uwH7wDSBxa/WEoYdezp1Rh4G+6OabdrxPuOO6+f536Dnuk2t+I3e0tOLA+sqU5QmZ4RmG/UkZTY0Y5vRk0QjUtWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbgU2RA94orvV4BZxlaer5lvSSFqQ0yPFPGBPnwGPbQ=;
 b=o8hytrzTa+Iw0pBQzrj+5W6bexxpH4jQe4pj2pR45w51HJZnKV6mUbY8gsXg4Ekb80u5RevuWI+rzPppr07OgIIpLjvFLq4n8SI5Bf/RoVR2A/NbGl6VFEiv+f9KeNkcJnKPBK6n9PHF5am8kVJazYMwxBaeI6BO84cnlcTvuik=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA1PR10MB6145.namprd10.prod.outlook.com (2603:10b6:208:3ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.19; Thu, 2 Feb
 2023 15:37:09 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2101:3ed8:9765:370f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2101:3ed8:9765:370f%5]) with mapi id 15.20.6086.008; Thu, 2 Feb 2023
 15:37:09 +0000
Message-ID: <401813b1-9834-f8bc-e035-2fef309d3fa6@oracle.com>
Date: Thu, 2 Feb 2023 09:37:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 4/8] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
 <20230201063841.965316-5-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230201063841.965316-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::15) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA1PR10MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6233c1-3bb4-4288-1445-08db0533587f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ltGu7+6efRLxx0U9u597+YhsrBD9+FtWubhqz18NbUUBxunSQLJ/LXu2Zz0Ewq3AFUSQPeC1BCY7e30lfVFuGKZJclWvs5mYIWoTK8SrTg6aAUwzsOoJmlEFkz3HREDz/CkHXrcpC5ReDAln93e/3RMze5BWbsaLdzbzFz8s55ZzkrIhhMXadpnfzl8ldqTZlSypW3MulfFNFRaiM0pxU6IETTUl7PUHHsN9vZWc0beuGjpuNysk/9DkzM4wD8FOjuj6PHX5azqkfOkR3gFseK3UTcf4+XltHFD/RPYBtwyDetDam/4eU4o49KSosWB5f9EeJNmMLoHlU9QByow6pHaBK3J4/BkPvfpzjpotH6tAAHctoijY1/x+JLXb+hnTyKbn70p8CdE+lNkUIq+KWtS3RBa3+yl1ZqRGJFvELJMcl4ZFu5X7+uGY78hK0sA7KBgk7X1682xeOqjRByCtJQjPKmvkLat2tuae4DDZ2I0BDGeHYCVpmBegVXAXamtIMmex+qCVo+iZPB0JU+N3ibiSvwNzfKoLY0n9xPXdR6fJjYBNXxJ27kZBVl+ZXwClfLzr0GwrZU6q+6utWy1tQJyBApZdK4Gdutz+ESKeG5QN+TLKFG+LlMhPJ1B0doVvaYJ4uz6Oe1tcr4xbuoiddo5su/PUHWNV1/82apclNmIYPtfejrPHBWp9irNMRJdnWYTDC7KRaoP4U4DetItdaQXwDjQYWggenmRzDAjN1nE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(53546011)(38100700002)(31696002)(86362001)(36756003)(2906002)(478600001)(6486002)(6512007)(2616005)(83380400001)(186003)(6506007)(31686004)(66476007)(66556008)(6666004)(8676002)(4326008)(41300700001)(316002)(66946007)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eTFVRHBoUXFuTHRVQ0hhZVpvUmRsWjhmVGVyVngvS1JOZ1VKYjdQY3ZYeUxa?=
 =?utf-8?B?UWlxbm9Gbzg2dzk5a1pndDlhSkIyMVhUT1ZZZmFMRUFJejB2ckc3Z0xLQkdo?=
 =?utf-8?B?VGRmelcxSFVNM2JtNzM4S2Y0dG9COFlMMFEyajcxNWMxMVVkQzloc2pjVHpR?=
 =?utf-8?B?TFJqT3lPMlBVM0NLMTI1M215eERoT3NxT3ZDR2hDQ0FaMFNQYWhmVCtRMHVS?=
 =?utf-8?B?MDc1SlhPY2ZqNTRGYzRqWHFQcGhkN3gxZFNvMkdHRmxLd2FkWmRTYlpKdUpU?=
 =?utf-8?B?YllyWVFiVzhqcy9ibkZTTDBRb25TSWJyNlFyV3dyUEp3S2lmS3N0bUZCWG1I?=
 =?utf-8?B?ZDE5cHJ3bnRwaVhGYWJSbHpLZDI4NXFzQzhOdzArek1aTVMwMEwwcnVxelhi?=
 =?utf-8?B?Ymx1dU5GMFpVQ1V6TEZBR3NCZ0lPQUhrN2RqdHlQQXhPQzFSY2hNcmVONnRo?=
 =?utf-8?B?WTM4OEZBbUVZbm92WSs2eDFMd0hZTlAwbFlZRDdkbTBFUXdiZGhPNXY2c2pM?=
 =?utf-8?B?ZEJiNkw3bmR3SjgzNTdMdUFaZDRDVnViU0VyUFZ2VGVSci9JdU5NQk5RMnc3?=
 =?utf-8?B?TDVweENOeWpCUmpqMXlsNnA0TXFacG5FS0lOU0dQdlZ1OGNJQVI1cDNkcnJE?=
 =?utf-8?B?TFRoRUk2NGdaSmhwRmdteFdmVXYxM29FaXFwY2l4MlBUY0VxRlpuTTFhY2I3?=
 =?utf-8?B?WnpyL0Q4bGc1L2ZMKzN1eVNFUWpWZ2M0THFia0dJZkpqWTdWV3BMMktsNDBV?=
 =?utf-8?B?NE9aeW5oOEJUSWhUZVRQeExEckpFMlgxdXpMVzF1aEc3Mm55U1doaFdPNFdr?=
 =?utf-8?B?bUdBUU9SUjZWcW1mUGhxRWtEUTNGUnJxbkNlL0FvRi92N0IwdHdsWTdNT25n?=
 =?utf-8?B?a0ZORmFacVpsZkNzRUFuWEYzUU9WWEVGeFVOd3JndXlMK2NGYzhZZUJlOHdu?=
 =?utf-8?B?SzhsdVNNaVh1b3pOZnBiTnVNdE00L2tzdG9sa3RpdG83YXZXbm1QWVBxYVFF?=
 =?utf-8?B?bXgwbS9KVU5iRGJPc2Z3T3ZuT2ZWNFkzUEhDcHF1M0RJVjgrazdLV0xKSVRE?=
 =?utf-8?B?UXQxNW1VOWZ6TUFjSGVxRVc0LzVjajhRMGNCVVRhd29Zd3dIR0twZ1UyOFdY?=
 =?utf-8?B?bU5HcFN1SDhZMWhTOVNpQnpTQUZKYVF5WVNuUFMreGR0ekdsNm1RSGRLNWYz?=
 =?utf-8?B?dkxVcVRreUpiSHdqdDlMSVRYVG1ibjFwWlZmdWhVYWRRdDJzT3NvTGNVWnE3?=
 =?utf-8?B?ZjMrdUZUQzlXSkVUa1dkTFVKQTBnaGRyYVpOdVhzMUE3RDhrVnR5VmdqQ2Zj?=
 =?utf-8?B?d0JEV3dHZzdVak1obW9WYWEzWWM1amFYK1d4OHB4RlBjeVpJZmQ3aEJBOXRy?=
 =?utf-8?B?TDdockI3OG9SRGdaTkdtS1VuRWludC9aOG92dVZ1dEVTaDV2UFNiVzh5Vm9X?=
 =?utf-8?B?cjJWODZ4ckl4c3BMVW9URFNsUGtFQkphVW4xZUR1OGlJQ2xpb3JoOUJSZDRK?=
 =?utf-8?B?TEtZV0lFQUtGT2d1alNteksxQndLTkYxclN4bkdBWXVuM1pRUGo4SHdBNUtY?=
 =?utf-8?B?YVcyWmZvME5IZWdHTytzNHJUOU4xbWV3ak5HQjRtOUhZRGR5Z3cxT1RNWVdt?=
 =?utf-8?B?aVN5WmJQKzNoQVlpRjlwN1hRRVhjMmNyRk5WWmFXRmVheis0ZjBzMEhUSzcx?=
 =?utf-8?B?di9FSGgzOG5nM0xLcGhpdndwTVFZTEdSc29Jb0wxVWhuUm5maXV0QmRhMVps?=
 =?utf-8?B?NGpTN0Y4eVFOdHhHS3hRL2NsSzdZTm50QWQ3WHhTTXdzelkvOVpkUnoxcXR1?=
 =?utf-8?B?ZmMxeUxYalF5aFNtY2x4VWI2UHdxTERJSkh6Z29hSmlKZm5BWTdaMlpwWUhJ?=
 =?utf-8?B?TEtUVHdHSkduc0djNHQwZ0lLN3ArcDJyMWRBOStLRGliT25VbHZSeXpsVVcx?=
 =?utf-8?B?Mm1uL2tMNWJHTU9BcCtoeUJMWTcyRE41R0t3S2N0S2FUalgwUHQvWFNSYkUv?=
 =?utf-8?B?QzNoRTNMUnU1c0lVdUcyQXc1YVc3SW0xaFloVlBYMEk0L2hQSDBXdkQ2WFNO?=
 =?utf-8?B?UUhPZVpLR09aenNSRENKMVBOU0xzS2Rzb2MycERmM1hkV0FiQlV6UlZCQmpH?=
 =?utf-8?B?ZzRGZFNJTXdNbkJQbDd1VUhGU2lHRHp5bnl5cFo0WWZDUzZLSkNyNDNHQ1dB?=
 =?utf-8?Q?LHQLEnaB400i9HpAx6HRMhs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?dWdqRDdVdVFZTVpKb3NzZkw5UUprWGRpRWRPVHVhZkR0eThyb1BPbVY5dVBo?=
 =?utf-8?B?UXA1cmx1cGdlT1FyRlBvaW1DVnh0KzBKNUJRdHE4Wm9wY1lOTHdudzErYXU3?=
 =?utf-8?B?ZkxuS3BLN0pHSmFuSUxVNDUxOUJieGNpNTBObWJzKzl5czFoM21LZXJCaUpO?=
 =?utf-8?B?cDhDYzlBZFZ5Q3N3MGxzSkNPbkVLdlRhT1pGYzRPdjc3aWhKLzdXemFSenYw?=
 =?utf-8?B?U1R6SW1nQlV2RTkxMldjRVNBMDNnTnYxNkVpMVVyTHBxTmcxQmVvVG9qOTAz?=
 =?utf-8?B?ZkVuWDNkL1AwNE5USlNqT0dRTGZEajE3eG5GcDZMUlV3dlVJcGw3eFN5VEgy?=
 =?utf-8?B?MmViSjhDSjFpb2YzT2NkV2phejNRZ2U1cUV3a29tMHVYckU4Q2ZuTm9kOEhv?=
 =?utf-8?B?bFlic2NzNlZJSjZueWxYa3NTTlB3TXJ2UzVyQm9Vakh4QSs4MmRTUldwSmZL?=
 =?utf-8?B?WW56bE9LSXNYZklnVTVBTHRvUStWamhmdXlhVWx0ZnVTVmhaSWYrVTVVVG5U?=
 =?utf-8?B?bGJ0WWkxcUU3OGNqaUVtdStTeStSS2JtZXgxRitoSjBwSkZBeXdiUEV4Ymp1?=
 =?utf-8?B?aWIxeXFiS0d1T0V4Q2QwNFlWTWhvVnNiMFR1SXRsYXFTemVqUkVxRFNoRG9B?=
 =?utf-8?B?dXZHQnpDQzF3bEtMYmh3RXYxdFNWWHNNLzYwZVQ4bHhwNGQ0T1VmU0xQVm5J?=
 =?utf-8?B?cnF6dm5sTUZ1SXpFNWxaUWx1WnY2clg4VGNsSUN3cDFpVkpxWGZsU1dSdjFT?=
 =?utf-8?B?bUVIQ0pWdXYxV3B1dHpVR0xBKzk5d2ZOa2JxaEdPejEzb0xJamNoYndtRnBV?=
 =?utf-8?B?a0I3OWF1ZXF6TEZNYlhOVXFKeGdwOWp0b3lLNjd2clJaVEdZNzRRUjhmYW9y?=
 =?utf-8?B?Z1J6MGR4b0k0QnRsVEYxT25NMWgvaVFackdSTkpURjJibU1TRUNCYUlEODN3?=
 =?utf-8?B?Z2lvY2Eycy94RVBKVGNucmxvL3BqTHZHSXF4WGJsZW9ueEQydjBhTCttNCtm?=
 =?utf-8?B?cUVvRWRSS3NEV0VNWXlzYzloZVlWU2RBdytiRTM2b2xNeHR6eHJNMktBcWNt?=
 =?utf-8?B?MUYvYkZSZyt3dkFDanBvTUNoM1k3QzVYKzg0THhodDMvSWxqM1FkdUIvNlpm?=
 =?utf-8?B?R21vVVpxOFl4STc2dWRHRGhDY3AwV3N5dDlQUndYV0l4cXg5V1NnQUFSSW5p?=
 =?utf-8?B?dXh0RjRwS0JQUnpibk9Vei9iNVFlREVyVDl4TlJReW1SUHloMmsvQzZ1RXJk?=
 =?utf-8?B?ZnZGbGc3TjdpVmtwL1UwNE4yaEwxZUVWQ0J1MDVkZ0tycllsZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6233c1-3bb4-4288-1445-08db0533587f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 15:37:09.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOYNhbFAzBk0dx8lwpGr0rULIq0wat7QcyI9Ifm7mGq2FTGe6SSCe7cMYBsmgETF4IGR4u8V+sBvDjTh0oKuo5l9W2aFHMMZTawr60ZxyHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_10,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020140
X-Proofpoint-ORIG-GUID: KSN1dAplH9L9ZIcAH77BpnORAYPQ0sMZ
X-Proofpoint-GUID: KSN1dAplH9L9ZIcAH77BpnORAYPQ0sMZ
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/1/23 00:38, Sourabh Jain wrote:
> On architectures like PowerPC the crash notes are available for all
> possible CPUs. So let's populate the elfcorehdr for all possible
> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
> crash update on CPU hotplug events.
> 
> The similar technique is used in kexec-tool for kexec_load case.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   kernel/crash_core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 37c594858fd51..898d8d2fe2e2e 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>   	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>   	ehdr->e_phentsize = sizeof(Elf64_Phdr);
>   
> -	/* Prepare one phdr of type PT_NOTE for each present CPU */
> -	for_each_present_cpu(cpu) {
> +	/* Prepare one phdr of type PT_NOTE for possible CPU with crash note. */
> +	for_each_possible_cpu(cpu) {

Sourabh,
Thomas Gleixner is suggesting moving away from for_each_present_cpu() to for_each_online_cpu(). 
Using for_each_online_cpu() is going to the minimum number of needed, whereas your approach of 
for_each_possible_cpu() would be to the maximum number needed.

What would be the ramifications to ppc for moving towards for_each_online_cpu()?

In my next patch series, I have finally figured out how to use cpuhp framework to where it is 
possible to use for_each_online_cpu() here, but that is at odds with your changes here.

Thanks,
eric



>   #ifdef CONFIG_CRASH_HOTPLUG
>   		if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>   			/* Skip the soon-to-be offlined cpu */
> @@ -373,8 +373,11 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>   				continue;
>   		}
>   #endif
> -		phdr->p_type = PT_NOTE;
>   		notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
> +		if (!notes_addr)
> +			continue;
> +
> +		phdr->p_type = PT_NOTE;
>   		phdr->p_offset = phdr->p_paddr = notes_addr;
>   		phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>   		(ehdr->e_phnum)++;
