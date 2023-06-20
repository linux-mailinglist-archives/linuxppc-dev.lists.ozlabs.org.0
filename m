Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D753B738EEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:36:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=XI9sNiR8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CyHr8KjU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXJp5QSLz3btc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:36:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=XI9sNiR8;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CyHr8KjU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlqng4Wg4z304l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 01:10:29 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KBP2ov006316;
	Tue, 20 Jun 2023 15:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=snIq18gzsG0mtmtxG+L9NBapSG7AF9Eu1w16W5QiBrU=;
 b=XI9sNiR8zUuFJmFZMPKTKV3tKU39FeNa9+t0vNFro7q31Goh/ZrNJGdIWskAMgLHJtnV
 nRz9fEuajc7+gb10qmBewDv2FzwJUZNRVSFDB2LcVk3UpctesEsjYlflhsPCFJzccJqV
 Jaop+Rh/8PQEM1Q5k24GWYWClr+LtsH7JtpBFARvekeOFVqX0nK5fVOBDfiYhFGnKEMR
 L5lL4pC8Lu6NA3k21dqVDnaZcuLM5ubkvrNBuY0eSFhjOE08FJzRjDxTi1ZQ0YLQoZqo
 bjYVm3nX5xhFjpJG8vaVoLZFfue5mEHnUukb2ImK6CG1v1iClx/5qSRQk7b6k6gkonb9 2w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93m3n30b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 15:09:58 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KE914e029722;
	Tue, 20 Jun 2023 15:09:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r939aqytu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 15:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jML6kTn6XY+wojBzVLBbvQQOD7ph9yqKAug6X8bQe/H80/xrd77bEnJImMSDVTJ+pABGcolbfHDNrb7ohPfS3ZMXEnDB9bBw5fZmH8i/BI45nHz+q7myY7UQWVJF2eyL/9EgWNHNLN8H1pVmee/eqssIUDvBqqOtfE4HibTQtIYeoh9gFu21mnDWriEPnUTEZyKTOlh5SxqAZQmi5Wvi+EWpz34hOycrGdOacdHhxILPtRTaZ+4D8JFjCK28vgh7p3d4Qd64SkhSCGibb7WRc9v0fjMIVvv7L/1hav6ujSGGr49aX79Bp+rYR3bOXDc6lB8zTbqnv8LdinNpfLLDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snIq18gzsG0mtmtxG+L9NBapSG7AF9Eu1w16W5QiBrU=;
 b=U4io0PNNus7onHntawRS3eAwuEq4FZEKsqUAHmRMyilrVIrjK5G36rBqIoA8AmiELv7CGoyaxSk0Mqixk/tSoKwItuCWJ0CKA0nzSWwJY7OSTjFy9svPlRpXFn/E7GA+92m+6ci3r+WIndzWRsutyTWRoBRGXh/W9VOtr4vNwAlFilfXw6Oqp2TpWXg/ZvsXi0ija3mYzYjDLG+2F2tGoXf5CRVxyukE7ACu/CIUEtEA+kSkQ7mt6eZs1lo0ydUCYOR+vcCV14jyV7GMmHGTPxe0t6bNl1OwKaDsApJ3+wN8f39V621MwjysrcmthYwNw2Z92pPN5YSA5HrGcBCECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snIq18gzsG0mtmtxG+L9NBapSG7AF9Eu1w16W5QiBrU=;
 b=CyHr8KjUMyZlvWOJCJ1dZ0dRd0fxOjEKQQtCc69yWzKXifOan9qFeMQQkE+lwoEnWK8IwR/wKKVOtGTihLUT2MD8wBCnD11liYX0LhhuczGRn2vR1VPChxem21Ldj/z6MZiYZQY68mcLHmTJK11W1S+4eylpnSdp0uyy3mMLH4o=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB5132.namprd10.prod.outlook.com (2603:10b6:610:c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 15:09:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 15:09:52 +0000
Message-ID: <2a0e62a4-4edc-d4c9-dac6-1e0bf6a976e0@oracle.com>
Date: Tue, 20 Jun 2023 10:09:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/13] mips/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-9-eric.devolder@oracle.com>
 <20230620125236.GF10520@alpha.franken.de>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230620125236.GF10520@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:805:de::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 46870580-6c9c-4aa2-7bac-08db71a065b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BDrlupcOiqNbJh5/liRUfewJDNG79eB7nUG8T1pNf9Ou4LoDdQKLTeD2KTvg96IeEbQ/MtkPZWvs8dWQQ6+wLDcxriXVv2S9u1l74NNNoqLCmr/cjrRaHMnIqgvrhv/weRHCKDhXSXK4eLXKlH4iQfTPAWIpWVjM5m/cdcrjzBp3t3fMU07Oek45WuEd8pmfrqK1jBJtfNW8QJC5gHtw1Hl3/RGhQYAJFVCkGZNCvaBvUm+wJlIJf99MRa/zjQkKKL/tTO6WWttDmioKPj0kN9koGeXzAymMX4pFu1y1UeZ9doYMgXbFojRQd9suW85TQ/1kJTwA2C0AryDMelFOnWL53f+FSu3EewghJ9AdmJfUwfjYKoUeK4FjOOcEB9hmC79fwIPCsTEXYC6JdoiqEpAq7tsY1GICTodKVXxH+ozKytmH5ToLbeUX4enM8HTvY9AtLZrknOQvAa5wcB2V2cAStVOR8EQjCH7bRUK6W+6aMoHv7g07VqckY3ZP2odkW2nH8gMIS4CSbgOUlJTw3WOLPSvikZI66urYonx3LT0j4pxuqC3UPQZEwYH0g0aLnAp/mWcT6uzUCHf05XcXOrsI6O0djcRaL1n4QzQ3uokDHeWx6L6Wm0exqWY/IUQ+YM6NqDOBdwE7oKnLN4aQWQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(107886003)(6486002)(478600001)(2616005)(26005)(6666004)(6512007)(6506007)(2906002)(186003)(7416002)(7366002)(7406005)(5660300002)(36756003)(558084003)(38100700002)(4326008)(66946007)(31696002)(316002)(86362001)(8936002)(8676002)(41300700001)(6916009)(66476007)(66556008)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Y3BHbi81UkdtK0x0VFFPUml5MER5eEgvakZBOFdmZW5MbUVwaURRTnFZMWQr?=
 =?utf-8?B?NEc0M1ZseXhaSE95SGhneG1wZVhPR2RJK1Y3YnFkRFBqLzhPN1oxZS8vczJZ?=
 =?utf-8?B?TDZXc1QvTXNHYmlUTy9iQ21VRHhFbVhlV0x2Wm9uUFA3TFVsWFduaFVMUXB3?=
 =?utf-8?B?RmRxMVM2aUJDUDYzaVdkS214SWc1dnZUdlJUczBhT3NZTkphMGwzL0k2UThr?=
 =?utf-8?B?RDBRUWFZb1huU2l1TjBMUjdRQTEvNmVMMmwvbWxqd0RZTnd1YzA1c2I3WEYw?=
 =?utf-8?B?cWhsZGx3ajhRMGMyMXMwd2lWZnVuQnlnNk5URkdlaEV1WTdocHRuR3hyM0Vs?=
 =?utf-8?B?S1NFcGNZY0ZHb2dkcTJ0dHpXL1NBeEh3MlROa0RZYjQ0UWpUY0IxeUxrYXpT?=
 =?utf-8?B?Zy9NUkFrWjcvbE5VQ1VaMUVoLzZmUGhlRTE2YUcvWFR6bjNibmY3ZXZaMy93?=
 =?utf-8?B?MVhmZHZxYW9uYkk0a3lHaURvTE5kM1pVenBzdjB1elF1a1JLVWErVXRIN2tn?=
 =?utf-8?B?VDVaYWQzUVdLUGFsT2R2WEczYmxEVVcrb0hKUnUyU2F4YUhDdGNoVy82OXhv?=
 =?utf-8?B?QllkT1lXS25hYTVNZHBNcVg4QjFnS0xRdjFpR0p4cEZCYnlHd3NtYWhWSHZF?=
 =?utf-8?B?Z3RXVjlnSGlGdDVxREIzbzBDajRzWjBRTzNJRnl4ejdBMy9jRHYzUDViVzdP?=
 =?utf-8?B?RFA2S28wTUVpdFV0S1JjdTNmQWY4U0N1bjJMZnBKeU5UcU1MYjlFekRUMUYy?=
 =?utf-8?B?VEtlbUtCdWZtZ0RacVpCMThrem1JdmowTUVkdVNXU3VYbTlURFpqQ1lwd2F5?=
 =?utf-8?B?bHZ1UzB1dlVycnEyS21qME82aEo3THEwZ1VjT3FQbVR3cUFKTGlYNGx1eHM4?=
 =?utf-8?B?b1U0eWNKdXZvQ1p5cUdTUVkyZ2ordGg4UjRDbW13ZURsb29PVSttdEdWTVZm?=
 =?utf-8?B?dnltT2dnZzdUVXdLbUxyVzBCZnRVc0h1bGYvTXU0dEJqdWJxQ3pRQ1R3ZFor?=
 =?utf-8?B?N1NvOG5WazhBd3JmWVpGRndYYWFRaU9vSzRVaVBLK2p1SWlkeDBsTmFXcEJG?=
 =?utf-8?B?azl1LzVDT1F3MURnV2xMVkJNbUd0R2I5WnlGbVhySW5LVDNHMmdFdk1xNHE4?=
 =?utf-8?B?UTI1aEJKK2dNK2FmRzRzMzd0V3dOb3pGSWNzdURGMGthVWZycTgrWjNaWlAr?=
 =?utf-8?B?UVN4bWZiaDB2VEwxNWNEOHRPTTE3cHdVV0gzcHVRQ1pXdlRQZlRrQ2hOMzBR?=
 =?utf-8?B?TzdlVEJCTjVJYUF0Zy9sTVRwNVYzMW04QW1zVnV5amQyNzdLV1lhMUpkbGxK?=
 =?utf-8?B?eTJ5ekc2ejQxdmRXUlpSYTFJVmJacGpzQzArQkU0a2hnaEd4V1VFYXZPMzdo?=
 =?utf-8?B?RTNUWkNseFF2b0dDdW1yTnQzZTBROHZNSTNnQng3aGg2K2lha1R1a2ZWckxo?=
 =?utf-8?B?VStVdlI2U1VKTXFGSTlqN0ZNTy9LYStZLzNrOEx1SlQyVmNzTVErUVk2MEZL?=
 =?utf-8?B?SXZjdHpjdUMyb3FxMTc2blF1cXFSNTRvbmx2Y1BtSzIwblJMb3hoUU1DSzJj?=
 =?utf-8?B?MHdjV3ZsWlB2SThqVDZ5L3VwOEsvNC84bVNURDBYOXRMakhKWjNYR2dHaUgz?=
 =?utf-8?B?dmY3aVFiNFd3eFZRcTR5SG1CTzlTZTVwdXdEb0JaNEhCSnVoTGxranRFdFlm?=
 =?utf-8?B?VVRZeVNHeGVnMFkvdmMvMWhXU0JwMzdoQ0U3MmJxZHZKQ2l4N0hrUHM4bVNX?=
 =?utf-8?B?MzQrSHlnYmk1QnZFU2UwdEZNand1TjV4eVNjSmZuSnVvUExORmdQb0dVNXho?=
 =?utf-8?B?c3FQVldVRnl0MTI0U3BLUE5ZcXltZnM2Y2dSK0w0R21qc2JDUVFlRisxQU5w?=
 =?utf-8?B?SGQ4a1ZiYjV4NWxPNys1enhZc3VOSnpHM1pTUzl1cjJKR3o2VFBwQU1xRzJW?=
 =?utf-8?B?eW9FcW9vMFJjM0g3b0JCeDE5Nkh5d01UWXFQeVhBbVg5SWNvWWd5OTZyOEpR?=
 =?utf-8?B?MHc1aURnalNtNVJkcmViSy9WQ2VnMFNiOWxrOGxWUzVhNzBrM0VpTTNNb1lY?=
 =?utf-8?B?RVNzcm1wWEpJRGlURkNWUEIxT01NeEszaUg4RVBxYktEVGRyamFkZWhET3NC?=
 =?utf-8?B?R1dwS2M4WllZMnljV0VCek5NWnlwVmYwVlhTRHAxaHR3Z0IySDVreWRYL2dl?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?b2NiVHhKY2RPd1oxdnIvUHc5MTI3VS8vOTdSVHVudUVGelhKbmVKbDJscCs4?=
 =?utf-8?B?NWJXNHQxVU55VkdSeGYzaldsMGgrTFdtc1NoMkNhbFpucFJYSmYwUG13TXlG?=
 =?utf-8?B?TDJZdFBEVE5rTzdValNGbkY3Y0l6U002bHZBTkZLeTdYL2dOaXVrRUJkZlpY?=
 =?utf-8?B?U1plZW1vbmVtalE4YVdaeG1JVEs3N0lLWXpMbkxYbXpmcWgyaVBKWWpWRUpy?=
 =?utf-8?B?cFpWUzJwTFpqZ012Mi95WjFBSkZDSFB4OEpKN095TGNjM3ZFZkdYODkvMWgv?=
 =?utf-8?B?SHhNTjZvR1FxODNkM3Q4ZG9yMGdiQkdFRlQxNVlZM283VkladGZyWGZWYWls?=
 =?utf-8?B?ckpGaWRpYkljTUpDWkRkcVBkY3FvSG9EZjRQNWhPaHpmVVNHa2ZpVzU5cWVN?=
 =?utf-8?B?ZU91WlBsS0RzUlUyTUM3ajljWHYxVlhVTG1jMXBONEIyemc2TkVxc3NWNG1o?=
 =?utf-8?B?SjRPdGV0ME5RdHRPMmhielR2cFExeUlHMUJIN0VrQmtER2hOaDBlN3VEQlVJ?=
 =?utf-8?B?cWgvRFh0OHlWdXR3WTdFeS92Tk4yTmIxYStEMWUycFdLV0RMMDhUUWIzVGNV?=
 =?utf-8?B?MEFabVdVdWk3RnRhTDQ0alBqSXJWa3ZtYmM0K0ZXVnp3M0xRbGNDRXduRUZx?=
 =?utf-8?B?dUNyQTRld1MxRHZKSHFKeTNrMWRhRXZJcE5FOEx6M0libVhZMWQ1ajBWV1Rk?=
 =?utf-8?B?dTZJS0VKYWpGK2l5ZlpBbVhZUEFFaHRxWWE3OVpIc0pReFZ3UmdYcUJ4WFJ3?=
 =?utf-8?B?b3IyVjZVYkR4enZnSUpXdUo0d2Q0anF1akk5U3kxc1JPcDV5am0wbm1sN3li?=
 =?utf-8?B?aUZEVWJmVWNmTE1uY2Vsc2hvU0NoZTZpLzU2aU5VS3dST2NRSGdnbnExVUpw?=
 =?utf-8?B?dXBxZzdpcE9XOHNUcmpvWEtCOHVtUUZ6Rk9wV1IyNHRKV2w4NjJ4bzdiWk5Q?=
 =?utf-8?B?Zm00cmxqdG5RVzhvQXdOOTNlRU5PVGs1a3dDei8zRVFMeWZyK0JCd1VnaGRj?=
 =?utf-8?B?R2h0YTZrQTlmenFweTJNNnoreFF5WjFSZ05WbzlVKzdsTkZoMmtKbXh5UTBS?=
 =?utf-8?B?SUE4a3MxRnZiMU95Wmh6a1lKRTlrTytud3RhcXMwZlh0M0dRWlFIT2ZrUXFn?=
 =?utf-8?B?dDdPUGIyaWNGdXdBSlh6cCtaOGowblEwZ0pjUy8zaVc3T2VaL0lrRldoRWR2?=
 =?utf-8?B?WHIrNXN0Sk1yWWxIMG5saHFoMys5aHVpWXN6NjZjd21tRjRGaGZVaGRZbjdK?=
 =?utf-8?B?VlN1ZitrUGh4L3NSUFA4b0FxNHpoekFJK0dSbnVJQVZKYzQ5bEFEcGZxa2Rs?=
 =?utf-8?B?K2NQdWU5cGxRR01mUUFJUE11eGtmUi9wMnIvUmtPN08wTm1vRVAvWS9YdTM5?=
 =?utf-8?B?M3VRcjQxaW9sV2ZSYjBwRjVCVmdUUVlFcldpQ3VyTjR3NU9sQ09zMWcrYjhw?=
 =?utf-8?B?SXN2Z0hzbWFIT3hVZFhXZDBSemRSM1c4WGRhdmtHb1NFdHNlL2VaTExZY1dj?=
 =?utf-8?B?OHJ4ck92YXVWQXQzUjRTRStUTmtHL3ZEejZIV1lqODJvUkZUaU5HZUhiZTdE?=
 =?utf-8?B?V3U4Y2txQitIR2dyb1VJbnR1TittS1l2dkZ6blhudzJHZjBZUElEQ2lWQzdB?=
 =?utf-8?B?dlFzcmYwSHkwcEdiS1VnVmNFWW9nM3VnVElOaUQ4cUNFZmx0NmNubDlubTFo?=
 =?utf-8?B?SzN3REdkcnJFMjg5ZWN4YWI4Ylp0RlJuRFd2OE9aQWg3bjlPVDNXZzdWRnU5?=
 =?utf-8?B?dWEzdllDSER0TE1SQjdRMFFlTzBScGZtZUJYZTIwOTJMWVJ2Z1pDLzBINTFB?=
 =?utf-8?B?Mlk3bzBUWHFVTDQyeGlDVlkrUXUzcGVxTmY1M2U5SUZkRXlzZHA1VTZLakxk?=
 =?utf-8?B?cmErZnpoNkExd05HME95QTZaUytVeGdCejdjNENrNUlVNUJsczJGUzhHT2tN?=
 =?utf-8?B?RnJBMnl2L1BQeG1BK2NnNlBOSi9VSGYwc1gwRzhaZXBNbVZ1N0dWenV0cGlu?=
 =?utf-8?B?a2Jnd2RLRm5CUHBuSGRLUEpTb2xneUxBK0ZKRktFR0kzQklTcFRPZFIzN2R0?=
 =?utf-8?B?Z2FzamRiWWpsUlZtTG0xUVlkM29CZVNBdEtkU1ZZVm0xTmxiY3d5dlZCZUtn?=
 =?utf-8?B?cWo4akpWaEpFblFPdUNOWHFUbEtUMVc2ckNhSkZySldEakFhWE5KVDJXcGhC?=
 =?utf-8?B?d0dvZ2VsZFREcndHM2xCQ2dXN1N3amQ0blpURUF5SldORHphbjBsOFJPd2VV?=
 =?utf-8?B?b0pnSWVSaDhJNjZ0eFhMdWRsUmxSQng1aHJhZFBERytaRTd2WUJCSG9iQlpj?=
 =?utf-8?B?VVRWNVFHMitxdmttMm5OMCt2eEc0SE92cUhjS051MTVhVytuaWw1eXZlM0lI?=
 =?utf-8?Q?kUSuzk8mhmdThR75WP+KfmAkvlCgPE6pmUduQUmBHA525?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	nXq56NZKhn9PNR1jUzAU9lvzic2N/sdskHvJ4BlyV3sU/PN7t+V67HFf5clLjccHJtV1Pk2khWJOD+766EUdJodq7nwwzOBkNkF9raDMG8VhiLAqsiWbANOhoNYMXXNuHC0USdYaAPwZvH78Ip5pgOO2mrHDGVZhWRSB6i0CwvBixREpu9jm8ek9j0RaXldrR9yuqFsgfozNjAG/nvE0dSmooBH1TQttDLIf8XAGx3DRAoj/AwRnPEHBVXHcOISCXbOfxFWbtqabbO45/RJ5iABja9vfHVmf/06mX3WtS2dPaTtNWzZPL+AgA6aGxmG3XK9dmjPm7eJGx7SNfMhPLt1Pyok6UPce0jEUiIdakN1YXiV0UyMjO4wb1TZIDR7rgiDoSrCkVbGq3tEz23760vzGQEKp5dqPyzdtRjKGjfOBwoajY6bkP2JDSvAFDgbFGmqCINQlMIIf5g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46870580-6c9c-4aa2-7bac-08db71a065b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:09:51.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZzz9fwzXZB57b0YJrUXh0DSztNjd6qnXObD9hUnoDMp3rr8/mJ5HWIiDAPLfezX48oBdtoa5/CXaCsy8ucCEnd/8gza5ls0fzPzHNbZswg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=772 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200136
X-Proofpoint-GUID: k7P_TcaAwqyCd26UUzTzh_YpBDQzB7a1
X-Proofpoint-ORIG-GUID: k7P_TcaAwqyCd26UUzTzh_YpBDQzB7a1
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, chenhuacai@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, tj@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, ardb@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/20/23 07:52, Thomas Bogendoerfer wrote:
> Acked-by: Thomas Bogendoerfer<tsbogend@alpha.franken.de>

Thank you!
eric
