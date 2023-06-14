Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8F730BC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:52:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2L61P/Vw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zMYBhL4+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhMg05dqYz303p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:52:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2L61P/Vw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zMYBhL4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhKR91cySz300h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 08:12:19 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EKIbbM015424;
	Wed, 14 Jun 2023 22:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=b+g0tBnNiLUaxF5Ts6ofeRdt6hYqU+Nj4Wg+Un9484Y=;
 b=2L61P/VwrwdbDar9sM8X0Aw7/Q1eKD6BwVEtfFEEl95txWpGMD71cDVu/eG75Wnq4xcm
 rQT44CH9zHzo2WXG1xLEo1dS84fNRrcoBZwbo7IqnX5/Tv0HgMzQIUBnEMnBDeTInyPl
 297hX1deb2R9ZEzq15SgDDVbZleqCdu2YdKTaOgbTtJCQLPRy7rHfucHIfppwkzRejkq
 kRqlNql6Oo/PDkE8n0q6u2RNogVdMljFt0YE1Z600qqkUBRErlN06vUZoEajB62zfHLE
 bDhs5AE10826o8IYgJLRvt77sZXx5FTJIdOfJgCT9TLqP5VG/6gDGdyitWz445Ld3DMd aw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h2arnbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 22:11:38 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35EKaPTt021593;
	Wed, 14 Jun 2023 22:11:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm65kea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 22:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCG3KHkJogsEkPAA6e/qkcDfQeRs0Iym4UvHApbQgOIznP4I38+OtiWoeSS9p9WiRzT9gILnqXiQo5opAt1H6LyPyb1cKPGOCO3lhxFbio+t4ONb1W9SPevB90S4ZSIHsrKAi7l2hRvQQZUpONCnLW6RrVSyoHtxKOZ/PxdMz2hG9YNpyRHlWDLZcXuN8iajEcdVokaPAX+WAR1WHVLN7SoBijIr3UB1+1RtcUywsUd0+jgVewSit7A8EV0+vwfujOm4OsoP9fg8mUFoVacwv9g+/ACVd3cC486ZbjfpeG+rDoD2jZdaHXhSkB7SzafzdGa85hNMytcjS6wwxV5hTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+g0tBnNiLUaxF5Ts6ofeRdt6hYqU+Nj4Wg+Un9484Y=;
 b=L87e+XGmhn8/fy4omwCSaNV4OzgSKioagh/dcTAfgYk5cF/I5+fMUeJlnnLHmE0nH4mDrmRmO3Zyer5CEIpvoXnlbQZVsUThMSiOuVkghtpAT3crZFWspCi6fnBj1qygU8qoJShRWYgeU3yreIWjQW4yfX4V8vuqhmhBM4sBqdsooSXc0KZ7n+ph6sPkprm00Lgh6+F0HhmomE8XKRM7CrgzVFLooYO0UDcSOpupPBU1FXddM/iWTnFQNZwpbn4LyCRKbi+wUO+uJ2zQUt4buIXmqfdGBZlmNBCgJFe65SytKhbrfiK5ilBfdqJCt9RSArz404iZrlRvNe8MoYnh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+g0tBnNiLUaxF5Ts6ofeRdt6hYqU+Nj4Wg+Un9484Y=;
 b=zMYBhL4+61YuOdUsJPfMbbi5dGqIXLRabRnsyvLx2INlwyWqSvFaO/pHiQgTu5lWF+tdfNWEgfWRlwqT5ZumuKlgRPaGb6sZdPVHmcCoDFnJuNsWjQ7olyB91R5n9MGBfZJMCPx5BIQEAfsf5AzqoTwv3Y0HsKpusao1i66O3g0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 22:11:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 22:11:33 +0000
