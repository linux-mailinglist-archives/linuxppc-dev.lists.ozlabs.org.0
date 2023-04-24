Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE36ECFEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 16:07:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4n5X35Wkz3fS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 00:07:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LCBFMqWM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QuePe4nE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4n4b4bZ5z3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 00:06:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LCBFMqWM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QuePe4nE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4n4b19t8z4xDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 00:06:55 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4n4b16ghz4xDr; Tue, 25 Apr 2023 00:06:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LCBFMqWM;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QuePe4nE;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4n4Z5Wf0z4xDH
	for <linuxppc-dev@ozlabs.org>; Tue, 25 Apr 2023 00:06:53 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OBYg6x017004;
	Mon, 24 Apr 2023 14:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=qIfocHwBrrVgmS7mlO9iIFdBsPvY6guFENpIJ+nu/j8=;
 b=LCBFMqWMCtVI8NQ43j/e3c3grmwaETKefKQvAPzxX7y99mz8z5ki8h0F+TjjyaMYts1V
 IMa6qzyoDQr1I1zWQcNKPbo1vwUsmllkBj2gOXRydtUZs35J2Y9g/b2Kc8dott92CRrd
 jCnr3nG2tXJZ5mxdPvSLyGaXBEkDpwNUka/t59ZgRV7HnRk4OH5uFdwRfLPkZ5YKhEaG
 DqLTlIw8peuVlXRyX1I9ukvm2k0QOlatW+njXWrjhlIDrYjRzATuCy1ND84mCp03hCl/
 dkbScs7hmsLp5o+KV2TBHrVd1BEbvZ2DB/NCHljVFbhvQp9zbgilgtEYExCzEaiEA41A RQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q484ujy20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 14:05:40 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 33ODRRfr032637;
	Mon, 24 Apr 2023 14:05:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3q4615aup3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 14:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wf+bk4XjQw6Pxp99kdYx2rARdj6qDnvjvjAgc/YLxP5m/HjXCJMZSe9ECKbKjcZCWQpEc9UOYYlGnhpa8egsHK7yNMqXbtlSoS4sRNplFO0t7+z4TNXuHqvZWiVLBo62tuvTDa6OaHpFYnwVl8HHNdtNoXadiDpxzBPQPT6s77jAwTmkK7TzzwhugpIO/3092XKNRLjedDcA4O17V8897/2HC0+ip/9lZPW7Z9ToUtdADHOluLSbqv4tEmKwm0FAT/CQyvTBWC8ZYImT2QVwCBoyw10bqgyBLnpfBwIhYAVq3geseuhvRU15Prm9JWGwfydoXGas1oPCMD1eAICHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIfocHwBrrVgmS7mlO9iIFdBsPvY6guFENpIJ+nu/j8=;
 b=f62tFrvXg8+oFf62dN/Lq1Thr3waEFdN64lhs9HTwqVN+PYdVESoDrGOUTxrtLUBqCYRpFJbYENgijOX6I95Kns1dZUfYyHHhd5G1qmO7tDgh7i+95iGewTsMtOHXVm31ztS4iSCw+mTrabJBywLGV6/aRXiRkf5mddTuDgHVOGBb+lxPwYnvVFxDwm+UQDfujxLYFJegcBDbRMLyQEJf663n4c7rLIF5KPQifSQyf7pA0hlKbFkwNy0QiZJqkWUWy666hMag/RkmzKYIkwehMV46gkbbQtcv7iKKjWhu7EGR5TvaSTW5/UoR4DgWD0ZUiZeqH+THafDTqkzsBxQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIfocHwBrrVgmS7mlO9iIFdBsPvY6guFENpIJ+nu/j8=;
 b=QuePe4nEj7sycw4MUdbYqsVKWdu0kbfhBh83K2feDY+aD2+KRuZ0h3ElIxjHEM31WrHTDDpU4AmHHmN89licrmW46dB/YdFe/lqVQWvCP9c1TMdxodDwRgTibtaFJwCDCym5zqrt1cenTsgwZYPTAo93uhAYnwZhku74eERISpc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB4976.namprd10.prod.outlook.com (2603:10b6:5:3a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:05:30 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Mon, 24 Apr 2023
 14:05:30 +0000
Message-ID: <9713a2e4-ac13-425f-1954-fe16ff318916@oracle.com>
Date: Mon, 24 Apr 2023 09:05:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v10 0/5] PowerPC: In-kernel handling of CPU/Memory
 hotplug/online/offline events for kdump kernel
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 941ff321-05f0-473b-7970-08db44ccf68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JUQS8aGu+dyu3ox/p2g7yyOjWQADLYrkd7aneck6BhHrrCLlN1BvUnxeiu66Ib7RZ5Whl/Xm2VsD1bADSYmHWa+pmC3rRXewxp8BPLL7tF6pr8GbuZqDnONscx/48K4rhgl5Upow+CV9XOXnLv2wasQnfeRzf5lbERm3Jrs46ZI4wJ0mj9m13RvSYu2mkLzOwVSQgu8H7TAttHJjVZ8F0ldiHwWIQpfLN2b7gktArCGMmn5MVYRFHumjM4lAcTxDTmLGJ+rNnAak9cBiFg6I2g7WO3JUPHNjTzLIXKjHoqXz5lFODFS43Fmf17ttM64dV1sVmi+qRs0vK/zT8064etBlLQS17Bp/0KtJwpVlDn9638JK/aHewm//HDIXLWSzQ4mxWPF6a5vDC7FcyTlgC4pvA9fqy6ceuJbWwkDjWUOgqyd4FjtOkABwIt4u+AlnBE4WDUpg7rJhKOy4m+Z8ajoSI48NDZfk1mhF9z3ddr3XKJDb/mFN6KdJDuYIIwCVYwOIc3NHpmNZ2ZSRn4GI8PHjKIcENCPkBMfmMjyp6kqH5rmr283d6xWwY/98WCtwiao64jolsRJkLICSBvHgn+rFKj+Gy9TnFLfJhztJxDdHy65k3lrC8Zom5HazYpuRcMBQgxcfrsNszmcXSfxcTDnshG3dkTHEXrsgJ5qS5/E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(966005)(2616005)(6666004)(6512007)(6506007)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eXZycDJoVWROL29jb3VqREFuYTF2YlJqQnMwZTdIUC8xaEhqd2x1MVRyTHJD?=
 =?utf-8?B?eTRMaWpvTXdZa3E5YlYxSWJYUGVyeEQ2c241NTNFTlhrMFdJVE5XWk9UT2Yx?=
 =?utf-8?B?aVIwbWNCN09LMzhKVHl5Z1hyS0hrQ0Zncis4dlhCYVhDRS8yOGV3MVlGK3Fq?=
 =?utf-8?B?dm14RXh1U1lJenJ0RHNwMEZqRlBhOGlHbmxEM2YyYWpwc09Ta3kwZGxIQ0p4?=
 =?utf-8?B?TEFiNEFEeXRpekNXOUFpSG5ZL3hIMjVlZnExRXB2OHc4aTNyakxSVW80TmNE?=
 =?utf-8?B?V3dLazlSWndRWGVYZkJsQjZEVDAwc0MzVlVNN3pLS3NTUGFFYzd3VEpQK1ow?=
 =?utf-8?B?VUV1bEFVbWltWFhKMlVISWY5dmF6V3B5MEhoL0FPVGhPRTdYSXVobFlYQk9Y?=
 =?utf-8?B?WmlmMHNBV1FHSjY1cnZYZklzdWdCdWJiQkx5MjFVKzdCRzRnM3htWlJCa0d6?=
 =?utf-8?B?bElBb3ZYWGJrelQ4a1k0aTdEL2pwTmJlODdSREdPRnVZTlNnNlY1QXNNQ1dF?=
 =?utf-8?B?ZHdqWTVOcDV6M3pkV3BKelppeWhyODdIRWFzaTJZeFFBRDhidHNEeXhzdHBV?=
 =?utf-8?B?N2xLNlUxSkxkdldFQnhpVm1JS01kZUhNcUpEZlQwMmFJUFJPbllTQS9ZQWZo?=
 =?utf-8?B?TGg5VlZlYTlXVC91cno1Z1p5WUtpZk8wcVlFc3EzUnpPelM3eTFzNndYNGNs?=
 =?utf-8?B?SDJOeDdoQVcwN1lGbXpscVJvcUViM0VIUjF6bk50dzlRZlJNa05YNDFEWnRZ?=
 =?utf-8?B?Yi92d1NHb2NhcjF5SlBpQjl3MlhNUHV5QVFMZ1JibUZtVktJMUhOcVR2WEJw?=
 =?utf-8?B?QjBkVnZONE85SzNhN2N2VHBzQ1R5cHNEalpBV3lnVXhPa29sMW56YURER1ov?=
 =?utf-8?B?a0tNZG04M2tDUERib3pyNGxLY1A4cjFwQW85eG11RmxRMUkrZ09Lc3Jsc01M?=
 =?utf-8?B?RjhhSWh4M2Jnc3dyS2NLcUtmKzFtN3Y1QkhTSW9DWU1ESVRpK3hRTGFzaHB2?=
 =?utf-8?B?N0VpNklWQ0V5VlloWE1iOHA5Z2N6dXp6cDh5Ympyd1NzQUxsZXE2Y3BWQnRj?=
 =?utf-8?B?eEN4V1NkRUNJRndJT2c0amZJYkw2SGtVaGdRRThJOE1HNmR2RXYxTWVmOG11?=
 =?utf-8?B?YjJLbHpWUnAvdCtzcEorWStxWnVRZFo2TzZ0d1M0UmRQYytDUzMwM3gxQ3ZR?=
 =?utf-8?B?MlgySTZDaGVCYk4zT0o2aWNzQWFYSjVmS0FxYytmS0xIdHU2VWl0OVM1S21r?=
 =?utf-8?B?cE5MNmpHZ3pRVk1Kb2tKOXhncGdjeWNmNDVlQmYzTlZEcE81aVpQYWpWUlht?=
 =?utf-8?B?S0VudTRJZTJ0MkczK1pNZExZWHAwTFZud1Jid25QZzBHdHlVaXRGUitLaGcr?=
 =?utf-8?B?VzZlbG1ucmtldnVhMmY4dCszV2ltUDFkVDAramxFb0ZJTW10ZnBvemtDUHpU?=
 =?utf-8?B?V2hKU1NiWEFkMlI4a2xMUitEdFhjWHprVE1sM1JQa0UwOVhOa2hTU3pSdHlO?=
 =?utf-8?B?MzN4V3lKZk1aVGNUMWhvTG1FenBJSm5nVm41NmVpSStKTld2MHdtYTdqMWVs?=
 =?utf-8?B?b2x2VThvRVNwZW10ZzIvM0g4NnZiSk9vN01vd0RhRXBnS1ZtU1A2V21nRGxa?=
 =?utf-8?B?VHlFa1A2UE9aMTZ3dkVSbWU5bk02NEM0d3BsSWEvNGg2dTdpZE94SGs4czll?=
 =?utf-8?B?VFhCQWJjWTU5QkFWTzc5VTQ2RlBDS0JCY2NuUng2RmEyZU9YOHhCVms3Tlli?=
 =?utf-8?B?Sk5vcUxFU0xWY1BQMWRNS0ZzNXpGNi83ejhocEJmaVIvU3FnckVnY1BabHVz?=
 =?utf-8?B?a3VDYWFPV3ZGUks0Tm1JNWpiWEQvcGFwN0I3RXUzYzlWMDlCdWRrdkxZcTBz?=
 =?utf-8?B?U0N6QkZUNDFqWjhpVDljRUt4TkpkQkFMTks3N01Xck0raU1ObkdsSTBvdE5j?=
 =?utf-8?B?TUE1RTVBYUhmR0xBUXRkOHErTVc3VWVzRUJiUDJOQW5ZTVVjQXFRV2pIcnBU?=
 =?utf-8?B?ZDZVV3RQUi9LNnNLWW16SW5KeE5lZy9qZ2NGQ2c5ZVliRi9uVElOUWh4b0tq?=
 =?utf-8?B?dXo5cWtHaWUva3VBSGdFNG9oamFLNHEzU3k4U0hNVlpBWnNJR3c2Qnh0RWd1?=
 =?utf-8?B?Z1NVNGxBQTNXTDlCUVZIdXJrZXkxTmJOZXpIOUpJQ3pvVXZKUWFyNHhDUWw3?=
 =?utf-8?Q?Yy88TvpGKt2XHiY/c5niH3k=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?S0JOUm1GRlR1UmNkQUFYOVpZZG1CdlRjVmgzcGN4U3Z1SDBYV2RNV0c0cjlS?=
 =?utf-8?B?QmM1VXZpZ0p6c1BYNlgrTHh2YmhwNUJJWS9yTEpacXAvRERFd2xnS1JBUXE5?=
 =?utf-8?B?bE1BSnI5RGVvWWZmZDhjNStaaGcxd1BsT0NBRDJTOXlPNW9oNG8ybVBvUDdl?=
 =?utf-8?B?RHNYZUZHR1lEV0lCK2ZReFp6d1Q4cFA3MmhQZG9VWEFURHg0WkVUWGs4am9r?=
 =?utf-8?B?SXdUamp2RUxPWUpxamZmMWVFbXRaSUo5WnNrOWVia0gycGV2Zk0vQ05yNkkr?=
 =?utf-8?B?anZqTVJ4Um9ma045Ly9KSW02RFl5Z2xOOHgySFAwR1g1WEgyb21TaGlnZFBi?=
 =?utf-8?B?bTRlc1BKSmlCTm9IanBIdlNaZmpla0ZTQk9UdmVuQmtRQ2lnM3VTaWRyNWhZ?=
 =?utf-8?B?cko0b1Jkc21NVlp0SXIwa1BPZ05ad0tKbVg2bFZzblpEcUhveENzNmRtS0NX?=
 =?utf-8?B?ZnN0aTNCUUJxazZORFkvQ3ozTzhiNE5HMERjaWVFeHNoOHJOVUorZjJtNUJT?=
 =?utf-8?B?T0JFV0pnWWJURXM4LytxSzZKMm0zK2k4eHZrWmtOZGkxYk8reDBCR0JIbGZS?=
 =?utf-8?B?UGxETEo4dENKMUJrdUg5bGRFUzJyUXF0amRIMVdvOU94RWlzVGoxdldsSnpB?=
 =?utf-8?B?UEM0UWhhSWZpamVzRWhtQVJIZGhYd2NzUFBBMzZHQTVZZXN2UzdSL01KVVdN?=
 =?utf-8?B?TDhDVUpLZStsNlUybkgzN2pUalN3aXNTMi8rRGRyeHBIYnlxSFFWNmRwY0tP?=
 =?utf-8?B?VVpRYmNYL0hNSUY5ZERyYXJlcDlna0RNQ09KS1c0Q2xFa0RwdzRud0IrT28x?=
 =?utf-8?B?L1gzajB2bHBEQ0xLdFdQalpFanhaUjU0NUFheGM3eVFCMVI3OEFWSEZJZ003?=
 =?utf-8?B?Rm11dHAyWFR6eEVLRTVXWEhtVTZjUnZIaHFqWlNLRk90SWFMSyt6UDVEdGlI?=
 =?utf-8?B?ZEV5UmlWS0FBOERxeEl4QVhMdUNqUWV5MmxjTzcrTy9mSm51Y3JlaFAvQnVp?=
 =?utf-8?B?dVAzck4rYmtCSnBoRjBITG8rQUhlY3NmYUlhODJPSE9iQ2pkM3VOSnhDQW5P?=
 =?utf-8?B?S09VNUROOXZXMnRseUZTVWlWVmM5aW9EUkVkWU5VYUNzMDlpOEVIU1JxODM4?=
 =?utf-8?B?VW5RbncyZmpQNENqVU5ZMGJRUHVGYXlaOTl0QkU0OGIxcW5QQTBvVzdVRmwz?=
 =?utf-8?B?K1haRm9Cbml2WW42dmdmZkNoSmV0c2l2VEpqeEJDNWdNL2FmN1dycStSWThC?=
 =?utf-8?B?a3E4c21acDV0d1lhbWZWY1MrSGdtcUpGdnVJM0FBb1plQnkyZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941ff321-05f0-473b-7970-08db44ccf68c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:05:30.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIgqm5NCKCW/k3oOZm3lvgdXtxW/fS0tNXV7phbWd0hutq0bNjM5l45nmN1d5h5wvtJYUPT0e/hMFyEPPIJhXKm0+v1q8F47ek0XukA23/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4976
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240127
X-Proofpoint-GUID: NU5niEydkZVpaQ3-JMy-KW5hPFyBV-K9
X-Proofpoint-ORIG-GUID: NU5niEydkZVpaQ3-JMy-KW5hPFyBV-K9
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



