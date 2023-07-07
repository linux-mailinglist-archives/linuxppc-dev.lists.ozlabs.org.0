Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B074B8D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 23:47:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fnWAQAh3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Bk5EdBKe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyRnl5BQCz3cY4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 07:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=fnWAQAh3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Bk5EdBKe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyDB57110z30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 23:04:12 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367Cww7s001510;
	Fri, 7 Jul 2023 13:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=M11N7DkMA32OWsbxb87YcdgtHEhpKrl6Ra9ToJvvd6U=;
 b=fnWAQAh3YwnGhayNz2uGLaOZ4gA2fRoUtJA0NmQl/afxqTRf/jAPrKjndsr28shrpiMn
 FhPgXXXK//fZoKODD3WuCH/lj+7RmPeEBUG7bBLDYfckKHZd4/WCOqFLgoHfUqmOuN2x
 Jo1669pKIARC5vEWfVeggLfeLum+s0q7tW0WDp/6DX/js2ufPQPfJKeefN04GK3v90ch
 V+JEmX0K7CsHsAfto2XsA0Kz/bTUk5mmyDHElSU0NQfzTRAZwvSbGajehpj9493cewb9
 DKa2vfZwhlGEufI5/gzjS0raVNPBlWobVHnsuTAaNyWqVsbHSH54J9Lx3TiPNoMC31is Yg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpjcsg2mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 13:03:37 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 367BuSIY007175;
	Fri, 7 Jul 2023 13:03:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjaked9ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 13:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+yGZHyQBruQus/aCKMu0Uu3E5ImiYIYi+iCvhfjoo4mUS+0ohVJ+/dZSIU+/CvTOolI0+SrmDp9TAjSjqndGk4fa4JppFhzOU0BYKcPwidwo0Lja7nligdNfw5Iy/Eq77sua2LYLwgj28467W9YJxbd7OVYv2ZaTCaUd0maKh5yOuzwgzAZ8DKyRtci+Zt8BB5oLsaVd6NRUwEdzav+wQCR0kGAWnyy4zDn1EBXwn2vnAPUEm2ziuRBTnIZuPzIw4qaHJm+3lTEYws0rfYMF8RIfJHo+v7gXi9Fpx62kmZneKZg2Hk9xkM1DD9ZP9u0bK1z2pgAl795OnhIloBJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M11N7DkMA32OWsbxb87YcdgtHEhpKrl6Ra9ToJvvd6U=;
 b=IuFSzfhP8GkSMZH8c2q0CxKdldMFyKCpd1659VOoKA/oWOup/9w4wX5anA0ch5tOUUZEC1hvfqRtOpVSNKAhbB7u32aFBI5p/TYvooCGWUAs+WJo6wgkcyIaoXre/KgNDgTMaT6t4OKpHKLhtzu+eKyKxn67ChClDDPhSzl98GIc5bQ70I8mrpfrTGcJps63uutdv6oIDFhVMUgxSyw3qfUOaTDndnmq64O/nldUs7Mdc6bNEsldMp0cgCXYM+62Ow5PuM6gYIPbS5TiY/9zakks7oEwym4xECyzvLfUwts2s3K8Aipm6v+61lvZ0dVjDeDuqf67HEyaqaSFCnvVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M11N7DkMA32OWsbxb87YcdgtHEhpKrl6Ra9ToJvvd6U=;
 b=Bk5EdBKeQ6/PX89SZpRkUbvAjMhLc+yja83Kzea6BIRbNsOFE7zxvBEott9COiDciWTQZ6+kzJFwKs8AC7PiWg1zFnz/WClgoSgG746/4TdlpSgGMK0GZkO9BOA5v/UfCO4P18+SGAd84gEOx9KxF0aRbFfiTSF+6AmeqpaHzMo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB7689.namprd10.prod.outlook.com (2603:10b6:a03:51a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 13:03:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 13:03:32 +0000
Message-ID: <918f700c-fb93-8bbd-e762-f9d864b0fb67@oracle.com>
Date: Fri, 7 Jul 2023 08:03:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-c1c5d9c4-b2c8-45c4-ac0a-084cfecb3833@palmer-ri-x1c9a>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <mhng-c1c5d9c4-b2c8-45c4-ac0a-084cfecb3833@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ0PR10MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: f87a8574-b53b-4577-c63a-08db7eea90c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HXCxp7jyqkbAT+O7MxjaYNzSdQ1seGsUs2IslT+U1wZoSdGMKRjOVJjZJ58mtXsLzyWNFt+gP0dLjfxxxiMTuc4rHVIX0eaTlAkALAs/894WZsnuwSNnOaZdCuQkCK8Eubra2EqBIdT5/Rf4FzoJ83KN/b1LqzK57KSYEumfF/pY3XCYI2LCpOKWrF5ppiYxACD3+tviAJ4PoM2CgpED9oLcbIzn8rjxmo4PmmpRSYOsLSAUzWOg6aRwBAa3qPoKwSVZJa6FhQeFCvgYwDImtDHzp5M4yXdsYmcSsIkUQ4jh6rzb77xW07yOhyKDTBvqEgonzjoG9R7jj6YXWd7zDvJReX+xUhUk1N9qDetfyvk3ryoBKaPLdnedaYMQiYlehaG4Of+IJadf+lBAar/+MVAeSQ1SoZhVxTRIITMXW0PhItz7QhAmMOyx40nTmAs3MG6ECg4orUGzWtlHTKim4bTwehCQG1KBTBCH6lyYK7L6b0ZnW5XdxO31MhxsY8mt7Kkvn6iV2Rq+XsqPpVmJDKua3y35Ujp+B1z/x+PhxJacK5738dueikeEN0IrgE7UUG8juLIXqIYghIGwW9EIeOy5Wz9nYdK+68X6V8vjc5sVnxIDTzQXxanV0/kXEjH5g469wz08RlZkCUeb/fnSbw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(66946007)(6916009)(66556008)(66476007)(4326008)(2616005)(38100700002)(107886003)(186003)(31696002)(86362001)(26005)(53546011)(6506007)(83380400001)(36756003)(6666004)(478600001)(6512007)(6486002)(54906003)(41300700001)(7416002)(7406005)(7366002)(31686004)(5660300002)(8936002)(8676002)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?emt6R2VnbFVoTUNPQWJocFNmKzd0QWZna0Z6NTVqQzNEVmZPM3h2elVoMllV?=
 =?utf-8?B?UlUxNVl3NnNodFdEeFhoL3ZrQm9VSlYwYjI1bkFtSklOY0RIcVhGcmhuYU5M?=
 =?utf-8?B?ODZROUUvQmJIdFVJbFkyVXdUZkR1NUtRUVhSd2hMdjlYMkZrNmc5Mnl2MjRN?=
 =?utf-8?B?RXIyRk9OQTUzeEticFVoNDlNQWxGcGtQMXhscFFGNFJhbzlDNEE0MnJEWHFt?=
 =?utf-8?B?RnB6cFBHY1dUQ255QnkxVkJIS3A2QisyZDRHSjBXV1JlT0R4TVNacjdFNXN2?=
 =?utf-8?B?RGRNNmtSWWwzQm9uYy9tT2N6WXZYNDl6Z0dNYW9FWWprRkJPRE5pcWRlQzd1?=
 =?utf-8?B?VklyQ2RNZjNWYzZXT3pNN1BOSGFaWDlpQWVxZnlFTitwM3BWM1ViV01MeWht?=
 =?utf-8?B?Z2E0M095T2lUNHRZUFNrdFVJSUR1bnpKQ1pUbGl2MHk3SzBEYTU0bWdXTlRJ?=
 =?utf-8?B?QUdPTUZRd2lhbDBUanUxQXlYNVArNlhiVHdtdHhSbmNvNzI0RW9DQ1JENDNG?=
 =?utf-8?B?ZXd4bitzZHVsQXJ6emV3eVY3SC90Q3RiK3BwSmhMRFJGeEVtWk1lMHQ1Ylpu?=
 =?utf-8?B?ZVFYWHZmZVFpNWxvRlQ0bGptRmpxTUVWQzRtdVdSWFlYZzhxSjBoN2xFQTBj?=
 =?utf-8?B?alF6amx3QlFNQjVHM3h5enBGU0xQYXF0YXJaeWMzUk5zQm9najRPWjJoMXM4?=
 =?utf-8?B?TUhOUThjNUxEdzRhMjk4ZG9QTnUrcWJqaDZzS2wrRUtqWDZEbUlINzhoREpO?=
 =?utf-8?B?bVNESWtHbUtRcU9xV1ZPT0JtYWJodjdNODlEZnBnOW1RZHBWaGJRbE1mV0Mx?=
 =?utf-8?B?b0dEam1YMU5TY3dvamJSUi9vemRrUnpmYjlhN0xRZjRYUUw5WTh5ejNxOVJa?=
 =?utf-8?B?QXNkNGhLRVBPQ0l5bEFuR2JPallaWm81blpKV1M1dURDRENwVEhKTHJyVEZL?=
 =?utf-8?B?dTY4VlpOZE03cVg1OXd5VWpHSDdsdDN1anRKYy91Rjl5QW1jK01WdU0wT3ZR?=
 =?utf-8?B?dU9CdVVwQW1haEQxY2dVb2xCZ0g5ZmF4RldDYkI5aXVTS01DMUYxUjhNWmpX?=
 =?utf-8?B?QXluZ25CRkd1OXhTd0lEeE55WHF6ak9FMU44UXNkcDhxeWUvZ3lleko1amRa?=
 =?utf-8?B?NXlKY2VvcnliY2lkRzFvbHBVZ2xLT3JsUURDUHhrZVNhWnNYMVlwTFVZamFw?=
 =?utf-8?B?NFdYSEE4OUZHUERSN1loMnNqRDB6djFCZTVJbDBLRS9qSVlTdVV1eDV3emlk?=
 =?utf-8?B?WnV0U0xrcmpGeFJjSThCUUR6bGl3TVQyVjNyWHdZaXNYRUl6YjRobVdBU2ZK?=
 =?utf-8?B?S1dya1JuQ1FWZ3k4QUxXTTA4OE9LK0RqQzBmR2VTd29NK1dYYldsZHI3SlNa?=
 =?utf-8?B?T25TVEhtUFB6MmV1eVh0LzE0a2s4SFhQRFZWVnBmbGdwY3hrR21wM3kyMnUv?=
 =?utf-8?B?Sk02MVVtZ21Rc2pCWEpURFlocXdwdE9uMXN1LzhpckRWM2pDWG0zNE1Md0x0?=
 =?utf-8?B?bGJodUR1VTJYVlg0QmxLazJHNXlvWjhKVUlnNjAvN3dLUWpOdm9VVzMyMVVL?=
 =?utf-8?B?MVo4Mlk4emlwSFhiNkU3b3lDbk92cGpjMTlqWW9SSTJHSDk1aWFyMzRYTG53?=
 =?utf-8?B?cTRzRVpHVGllSlljMVorKzJiVE9meUgreDhyQkFlNnRFUUVCd0RycE44enI1?=
 =?utf-8?B?QVB6aEdFRjYvQ3JVOFA5djRBOEdYcCtmQTduSjdLeWNWelFNT3dNK3d0bTRq?=
 =?utf-8?B?aDU1YUVpdy90eXRsT3dGeUhJWWNoa0l0UkpNYlVQKzBKQVBiOXJkTFMrNmxa?=
 =?utf-8?B?a3JkUXA1MDZMSkxSczRsYktwb1dWZTY4VzFUWFkySmpETzJQeVR6ZDBlU2Zq?=
 =?utf-8?B?T0grTmFPNE5BdDVPM0lDNGhtNGFlSVRzeFU2QVQxc254aXRVbUozNDFaazcr?=
 =?utf-8?B?MTcxc3ZTaFdtNDUwVTF2dXFNWWRnTmlrbWFIb3VLZ0E1ZjUzUXh0Q1VXU25M?=
 =?utf-8?B?SjRndTltSFJTS1dneU0zbzZ3VUtqcCsybnI4WEg4OUJEVmtIelBvdVRsVEQ4?=
 =?utf-8?B?eVVwUnZ0ZnVwMk1ZSjVnT3dROTFLZUMrK3lSaFNoQmZCN3dockZrZDA5UTFt?=
 =?utf-8?B?U0dvcDNOanU4WjFGaGhWZkRvUEwzRXZJdXBWYmVCZTE0UGNCSCszNk12Z1R6?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?OHJ3a2VYQ3lLRHlqUVVFeUVELzJHN2ZCTjM5Q3NtM3dvNzMrWGllZCtQa3R2?=
 =?utf-8?B?RzZjdDN0NFp1NmN5MFplQVN4Mk5ST1N5azBRbXJkbDVkOGNTNjBLU2dFcWhO?=
 =?utf-8?B?WURCUE1kZzdSdldCYlpURnNVdEhjWTVOR3dNd1B4WEtKRmt2WjZQeWNGbXFE?=
 =?utf-8?B?UFNYelBRaGxqZDYyQmRjQVQ0QWN3RXBVWlpBcjk3UVlGcjRNZ0daelRCUGl5?=
 =?utf-8?B?ekd6WXhyczRBWTV0b3dmVTg4V1dYSGlObDVoenE2cmViWkpIRWROSTFOK3hB?=
 =?utf-8?B?bmJZbVV1c3ErdlpwczY2VWs1OUNXL1RaT2J4QjRabGtLT2dPeEJyZ1o1ZXlZ?=
 =?utf-8?B?ajhkS0pGdi9NOGtacG42bTdSbURqZkExRFI1RFcxeFRUY2xQa0ZMNjRsVUJ2?=
 =?utf-8?B?TzJRdkhrTjRCNG9uV1pHVFZEU0sxREg1WjlEOWtQcVhuQUt6ZVF3NXJZQnNi?=
 =?utf-8?B?WWl0M2dRbXFiZDd0c3hUcy83T2ZvTThFRXRpejczRDRZQ1pUWW1QcklaMmFa?=
 =?utf-8?B?UE02aTUzUmRocjI0T2crOTdDaWhMdkhwZEFPc2dMMFRPZ1dDcGxML2hvby9l?=
 =?utf-8?B?SlBuZzhrUzFQcFdyU1dST0wzVXBwOWlSNEpNZlZzSndGK2FvajZ5TXRIdlJi?=
 =?utf-8?B?ejJseTdBMmlKeWlHRVRzU3N2RmFaN2lBSHU5Vko1M3ZIMEFaTWtub2RzZUcz?=
 =?utf-8?B?TUdMVXh4T1JOVHBjbEU1UnlsODV2akpMY1Z0RjZnd0VyMVFKQkIyQkp6dlBh?=
 =?utf-8?B?SXFHWWJSRWg3VmlvQXhFV1JaS2hCS0pnajRjTjhyU1ZCaXlSaGY1MmJEZTlv?=
 =?utf-8?B?T3pySTVpTml0c1F2TXVjRis2eUpQVUtzcExnM2JtRmt5QzdtRm43Q3ZEMnhO?=
 =?utf-8?B?SXJLaExLeDJIWEx5THM0Szh3UEpjVkVnVWd4RHVSd0FsV2RWY2xvdFFmQVFM?=
 =?utf-8?B?alNhNjdmRDZ3b3diR09hclpIeVMrOE9IcVdjN1cvajFlbEF0RXFpZFc4Zm02?=
 =?utf-8?B?MktqRTFaWGZNWk45K3ZSNG1rTTV6bXJuMTNnQ2xRNmMwV1RwTWV1eW1sOVRC?=
 =?utf-8?B?emYyL25EaDdaZUd4VXJHSE1SelJqd3dibDNvWVRuOEVoRjEzL3QzT0t3MXc3?=
 =?utf-8?B?NWlxaERIVE90Sm05c1A1ODlHMFBEbFBLaU9NSjh2SCt2RG1oTjZ6ZElCMkps?=
 =?utf-8?B?QlRWT1JKVnhpNWx6cFZwM01oUGdLNm9CSjhTZEhTN05JOXcrSytnME11UkVu?=
 =?utf-8?B?Sm5sUXpaQkk2OGVSYUhTd0VER2VQbEpXVU04N0gvbnN0Z2xUOHRCSlhPVHNP?=
 =?utf-8?B?dG9jT1ptb0hGaE4xcnVXKzVVTm1tMHRBRWRNU3lEWVRkOXdJaHcyTDBIT0xu?=
 =?utf-8?B?SUpyNFVQa0hXMDBvZEtJQlhVb1ZqSlBrOXJVZldkMDFUMHV6d1l0UzhaUjhz?=
 =?utf-8?B?Yjc1bGI2cDdpWXBIbEpVVjV6SGtYdFgwbUtUTDFxTm9WcEdxeXVWWFBGYnEv?=
 =?utf-8?B?d0orM1FMaitlNjM1ZEN6cGJZb1kxZitVUUtzeTF0ZldOSUFUOTRGTHBadE9U?=
 =?utf-8?B?R1kyVC9vTG0rdXJkd281NWtJdHB5dUUxUkZJNllLTVd6YW0zdkJ3bFRCcFFy?=
 =?utf-8?B?emNMZXduRjhXc0NJVVhlL3NKQUFRMFdRVGo0NFNjMStkSksxOVkvNG41VnlW?=
 =?utf-8?B?ZmlWby9zZjJOM2xJQmFUcEcrQStQSTBEVEJtN09rRDd4RURQbVlQUVBoWWpK?=
 =?utf-8?B?ODFGUi93eUxmaGhFWStFZ3FrWXlueDBVMWpMSXA2dHRXMVRxMDBhc0NpSDNZ?=
 =?utf-8?B?N3FHcU1RWE5vMTZNTGZ2RnFSYjUrem9lbmE5MEcwbkpDd2s1WGh5SG81OTk3?=
 =?utf-8?B?Y2FrdExjaXhZL0gyNlo2Z1FHQnlNVG1qTHBHYlBoZGtPKzEydTBFaGNiNnhQ?=
 =?utf-8?B?Rm9tNGdVbG5hb1VxRzRCcGFhTHV6SDNabmJnV3psM2wxSENsaHdLaUhxZ2R0?=
 =?utf-8?B?R1BBYkpJL3ZZK3pyNEgwaXU2UUErcjhPRWEzL3hNWEJhSkU3RTNGNUZjN05K?=
 =?utf-8?B?WWtUbmJLMFA2a1Yyd05qRTFPdDFiSGNJMnl5dzFOR0VFWksyZmF2Z2Ntc0ZY?=
 =?utf-8?B?N2w2QXdPM1NtZk9GdU1ZOG9ISjBhNlQ0S3R4UlUzMXJXT0hlbDdxc0xac1FT?=
 =?utf-8?B?M2c2bStYY2Z1SFltOUhGQmFNOTZ1N0NJMEtIUDZBdXkxSEJTellzOE9jN1dE?=
 =?utf-8?B?eWtMVEd2akxSblhZcmhrbUM5Uks2UGY4bnF4K04yK1FTcmswc3RDTk1yYU51?=
 =?utf-8?B?NFl1Q1hLRXVSc3YrdjB6dGsvKzNBQ3J2RUVMQTRpZlR4bUxaSzhVWjFpU0xS?=
 =?utf-8?Q?QrA/F3VZ16SylavuLMwdIp2G54jl0OTR/4xjW5ygRIaTp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	GVAoVCCO8LgPEYllbm3OWEn7Sle0QHxPMt2Rhzu8TWGij6gCkAIy4qG2GjYquyZm8D+fIc9+EYe9+i0tmeGnQvlSRaVhzT0DxFypXBfVssjDw/xfUtFxiBLDzkCDvCF7Ipcv0HdoDUt31mC4a6YkK7+UZsL+DaG+gXWmMJlC3pfH+jqRzt+SbdZxUbTlFElsQ2520NahQpFt93oKZOwPs5ccKR8JRwXF1eRY6NDmuwTXG4Mmd7zExI4y1xFjWPedAGu8kUpN34NCYPxNTlw5PlgvANFonlNBKE42/IOJ5pXRiA/E6d0eMZBv7eKRhDV5wjG5mzydIn7dSkEaHUnrHY061Tegn3vnwGq0tcNdzxsobykdaBrZ0rXbbdpDP5pneu4D2+RA79Ajul4ZPS9BSlENb3f9A5vLAErT9yA81PLg5cUFsfNz8QVOL49+EVMQBYSPPvA1jc4krQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87a8574-b53b-4577-c63a-08db7eea90c4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 13:03:32.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NTo3AiOp19V5cPIyUZ2uw9EVP6DX6XvHuXBtiWAhncImhWmLuLARhMvjvGAif1XiAEiEV2+6ydYwdqopGYxhq9Jazndd7+pMuTd8Sbxqn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7689
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070122
X-Proofpoint-ORIG-GUID: bLvbNTMkjUpoKSjuH3279WamCeZsgJ2g
X-Proofpoint-GUID: bLvbNTMkjUpoKSjuH3279WamCeZsgJ2g
X-Mailman-Approved-At: Sat, 08 Jul 2023 07:44:48 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, borntraeger@linux.ibm.com, frederic@kernel.org, Arnd Bergmann <arnd@arndb.de>, mhiramat@kernel.org, Ard Biesheuvel <ardb@kernel.org>, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.
 com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, juerg.haefliger@canonical.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/6/23 17:32, Palmer Dabbelt wrote:
> On Thu, 06 Jul 2023 15:20:25 PDT (-0700), eric.devolder@oracle.com wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>  arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
>>  1 file changed, 13 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index b49793cf34eb..8a3af850597a 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -647,48 +647,30 @@ config RISCV_BOOT_SPINWAIT
>>
>>        If unsure what to do here, say N.
>>
>> -config KEXEC
>> -    bool "Kexec system call"
>> -    depends on MMU
>> +config ARCH_SUPPORTS_KEXEC
>> +    def_bool MMU
>> +
>> +config ARCH_SELECTS_KEXEC
>> +    def_bool y
>> +    depends on KEXEC
>>      select HOTPLUG_CPU if SMP
>> -    select KEXEC_CORE
>> -    help
>> -      kexec is a system call that implements the ability to shutdown your
>> -      current kernel, and to start another kernel. It is like a reboot
>> -      but it is independent of the system firmware. And like a reboot
>> -      you can start any kernel with it, not just Linux.
>>
>> -      The name comes from the similarity to the exec system call.
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +    def_bool 64BIT && MMU
>>
>> -config KEXEC_FILE
>> -    bool "kexec file based systmem call"
>> -    depends on 64BIT && MMU
>> +config ARCH_SELECTS_KEXEC_FILE
>> +    def_bool y
>> +    depends on KEXEC_FILE
>>      select HAVE_IMA_KEXEC if IMA
>> -    select KEXEC_CORE
>>      select KEXEC_ELF
>> -    help
>> -      This is new version of kexec system call. This system call is
>> -      file based and takes file descriptors as system call argument
>> -      for kernel and initramfs as opposed to list of segments as
>> -      accepted by previous system call.
>> -
>> -      If you don't know what to do here, say Y.
>>
>>  config ARCH_HAS_KEXEC_PURGATORY
>>      def_bool KEXEC_FILE
>>      depends on CRYPTO=y
>>      depends on CRYPTO_SHA256=y
>>
>> -config CRASH_DUMP
>> -    bool "Build kdump crash kernel"
>> -    help
>> -      Generate crash dump after being started by kexec. This should
>> -      be normally only set in special crash dump kernels which are
>> -      loaded in the main kernel with kexec-tools into a specially
>> -      reserved region and then later executed after a crash by
>> -      kdump/kexec.
>> -
>> -      For more details see Documentation/admin-guide/kdump/kdump.rst
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +    def_bool y
>>
>>  config COMPAT
>>      bool "Kernel support for 32-bit U-mode"
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thank you Palmer!
eric
