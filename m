Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F48B8376
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 01:58:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=dRmAXMM0;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y8TkkBM8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTcbB4gsrz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 09:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=dRmAXMM0;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y8TkkBM8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3243 seconds by postgrey-1.37 at boromir; Wed, 01 May 2024 09:57:32 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTcZN2fs3z3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 09:57:30 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UKTgld017528;
	Tue, 30 Apr 2024 23:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=EL/hN2kBBnpDCBhosmnxg3lDM1xxbhAS0BsL10gyA8k=;
 b=dRmAXMM066dO7yPWz1iWMf4DG015ndRPVcX6yIZB1yi3NeYkfoT/6Y91ctD0VlApGTkr
 4kF9eOKAIImXsE9drKdlCyCzFIiL+/2bEP53L79YzRdW7LXJvSYvQtD+rZAjTVHLE9tm
 fa8Pz6Kp/oHwnBPkd4lha9D0CPLTzI4kNzHOknFjzvpNl920fPzQhAeA19XxjSYlaVaf
 amyoeP+azzjRv4nvj2xnfVoF5MMotlOStyXqNxdKyavws68FcnEVlWT675icSzh/CvM5
 kR/wYjG65VKlQYkFT6abeWJ81wT9k2I77we+gU5DTgOr6urhw1O9cuBm9DgFqCFdTvyc 8A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrswvpax9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 23:02:09 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43UMAgc7005069;
	Tue, 30 Apr 2024 23:02:08 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt85fwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 23:02:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQwI9LnHQWce26XDNmjF/RFD1GyjbI2eAWUDMQzR2HJOg0/hqOZ9sufucnuNexB9cnGc+Y3ctUzks72A5+OmHvb3z01aEEo+SKH3xEn6MvdVQT3nIkPFMhj5Xvam/Z8T8gJQoqw9zVPCaEHO3J2tGwM8GRVCQCVSSfV5SbrY0KP3kfiSbENzAavdE4YDd2kkWK4ALZpsfrA/BWS2i4n+qaSUu1N+2xtb1zn5ouUc3X7awBwNKZ7yW1hxwmg8HOAoOts3CJIPb7lV3K64OKr+oylUEd0YkaWnGwSkYl3nh2lk7zCaW52bU7r0ccYy+NYhpszbCfNS7S05OFMTQPOx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL/hN2kBBnpDCBhosmnxg3lDM1xxbhAS0BsL10gyA8k=;
 b=V5MBwoD6/kzan4WL/rS7iXv1bM65Ewq0Z8o8UxY2sl7CD3NVhILSCDl6CUM3GYZjWkuKwiZidxUT4B1MrYx0e5CcC+tMvIk8IQ59zftosedHdVmo5pbXTodNjRJb8qX7HWR2h7zwa2+VIHzp97EbTugRgaklV6GL6M8Ki4//Dmhj+O6HIKCC+3MI3gKQiOLploB0o2rW40XirkgHMByhGV2CxWGA9M4BhUZRqKyR0PB+5tS/MnlBLLnwqiB9n6bvXNqhtr3LNUnEd9NhfLLBS9jMFhnvQuDiiTMXFGLvjiQv9jOmznFtZ0kmVw7SeDwPSJEea3/ZrqUvaZPJKY80zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL/hN2kBBnpDCBhosmnxg3lDM1xxbhAS0BsL10gyA8k=;
 b=y8TkkBM85Xy9ONQ4/uLb7E48uPaF9Ht/Kh0X3ZoC4uuD9qJiF7hs4A6GZfbLEba7lUyD1KY0jAeQsjdZLcNpBshtibF2VebTMtMZ32xWVDCj/7tZUO1AUZlfAAWcvHXETQsyiSV/soy+fyiSL6ADZJvk9u5lqsisRLR91+GT/Lc=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB7853.namprd10.prod.outlook.com (2603:10b6:806:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 23:01:44 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 23:01:44 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] kprobe/ftrace: bail out if ftrace was killed
In-Reply-To: <20240429212933.327aae6e@gandalf.local.home>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
 <20240429174718.1347900-1-stephen.s.brennan@oracle.com>
 <20240429212933.327aae6e@gandalf.local.home>
