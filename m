Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED367B7DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 18:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29H05YHMz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 04:06:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=g5oJkaec;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L/8+HtSz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=g5oJkaec;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L/8+HtSz;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29G06qYWz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:05:43 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PFQBgB029186;
	Wed, 25 Jan 2023 17:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=WUoT33k2oKGE//+xzXJlWgAjYlViU0TSZDltBrob3o4=;
 b=g5oJkaecGdDVWjiPvmQ/rCXcbC9QAZbzBB9VULpgrE65PFJ4JIuGYm7AE0j+hG3VURVT
 h3bfivi6eZ0x5kWfFklxcIb3CqLkbmhx6VLvpSlUQjz0qOikRiD0Bnev8t/guN81raQP
 AVOozQJQmkQaI55blwganM7OvB3VZ3j+EzcLiJCqgRG0S1pCuX+qj++glyB5A3WzjgM/
 3XpIAOvfnjOqXGHp3M2CeLS5uI7I3+ePw5Teiw9QJx50471o2IQOKgvyPAzocAFYJdzP
 ClPorGdOPUfgZm00qRk9+OA186ND/KO9jDzNYUyxVlO/Lyf1UDOAk23IEJp6MOW222C7 dA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n88ku0dsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:05:21 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30PGC4U8025091;
	Wed, 25 Jan 2023 17:05:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86gdna8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:05:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6vmjV3OsFH1VCeuDhE9w4fu3yJGPwM/ZwprA8UQ9/PJVKE1ra2i2kxnXSUdKJHTeDwLLT2B59bo+bIOosRhyW+Xh/hCknaBV1AG+oFuUHqnAeZcpa29smUD4FDQ5crUi3PPbFyYpy4Df2FHhcb+mRKGwybd9IBvBduVuITyJd7AnaTvml/I7fKQKFxcg+DLkJ5P2MSZNWUfxWLTxYwU+sOXduXbWDL6JMNfJAkhcUQN9Wua2E/cztmuYAwIcLkB4oYM6eSpnKY+2Vxb5J/EuYvW4/Ogi0+VE+NIe8cH0y5gmIxWe54OtbVY8YlMfKEwGSk8c9LKyEVmOgntYPaq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUoT33k2oKGE//+xzXJlWgAjYlViU0TSZDltBrob3o4=;
 b=S0t7APjJcskHEbkFKVU319vBI/m4tgRJIl8DTv+B1ovuDSXPvWrTX77zfHQ1Mac94DOwHHaL7UywSNjoJsB1ujj+ck0HjRXVYNpOp9tkB6mE2yPJgfmW6IJSrcTlom3k2Lxua8gvfCu2D7sX22zp4Ae/mnrajxv34NDNKtvJkLwZ5RrRAkUt/FSmZjvU5t4DqoNT97nfpLqQmmnaclS7xH/IOdbfo8By0UDSQs8XzBKuYWZuvdMwriVaUCOJTmW8E+iDIAhsLMDT5QD/dq3ZBWQRpsywyiTWjiBVGSsgX19vE/vs6LYLVRi2d5Urcc6eLzkTBnDeaGIsjJhpLuMGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUoT33k2oKGE//+xzXJlWgAjYlViU0TSZDltBrob3o4=;
 b=L/8+HtSzqXhVikHpMFkXeDvmtoQdjNtQfw9srZlqtxa5HeNyWILUMFfRxFpZlm6yfjWZjfyI/PlqIKlRAVOIS0nyYcB06OADZqE0JAHvwNrNWucCAAE294I9nWQ5a42mzNzYOmukRTvYR4TTH/vA2SzAccbPl7/BNs9GsRPU6+0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by DS7PR10MB5069.namprd10.prod.outlook.com (2603:10b6:5:3a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 17:05:17 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%8]) with mapi id 15.20.6043.009; Wed, 25 Jan 2023
 17:05:17 +0000
