Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8461692E3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDHFJ5zp6z3frH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 15:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=plKHewvC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=b/6citxO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=tom.saeger@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=plKHewvC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=b/6citxO;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD4mL3M0wz3f5w
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 07:17:53 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31AHwiHJ005562;
	Fri, 10 Feb 2023 20:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=IoNI4TdnjHbJa0KX8fml/bNacgTZvDQCEnCdDB3uHrA=;
 b=plKHewvCazTfjfGfGye8aJesPyTCtAdHIHshUbpIOP9qbQ8X+9K3cAoB8Nb5iO5/uw5L
 X1LpioAml/odRs4b7iwDbuWxLF7b9P7expxHGev+Fv7Hn9WkDlUT2xWkxQ3F1VmKzV7A
 gueQWAsc66JiPDDdT1L/W9l8zCCO6VxHPUDYbV1vTVeLpYglGyUA7UbYFC4LeObjQ6Fy
 loVTy7ThzgVNMa9RXVBOymd8BbmBXQCZFPv2tLO74A5DQsZJi8xbQANl6HSmKPC7IX9d
 sYy0M7kxZfX2QNvqNX37X9YM8xa8WCTvDd01nv7yzvrxHOUB59XLUZ0+4pauKPj4DOxY sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53p6ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:17:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31AJxX5g015199;
	Fri, 10 Feb 2023 20:17:34 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3njrbf8n6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 20:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia3Dm7r4QBWRBlAi0msk0znoukx2XlMzedovt+U5h7TaZvwjnNDh6GxWCayfkDNfNlGkCKShhmVRNGI8N2mWvKKWnYruTCY4KQKKm7uem68H7wdRdWqMRr9ZrvpzopbSDGfCaY7GhdC2u9LftJEm2/Eu/UuwYDxODKiVbcPUD62G4p9ioip2hFeh/StJB43W26KFHIfwhzxk/k/Px57lXBQ0iGGZwADB6HL48Mt0bL+TLHkudTI3HzwEohKxRTubQmhOjHqcgidAWy9LKC9tMcvfaaV+hhx7YiAF1Fipa10PniXOfUQ0uNJlhvumehHOEm1raC2dFS7pqOmo6s7R3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoNI4TdnjHbJa0KX8fml/bNacgTZvDQCEnCdDB3uHrA=;
 b=hLs4LvMhBdiZE8FWKKrBbDRSMwDxM7C1c3yf0zwdECmMDyIIOCKtepdIPAAOgtfOsyhY3akbnpU6Go1TrIXdD0qyHV33kUf7FrM2qGUuU0DGBtIj+b5V9JsIGxP7LvI7CHHcQ0en+m9YcHske3lRJV9bbDpmXlb84DiLFAgJcNMMDe4gC2MMIEczrozp3pshOMkBTVQMUpo+M55hQsfGEFnVpLfmrmefOcB+Fs/IIXDv4xFV1WpRJnzcbLn1kEf4tUTZliqNdhJ2vbT+o/d2x+tUhxXm+FsRPwHHY8puYq/Jx93Xekd8NINd9bxxol2xQkUuvFPDWCTBPg+QJC5cZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoNI4TdnjHbJa0KX8fml/bNacgTZvDQCEnCdDB3uHrA=;
 b=b/6citxO0P+cOgBbyR24QFMySNlFuZqsYkLyVlmxg9J8owrP0EJYCmLEs5+P5MpmdSFxI51aoCXR2evVng3AgObzpyGnobfS2DlrVME0yoEhvwR8onkyjskpBOqZRu90RbdL8FKaAczqxEGtD0L0C0cFNHENIKUOe0SJWBxoCms=