Date: Tue, 30 Apr 2024 16:01:43 -0700
Message-ID: <87r0emsbe0.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1c8aa0-cd97-450c-1fc7-08dc69698171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?r1K6VA0L6MsJHB0fa1/SMvct/u7qbLAcWiOWVCfhDecvfBiq/Tnk4ZZFWB8Q?=
 =?us-ascii?Q?cj+znQX6zkeSQZ1qwjRjh0t3I3EP/KVvfmjaibsEP+dlHL9simsUs3EyzSXT?=
 =?us-ascii?Q?ILz32+EEEQ3jL8AULOSdHjIToJYxfMHBmoQbnMEFCbd6LFvTEbnvcnbg8Hf3?=
 =?us-ascii?Q?JyvNBcUHsHAzTybnLpprucuO2kUPBnC75OopwGh3DIOrhU7iSmSFSOhyJ4Iy?=
 =?us-ascii?Q?RalaJb98DiMQgmZgQb93EDqmsalWhgqedrqg/+et6UNAST5hBwWQBjKhpF2I?=
 =?us-ascii?Q?tvUcCKqe9KcLeCa6Rh9sJvRGm7qTtfcq2dEttNwvw7hAr5jWffDzk3rSTSJu?=
 =?us-ascii?Q?14HWP95lN9uY6jwsE5aADA2dWpwFwV0w4mV1UErXHoQ5+e6C2Ezri7htBqbA?=
 =?us-ascii?Q?HvFk++v3+ujA7trsvQyxl3mr5yunklqIF86IOGa1hz1TRInpQCvqhKIvkdyh?=
 =?us-ascii?Q?W58MaWHcvcto+jd1CCSWCCSTrImz7PypfOHtO4xMa+YsooRlXyEXQXm2B5/b?=
 =?us-ascii?Q?Xs0cyuaxMbmcmVnU2D6x+2FioztQz1cXkfVwcBlluN0m62Z/m/kvz4yWOmFf?=
 =?us-ascii?Q?hG/2DZ07djjTD6hGNkbYa2HpYNRSDhULhiSWTRt7PE9RK3MDStOrf0b8GcRI?=
 =?us-ascii?Q?go6tFyOLOMbRX+FoJnP+Pap9psO4OPsJnK+mM68bLT4ETD6RVMTJymedeMMt?=
 =?us-ascii?Q?m8vttQiQGEY4ysR8dKCoMfrlyDVDhwigggkFHXYoCYeFVJHzgQ6YgIzDtRTF?=
 =?us-ascii?Q?G1WGMxoMtw9x9r0wuNicOUZYrNnCvQit2weEK/lFz2UIxvpEi0hzg0fbgiTC?=
 =?us-ascii?Q?m4oy5Tm2Pfdu242bOi8C2uM3lOazrDxr52mPKYH47oDb7WMuDduhvYOeQHwM?=
 =?us-ascii?Q?vl+NCVAoIjp0jhwUWMBZ3C9Z1bZ5O5S3SyDouWOe+lohorwHPO1CWf3xwO7O?=
 =?us-ascii?Q?RFla824/c6X3r5b+CgcBBTQg91delIOUN4vn6yoLyj06PU6Vlyh3HHxbJaSC?=
 =?us-ascii?Q?KEe4BXjOSdbJAjhpRUdAQBTOXWnkVIEk9jXfQswwB9FGFMgGhhuiyZbxyLfv?=
 =?us-ascii?Q?2YPBrLlsv38l3eOvfkFwuq3kkeEP91Q0hJHP63MpkR9e4trj8nLceCdMWvmI?=
 =?us-ascii?Q?Mt2Jz+r/YJI8YrGikw6ObeIl94WnwGzX61aG5xZ0pE1zg/e4sEgtm5Ug+Xj+?=
 =?us-ascii?Q?mSHXaH5XVwLhBzZVXFDFm40/NjN6tytGS0jf6f2W//kmCxyTtwJ+H7y9UwKb?=
 =?us-ascii?Q?ceTGxh6xo+lNgvyHFezpxeVX/3vUWLkhEAyBy69ZsQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pXo/huBOXaQoihrnZoR8TwBcl9H9LRDz4xSrRGZrSnOreJm4f/j4GlfZrxx/?=
 =?us-ascii?Q?Tb+GsIHeko/GIEidkYmfUCYbl3zmppV8jYsSeQEGmYym6vJQm35vRBKdqgHU?=
 =?us-ascii?Q?R6/PyolgvDIVZwaqAHMn0bkliwY6VZk7jX/muUVZupj4AoG8/94XU/+9r9wX?=
 =?us-ascii?Q?IpZA5WSarcQ4xjqB947JGyy89KW5hudxDYRzm2TtEgubIqLSUa1ZLUi69NaH?=
 =?us-ascii?Q?EO8ccoF+TetrN+gFpU1lr37AhsjgNXufs1FwIyuAY3X8Xj/EwGCllsm89LFc?=
 =?us-ascii?Q?VFJc9k9Hai8eC0odF8LzC1Y+vdJNm3BozJ4gF1W4huZnzl03MKrUVdcNIa/A?=
 =?us-ascii?Q?G3n/uK9UM5Sm3uNg5Wpoc5A1tDq2IptFAs7JWYK4rYSSrjXExJ9e12DUUh/M?=
 =?us-ascii?Q?dR+mvsBlgEqV2tfY+NcJEhGrGX1DHvBDppcqrnHXFCborrysY/XjwFXUM0a0?=
 =?us-ascii?Q?cbgJfTf4vaZ0U3T1pQNh1eHg7IJN1jH54n9siZAJ28Dp9v6ejYhXAmXOZbeW?=
 =?us-ascii?Q?t3Iw4uDwoH4U53bOcCE+Y/QiHV9iRMU6JWHmdESsHm3Q7WeZUEcaIGSnX4ZU?=
 =?us-ascii?Q?zxISLlltfZOCsaNzRxQqBXHamiF45iX9XZ+xv0fSj4xqusovABOH0cm5IP/q?=
 =?us-ascii?Q?MB7KrANI0hpHY9Y4Qa9onyVS1vhhAHe7n5PM/2vWZrlIip7fZrO/hqkNeNWu?=
 =?us-ascii?Q?cYUezi86d/nDBWgsAVBb1DeFJwQT3szwhpvl11DF8hnbG869SCCqsTe6n80k?=
 =?us-ascii?Q?AgyuPoue9qIchQ9qFfHzgZkH6E8UKMl7uoZmIH+zZ8m6BRgscyzfRvWDhyaR?=
 =?us-ascii?Q?Ok2V2pK+ZOl0wC2nWDfanmG3nVd0Zh3N7wMI3fWM+5Q7WE7DV7Fb8S2qzUgK?=
 =?us-ascii?Q?2J2bWTNA38UA7TsGEuotYc7FB+++lTa0BucBy4KmnY4f25JDDkakXzB46oNX?=
 =?us-ascii?Q?G0BLj/F4Pda/Ns7DBKtohU6gJ8ivjI+UO7y9eZRR1TwRSHMrDO+h7fHx5jgL?=
 =?us-ascii?Q?LQggmob/sDt21n88JjLdblngQYY8GipiLPre4bqwwC8dV5xZ9wHpFgd+wVht?=
 =?us-ascii?Q?Ok/kWlpV8OAjiXfNnRYyEaDZiSeVNbqqHZvlTQ6dddBzu2VYp0z2UMM2aLd3?=
 =?us-ascii?Q?ZA3YHL67c64Ey9c7qLHw9x6mPQYCgwjOcjSa/hykSslNeGt0AHt2scaUKrnc?=
 =?us-ascii?Q?mCC0pfCjhtfNcS7mPU2GcKO4NKBjh7LRWZammVsWX5kamGAnC54n6EMFQTNr?=
 =?us-ascii?Q?VZgym9z/rLswPcwbbDbJH9UUXIBIp53Jc7l8+A2iJXV07eB1FtY88RvZw/pL?=
 =?us-ascii?Q?8IqaPPwmmQNVVR458J+YPGPncOq46shPt8InLh+NkVFqMF9KHsK0bTA7h8rT?=
 =?us-ascii?Q?IoZEkdN0+3OhO6uZXRb+mvDonJhPKoG5LWWMIYDyLsmmPjwbZ8FGJPH1X6b+?=
 =?us-ascii?Q?J/ytXKuxxTlGoI7UBDOVqTPTUTUnjbXK2NFY+T0XW+8zOtNS+cmvVC8BJYhz?=
 =?us-ascii?Q?NGcHVM9MoZaE0FsnMFYF4oHVVi7l9XDQ1I2V4fYLRfLeROoLYSg44lp/nfVz?=
 =?us-ascii?Q?e7B4NJwTdBmJZQ/m8DzNtqEOXPDEZtJKAKqGI4BEbeRudqaTrJpLsUJzAuPG?=
 =?us-ascii?Q?/d4oF7Q1BQHoR/06KtihGhM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	ifUFJ7L2wQRApi6G/SvYgmyWfkEQWEqJ2mqmZvoRswNygqj0OXFXPVkG9TZPnBRDyUnAZoqd2WiD64SFFKfGX3iKZTh5jRBmGaxSy39CpdfZcvjgWPn9g1JG6k4rhZw+Iz7S1FoS2YlHuEYKeZO79Lc4naGaO+1fBnWm5WdB/UmS5SU0pH/hLnj+aw+Ct9EQ44Yf3jaD4rI6EajAHiW+8W4sNG7g7/JPZtKJ0dQejASQptqVa+6l64H3Vr/iqBBcjKENYRhERugVGLKqEI0KLfaTLPE17exHPIthtkxOK1tB3rADie+3hgCWi7gtyJyD648h0aiES62r+I7VhayPqG+vwlpkbq3Bb1qSdQfYmVlwMsaHSY11kTZC2QhM3jN1TodXqgS2hh12DP/G/kVaug0ABivTkgM5C/Qe5uoK0QVlz+Ud8bL8u6gb+z60vbCOxo/TmqQ5Jj/kUFnOFQ04PoSUmlQfvKvcK2rOYq7hTS6W6iOfRHBU+VS0UPT1YDMPSmmNUDRLkFh0u7GeJD3Uj0XMuMiOU0DaYfaQkXXXkhDCtlNQs/ze4fJ0jYiw4wvSQYyLNYfM54zlMzE+8sMRuu/TvKst/q/CbNTNXXLOJN0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1c8aa0-cd97-450c-1fc7-08dc69698171
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 23:01:44.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLWVJBuEBoY59icYc8TKxnePyI6NH9U5G/V8rNGFk7lTyXNpoeWSTQ825n75wT5STla3Gwg79dgkypgyXg5tOJb61XZk+DN5rGsSz6XI5c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7853
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_14,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404300163
X-Proofpoint-GUID: -xZPmWW_3fkgZx_8ZuMwhJyzgCUF0MJH
X-Proofpoint-ORIG-GUID: -xZPmWW_3fkgZx_8ZuMwhJyzgCUF0MJH
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-trace-kernel
 @vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt <rostedt@goodmis.org> writes:
