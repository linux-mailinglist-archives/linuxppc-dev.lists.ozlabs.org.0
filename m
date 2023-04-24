Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D76ED012
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 16:12:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4nBw1zR5z3fKQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 00:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hjcwXlbh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=at1a7aDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4nB20KSqz2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 00:11:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hjcwXlbh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=at1a7aDJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4n9y50RTz4x5R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 00:11:34 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4n9y4r6hz4xDH; Tue, 25 Apr 2023 00:11:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hjcwXlbh;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=at1a7aDJ;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4n9y2WnFz4x5R
	for <linuxppc-dev@ozlabs.org>; Tue, 25 Apr 2023 00:11:33 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OBYdpY016974;
	Mon, 24 Apr 2023 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=WABh8fAMV1a5VSouJm/3r68ZTSoJgjKmrWUH12iEoJ4=;
 b=hjcwXlbhZhtsZZc/pAUXevUWBoH1Gch1VP2wwXGM2LrLkjIB4BzawXSmkRvGXaxQ69kp
 94kBc58ng1crrQ1G9xd88TXt26PKTS26s3uL8U6fF1MA9xAhifN2xYWq6ol8zyxFxHwG
 oo3PpioRSiKjcEyEJ2u/pmjURTiwlcapTuvHzsiqfkc6TgTBX2Ac0km7auuN6OsSjDkH
 JGedxsb3OZR0JDh53EG+zL3Tt5enT9tYUg0s6K8eIxhLFpSoJCkDNd7jKBx61wULedTl
 EzOTHsTsKCN94GWEBLXkCV7G91ovFhbmIaqJMmgDKr0n8FRYOnSn2+H0CzBLZ/0d8kAf Cg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q484ujxqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 14:02:33 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33ODecbw024912;
	Mon, 24 Apr 2023 14:02:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3q461bavsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 14:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/0CkKWMye/h26wA4ozBhdzG/Mvyn/wCLZwKSX9ahJHuNyMoYKD79DdRi1chAavjAKlKADg0QjI8z8tAoJQdMLssXjy4C2YXuoAHRaGr34OYeEv07PLXHtw0IkFAYpibqo3hFHtVLItX8L+1+ygYlYkoWSq/zId8jaD3MLPW7dfHhdEedEOzJVs8FUsPrsfBsejPRjSQaknyKBytKD53bsJvS9ljzlIRrvKQBXDuNgf5q41K1rXii2PlLdcD8UZDIBEyUhG7x5BvDs9I+a2Plz0k/PG3JN9Uf+s8uZP4ngjn4rSpUfxb2M0IqGpGxOr1DiUVlodg9fvIpFzZd9h15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WABh8fAMV1a5VSouJm/3r68ZTSoJgjKmrWUH12iEoJ4=;
 b=eJU0UV5f7kW8r4ApYYBCwyyj0lZ/BBd6Ri7jghtbehRlLmUZCPwMRP2083iw2xImcpFXpW26ps/gKoHmKzBW/tnh3dQG+K2FVO+H++mr6NHf3BdeYFT5zcydQktXjSaRdz2qJBfOuhxDmtvz02PyeiVuu7hRdXKwtwQ0Ga/vTIupWRay8rUsHjyCSFJCW/E3zoEyKzG632ngzVrtl7qN/8fcvK9oR7kMQe+RwvQexAba/6ymL63Y/QPS3HS7wFuL6SWQT8GpbeleeXF9ZbDzcuQ0RpMzsZMplHBpa6Qsnzoy5ZLLlosfgUGpfckkp39Ix0VOg2d2w/ac0FkLNG3HhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WABh8fAMV1a5VSouJm/3r68ZTSoJgjKmrWUH12iEoJ4=;
 b=at1a7aDJdH/XzMOnwe44NdqKw8jmODkEUd4XETlK8LMs1oMDzT4N6G6/LjiKsdy1NC+ddpppCv0U3/gh5ga1uczx5BTe5ernundAXFHT10A0Zi+xD+2hspjpYod2mmDpOAj4wwgGBCr/iq0C7YS4SGpnckHnlIQyGTcOHqXufcY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:02:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Mon, 24 Apr 2023
 14:02:29 +0000