On 4/23/23 05:52, Sourabh Jain wrote:
> The Problem:
> ============
> Post CPU/Memory hot plug/unplug and online/offline events the  kernel
> holds stale information about the system. Dump collection with stale
> kdump kernel might end up in dump capture failure or an inaccurate dump
> collection.
> 
> Existing solution:
> ==================
> The existing solution to keep the kdump kernel up-to-date by monitoring
> CPU/Memory hotplug/online/offline events via udev rule and trigger a full
> kdump kernel reload for every hotplug event.
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
> Instead of reloading all kexec segments on CPU/Memory hotplug/online/offline
> event, this patch series focuses on updating only the relevant kexec segment.
> Once the kexec segments are loaded in the kernel reserved area then an
> arch-specific hotplug handler will update the relevant kexec segment based on
> hotplug event type.
> 
> Series Dependencies
> ====================
> This patch series implements the crash hotplug handler on PowerPC. The generic
> crash hotplug handler is introduced by https://lkml.org/lkml/2023/4/4/1136 patch
> series.
> 
> Git tree for testing:
> =====================
> The below git tree has this patch series applied on top of dependent patch
> series.
> https://github.com/sourabhjains/linux/tree/e21-s10
> 
> To realise the feature the kdump udev rule must updated to avoid
> reloading of kdump reload on CPU/Memory hotplug/online/offline events.
> 
>    RHEL: /usr/lib/udev/rules.d/98-kexec.rules
> 
> 	-SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
> 	-SUBSYSTEM=="memory", ACTION=="online", GOTO="kdump_reload_mem"
> 	-SUBSYSTEM=="memory", ACTION=="offline", GOTO="kdump_reload_mem"
> 	+SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
> 	+SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
> 