Received: from BY5PR10MB3794.namprd10.prod.outlook.com (2603:10b6:a03:1b2::30)
 by SA3PR10MB7093.namprd10.prod.outlook.com (2603:10b6:806:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.7; Fri, 10 Feb
 2023 20:17:32 +0000
Received: from BY5PR10MB3794.namprd10.prod.outlook.com
 ([fe80::f37e:ad45:7d9e:d84d]) by BY5PR10MB3794.namprd10.prod.outlook.com
 ([fe80::f37e:ad45:7d9e:d84d%6]) with mapi id 15.20.6111.006; Fri, 10 Feb 2023
 20:17:32 +0000
From: Tom Saeger <tom.saeger@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6.1 v2 1/7] riscv: remove special treatment for the link order of head.o
Date: Fri, 10 Feb 2023 13:17:16 -0700
Message-Id: <20230210-tsaeger-upstream-linux-6-1-y-v2-1-3689d04e29fc@oracle.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
References: <20230210-tsaeger-upstream-linux-6-1-y-v2-0-3689d04e29fc@oracle.com>
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:806:23::35) To BY5PR10MB3794.namprd10.prod.outlook.com
 (2603:10b6:a03:1b2::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3794:EE_|SA3PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 151d1994-5283-4df6-46d8-08db0ba3d749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ivG52g4EreSCCf5Bw7pY1N995yLo3q/rIrS9a/KaEGswmSjqWlnsIxj37pleWh27OIzAwAY9PLDzgKEh9HR89zgG7l8V7k4E01jJPKFKX4aoCKLHHsrOQihx/B9jRSF+IP6MyQsf7VyoRzIeT9D6nNGNW8VGR02Uj/EGuEfTkaWevh1KLD7i8lCdmZa1tpozxMdDGpkDP6LMogXmxxvIvU2OymgSQrMolwhp8C/wz2xMYTBmLrWz8zUbfl+L+R980NluLhjPNOrMS86yPwu23AuI545sgbgklF6my4VUQ9fTiE3fVkWOvepH3cNxbldezz1JdST7r36nLdIsvT4Vi87eQlScSs9//a+GrT011hpqOv0SyDXk8OcGw8HRVIqvcpwbw1jVWu/P0oL8exFWtkvOoiOyKNg58N++RIkGx3h7iGk9jwsmU3SvDnaVuCDg/0QDl/KORGcY+uW0AU+ATsSNTHL7Dx/2VV8IexkgBBI6U+chc+2KKoxOF7WolCOqoZmIZ+zH7zxLRR/lrAlPkLuaUUOTDAL5H2aReFWvts029ny4C7o5QEVlk8SBjaWNUtLYsJGoRnLFiNaHeZ1axGE2dLewu31szMnFGI/fVl6fVmgmL3X/VFSJ+EHs8yoS7UjRsl6o8B3s+RJ+UHDYwWYYvi7jljQmh6hQRwA1Cn0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3794.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199018)(44832011)(6506007)(5660300002)(7416002)(186003)(6512007)(8936002)(36756003)(83380400001)(86362001)(38100700002)(2616005)(2906002)(316002)(54906003)(6486002)(966005)(478600001)(41300700001)(6666004)(66476007)(4326008)(66946007)(8676002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WHdhV25iTW9xdUg0R0hLTTRQLzFTYVZ2R0hUcU9tR0l2b0MrSWcxc3hRT2hG?=
 =?utf-8?B?RG1rdDhNTjAzVkJXcjBkSEd2VTVGT0FRN2ZjZVZlZW84TzhYaktxb0Qwc1VJ?=
 =?utf-8?B?R1dXMkNpUzhNRklYdFp0MXNDbklLd1BZQks3eFJwNi9NSzdUc1g1cENzMjY1?=
 =?utf-8?B?cno4eVhwMjdFa25HN3hUVEY4ZjltTkU4M3ZBRnRpU25tQjNkNlRtNzRPSHZn?=
 =?utf-8?B?NUdDTGtMSkpOam9hYlRtN1JiMytNL1BGWEN2am9GNmd4VThRZkx0YlpqOGU3?=
 =?utf-8?B?RHVDdUFoaUhMTDFsWVM5M0pHd1Z5ZURkbDdITnFkU3pkMVRuVWJicDRYVmlI?=
 =?utf-8?B?OFVTMTVGTE9jRThJSzBtaHhYbE40cTdRcnNMRTdzSGZnOGFmUUlhMC8rVXNs?=
 =?utf-8?B?eko2TnFVS3JPelpHN2h0Y04rVjhzMVFhaG1DUnhqQ01DMlpiQ2hmTHFpRnRr?=
 =?utf-8?B?YmdYSy9nSWM1c2FDdDFnUVV0cFMwMUM2TXM2TFJHVGZ5dUFCa1M1MXdUOFNv?=
 =?utf-8?B?ZnBoQWpVOTFkTEgwVmFqMHduaUh6MlJ3c01KcHRxN3RDZTRJc1ZJVStyeXVp?=
 =?utf-8?B?Qk52UWQwUTNaT2FXb0VWS09HYjRocWZ6RXFIb3lzS2JnT3cwbUV5Z3BVejM0?=
 =?utf-8?B?RmNSQnVBM1UvRFZUbnhpOFc4eEwrWWs2dVdVZC9NdmpyeDdVdTYxQkpvWjJq?=
 =?utf-8?B?N3BERkdmR1VsRmVoV3N4V3FHazdGR3ZNaHJUT1RFRFp2aHhLQ0JtZUc5UXRN?=
 =?utf-8?B?WkF2NDRoTFV4UkgvTXNSd3hhVjJaYkl2U3FIZklpMHF6TVIvUDdObDhPa1VJ?=
 =?utf-8?B?bVp3SUN2YXRXZ0dlU2hpMnllVGluWlpxOUNPMEd0a1RBZWcwQkFWcFBMRkhw?=
 =?utf-8?B?dm01d21xRWVCMEYzeFh2TGpsdlVZZkpSd1pSaG1kc1hRaTFMODJRK3RIRUR6?=
 =?utf-8?B?N3h0YXR5UUlJdzZRdlFURjgrZjNSeG1nVzQ4ZnVLYWRNckdWZjVwVnJMdWQw?=
 =?utf-8?B?bHhlU25TK05IS3pMYWpMY0lYZHZiN2xsRnMzUDRBWC9ydGRaNnkrbDhDY0xS?=
 =?utf-8?B?bkF5RjYxY2Q2dnJGc1RsTXBFdXRWcVhUL1AzY21NTnpjaU9lNlNoQ1FpNk5k?=
 =?utf-8?B?RzQ4L3QzbXZBelpGR0lZRmNYZ0tyZ2YrbWkrUlUwN08vMVR4WUNXaGUrZjFv?=
 =?utf-8?B?bkp5TWhKa05YbEZpZlNTbW5VVVVlRXZYVndlMnlTa2hhVnB6ZlNQZVdsQis3?=
 =?utf-8?B?NGpwMmYwYjk0aEZxNm9rQ1pyWmJjR0FSdVNZWFVBNFBDYnRHUncxd01UOGVs?=
 =?utf-8?B?cVBxSlR2L2pCenpMcElteWQzYTFteVNPaUxkbWZqMTNodHlLaXNmQWc4MmJq?=
 =?utf-8?B?Vno0TkdoVTF4VGFCS0V3RW9rS1ZOeTZvUlFPOXd5ajhOY2tOdGdMVjI5YTJQ?=
 =?utf-8?B?R09uRVVESkZFN1RhR201WDJRMHd3MFBJZytwUjlSYWZkemI3MzdabUtJZWxq?=
 =?utf-8?B?ZitUazhVNnRkME5rTFpuU2IybUV5bWUwamhEVHVpem5RMGFWbEV1WW90MmZP?=
 =?utf-8?B?TkNkeHBldk5TL1MwRm5yeXNyMGxnSjVrK3lvMHpXTVFoZFdXZGZhUWpqNk1u?=
 =?utf-8?B?VmtjVXh3RDN4cXVOcG80c3ZtcnNsbWxnSmFwYWN3eFRXNU9FbWNqQWxWa3NC?=
 =?utf-8?B?dkloNTkzbmMyeXJjYS9oRnB6SnVnbkhDYWFVR2loTnkwZnhJVk9OdnhjQ0lt?=
 =?utf-8?B?TkViczZRS2g4b0Flajh2VkhMNG5zelVzcDZJNEJJYVk5TXR4Q3ZFZjRnSXA4?=
 =?utf-8?B?blNKSkgwRlNBZ2hsbERSVmRPdytWQzV2UDNrN0lNUVlId0JTZHJBQUsyTzFI?=
 =?utf-8?B?bisxVTNHL1RNcDhVemwwa3NoZGdSNFV3YXNMcHdyY1FhYTRmRXd4SXNJU0Fz?=
 =?utf-8?B?VXJ0N2lZTDZ6QUU3ODFUWllod3RlLzFWVGJsbVpiV2dTVnJ0RitwRFRxOEZP?=
 =?utf-8?B?RGhlUW15VmR2WjRuYkZGa0NGYjF0Qll4eWpackk1RWswcGZLZWZ4NG5sbThT?=
 =?utf-8?B?WGkvNnNLZUlzOTBidWhjZDhMb2Z3VTRJa3FYUmxoNzl3eHgvNzlmVWNscDRR?=
 =?utf-8?B?NjVBT1hPR2NNNmc4ZjNZbWVnZGU2UE5HUkVhL3RHSmpXNVpPam9iV2VRQ00x?=
 =?utf-8?Q?vzjtaTT1EpMSVNKkQ1JY5yc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?SVlkSUE3cFdUSHJmRXRZZWFabGcxTlZsK0IzSFppR1ZRclgxZUxKdktsMFhI?=
 =?utf-8?B?V05VTGIxNVA0akVUMVlKUE1mVmhpSkl2TkRjY3JMSnhJOGV1TXFPbHZ0bUww?=
 =?utf-8?B?d05XczloWFY5UGxLKy9yZVpXajdjNVRmalRDT3psWWxuT0Z4b29XOVNMNFZl?=
 =?utf-8?B?OFRVaTluNklxSU5Hdmtrd3N3SUlKaUZNekxCSmdXUlErUWRQYWMyUU9xaXZz?=
 =?utf-8?B?MU42NlZNQzFCaTFMVG5vaTNRZXFxbjc5ZzJ2aXIreExOVTJLcmR3V2NQdU11?=
 =?utf-8?B?bUJ1NStVb2d5ZDlqQVQvT3ByOFdoQlVtKzlqTlJRRk1MWE9aMktwZ05EMkhD?=
 =?utf-8?B?WXBrTXNrZ3cyZ2MvSU13Nk5ZSkdzamJOU2hXamJVZUEzWVZQN1RtT2NzMHlN?=
 =?utf-8?B?amNiQU5LY0NBSDFCTzdiNjFnZk1uMmNVKzN2Y2UwUVM5dS9ZZklXakJ0RkNz?=
 =?utf-8?B?OFFCdUNuZFllY1o2Yy9hTTFNRWI2aklpVjNLYnBZdW9uUzlPWFUxY2dkTkhp?=
 =?utf-8?B?VHQ5YnU0NndtQWJpMUFuKzBhN3FnQlRDOWY0bGlZRlgxM1JPcnlTZ0dCa01I?=
 =?utf-8?B?eW4xRm0rUmF6TDNkSG9aZjVMVERlUmtrY3A0R2pVemMzNVlYd3Y4aVZCd2pt?=
 =?utf-8?B?ZWxjNzMydzNOdnNKT3lOYjlhY2JtTUhIaE0zZ1MzUDZGd1h4TGxzZy9GUzAz?=
 =?utf-8?B?Z1dEMnI2eWRuc2R4emxYdEU1S3EyQVlQNnVVNkpIQldqR3Q4Ry9tSFFseUh0?=
 =?utf-8?B?TE1UV3RaL21MWHJzN1hjZVlLR2tKUVlhZnpFRjZGdktidHMwYVVPNUdQRUpZ?=
 =?utf-8?B?RHNSK2N1WExrYk42NHlMaytwajRqVm5LY2kwN0pQbVE2NDh4bSt6bm9SVUVn?=
 =?utf-8?B?VnllZStqQUdKRmxiUndDTi9UNXN6SDRqQkNYQ0hTc3ZyZDVRVlYzQUsweW4z?=
 =?utf-8?B?Q0Zpakx4bzdrZk9FVzR0S1NVUkJzZ3d6bEdhMjlVWVNGU05tc0FXWWRHbm5q?=
 =?utf-8?B?RzQxbVpIZVBsaU9HSmhxTzBEZEFjUE51SE5VeU1FdTNUay9wek5JYkc3ZmM1?=
 =?utf-8?B?TnBVclY2VnZtQndpWjlidDJlRFpsbzNxRUM3MUtZUXFCblFUMENpZHhSdzRF?=
 =?utf-8?B?VGZXekdFaGc2eWd4OGJSbTJHRnphODJjd0dadmprYkpmdW9PVzVGajU5QURU?=
 =?utf-8?B?YUpRTW1QbzNhczhrMWtlRzVDbVBUMFJYUnFrRCthOExNNWxlWGxDMXNxN2dW?=
 =?utf-8?B?SEthTXo3RXUyVVczTDkxQXZ2WEdLM1lSUGpkMWdjOGRQNTdMbFpWQXNrTW5q?=
 =?utf-8?B?T1RYdVp2SWp1Mmc5ZFVyS1FOMFl4NHorNUVTcis2ZHZMQzdHa0dUWElESFRF?=
 =?utf-8?B?UElPRStGMkcxY1A5bTlLYlA3WS91QW5TTm92aGd2bGlCbVYzYjB0NnBlV2cz?=
 =?utf-8?B?ZkJ6amN6emVDWDRGaFpjVUFjaDcrOGY3OG03YkQzZ2V3eUdVRWZZVloydERx?=
 =?utf-8?B?R0VjWDhaazB4T1lLZUlVTGdMU1JuejJ4VUM1bmlMdDh2b0F2SlBzc2o0eGty?=
 =?utf-8?Q?fHT8+DdnT6AiKcrFT11MyN8OUqsiJ8RPgr38S0GUeaIFCK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151d1994-5283-4df6-46d8-08db0ba3d749
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3794.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 20:17:32.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUDTiZvqE54v3kwnwhHrUgiI5pZ/6bjkJDTzZi2K1P5ab0UnO0Tbpk0ouUqZulSfIbmEmXjef93b0rw79YE+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100172
X-Proofpoint-ORIG-GUID: VJJEde0bV8RO-iVlHJ7Ssau9QM8RL0MY
X-Proofpoint-GUID: VJJEde0bV8RO-iVlHJ7Ssau9QM8RL0MY
X-Mailman-Approved-At: Sat, 11 Feb 2023 14:54:09 +1100
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arch@vger.kernel.org, Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, Tom Saeger <tom.saeger@oracle.com>, Dennis Gilmore <dennis@ausil.us>, linux-s390@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, linux-riscv@lists.infradead.org, stable@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jisheng Zhang <jszhang@kernel.org>

commit 2348e6bf44213c5f447ff698e43c089185241ed7 upstream.

arch/riscv/kernel/head.o does not need any special treatment - the only
requirement is the ".head.text" section must be placed before the
normal ".text" section.

The linker script does the right thing to do. The build system does
not need to manipulate the link order of head.o.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/r/20221018141200.1040-1-jszhang@kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Tom Saeger <tom.saeger@oracle.com>
---
 scripts/head-object-list.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index b16326a92c45..105ea7ac4751 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -39,7 +39,6 @@ arch/powerpc/kernel/entry_64.o
 arch/powerpc/kernel/fpu.o
 arch/powerpc/kernel/vector.o
 arch/powerpc/kernel/prom_init.o
-arch/riscv/kernel/head.o
 arch/s390/kernel/head64.o
 arch/sh/kernel/head_32.o
 arch/sparc/kernel/head_32.o

-- 
2.39.1