> On Mon, 29 Apr 2024 10:47:18 -0700
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>
>> If an error happens in ftrace, ftrace_kill() will prevent disarming
>> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
>> freed, yet the kprobes will still be active, and when triggered, they
>> will use the freed memory, likely resulting in a page fault and panic.
>> 
>> This behavior can be reproduced quite easily, by creating a kprobe and
>> then triggering a ftrace_kill(). For simplicity, we can simulate an
>> ftrace error with a kernel module like [1]:
>> 
>> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
>> 
>>   sudo perf probe --add commit_creds
>>   sudo perf trace -e probe:commit_creds
>>   # In another terminal
>>   make
>>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>>   # Back to perf terminal
>>   # ctrl-c
>>   sudo perf probe --del commit_creds
>> 
>> After a short period, a page fault and panic would occur as the kprobe
>> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
>> is supposed to be used only in extreme circumstances, it is invoked in
>> FTRACE_WARN_ON() and so there are many places where an unexpected bug
>> could be triggered, yet the system may continue operating, possibly
>> without the administrator noticing. If ftrace_kill() does not panic the
>> system, then we should do everything we can to continue operating,
>> rather than leave a ticking time bomb.
>> 
>> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> ---
>> Difference from v1: removed both existing declarations of ftrace_is_dead()
>> from kernel/trace/trace.h.
>> 
>>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>>  arch/parisc/kernel/ftrace.c          | 3 +++
>>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>>  arch/s390/kernel/ftrace.c            | 3 +++
>>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>>  include/linux/ftrace.h               | 2 ++
>>  kernel/trace/trace.h                 | 2 --
>>  9 files changed, 23 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
>> index 834cffcfbce3..3931bf9f707b 100644
>> --- a/arch/csky/kernel/probes/ftrace.c
>> +++ b/arch/csky/kernel/probes/ftrace.c
>> @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	struct pt_regs *regs;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
>> index 73858c9029cc..82c952cb5be0 100644
>> --- a/arch/loongarch/kernel/ftrace_dyn.c
>> +++ b/arch/loongarch/kernel/ftrace_dyn.c
>> @@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	struct kprobe_ctlblk *kcb;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
>> index 621a4b386ae4..3660834f54c3 100644
>> --- a/arch/parisc/kernel/ftrace.c
>> +++ b/arch/parisc/kernel/ftrace.c
>> @@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
>> index 072ebe7f290b..85eb55aa1457 100644
>> --- a/arch/powerpc/kernel/kprobes-ftrace.c
>> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
>> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>>  	struct pt_regs *regs;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(nip, parent_nip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
>> index 7142ec42e889..8814fbe4c888 100644
>> --- a/arch/riscv/kernel/probes/ftrace.c
>> +++ b/arch/riscv/kernel/probes/ftrace.c
>> @@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
>> index c46381ea04ec..ccbe8ccf945b 100644
>> --- a/arch/s390/kernel/ftrace.c
>> +++ b/arch/s390/kernel/ftrace.c
>> @@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe *p;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
>> index dd2ec14adb77..c73f9ab7ff50 100644
>> --- a/arch/x86/kernel/kprobes/ftrace.c
>> +++ b/arch/x86/kernel/kprobes/ftrace.c
>> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>>  	struct kprobe_ctlblk *kcb;
>>  	int bit;
>>  
>> +	if (unlikely(ftrace_is_dead()))
>> +		return;
>> +
>>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>>  	if (bit < 0)
>>  		return;
>> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
>> index 54d53f345d14..ba83e99c1fbe 100644
>> --- a/include/linux/ftrace.h
>> +++ b/include/linux/ftrace.h
>> @@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
>>  #define register_ftrace_function(ops) ({ 0; })
>>  #define unregister_ftrace_function(ops) ({ 0; })
>>  static inline void ftrace_kill(void) { }
>> +static inline int ftrace_is_dead(void) { return 0; }
>>  static inline void ftrace_free_init_mem(void) { }
>>  static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
>>  static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
>> @@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
>>  
>>  /* totally disable ftrace - can not re-enable after this */
>>  void ftrace_kill(void);
>> +int ftrace_is_dead(void);
>>  
>>  static inline void tracer_disable(void)
>>  {
>> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
>> index 64450615ca0c..70a37ee41813 100644
>> --- a/kernel/trace/trace.h
>> +++ b/kernel/trace/trace.h
>> @@ -1026,7 +1026,6 @@ static inline int ftrace_trace_task(struct trace_array *tr)
>>  	return this_cpu_read(tr->array_buffer.data->ftrace_ignore_pid) !=
>>  		FTRACE_PID_IGNORE;
>>  }
>> -extern int ftrace_is_dead(void);
>
> Honestly I rather not expose this function outside of the tracing
> infrastructure. Instead, we should have a kprobe_ftrace_kill() function,
> and have ftrace_kill() call that.
>
> Then kprobe_ftrace_kill() can set its own variable that is exposed to all
> these functions and they can test that instead of adding the extra overhead
> in the fast path of a function call to ftrace_is_dead()
>
> extern bool kprobes_ftrace_disabled __read_mostly;
>
> void kprobe_ftrace_kill(void)
> {
> 	kprobes_ftrace_disabled = true;
> }
>
> And you can then replace all these with:
>
> 	if (kprobes_ftrace_disabled)
> 		return;
>
> Which is faster.

Thanks, that does make a lot more sense. It's faster, and doesn't
involve exporting that function. I'll go ahead and use this approach.

Thanks,
Stephen