I didn't see in the patch series where you would have the equivalent to the following (needed for 
the sysfs crash_hotplug entries):

#ifdef CONFIG_HOTPLUG_CPU
static inline int crash_hotplug_cpu_support(void) { return 1; }
#define crash_hotplug_cpu_support crash_hotplug_cpu_support
#endif

#ifdef CONFIG_MEMORY_HOTPLUG
static inline int crash_hotplug_memory_support(void) { return 1; }
#define crash_hotplug_memory_support crash_hotplug_memory_support
#endif

> Note: only kexec_file_load syscall will work. For kexec_load minor changes are
> required in kexec tool.
> 
> ---
> Changelog:
> 
> v10:
>    - Drop the patch that adds fdt_index attribute to struct kimage_arch
>      Find the fdt segment index when needed.
>    - Added more details into commits messages.
>    - Rebased onto 6.3.0-rc5
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
> Sourabh Jain (5):
>    powerpc/kexec: turn some static helper functions public
>    powerpc/crash: introduce a new config option CRASH_HOTPLUG
>    powerpc/crash: add crash CPU hotplug support
>    crash: forward memory_notify args to arch crash hotplug handler
>    powerpc/kexec: add crash memory hotplug support
> 
>   arch/powerpc/Kconfig                    |  12 +
>   arch/powerpc/include/asm/kexec.h        |  10 +
>   arch/powerpc/include/asm/kexec_ranges.h |   1 +
>   arch/powerpc/kexec/core_64.c            | 301 ++++++++++++++++++++++++
>   arch/powerpc/kexec/elf_64.c             |  12 +-
>   arch/powerpc/kexec/file_load_64.c       | 212 ++++-------------
>   arch/powerpc/kexec/ranges.c             |  85 +++++++
>   arch/x86/include/asm/kexec.h            |   2 +-
>   arch/x86/kernel/crash.c                 |   3 +-
>   include/linux/kexec.h                   |   2 +-
>   kernel/crash_core.c                     |  14 +-
>   11 files changed, 479 insertions(+), 175 deletions(-)
> 
