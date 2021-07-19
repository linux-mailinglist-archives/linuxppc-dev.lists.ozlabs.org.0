Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA03CECB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 22:23:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTCw5261wz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 06:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=J9p544sL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=vAfFDN0F;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Z0bNny2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=J9p544sL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=vAfFDN0F; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Z0bNny2H; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTCvG5Skxz306g
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 06:22:33 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JKBCDb013444; Mon, 19 Jul 2021 20:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=J9p544sL474mofe+xTQoq8YsvbFrw64oRD5IzTopdPOc91RntHYiswdp+l0iBRxeKsc+
 LcbktqEYtgbIj618AUH+mwgxSMvNsZNUfmN5q0R4CqG4hanO3nDhSowI1eoszHWzWRwR
 4CTXr5nPlUhfI3A53N/MhA8T1pcmM9h5IOwEtui66Ny8pqW9rOmitzNSRdTLMNLrjSCF
 b7BTflkgSt4xkLqJiSaD1JsInPlQnXw4sEV8jRW5VOcm2mhDN6hHGvGb3cFLOD4JnBRJ
 ZbtIt8y0gtUaXpe/YLXPcV3r2J1dr2XHNnTNty3cujYk7RporaQh8GCy1b0AKWgPm6j4 lQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=vAfFDN0FVWtFDBxChUpMGJe1jHbRAEf/DAYpK7h724vkUPKNPOp2KtwljQa40crfQb1D
 SP/dBs0HPDzbDyts5CUSy/0ajs62rF2NwRnogKxFF36HN5se6O1/GIF4bqM2QYFOpmyH
 5p/EBPKSLDR5LUgwkXwM9NGmmpPHxhkbJQ3fTQL0AMbQ9tLNcLmI5CrZZDC80iypBKQ/
 zNLH1fM+VmcD0+S8i21ETVE/gQW76CFIj7IoywDqJWGxxIUlA9HdwxMLF5lM7AgAK1uZ
 Rn9HkvFK5T+Wvcpz8lUQvGMOLR2g3UoQSNwsLLHTMeQgrVXMAMLLLlIBUfd1ZbH9s5fz Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w83cs5eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:22:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JKF3i7160410;
 Mon, 19 Jul 2021 20:22:14 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by aserp3020.oracle.com with ESMTP id 39uq15cccq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3fmxg4rVjpzHE5ssuXZZ0AIWBw6zeVhp3RyGArLeO579plKxIvOwEJlZP4MamhGsmXTyqIu/sPLgUnt8QxSqnNapwF4qB266MqchoU1M35EWTh/FyEw4g0AJFp87X7iE2z63sEmCEy3Boe61XDwufM8HiFhXw5czYFOiF0Ygp4ZH7P+7wjymMq8UCm8yMNRVHJpEXsmvKu85OXpVux/PZFz6n1UCWRTd3RaT0fxPQSI8fJ7CJxvMq2OhcF0Rga4ZsHMNDTeeO3MkNPP2x8fns56fsVS0JXDQeqGe/YVSfQ3Dhu/lP916Qr3QIiPwy6cDtkyDWSjAb02aKdEalcSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=gNIVZDyCz2CmtpUJOew51Q8jOtkNPWNqUcy+Fg+BZjIaYd3TyenpHF22dnFbN8f+cHTttks2SHYvuMoGD1bPsVsuMBSqZAh4l+qabFuMFD591ka9UwVgCYAB/v5XQRTJhTY65gKqH1XsbV0MrCnKsCEaqz3hN68Abr+92LfCvi8KbQoqzsc6Aj8a5DNSmhgsPtU4xCYxI79YEPqsFlO6yW/OGBGWz1vUKljPBKcpgVC1fT6HI9U61CSBpCV2YHq6LJvyXJU6HTAwM8AE36VJdO5qB8mXEZhQ9sHItms8+48DEpRjYqPY+err1zXarcYowtIpifucQG5V8jw2l+z88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=Z0bNny2Hn8+wx5EDqRhz5h639ftRumqbgaiVVQ4vUM2dMQ5J1J+75SbZT8ZCLv/vFqMEoFpgbe/5F/Rglo8hGwHz0n+L2lYm//xvCOn+IuFRlm6MuvY+Tib/9SWiWCVEd5BYNtXKHsCQ0GahVlCLStRq0vGBG6VgpsDsIlgyeBM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5329.namprd10.prod.outlook.com (2603:10b6:208:307::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:22:11 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f10d:29d2:cb38:ed0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::f10d:29d2:cb38:ed0%8]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:22:11 +0000
Subject: Re: [PATCH v1 13/16] xen: swiotlb: return error code from
 xen_swiotlb_map_sg()
