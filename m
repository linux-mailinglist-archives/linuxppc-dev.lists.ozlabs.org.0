Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5D741C13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 00:58:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=B7iFCq4A;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hU8Ixlnp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrxpL1MY5z3bTr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 08:58:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=B7iFCq4A;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hU8Ixlnp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrjKm1d0kz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 23:36:42 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SBTAjI003640;
	Wed, 28 Jun 2023 13:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=xcIR9+7IkYg8hVo+LNN0seB38kT5QlJ+/NVm/siVnCo=;
 b=B7iFCq4AiRJoab2n565ObD7zPfsEWNjMbOBpi6NAQvaSJKVw2SHfwYNSS/MOQJRtXLYb
 xFhYZGRBT8u/JrB91PeSRmuwMUbhFEvQpAShQDK2m/ndAygIzt0g1AFARDg+X1H2bCy6
 ppXQ9xFm73lZ6ZCp2s90yaOIHbUpcoV5+3uo4Dr5M1x+UtHTBpyizCrHeQITenvg5WTh
 gqR0VJhx/jcsxXDEFuai+LEDIArJbaKdCpGd43XvgBtEmpODciqBGa/JExy6LbDWXGg7
 isTZ0r9QTfELcHNFoXdI085/oQW7wPXNhY71QXYrJfHb5g0lOri4oKktCBFiSMTw4UEq qQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq937gpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 13:30:58 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SDAuRI029607;
	Wed, 28 Jun 2023 13:30:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx60t3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 13:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeveih347uUKwE1PDfVU57+tr4eH5JKzsVVt/v8abvGjwL+F1UBL1P7Z26LAGM6O+120ol04oUrZ5O2LuOEZCJo+GR1D5ShYXjsm390q/wvaW/E1AspsWfVd6rVGqf3JmbQeo2op4v7GGrD/uIO6us13R4Pfuc8chXkNTqKE59zWdJU2VCUoR8u2B5Crj0ZHsVD7FMOEawrd++srGfo+mQ8ZNe8g7koD6hQsWWzPdbZp1yasd+wBZ3uM6AwEdAAs+EWlKGw+okOWnGeCl6gLOBOb6ZYEeIAuBeG9y6WruuNhDxbN9XrhXomSMQZXysRp6F12MmQ0ql6VpJYArhLf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcIR9+7IkYg8hVo+LNN0seB38kT5QlJ+/NVm/siVnCo=;
 b=mXHeitUqH2kTcf/MfQZu7aWw91qXQpiCJazn4bCa0PA6vWp2JbvB6SaLV1t+ZSC9o0aZTSt/1qoIaqsiTMblzNE1p0SYA9FEb1X3uBhSFCycy5Z+99xNOZqqEBvtwmEzZRCKb2VAV6D5f7SCnCj1U2kx83zmm+it0a9WfTU2PuhE9wrLcQJ4a8SByOtH84zy9B7aWofBlqLI8DEaIVJR4ywd9i0XrNsuDi1Egg/33rCbER64jzOH1srbwZymPuMJqme8dhYhqxuhGgXbe1kRiRnkfAQkKOK99jZ6Hd9u6CtcP5CqKiytRjr78TOaND0g1EJ1fbBSC+5MeL9BvNj/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcIR9+7IkYg8hVo+LNN0seB38kT5QlJ+/NVm/siVnCo=;
 b=hU8IxlnpBnRF7rbSH+e5c7Fhvh7R1YCUVx9ZbWMZW1yM+EYv2ToEBUoPUDvEZUpTsY/mme7fIvgqzAtzSdfZ3O3E04XeKODyBOZetKAighM6wSbg7xYEmkFrbBg9ZLISVbBjMfp+HuO1iYD1SF9jClyctiWcOXe1aMv+5rtpoqA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB5166.namprd10.prod.outlook.com (2603:10b6:5:3a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 13:30:53 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 13:30:53 +0000
Message-ID: <8158b5de-c2c5-2b4b-a2c4-5ace9a17a99b@oracle.com>
Date: Wed, 28 Jun 2023 08:30:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
 <20230626161332.183214-12-eric.devolder@oracle.com>
 <20230628-urologist-faction-42ebe5372206@wendy>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230628-urologist-faction-42ebe5372206@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 2821a4fd-9f1b-4999-2bed-08db77dbe55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zV/pq6YnW3nCMf2W925/J71RpoglFBi7KV9BQS2Doy+7D3xkEVzt+RhRBGJTPElZtAD1XaK3YXya2bl1PmdwIOlzt+i3SsoB0mnUtnwwEH1EAXQs2b0aX7ENqgVluJK0bC/UXugKelwt2gYbVgIokKafZABpzz/jslnkOXfmfQ2K0ixdT9GVQCL89GGxQnxsYPgKQHfBblep3RG2K3k8TYVZM2DyuW5airj7Af0OZTTHtHs180lYl7GuIIOfpRe60Q+unKejClhF4Q4xY6aKVP1+qZX6eQNeM7fhWAiripb0B3bKRWMrPDais4JcHGjKQl3GhZxsdytT7VhpKyrdZNYc8Wqf97ZmR80H8eJ3tEzuRpdPZL4l8sRTLDaFYZ0HrcQPT4MOWVfWJvoaw2UoYIVyFUecJ3Qn9yPOQ2hORIYi+J60oqlQiDB7ofr9FWKg2ncaRNyRRKZB+uWSxKuVqVyvXbQiVlYuLnCJb6k5NDBPgsFj6tHXm3HNILl0zB13rimyDtQIgymAEVSOspbQY1kzOWNMHESq4Mgcztuqx/nnHlBwZ8nOriQ+Y0FglaVlmn0Hi2jxfC+wqmw6rnb+F4phYYS8EcF7ZZScBib7qxs9YgDxborFwT2kKAHZcMzuGkfHw5hxqisueGrR4eYklg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(38100700002)(36756003)(83380400001)(31696002)(86362001)(31686004)(2616005)(8936002)(6486002)(6666004)(41300700001)(66556008)(66946007)(66476007)(8676002)(316002)(53546011)(6916009)(26005)(4326008)(6512007)(107886003)(186003)(6506007)(478600001)(7406005)(2906002)(7366002)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bU1CQVhtRmtkWkhNRS9tTFpCVytXdVhhVXBNSzAyaHhGcTg5VHlpTUhmSjlr?=
 =?utf-8?B?SDY1Z1VsOGo4Ylc1bmgzMExTbWlUSDNkN3hRWjUvVUJWM09rNVh0aFZIdDNx?=
 =?utf-8?B?NVpYR3MyNU11bVNYY3NqSTdvckdCRkdSQ25nS0h2R2FvR2MwaEJSU0hCMlhW?=
 =?utf-8?B?aW1jbzJkb21rVDM3emVKSHFNUEx6MVZydGdGVG1KblhRSlVORkJVMWs5aFlF?=
 =?utf-8?B?MTNBR0lJZ00zSHEvODR3T0gvRnA5cnJiQXFFSHZYM0N6eDlZU09vNHlEcDQ5?=
 =?utf-8?B?SVd4TlkrazYySmp1YjRxWk9oVkVBc3lHMWRKT1dmRmJtMk5RVnNtMmhrdndV?=
 =?utf-8?B?eVVnQkttU3JtRk4zRHhoUFZra0hMN1ozT1dxaUhDd3hvc3BEVnFjamZGSG5M?=
 =?utf-8?B?YzBJNGdqall3U0JoZ0hwQXdLeWJzZi9xL21qcWdwdGUrbTFtdGI5S3QvY25n?=
 =?utf-8?B?ZnFlelVvQ08zSUFnMFZoNjI4R2lmaFhDLytCbjUvMnhIOGVJZnlUdFFSeU50?=
 =?utf-8?B?SHBYTyt2UTk0T0wvU3dsQlo3a2t1WW1yQkhDcWFXQ1U3Q0FzZjIzaHA4MktH?=
 =?utf-8?B?YTBYS3FQYzJNanhFejJ3ZytwOGdSaXZ6ZXk0b0pHWXhUU1VhNnVYdlVJSjAy?=
 =?utf-8?B?TnY3L1pjMkJ6aUwyd2ViVC8rZHNIZjdXdCtmajk3eEpnalJuR01vaTZZbzZx?=
 =?utf-8?B?L2dldk9adzZydHQ1dHVRUW0yWmtjZlFqMUZKMEVTMm9lRUp0V2hyUDllTDBX?=
 =?utf-8?B?ellzL0JvMXJJZENScDhwQjJGUnBoYTNwNjFXQ1NKbHgxTWpURTdPRlJ3Tkdu?=
 =?utf-8?B?dWI2endTV3ZTa2ZFUS9zaDA5MEhhRXViRFl0UzJhbUMzdkQ0SGVkWkZaV3JO?=
 =?utf-8?B?YTVRTEJQVGtoOVprUlpUdGEzNGpTcUJqRG5FUGljTFBJY3JOZ0dEZ0ZEdlB4?=
 =?utf-8?B?Tk04RkZrb0VTWlk5UFVONUVrWU50OGV2cENTMm1YWEJBSUdYZ0l0QkxaV1R2?=
 =?utf-8?B?RTJkVGZtZ08yT1RCUEpjL2hjVlNacUxWMG1MZjdwMUtuSWwvSEw1V2dUQVJS?=
 =?utf-8?B?OTlQd1puQ2ZTcEtSc01xOUdQR3VPNVJHK2FicVhRMi9wZmdkY2o5UEZkV1Yr?=
 =?utf-8?B?ZW56MDFTaXpNUkhJN0o1MlpLWncvUnpIZFJ1R3VEbzg5THpMdng1aTNJMUY2?=
 =?utf-8?B?MmVnL3lPMVBuQXVzM2FtUExQOWJXSk5aN1NLK0RTeTlKd2ZGRDZuaHROTDBJ?=
 =?utf-8?B?NlJSUzRteEQ2VlRRNjRnNjlhR0g1Z2RXQW45Y2psTnRNQ2N6K3R5RGdHK28r?=
 =?utf-8?B?NDVYd0tzdDQrWkhjaFh0QWQwV0lDVFkwck0zR1A2aW80OVBzVFV3ajYxK29t?=
 =?utf-8?B?SEZDa0lpZnNHczErbjVEako0TXU2Qm9xdnNyaXRtdHdxZTM0MlVUVEpxejhL?=
 =?utf-8?B?VnlXSEk3bkU5TzhMRmg5RXlaV2FFY3YrRjQyVVE1enZLM2ZPSDhpUEpQVTlq?=
 =?utf-8?B?aWhLUFBjbExvcXVaekhRcTBwbk0rMSt0YjM2MEZwYlRiSEhDd2t5L3QxUzhi?=
 =?utf-8?B?cmw1YkJWUFA4R3NldWw2dWpHYlcwRU0ydEdNZXVPTDNSeFc5N05TWlpTSDJQ?=
 =?utf-8?B?bVpKYWxhY1UrTGg2ZFcybHJLenBPOWQ0Wk9iOTZ3UEhCNjhXNHJ3VjVXSEtY?=
 =?utf-8?B?ZE1IdEgwTGtTd1BVSVVETVBKTU9wZDg1cTRjclBLMXJBL1pDVG5rQkt6M05k?=
 =?utf-8?B?YXF1emkraFpBTWV6djliVi9ZcWluYm5Obm5IeVZLZjJIOTRGbUUySk02endM?=
 =?utf-8?B?TVZQQ1ZSL3dicDFKd1ZqQWlteXdxd2xnSk00MlNYall2ZGNsU0lSZWMrQjlD?=
 =?utf-8?B?VTE2S0N2N1BYT2sxNVQ3UGNQUGhGL1JuOHMySk1rQlEzbWxESm5XOHZSR2Vu?=
 =?utf-8?B?blFzTzhMRnN1dGlyeXR2T3J3cS9YV21YcFRuaGY5SXdha2ZxcDF2L2xsSlNE?=
 =?utf-8?B?S090SkNibVpoVXlsSFp3WTgvcEFtMmt2QkFpUmhHTHp5UllFclBReklRK1R0?=
 =?utf-8?B?Y1lMMjE0N20wOFRpVlpsU3pSdDNwZjVtbFpYTmJTemhxdmQ5bnVPVnkvQ3dC?=
 =?utf-8?B?VEVsVjhqMFR1SGlUSDJCZDltdmZOU0Znck1qTG02djlSMVRiZmhvcFdJTUpC?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?U1V3aUI3VkE2MWNRWjl6bVhIdFNSbXhyTkxTSWRyekR0ZFJwQUhOYW5MUG1U?=
 =?utf-8?B?QUtqdVQ0R3c1akFvejNIMHRWVXNjS0o2NjB4T1dKQ2tkeHQ3NkdKUi9uTEpU?=
 =?utf-8?B?YmF0OW4wUlpoUEphRHdneXE2bngzQk51TGFHQ3hOMHBuUEE0elg5UWlFaXNP?=
 =?utf-8?B?YnFqS3QzdGh4WWdyc1NSTUlEOHlTcjhsK0pBTDVEZ3pDS0ZBRFF2QzIvTHFa?=
 =?utf-8?B?R0JKcjVtUEwwOWluOFUrRThzdTkyK1dmNUxXQ0VVTitUeXR5NEZBNFd0S0Ja?=
 =?utf-8?B?WTBFS2twZDlDbGV1RWFiUUNwV0UveDBOU3JlVzFXNjJmS1NMRnoxZHRsVGpz?=
 =?utf-8?B?cnc3eXpNUTYyTFpPTElmZHVHZkNoZGJjREFWZWVudllxdytYSS9yQnk4TmNz?=
 =?utf-8?B?R0JxRndvTkloc09JNGwrRTZDN0F3Szl0SUk3MSt6N25kOS9VdkFYSFk3NlZ4?=
 =?utf-8?B?TUx6cURzdytVd2NBSjhvd0pLcTd4WmhVNEkxUUVBcFFpN1d4dVJEYkhJR3c4?=
 =?utf-8?B?aU4rTjE3dTl0VTJHZEtvVk40VTZheXRTVmhhckxZdjFpaXdYaDVac3Njbzl6?=
 =?utf-8?B?R1Z1eFduN1dNUHBzTkk5bmlrNFhUY0FQTkRCaUlIdFNhODF2TUluMlZUaDA1?=
 =?utf-8?B?Q3p5ZGRtSmhnRzlCcjU3ZGdxcTlCZk8vU1YrTTIvTmorc0JMQURmTUxxMy9Q?=
 =?utf-8?B?cHlRbG1WTy92UnFEcGhhVkl0blBGQ2xJUmU2eUJwWmZmRXZuUGVTNWVxVEsx?=
 =?utf-8?B?OXlvamdvQ3QvZFk0eDU3dEs1VXh4L0s4TjYzWFNmWWFJbTB4anN4VDh4dVZa?=
 =?utf-8?B?cmZCdGZ1Z1dzbVJyYkl5bUhZWnJONEFMWk04Qmw3aXdoQW1SUlNPSEdDSXBh?=
 =?utf-8?B?WTdIYUhhT2VzZlBWRVBEbDhMdlNvOE9GQi9TSWg2LzhVZkFkRExoekFlRmhl?=
 =?utf-8?B?MlhxTWJhQ3JyMldRQmdrNXhuQUFhT1hWVTdBdlZMUm9nbHJSZ3pvbnV4clBq?=
 =?utf-8?B?WjljUC9TMmNtL1BqSEl5UXNQTWVjUGNvbUoyT2RnUjJHUDA2VkJjZHRpQVBK?=
 =?utf-8?B?TzRXNW9HRjdMRHNlSE5VTkVlMlRmRnNHellBRjRlaFR2R3NVN1drRnFrdTNT?=
 =?utf-8?B?Z05PNDZVY3FsRkgzU1VXaFlwQW4xeWltUE5mV0t5dDdJSy95SDlvTWNjK0RX?=
 =?utf-8?B?aS82aWYyTmcvcmhqQjVPM0dOREhSN3VzaTh4Q2ovZlAzYVhWbng3UmNNVGlj?=
 =?utf-8?B?TFl6SHVjcWV2OEFvK1JjaXU3emJFN3FyZUpTUVM4Mk9GYzBtWStFWDNUYVBH?=
 =?utf-8?B?NDJGUDRNRWNWb01NMGdLOVgxQ2hoRHFpN3g3M3FmT09xL01zejd2dFk1RVVv?=
 =?utf-8?B?Y0Y2VGcyaElOWU9kWkRzVGQ4M0duOTdRV2haSTRJdk5ybDRZQ2haaE5Ea2Zx?=
 =?utf-8?B?Vkd6Mkg2LzFQaERzdkF5L2FEdWQzR01zSy9yK09JT2tPUFR6bHp0Y0NmaWRS?=
 =?utf-8?B?cFIydUYrWFB4RlBzbjB2NlZvbERLUEN4VndGWTJWMGpoWWlsejdaQTg5QVE4?=
 =?utf-8?B?dkdkbzIrYUxzNi9BbEVQMGJuZkJxQVRIUXBvYWJqeEEzbkdESHRMcTM1SnEv?=
 =?utf-8?B?UHZjekR5aFFCa0VhbllSdjJWU1loSS9HNzFhaCtqdmx2dk5vMC9RS3FUZXNu?=
 =?utf-8?B?VjJmemhvS2k3NCtIYitQMmR1N2drTmlOeWFVYUdad1RaVVJ0dHNrVFhlL3Fl?=
 =?utf-8?B?eWlST2l1Zm16cHBFaHd1OENma0F1TTEwZEFjVDE5N2hab2QyR0FIY1IzQmtH?=
 =?utf-8?B?d3FjQk1NenEyTkpsSml4Z1FTOXNvRXlPR0FmWUMxSFpQOGxqbnQ4MTJielc3?=
 =?utf-8?B?VFZjd2V4STZTbS9kN2kvemsweFREOWZmNElQSUVhdkVXaGpySk9DZ3FXWDBF?=
 =?utf-8?B?emkrTlp4UnExNVg2cm1VRXpSaHN4S1lxdnpzSTBhM1Y2S2dmd1FWVmtTallo?=
 =?utf-8?B?Y0JqMW5XaU5OSHlUenFFL3lUSHFKZ2hTYW9sOTZ2ZGhkTlVZUnJxYXhZSStw?=
 =?utf-8?B?L3hVcXNQaFJMSS9aY0h4Tk83TEt1WW00RHE2NmMydUx3cDRpQ0Fadkp4Vm5Z?=
 =?utf-8?B?YTVkMmJyVm5OK2FRR2FpNzJGSy9JQklJazhxd0NmbSt6bFh3T2ZiQSswTUZ4?=
 =?utf-8?B?VmFJUXJ1VUk3ZTMwRGRHN1hydDBxZ2N5cEEzMFptZnpsUGoyWUFsazBLeVhI?=
 =?utf-8?B?aFEvU3BMZ2VQZ05teGlUa3I0MkVsREgrM2NOWTNoODJMLzVqQWxGZWIvOElz?=
 =?utf-8?B?VVJ5ZmVlWFdFdStKOGtyZDZ4MWlRMXpuUFJDRTBGOWxMM3JjdjA1a0FwRkNy?=
 =?utf-8?Q?tJ9cXQYTHDEphrs2oOJaUADo4LKqGHJ1AwK3Hzjw/vbfs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	+Fjfx9FFApqFEiWXGg4T15wvTc7KISa+SbUl1w2rWgdRG6T7LnEfs5UnH84DJlVXdb/qMwchq5Br1GDpCLQVvUCIl2Su78MVSCIpJUO9aYFHi0DUBTwl/ocV3OBXWc5A28IWWwPimacWOuI0fd9hGkdVsGT718MRTWIuBVnFLYCDPgBx3yZJxfxlatFZeSL+QbxGqgXPdB0bD9+FNeFCBMBTh8xoWQMjiYrx08w787VzqO+nB7NeY8b0KhRjAtwmBToJzQqbrhL2UnT5CZ8NR+rIXNP6dPe8fPJkkImG54wcLZO074kjGhEU9yiArF2McRsaSlWZiQtH1T4h/a+D7GoYUfEeo/AOyaFCShgKHd/btYtbcGx2fAnPhFciItV4inKb0DPa0rYQO3CqjpYIF66MINgUcxWLcZb18aJgNX60PcGSUy9Uy5mO1ss2pgIGsuWJw8sqE5n9IFjvWQMmf5AK/KxIncFFGwXG4vDQRLZP77Unf5os9jWC
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2821a4fd-9f1b-4999-2bed-08db77dbe55d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 13:30:53.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COj5tdljajzTM5GwjG/czGSUNDPZ9ctwfGiNtWCfNMmto4UrgcbtO8em+fl4jgvIDH4RWyM61fTA1BHJMGSJgZPYQC0CVr890Xq56GMnkwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_09,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280120
X-Proofpoint-ORIG-GUID: 2R7_TIJwpnZhb78eOaUZ1eLNDHaj7McR
X-Proofpoint-GUID: 2R7_TIJwpnZhb78eOaUZ1eLNDHaj7McR
X-Mailman-Approved-At: Thu, 29 Jun 2023 08:58:04 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.
 wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/28/23 03:20, Conor Dooley wrote:
> Hey Eric,
> 
> On Mon, Jun 26, 2023 at 12:13:30PM -0400, Eric DeVolder wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> 
>> equivalent set of KEXEC and CRASH options.
> 
> I find this diff a little hard to follow (since the other half off the
> change is in another patch), so it may be me missing something, but are
> you sure?
> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/riscv/Kconfig | 48 ++++++++++++++--------------------------------
>>   1 file changed, 14 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 5966ad97c30c..c484abd9bbfd 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -585,48 +585,28 @@ config RISCV_BOOT_SPINWAIT
>>   
>>   	  If unsure what to do here, say N.
>>   
>> -config KEXEC
>> -	bool "Kexec system call"
>> -	depends on MMU
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool MMU
>> +
>> +config ARCH_SELECTS_KEXEC
>> +	def_bool y
>> +	depends on KEXEC
>>   	select HOTPLUG_CPU if SMP
>> -	select KEXEC_CORE
>> -	help
>> -	  kexec is a system call that implements the ability to shutdown your
>> -	  current kernel, and to start another kernel. It is like a reboot
>> -	  but it is independent of the system firmware. And like a reboot
>> -	  you can start any kernel with it, not just Linux.
>>   
>> -	  The name comes from the similarity to the exec system call.
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool 64BIT && MMU && CRYPTO=y && CRYPTO_SHA256=y
> 
> This looks like a change to me. Previously, only KEXEC_PURGATORY
> required these crypto options to be like so, but now KEXEC_FILE needs
> them too.
> 
> What am I missing?
Conor,
Thanks for looking at this! Indeed I erroneously applied the CRYPTO=y && CRYPTO_SHA256=y
to KEXEC_FILE rather than PURGATORY. I will correct for v4!
Thanks!
eric

> 
> Cheers,
> Conor.
> 
>>   
>> -config KEXEC_FILE
>> -	bool "kexec file based systmem call"
>> -	depends on 64BIT && MMU
>> -	select HAVE_IMA_KEXEC if IMA
>> -	select KEXEC_CORE
>> +config ARCH_SELECTS_KEXEC_FILE
>> +	def_bool y
>> +	depends on KEXEC_FILE
>>   	select KEXEC_ELF
>> -	help
>> -	  This is new version of kexec system call. This system call is
>> -	  file based and takes file descriptors as system call argument
>> -	  for kernel and initramfs as opposed to list of segments as
>> -	  accepted by previous system call.
>> -
>> -	  If you don't know what to do here, say Y.
>> +	select HAVE_IMA_KEXEC if IMA
>>   
>>   config ARCH_HAS_KEXEC_PURGATORY
>>   	def_bool KEXEC_FILE
>> -	depends on CRYPTO=y
>> -	depends on CRYPTO_SHA256=y
>>   
>> -config CRASH_DUMP
>> -	bool "Build kdump crash kernel"
>> -	help
>> -	  Generate crash dump after being started by kexec. This should
>> -	  be normally only set in special crash dump kernels which are
>> -	  loaded in the main kernel with kexec-tools into a specially
>> -	  reserved region and then later executed after a crash by
>> -	  kdump/kexec.
>> -
>> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +	def_bool y
>>   
>>   config COMPAT
>>   	bool "Kernel support for 32-bit U-mode"
>> -- 
>> 2.31.1
>>
