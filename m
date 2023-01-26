Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205A67D0CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2lnM6mX5z3fDh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:01:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=dgbqcRv7;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VrAt+SzL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=dgbqcRv7;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VrAt+SzL;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2lm82vHcz3fGd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:00:22 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QEjWrH007828;
	Thu, 26 Jan 2023 15:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tyBVSiFvnLW2ImCutYC/8xsv5zR5dDkKb2/Y0U6Y07w=;
 b=dgbqcRv7K1ahRXUqtpxjnXwDR1B5qjtRHvcfRDd1fFqg+wjGKFKnPBSgZ/ZebS9Gq7PP
 RUDGdv8kADOLvd2IKhByf57CxKzCE8gW30wPkQ9GgLsl2V8xKeH24V4Uyj0YZzbI9jYz
 qhyD44VPr8Q9LTLdk9iJwdJFxeElEXkZox6bTaLBoPYP2fKC2CueYqRkJIZMhYn5fne9
 mTBSsCjceJ3lU51rcnReVj95xtE/Dzn9XfOOCS6VpuJVeiqBFSI6LXNMUvdZ56LdUza3
 fTLG401KeK41oKrn8rc8+0F/J4xtTWl8e4TpeRIVgqg3MQ5Lo1PeWI+Vojnc6k607kzY BQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86ybjmeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 15:59:52 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30QFiZGa006703;
	Thu, 26 Jan 2023 15:59:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g80w2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 15:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEs4wJB4ILQ9V0wVw5bz4aYO+jcUTNoOJkVr2NtLKGErs8dmcRwDNaKxPW56jfZq2+l4rImPbwu4iWVVm9MOOpaLjeG/H3p9kkeo9ryt98ccRgaB60nwTpg/cmsrex+EH9qSj8QsWccvveRrZYa2dualQIb50AJFWp4mypAR5Id83vAVJgxMHnMVstGpVK/gwPnbi472SN4otFx/voby3SVhcqzC3uWnEKgZ6PWJncjI8zsm0bmIAqAeH5yoocQwQarHhGLtyr+b/K/vxIQ/eBXwlCcWWnDeNFqWDb1wj7GgiZU5/4d15hNgkd6NM5rzFPYp9RfUt4Ubyrb2WmAACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyBVSiFvnLW2ImCutYC/8xsv5zR5dDkKb2/Y0U6Y07w=;
 b=NtLtzNQZcyC4b/Et4YMbq5kj3Ti4uyoPqC0X1Jg88Ulrp6EZJ8fIAKE4eMrUtaeL9YGHp/47qujJdIoDxBdeUbw7dPubuL6BgQqiIl3AnBfAxOs4UnKFU5BYz8jVgtitjRqXZAwEyMXt9XzDnQIlELQss+6zEihB8PLkPcjaLaTFsloN9tFh/IUOXhfsilyKcCLjKz84bQvej0IpX2I45U7qdWKO8MdKF6kGjn79MtbgmmpOOX45RVyk8D6y3fNIy1o/cQVOfmyBqfJdTQjJ3q8BPWdSXOXSS4gLIThksgwmt/byL/Cum8+vzCe9hVnIe7+4yW1ibcYaY/oH0abl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyBVSiFvnLW2ImCutYC/8xsv5zR5dDkKb2/Y0U6Y07w=;
 b=VrAt+SzLlq2ul1ggl2kandnzR3jW5W2pnIVJY6f2MKAw8PBlpQIq4up2pwxNk9jFMqFdN4bdoSH73dqdUnnqCD62vh8GIh80wpeX+EzN1odLwn3tpB8KZKluHO0z8/L/ptmSXbdujqMdNJKc125qQ6LHPkHwXRTK4a67kCWHoN0=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by BN0PR10MB5078.namprd10.prod.outlook.com (2603:10b6:408:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 15:59:49 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::1040:f0e3:c129:cff%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 15:59:49 +0000
Message-ID: <e74b8293-5d30-7522-6e5e-a7c7994039c5@oracle.com>
Date: Thu, 26 Jan 2023 15:59:42 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/12] perf jevents metric: Add ability to rewrite
 metrics in terms of others
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
 <20230126011854.198243-3-irogers@google.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230126011854.198243-3-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::16) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|BN0PR10MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a81476-2651-4439-8ed2-08daffb65a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CIDpxzwHx49mFMTWtl0y3ODu3NjKHP1a5WviR+UZP3xd9aK37HweECaqm07Bxbrb4DKDqQ50x84NYGfQzuV4Ad6EXVUxa8amv1/0tNsx+YNNva5v+G0SNfWTawnt1yk1//HHP41bD5nysrsh58Onle++RPQd4P0daLvVSBiBy4ux02X9hfd0yWtLnGDxDtCyCpC7+IIr3qokFtKaqEWgvhM/RRkpi+KPujkgCf68KQiJmQA+aJYoNa18cH1qbLIesoJb8gx++38Kr0VsbNStQrpPYa5L/dgG4Hk/BgTCOiZCgYIA/f3xXS8ugotgDUxZ6qPbP52eVCsxDTV0nQ/ND3Cx3bcsArfjmYkJTef06jtKGnVFDW1j2DPFPfABWN7o4xB/Ac4OY2qkVBwuKx7vVOSRQLtB3ZJH9NAgzsi1EGnaRNzb5Vbzsj1W9N5y4VQMEZfgfcAnAR8c72x26riGEjJeXS2FnEghf5Hm/+SwNck5lJZcK6emDQLtRk/J271Z1eWRFeDUtbzVUbzmBKn9spKrW/R8rW6AaOLxtskbYGkFCCXQQvUd4Fg6bY+hynLT/NGx38A/gVOKxRIHmhvzYJ80RzEFfQ2eIJP0Q3MAMepLXrdKafCAODgAzWb0q3TMGSxDktAscWQhk22Vrdcap4BEXvRTMp2n49LJPEPhw0V1gPY7ab9pxkGR2tpoVYnMx3xcmg3rnxhNQvvxv8E3xKapDxzqmxzpVihpgjmFpxA8mk/UJeUNuzKSe22U+5jn
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199018)(2616005)(6512007)(26005)(186003)(53546011)(36756003)(921005)(38100700002)(66946007)(31696002)(66476007)(66556008)(86362001)(4326008)(8676002)(316002)(4744005)(41300700001)(7406005)(7416002)(5660300002)(8936002)(2906002)(478600001)(36916002)(6486002)(31686004)(6666004)(110136005)(54906003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QXFkeU1JdHhwZ0tDYThKRDNORkNkQ2pGL0YrUk5YU01FbEgwOE91VlVxMlRW?=
 =?utf-8?B?YzkwMTdjQUlsYlBibkdLMEVLc243cUZMd2hia0psSDVTRjRsQUFKWGUrRDVL?=
 =?utf-8?B?aG9YeDZjNU10bnJRMit6dzRnOVZrUU9ycWxQL0ZNd0V2N29WWmQxNDZYVFJ6?=
 =?utf-8?B?R0MrSEo2azFaeFRPNGJRZnEwdVJRTUl0dnFKQTVxWHdGTlBBWjJOZEx1aXF3?=
 =?utf-8?B?TEFoNEwzVjBDcjBPZkc2WXZrbVpCNFlzem1qQXJ5WU1NUE5hLzQrNm50NUFv?=
 =?utf-8?B?bHFFd3p4TlVOZDZDWmZoQmJ4VWVDRzRMTjRvNG4rN2JrcitHY3hUUHNlbGhq?=
 =?utf-8?B?dVVVWUM1cHh0ZXM4WEtCcFJuSVZQWGQ3V3ZSZG5GL21nOGFsRnFqRmxTbGJj?=
 =?utf-8?B?YzV4WmJCK1dGcVVUZlp1eHM2eXc5YlpTU3lGQVVIaHBqZFh3by9UTmVObGk1?=
 =?utf-8?B?ZytkenkvQVVWUkRmbnlOd1ErOU9IUXNhZmJLNEF4QlBCVzNXWlFncDFFTzlF?=
 =?utf-8?B?bFlsM1FwY1d1R2swL2pzcG1WOGNSOU5MdlBUUEFLbFFrNWg2QzlkVHVGNjBa?=
 =?utf-8?B?OUdwQjhDNGFtRkhBZzVqOU96aGxtZ3E1ajVhUFcwZE5PVXVmUnJtMzhWVmU4?=
 =?utf-8?B?ZEtNZmU5eENwS1BKU09FSi9YVzNnczRYZ3BoQ1FoTGhpSU4yRzhwWit5WUxL?=
 =?utf-8?B?N1BGVDgvMHJ2NDhsZnpkbktFSTF0VmsyV3duMWo2eUdtdGhNRXlpcHllbU41?=
 =?utf-8?B?Y1Z3NFBJSXpNVzBMejgyVlZMdllXZEU2TGdLQmRMZS91Wk5KOFUzNEM4aG4v?=
 =?utf-8?B?L2NWalJLQ3gxbVhwbVJHUlBmUmNLTjRoV0g0aWJrN0szTHRnTVJCTVlJb0pi?=
 =?utf-8?B?MXE1UEJZUkJGZjNpS3BmakJCYmhma1BwQmppcmdWTkthckZwVW1Kd29ZM01v?=
 =?utf-8?B?OTFEOVQ1c1U3Yk9QeXJmVVdpMlRaL2pjTGhnVUVFMVN5a2FXMUY2OWlLaWFs?=
 =?utf-8?B?cWtxbTd1eXM4S2VCaW1KQ0hwVnllekJkajBxSys2WXlKL0lENk5TcDZHeG1N?=
 =?utf-8?B?c3hzU25Ta0JpNGtYRDBSNldWMGl3WFQ5U29nc3o0R2k3YlhrcW9rM2dGckZO?=
 =?utf-8?B?UHluRXdZU0Zta2RjWWZ2cEhTWmJrWjZxeEhVMEM2T24xRStlYUljU2laRHV6?=
 =?utf-8?B?UVQ0Yk02VGVHR0pKOGg2K2tMeFBCK2NsUXNuc2t1UGkxNWtTbzR0SWhZOUxN?=
 =?utf-8?B?YlFGcVJscU9PeHNaUFlQQXdUVWd4TXJQc3FTbSt6LzgrK1JEMDlaSkVkYUxC?=
 =?utf-8?B?dTc2YXordmRVRm5ZcTlVNjJrZlFKb09SdTdKN3o5RGJJb3VqWXpVM2xIVkQ2?=
 =?utf-8?B?bGxRcFZ0dE42YjNpM0wrY3FxaTFaRHJlTG1HTFB4L2puR3Z4bzJGVFZ2NmdJ?=
 =?utf-8?B?RWIxS0MzTE1PR09ZeWZrMmgyVnhSVzhkNHBFVU1WL1JYQ3l4R0ROWkpEaExF?=
 =?utf-8?B?Zy9tRWl6T290UmMrRUg0Z3dUQ0Q4OXZjMG5IVjVaNGQ1d3laL0ZONEFMN0Rk?=
 =?utf-8?B?Z3pRanRzdTVqZzcxaGdkVWYvektQT1V6Y3pjYXp5Q0tSRDdoeitpcTUvU1Jy?=
 =?utf-8?B?c056alE4REZsNFlpamp4UHNueWJEb1B5REZuR0IyZDNjbDdnKytTcmg5aGdB?=
 =?utf-8?B?MkI2OTU4MGk1Ym9jengxODM2RVhDeVFHUnBJMlNkb0lOTVVmNVN2MXoxQzVt?=
 =?utf-8?B?M1dxZUNoaldkOGVja0o3aW1vOXN6UmkyNXlDZU5JdjBLdzVtMUUxUGVoT2pI?=
 =?utf-8?B?QWgvV2ZwcjMzVDFVM2lPUnczN3p5WGxPT1lCVUxkekJGTmhBWXZzdFp5QUsx?=
 =?utf-8?B?L3UrY1U3Y1pLSnNNY1JRM0lUbXQyNkhOcDdwb0JmNnUrd0pjNFFPaVVvdW9E?=
 =?utf-8?B?R2NXVVg2cnBOazVPQkUzUXY4T0U4MVAvNStTaXE2OVdCZnVzNGRpRlphUldS?=
 =?utf-8?B?dm16WkNjRmlsZHJOVU9TTUI0TmdLcUZrSFFqaUcrSkpMamE3RUJIbTgyZVZM?=
 =?utf-8?B?aEYrcjlRQm5RWFVYT2pXdjgyM29HOHdWQUpGMzdnUjRWREt4aFJKK1FKRVo1?=
 =?utf-8?B?SGVvSTYwZEFnT29EY0xpTHBjczBOemtaYVpmb0lBb2NIc3J4ckxEM3FTMUdh?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?eURPRjhyMytGMHlpYUU1S0NGaExwcTdqa04zd1FYRmVheHJHT3VrRTkxbm9x?=
 =?utf-8?B?dkY0V2x0aDFoZkxSM1AwMFhOdU9nOFNZbkplL05CQVBud2dYL2wvb3ZteEZF?=
 =?utf-8?B?eDZVVVNGOUpwR0ljVHVHemZqaXZyT0J2UFJPalV3Tk5FbkMzd3pwS0YzSlVF?=
 =?utf-8?B?aTBWR1RSTWJhWHpYYXdZQWdRRnhpT1haOS9pdHBkR0twdUdYekU5RzRIVml3?=
 =?utf-8?B?aW1ScEVCWTRBZzM5M3ZtYmRBWVRzVVY0VWtybDFleFljRDN5T2lMYkVPQ05t?=
 =?utf-8?B?WTVIN1hrQXlKa3hNbVEzNXltWGhzcEtsa0h0cVRmV2JEL3RQMVN6anJTOWhU?=
 =?utf-8?B?aFBmS3J2bXJuZGNRZVFyTFJ1WU5vUUxpSlhhTTI1Qk5xTHB2ZXNxcHJuUCtt?=
 =?utf-8?B?dE1wV2RnbGVTK2pUK2R2ZGs2ejNhVHBWNjU5bk1VR1BlbXFGSnFhNDhYbnZH?=
 =?utf-8?B?VVE4WjlLMVdhcWtJMWdvVUI5T1lmL1dkUnA5UThqQWxhdjliYVJ1QlNWakll?=
 =?utf-8?B?aHEvU0NYdDJtWEdPbmdraEJHSjlVa3dQMHo1dWxiUkQ0WUZXcSthd0NSWDlK?=
 =?utf-8?B?cUZjV21wN1ZPZHltRzBZVnc3V21kUHl2eDBtK2hPWHZ2VG9IUWxPYUtGU1lM?=
 =?utf-8?B?WFBieXhONlZLdUZxM3U4UWZVd29vWTE1OGNjcjVpK01NTVhFVHBQdzlCL0Nl?=
 =?utf-8?B?cmFFeFZkVEdTYTRYZlNOanZBREkwVGZIYnNjL3QxTDBHNitPWFMvUnpsRzBL?=
 =?utf-8?B?dFZaaWswMm1DQTJwQjdubzF2ZkJsWWhCUm91NmJSMWNybTB1K0hiaXNVa2xG?=
 =?utf-8?B?a2ZpcWRWNVB3U2VlblFha1lzQTJ2UWczUzBLTWxlUml5anA0b1RmNUs4U2Qy?=
 =?utf-8?B?aDg5OHEzUWRTK3MzNmIrTFJJZ1Q1OGdaU0NvN2hHZ252cWlyRUVKVEIyNU5u?=
 =?utf-8?B?OXFnSUtKcjU1M1BiZC9WOHY1cG5EZis5bE54Y2N4b2VRUFpFNkkxZkpzNVVu?=
 =?utf-8?B?K3VVcDA0UzBGaU9OZ0tyTXduZ3p6b3hnOEJoVndxUWRtYTcrclNLdk1qOXJE?=
 =?utf-8?B?SUZOc3B4eVIza1VPVWxTTHN4TEVEUksxNlUrRnFBRVpHWUNFYUR3ZXRnRTNo?=
 =?utf-8?B?NHdxdTZqc1loR0hNUlZXZzVMYTBtQ2tKNDBUSzZqZUpucGtJanBQMWlEdERC?=
 =?utf-8?B?NHBnRlNPKzl6QkFlMjdlM0dzTTN1Uno1Y0lranlTUEt2SDVRMUE0d1JCZ090?=
 =?utf-8?B?UmpMdGJ1Um8zczY3c3h0Ris2cmVWOVRaTDFxenhPTXd4WFh2YVJaMFVDMS9u?=
 =?utf-8?B?Um5yVkZyL01RSFdpUUlYeEErbEZvSnVkalVQUVBoQVV5SDBweVVhNlh1Snlx?=
 =?utf-8?B?allWbnBqTkJMVTdaTlJJVTkzZDFxVllNMFN4aTRPdXRZeStCTEJjeTU1UVow?=
 =?utf-8?B?MFNwWTZVT25WdXhhc2V6cXh5aDhDTkQ1SGNiUVdldmJVcWVocW5rdVFrSmg3?=
 =?utf-8?B?ZC9QNDJGQkptbXAwckRlZjNycFNtcFV0Sm96ZHV2WTcyUFR0alNFUmRxbXlv?=
 =?utf-8?B?OVBHVEF5VWUva3gvMlEyVEN1bkVlNmlPY1NzNUJrelMwQmJPNlkzZ2EwL2pD?=
 =?utf-8?B?Q0pGbmhjTExtaVAxRnhaRFYweVNOYzJjSmFWcnAzTGlrVWhabDYxeU96K2ll?=
 =?utf-8?Q?ljsYWGvXh7J1nPkHnrci?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a81476-2651-4439-8ed2-08daffb65a4e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 15:59:49.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFUfJ1/QOIjGHL/0hgnDOp5DnBgIoIb4prXXdwAs8fhF46WgDb2lCei2TquyBflaEaXspzyZE6t8qFkieclonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_07,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260155
X-Proofpoint-GUID: eNahiire3ZBkPhX2y0wW1piG8UkUcaBy
X-Proofpoint-ORIG-GUID: eNahiire3ZBkPhX2y0wW1piG8UkUcaBy
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
> Add RewriteMetricsInTermsOfOthers that iterates over pairs of names
> and expressions trying to replace an expression, within the current
> expression, with its name.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

hmmm ... did you test this for many python versions?

Maybe this patch causes this error:

Traceback (most recent call last):
  File "pmu-events/jevents.py", line 7, in <module>
    import metric
  File "/home/john/acme/tools/perf/pmu-events/metric.py", line 549, in 
<module>
    def RewriteMetricsInTermsOfOthers(metrics: list[Tuple[str, Expression]]
TypeError: 'type' object is not subscriptable
make[3]: *** [pmu-events/Build:26: pmu-events/pmu-events.c] Error 1
make[2]: *** [Makefile.perf:676: pmu-events/pmu-events-in.o] Error 2
make[2]: *** Waiting for unfinished jobs....

I have python 3.6.15

Thanks,
John


