Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42D6814E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 16:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Bm53c8sz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 02:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=SLQvkHST;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=R9jEbQ4Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=john.g.garry@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=SLQvkHST;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=R9jEbQ4Q;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Bl62yKWz3bfj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 02:22:56 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UASxVd001074;
	Mon, 30 Jan 2023 15:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gCXnxHeMBmrxc2gB9gfXee/1ulQwGglMjV2TymW/kk4=;
 b=SLQvkHSTlTuU4DPJqNU1g2+OHdwj3pR18/EEQ8SN6HYk+cuIiiorard2gnsvwExp6+PC
 41fzHM9bKwIRyQijsJtCY8cJWkSUGKQBzz791Slt6+1EaOEj3X5OCkFMXt+l74onPHTd
 zTTbUqqA9e1Blhf497zSX4UvOnbJW9xLMa+9oxZobde1LPegB4qAjtAr6RtzbpOgeV89
 J329PtFLSrtPQztL18AXrtS0txr5V20bmrZ+69NfhUp8ceyh9z2+1lwgu18FYjhZQYNm
 cWj6RtrTWDrBbKkqqv+ZP6eSnO7eAReATW2Emdoq4kN8k7IFxxeuTm0bVZXjrIqVYz2l qQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ncvmhk4g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 15:22:25 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30UE7YeE018595;
	Mon, 30 Jan 2023 15:22:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5bh1ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 15:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI27jo7T1xmDU0asFyV2tZxwbkOAKFFJSLuYZfHmX+7YVl557NwZa+mqzvv3JEzXiwGdakQAepzvDSchn9GrDp+U+G2BRLUdxcfdn6H6xwSiZLyr3K9LebJOlzmO5cJO2G7MzscRi1PvvrgW2LpJvC3tbJ0MJb+ynpVHe7RK7hqGTLHkTVXM+HanMoPzOS98but7abPa4BSFIuXQjJOw9dhIVScpWcDC/B9atp1kItCJY9+NSfik9NAlFCqhVZCtz8YC8fsSDcYDGTLVAXKSlEl8ZfaOH2LyUQDei4WTD0V/dnGb+oxqLbVMKgo+SJo8umH0d/vGvfcU2azskH5wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCXnxHeMBmrxc2gB9gfXee/1ulQwGglMjV2TymW/kk4=;
 b=UrpncxIw+yhALZB/O+8R9i2WXmVRe9aD6K73UxBCkz65NriQBUVLP7e8OUp0naJib793YWuu6aFgTFbFMwMJoHeVBQVQ3XFFSgTCtoNXd7riXT+sesc5wrmPrjeizKNcNNHLzniX9zXOCIgUqA/MAGlUDyTBgY2fi2E4QlTE2WZH03nn5DdHHhJywNXBAdgDjmrC6HUJojepj19UoRzjCipt9spUxQl2pyidLSSPd1ipJSt9PHyItKLUQvrh4qoHrLJEIufk3X+O9vhzWP3VCzlvjwjJ3KdxUJJK87kp34TqZnOnUFT7XOyF/qZuMqW5sg5SxCJNll5Zu8ypLWyNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCXnxHeMBmrxc2gB9gfXee/1ulQwGglMjV2TymW/kk4=;
 b=R9jEbQ4QKI+UFLvNJOcHHgItTvYGfJt8dojFDp+vhSR+z3sKI6tB1PDsr0ZkJklD9R8rmpgaokd180YhGdJ3Y3oTCzE5+Muh+v6cLM42in3mBQYn9IKXzA8JaYtyMi2r+df8CUZ7LWvD1SLWCA9ZlKa0pzMBWBj/8v7awezZIZE=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by PH0PR10MB5548.namprd10.prod.outlook.com (2603:10b6:510:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.20; Mon, 30 Jan
 2023 15:22:22 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::fff7:981:3ae6:92eb%7]) with mapi id 15.20.6064.017; Mon, 30 Jan 2023
 15:22:21 +0000
