Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A066815FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 17:08:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Clh1P5Vz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 03:08:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=vwhnX3l6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YJ+pAm15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=vwhnX3l6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YJ+pAm15;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Ckg4lNnz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 03:07:38 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UATMd9002918;
	Mon, 30 Jan 2023 16:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=aIW33qUqUm39d0nW5sJFq23ExILa3yQIgLOd1kTeKKM=;
 b=vwhnX3l6URaYjBMZ0LeUlThmTGiY27Pc+OpORZqikj8BWy0TbgCsU51F+ccTmx9MIEQg
 YsKsuLFwQHqS/HlZMEHnB46Nkrx9xFs31r4hj7H+bE+9RvBUN+B+eQTS0u502CJfu3s4
 KEGTPp8D2bK2/3WdYPoa9Qn7abQ7nHeqZNM9gj2GpEAmfeVt0gctXfQkhcdfBTnELrGt
 o39lsKJsiw/vTHQhGxTdDYaxr3nl08k1632lrZX2BmOQEN03iYVMry+2FJkJTKqt8zbh
 wXnfzhovxe5qSGhd400y7k+XCV+PQQkvdvHpxSkdAG0ITgt+7caBE53vWQdIbYwI2kvB kg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ncvq9k9hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 16:07:14 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30UFD7nW037301;
	Mon, 30 Jan 2023 16:07:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5b2qgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 16:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJkZukGADFaMPHxkZcrZ0RGTnbq1Lqrnh2y79pWwlOky3ScBB+Q10qEYv5HIk1cCQxxhBnItM4QOA/+W1ZoRxpventCcwVfhBTgLGjS04u+CvSM6XNwQi+uHH/2kizL2EAF+vsRrj4IOVXaAeEL/Jq8HK1qLQhE6/QPW9g6xxvYx/4k+j1z21aTqR7Rx1oaBbkYu5mn46Gw4NPTy+nIejQBz4hkGRnMGTA4EjFVf34/4IsbKDWACL+jqx83WYgssP045UbOK74EIxMgB4G30ep91dKwZCFwuTAH/gvDnqktSqEsHTdUmq5tIC2gui7G/vXOc755P6mIp+m3nxliOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIW33qUqUm39d0nW5sJFq23ExILa3yQIgLOd1kTeKKM=;
 b=SQuokaEA872VkI2ksj8HAahFx/3PhCInSU7eDVre3W519qF1TjAVQP6R8TYIVN9rP+foCmX3Q7v9InEefAjJwcS+3cH/aS63EOefS+407EMSclH6DBLz2iSTE6/7lLXILAEL33Uhvs/jfaNjiLgQJPGlJ/5AwpD0zaP9W4Aeo9MrtAsu/TK6xHLjPO6L4I+gKIjmVF8zP/zlcuvGAxW4RkfrfpTo5WJULAFXDNFI7NJg755/0+eLZBOpmihvMptmCzmd0e57XiAtLmtsQ73DR0te5Shryk/2gyRvz2mNRj7yQ7I1SOUFxgG8n3JnZ1eAbtI5awP/OApdMrwQIsQPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIW33qUqUm39d0nW5sJFq23ExILa3yQIgLOd1kTeKKM=;
 b=YJ+pAm15zfzacqJzg9w22AhdwYL+oF2vL2iHL1eqs8u/NvJ2jcELFeyPj2IDWIE+utexXEitQDzwVyDCCTicSwDhZZFxV8chML9hTdl2FRhFr92pxoiZh4z6QkY7mOTNTp2TWA8EJqwYanBQcTK87baT+PIgi2RL4EbE6Mqbkwk=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SJ2PR10MB6963.namprd10.prod.outlook.com (2603:10b6:a03:4cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.21; Mon, 30 Jan
 2023 16:07:10 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%7]) with mapi id 15.20.6064.017; Mon, 30 Jan 2023
 16:07:09 +0000
Message-ID: <8f53bb96-8213-12f1-f91c-7fb311e4c9a4@oracle.com>
Date: Mon, 30 Jan 2023 16:07:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/15] perf jevents: Generate metrics and events as
 separate tables