Message-ID: <78c064ba-afb0-bad6-39b4-14015d838db2@oracle.com>
Date: Mon, 24 Apr 2023 09:02:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v10 4/5] crash: forward memory_notify args to arch crash
 hotplug handler
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
 <20230423105213.70795-5-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230423105213.70795-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e24baa-11dd-49c1-9a3c-08db44cc8a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ltDIKadOP9suwbuM3wuUYkzNKBsVxdryBPeZF4E5m3pLk0kKauDi0dCdYSqtm+O/U9EMDF0W0e377fvhq12/pmmQzUM8sQ7/3PWRz8X8U6NpnbNdZV/a2u9Ql7sDK/pbMK19ZC63WtDGM16ppXTM0Phsj4w6gwddq1VSSeyzdN6YrMh1R6mztGPzWfomhZafec9PUDyDKDWYcXDoSNhnyAv+9pYaGPkQYSzl8pLv7yWqmHgT2BZ86jYmD6rdhSYQlskYggt8onHN38S6503EcWPvHjjW14VAZ6RDM458NTkIcXWhlkykdwPNj/Qk/djKLEes50DNeNh7pJPojG1Ri8WwAqlMUqsXTFM2E1xd6TKfcj8pAdjOxQ2SBP/flRVmA+Wtbvx9XDt++LdOe00msa4D4uv70DZHseA8K0xfzDx2q1hAuSLVUlHe6E+yY0L7hWX+Bl7NNrUOk04jptqIezLIoYS12UWPFaiVdYfrW0vYmeihh70HdtPQl/cUAdImITh9Wui6qKBQdUKQCebj0Umtpvw+Af4wp714yfuNNWZb9K4fuoWjfCzN8++O+AcsSoNdXNfiJVcLsOnNNPLeE0mx/K6V3z1jOfuR+K/uIOFVroW211Vw6/uwHqIklnOTWCuxXBJ1vDD/Vwjne7PvsQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(53546011)(6506007)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(66946007)(31696002)(478600001)(86362001)(66556008)(66476007)(31686004)(8936002)(8676002)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZkY2bTZsRW5kYTBXMFYvWlN2WDc5dDNwSURPOEpSNDV0eGV4cGhJeVhVSlRZ?=
 =?utf-8?B?azFmcXBMdjJaRnVsV3M0MVBsVHYrWHlKU3MzTWN2ZnkrdDdYaE5NVEZ5cmZs?=
 =?utf-8?B?eHFXOEpNUkZ1MXN0cE8rS3h3dlJKdWZoTUdNK2QyK1kybDZhOU51bDhJRmdL?=
 =?utf-8?B?L2ZTUG1RNFZnTC9IaTR1ZUp5d2VTNnJMQWxabWVjL203ejRLSTc0UkVyaTRu?=
 =?utf-8?B?NWVGWi9ncVBtbGxHN000blRRblFTNmVzUkRWK1RiZEJvdjg5R1pwWjFpcDV1?=
 =?utf-8?B?ZWtXQjhSWXAzMDEvRVVKMjVOaFRoWlZSQ3VvSThndE9xV0d3Z1BVVFNZUWhw?=
 =?utf-8?B?cVplYkZZY2EzSnFjVFhPcWJMWDg2a1Y2bk5sYmNMOFg2S1VMNCsvN3pYenZw?=
 =?utf-8?B?cm5qZUQ4UGVsS1dKZHR5Y1hNMG9WZ2F2WWswZEwxUHFKQWRKUE5aMFdmelNI?=
 =?utf-8?B?Rnh0Ti9YV202Mm5wSW9zYndZMkZHK0Y2aHpzbW95RitXY25EejdHSjlyZ3Jh?=
 =?utf-8?B?cmJrSEhtcVY0U211UzZVb255UmxKZGlzS2dHajNtTjNhU0RHbUZvbTNocEFj?=
 =?utf-8?B?U25YUHZna1hpZDRxTEUvSGJ0TTlNWS9MTkgzcWF1cS9VdHY0L1A1MWRSaGVw?=
 =?utf-8?B?UGN0SEhpMmhVWG5mR2pvdlJxUkgyODBKQlFsQ3RzaVdmRituVGFxMUlmaFpt?=
 =?utf-8?B?eWVQcnVGZHBTTU00ZDlKVXpJZGdEeTFEQ2dMM0dnQUFuRWtDM010b1B2SXBT?=
 =?utf-8?B?RGo3WGtWWUNjdTdQQWFabThsUHp3a0tSTmdxWWtENS9zZzlCd0JQTnpOUCs2?=
 =?utf-8?B?K1owRjlCL1FadjZpRkpXRjMwalUxeEVmRVNTRngxUExFYU9QNGtaaEswNXFv?=
 =?utf-8?B?MHJOUkNYcnkrVGVvNkU1YlhnUnpEQTYyZjQ5ZjZPOWJyN2xnc0djTi9wT3do?=
 =?utf-8?B?VUVIQ094NGNpdnROZ1NBcjBTVC9hRC9FdTlUTmpDelkxcC9ZdW9MUEl6Qk1z?=
 =?utf-8?B?K3UxRHhpYTRRS2ZENjgra3k0bWJad3hBc2NSWk1DMFFlN2E4SWFZc2RCS2dv?=
 =?utf-8?B?MjVoZXFRU0tsS2VjMG5vRXk4NW1pS1pOcUFxbzBVYitNak1UZWVlMEtqaU5Z?=
 =?utf-8?B?MVd6UVRVVXNVTzl6Yi9zd2xnSXhSNUs3bElWOERGMld5c004c1crN2ZleU5u?=
 =?utf-8?B?L0dLSHRaMVZ5ZklOWDVhWk1CbFBDb2s0U3p2c1pKU0sxUHJRVlBsNUxnSXhw?=
 =?utf-8?B?UzhoK293ZWNJYnVKRmhxUDNMNktlQnlvbm5oTFVNZEJKUVZCdkVjVTZuK25D?=
 =?utf-8?B?UXBBbzZmbFpESFA1SzdMSVY3UU1QbWp6NlN1VlhXREtsd3pHMmJ4TC84aFpi?=
 =?utf-8?B?Zlc4UlJzWE5FTXNZOGRaTHpMTnNrUnY5a040N3lQV0pEQmNtTlN3T2pXK0dz?=
 =?utf-8?B?UG1NVENxZlY5T1hVSDgxbUxScXRhTmJveHRiQ09nRlVjNEl0NzZaSUxtZzN4?=
 =?utf-8?B?ZVJsV2RxUGcvMEV3YlRVY09DeWdSbjV1WGF6d1h6cFNFdFVoWmEydUdCUmFn?=
 =?utf-8?B?RFlTUXpMcVQya2hNelo1ZnRqL2tWZUppOVRZNnBTeFE2M1VWZ1ZmNHVpNkdG?=
 =?utf-8?B?MUZTbE5DZ2VERlhOU1ZtcmhHcCtGRmpHTVlLY0Jpc0J6aE1aTU5kMVowci9O?=
 =?utf-8?B?UURscFFEdm01YXpFUDJlSXFIQ01IZGU4clVLdHpOaC9veWlCZk9PUGRBNzJh?=
 =?utf-8?B?amNydzlrK2FsY3BWU0ZIM2RxMGZZcndXbmV1OEV6ei9zR05rbmQrZHQ3MW8v?=
 =?utf-8?B?NVRFdEJNbjdveEpLdUNraUhWMEVkaVVmL2F1NGpMRXlHajA0c2sybzc3a21i?=
 =?utf-8?B?TGxaT2RWS3FVbUNqbjZ0ZnFpNHk2Z2JlQlNTOG5ULzVwMmpQSlRRVmpEdENo?=
 =?utf-8?B?eG1QRFlISTVwcHIxUzFyTWRBUldrWFJZQVE2WVJWdHZHMWJTVWpWemFtcUtC?=
 =?utf-8?B?MEsyZTVxVzZURHUreEdKazQwQjZld21Dc0wzdHVtY1BvcXdOTWJESlFIOWxK?=
 =?utf-8?B?Q3RjM1NSbW5FMHFVVEdPT3ZsYytpb3M0RkExOFFFQWF4VCsvcjViRG9uK1Zm?=
 =?utf-8?B?Wm5ZWlltRzFHMnQyWmZlYjZ0V2tsSzhwRXNqL3Y2OVBnaVBjY1JjcUV4dkwy?=
 =?utf-8?Q?kbPZmnN+r/HnyMpgs1UOXts=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?c2FiSjUzMmtBUW51V2Y1a2ZiUk0vZ3g1NS9oYVF4eUN5V1QwS2pGMHRjaWx5?=
 =?utf-8?B?UHliYVA1WW9NZ0l3RDM5K0FucHY3YndWRC9oV2l3UFYzUDF6Q1VYYXBNeTkz?=
 =?utf-8?B?L2dnRVFxK0sydHg2NzhIQk1KbWhmcWdOS0pwWUJGYWJnVUdEdXdJNVlHVzE5?=
 =?utf-8?B?Q3htZjlDVHJ4QUJDTW5YaXlYMWRQSWx2Z3Zob1BLalNpUFdxY21RZUtJajRJ?=
 =?utf-8?B?U1pGWFBwcGFNWFRUejJmVXlNc1dSTENseHBMaXZnc1FHU1B3WStoV1lUNGhn?=
 =?utf-8?B?OTBKNkIrcXNSYWlGZzV4ZTkvYVlYSnlUWkF5U2NkQ1ozY0ZpQWYyTGVkUXY3?=
 =?utf-8?B?Q2xCeFhtSjNiV3dwdnVvRlpRQjcvdUg4R1FiUER1My9nU2prMlBDMG1VaXl5?=
 =?utf-8?B?V2xMVUFHSGJrN1BzL1RaS0tSVVc1OHlIL3dQSjMwTWFTemg3RUFVS014REZz?=
 =?utf-8?B?UTZUSHkyZW1ST3R3ZUlGZjA1N09JU1NZcUN1UHZDbmV4aVhObitaQ2wzQ0wz?=
 =?utf-8?B?TFF2ejZiQlVqeE9ielFLbytBNU1OVDRqQ3kzcUZqdGRFZ3oxT3E4YTlCaUZ3?=
 =?utf-8?B?Tkh6WWZPQkRibW8yWmhoVzAxWXVVL2hSMWRFd0ltMy9IbklUTXV4RlQ4cGhO?=
 =?utf-8?B?blR6MTBGQnh2d0tGS2pQdHdqRTZFYjE1Y3M3QWJzWWt2S0pUZExzdHZja1lW?=
 =?utf-8?B?ajRPVDZzaXg5am5lVEl4dzRyTXJmU0lwMlBZUVkwVVFVdnZNUHhxdXJFK1F4?=
 =?utf-8?B?emoxMHAvR2ZaQnUzOU1UT3YxdnVEOWdLN0tqOTVwRitwWVVqeXk5U0VzLzhN?=
 =?utf-8?B?R0szSTF0bjY1c1NscUhPSEt5cmtxU3BjV0V2Nnk0aGx2NCtMOGs2WjJGQkJt?=
 =?utf-8?B?NTdES2tpM3VmZEswNnVJL0VGWnVGNERSUGEzL3NzTVNpd1doSk5uNGphUVNw?=
 =?utf-8?B?ZFppSWJDeklqd3RnKzBkQXFIaktuV0o2NnZNTDBlQW1hdVZBL0w5dVhld0M0?=
 =?utf-8?B?QWNZUmFMa0N2cjcwRWNJSHJiMUN4MW9GWmkrMnNkUW5ESzNnNk5LREVKMXNY?=
 =?utf-8?B?OWkyWEczZUZjQldKMktVSWZMdm9CbFluNlRFUWo4N2dvdFlkUi9mZm5xcUJJ?=
 =?utf-8?B?VW9DVGQ5YnFsemdwZk1QMmppZnNaQ2M4NkZYaU1jVTdMQS9YREQwV1lxSzVG?=
 =?utf-8?B?Lyt3QXNzNFJ6SzVJWjV1RmZETHN0bWxRWUhmZTlDYUMxYW9iaDBzUTV2YXZs?=
 =?utf-8?B?VkhVY1lVRUJQUU9Xb3U5c0Z4SWtreTNLMU1DV1I0bnJaNEsxQVRsNGRKUDF4?=
 =?utf-8?Q?E/oAwIWy8sohM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e24baa-11dd-49c1-9a3c-08db44cc8a60
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:02:29.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1UFAkCVw8sS9uayLRQFR8VnSv5T+RLkTDJEndwAuQnr3pkkHWGyppXtJ2CJX1aaM+uWRS3Gczv7RQhuHQuHyRVkH75qzoyjioPGLMFy4jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240126
X-Proofpoint-GUID: nNBo6h1k8w2Gi2jh9PE6FBA0WsIGtIj8
X-Proofpoint-ORIG-GUID: nNBo6h1k8w2Gi2jh9PE6FBA0WsIGtIj8
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/23/23 05:52, Sourabh Jain wrote:
> On PowePC memblock regions are used to prepare elfcorehdr which
s/PowePC/PowerPC/