Message-ID: <770e1ee4-81f9-37f3-e83c-1c8cdc3598e7@oracle.com>
Date: Wed, 25 Jan 2023 17:05:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 11/11] perf jevents: Add model list option
To: Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Florian Fischer <florian.fischer@muhq.space>,
        Ravi Bangoria <ravi.bangoria@amd.com>,
        Xing Zhengjun <zhengjun.xing@linux.intel.com>,
        Rob Herring
 <robh@kernel.org>, Kang Minchul <tegongkang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sandipan Das <sandipan.das@amd.com>,
        Jing Zhang <renyu.zj@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
        Kajol Jain <kjain@linux.ibm.com>
References: <20230124063320.668917-1-irogers@google.com>
 <20230124063320.668917-12-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230124063320.668917-12-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0532.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::14) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|DS7PR10MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: e420ebd7-996c-4e15-bdd0-08dafef65562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NQW8OFYR81n4cX/KD+GH0SpT/YhvzdiAUElpOT4tzUa8t31MsNIe/2B118OCbPmlfrdUcDod2NtkOEGTOKYIb+nrE3IGr2JqDYNdhbOK2ocVk+WzIRd8KyCu+ThSUQNO8Ry8WUcg/2kjiK9b/Mn9aCwmkG+AOoqrZ5lMb8QQIjmdh95asKw6v2PcWUW2iOJTId1FypPbIxU2WrXAmwQ7vJKFt3Sxiom/7VH+WqofKRJGjRCUJL5hzUI7RKZuB8NnYa7tSPR0RbbAx6Fqyneho90GtD5jRgBgz2zpFowa4kzQ6g78UAThagjT0pQvaw/znbg6n22IEccngwJ92BKn7Ea5ic+BYRcpt/cVFJqcZdmlWxpd51SACWfggBj/Fp72eNo1ntJvkvcQBp3+X5ewk92OPvEHMlS/nXDijgb4ZU1bGmaT2RzYnwqj8BL9ItfDd5MECpzT48DTmxfiaX6ivv4THn2CAAkvCRXzc7wHG2R3PdTsIUanqvT/sViOT/9mD0Kg4KzcqY5EWZSw5rvqlOqHOIFHQtlFVGnVpYBRm+/I8x51QM/PTUKxRhbQonXld+zhW0KWQpSRwzRuF5zmOQd7uYTsRk3Mh3Lsw8tWmK8a2aqLitP/UtmeahjkpdnttzOlfbntqlunxAgpTeE1Adfx4UfnhaB8o0jxKe0rXM7OtHKQb0iDZA2YQqZo0PnR+mwvhRe+gP97X4Mn+FSBy9qwTIfCE4qpEcCRySfVhJXVYMckzkGMlW6nUtXsT0GM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(5660300002)(7416002)(8936002)(83380400001)(41300700001)(8676002)(4326008)(7406005)(36756003)(86362001)(31696002)(38100700002)(921005)(4744005)(2906002)(478600001)(6486002)(36916002)(2616005)(6506007)(53546011)(6512007)(186003)(26005)(31686004)(6666004)(66476007)(316002)(66946007)(110136005)(54906003)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RThTRVJlZUVZaWM2cndpcm1meU1tSkFxMk5XQWZXRVEwTldhcXQ3T05Hc2F1?=
 =?utf-8?B?Y0Zrak9UbElBMGc0NzhaTHgva1dFbkJvOE0zMnVjclBScVNuRlREZ1ZuaEVw?=
 =?utf-8?B?MHB2eEsycktMeEM4V3ozS1p3RTc2RVBUa2NHYmh0blhTQ0YxSFYwekxKTVpx?=
 =?utf-8?B?c3JaSWJHRXZKblpEK3R5QVNndU9lcUdqRlNRbjV0UjZkUU0wOEpaZ2V0eVpa?=
 =?utf-8?B?eXYvTFdabTA5M2t5RTMzOUJqY3czR0VwVVhXN1d5UjlaMlA5NXh5T0w1MmZs?=
 =?utf-8?B?bUs2MVlIdHI1ZlRHTVBiV0RaRTJyN1J3QmdPYVR3RVNrWGFRSG1IYmw0TkUx?=
 =?utf-8?B?ZW93NEN5SEFBdFdYRkloYjFaQ2dQTnhUaVczelJwT1VtYVpBWUUwUDZPcWNt?=
 =?utf-8?B?OW9ncE53a05pT2hnZWVsUlowTXgweHZNbHoyME1xU1dFMXNKZ09XVlhIdk5P?=
 =?utf-8?B?QnQybXQvTDdwUWN6WWVKaFA0TGpWdUM1c1BwVHFYeDJXcWRpL01MMWRaM2Fj?=
 =?utf-8?B?T0dhNWRtREdvKzF2T2xxMHpWUFFFZDRVOElwL3haRE8rMk5sR3N0ZzRQODQ2?=
 =?utf-8?B?VGNSZENybkJGa2pJWnh1RVdrQ3ZiL2ZIQTdVVDdpelZMN1ZSeVUwVjdtNGcy?=
 =?utf-8?B?akxYaFg2RllsVjdlYUtGY2Y2blhpV0NUNjNEaWc0NVRuTERmYjNoMzdLREI2?=
 =?utf-8?B?eFZrdmNjbXQvWXlCQXNZWHBJRW96cGFUMjFoM3F6M3p1VDduZFBUSFJHUXJq?=
 =?utf-8?B?ZXhWM014L1BZdzFmbHZmMjlpam9ZUmxXWmxyVFE1aTZmck5wWmE2SDh3cHcv?=
 =?utf-8?B?UFdmS3JsdFFwVVNUZWo3Q1kxSGY2ZnZwQXJ5WmRpanhTZldhWXdLZ2lzellX?=
 =?utf-8?B?bm10ZTVCNnZINTF2SmhZcE9uZE52WjJNc29QSW93RDJXWkQ4R29aZEJCMmVl?=
 =?utf-8?B?VEUwSC8zOGFTdzAzZSs4bWpDczFqZ3BhOUxPa2NyVFgyQ1FVanR2eFBxNzd4?=
 =?utf-8?B?U2s5bEl2NGlkZEVJbUNmV2psZUZ2eXpsbVNUajdmZVV4SnZLN1V6N1I1QTM1?=
 =?utf-8?B?Q0svblAvbmdWRVZwWVlzcUh6Z09OV1lLWDBiNWkwcng5dDJrWEEzT2N6Zzdj?=
 =?utf-8?B?U1JvQy9HbkljbW9Wek9HQ3VNalp0ZGVFaDVuVzlYdE5Nc1RPWmlRUXhqWVRj?=
 =?utf-8?B?TWpLSXFMb3hDcWtuakdDQlNsaWtiQ1Izd0pnRjlQNWJQRVhKS1dtSkFrUTBI?=
 =?utf-8?B?MzhzekJOSlZJMk9nQmNwSm8yMUJLU3pNMmdUK2ttdGRIb01pM2FnUTR0d24v?=
 =?utf-8?B?SGlsL0YwY1FUR1VDd0RDM082ZUNTNzl5QnVvZ2RnV09UNyttWUpkbTdSQ3JX?=
 =?utf-8?B?TEtyK2JWai9Ca1Zya0xELy9JNklUc25ZUFA2RnVOSkI1QUNCQjl2Q2llcFZ4?=
 =?utf-8?B?M1JHN0tydGZJdVdkazVIME9ZTC9VQnlqK3Biejl3QjQ1aS8rS0l0RGNXYndL?=
 =?utf-8?B?eXkzVU9YY2pLWEgzMmwybWhMWjNib2RuWEhCbi9mMXhRYXlKU3VzQzcxZlk5?=
 =?utf-8?B?S1pSN0hWOWI5a2hVMmdUeG41bW9wTHlySFhYZUhPNkdVR3UxeXhHcXlNSU9M?=
 =?utf-8?B?bHNZaTdDWFJLNDRySGY1TFdydWFjMHdyOWlLWkVKRG02NWtSRmZrdFFXV1dh?=
 =?utf-8?B?RGU0b0Z5MzZBK1JoL0ZiVWNJRDI4QVZMcWVHaGNWR3F4MUltRGdpMHQ5VWIv?=
 =?utf-8?B?THorNFRkU2QxVTdMN0xUbm91OU83MTFPUVRDbEh6cStPMEcwcXMvNVA0OWl3?=
 =?utf-8?B?cFB3NVZWbzFNUlo3NHczUkpNeXVLcHdGQTIwWWJPWlU2TGpGWHJRZ1FlRmZw?=
 =?utf-8?B?K2tRd2dtb0tWRVNFOVZHR1dmbkErQXhvUmtTYjI1QmVzcU9GTFh2bXIyTXVL?=
 =?utf-8?B?MUJteXNURWswMWhncGNmWW5XZUFaSUQwa1JkSlVvRm9qSERSb0NDckh0TFZh?=
 =?utf-8?B?ait3cG9YVEZVSEQ4SFh1UFlqeS9EeWxRRjVOdTZqQzhJN1Zoazg3c1dWSDly?=
 =?utf-8?B?L1Fnc2VTQzJyQVZ5YS9nUkNNRUZwYjhIZzJvNmMyU0c0cEtWUi95SjJjRnRx?=
 =?utf-8?B?emk2ODVXZEF5bGRMR1Y2OGhLWjRTSm9WSC9SdmJ6alVVd3ZGSnJqMWJFUTNQ?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RnR6SjJGSlRyVVYxcTlYWkMxa3hvQXFiWmNRRmFkVWJIKzNNNThrcHhJOHhs?=
 =?utf-8?B?WkpGWjdaUW1XeGNPKzl1WkcyelVrcXJJdEJJNnF2alovLzY1OGU1ZVd3YlRq?=
 =?utf-8?B?MFhaRzJnbHRmSUZieW1NUWp6T2hFOWQ3d1lZUW9HaVBQbUlGWWRRT2RVK0ZN?=
 =?utf-8?B?bGxHYWJydUNIelRSMVpUTzJMZDNmdlhWS3ZtMDJ3ckdnZnpENlVyRXZFMTg5?=
 =?utf-8?B?eW9ra0VMR3BEVUU5V1UwaDM5YU5nclp3RUZIZTZUTmVDdFB4NDR3bVM2cm1q?=
 =?utf-8?B?cnQzelNwUEVYMWdsMXhoVUdBUERYeWVxdlc0TVhEbFEyL3NlTVFJVVhvVkhV?=
 =?utf-8?B?NEZqVjVIcldvS1NvRkRiOWxPN3VIRG5QYVg1UytmVlBNVzZJSXF2YTQxcnZP?=
 =?utf-8?B?KzFNVDF6MWVpZTBLbUNUbzRCUUE0ZFBrZ0FydlZrNVB4NDZ4T3Q1YlZyZnhi?=
 =?utf-8?B?emtYNEZmUk5jb3BPOG0zNmJpZVRnb0VDRkl5THorRUtnS1ZPWngxM0lXVzJ4?=
 =?utf-8?B?NDVRc1QzWnI0MUpDOVNrK05jTXR1TEtrbVVodlBuU3BKc3kra3gxWHJiUmRo?=
 =?utf-8?B?RHQzMW9ZTi93NWVkaWxHdVlEbmp5a1Axc0h1VmpoVlFEMENRMHF0cWMyTmtj?=
 =?utf-8?B?K3NtVVltam1qL3BlWHphcEJ3TC94dEN4UVZ4VVFBRDdYR3lBbjdlbHZVNVMx?=
 =?utf-8?B?aU9VcnV2K1NKcmhxa1ZwV3dEemVURVhjQnA5MThmZHZoTlNnTHpEcFJGZFhj?=
 =?utf-8?B?TmZvM0FmaFdqMy9BSko1NFpGaSt5SjFyazY3VWN3azRnejlveWo5UWt5dnlP?=
 =?utf-8?B?Y0NOR1lmN2FmV2pDUGZCVzBuQjdlNDB5aU9YK0trUXJ1ejVBRW9PWVFTNkN0?=
 =?utf-8?B?SUJDSGNTZXE4Zlo5Tms2TWJsbHVGWjgzMGpuZy9CME5SZTBYaXgrd2hjUzBm?=
 =?utf-8?B?T3pZUjJ1YVY0SklpYllsOXBxbm1VSGFUVWpZMnVEei9tTlpxL0pGTjFXenE3?=
 =?utf-8?B?R3ZQaU02czVGMEIxeWRkOHVWTnVNZXhhbjZ6WDFKdXUwMG5tRWhJNHB2Tm1J?=
 =?utf-8?B?WVRudThCdHlaSUF5d2ZROHJZOWxJRjhDb2ttS1k3RGR0NWNKQnFmaEJ4bm5F?=
 =?utf-8?B?a0txZUtUemxYQWd4bjQwbnVXTGtWRlRWcVhkRXpqSnpGVzRCTHJMK3hwaHlh?=
 =?utf-8?B?cVZqRWpYZ2t0M0d0T080bnZOQ205dENqdnp0NGQ4VDFYNWNZbVZrY1VrMUtT?=
 =?utf-8?B?WnhwNlNPV0VpYWFoZGZJWEt3TmFjOWZzNXcvU0w2aW1rUTVZcHZjSjhJaGpi?=
 =?utf-8?B?azdnMWg4MlFiM1JwTksvYTg2blpJaDVhcDZIdSs3VVZEZEQ4Y2xvSEFKaXFs?=
 =?utf-8?B?Mi9PSHpaZFdrVU1EUWJ6VXpEWVJ4YVExNHl5ZVlaNHR1ejRFOXMyUU1ZUjBL?=
 =?utf-8?B?Q0czc3hHc3gyNW0vUG5mRUZYbk5tN1RtVHJaclhac0VlVUN5R3RMdjhGc1dK?=
 =?utf-8?B?K0VNRWdjaW5xSUQ1M2VxV0UybFdyMlhHNEM4TUF4SUlDZ01WVWY1THhiOXM5?=
 =?utf-8?B?QkRMTS85V0o0YlBpOXRudFByUE54eURrTVJjTW0zUFN4N0Z4YkI5SDREL1c2?=
 =?utf-8?B?Y0VDRnN4WVFoZFJya1ZqSlJkSkhlcVZEd0QrR0FvaHZLTjFqanN1OG9GVmdu?=
 =?utf-8?Q?9kyUqYDRYhcbsVwVY4oN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e420ebd7-996c-4e15-bdd0-08dafef65562
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 17:05:17.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbDm+1+2VxWArA16XEQs++LcmSD/NMN+kck7E6qVc841w7NfvxG2xcyFWYrJFKPtX+ejXgXQl+PFCI97fZ7gHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301250152
X-Proofpoint-GUID: 5p8Ovcu6tDqgT97Puqgml2UgduleXR06
X-Proofpoint-ORIG-GUID: 5p8Ovcu6tDqgT97Puqgml2UgduleXR06
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
Cc: Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/01/2023 06:33, Ian Rogers wrote:
> This allows the set of generated jevents events and metrics be limited
> to a subset of the model names. Appropriate if trying to minimize the
> binary size where only a set of models are possible. On ARM64 the
> --model selects the implementor rather than model.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

would it be really difficult/painful to support model names as specified 
in the mapfile.csv, like "skylake" (for x86) or "hisilicon/hip08" (for 
arm64)?

Thanks,
John


