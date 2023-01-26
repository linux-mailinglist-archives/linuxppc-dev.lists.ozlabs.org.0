Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5367CC8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 14:46:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2hnK19Cqz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:46:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=icBoSH76;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=u9NllA2y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=icBoSH76;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=u9NllA2y;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2hmH3wS1z3fBL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 00:45:17 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QDimRG018279;
	Thu, 26 Jan 2023 13:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=H8XxoNOlKe26Iw/CVuOPZ1MRBzRjfUmrvh+MlJH274w=;
 b=icBoSH76BBdXwQaiPwK7R6ZZga9AH54Cs96pQSntP5z/Aa8+0LlmXHxwvX5kgEWg14Sd
 +BlhZhVDr4O4GBrG7oTcvFfe+XxPxoTKIqaFl13Iv7haPGCGgLXF70xiVHQAYysfvYbO
 M9dxPE0CKz4gV+jSIXtpD+JbQlx1+VBM5Ngpnkq0Z63cbG3A12fjlOALoRvPcqVGoP5t
 pMke05mOWOmymViOCXph5n49T/3GBROKE9iyAmvGkbGMmhkIEieH3viVCeI/osOgEdKX
 jDfq91ADgtbLWpMigT9mgbBeqr37GIWD9yH29lkQ+IlA4bfAtUAZJvcg7ecbOI++z48Q fQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86u32aug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 13:44:47 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30QDDoLV019179;
	Thu, 26 Jan 2023 13:44:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86ge7abn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 13:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B15ylR6cFSaNoaKaTWGqMt6zaecmTGlE+LpV0E4TBon+cM2EaER3Au39/uo81HcixNXEgphzbeKfrhW0EmQ49w77dkoia3PuhEiq9bk+kdxQb1aqejkbD3U6IQfD6wmSqQG+jA8VPgTrHlNiHl6LLtoI59MmwISVWH5O+69fqBH3E+136db2kgcWIL9p1ErYnF2ULi8x/nQf6eel/o8rxMPM8J604O1FWmPrY8EH2TksazZpnJLOkDNazgCOXTZtfd2Yz+2PTL8Q7I3q1M9lAbOESiYZZnKqpBg1c2arjziyhMRaQ/nGh+lDW+RCl9Vck/X0BD5JPO7bTIRQH0DsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8XxoNOlKe26Iw/CVuOPZ1MRBzRjfUmrvh+MlJH274w=;
 b=Kw8fl5YU79cKoEYIpbZl2xPY+IYBhBBERzNZpAEpqh+/G6Lb3mfFFfsWsewBw5DQax2r0p43+IYAQ+t05ek7LNCM4XQqpE2NVWGcfteDHpkhe2kLRVy8175uFGYU+kaiq756WVQBdD2E8wp4bQh5bXyfOu0bMjHiwzr15AcsJgX9AR6Ymd4QELJyuppmGezQ9HBAbEI5KGyqI5RS+Gk8yzVv3SWPoeN1v3Ad78t21AL6+rSyBBwvMW5MJwRW68iBbQNBq6zLFtwVRz86i+8mbnGaUvqbkzt49GcsoLr5IlPdZqjBtM7V9lyod5nHFdIzsIeB3Hz4s+RwEYc/p7pZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8XxoNOlKe26Iw/CVuOPZ1MRBzRjfUmrvh+MlJH274w=;
 b=u9NllA2yZFOpfMKYl+65stbJX8Xm+PoUjP1SGoLqoHfIwWmd2dFdRnsgdxfbPp2z/NBdVWS/P/5ca0vRD1AAvVjw1SLD0z9IhFUj3nV5WkHG9d2KyyEEJfVY/O3S+Djag2kOKpzMDnpjJAAt79GJF/Oy/710gpUWNb+nJmLM9NQ=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BLAPR10MB4980.namprd10.prod.outlook.com (2603:10b6:208:334::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:44:44 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 13:44:44 +0000
Message-ID: <10ae719f-2549-a367-2d2b-48671a00135e@oracle.com>
Date: Thu, 26 Jan 2023 13:44:39 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/12] perf jevents: Add model list option
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
References: <20230126011854.198243-1-irogers@google.com>
 <20230126011854.198243-12-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126011854.198243-12-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BLAPR10MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e37a72-cfa1-4ed5-1748-08daffa37b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fKM5D9yioZMIPvS6UIxUO6tYcH7ZCdZEduvl2ukQXLRZfUH7szPspTUFXc/U/NBJOho/2NC/39DQ4oRPj35eNqfFuR6Nq7taLU8GmyXVNVtRIj78bNr+dI5MHkHgDv/YhS7Uh7pnNpm2fHk8GHFeAVE0eJIHh646aWzfwk04f5XIVEMQ3OEflIyLe0i9yV1+3TUWcz0fH72X5EyQ/llCTUQbt855nHZXx50xBFy1Zep4WP9h2ecDxZQmOcoa415jZ9CWHy67zH60l3VTOAMpCbdu9c+H1kDq05qCLBIfaEPdlKvvLS4ZUQEGf/AmT9FsYd0sdua/s0JDEis7Wdav9mskNQs02vN2qAhiBKffdBQ4vf1c/oTuJmbeg21vffyGH7I5RjNFIeUqEPj4RlT7akPSfgmX0auL3ZQlNuo5t6Xv81pmPS96l6+rwhywO6YkfJb0iD7Qdr/o0Utf9dN16qfWS9ayikUaOeIJIEoy8aeHYJsvQ8rbrKEbyP47/UxL90EfGxiwUgoTpVGMJy1g5BQCjRJkmT0X3heridI1vXcALOXsTiFQ06XHmCmozroCNVOGsXOvothEu/Rk+fncGx4nQj4+7RYJADPfhYKvMsdmbQSqJ58ZHkHLmPYaNPCN08iCLTctfb8e9Fs05spzfcK4jHQBvEH+DmtmcRbH1dIdJfZn1G0zcOgKHFzgB3B04IATbtxXDITswyIJzI9MUyPU4Kb1SVfK2nptX4OUsjgWqs5Rgf0e8vzLytQ7m6HM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199018)(83380400001)(31686004)(66476007)(66556008)(66946007)(4326008)(8676002)(41300700001)(38100700002)(2616005)(921005)(6512007)(53546011)(36916002)(6506007)(6666004)(8936002)(26005)(186003)(6486002)(478600001)(31696002)(316002)(36756003)(5660300002)(2906002)(54906003)(110136005)(7406005)(86362001)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?T3lIb0Rrc3M4c0tCMm83RlFTS1J2QXpoR2g5c2NqaDFEQWpBcHpIV0o5dlZp?=
 =?utf-8?B?ZzBNWC9kRmlyblBsQWpwelE1V1Iyakk2UFVqTjIwbXJyTThvMFlKemxHd2xE?=
 =?utf-8?B?M0VvU2RQWFJRZWZiYmhqYW1paVVzYStwK0dMcTlhanB2UzZub2RKYXY4WkNL?=
 =?utf-8?B?bW5NbzBJeHpYZlNCdzU0RTVaaXpwcU01bWtVMDk2c3paM1hSTzRHMEQ0WjFD?=
 =?utf-8?B?Tzd0bFZYa1hhUGxQNW15TndjUkFhOUhkWFVadHY4OVBpcGpOZml6c2dPR2Nw?=
 =?utf-8?B?VHF4N01IdXNJSXh0VmpnSG9JRUp3eENzelFNUDdZcnV1aE1UQlk2SVpUUmxu?=
 =?utf-8?B?OFB0REZacHlnK045bFNhdmJ2MDVNNXNpRGJaSlRvbytTWEFxdzZETVNvV2g1?=
 =?utf-8?B?Wm5nYlJpdjhCRitrT25pa3V6bG9ab25SOGFlNStnQVdxdzJXRysyT0FCU1ZE?=
 =?utf-8?B?TGhNSUNrb2V4QXlBY1NGclN5Tk5LOUlDcFQrZlcxZ2Jkc0lWN1hLNnVMZkNR?=
 =?utf-8?B?UXhaMEpSRm5aUDVuQ1dXellHc25GTTZ2QjJQSmRWT0tQb0VWaFpOY3VCdjlF?=
 =?utf-8?B?cHY4Y3R6MlJYV1BEV3JQcWh1aTNwaTljV1lSWjF3NStZVjNWSTRDTWZkYTgv?=
 =?utf-8?B?SHJjOGhTN3R2S2ZMZ2o0YWdOY2NVMFBLNGhqOFZSbGhqOFJmQ29tMlk3cVRQ?=
 =?utf-8?B?L1R1VmdSa1lleE9ZcjNPc0J6VGVBdlNHM1RJTldub1ppbWZuYlJNU2ZlUEx4?=
 =?utf-8?B?dzJIUkRCSlZNM2lwV1VnUXZycElJNjFnTFBCK3hJY2lFQjA5bVJETW5BWnow?=
 =?utf-8?B?UTVtMkxmcGh3d2VRV1BsSjJBLzMxZlp4RmRnZTdpNmdjcGJmVHhsSnFNdFhF?=
 =?utf-8?B?SThsVWV3aXozQzNOUHF0NHFHdVhka3FMcTJmVmNKSysrM29Bd0JvSzdGUVA0?=
 =?utf-8?B?d09WTEw0c3FvNUNHT1grYy9icHhkU2RmQ0xLNlU1M1gzRllnaGsxVEN2dzhy?=
 =?utf-8?B?U3NvSFlkdExxbzg2bE1CdXpWazkzWDRleXU5YVdKVHU4TExkR0FBM1YweXpq?=
 =?utf-8?B?VDB4R0ZyczNTb2M1MW9OdXQ2Z3ZIMTdSelpzRmt0U1JWTWZLbzQyRTVzNG5W?=
 =?utf-8?B?TjdjVlpqZkJUYmtiVDh1all2dTNEckFMUHlSN1k4Z1EwTTY2WGt0aGpDeFhD?=
 =?utf-8?B?ZUZuZzlmbjN3djdKS0xxWmpzWnJwTGlGam1qdTE2M1RaUlJPbnNoUEFDS2RB?=
 =?utf-8?B?SUdmTk5aMUlzdlRESndnMitjSEhiQk9aNGEwb3JtRFEvbkhCRXJidUVselBJ?=
 =?utf-8?B?YU5SRXJvY3JUeG8wbEdJWE1sY3YxZ00rVjZEVDVzZUtRbWV4akVpOXUwSTNW?=
 =?utf-8?B?d2VJblg3aU1DeFgxakxDS2NpZ1JKK1hSQVQ3dk9vRDQ2V25EN0FDZ0Zvbm5a?=
 =?utf-8?B?MWR2a0FEWDdxZE9LYXZYaG41Z0Z3NmFjMkVSNksvaTljOWNCWmJQdUR5R055?=
 =?utf-8?B?d2dKWWQzanZBb2gwYitZQjBTbkgrVXdHQXkzZm8vWWZlR1Q3cHdKR3hDd2tv?=
 =?utf-8?B?T3pHV2pZNjF1QzdsTWxwWllLcXZva3dtRjNtOGtIdnVCbXlxSnhpdktIRHNS?=
 =?utf-8?B?cy85QzdDTEExNlpKZ1Y1ak4wejhJMUozV2l2bmFwRit2VzE4VSttWlVkRVNw?=
 =?utf-8?B?a2JvR1Q0T25iZHlkRDNYNVhvcmR3WU9BaFBubERkQUlyM0NMU25ISHZMcUs2?=
 =?utf-8?B?MUcxVjJuMCsxSkkwTFdiN2FiRnNBZGh5aFRmK1JURmZKWXVVbTFzaFJZaFJa?=
 =?utf-8?B?ZlFmcDVnVEw0N3BZREJONjAxS3l6cVhUZTQvL3hsT0xzM2JqTjdWNURRSlc5?=
 =?utf-8?B?amJoQjZLWGlmbENmQjI0NlpRN1N2OCtjc2JHLzI0OHdaRCtnL1BVRjh1Z09G?=
 =?utf-8?B?bURkeHAzQ0N5YXRjWFQyK2lqb2o5dEFTcnRieThiRzc1dCtrQ2ZsZVQzdmJX?=
 =?utf-8?B?UHdBeWlzL0JKQWxpTi9mR0lKbHVLOGVoVzFWWFJPNmY2eGx1VHZWemZ4TThk?=
 =?utf-8?B?dUtsL2lrRUZxaHVNcnJEZk1PYmx5bW0ybGVCY2hqRlBJUlZsNTNBYXQ2RnVK?=
 =?utf-8?B?Sk9ZVFlSZWJTSW5oanZ0SnBSUUdkNmRJNFZFd05HeVFFZndkTDZEUm1Odk45?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?ZG94R2xoQVYxVjlZbTJSUHR4WHlFZ3NnVGljREtQNWo1K3h6MElPYk9uRU1N?=
 =?utf-8?B?eUZ0SmZaT04zc1ZUaUhMemZGSXZNRzRmdUZXVmdSSlBuWThKRWdYc0JXdHM3?=
 =?utf-8?B?TlhJYVJtZVBuSVBzYi9wU09vcTUxMFlVRG1XUE1zQ2UySXdMTjZNZExpM3U5?=
 =?utf-8?B?L1ZpUGN4d21md1V6K0E3cVU0NFFXb2RXejArTkRqUk5HaTkzZEZSMm9ZMlA0?=
 =?utf-8?B?azByd3JHMHYxWisvQzdxb1BtdzI5RGpkdUZoT1ZTT0R3QUJ6czU4aG1QZHJV?=
 =?utf-8?B?MCtoNjFTcmFKc09vTFdIMmpMZ2dmeDZzVnp3elcvNGhqV3IvbHNWMzB0TGtP?=
 =?utf-8?B?WUpEQXB2MHFaVUZrazBvcU5KNHR2VHgxbGwwTFZSUnJ2dmpCSGdQem5tSXAz?=
 =?utf-8?B?bVdJVzFtMmMwVWRJOUxBOVA4QmdrdHJtOE1zWmJyazRMNm1paGo4TEs1UHEz?=
 =?utf-8?B?WFU4Z0VoaU9Bci9zcHNRVFp3eE1JSEZOdWgycCtOTG5FYXpiWEdqSmxMblVx?=
 =?utf-8?B?L2psQzNra1RRbkVoSFUxTXFDRWZpTEhWTDRFZkhkVzc1SkhRL001Z0hXMjBn?=
 =?utf-8?B?blFHYzl4NC9EK0lsWitOa3RJcWp2THVqd2NXekxrY2I3ckwybXhobmNmWVFG?=
 =?utf-8?B?TWlhREN4cVNGWEZYeWIwblJsZGpmaDFzQ0pOWjZMTkZKbVV1WTZ4aXhxaDd2?=
 =?utf-8?B?UlVvejBLSjFRNWM4OUFWeUFZR2N3cW1ieFdGK3JNQ2xqSkgvaFdMOVA0RUFx?=
 =?utf-8?B?bjNSRjJ2K2MwejRWUTB4TlNmbkhpbnJzc3FrS0hoME1FRlk3SHRaaUhUK1Ry?=
 =?utf-8?B?Nk9DZGNPdnRCQVhjRDRJOFhBMWFUZTNrZklWeGFLOVJ1VjgzN2dMaWRFWE0y?=
 =?utf-8?B?VFlVNkxEeGN3ckRyOVN6cSs0cXQxUE1vNWNnK2x3bG91Vjl6dmRuOStQR3cx?=
 =?utf-8?B?SCtXd1NWbFlmL2VWZ1R1OXFGdm56WUNHVFRVWVBrc2k2ZllBSDdGbm93QW4z?=
 =?utf-8?B?dndOZnBSTW9jY2Q5eGFKb21jL2NMbnlBWDV0TTNmZmI3Wjd5M2k0MWtLWTdi?=
 =?utf-8?B?S3pnNFdING9lMUlXZVc2azZHSy9FbE5RZEZPczNkQW11NE9nT2VJejA3Mi9w?=
 =?utf-8?B?SG1PTFpEeWVoZDNHdDdNZEhCZmxTOWtKQ0NjWnQrZUF0NjI4RUtZSGJRY28v?=
 =?utf-8?B?U1BNMXVDa3VaM2hQRnU4MlA5OXd0dE0yelc3SVMvNXBzck9pVkpTMHE3YXhZ?=
 =?utf-8?B?NUkyc01mNnljQ1FmT2dHWDl5YVppRXQrY05heXBZMUcvRDEvSGtvWVVtaHc1?=
 =?utf-8?B?ZW1Bd1d1b3ZDaHBRNUQ4VGhHNmtYY2xGSEpyZ0N6eXRHRXNvMnYwTk03ZFM5?=
 =?utf-8?B?L09Bd0hqM0xIOEwza2Uwd29xMml4Wm5oYzkzR0pha0ExQmwzTGs5QmUvT0dQ?=
 =?utf-8?B?NHZiZ0RkM2ZCc1QvemRhdGNCT283LzN2VUZjVHZXdi9VaEJIK3Z6c2xNUFpp?=
 =?utf-8?B?bTMyOFA2MUREYTY5cExUTzl2UWZIT2NmVUpiNTBJR0t2N3krZEoycGoxQ0M4?=
 =?utf-8?B?WEtpTU1nSDJxL1NYK2JhalozR3NoUmF3K1YwOTVLSWwxOE1nZ3pCemtzV0VC?=
 =?utf-8?B?dnk5eWtrR0QybEtIcHU0dG5SbDQ1cHFwS3pnTHJQV0VIRTJMa3lud2ZBWlVj?=
 =?utf-8?Q?6njGN2sW6qWeZz3Fab5e?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e37a72-cfa1-4ed5-1748-08daffa37b9b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 13:44:44.7684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjeDrmkbj/zpj8JDuJXyaQUa3ZfcPI9758IN0yorf5hM31/gMFLlY2SQwMyTrr0um61aw/J/7+MLIaXrOHI8dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4980
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_05,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260133
X-Proofpoint-GUID: iufIrmtweFhgunwS0bgTNOWx3OHIY8f2
X-Proofpoint-ORIG-GUID: iufIrmtweFhgunwS0bgTNOWx3OHIY8f2
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