Message-ID: <c18b2293-5f34-28b9-25de-c92c25d5c3f0@oracle.com>
Date: Mon, 30 Jan 2023 15:22:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 00/15] jevents/pmu-events improvements
To: Ian Rogers <irogers@google.com>
References: <20230126233645.200509-1-irogers@google.com>
 <56f1ed31-886d-358d-cfcc-0ab9fe7a76d8@oracle.com>
 <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAP-5=fWc1UcjZT-8YcqHaiSEUGJCMNd4Syx3-MVhnk5PGUDPMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0075.eurprd02.prod.outlook.com
 (2603:10a6:208:154::16) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|PH0PR10MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 365c3fb1-b802-49a3-185e-08db02d5c850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Yrf/2SNaEDLt9b0Kv1uKIgFsK9cpIyCtD2qI+XrF+K5rfHCpzxE8W09wxVoHaob+9Kvq0AnySx2fxRwASotB978bmgObWyIMhypQGDsF0RdNadbhnP3aOasrx2XDI3Lb54jwz3s40DwRJ15/rZvdo/uk7g8su0hUK/YoNI7TCGIlDZeY7dRlhZ/CrirSb0rJsMUq8flw0x+Th/IzTYprAg1ezDe3diRxxPlascOu617yEMqOLgOtcdhREzjIQxH1mVLQdjb0lxU4CJkiKwnVxz80q5F5TnBbgZdq32BiwT0Fii6Rb9CC5Iq6GTRas4fUDpKHUfkT5AaBLVFKsAmUKiqKuOGU6Kpc6GhfiOm3PjAJNA+LwAYUxdXwynOXBITYNgSHLYTouLVEe8C/Qn6cCC+ze98WKwJ9QXx8xkKcMoKHvl0secMP+6AXKu24KgK0f1pspMC4DUk0d7oLTWMcFXiL9aL+PHwWQW4xJiVUQ6b3ZKMJUmOSw6kHhaLF+IQnaefLqEgZCvEhjcfabAUeoMEaiadUlPEftgv3RJSOuwvB/ezL39OQoU2NKwP4rwLWAIgPNpyj/zdjQ+Ba37DrSnpxaAgCtpYFSuxJ2504A7EM1uM2UJ2wimoRQuZKCKsCHQuUGcM8Cw+wd5XFt5mFSMYDIlwhm4KD6UIckCa7w7e7BKT+7lFUfM96PaNg+OHC04NDNmLbpVjMoFCzGj2TLS+TPpgG/QsL1qlXz8EC4sc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(478600001)(6486002)(41300700001)(36916002)(53546011)(6666004)(6506007)(2616005)(31686004)(26005)(6512007)(186003)(54906003)(83380400001)(316002)(66946007)(66556008)(38100700002)(8676002)(66476007)(6916009)(4326008)(36756003)(5660300002)(2906002)(86362001)(31696002)(8936002)(7406005)(7416002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?R0RLR0NWTzd2MFQ5RGR3SElQbW9vMWhJL0tMZmgrUlJ5dHBjOVNuYTc0Uktm?=
 =?utf-8?B?cHA3dTR4NE9TOHZ6QXk0L2owbFh0eXNvSGM2bmtmaTNrOGFNSHp5QWNkS0VF?=
 =?utf-8?B?QlZ6dkRVb1ZkV3h6ekVSb3N3ZDFmb1IzTDVnVDRXUXVVclFKdGQ1SkpaNFpa?=
 =?utf-8?B?cUpkbDBMZC95azl3TkhLT0pNMmx4QTh1MEFUMDlSSU1RQnFwcGNtSnRqSnBX?=
 =?utf-8?B?Q0tkTm9aRWV0dHdUL2J5ZllDRklPb2h5ZGVSbEduUloyMGs2OGw0S2FjbkJI?=
 =?utf-8?B?M1pRektNTmYrd0x4dlEvY2VpOThWd0tvZW5VQnVJd04rV2hCZUlFNUlEN2Nj?=
 =?utf-8?B?cHZBSGMxZU9zd0tEcG9idG9RNFJFcFJsaVFPUS8yaEkyTUVKaXRkVjlWNm1L?=
 =?utf-8?B?L1ZNL2J6QjFtUVVOS1ZNYW05RVJ6MGVleUgzaHVXdG9oOW1YSkFBWTV5YUNh?=
 =?utf-8?B?MWpTUWJhZk1MTFlteUFDOThVRld6aHpIRUE5ZHkyZE5GYlRldTRGVkxqVmhZ?=
 =?utf-8?B?SlZxakQ0aHhVN25tcmUwK0lNUlFKZ0E5VFg2eUlZWE93Z0d6VHhDZSt3c2to?=
 =?utf-8?B?dm5xbTVURUJjOW5teVgweHRaUjdhejBVeEFyYWdEdCtlTzlBaDlXUjVSRlNv?=
 =?utf-8?B?L3M1SGV2L2lNNmVtR0h3ZllGcVZWRy96L2tRS2xSeWdUUVNudXpEWVJ1SGda?=
 =?utf-8?B?eXE5cE1BZW9KMFpncnFnNGhCZVA2SlpvRnNRSk80RlBwM2xZeURaOWgwbE5V?=
 =?utf-8?B?M29RUkpOK0M3LzZyRUQyaVdNeS95K0cvVzlWTU92NDNEdlF2VlpQalU0a054?=
 =?utf-8?B?U0pHYldOMHJuYzVHdC9Xbm5oeUhKZzlnejNmcXJFZnRkVFJKZVZZWXRJclc3?=
 =?utf-8?B?WkJBNnljUmpJUWlXanVRQ0F0WEdSK1ZiemtTMVdlREJxOTd4ck5MSDM0NzN6?=
 =?utf-8?B?cWtYdlAzRnNuT0E5dUpGSjZSbGNnQ1M5ZTJoeFJ0bmZrTUZ1azJRa0pPWnEw?=
 =?utf-8?B?VEhnM3FPQWlEMmg5WS9RdXlTL1VacTJ2bTBTTzJJeThPY2sxa2hUUVZFaDNW?=
 =?utf-8?B?OXRkV3o5Q0Fsc01HWVdxREJ0b3JjMmRvV0c1Uy82VllSVXU2d2RWYlJvVE9H?=
 =?utf-8?B?dnN4ZFQxWGNnU1JOWFp5N29WL041U2RKdGdVcVoydExjczdGNDk5WmlMSGZi?=
 =?utf-8?B?SW1GU3lYcHovc2hHSkRUajU1N1JXNFRkLzVrNUdDT0E1YXpncjNabzFtbFNQ?=
 =?utf-8?B?S21VcFA0Y0hyQlVKaVhUbjJIWi8zc1lVVzBJOGl1emFDL3JtMW9CWnRqd2NN?=
 =?utf-8?B?L3BFZU1DU3hHcjh4cFdwaVRldWRHbStIR1B1aS9NelFlNkZVS0xjeDZWeEZl?=
 =?utf-8?B?T0x6aHFDc09Dc0wwajV0Z1RMTHk3ME11bjZPbGZxY2JZTUpYOUJCRHlNcUdR?=
 =?utf-8?B?ZjgrYTZSNG5nb0tuRmVNRHBKUW1PUnlDV2lsNUg1OUlYK0lQbmZlYkdqamRi?=
 =?utf-8?B?Q093a1pqZ09OQ2FPT21kSEtjS1hlS29pbnRueTlOT2hTajFER0tUbnpEd1Vp?=
 =?utf-8?B?WHJ2ZjF3S055cjdEVWk0ZVRucE5iL3BYUnFCellFcklnMHN5TnZaM0hqWGtZ?=
 =?utf-8?B?UG92aG1Yd2EwVmMwUVZCUlltYWd3d2Ztd0gyRmN0SDJDbXN4Z2xJMk9sdDBR?=
 =?utf-8?B?bVltZTM3ci93d1l4eWhzbkpxOHBWYXNMMXBNT2JOMHF5MHdOQlpRR1o4QmVQ?=
 =?utf-8?B?aGwrbDlrOFZJV1Z4U3hUVzIyaWpzR1E0Z1grQTdTaXc4eWlsV2t0c251Rysw?=
 =?utf-8?B?Ynpob25FVkczbFlCT1ZvbHY0clNxRmFlT3NrOHliRE9KVGVtRmFEaThRbXVX?=
 =?utf-8?B?SlVpZW5UbnBSUDVoTytwWGdQN1dyNzE5N3lnNzFheEZvK2Zyb0UzZXhEWUJX?=
 =?utf-8?B?WFI2NkFXam40dXN2ZE05aGlXOWlXUllkeUswbWRvNks5aEY4UWU3SmZTNWN6?=
 =?utf-8?B?QUhuU2M2eE51QW9GT0hTZXZaTlpJNHdvOHBrK29MdUdHd2gyWi9aVjZYVDht?=
 =?utf-8?B?WjBUWWN4N0w3U2Voc3g0dkN6TUYzRG1sU2cyem1MekpNcGdsckp2ZStsejJa?=
 =?utf-8?B?bXlzaExPZjhiQ21Odk1BME8vN2JtcGFvSjZKd2UxbHFJbDV2S0VlSVJNSW1i?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?KzlBNmt6aktMQ01yQmFxdkljZ3JJelZramNUT1RVUmFvVUtzSXZTbXZvUVY4?=
 =?utf-8?B?bVhXY1FsN3hIVG9icE1MUTc2VWJtRlkwL0FybDN1RWxaTk44Y1MyMHlsaEZk?=
 =?utf-8?B?RmNwMXlhSk92enFCVkxnc1N5ZEcyRXlxVDRYMW9xdVo3TGgyUnd6aXhBS0Nt?=
 =?utf-8?B?bXZpVVNEZWFyK0hpMmtFUDlnRi94NWtkQ2tyUnBMZ0tzMk1JVURDZTBqZEhj?=
 =?utf-8?B?Y2psdkFlYWI3VEVGeDlzRmNPd3Rvc0hDWW04Y20xSVpGaTFsWVhMd0FNYW5U?=
 =?utf-8?B?eFFtMFdoMUhJL1B3Vk16akVvUVp5YitveGJCZEN4ZkJodDhQUGlEMkRzVElS?=
 =?utf-8?B?OHNuMm5uWUNSbkI2U0k0UE1McmFpbHRaRXpLLzV1dDZNUm5LeGMrbGh1VVpq?=
 =?utf-8?B?SWN6RjNodFl4THR3OEUzL0M0S01yanFoWGVQVzVOSFY2dmZmdkFoUHEyOHpF?=
 =?utf-8?B?YTg1WmxmSUJVdWxrTGVDVHExM0NOMzB4bmdwQjRrT2pPUGFsMWNFbm9XeG9Q?=
 =?utf-8?B?RHNvZW5oYTdENkdlSW9STDE4QUwzUlNnT096NCtpVVdYRW44MDhJR292enRN?=
 =?utf-8?B?eXNIczRjbnJxQnhUaGJJWSs2U1Q4Uk52VWh6M2VQOFAzMURGSk5sdXZJZWlS?=
 =?utf-8?B?YlQ3VE91eG9qYXY0U3lwcitGc3BCNXpINmhTc1JkN0VSa2xUUndtL0ZvMHY0?=
 =?utf-8?B?c1lZOHBWY252UDBZOHhLNmxuSHpSbDF0YWxNZjZSRlFaM1VRUHZDYjhuN1Zi?=
 =?utf-8?B?cTVSeU9ZYkNPallRUnpJKy9velBKYjM5Z3RGTzBNbTFaUThHdnhWT3Byc2Na?=
 =?utf-8?B?TERDZlhpaERHL2o2bXZrVGswejE4MGJoa0x6TWtNL0lyVnZNcEwrVFF2RlJD?=
 =?utf-8?B?QjZoKytWUlV4MmYxbnY3MVE5ZnRRTk9veXRhMThjblFuZEtudytqNlpMeEtC?=
 =?utf-8?B?RkowcDdFU24zdjlvMlNnSlUzYndzZSsvbllZQlNja2ZLeUpYY3FBZThCS0Vz?=
 =?utf-8?B?YmJQSmxPeC85UDR0RjBOdHNhZVZCd3BiRW53bFE3czA0TXZ2Nk9wMEp5VnRt?=
 =?utf-8?B?RzNLWnBSU3gyMENGYmI2VEYrckRmT0kxcXF5Szk3dk5xREhEMXB6WGRURGpS?=
 =?utf-8?B?S05MWU1vd0R0dUxkN1JLeXBwVHlGLzRoWlB3OVFRc2k0VlJRRE9BWnA5MXhE?=
 =?utf-8?B?SmhBNE9lL1UzKzJZMFAyUDY1R1JvM1p2aGU0MnFjaEZMZW9HVXcrL3BIS0lk?=
 =?utf-8?B?dGhKKzlYQ1pIOEFVLzI4bGVVcEJUQ0RMSm5YUnZRektSL3JuNjVocDRBUHNG?=
 =?utf-8?B?VnRaNHVXNGpDSjVreVNkVERwbW1OeFkrczYzRzF4WEIrUVIvaldkNGhlQ0tj?=
 =?utf-8?B?elU2RS9mQkR6NC92K0JWVXJFbTM1M2RpQ09VUHdCUThvaGFTaWpGUlFKbXFi?=
 =?utf-8?B?NGk2MC92bmdQU0d3RHk5ZHFBRk1BMSs2TGZXTllFczlmZldMME1XN0FtemMr?=
 =?utf-8?B?V0IzK0NOQjgzUG4xWjlhbEw2Zno1YlRvNno2a3EyR0RRMlN0UjJ0MHE0QmpB?=
 =?utf-8?B?RDFRTkhtNTlmT2pkUVlLRnY4VUNXdkduaGU5a3doMWZ1WTkvU1hDeGI0VUht?=
 =?utf-8?B?L0tjWCtrME1EeXZSUWMwc1FiSDJkQ0NZVkgwUzhzajIrajNyakJod3oyUHVm?=
 =?utf-8?Q?aBJ9vWRmGw5byTq+qgh2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365c3fb1-b802-49a3-185e-08db02d5c850
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 15:22:21.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGOeHI7d+qfd6tjCNAH/oVRL6fuYgozAZP/LiEVGcNk6OKtJeMxWyIVZHWjBVwfMwKSodKQd8RX4ap53UmyzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5548
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_14,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300148
X-Proofpoint-ORIG-GUID: amchwIK_Q_JlmJPv5AwwE8ElCjQ2sdob
X-Proofpoint-GUID: amchwIK_Q_JlmJPv5AwwE8ElCjQ2sdob
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kang Minchul <tegongkang@gmail.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, LKML <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/01/2023 13:48, Ian Rogers wrote:
> On Fri, Jan 27, 2023, 5:20 AM John Garry <john.g.garry@oracle.com 
> <mailto:john.g.garry@oracle.com>> wrote:
> 
>     On 26/01/2023 23:36, Ian Rogers wrote:
> 
>     Hi Ian,
> 
>     At a glance, none of this series has your Signed-off-by tag..
> 
>     Thanks,
>     John
> 
> 
> 
> Thanks John, will fix. Is there anything else?

Do you think that pmu-events/__pycache__/metric.cpython-36.pyc should be 
deleted with a make clean? I would expect stuff like this to be deleted 
(with a clean), but I am not sure if we have a policy on this (pyc files)

Thanks,
John