> describes the memory regions of the running kernel to the kdump kernel.
> Since the notifier used for the memory hotplug crash handler gets
> initiated before the update of the memblock region happens (as depicted
> below) the newly prepared elfcorehdr still holds the old memory regions.
> If the elfcorehdr is prepared with stale memblock regions then the newly
> prepared elfcorehdr will still be holding stale memory regions. And dump
> collection with stale elfcorehdr will lead to dump collection failure or
> incomplete dump collection.
> 
> The sequence of actions done on PowerPC when an LMB memory hot removed:
> 
>   Initiate memory hot remove
>            |
>            v
>   offline pages
>            |
>            v
>   initiate memory notify call
>   chain for MEM_OFFLINE event  <---> Prepare new elfcorehdr and replace
>   				    it with old one
>            |
>            v
>   update memblock regions
> 
> Such challenges only exist for memory remove case. For the memory add
> case the memory regions are updated first and then memory notify calls
> the arch crash hotplug handler to update the elfcorehdr.
> 
> This patch passes additional information about the hot removed LMB to
> the arch crash hotplug handler in the form of memory_notify object.
> 
> How passing memory_notify to arch crash hotplug handler will help?
> 
> memory_notify holds the start PFN and page count of the hot removed
> memory. With that base address and the size of the hot removed memory
> can be calculated and same can be used to avoid adding hot removed
> memory region to get added in the elfcorehdr.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
> ---
>   arch/powerpc/include/asm/kexec.h |  2 +-
>   arch/powerpc/kexec/core_64.c     |  3 ++-
>   arch/x86/include/asm/kexec.h     |  2 +-
>   arch/x86/kernel/crash.c          |  3 ++-
>   include/linux/kexec.h            |  2 +-
>   kernel/crash_core.c              | 14 +++++++-------
>   6 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index f01ba767af56e..7e811bad5ec92 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -104,7 +104,7 @@ struct crash_mem;
>   int update_cpus_node(void *fdt);
>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>   #if defined(CONFIG_CRASH_HOTPLUG)
> -void arch_crash_handle_hotplug_event(struct kimage *image);
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>   #endif
>   #endif
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 611b89bcea2be..147ea6288a526 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -551,10 +551,11 @@ int update_cpus_node(void *fdt)
>    * arch_crash_hotplug_handler() - Handle crash CPU/Memory hotplug events to update the
>    *                                necessary kexec segments based on the hotplug event.
s/arch/crash_hotplug_handler/arch_crash_handle_hotplug_event/