On 26/01/2023 01:18, Ian Rogers wrote:
> This allows the set of generated jevents events and metrics be limited
> to a subset of the model names. Appropriate if trying to minimize the
> binary size where only a set of models are possible.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Thanks for this:

Reviewed-by: John Garry <john.g.garry@oracle.com>

> ---
>   tools/perf/pmu-events/Build      |  3 ++-
>   tools/perf/pmu-events/jevents.py | 14 ++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> index 15b9e8fdbffa..a14de24ecb69 100644
> --- a/tools/perf/pmu-events/Build
> +++ b/tools/perf/pmu-events/Build
> @@ -10,6 +10,7 @@ JEVENTS_PY	=  pmu-events/jevents.py
>   ifeq ($(JEVENTS_ARCH),)
>   JEVENTS_ARCH=$(SRCARCH)
>   endif
> +JEVENTS_MODEL ?= all
>   
>   #
>   # Locate/process JSON files in pmu-events/arch/
> @@ -23,5 +24,5 @@ $(OUTPUT)pmu-events/pmu-events.c: pmu-events/empty-pmu-events.c
>   else
>   $(OUTPUT)pmu-events/pmu-events.c: $(JSON) $(JSON_TEST) $(JEVENTS_PY) pmu-events/metric.py
>   	$(call rule_mkdir)
> -	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) pmu-events/arch $@
> +	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $(JEVENTS_MODEL) pmu-events/arch $@
>   endif
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 627ee817f57f..2bcd07ce609f 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -599,6 +599,8 @@ const struct pmu_events_map pmu_events_map[] = {
>               else:
>                 metric_tblname = 'NULL'
>                 metric_size = '0'
> +            if event_size == '0' and metric_size == '0':
> +              continue
>               cpuid = row[0].replace('\\', '\\\\')
>               _args.output_file.write(f"""{{
>   \t.arch = "{arch}",
> @@ -888,12 +890,24 @@ def main() -> None:
>             action: Callable[[Sequence[str], os.DirEntry], None]) -> None:
>       """Replicate the directory/file walking behavior of C's file tree walk."""
>       for item in os.scandir(path):
> +      if _args.model != 'all' and item.is_dir():
> +        # Check if the model matches one in _args.model.
> +        if len(parents) == _args.model.split(',')[0].count('/'):
> +          # We're testing the correct directory.
> +          item_path = '/'.join(parents) + ('/' if len(parents) > 0 else '') + item.name
> +          if 'test' not in item_path and item_path not in _args.model.split(','):
> +            continue
>         action(parents, item)
>         if item.is_dir():
>           ftw(item.path, parents + [item.name], action)
>   
>     ap = argparse.ArgumentParser()
>     ap.add_argument('arch', help='Architecture name like x86')
> +  ap.add_argument('model', help='''Select a model such as skylake to
> +reduce the code size.  Normally set to "all". For architectures like
> +ARM64 with an implementor/model, the model must include the implementor

mega-nit: /s/ARM64/arm64/

it just makes grepping easier (without -i, of course)

> +such as "arm/cortex-a34".''',
> +                  default='all')
>     ap.add_argument(
>         'starting_dir',
>         type=dir_path,

