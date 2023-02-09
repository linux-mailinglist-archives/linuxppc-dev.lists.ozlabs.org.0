Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7B690918
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 13:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCGjt155zz3f4q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 23:42:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=H8d83i0o;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ckhaB4xr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=alok.a.tiwari@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=H8d83i0o;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ckhaB4xr;
	dkim-atps=neutral
X-Greylist: delayed 7421 seconds by postgrey-1.36 at boromir; Thu, 09 Feb 2023 23:42:05 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCGhs6mDpz3chB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 23:42:04 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3197PrvX016218;
	Thu, 9 Feb 2023 10:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Hggi4LwdcrgUWlCD67Az8vHX+a4hRENvO/jCl4e4Yh0=;
 b=H8d83i0oKf920jPTxRLutGxRUn0GdrO0dGfWy3jKuYjmJ1YGeflu1GJhfcvtfBxD9+Q2
 xu/pke7uPcbO8oXL+oq3cfp+foPxRl1iBKeSfdxbZKgHfq+7G1iBSfQ9DALVyCCa4oVa
 DnnygfeerziNamJ7E6lMTu7LUGLruTZS1U5SG6nUPcF5fiQpVN33U3rLVNLa4Mv/NAtm
 QgZNvZ8S5838WcXxH3tekoZlRpMtEWxkvwuxqY9QUlt3Vp6G2Ndui2VadFbUx/phZZ7y
 tePEgKpDGodXSkj9UYP7xyrTLmrerjvBo7Wz2IKyJ7QhqIfmP2VAXRpzkgRV+xgUrsV0 rg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe9njdpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Feb 2023 10:38:04 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 3198kYE6028369;
	Thu, 9 Feb 2023 10:38:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nhdtf5b3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Feb 2023 10:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnJGFP1Tv5oDvZUVyF/5DcQEunywszzGOlEMOd20QWM5iOONKh2lXqciojS4tRVQts3dsQJcpMQgszOmHn41YsI/U4RkqPSK0WSkpLnjThSpKOYc4+60sfr69p2N6EFDkQiiTUzDyjwhZEQ1wi899wVGvI/YNtJoul3IbTpgH0AiPqxXR1bgcUQIhql/Jm4w1Kl+/PqyUN2VtI7SNNJbgMddM6NuQafGQ2n5nSGwnbP9dtx9IW9ST3NuncvOIqzVb1gBZ2QsBYMIOH7GHlzCiwcZlbVv9MR6vx8AlO3xpyWUf+z2iBO6ubtfdxv0AzBJVFtV0vw8K8AEcVRFwWIPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hggi4LwdcrgUWlCD67Az8vHX+a4hRENvO/jCl4e4Yh0=;
 b=i+cx4Q9iv0X8kXffSoGwfsI/hzdAtreH1YiyPT4ey2KahQXPZ4JG875fWU+dN9peSmDg1xUdXqkHtUx1GkSCp/gIj7G+oDPbg93BhUgEtzBU6TRWSe5YmPNI3S+BZ+8xYFVBxYoZ4CMkepNTrvC0hS85Ty+XnSP1q+vyfjIInhnQGz/ntf3TpXyntJECaloOYPFZPQ4YM0gwFDhATnGbYEX3FcWKcol1LDLDXUYvlQHb05vF+jHvz96d4/yEEGMjZRo/VbPBZ25xYxayFIH+DMNq1IfX1NC9yh93LTvYxOtnYSGMjpJQVXfJ2c/VP7UrPNFxJf6EZ7YTgi6t3hRg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hggi4LwdcrgUWlCD67Az8vHX+a4hRENvO/jCl4e4Yh0=;
 b=ckhaB4xrIEWIlo1Eb6UERcadiO8jy3oeQ5byvEhh7m25m2krmN1SHBADxjf9ld8r9Chf1WEPglTGwuiGtnquHZQyfnfMzrDqPufcLL/5JFkq5N5/aztKZOeeQAtUKX1Z6+/IpwovIz0Rk7yowpBaCUuK/yMyy5MJeYTL7fL1PBw=