Message-ID: <b5ba29d3-0de0-9bff-b9e5-bab24ade8733@oracle.com>
Date: Wed, 14 Jun 2023 17:11:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 01/21] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-2-eric.devolder@oracle.com>
 <ZInbx5cof4STvrZl@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZInbx5cof4STvrZl@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:5:134::45) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: fe51cdf0-2034-4140-5718-08db6d245056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tv26wXvbufuEZP3//i0wLXE6NeJhURAVsek1jrLbF7ya1DqEP04KV7hRTIXjlAw2g7MRcbrRsBGnztiwyrnIfYgmDE8Dp+mFRzAfQAIAh0WAvi7yRcocByeOQToNmYjyzWqHUyBSL0RFJV6h7FTQZkn8UeGmQp/7XSYppNFAxOoo5/VvD2+wd5789x34MnW+ETJ1BhS9Bno8mpYrQjjfECwPJgslCC+XJRcabKdwUn2C18Zf/AVv5dWXlbP/dVREY467ur0Xq+WoA7zm/fzbi5b+D34pvA0/jhKBBFM//1uMcmvvPuQRrKaEIvl8qdXO4Sdn9lMHMLnAE0yfZqybLIhQfNZi5psIwMMnJyFAQyL5R2po1Q6CYczU2LqZ32NuEw/uxikPVQkhglbUShUK7cpGhWwCK9C/CKzyCa4JylKwyqRB0o9/u8DF9edhqOr3eaXvsKEvIMeup8ALjobxCR1Kt6uJ6JrsmSscq7dm9kdyLyOWeLBog3Dcqb8s0bBpnFLKqR6H/zc5rukR85X0ke2DxU1FqfZYDhixvPYHTDmg3nLAY3i+bJCsmhfBchCwW9JQa05my8GoSWICrnCiCwIPqDBb1t8o2AqdkrUK1pVM9/wTwOZzoxQFHDAfYiVzQB/BELIGauF9FM87ggPYLw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(8936002)(8676002)(7366002)(7416002)(31686004)(7406005)(66476007)(5660300002)(6916009)(66946007)(66556008)(4326008)(316002)(2906002)(4744005)(41300700001)(6666004)(478600001)(6486002)(186003)(6506007)(53546011)(107886003)(6512007)(26005)(36756003)(2616005)(31696002)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WXc1R0ZVVVcveDFZbFJ3M0lrdkUwSzNDQlZwKzhmT00wS2dqazNPemNvVmVD?=
 =?utf-8?B?V1FaK04vUnQxVkVkR3hheHorSGl2dUdZb29UdGNRVEpjemorL282b3lDd3dE?=
 =?utf-8?B?bWJxRk5vSEc4RTczZ0s0MGhXQm1qaTZrYkpZakYvd2FIUjYwWU9uZUNvdW9t?=
 =?utf-8?B?Rjl2WG0wQlVINWdUdTlKZERFL2ZwTVExdkQvWnBPUkY3akdXVmxFUjlndjU4?=
 =?utf-8?B?VDhKWmZzZ0lvaDFUeE5sNytmakV1K2Z1UU5sY3hxeUhPck1IbkpMUTAxYncx?=
 =?utf-8?B?c0lLSHdnZ0tHNG5TZDBCekNrcklpcWQ2OFNSczVrM2UwV3ZXZWc3V2JmVUh3?=
 =?utf-8?B?amFhb0FWRG9zUlJ4akxnd000bm1jVEcwRVZKL1AvNzE5LzM3SklFajVzNm9Z?=
 =?utf-8?B?L0pMQjZQU2k4dE53a3lUSEZVTFhkZFh0NkExSnl1Y3pBVzUxTis0NVlNK3ZZ?=
 =?utf-8?B?Zms2WnRXeTZ6Nk9TcWJoVUIzWlJMS3FRbTVsWVB2andBbU5EbTZxZzRjanFX?=
 =?utf-8?B?VU51SWVkejlINFVWL0UwMWY2bTdMSUxleStvckxJckI4dVFSZUdCN1haYjQ0?=
 =?utf-8?B?eXU4SVhTNXMvdzVzeWhNZFlEQXJZUFBCZE1UUjR0b0J0T1R1MXNxak1KeGFV?=
 =?utf-8?B?ZFdUcnQ4YmppejYyMW92MDBNVElXRnVyV3Zrb242NGlMRlMrdS93U21Gb2RU?=
 =?utf-8?B?eFJ1Um1aNVVSNXl2WE96NElKTk1pK05HV0RiTGpXVHlVZ0tHZlpwL0UrejNm?=
 =?utf-8?B?MktMY0FoYURleDNQWm01VDB4Y2lZRDdzclJzZlZzMmk5bDQzdFJwQ3J5RDcz?=
 =?utf-8?B?My93T09OTXp2MnBmTFVEWElWVkJXam5xb1pGMHJzS3YySnRDdCtZYWJqcFZY?=
 =?utf-8?B?TDllMGdtRUNUdFhSRlJiTVFCWFc3bWt5eVBiejNydVk3YkU2UXYvalIycDB3?=
 =?utf-8?B?OXZzYnYyQy9sanJ3a0J5UjVNNm1ad3ByemtmYkswVUh6emxBVEFKT0tMMnhu?=
 =?utf-8?B?TjRDeWxvR1N3Q3JCSmFqd1oxWUR1UHlHS2Y5LzdGNjZURWJlZWJXUm9aL0s1?=
 =?utf-8?B?NXVXM3VwaE9MbU94OUJLTlVkczRxUnprWmMwL1g3MFpyTUthc0NvdEMva2U4?=
 =?utf-8?B?QmpiQ1lmUzdGMUg4RGJyWjhOZ1ZDRGZ6ejdWcHVPeW02UnYyR1VOYlJoKzhn?=
 =?utf-8?B?M2k2VUluL2pyQWQwMytObzJ4QS9ONzRDRU1qRW1TRTJnWFpsUS84MWFJRUND?=
 =?utf-8?B?NzNtUGJ5S2dYNDVvUllWbkJwNlJSR09YTUFpQ1NLUldrcC9RLzBOd2F0RDJv?=
 =?utf-8?B?RHhadEVIRW1DQ0FCQ1QzY1h3aTgwSSszeUlEMG1GUURlMDNCNXJCK0JBd2dv?=
 =?utf-8?B?SXhYSUZwbUJVdGx6bXFjNXRiS0dtY0RTUm81M0lkeTh0NDJEM2dDcWJ2NWli?=
 =?utf-8?B?eFJsK1AvQmh0RE5GM0JDNHg1aEFrdkJic1NJMnFEVW11UzltdnlBV2xiNklU?=
 =?utf-8?B?ZVVNaFJLRCt2QnQvNm5WYlFBbCt1T3NSMlhvVS9MQlBBa3NSdXVRYmFkNlNL?=
 =?utf-8?B?Q3MvQ0JVdXNpYnltSW1mQ2tNSTFHOHZaYkNtSU1tR2hZZWNQSFNZNnhMRTQr?=
 =?utf-8?B?bkp3ZWZ6QzBIZjJxSEZMZ0IvNThrR3RkZmxUUzlSOUlhYzl6K2lhRFVLK1Nn?=
 =?utf-8?B?Y29TOGgwaFdJWm1lNGVKakdTY1hzd1lJN2xZYW03TjRQSEFXclozS2FwdVY3?=
 =?utf-8?B?Q3BmWnR5eWczdW1SWW1EOEdUNjQzZ2FMM1o5bVhPOVAzUEFzZG1iZm9pQ0VF?=
 =?utf-8?B?QnBZM0k5WVZRV0piaUZ3dFl6MkZRSGVNdU5HZGlBeiswdTdaWjVTVU9aREx2?=
 =?utf-8?B?blMyWTgvZG5ISWU2b0g0Z2ZDSk9Cd1lXUlYySzdqaFJzQkxPK3R1Y3I2L0lY?=
 =?utf-8?B?Z0gvOURFZWVBN2ZaUUhwNC9oSXB0cmFHN0Rhb1FHZ2dDUEdEWTJqNnl0VWVu?=
 =?utf-8?B?U0g3dnNDMWFZelVlbEI0dC9nQTMyVXRmSmdyZnRHRWtQWWx2dlBhM3dLeGNZ?=
 =?utf-8?B?TGZrbUgyeWpYNXFwQW5EZkxyZ0xJbzhadHVsWHNnTnNnYTl2dUJEb090WWFS?=
 =?utf-8?B?R3hXeEFLOFlUb1ptY1o3MlJHd1BoRFVhM2ZWUkp6QXVIZDJ6Y0Y2VnZlemdU?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?K21YK1crOUE3K0xjY1BPVTdBK1FvcU0vbmdvMUJUcmwwMDBuRUhVQUZtSTVG?=
 =?utf-8?B?Ty93UWEyYWdpWHB1dkxMMnh4M3NKa1lYVHczNmtIaFh0YTBUVWZoYm5GQzdE?=
 =?utf-8?B?cEVwQXh6ZWtPczdiWVM2QlJHV1M5VHVuYjhJYjJjU3ZaRmxyUitGTE1oaWNY?=
 =?utf-8?B?dG9KOHZ1UUJyT1dNOGY4MWc2UWFQYUU2aGZlUHRZWlYzMUttenllbTVNNWt5?=
 =?utf-8?B?Vm5rSTB4aU1wSmdEcFpLMVZPVFQzZE1wN3NpemRnNWxzcEZxdlBnZUtidU1q?=
 =?utf-8?B?TkxnaHNkL3B2VEpvNS8zbnBEaVZONThOQ203K3lMUDRYa0FXRHFsZmI3Q1pG?=
 =?utf-8?B?Ulp1UXRYT2ZUTHNFaEp6UnlTeWl4S0N3T1pMR05SSklrMFlWcGFPQ2htQzRZ?=
 =?utf-8?B?N1Z4UVBFei81UVFwZldxTmxwaUJSWFU1SzRJS1drMVhXaHd0OGt5Z1haYnBu?=
 =?utf-8?B?bWVvL1g4aXpWcDFMQWNvTnFCRVdxSmV1NGdkVFRYTGJQQ3Fnczh6ekhRb016?=
 =?utf-8?B?SjQyMFlwcmhjSUJpVHVpSmtMSVZKZ1k2SnJuc241cVI4T0R0eXlzbW9zUHUy?=
 =?utf-8?B?aHcveVpTWVpCb2M4VnBYcG83S0lXNEtnMjQ4YitzL1NXck4ySG1FOVdnZ3kr?=
 =?utf-8?B?dEdtOVNBRzlCRnlnR0FDVzlWUFpqRUhDcFhvV3lid1hpZmZZdjUybTNWM0s2?=
 =?utf-8?B?Z3cwZWhLcDk3YVgxYWlvblBBdXg1eEUySmNUWkF4RTRSY0twTXhRTnVJVTht?=
 =?utf-8?B?NXJFVTBZMVQzdndZQ2pGdVRqSGJNekdaQW5hbkt2ai9XM0hVV1BjUE1HRXBF?=
 =?utf-8?B?NDNmVkZzc29tRUlHdnJVcUM3QndVbSt4dXVwdXdRNzY0NzhCTkdkcHliaUF0?=
 =?utf-8?B?c0xsTmU0Y3NDcmJFYWM4M2tDS2Y5aHZ4V2dJWWtzNit4VnFhQSs1M1h0M2l5?=
 =?utf-8?B?QW1PRmtNSGdqUlRSZGkvYytMeDAxWWNMVDc0Y1A3NjlGNkxQRGcvOWNLaGhY?=
 =?utf-8?B?VVJoQzVISFdPdU1TdDUrc1J2TWlKNXpyZE1hNDBjTS9GdmhDL3FmZFlOalAy?=
 =?utf-8?B?UVBWTVJ3YWJDdnBKMlhQLzIrSS8zbHRzOFNMbm1sNmZGMVFEM05XamF4N1Jl?=
 =?utf-8?B?ZlNwcjFIcTdVbDhpRDFjL0lTa0lNQk1zTVdNSWE3TzRoUEU1K05YTkhEL3JH?=
 =?utf-8?B?R2pjWjJPbGo1NVU1M1Z3aVNLTVRJdWRkNnF6TDYzTWFUU0FmdUt3eHRHRGRZ?=
 =?utf-8?B?RUthSnBab0Q5c3NEN2tLSkxPRkZteHZDdDNQQkRhS25xajRYd1JjeHIzMUky?=
 =?utf-8?B?TDQzeXZ0cENIWGxWb2JUalZLYk1BRTZFVVJkU3NNa05QcFp2NXd1ZEpuZXk2?=
 =?utf-8?B?ak9hQVRyWmtSRGRMN0diS3c4aUdoTC9GWkhlZGdJZFF1dkRlWEVGTXBmZmdW?=
 =?utf-8?B?TlVDNWd1blhzUWZvczhtdk5OSE1zMFhVYWxwTjRlVlZWdTQrUENXU3VuMmsx?=
 =?utf-8?B?SVlzVlBSeUdpT0xEU05WT1Iwd3NHUWhDMnRra2o3V0UxY2VFcytOOThMOUln?=
 =?utf-8?B?TlZnbW9JNHpMbm42Y25ndXYxNVJKaTdtSXhveXgzU2RDcUZGRnYvZERmNllS?=
 =?utf-8?B?NzNXanMvNWk2WHlmZlE1cksyN0t1ZjRnY2ppeHlZeGRqMmV4d3pvd243TCtt?=
 =?utf-8?B?a083aExGVWdZUEFHbmg2RU9YMXVJT3h0K1F1ZHI5cVhpVFVmdTVnTXY3UnBo?=
 =?utf-8?B?cG44YVR0L3RmWk5kOW5rUWY5RVJiQjU3eDJOUWRCR2RESXVzYXIyamdCcHZB?=
 =?utf-8?B?cGJ6Tk1EVmlydXRmdkVzTTJmV1RCU2N0NXplaGprcE1uSEpuYXR4b3lQQUtl?=
 =?utf-8?B?UWtueTc0UFJnQU1EVXBUbjFkWS9kQzQwbS80bDdPM2NWdloxVnI5WXlCQ3hD?=
 =?utf-8?B?K0Z5RHNvS3JWS2M2VXBiYVh6SkhpN1N5cjdKK25YbmZsNzdjdTQ0ekJqRXd1?=
 =?utf-8?B?aUhPTjU5VlpUQ21vcG1SbCtWcUF0WGVXa2hiaFlLdXk4cTRGZTNKTklPVUhk?=
 =?utf-8?B?Z1c2M3VQNm9NQmR1NmlaTFU1SjluZnlid1dvT0hxVHo3ckZzak4xdG9RaUJH?=
 =?utf-8?B?bHJ0RnlVemdOZ0ZlZjFyV0lkQTUwNUpQalRnNzVOenNiUlordnVWRUNaNkdo?=
 =?utf-8?B?cVR3cEVWZnoyQ0JqcTQwWXIyak9BYTF3SWcySlJVNTIrV0Y5VGxBVzJoeHpy?=
 =?utf-8?B?aDZuM211T1BwNnJMNW5jUk9xV1JLUGlCTEhza0s4N0thMlhPRGJlSlNBOFBU?=
 =?utf-8?B?Mk5BRDNjWUx5QVZmelVDZWo5dkdlM0oyZXY4aXNjT3N2aXVEQXFDejgxQkpN?=
 =?utf-8?Q?2XmrEcmUGZNTKMgc/48LOOPEp3dumZU4lDJzvX3MnKbHQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	4r/jnSiGPNybN1jL+PgCg9CiKiSD+Ch3WY5Lrtsfk9Ru4dzCXhWrjSufLj/AfdWdmWrJnOBNtI53k8cAsgL+7efWYOE5F2IMgw5vcevmnC3ToyIRn5Z2amdiotrm3ZSY0JYGZas+oxTevftETdby/pyK23WUtmaBRsKgGvgMHSmSoH/4hCYuvvA5bw+Q8xU/nX9UCE3hNAL20+eaa9foEb4ZRn0ok3rQ7Dtwxmz4ir0aS8naQDHmLGWiC2OW+ChTnHXYBkIEHNhLPB6Ti3HM7ond5tmOmNL/Xy+gSknvNyb8WGcMfT33/DVOMX6FOZem0E0T1rlbwgubYEa2y+nIUJ5eEz0gwhn3YSg5WXd16qu+JPDDm1kKeLRAwia5Z7tSJQjF0y5TKEZNiHIRbx2Sm92V/XR8JEUtBu6C+pS4M28gYS8oRG6YmfJve+GMSe2YOt9mN9cHtgCnEg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe51cdf0-2034-4140-5718-08db6d245056
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 22:11:33.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09oYXa4rmvOO07cosJE5g+CW+qG7PuEhcvOcCXUcK9Nvru89x8qYwwap9e2+mtIzPUQYU6LWvBoktpax0g+lnP+uNTm87nC8idXDfYQ9Tlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=949 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140194
X-Proofpoint-ORIG-GUID: pC6TT_BFCX1nNGxbXm7ry9qbuWqZBJ2a
X-Proofpoint-GUID: pC6TT_BFCX1nNGxbXm7ry9qbuWqZBJ2a
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/23 10:24, Alexander Gordeev wrote:
> On Mon, Jun 12, 2023 at 01:27:53PM -0400, Eric DeVolder wrote:
> ...
>> +config KEXEC_FILE
>> +	bool "Enable kexec file based system call"
>> +	depends on ARCH_HAS_KEXEC_FILE
>> +	select KEXEC_CORE
>> +	help
>> +	  This is new version of kexec system call. This system call is
>> +	  file based and takes file descriptors as system call argument
>> +	  for kernel and initramfs as opposed to list of segments as
>> +	  accepted by previous system call.
> 
> Which "previous"? I guess, "by kexec system call" would sound clear.
> 
> Thanks!

OK, will make that change!
eric