To: Logan Gunthorpe <logang@deltatee.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-14-logang@deltatee.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <8cccf120-0b4b-4d66-0b96-4114af27a3d1@oracle.com>
Date: Mon, 19 Jul 2021 16:22:04 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <20210715164544.6827-14-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:21::22) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.102.166] (160.34.88.166) by
 SA9PR13CA0017.namprd13.prod.outlook.com (2603:10b6:806:21::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Mon, 19 Jul 2021 20:22:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a216d6ca-9dee-431e-753d-08d94af2e391
X-MS-TrafficTypeDiagnostic: BLAPR10MB5329:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB53295EB44276FE6AEA15CAD38AE19@BLAPR10MB5329.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AiyY7elKT7NtOhGt2GzFvXpn9LtSNnhX9ehTyI8sETfsQV+K4tgFyeXf5D2NpKP+r1F56ND/56FfKOLi/Ad5IPWKQsc0rbn1QslGBFT3wa/lRS+5jz6C91ofQdVVAfwC+1CbW0HmfP9qy8mpnlYbmhuBwgdDJMtXfPLxUBBFw4TQN0InvGLT0mRLCxCWeaDJVVv/wcVjG0m2r5ndwoIyvfMUkOGSXsSn0ZCiARkK5J2XSA/h2bu4sMIcdFYJGpKcIwQOCrORrARr8h7xXgkJ6Oa3tHLTHXSOKDSSsIgnc7kjRjemqx8+S95PW6X/IGH9gI8F1WreDtlIwFEy5TZdtkpzj9v5MHuZT2uFfzdmpp38RTruOgxK8ZRTs8HLyrNsCnx02eKywjm+qDps2t+hHn0FuDDP3I/9JdpCme5w5qtCu5reQeb6c7wMEQz519mTSlnhprMYpj/POulMN+9hJc3tVNaz4rKlFrdPiqMrZI9cy6lbRyI69O9WBPutx2dCP+fG+1T2ke2rWoK3PDIuT4XQpAWbXgZrp7N9Ee2XkQ7PQKJFjDsuCGFO+R7r6HqpXbwQx0pEVuCR0DIIsNwYHJilc4lDrBlgGsG3/zfKTyoyv1C2f7MdDnGaDLsqj0pkm4gcWHrJ0BoY6R5dSzc5mWqawOOk7z0EOELuN+//Q+a9NYDxn3wazpPjCmriKcLBt2ZDBcYAWno+UgeetbJ6CoTmHS1kfZl3T8gE8s8/fgJ/L+AMlja7YDDdlVUL9GZW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(376002)(136003)(6666004)(31696002)(31686004)(66476007)(66946007)(83380400001)(921005)(8676002)(86362001)(4744005)(5660300002)(38100700002)(6486002)(186003)(478600001)(53546011)(2906002)(54906003)(16576012)(36756003)(44832011)(316002)(8936002)(26005)(7416002)(956004)(4326008)(66556008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZRb1ZkVjk2N092d1FOWm1TTFhxbGh0RFoza2MzZ3lycm8xdVMxUGhZaEh0?=
 =?utf-8?B?QjBueXhvTHVSQXdpYUdUVmRSZDRYV1Z2bFRpbXptdXFVNzRGejhaRWRlRWd6?=
 =?utf-8?B?aVQ5cXNFMFlCdVB5MUtDNjhVbUVpd3pWREZRWVdzYWp0U3FPbjdQVGs3US9R?=
 =?utf-8?B?aDFJS0lQR1FqNDVKSTR2UU1xNEFSTXk3aDJleDdPR2NBL3J6Z1RPNnV2Nkwz?=
 =?utf-8?B?eW1EVDhVSU9ITisrRkVZMEl0TFUvUmlNMlgvL0Z6SzJwYjFwMU5ldzhQclpM?=
 =?utf-8?B?WG5LaFVZcU41VXpEVUJLUDF6bzhFbVBOZFNkWEcvTE0rb1VoZElUQkxKcVdY?=
 =?utf-8?B?SmhnUkg0WmlxcTJUcWRTZVlnNHExaW85d2hRTy9nRzlNUXdBS2lHTlZKYm9j?=
 =?utf-8?B?aXFuUjdsb01ldFQ2Y3d4YlBXVU1FVk1TSVl4ZjBNcUZCRU1hd3BYMFM5WldH?=
 =?utf-8?B?SW93T0xHYUdFMzBvVEVBaExNUTNMZ25pOG9ncTNPN0ZmOHl3WUp2aGpBL3Vs?=
 =?utf-8?B?RTZ4ckNFSjVGWTFONmpVRlQ2K05lWWdCZy9JVEdjT2dtWXpia043OFlmdDM2?=
 =?utf-8?B?R2FQQnBUVXpZZkVMdGpvc21SZDFnclBKN1lyWk0vN0tGeGZad09wZzA1cDQr?=
 =?utf-8?B?eUdxeXFsOGY2WTB5dVJ4NGxxb2MzMzVDNStsWm5Cb3Z0Y2h5aWNwZmdCRTJW?=
 =?utf-8?B?ME9nK01sVnJBaSt6ZVpjOTE4YnlreEl1bmp5M1Vsc1ZXZ2g2U0J1RmpEenho?=
 =?utf-8?B?SThNMWZ5MmlueStmakR5TTE1cnBvcmwxR0YzL1FNTUxIMTVMMkgxV2NqUzcx?=
 =?utf-8?B?ZFJOZFpWOHlycEUrQVBzUXNNN3ZhRXdkc3dYZGtSQjBsdWZEWm5WdU9ZVGJp?=
 =?utf-8?B?bjRUQ3JjdGNhdjJycXAyZXBBZmd6SjUzUE9zQjg1VkNEcDhsTnRLbkVXREpY?=
 =?utf-8?B?RUtWMWhzdnRYNWtrZDl4SEg1K1dPRlByZ2cwRm9lVm9QRC9BVFN3N1VyM000?=
 =?utf-8?B?TGwyeWNyVnA2V2k0c3Q1bmNueVRodDhBME83WTdIY085aG9QYUJneWFoemIz?=
 =?utf-8?B?VnpxSExMK0JEZ0c4THNzd1k1NFNWR2ZiVGpDWFR3QnFNcm1jc0RXWVZBY1d5?=
 =?utf-8?B?SjhEVTdDeVhHeHI2bGZ1SG53M0ErTTBzN1ZwSEFtb1dhbTBrdStWUHhIK3dC?=
 =?utf-8?B?R0RYMjFoZVNFUlNRMXV0ZzBzNXVJSExDWHVyMk5RV3lkMDJuZkR2Q0kzWW1I?=
 =?utf-8?B?clVVelZ1cXVOVDZycmg3aWdrMWVUN0tvN0xqNWE3WDdNSzdlbFhRb3lhT3VC?=
 =?utf-8?B?Y21FVW81clhZU1A4SUphczhxbkN5cnd1WDdWUXYveHdTTzJPSWoxdUhURERJ?=
 =?utf-8?B?WTluVGdTSjRlalFwMTY5dUgzWitmQUQ2NnIrSDViaEhHVmhCUzFFR2VobC9H?=
 =?utf-8?B?SzZINlpmQ2xsbHBSY2ZvRE9nZmx6dXgvbkRqS3RQYTRvWExINHBWdVc3N3c0?=
 =?utf-8?B?T1lhWkRSQVpSR0V2dFROQzZZZjNvM0U2WGFKRVNSNGxPYW1uZGZYRlNXUHF3?=
 =?utf-8?B?cnpxcWNXd1RXYlRNNGpZTmlxMWhuSVlGazJUakpzVWRId01odnZrSFNVOS9N?=
 =?utf-8?B?UTduWCswaEwxQytHdGpvcGVYenBmV1JIRHdoNlVpb25BU012Y042QXpoQkZn?=
 =?utf-8?B?cktsMXlZdHNSQUdWbWZHZlk2eXZwVXZ1TVJ3dmNCWndaZ2tGWkxhV2NDVVM0?=
 =?utf-8?Q?DBIJwv/jd/HznDJYxfZnFinYCAnKo9LlcvWSUWl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a216d6ca-9dee-431e-753d-08d94af2e391
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:22:11.2965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K97vCe0npmkTp49QrAX4OWSxMu8DMopmlOiZzs9AQfGU1HVg1GS2LPNO7DOigqdxTluTquQ3cHxA7t8V0LFM5v3x2McQALVFOkBMOo5GQpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5329
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190115
X-Proofpoint-GUID: PucKbcTaJehG5tuAIXx5icmYiBHWHK4A
X-Proofpoint-ORIG-GUID: PucKbcTaJehG5tuAIXx5icmYiBHWHK4A
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Stephen Bates <sbates@raithlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/15/21 12:45 PM, Logan Gunthorpe wrote:
> From: Martin Oliveira <martin.oliveira@eideticom.com>
>
> The .map_sg() op now expects an error code instead of zero on failure.
>
> xen_swiotlb_map_sg() may only fail if xen_swiotlb_map_page() fails, but
> xen_swiotlb_map_page() only supports returning errors as
> DMA_MAPPING_ERROR. So coalesce all errors into EINVAL.


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



