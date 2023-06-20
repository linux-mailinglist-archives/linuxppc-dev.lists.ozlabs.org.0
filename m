Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A91738EE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:34:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=O3wv229u;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sjCAqDIO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXGF6tzwz3c49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:34:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=O3wv229u;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sjCAqDIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlmrK1Y45z2y9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:57:35 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KBHF0m004664;
	Tue, 20 Jun 2023 12:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=veatsC2vSVKGqQ/lD8H1WIQVL5uuJt62V+kAvc3jr/A=;
 b=O3wv229uvHNzDzhnEzKRKHsgxMe6A5SBMml8o6vm01dmxhDyHTxURS1yQXm2pPZeGSSj
 3ZkdI7p/qj8wlxEGnZJO1RUdXbNK2Vb0VVEiN6MR25OozsdJ2MFqVbCTSlEKcaFpTZgh
 teHV+7dO+zJ4JmlteG4YskEGkrlwp0f/xgy4gte+NNWTEz6Du9xxSZBhaCjRXnq7eZsT
 EIbBszz5cTUFWzsxbWMVNGYCxptVpHNCnZYyTdxdiU5PKlxv/bInOUiTEeqoFo3pGVsD
 3oYr8qknH3QDTSzNuWF+k7sfyQNw91OIYV3rcW5tjZWmxr+kTddkoqcFAyFFPUVpYl8A Bw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r938dmm22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 12:57:10 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KB3e4o038725;
	Tue, 20 Jun 2023 12:57:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r9394hgwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 12:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZDOu3EhJG95d43ZoYqguurASZJniRuIq37YRe+PkFoK0dphVZrSV9VsrRJyH3+mF+ooyaspLnjXQl3PWcC3WjFLLopooYocJxmclJ09Tf6vmUal6dGseatqx+i7UyJ8RPPmhVOG2H75UR6Bc6hKuFfJc+tMS7RHA/z15uzYHWaJMTE2M2eZYRurwWvs49UAa1KYbkxChEgKy/uAJUoIrJ4xTUFWtR+SrYqrwM53HgCnlbzLqpvL8x4XTkjvuz+bb8f6KzEpPUbyl1T9BpcWxNwkRIT0CcgP2bmZpQfUrP+T9wXlOiO744tWA6hLwP85QFjecfHeirn8Ct0D6LN91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veatsC2vSVKGqQ/lD8H1WIQVL5uuJt62V+kAvc3jr/A=;
 b=L0p/kdOkeCFZp0FWzDXlzdx8+uq1d9sxbYxFpbkVpPGLirjqY4OYNyZaCn1iaTprK4HGtDYlL5hfZXU00XY9vPm/TwMocqtfBV9sDt00/+a5jHQ2u2qOvus2b5PqDjZ69h1ZduOOg0ANTDaURfS2P8gGFikeLVCxguqSrCFq8d2XfRtCHTcgvCTpInUXqDqcgE0LH5pC+YXJr+xjLQPDE6Zc72hVSvM6Yh41oI8j8OxOTM3Ng+9XshyeClK8UlFCx18/OwO57+sf0LC+2MKFObrzZSAbMyKhpr8Jog974QidwigsbwwPp/K+j1ePggifnnfIeLUgES3wM0n6Lnv4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veatsC2vSVKGqQ/lD8H1WIQVL5uuJt62V+kAvc3jr/A=;
 b=sjCAqDIOJUU84tQdFB4Mr2S9xozSE8HZ1dasB27fexEz1b5rUmJ2s34Sgr7azBy9xxqlC/N0GGdRLoxJ3HMfG8vm6pLOpGrAHaITWNq2ym2iIRWwS6eyZsaBvOY7A17j0ChYqcTaYtViCluG3ukJPoV653VRUH+MfJapoH3aiIQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5677.namprd10.prod.outlook.com (2603:10b6:303:18e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 12:57:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:57:04 +0000
Message-ID: <ac065d02-61a4-3b1f-241d-443ede70d3f2@oracle.com>
Date: Tue, 20 Jun 2023 07:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-3-eric.devolder@oracle.com>
 <ZJFhlsFN6DxnWsQE@MiWiFi-R3L-srv>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <ZJFhlsFN6DxnWsQE@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: c338f780-a942-4197-2b90-08db718dd87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+RbUqNHhJSHoMsJiLlpDpwS0vKzWWRT0NWlBEDvTLFVQSAIHTHIMYiSmudR1p9nc1FHUlhpOFR7j4r72tuhJJBwVXHUTHbSXlL6PNWw0ksNYa+EHBPn+Yr0kIegnWxk4M+uRz600yubcpAJkbCDAuAH6E3y2MKykgDTqlr5d24fwT1z/AZGb68P3GyYgaXDpQlU5YrHbo4AuxklyEV3On+9P8GErBb4WnSvNSXETXa7OD6YIxDtIpIhx9Eof/5qKgViarIvfZSRCyLCWTeIlg76BqRN39z25DXaQudNJ3lbTgKWwl3lcrggB3dCaC2T4AAJuXYYKZP6AkOiPatJVgwEyZXy5pZqujuYHErJscmQTx0ctc22knlHPmog9yrncr/dkOr7GCJbbAUD3MYIMWgAx4hkpUh6KSCGili9Zyvf4wGJL8wykX4/uR4xB6NoJl74Sj8XCL+OdOXMxykm0B8d36I3mPsvANjXPg/YZZjmr6/IIR0bKWgiuXnu5EmrjvkjHJBX4bh+sPPo4vMAbLDpUPaBGl5J0l5zIjX6RHV4SyPIscfwiZ/HnQEV6LxT0Fwuqb/sXB8N86EqNftlZ/f0AdpFnf74k1T3funh02ky28TiELk14YSRpAEqW7PFMg4Q4InzSuyFqIEGfJIp3QA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(6666004)(6486002)(478600001)(186003)(26005)(6512007)(53546011)(36756003)(83380400001)(2616005)(86362001)(31696002)(38100700002)(6506007)(107886003)(6916009)(4326008)(66556008)(66946007)(66476007)(316002)(7366002)(31686004)(7406005)(8936002)(8676002)(5660300002)(7416002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TWxXTnRTOEJ1UEZRUnF6eThhNWlKUzhHeUJtci9SZzVzL1AyTU1OVXFEaHJv?=
 =?utf-8?B?bVN3UjhhOVM3bU5DRU4xc284MEhXNWtFbGpwZk5YV1JsQjJRZ245ZkdML25h?=
 =?utf-8?B?c2hvbitvc3JjTEdWdzVhMmY2K2p1QmxVeVpieEZtVXVNaWZnNUhCNmkzV0Ri?=
 =?utf-8?B?SnZEN2gyS3JFUHQ0TUhGbkoxV1Exd2ZHSVFTRHljcmVLSFRoQXpIcGlDMk82?=
 =?utf-8?B?YkQ3WWNtRFQ1Si9mOGhBbXhxZjVuZmhFeEZEN0YySzJ3OEQwQXpvSkFPUjh2?=
 =?utf-8?B?NDl2a3NDR2h0d3ozbzY2QVZ1Q1cwZGVmZ3lMUXBLa0hTazk3U3lXdkRlNWsz?=
 =?utf-8?B?NllkREFGeTEwYUFTeUhKS0VlQnl4WHdFSm1lYldYTkxyeWF1aThtT01ldDha?=
 =?utf-8?B?UkROZE9wVjJGR1l1TTJYMktvcHMxcUtWWVIwTXdXNnZsWnFrUkdwTUFzaDd6?=
 =?utf-8?B?emFhZHhQWUM3Z0RGQW11Y1FrVWgranBvM2JpeEV2RjZWZ3NqS3JZdEZiWk55?=
 =?utf-8?B?ZjhrR1dBejc5Z2RsOXExS21wc1RUbm5rTzZjWUo2Ry9EMHpDdVZqd0pHZUVh?=
 =?utf-8?B?U1VXZ25RVnpLN2s3cmVXZ0JoTEpqODZJUitDWCtveG9GU2RidGMwVEloRVRw?=
 =?utf-8?B?SnROalc4c2thUFFZc1E5eHZrckFlKy9CSGQybjlUQnNZMU9VU3ZNMDhHd0tG?=
 =?utf-8?B?NllVWjVhTzMyM2wrOGZHZmFRSHF4YUduZ3ZDTlVMS2tqSUhyZ2pDeXpiWGlT?=
 =?utf-8?B?eitIQ21iU0pBa25oay9xUUJPQjNzSzQrT1VmaGF0TG5JZ1U4L0ovUDRqbXZL?=
 =?utf-8?B?RUY0ejFZTjFYZXVVaHQyWjdDQ0FCU2UwNDVFUG4yd0h2MGhqN3BFWEZIS3lX?=
 =?utf-8?B?Z0JHbnNuMzJqZUZxcndtdTQvUUlzVkZDWHVRZDR3dDQ2ZGxzRW5Va2hFZzhl?=
 =?utf-8?B?ZXB0Y2VQS2tJYVptaTBtbHo1YnUvMjArYVg1RkNxUk8wcC9ENHh1QmFUYmRU?=
 =?utf-8?B?NHFVdWtzcEt3VWVzZENqZU5KUXJibWEwVStSNGgrOHBQMjliTjh1NjZ6QnZF?=
 =?utf-8?B?N3FTeXRRSmt0UGIvaWxGQmtVYjlhaEtHdGRnVmZHTWVTK05hUUhyZk9qZjRx?=
 =?utf-8?B?bGVuMGNaQ0ZPanIzTHV5MkVVSEZudW9NaEhEbzZMSWI4alpVT1cvQ0ZiNmJ4?=
 =?utf-8?B?bEs5dkJUWTllWFh3bytpR2EzZnlWNHZobXFya2lVSklqKzI3SVgwRkpqOHRW?=
 =?utf-8?B?ZUdsMElSN0dwUzVNa0x2bWNpU05UU2s0bllMcjFiTm9qQUs1TUdEdzBnUXBV?=
 =?utf-8?B?ZDRJKzI3aWo3bklYbVB3blZkMFN3a1pJU1lodmNvWlJoTGlkMmlwSGZ1UXFC?=
 =?utf-8?B?UEVTSG9EVExmL1VBRVA3TEVWNzZrUXJwVVRNcjlMeEtucDhjb0NuckJLVXM2?=
 =?utf-8?B?bG9ycVJpUjU3a0lRemkvNU1NU0p5RUhoTFdXMStzbERHK2dzVEYvUEIvOTFp?=
 =?utf-8?B?RVBJWGhxV3FYbXpWNGpxZ3ZzaU1hZHZ4bDZqb0I1RmdIejdGQkpDdDVQaFBB?=
 =?utf-8?B?akFBMk44YXd5d1QyQ0t0dnVreFpwWFl1M3dTa1o0T2gyZzVhVVlxblA1N1Q1?=
 =?utf-8?B?YlBWWHhnOE1JdDlVUDZKSE82dVV2YkFwSzRMZnNVeUFVU1VnVHRldXM2NFBL?=
 =?utf-8?B?R1NOajgwYm92OEVhaE8yczAwbFlHTDk0VU1qWVNZMVRiRUUrMDB1MVlzeHVX?=
 =?utf-8?B?bmZpaE9TYmtHS2NjWmlBV2s3citEUmZPSkozVDFCUW1iQmxHN3YxN1ZxaDFZ?=
 =?utf-8?B?ZFdJVmR2aFNncVhzdVVEMS9oaU1GWTNBbHpMM1hydWtFUHpqM1Z0bStGekJU?=
 =?utf-8?B?VzE4c1A2NTg1OXk2Wm13ZDBYbk9WWU9BNjJWbTkxZmo5UGhTb1FTZnJKTjJW?=
 =?utf-8?B?MlBOUTErZkZqbDdhSi9NQTA3M29sdWN2M2xxVWN0ZnR3V2d5blpxSm5OajNN?=
 =?utf-8?B?eEVRSWNuV2wvV1FUOEdhM0ZieEFHakdRaWdvUUpBS3ZNbzFsV0c1NjVoZFFs?=
 =?utf-8?B?UGdSU0Rod1I3SXFDNmNvaitiSzJiRUF6UU13Q2o2Zk9jUW04TGZzUGRVM0pt?=
 =?utf-8?B?NG5DWHlIQjJrTFI2TWFYQnlINElsSmZpZ1UxVGlQRDJIendzRmdzdVJMMnNJ?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?R1BWWlZUenJYRzI2WHplOHZJNEMrcWZncG5iSzdocitGNUhVVERRQVZFU3F6?=
 =?utf-8?B?SFRGaVRlRmNvSVRwS1V5MVc2RythTVlaYU10aG4xaHJGdFZ1OG05bjhhalh1?=
 =?utf-8?B?d2pEWllDUnk3dVNJVzVuYTFYbzB2dVE3QXNaeWIzY1JoRjJ2Z2pHRndZdWx2?=
 =?utf-8?B?Nzc1T2JRZml4VHAwNVFWTStFMGdrYWVrOTFPL3h0OFR6bVZaSEpDVFRnSndi?=
 =?utf-8?B?WW5TMEZqUFg4aVpHUFlLK3ZFY2VoTkJuc1JMUXpsQ1VSYjZZcGtsTXJOMlVH?=
 =?utf-8?B?RXl4cDhnSFNZWU1ndnJGY0Nrakp3UXRpc2JFb1RQNVllWmJoOWl0MVRzRXBN?=
 =?utf-8?B?VGNRdFE4VVBaVm14aHF3T0R1bzh1aGNLUkZXeEtZSzQ4d3RieUdBVXVoL1Vm?=
 =?utf-8?B?M0lzL2UyNGNEamdKbXBWV3pITGJCcWxNNFlwK1kwbVllRHVWZUJHUEJxZVRt?=
 =?utf-8?B?RkJWOU11Mk5jM0dzaXJhSUlUeHlmaUZENU0xZUtTV2I1VTlDZUdaWDM1N0Ni?=
 =?utf-8?B?VE4zZFhTQkpVang5c05LQVo5SjlRMG5jOFBhOExMcGFXbnc3cklkbSt5bCtC?=
 =?utf-8?B?RU9pQ1QrMGZTRDlQRXVZN0VaRG1oM1hTaUwrZU1JK3FUc2kwR0FKemlqd3Mx?=
 =?utf-8?B?b1Y4LzdRb3d6dFB4NHZLc0JOK3RjRGRjYzI4Zlc3OWU1K1IwUXNhWWh1R1NR?=
 =?utf-8?B?TmFNR2RNV1dMQnRJQWdrTFlMMVpjTkNCSGFYeW9VcFgvOTdmckdVU0pMUXhR?=
 =?utf-8?B?OEpML1JlZFBEeTdVajk2eUtLbzU3cnpUdG9CV0JoTGFENHh2bDJoaHhoU1lW?=
 =?utf-8?B?N2REay8wK1JaTlRDYTJOcGdXb1lCcGYxM1FmYmlPbE8zeTNvWTRJbEFwUEdC?=
 =?utf-8?B?b2hOU1UrcG1rbmlIa3dwaXo1Q2hkdzJXUVNVdDhrcjRGZ0s2QlREQ0prQmNF?=
 =?utf-8?B?eVJjZ1pYK255bjV1V1V1eWFhQi9GNWNTTEIvSWJnQVp2TUo5TmZNQmlMYmM0?=
 =?utf-8?B?Ulg3R3YzY2FHR1U1enN5RmJDd0hxM1Q2TDAyTEMxZndJbzBNMklQY2d1eERK?=
 =?utf-8?B?RXV2c2s3bjRtVXRBdjJXVGcyWjR2dFJma3BodjhzTXN0a1JyZ2p4cENrbUlx?=
 =?utf-8?B?YWtlTlZISCtYME5OQndNU3U0aFA2WHY2SFFxaGpnY3ZpRHNaS3ZhMGJWa3pU?=
 =?utf-8?B?UmNXdnNPdjdWNitrVkdCMnRSZ2Jlb3F6OVNZNmpESHNEQXBJMExidzRXbFZn?=
 =?utf-8?B?RU1QWVc1dEtiRys2dFJUMi9FNUlKNE9xVE4wREpISEM3aUtZakpJWUlLMjZE?=
 =?utf-8?B?L0JLUndlMDdtUU5TN2ZMdURSTjFTQVBQQnRBZEkrUHNWVVhlakFUVmo3MkFQ?=
 =?utf-8?B?aXpYdkNUYTRhbll6RXk0UmsvU2kvUHhQRHA4eGg0L2V2ZXZzL3U4d2tLd3Y4?=
 =?utf-8?B?UjdTVXMvZ0VCNnJ4Sk9FckU5UFltVGtoYWpYQ05EWVFQbHN0dGEwSlZsUGlB?=
 =?utf-8?B?TFJFUUVWanNhUGd1dEVXb0JybG1zb29sQjJDeHF4WHVVMTRIR2RXUjAyOVE1?=
 =?utf-8?B?QkYzS1IzNWpHR21reGhlVFJMMDdFdEJZcVc0R0QzVFB3V1ZlZEtBWlFTa0l5?=
 =?utf-8?B?T0FUZHhKb1pkb3JLeUtNeVJ1Q29RVTNycUJ0SFk0Vy9jNUEwYS84VENCTHJF?=
 =?utf-8?B?b3I0U3NNckZGZnVjT3NReUJqUXJHNGw5RDFpZEVaU2dpZWgweHlzZC9UM2E2?=
 =?utf-8?B?dDhYczVLcHF1VnAxNGJUR0xJRGIrMEd4THJqQzl4ZXIyM21lRUFPREZqcHJP?=
 =?utf-8?B?VVZvWmlQc2ZKcXdMOGhhdysxWnZjdUloR3FKUjBGcFo5VU44N1E0bWRDa1NH?=
 =?utf-8?B?OG9ORXpDd2xnb3dGUXFCci9TVlg2M1FWUFZHeXMvQmphS0NEYTJWWDFnNVdv?=
 =?utf-8?B?V2JLaU93K3dxRUQ2ZzNBVVE3S3VJMnNuUG5xUmJnVXVEaXBKblhDelNxR3ZJ?=
 =?utf-8?B?OEdyNmNzMEd6N3ZRT2xiOVNOaFY1cUNmMmVhRXBRNStqSklsRVVtWG5DajNY?=
 =?utf-8?B?eEVNUGdrZmxWMExMM1pVb3QzcmM1T09LY0hKSWVyQkptcmZ0UXpZR1VMd1Qw?=
 =?utf-8?B?STgvSXg4OXkwamh6VjE2Y2ZwR29wNWtnVDVrKzJ3NG5iRDRzbzVsM09tZHhM?=
 =?utf-8?B?NldjdW5QY3UwT3V6em9CQ3U5RVVqb1VEUmFIbWF4WXF3Y21rQTM1d3BMVnRz?=
 =?utf-8?B?L1I3M2RIZkVmUDJ0K2lNeWp6N1RjQWh4SXl5T1gwNXVvWkVEUGZIb2JNdWZW?=
 =?utf-8?B?K1NGWUxKOEprM1ZLNVd6MEQ1QkU0SW9aZFZSTWhneEhXNE1wbVhNMkxxNHZk?=
 =?utf-8?Q?D4idI1NMG0nk1DJq0KW9tGiya1Fri91DcS7wsSS9wZCa9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	SHj2eFh1eQqRtSlc7tt+kkLev04XEDOW6GqDwXrqhMHA3Yj/w+RzmIrPOUx002WJbjyNkkkjQUc8doFgNrjPdncRDrjvD+ACGMC3hSC3Eyy4pf9T96mDpWWqxBIg0kTEnubugxZsKz0pgi8YN8MPuQAIbu+Zn3hx/tbN8f+FCAsEiaQMHX+KKTv8qbkVqYKEqi/sspH3JcWdHMktUvcf7+wrXkiRs7uvw/rhZD6YB3y4EkWFe0wQtjDc3qY2vEkKVDc8kkY+U1Yvt/RfClhxE0AWjYjJ5BjH0TZKLR5ap9TbE1K1206uVLdzxCpUjjmbUTXuI+CAXTs5LFLCyBOLGebQzDcwZViWOGckyEOgu1PzyyWEqDNhaoNvfpbpIeNFrMl0sdjjolUgXBcQELToqnQmb3xs/aGJQCqmAC8Fk4Azl4VB3+7PnlNf7I9T40V8Z2eCmTkmHpu83g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c338f780-a942-4197-2b90-08db718dd87b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:57:04.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SXPBjqWFjCas0MA7wYAQnCEIdYJ9QfhxIJ52Ar4WIjquyarrwz9GvdIvNDCyBlq7ZOknIedHrdhUTekH90Cx7sHL4vB7NrTZUbjCNIMh7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_09,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=912 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306200116
X-Proofpoint-GUID: uspd2sYxZpajd9hCmMWFZoSsWWXy1Usv
X-Proofpoint-ORIG-GUID: uspd2sYxZpajd9hCmMWFZoSsWWXy1Usv
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/20/23 03:21, Baoquan He wrote:
> Hi Eric,
> 
> On 06/19/23 at 10:57am, Eric DeVolder wrote:
> ......
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool y
>>   
>> -config ARCH_HAS_KEXEC_PURGATORY
>> -	def_bool KEXEC_FILE
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> ......
>> +config ARCH_SELECTS_KEXEC_FILE
>> +	def_bool y
>>   	depends on KEXEC_FILE
>> -	help
> 
> I am a little confused about this ARCH_SELECTS_XX adding. Wondering what
> limits us defining the ARCH_SUPPORTS_KEXEC_FILE like below? I have limited
> knowledge about Kconfig, please correct me if I am wrong. Thanks in
> advance.
> 
>   +config ARCH_SUPPORTS_KEXEC_FILE
>   +	def_bool y
>    	depends on KEXEC_FILE
>    	depends on X86_64 && CRYPTO && CRYPTO_SHA256
> 

For the ARCH_SUPPORTS_ options, I chose to list the dependencies on the def_bool line to show that 
it took all those conditions to result in True.
However, as you point out, using a def_bool y and then listing them as 'depends on' works as well.
Probably would have resulted in fewer changes to the Kconfig file.
Either way is ok (the 'depends on KEXEC_FILE' is erroneous in your example).
eric


>> -
>> -	  This option makes the kexec_file_load() syscall check for a valid
>> -	  signature of the kernel image.  The image can still be loaded without
>> -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
>> -	  there's a signature that we can check, then it must be valid.
>> -
>> -	  In addition to this option, you need to enable signature
>> -	  verification for the corresponding kernel image type being
>> -	  loaded in order for this to work.
>> -
> 