Received: from PH0PR10MB4581.namprd10.prod.outlook.com (2603:10b6:510:42::16)
 by MN2PR10MB4207.namprd10.prod.outlook.com (2603:10b6:208:198::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 10:38:01 +0000
Received: from PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a]) by PH0PR10MB4581.namprd10.prod.outlook.com
 ([fe80::9013:b768:5177:564a%6]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 10:38:00 +0000
Message-ID: <46998ff6-bb1c-528a-a135-e492dd0a2cdc@oracle.com>
Date: Thu, 9 Feb 2023 16:07:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
To: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <frank.li@nxp.com>
References: <20230208222311.GA2490083@bhelgaas>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230208222311.GA2490083@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PH0PR10MB4581.namprd10.prod.outlook.com
 (2603:10b6:510:42::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4581:EE_|MN2PR10MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bbaeb9-2863-4a43-152d-08db0a89b750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	E82bcPC1R/F7a04df2hWp/PoCB9R04OIvv/Bzwd9V3HuqnUBr3rnB/TAZI4RHRSG1/OTJtuUSYFlWKi83K+Rl5D00l6HlNyiCwQvgglzQi8sidWX+UP2vJMY7XM0FpMbxXTwx3M1a34lW4EEi+oVd9x+m21wXTxRwUhOGX+2JImUlpOmaDStqk4ERCS6AXKhEGRNdO6N4Rc6on6a8MVh9KpLkyndCV5yrMqVMp675Z49q+SW1ZFc7sr1e9fn0l2t6pkrkDhWr8gz8MBRWFzQenFpJjaDtYrrL9j2b4lR7hsz3EYDBWGmRjIAFrnzmdMcmHjQPwJfbAaVRdbxjDln1zdb2JxG1f+rTzF7bhcyzmy+sfKez21meMdFFmtbl+I/YZPZoTlGuiIs/yMzLSviy9grr2OR1xBJrd/LihzaOy4oEidRlZSeFSKb+vtqz8kgG40WX0mz9/rnvoyHMkhVoLWD3rRgc04ODx0td/cjMCM5YBdmJBWuMDpMYnAksntqxdp6X7MOm74yEbpLkSZGDD71SHTIf+x0KlUY3HxPXDra8m6oeQTxg7Tr7nlPc5Qsd07jItMRHZctkl0OcyzDsTCeANcLMSSVmhAs+jXJTv55RT2fvrf1KLnNV57k1i5+2WAKlkp0VKF5MtPVWh8XOJ0la0Um4gS3QXlOk1e+3QIHDmRaA6slTbu+8sLc7IuCEjyNjKq4xqodMzbzuW08fHlgIlBqQCd1BjQnd+ITsXU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4581.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199018)(2616005)(6666004)(2906002)(38100700002)(53546011)(6506007)(6486002)(31696002)(186003)(26005)(478600001)(6512007)(31686004)(36916002)(5660300002)(7416002)(8936002)(316002)(41300700001)(86362001)(54906003)(4326008)(66946007)(66556008)(8676002)(66476007)(110136005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RHNJcEVZZHhhQmhOS0hWUy93SHpGSGZNQ1FpaWI5aytxVzlnUlppSnBkSk5S?=
 =?utf-8?B?czk1RGtJcEp6MlU0M2QzbFpTdzJpZXFseGh1OHJiTE9wNERmaWdXeG84TTVt?=
 =?utf-8?B?VDNQZ2tkQUJ5L0dvUE1GcjZ4UzNrVmxia3pEMWRpYWs0ZDJ0REJsRTdJVERU?=
 =?utf-8?B?NkRsVnpOQ2tDMWtXdGgzb3BvMmxKZTF6MFJWNjlIWWVXM29hdTgzWTU2cm56?=
 =?utf-8?B?R3RRVlkrbXFXZnFQRFo2eHBwRFBNRnNHOThTNklCaWRFQ2tlbFpvNTl4K3Bo?=
 =?utf-8?B?KzU3UTFMTHFKK1BBVjlkWEM1ZmxZSHVGcENTTUw0b2E0bkJxbjJaWGNKWGVV?=
 =?utf-8?B?NDN0eUxPNEZHQmZ1UnhqUW12eXlTSG16NUxIaEtMQllmZVlBV1dWcTMzZU1V?=
 =?utf-8?B?bFhlTEcvSk5BNzhsd0NqdkVyN2R0Yml6blI4NExvcSs5ZkJvdkZwcmZpNWVj?=
 =?utf-8?B?Qk9CbUt0SktjWk9nT2JQQVBGMjRJc25jTUJJUWVyZmpQcktzSzd3MUsrbkJh?=
 =?utf-8?B?NDZrQjBOQ3dWRHpQNnVMaGtHVU45MmtYZlF1cU13UlBZSUFoVnBXVHFLMS9x?=
 =?utf-8?B?bkd6KzFYQUlib2d1OVpiRWE4bDlxTFBxRkNIVzhzQ2NqcWtRVzYrU2V1UlBx?=
 =?utf-8?B?dnU4WmNsU1YxRU5qWWJKUXBQOWVHdWVRTUU2bFhsZFB2aEtTdytqYU5xa2Q1?=
 =?utf-8?B?V3lxeTZoM3I2bnN2Ump6eG95TUZFVmdidG05blkyUytVVDJMOWVzTlpJTTVt?=
 =?utf-8?B?NmwyVU4rLzl3N0huT1pRWTdFRHRiUm51TU84eGhzUHpTMHNZREtxQ1dBRU9J?=
 =?utf-8?B?UjlXdW9DMmlkNE1LdzAwbU1HQ3doZkZ4NVFmVGp1YUcrbng4NHJjZ2R6N1dm?=
 =?utf-8?B?YzZFZkRldmNzTWcxN2xIZ0VHODFkR3pCdm9KTEpWdkwvbi92RGdlVGtaeXVw?=
 =?utf-8?B?bUxWNFhBeSs2QUNWRnVlby95TlRyYmI1RUhsYjloSUFmdHpmK0NxU3hNQS83?=
 =?utf-8?B?b3hWRnd6THhjUWNHL2s1amtJSE0vVFlvVWFhaUpFZEp4YTU3Ymh5VTdiWk9n?=
 =?utf-8?B?NzFOWnZUajMrYWFWYm9VRW5oakRpZXhhV2hSVkJaU1RQU2VGRE5hbWIxK2cv?=
 =?utf-8?B?QVZnU0xqaEFQTEw3UVUwTzE4SDF2dldiMy9FN3AyWXFqYmUxdWdOTlNrZE50?=
 =?utf-8?B?TjRqZStHOWd1cFUyTEZGYjhwZnVyQjBqbW5BV29EdUlYTlVQMWVjQk1oRTBT?=
 =?utf-8?B?aGdtdnZhcVRnemZ1Wmg4YWcrcmRtaFRUMzZleFJOVG1Jam9RVk1kNmwyczRH?=
 =?utf-8?B?ZE5INk9nQjJjd0dRU3JtN0FaTDlRZjJKWjJNbWZhZlR2RTFGQmRoOTh5UFVq?=
 =?utf-8?B?SjBSS3lrV05QYS9FOGd3b2o2UUVwNGRHWmtTNjRoaVRZV2l0K085VFlvck5q?=
 =?utf-8?B?azQwWCszOExwUDhhY1RGKzZzWUg0bFRpTEdqc2JaaWx2S09XQ3Mrc0RQSWhD?=
 =?utf-8?B?YW91YWVYUUQzc3A5VlEvYkJWaFhiVzN5dkZaazU0blNzSXpMQ3RYdmRQanZO?=
 =?utf-8?B?RnNCYTh4aDZXbHRYem4vNVpScGZocm4wbyswc0dwMnpSU1oweUpweFVqTnQ2?=
 =?utf-8?B?L3FwQ0UvN3BwWjk2YjVNcy9mUXBtNTN5QVlQYWFacUFxbjB1NkRYQnc0aEdF?=
 =?utf-8?B?Q3phbnlVV2dVQ2JseUF2dEhzdkFtTWtxWWhmakRzaGpBeUxZZHI0SnlDZ004?=
 =?utf-8?B?MkxJcDFHV2UxeXhGWWdQd1hWU04wMlFyeDJESnJBN01nMkJrOWNnS0orOU1O?=
 =?utf-8?B?clYrQm1iR2htVU0yRmQ5cE9TNVh3NkdRZDJ0Wk5WMHVFRlJnZEkwUDZoTCtR?=
 =?utf-8?B?Ly9wbDUwNHNKUXJqRFJVWTdKejM5QnZnOTZuL2RjVVhHRkNFRzhUcTg3KzZL?=
 =?utf-8?B?NHZETnZKZUU2OGx6aHVIY2tJeGN1S2pXeFRHUjU0SXZBNXdqdXJvZ1FiOFJl?=
 =?utf-8?B?dWZKNTFySisxK3NNcjBsQzg0bVV5RVdWblZRcElhSmhqS0UxTmlaQStkZ0Q0?=
 =?utf-8?B?SHl3SWJpbVAwcDFuTFFBcjlTaC83Wnk1MTFwRHBlaWMzOCtDZUgyWmlGRWE5?=
 =?utf-8?B?WnFnNnBHMDRsQjQrZS81NHZ3WDgyRjU0UXUwbE1wa1RXNUwydnZGWmNXelBy?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Sk9MNmx2ekplM1A2VDZUTjROZVBQMVNrT09zL0tYdndJNGtOalZPVzRRbW9B?=
 =?utf-8?B?alBMOTZFVU9OUVMwMDNJWnNYTDhWS2pKZm1MejRySnNmbGZRMDFLZU1BWU1k?=
 =?utf-8?B?STV1YVc3RzAvVUdqdVRSUFpWWEdnTzBkeUZFUk5uVURLUTB1MW43OHlFdmxz?=
 =?utf-8?B?RVVIRzlwdzdRQW14Mlh4NnVTSEJpUU1ETWtCdlQrb0w4bDBRNGhBalNNaWdS?=
 =?utf-8?B?YWgrWXVaUm54R0tXeDB4U3RCNmovcEFaSFJia3FJYStRYW1vNHc5UW5HZk1S?=
 =?utf-8?B?VHJiOCtDb1ZYc3gwV1M4c0pLU1FKcG9lcmlWdnc0ZjJ3d2xsME5lUCt6RXMv?=
 =?utf-8?B?TTMwM00xWnQvdEpsd0g2bmx2dGJJYUZWOFpOLys0aXQvRk9hM3dCUmtLT0VK?=
 =?utf-8?B?SmZXYlZuelFrcWNrNHlzY2JERnlLR2ZYL0JyazROYisreCtUdUlhaTZqQWJP?=
 =?utf-8?B?QVl5cWM2MDY1dU90SWFzZ2NIVjVjalNYenB2MWdBNkZtZ2VkTnNjckdqNVcw?=
 =?utf-8?B?ZU1sTGhtUVFrRTYxSlMyZEJGdUtHNDBCdlpmVERzQVdxQkdMMXp4MnJTQ2Vh?=
 =?utf-8?B?UjNDUWFQeVFKaWc0T2QrYXVlcHIxdG5zSW9tQWZmenRIbEo4dG5QR3JmTFUz?=
 =?utf-8?B?UnQwVXc2R0ErQ1k4OU9YaEZjTGI2TitRQzc4NlYvdURhc2d3WHRjdlBiTGtX?=
 =?utf-8?B?a2RTYVovTzR0bTRTcDY4ZEM2OVh1ZjVWWmlqaHVkRmRXVkpBMmR1VXNlMHBj?=
 =?utf-8?B?RTJhTkI0V1lNYTBkUXhnWFVkeTdzTUpyUDF6ZDhLeW96S2lhNXZQUlU3dzQx?=
 =?utf-8?B?SHBidksxOFNheUthclRyelBMNE5JaXdtQ1JnNnN5RzM1cGFQeGJIWGFkSmZK?=
 =?utf-8?B?eXFFZC9zb2JGZU1lWlNmeTU1VSt1SENVelZBa2pVRTU2UkQxLzhlY250SUU0?=
 =?utf-8?B?NDlTVm1Ib25QcGVKRS9LbUpHck9IWkV5cGFDNXBlOXJTY3hzb2lPWVZEODFS?=
 =?utf-8?B?Mk5CNGhJOHo0ZG01cWhrdURwV1U2b3JudmRteEd3QVJ3Q3lJUThPVnVtSERj?=
 =?utf-8?B?U2hGTXhzcEdXL0YwK2dsWGwzZFZ0RWMxek1jbFh6clF3clpCUGlwRHI3c1ZX?=
 =?utf-8?B?V00ySW1vUjhLWDFDbkZ1MGZOYXFnUWxJTy9ENW05cE9ndk1EYlRQUnJHeHp5?=
 =?utf-8?B?WUJsYlNDajc4MnkvZjVXUXdqdGxoYWVtbVBiUGFuRWNVMlhGV09iTWZhS1NW?=
 =?utf-8?B?SVBBV2x2SWgyem13MXIxNXI5MUkvTjdtUStpaGJyb2lheVc0ZERYMjMvRkE5?=
 =?utf-8?Q?HjYLjrj+zcjVFZsk2ZJprduU1X9NjNT1jW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bbaeb9-2863-4a43-152d-08db0a89b750
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4581.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:38:00.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78wR84PTSowdXTcASn1l+nRhzdkvArRef1/e4RbMNrMNBBtUp4LcTsZbNbVVyC7nO9HZ54Y0sMwkqUA86RcKgGC4fC7j1uhcHNON6KAefWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4207
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302090100
X-Proofpoint-ORIG-GUID: m-Lpq7VgVBt6QDEVRuPtlmsS-M1c0A-P
X-Proofpoint-GUID: m-Lpq7VgVBt6QDEVRuPtlmsS-M1c0A-P
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

yes, it is more about sort the list using .data and .compatible. key

much better if it we keep this as suggested by Frank,

  static const struct of_device_id ls_pcie_ep_of_match[] = {
+       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
         { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
         { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },



Thanks,

Alok

On 2/9/2023 3:53 AM, Bjorn Helgaas wrote:
> On Tue, Feb 07, 2023 at 04:20:21PM +0000, Frank Li wrote:
>>> Subject: Re: [External] : RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP
>>> mode support for ls1028a
>>>
>>>           { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
>>> +       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
>>>          { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
>>>
>>> can it be like this for better readability. ?
>> It is just chip name and follow name conversion, which already
>> upstreamed and documented.
>>
>> Why do you think it not is good readability?
> I thought maybe ALOK's point was to sort the list, which does make a
> lot of sense.  But if you want to sort by the .data member, I would
> think you would make .compatible a secondary sort key, which means
> ls1028a would come before ls1046a, so you would end up with this
> instead:
>
>   static const struct of_device_id ls_pcie_ep_of_match[] = {
> +       { .compatible = "fsl,ls1028a-pcie-ep", .data = &ls1_ep_drvdata },
>          { .compatible = "fsl,ls1046a-pcie-ep", .data = &ls1_ep_drvdata },
>          { .compatible = "fsl,ls1088a-pcie-ep", .data = &ls2_ep_drvdata },
>          { .compatible = "fsl,ls2088a-pcie-ep", .data = &ls2_ep_drvdata },
>          { .compatible = "fsl,lx2160ar2-pcie-ep", .data = &lx2_ep_drvdata },
>          { },
>   };
>