Content-Language: en-US
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
References: <20230126233645.200509-1-irogers@google.com>
 <20230126233645.200509-11-irogers@google.com>
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126233645.200509-11-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SJ2PR10MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: b8afb509-0737-4aca-3e8c-08db02dc0a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QqaDuTi1qadRdwJSN8x2GRvCjj7q9RNvru/rbmRQXFq9/64OiyYj4bzKUqqmVnxiLaNy/Px+2/ViOjnjKYb2k0CVKck+HUBoOFnYtQHpwT3AKOzPTnKQ3LjnVZSbJz1XaSRAglLxayVAzPV225T+ncRBkGKEqAhH22UFg3ya//e80qB6YEyq/kcDJLFTOBSErQnhtUtlrhrmbwPZNXJZXKzkyBYW4ySGejd3hysNy0pkHTACjtqz/ZtDy/A8HGBoqDbn0+FSF9EGqJh60Nw6WvywfxUZC2gozMPEHPPnMVHVa6JQQVJmLQPEKiCp7yKkDLKb3hEd/u2DvH0uSq6Ad/z2o0tgYgfPkus3YGZkdPJlg5UzlzJ4KDg39NSff6T1oggqUCzWWRFGdaTtZkiKUARLxngs5MjJ5HD5a9DyAOOIF9GmuC4veZ7lr5gF7T0EJrtWHPqSxEYaF8eQUEZQ6vukOdtgMkFo1cln+qphA0AWBiaap3uPG+7S97iuQVRrA89PGwhWGXVcecXovt9u95R5OW/QUENnJKGDprI3IojYi2QZ/pxCiD4UWzjcTy2qrG0D4PegyZkziXOsbDVkpLF93c0ctg+LOAsMg8MxCStDZskIRd7fnDeipSjXJJkwYOeGkf8gf1d2hxd4k3q3WtBTuT9+viQTTrgfIG/xMIuoLiX+JaiULA/P1VWdayhIXQ1hjiDHZUkXuoQ8BqGK7YeVw1/RfJgEkrAfv/dLPwNjvwXJfiVmFPzM2rYPhg7q
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199018)(5660300002)(7406005)(7416002)(41300700001)(2906002)(54906003)(66476007)(66556008)(8676002)(110136005)(66946007)(316002)(4326008)(36916002)(478600001)(6486002)(6666004)(53546011)(6506007)(26005)(186003)(6512007)(2616005)(8936002)(31686004)(31696002)(86362001)(38100700002)(36756003)(921005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TDRqRlZ0SlU2eXY4LzN1NFNGWFlmcHFXc1ZYK2RPcThZbjhaZ2Q0L3g2UExE?=
 =?utf-8?B?R0lmVk1KNldKUlN3UXpmVUEwZ2dxdUVtYzJzaG1yZHI4UjU3ZnEyUmdicTB0?=
 =?utf-8?B?bUxQaFpJb2V5enI3QkJIZUhNTXQrU1VFSFgwK1Z6a0tLRWIyMEUvY1Jqa3g4?=
 =?utf-8?B?UnNIaGF0TzhoWVlDSUJjUDdVc3pBaVRGdnFWdkVaalBsbHdma0ZqN2tJWG56?=
 =?utf-8?B?bU02TXdsczA1Qnc4K1oydjczd2RkWC9LeXBzdmFQOEdoV0NjNWNkMkI0eWpn?=
 =?utf-8?B?Z1NaMTMvY1hhTVRscHA5TjY4b3BkTCt3M1RES1R5aUZoYlplTEErMG5TVXVK?=
 =?utf-8?B?Ky9CNFh2ZmV2Yi9id2VSRW13UmNSd0NZM0VqSDBPYlBxNEM0R0xDUnlBZjU1?=
 =?utf-8?B?cXVyWm5adHNucDdtbm9KSzRvMURWZFBncHZUZ2NCNmxyUHhhZlZIdks2ektj?=
 =?utf-8?B?QXZwVFJtK1N0NElUb1hwblpJdXRGbnBqUzlSYk9uZUNvYkxMbFpaSHVqYjF1?=
 =?utf-8?B?VGpCSkhicGJkYlV6UHhzZWtQdk1VVFA1MlhkWVkxU21hRjYwN2ZHaktUaUFH?=
 =?utf-8?B?b1FKWFYzVE1haWJwYmV5MkltZ3hsbTN5R2VaNWNuV2JoSytaeEhUODVNMHBi?=
 =?utf-8?B?QS9sRU1wMlJWaVQ2RCtaSHJaa2p1RVdDWElmam9JV0lKeGhVS0VDZTMwNnZj?=
 =?utf-8?B?TE90azl1cUtwMXFSdk5uUHNGZGtONkY3dUN4d1hlaS9JZmtPYVc0dXkyQzVm?=
 =?utf-8?B?MnJkbGZYaHd4SU1CaXpnN2ZVb3BUdE5GZzVXTk0vTTd4TWpZZkx1dm9DTGdy?=
 =?utf-8?B?V1hpNDJwOXJWVVBnc3liY3k4RkcxRFZXRkh6Y3drTmxhdUNYRWVIcENyck9o?=
 =?utf-8?B?dVE4Wis0S1QyOVQ2T0J4NmRBbkQ1U0FLN2pJenZCeE5lRTFraERmZENnNUZp?=
 =?utf-8?B?N1dCU0FVdGl0Z1RPWThrU2JnaHZsVlo4L25FeFBpSzFuQ1E2SGpJNWorM1cz?=
 =?utf-8?B?MWc1YVljNXU2YTIyQytYc3ZzTXZBQWZxMDY5NGE4bHgzelJXTFJpNmFPYnJE?=
 =?utf-8?B?cC95OXA1Y2xPb1d6eEtrZm8yQUhxczE0eU0vTzkwc1AvVDNKNUhtQ0VGNnNv?=
 =?utf-8?B?dWJBWjFPd2pVWFl0aUM2OTc3MjFwQk4xVVF0dWVKNHVnNXIzbFpxQjQybHZl?=
 =?utf-8?B?Qnk0bWZ4aUdyZ2dFM082U2RsV0ZmdzFZeGNqNUNyZmxSUkV5U3hRZ1NybzRC?=
 =?utf-8?B?TW43bk1mM0xiUjRhajN6VkxSMk9kZTJ0VWJGSXN3RmhZVC8vZiszZWx6dDJN?=
 =?utf-8?B?ZmtRWHordHoxNDN0cXNiNVl5NU9KaEx0TTdqb2lyRHUrZjV4WXpUc2Nob1Fh?=
 =?utf-8?B?LzFTYlpGMnlZZnU1M21vbnRtb1FQdmx4R1hPOUV4eDA5eFpMMlppS3RCOWdu?=
 =?utf-8?B?WlFub0psNUR3NGJJRld2TDg0VWxuYXdjemd4MWpGbkNBeEpwZkZmMkdzOC9R?=
 =?utf-8?B?dlBadUc0emZ5Rk1uWGs0TURXTitBSlRHWThXamR5aUlBNUx2WmxRZm1YTFc2?=
 =?utf-8?B?TDU1d1o5cUh1QklldGUwU1F4TzZHQWdOYlFRR3pQbmVOMnQ3QVFGSGFQd2VZ?=
 =?utf-8?B?SHdEcEdaVnJmY0g3Vnh5aDBkcXBEOVpIUWloNmplQ1p6R2wxSXA2dVdaZUZt?=
 =?utf-8?B?NUxIWjNuazIxS2RQYmJpcHZXZitnWDNiR3kzNDNsRXFJRlFIVDBSR2tMaXA3?=
 =?utf-8?B?QVh1SkN3UGV1NXhraER0MVNLdkxQNUZ6WDdtUDFNVTZteDlZY1hHUjhjbHFM?=
 =?utf-8?B?OUdaR2xhWXNKbnhUNE9maG52YW1mL1BseE9UTWd1K2dmL1Fpb0ZYWVpySWtr?=
 =?utf-8?B?YmRCYWRCNklQWXl6dmtzSTN5c2NQenZsTFRlSHgwSXFzeHlVU0QyU0VRbncv?=
 =?utf-8?B?SHcraFRyRkpXZm5na0thcEpVVkRURkROdEFqZjB2NGVnMDF1ZFk3YW1xRTk2?=
 =?utf-8?B?Y2NCN05VZFV2aWRJSWlxTWZicDRSdGQxUnFVbWpLc0w0b3VYTFdDdVg0eUdy?=
 =?utf-8?B?U3ArT3JscEx2SWIyNUVBNC9jMld2UC9YdW5ia1NJK2JiRk1Db2toWnB1REtt?=
 =?utf-8?B?MDk0TzVnY2t1cURFUzZBTnlRNnJGNEx4WTRZamJQUnB0M0MvVGpkUmt2WEpn?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?OHVIQ1JNRTlpREltV0ErMFpjbThDeHpSZ0pXWklqdzA4L0t2THBiZitEWmJG?=
 =?utf-8?B?dksrbUhKZHhxSHlOZzY3ckg4eXprUkd4SVNNbUVVTmNjUTFpTjBoNVViUnNp?=
 =?utf-8?B?M3dxQ24wcGxsU241d0dES1QxaW5XUWIzYVpWK2h2UzkwalZVdDRmWjhhMHh2?=
 =?utf-8?B?N3JIT1dtd3lHaDdjYkhRcWxqMFpXVHRZTDlwVVVtMm1LeEljdlUrdFdBZGpz?=
 =?utf-8?B?VlBmcWdHNGZYT2NyYUl3U0duRmhlZC9ZbnlndUNxSGtQVGdrZzFzU1FhUkNW?=
 =?utf-8?B?Um9OWEpGVjhYTk53TDVNWlZmS0MzZE5KbHF2dlRNU3dSbkxZS21rbHVDYVY2?=
 =?utf-8?B?eFhlUVhQeGFpWmNBd0gxcVpuaFQyNUtRMXl1RzE0cGJ6YnhRT05YdXJsY2lr?=
 =?utf-8?B?cW91N2dLclBqWEluTVlRM2QxSW83dHFSTC95OU9CRDJyTlJwZnE3MDd0RVd0?=
 =?utf-8?B?bk1pMlh4K0dtQnFWOCtGT1pIVjhCQ2svV3FFZ3RzRXRzdDRPV1UwUmVqZkdN?=
 =?utf-8?B?TXB6c1dIZ3VrNXpNTjVDRHJ5MXMwNjViVDZoMmVhU3c5T1YreHRUait4S3BX?=
 =?utf-8?B?bTlZL2t6RnhhTUlHdVVVQXkveG5ham9mdXhHVWhtUms2RStycFgrM1ZNN1FQ?=
 =?utf-8?B?ZVkwVDZwVkE3dXBFOFQzTys4ZFp2MnlDNkhVaVJ6UFM1UHhEbDFnOWEzMmFC?=
 =?utf-8?B?WVdGZ0R0Rlhqc1MwOGg3dTV6QktIb1NWL3pLZ0JpaUd0ODJFOTlGT09qeUZm?=
 =?utf-8?B?aHhPRERvOUpzSWh5dkFMaU5oS1F0R3B4ZTRTR0JHUW56dUFqdXdhaDl3MDBS?=
 =?utf-8?B?dVZVcDh2K3E5aVlHZTVXdDJhb3o2UzhIdFd3VXc5ZFFSRTVaL0dvUlBYVGF1?=
 =?utf-8?B?SzZvSExMU1Y3TExZZ3gwdm4xVlJaVEl2QjBNY0FYUjNFbW9TNU8rRHdneERl?=
 =?utf-8?B?aHM1MFlXaHpQWmg2VXgrNno4ZjdzN0QvSFV4eFMyVnNHWkRTOGlxRktTb21o?=
 =?utf-8?B?K0MzaFd1bHBhQVNQOTVlZlJnNHNHeGFML2RqcWhuUUlJWFNGTFJOVnhxOEpZ?=
 =?utf-8?B?ZUU1dUtpdm5rcnIwSE5kb28va3Q2VWVRaEkxTlB2M3pzSUhkbDY2MHVxK0Jo?=
 =?utf-8?B?bW1pZFh3OEswMjIyOVNhNnY0NVhJa2QwQm85RCtSOUVCa2Y1dlh2YTBWaXQy?=
 =?utf-8?B?Q2dxclJwQVkrUk5EdnF4NlltOHQycWcxODQxbTY3bk42N0hiMG95NEtOWHRD?=
 =?utf-8?B?VlNBSmk3YU5idlJ6VWRmcjc0MHF0WGJSS2xxRzY3enhocnZiYTMzQXU4Wllh?=
 =?utf-8?B?QTd3dDFiaDNaakJibEdVOTl0bWZ2UEF0bGlFMm9qWmNKNUxIOWFzWFFYNUlZ?=
 =?utf-8?B?Y1hxM2hwQ0lEVlplUUhqV2txZEZzbno5eFo1WkQrVHdBdDBaUTR5TUdCOVBD?=
 =?utf-8?B?dXQwWWFWVGcybmxJN05PZlg4eHExdTkva0tEY0QrOTRTbWZFRGZ0dDFnSWxz?=
 =?utf-8?B?bHVuVmI3Qm1neFBPZ1VOU2VDTE9KcFN4VE9aNHBRdjdnRFJDU2ZubC9mNm96?=
 =?utf-8?B?ODM3cWU0TU5wVUhQaEo0UzAxclRvdEhNSks1TG1xUU5BNmczY2hLTmdobzQ1?=
 =?utf-8?B?blZld2t2MTN3SWpheTZkZmxEdUtBNWl5MVVHREVscXJrd2JwTi96YjZSNkhW?=
 =?utf-8?Q?yxZbsOyGXEF1R/64llOh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8afb509-0737-4aca-3e8c-08db02dc0a67
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:07:09.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/elZhv+qGI3rl7xkYBk6tsFUxwBsAtFwAC7geJzaxaDirh7Gnv34NtO1gdmHoD4L2YOaQ24OJOAGHCk/iA0Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6963
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_15,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300156
X-Proofpoint-ORIG-GUID: 643qEshZa01PC0qxTuQ55oAntMiwXRiz
X-Proofpoint-GUID: 643qEshZa01PC0qxTuQ55oAntMiwXRiz
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

On 26/01/2023 23:36, Ian Rogers wrote:
> @@ -660,7 +763,29 @@ const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
>   
>   const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pmu)
>   {
> -        return (struct pmu_metrics_table *)perf_pmu__find_events_table(pmu);
> +        const struct pmu_metrics_table *table = NULL;
> +        char *cpuid = perf_pmu__getcpuid(pmu);
> +        int i;
> +
> +        /* on some platforms which uses cpus map, cpuid can be NULL for
> +         * PMUs other than CORE PMUs.
> +         */
> +        if (!cpuid)
> +                return NULL;
> +
> +        i = 0;
> +        for (;;) {
> +                const struct pmu_events_map *map = &pmu_events_map[i++];
> +                if (!map->arch)
> +                        break;
> +
> +                if (!strcmp_cpuid_str(map->cpuid, cpuid)) {
> +                        table = &map->metric_table;
> +                        break;
> +                }
> +        }
> +        free(cpuid);
> +        return table;
>   }

This is almost identical to generated perf_pmu__find_events_table(), 
except we return a pmu_metrics_table * (instead of a pmu_events_table *) 
and also return the metric table member (instead of event table). But 
the definitions are:

/* Struct used to make the PMU event table implementation opaque to 
callers. */
struct pmu_events_table {
         const struct compact_pmu_event *entries;
         size_t length;
};

/* Struct used to make the PMU metric table implementation opaque to 
callers. */
struct pmu_metrics_table {
         const struct compact_pmu_event *entries;
         size_t length;
};

Those structs are defined to be the same thing, so I am failing to see 
the point in a) separate structure types b) why so much duplication

As for b), I know that they are generated and the python code may be 
simpler this way (is it?), but still...

Thanks,
John