>    * @image: the active struct kimage
> + * @arg: struct memory_notify handler for memory add/remove case and NULL for CPU case.
>    *
>    * Update FDT segment to include newly added CPU. No action for CPU remove case.
>    */
> -void arch_crash_handle_hotplug_event(struct kimage *image)
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   {
>   	void *fdt, *ptr;
>   	unsigned long mem;
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 1bc852ce347d4..70c3b23b468b6 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -213,7 +213,7 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
>   extern void kdump_nmi_shootdown_cpus(void);
>   
>   #ifdef CONFIG_CRASH_HOTPLUG
> -void arch_crash_handle_hotplug_event(struct kimage *image);
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>   #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index ead602636f3e0..b45d13193b579 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -445,11 +445,12 @@ int crash_load_segments(struct kimage *image)
>   /**
>    * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>    * @image: the active struct kimage
> + * @arg: struct memory_notify handler for memory add/remove case and NULL for CPU case.
>    *
>    * The new elfcorehdr is prepared in a kernel buffer, and then it is
>    * written on top of the existing/old elfcorehdr.
>    */
> -void arch_crash_handle_hotplug_event(struct kimage *image)
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   {
>   	void *elfbuf = NULL, *old_elfcorehdr;
>   	unsigned long nr_mem_ranges;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 0ac41f48de0b1..69765e6a92d0d 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -506,7 +506,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
>   #endif
>   
>   #ifndef arch_crash_handle_hotplug_event
> -static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
> +static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>   #endif
>   
>   #ifndef crash_hotplug_cpu_support
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 4aa3c7a6b390f..7afe5f60d2bfe 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -718,7 +718,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
>    * list of segments it checks (since the elfcorehdr changes and thus
>    * would require an update to purgatory itself to update the digest).
>    */
> -static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
> +static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>   {
>   	struct kimage *image;
>   
> @@ -775,7 +775,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   	image->hp_action = hp_action;
>   
>   	/* Now invoke arch-specific update handler */
> -	arch_crash_handle_hotplug_event(image);
> +	arch_crash_handle_hotplug_event(image, arg);
>   
>   	/* No longer handling a hotplug event */
>   	image->hp_action = KEXEC_CRASH_HP_NONE;
> @@ -789,17 +789,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
>   	kexec_unlock();
>   }
>   
> -static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
> +static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
>   {
>   	switch (val) {
>   	case MEM_ONLINE:
>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>   		break;
>   
>   	case MEM_OFFLINE:
>   		crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
> -			KEXEC_CRASH_HP_INVALID_CPU);
> +			KEXEC_CRASH_HP_INVALID_CPU, arg);
>   		break;
>   	}
>   	return NOTIFY_OK;
> @@ -812,13 +812,13 @@ static struct notifier_block crash_memhp_nb = {
>   
>   static int crash_cpuhp_online(unsigned int cpu)
>   {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
>   	return 0;
>   }
>   
>   static int crash_cpuhp_offline(unsigned int cpu)
>   {
> -	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
> +	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
>   	return 0;
>   }
>   
