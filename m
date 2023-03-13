Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 537476B7C48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 16:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1Cz1Y0Lz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 02:43:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=jcUgYVBS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zym+K4Za;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1Bx3h0yz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 02:43:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=jcUgYVBS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zym+K4Za;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Pb1Bs4tdGz4xFM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 02:43:01 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Pb1Bs4qvHz4xDt; Tue, 14 Mar 2023 02:43:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=jcUgYVBS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zym+K4Za;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Pb1Bs1dk7z4whr
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 02:43:01 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DCH2Bn024136;
	Mon, 13 Mar 2023 15:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=s3Tx6ghSGhb/MBQ08EUPkdREtcuY2edqAy08FGLpS+Y=;
 b=jcUgYVBSCwuGSiV1DIaP9K1A9zS7ZV0u5aNvwyzGiY8SMzoY+5jcGKPS3FTultpq4UMA
 ebaI42796waic26Oj6dHr7tfJC8AbiMB04BeT4NB18N98CH8ylpBHT5RFqr+vLeyJvfj
 mh/1bzr87f1URKsBiq11YbH2Nb/1VAdAtgW9ZjX/epB+Cdfu8V4kG50nKomqCeNlDO+T
 +1UAlpRJvYZwU5dPQxIn8mpzZNFn6v76jhsT7GVwmrc92rNEcEgRXzOENZBmRmPbi88u
 aXtqG5jvX+zh/pU1j3K2zMsjbaFbeO50to6ltPllmcyyxgm9VDMwxPX3kABk71E0q4dr AQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8hpcv53c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 15:42:44 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 32DEhMEu008177;
	Mon, 13 Mar 2023 15:42:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p8g34u1g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 15:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWVHixZqT1WuL2OxJi5DCByk+QZdL6jceAyNeAr45+hjaz72Xrc+A843QvpGYr+MeGz++ZI5l16j1zLYENNLSZ6rL4LQpfCmTvm2T0krSfz2dS5By5tBUZMzqLQRTyQvUBlpnw6/l6q8RbzsH/GuB0DPWyfdfkTBzDs5AC1G7BfIcThavPRG+Bf3W8bPVeBmBCcLVUfCO0sLjY7TgzsbUi936fzsIczCGOIhhk86Bpedp8kw/bREO7Thf9TEkpexzRI2HxSumIyYQaFYuBX1bEcbglxo9RaGbn7ihrSAnNWkIqczxWe0AOW3PUwjMWPkOPDSCxv52xPi+kvBy3bZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3Tx6ghSGhb/MBQ08EUPkdREtcuY2edqAy08FGLpS+Y=;
 b=LzwnZFv68aB1MIbj5NZBLJIbqw2xS0Mn3iuovRHd5H9SYYx23p8miW54jSusc2naGqxcrDQC64YO3DYopiVL/ULHtDxgrrMdgIzFovL0rxztWhHp9Pg1NGuPRyfdf0Vk+es4csFMbAOfmi3/yuv6RuQ2QLmnsQiIUyEiOYjGYn1RzGTr8WHpSiq7BrEufd4H9/3KjyiKpe1XjfQKkuRw6UgBiC8jxrEpweIH1B9KChv0Zit0owUb+ARGhTSLi7X0ixFw9tAHIPT8ngOG8BkaeyaUTf7S9iU6XY2I1xOhgvGm/GBQ6tKLwC4nJ6Hw0q/0SZfyApvuJHm5g0c9GhS8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3Tx6ghSGhb/MBQ08EUPkdREtcuY2edqAy08FGLpS+Y=;
 b=zym+K4ZaV9wjAb2eDDYRr0HlCrOGMgIGPPFZkBsvXVSy0Znfek5iacjfEmTRae53Z4eB+Qu8yLYQid1JSnWFXwsTisPmpQ4Ca8ZQkkmzo6DeKzjQRfB42Rpc0piSSmOXT0tPEQW70AMqVQnBt7rbal5B44tVXQQtP6/a4nG0J6s=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 15:42:38 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::671e:6486:6996:c38]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::671e:6486:6996:c38%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 15:42:38 +0000
Message-ID: <ccf3a98d-60b6-a7db-c218-84b4eff69c1b@oracle.com>
Date: Mon, 13 Mar 2023 10:42:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v9 0/6] PowerPC: in kernel handling of CPU hotplug events
 for crash kernel
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 928d90b9-ff15-4b43-fa19-08db23d99257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mMx7TURayov9u9PAmXvNpmcsUsE45XGvntVcJnIcq2TWerO14O4RbCAPMxrEBJBKF4/nTObb9Xyc4UAyKHkdaaxz0bTf1Z9svkh/opiKdDKdxfN3+2/z8x4GGCMCG4VFe0PxImQTisVBM8LZHz0WtFzkZcXopNgn+15VurqU3RPNfxjgfPqslA3qcUzLlZEw21EFU69s/P65yHJokisMBdF36PMwpaMzOLjJ5K/ldsM3jG7iH3jRPfopF7T9frIhHmB035zB00B0R5qU2KiFbsfxL6D1F37cgHM4R2h933Zx6XmOCCxPkkWjzAsUSpdHioi5Hs+HpCy3z0G9O5q+Koq2h+bzMRZRLENhaM956/KQmwEIc9LYNhVQHzNwYDGp8TkQoTcw3LMYwc0bJ6LlT3HH/D3YFbPOyGCTlVaZAadMcwkowNVmiVtblrm8ngDP/d/uoLK/2IO7teQ/XSONP74/InYrUhz/fJTloSDZLU98VYtcuUQMai5F6+gbbRyVH9Izrii449CD8zSadCnyJajVwXz+tte52zhljr4VgBrOR9k7qaISC77TICmXCDbEOYxAgy3y+K2214akJ1gdg2wBuwD55XVb+q9FZcGWlw6dbHt7/gCulpc5UdpM4sOc90wT+pijC83b/40ie+mgoPNVYDfuCnk+YKm4YdD7zhDEtt/l197mC5/97JDnxYptCCBQDtwxmSQho9e0ZwH1nAbuHe2e0LBMSAkAvqAPMTLyRFXZ1FkLra9xxijMtZlA
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199018)(5660300002)(36756003)(83380400001)(186003)(478600001)(66556008)(6512007)(6666004)(6506007)(6486002)(966005)(2616005)(53546011)(8676002)(4326008)(66476007)(66946007)(8936002)(41300700001)(31696002)(86362001)(316002)(38100700002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cDQvT1pCT0RBV0VOTXF4S2Q2V2l2QjJ5dkNLQ3VnMWFzbjl0TjJaT0tJU0N1?=
 =?utf-8?B?Qk9iclNpdk8vYUdIeE1MK1d4Wmwvd2FyUzdJN2hPY2Z2dU4vVWpTV2lRV0xT?=
 =?utf-8?B?VUxPUzNmWjRtWWNPTThrYmJ2UnBBRXlmSHdha0hBQWM5WnVjNVd3Rm9JOU5i?=
 =?utf-8?B?ZHFWYnp6WWtod0RIMVpud1pCcndBdnQ1cU8xNjhycFh4NVJpbldGdTNWZ0ZW?=
 =?utf-8?B?bmZMc3FrMmJYYW9tSHZaRXdPT0xCRDhsSWpjbUd5RVJkbXp6NC9FdUdCNkVa?=
 =?utf-8?B?bVB2bUtaOFBvRkdXbFhNMVNqOUpNQjFaODdVWEtDRHhIUUY3dGQzdHNUNjFT?=
 =?utf-8?B?R1lWWEc1eGdTVHJrUmtDSDAzWVFLN1lNcnQwbmVyOU14RTc2cjRvbHJVdlRk?=
 =?utf-8?B?ZXRVNEZwcllCdmxyc1VxZmYvZkU4K09ISHpjUnM2c2V0dk5kYjFJazVaS3dr?=
 =?utf-8?B?aE51bzRZZnNubmJFeXBhcENsQzRCREd4VitDeGhUcWNTQUhDR0E4KzV6WWdY?=
 =?utf-8?B?UlY5UmZoNmt6a0hqQ3k5cVhSbFVhMk1HYUk0ajAvSWZhOERsZk44SWJheEhw?=
 =?utf-8?B?bjN6L0s5MjY4WW9ESHJYSE9aTEhSSjVZaFdsdThUMUd6SU56MWgxN2J0MmdB?=
 =?utf-8?B?NXhXWWxSeUlwZWZsV1J2SWdiRVRSOVN3Sk5rUTVsL0F5UkIrU1Rxem1CbXN6?=
 =?utf-8?B?UE13ZEFwSlBERzk0bWNkUCtQaGtrcGREYmNxTFFqU0dsbm1xRk9iTkIrbFk1?=
 =?utf-8?B?RjJsUkgxMFhaZlo5emdZOUJyaVQyYTJvaklsSDExa0h5cEllYkVKc3VySjRB?=
 =?utf-8?B?b2lHMmpRZ2x1M1ZrbnNBZVNxWTg2UkNlRk5HK0h0bi93Y2hNVmdpUEZFdmVR?=
 =?utf-8?B?MENNeWszMzdjZXIwVWtjdWpyTHJnUjdQWHNHSU5ROVpmRUdEek1oNVJNQU1w?=
 =?utf-8?B?Zzg3U1ZudjNuZHp4TWxkekgvZ2ZETGhvSFB3dHo3ZGRCeG9SRHBuMXlVRm40?=
 =?utf-8?B?YlNaeVU2UGFJcGRKcFVRTWZXYkRsTFJ4QXlaMWFsV20rNml5RGtLRU9JaEZz?=
 =?utf-8?B?ZlhQWDdRRHJOZHI3NXdPSldoQ09NRGxldWd0cnY4cVJ5OGxnYmp3elZPdlB0?=
 =?utf-8?B?WFpseWJCR3Nxd3dPWGlDa0lXM0o0WVc3eml3bnZKTVNLV05ETmY4OEZPNFdT?=
 =?utf-8?B?dmpTT1pVNVVObzhSc1pZdzdzb2RwOTVIRldsRDFOVjFQUUpkNTkrNG5kZGRK?=
 =?utf-8?B?a0F6Y09xMjRzZVlUZ043a216UUY4MDdOOTdkSGFLVEw0dU1VTWxtY3Z5MkRD?=
 =?utf-8?B?Q0l2NU1sLy9jdlFYR2ZDcGpXUnBMWk85VHZrVW9rWDd5R2czN1hUZDJFNVhN?=
 =?utf-8?B?bEk5cFR6QWEyeDFsb251LzlQMGdhUERxMFN4NTd0NHdjQVFiWjhxa3RMV3pn?=
 =?utf-8?B?a1Z1NllIckJuTkNHYnJHUDZ5WWJWYmlKL2xvVXBraGh1Z2ZyV1hVZWkrWm5q?=
 =?utf-8?B?R2IwUWVISnM3blpRcEs1YzZ3Q0hrOXB0enA1a1dQOFF0Yi9DMG16N1U2NDN1?=
 =?utf-8?B?SW1saGR3NWpEcXFodzlwL0htWVZHMFozZmpQSlExeVlRRVFlcnBZSkhJTUNW?=
 =?utf-8?B?alZaNi9QVEtZMkp1MWduVE1rWExkM0VJQlFPSWdneXhlNlcrbnVwV0RHTzRj?=
 =?utf-8?B?SmxkQU8wa0FOSnFXYkZYMkVCQU9icUpDN1QxbUpYSDYzTnlza2FwWjV6ZnRQ?=
 =?utf-8?B?OXFCdEE0SVRUK3BEdzI0YmN6NTlLSyt4L3dHVFNzS0xpcGZ3b2JXSmJnaUgr?=
 =?utf-8?B?SU94M1U0OGlBQXJPWk1IbHdPNGNxQVljYjBwaU0rZ3pacU0vcXdkclVUb2lI?=
 =?utf-8?B?OUpncnAzSDA3NVZuV0w5aFYvZFRVWEtaNHFrRjI0SWRWWmVEb01INUwzTk4x?=
 =?utf-8?B?U2UrRUZ6cWltNmR1VWd1ekZBZit1ZUhYMmJpVEt5RDUwaXhRYjRuZkVJVVFL?=
 =?utf-8?B?cElyelFJTUJZS0hKUGtsOUhkbUxldUFuWXk3NGl2VDY1WUY2R1k4OWFYUm5X?=
 =?utf-8?B?Um01SDk2N0VwQWJpNXdvL3g2WGExdmVKbU44c29jUE1qYzYwTEtYUWV5UjVS?=
 =?utf-8?B?YW5tZHF3ZzhSRXFITzFuWHA2ZUxSRkZEeHFneGJKZk5VTkx5WHdocXVOSCtq?=
 =?utf-8?Q?cxV2Pu6Iu6dF0CDSpOpYTmc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?SjN6bzA1ZWRVNFhTRGJabjZGQmlwclBWUHI5SGJCcTN1UTZxN2VBa0F5VHBn?=
 =?utf-8?B?OVFidkc0a1FIMDNQTDRWKyswcndYcmo0eHVHM0xHVy9MZkZtckhqcTkrYnBE?=
 =?utf-8?B?cHVZbm51d09KZXFqbXhHdVltblFWdUFiVWl2WUpDQml5SGtCeTZ3enFTY0x0?=
 =?utf-8?B?WGtyMlhlM21NdmZlZnRxcHJwUjdJTHRJTDV6bGhUVDRHb0dIbjJ4bFVnUjRZ?=
 =?utf-8?B?UHNZVkl1dGZLT3V4Q1NLRjUwOHpzK28yek5zZXk0VTNhNExKTHdoajBoMy9V?=
 =?utf-8?B?MnJ6WmFJc2JkV3Nlb3V2NFZDNGpiZlExL3BvSFpIQTVDemYvby9KcUdSTWxZ?=
 =?utf-8?B?TVMzT2t0Sjk0NEhQSVBvS1dOMlV1TmlJL1NueUJVTStwKzZsVmZPeFNOSGJJ?=
 =?utf-8?B?ZTB1NHUrelFlVExVTUJiN3ZoUkhxWHNlU0hKRkQvRkJMeWttQ1NKb0RidW55?=
 =?utf-8?B?U2dGQkl3VExxaE5RcHo0UEZPUStGZFZ6NmR3cXhGZURlc0MwZEVsVTZITC9V?=
 =?utf-8?B?QnIwWW95REZodmF1akQ3YWxlMFJVbnYwU3ltaThiTlVHWHBIb0h3b2UyZzZM?=
 =?utf-8?B?bkZZNzNrSFcxTERHVHpiaHVTZE9idTdpNVgwVXVmTk1Xd243ZDhZN09pV3NX?=
 =?utf-8?B?MTNkRGxtWWEraG51a3JJNUdpb2RMZ3prUXY2QUEzNi9sMkxVbFozOXgweU5X?=
 =?utf-8?B?djZqNC8rL0ZDMWFuVGliVjkwcFBiVnIvWjhJeEsxVE5GdEI3VEVWenRGdktJ?=
 =?utf-8?B?eUZSU2M0L1oweHZQNjFtdlh3ZlIxakNZMFZrMXlxMzR0T3UweXM0WFR4czYx?=
 =?utf-8?B?eWx6Q1MvMU9tZm9qOGpkczRRZnd5MU5QenAvVjRXVGhaOTF6Mkt1MFVISG1H?=
 =?utf-8?B?enhGVUJaSjF3TEx6L3R6VXhkOTN2WlFHNmYyNUluNG1pTFNYQjZYWG5IaVNy?=
 =?utf-8?B?MUl5eTBvMFA3UDFSTTZLajcxL0VBQ2ticGJaL3N3OVpQeStBWTk1NEV5RXdt?=
 =?utf-8?B?b1Rqb1VOc2ZuOHNITVNWUEF1cGY4aVVFNDdENTdLcDVicHd3Qm10bmNKcFlZ?=
 =?utf-8?B?WDRVMUlWemZIVmFXMWViQWJnZ0xtQ1Qyd2pLK0tvTkNpZUs3ai9NOGFjK0ZQ?=
 =?utf-8?B?by9wK3l3NDVLY0tqM2RCZmhxeTBXSDNJZ3ZON2Q2NGVsZFRXbFdURXVZMTI2?=
 =?utf-8?B?VjdFcEsxWUw0T0lUZ1JPWUNJMzRIUzNmbklPeFdzajByWHBHNVY1eFhrL1I4?=
 =?utf-8?B?d0RuK2h4UUxmUlRSM3J4bkd5WTExTXFJMUE0WGlsMVo5Q0Z0UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928d90b9-ff15-4b43-fa19-08db23d99257
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 15:42:38.6153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0FE5b93Cl7tAeIbn6mnja9tL3NPDf/jdl8Pu1iOkCXJhekIdIzWYhxJTz3lnxuSYhdD9/dfs7uWNNJFnc65vZ0ZPsgMulhdt9AeKu1BddU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130122
X-Proofpoint-ORIG-GUID: bmp2eEJzM1mmHRbL12TAOKNulSIkufB-
X-Proofpoint-GUID: bmp2eEJzM1mmHRbL12TAOKNulSIkufB-
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



On 3/12/23 13:11, Sourabh Jain wrote:
> The Problem:
> ============
> Post hotplug/DLPAR events the capture kernel holds stale information about the
> system. Dump collection with stale capture kernel might end up in dump capture
> failure or an inaccurate dump collection.
> 
> Existing solution:
> ==================
> The existing solution to keep the capture kernel up-to-date by monitoring
> hotplug event via udev rule and trigger a full capture kernel reload for
> every hotplug event.
> 
> Shortcomings:
> ------------------------------------------------
> - Leaves a window where kernel crash might not lead to a successful dump
>    collection.
> - Reloading all kexec components for each hotplug is inefficient.
> - udev rules are prone to races if hotplug events are frequent.
> 
> More about issues with an existing solution is posted here:
>   - https://lkml.org/lkml/2020/12/14/532
>   - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
> 
> Proposed Solution:
> ==================
> Instead of reloading all kexec segments on hotplug event, this patch series
> focuses on updating only the relevant kexec segment. Once the kexec segments
> are loaded in the kernel reserved area then an arch-specific hotplug handler
> will update the relevant kexec segment based on hotplug event type.
> 
> Series Dependecies
> ==================
> This patch series implements the crash hotplug handler on PowerPC. The generic
> crash hotplug update is introduced by https://lkml.org/lkml/2023/3/6/1358 patch
> series.
> 
> Git tree for testing:
> =====================
> The below git tree has this patch series applied on top of dependent patch
> series.
> https://github.com/sourabhjains/linux/tree/in-kernel-crash-update-v9
> 
> To realise the feature the kdump udev rules must be disabled for CPU/Memory
> hotplug events. Comment out the below line in kdump udev rule file:
> 
>    RHEL: /usr/lib/udev/rules.d/98-kexec.rules
> 
>    	#SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
> 	#SUBSYSTEM=="memory", ACTION=="online", GOTO="kdump_reload_mem"
> 	#SUBSYSTEM=="memory", ACTION=="offline", GOTO="kdump_reload_mem"
> 
>    SLES: /usr/lib/kdump/70-kdump.rules
> 
> 	#SUBSYSTEM=="memory", ACTION=="add|remove", GOTO="kdump_try_restart"
> 	#SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_try_restart"
> 

Sourabh,

The above seems to contradict what I anticipate to be udev rules changes once the base series is 
accepted. Specifically I'm suggesting the following:

  - Prevent udev from updating kdump crash kernel on hot un/plug changes.
    Add the following as the first lines to the RHEL udev rule file
    /usr/lib/udev/rules.d/98-kexec.rules:

    # The kernel handles updates to crash elfcorehdr for cpu and memory changes
    SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
    SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"

    With this changeset applied, the two rules evaluate to false for
    cpu and memory change events and thus skip the userspace
    unload-then-reload of kdump.

The above additions allow distros to deploy the udev rule immediately and work properly even if the 
base patchset isn't yet merged, or down the road, enabled/configured.

Am I missing something such that your recommendation is different than mine?

> Note: only kexec_file_load syscall will work. For kexec_load minor
> changes are required in kexec tool.

Will this be the same/similar change as I have posted, or do you envision something different?

Thanks,
eric

> 
> ---
> Changelog:
> 
> v9:
>    - Removed patch to prepare elfcorehdr crash notes for possible CPUs.
>      The patch is moved to generic patch series that introduces generic
>      infrastructure for in kernel crash update.
>    - Removed patch to pass the hotplug action type to the arch crash
>      hotplug handler function. The generic patch series has introduced
>      the hotplug action type in kimage struct.
>    - Add detail commit message for better understanding.
> 
> v8:
>    - Restrict fdt_index initialization to machine_kexec_post_load
>      it work for both kexec_load and kexec_file_load.[3/8] Laurent Dufour
> 
>    - Updated the logic to find the number of offline core. [6/8]
> 
>    - Changed the logic to find the elfcore program header to accommodate
>      future memory ranges due memory hotplug events. [8/8]
> 
> v7
>    - added a new config to configure this feature
>    - pass hotplug action type to arch specific handler
> 
> v6
>    - Added crash memory hotplug support
> 
> v5:
>    - Replace COFNIG_CRASH_HOTPLUG with CONFIG_HOTPLUG_CPU.
>    - Move fdt segment identification for kexec_load case to load path
>      instead of crash hotplug handler
>    - Keep new attribute defined under kimage_arch to track FDT segment
>      under CONFIG_HOTPLUG_CPU config.
> 
> v4:
>    - Update the logic to find the additional space needed for hotadd CPUs post
>      kexec load. Refer "[RFC v4 PATCH 4/5] powerpc/crash hp: add crash hotplug
>      support for kexec_file_load" patch to know more about the change.
>    - Fix a couple of typo.
>    - Replace pr_err to pr_info_once to warn user about memory hotplug
>      support.
>    - In crash hotplug handle exit the for loop if FDT segment is found.
> 
> v3
>    - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
>    - Rebase patche on top of https://lkml.org/lkml/2022/3/3/674 [v5]
>    - Fixed warning reported by checpatch script
> 
> v2:
>    - Use generic hotplug handler introduced by https://lkml.org/lkml/2022/2/9/1406, a
>      significant change from v1.
> 
> Sourabh Jain (6):
>    powerpc/kexec: turn some static helper functions public
>    powerpc/crash: introduce a new config option CRASH_HOTPLUG
>    powerpc/crash: add a new member to the kimage_arch struct
>    powerpc/crash: add crash CPU hotplug support
>    crash: forward memory_notify args to arch crash hotplug handler
>    powerpc/kexec: add crash memory hotplug support
> 
>   arch/powerpc/Kconfig                    |  12 +
>   arch/powerpc/include/asm/kexec.h        |  15 ++
>   arch/powerpc/include/asm/kexec_ranges.h |   1 +
>   arch/powerpc/kexec/core_64.c            | 322 ++++++++++++++++++++++++
>   arch/powerpc/kexec/elf_64.c             |  13 +-
>   arch/powerpc/kexec/file_load_64.c       | 212 ++++------------
>   arch/powerpc/kexec/ranges.c             |  85 +++++++
>   arch/x86/include/asm/kexec.h            |   2 +-
>   arch/x86/kernel/crash.c                 |   3 +-
>   include/linux/kexec.h                   |   2 +-
>   kernel/crash_core.c                     |  14 +-
>   11 files changed, 506 insertions(+), 175 deletions(-)
> 
