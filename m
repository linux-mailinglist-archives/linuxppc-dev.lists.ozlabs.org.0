Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C19738EF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:37:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wEk0UXyq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gEgcnhWu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXKq193hz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wEk0UXyq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gEgcnhWu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlqpl20hBz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 01:11:26 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KBNxNc004103;
	Tue, 20 Jun 2023 15:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=hSmm6XgeYpP24tbLDZ96Ps19HSdZ+e+EO2WTie7h2IM=;
 b=wEk0UXyqcLRdErNAYC6KmPubiVOGcWgL62lYcJRmXmZn2OoQqMINvAQdj62SKBRuzadT
 3QR6CWeyj+/lNCUKMP0ylPpU+S5kPaJ02KFrwlRL+ryko24OyVbTHjysIl8dgi6pfdp4
 AlYUAjXsfVCzRrKy9tf1uKwdKKYiBlbMaY/vssDABCOS7e7OsP7sLzW6PscaNQ4GTb21
 VQUDgjuYITfB8ci3rO5WM4Arn62L3akPfSqu78sT2orw8gc64n4PaZwGUvC7iIui2Uw0
 98LIkgaVTkmeuqTNfmJGz/8NvMyQD3VCiJjoNdQDSyBnb4IRjou3n41XdMJvHLnUyePo 4w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94vcn301-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 15:11:08 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KEQX3a028882;
	Tue, 20 Jun 2023 15:11:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r939ar1pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 15:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0IgHl+p4RWnBHFXuNBgOIYukj7uKjcl4w9wOO/PBRjmv5MFgz9wCSUJ0yTqIpljOP7ACnX9SnvuYPaOxx9iKAVTDalysSsoq0uUdEPbDBlK1tHf0VGyEEZnf0NqfTA/5XTFAthwPZKrRnrH6Tbfrw+dW7qD88a338AhtOa2mcOy52hZN9+pyVKkDHiLKzMRsjDYdWnqXvhsdCTNFIdPVAtMV+9lmUPXacwevK8lGvLqPgHmEaYB05roAcUOzfBkluDR7bl1ZypWQ0HK+8PP7K7rY3+uiPP9YoO2ygkvWeIRhtlZIZ8ifXl89jEzHd5juXeiJLF+v8Eyian9bzFkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSmm6XgeYpP24tbLDZ96Ps19HSdZ+e+EO2WTie7h2IM=;
 b=Henmc+l72uV07gfffuaM98vYDRjnA7M/hnQvyUDf9Ez2ubeoA2zi4Te1xqjUvCtXdQerrYccnU2aGpOakwfG/zHXdX2W7mo6YXl5hS0VU68K54IvdniEFDopPsTsu7CSI3PG7/3WTroV8WRF+tVaTTXDM50S0lJJwSQPJJ4V7V16WnQ9KQQED04e1E70P40BvcrhpIxfMuzHB0Xw8Hgw2TxJlWmcKWO2JJIIfqixzqPuKKHcG3uCtuVyWBBf56h4Z6wpwOkq0qRHtY5oKnZ1QZlGBDnNww/igwnJEr/8RIbp5bw5z6c/SsA8uLhxdemkHMfrciku3Jv7Y3RtG3qX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSmm6XgeYpP24tbLDZ96Ps19HSdZ+e+EO2WTie7h2IM=;
 b=gEgcnhWu+YsTNsOExyaOf+VHFIprast3M/GrT8F9TWqOFUwO8qANnhXM/3FPW8gsCzXKCo1Ex0wp6damUuSrqLLeqmb6AQy72qdVQK/7MosQl4n8I70pBft8G26MCklrZVP+qiuvOvkn3lWXAuv5Kx07THVwXRxPVbO5ZAOdPR4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB7830.namprd10.prod.outlook.com (2603:10b6:806:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 15:11:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 15:11:05 +0000
Message-ID: <cc75346b-18c8-9511-72a0-8a91fda448e8@oracle.com>
Date: Tue, 20 Jun 2023 10:10:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-14-eric.devolder@oracle.com>
 <5c66d9a869e24e795ae242598935eddfea095730.camel@physik.fu-berlin.de>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <5c66d9a869e24e795ae242598935eddfea095730.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:805:de::46) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: aa737e46-6b1b-4330-0c8c-08db71a09181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iEoxu4wBbDMg0Wji444o28uJSg+Y5HNevwhq/rAPU/49EZCJho9EVHV7FdrxxjPyKlujZAvU4PMlEe7jeIDkOXwLwOYELJUhzm0A/sBi5XvCzgKew9ZJhGsRaaxN1sDu2E0+/kVvHPNvoPrqcbbm86djMnNPZeYT4qjI0SYmOjW6EvNPwdejN4okQgVnZa5PGqMsJJ1df8S4q1CQiTbUZxA5+3QkjGeoyh0XTf1J4YYNpSr7s/iqa+VhZT294Q/BFkhiZC4MQ3i5Vj/k0GWR+LMER9xdk9ZPZOupawCVbxEUfiT22WgYx/krCla1kt6O8SLfgTz0R9B6EhJdKLLPeJJJsWJN7+Zsj+P1NrIYDB/CGBX1lxgMtnUnu0uhl7cOHO+yJbae8QlpGVwFPKIBk4JyUoFoUtQzWe3ahTqH93dV5RY0JKNiyUbPgDMnKGzLTBddDV9zbatBdSo6Ocp2GEl3ze6wkEbfQmyUj2ucXD6WAjJpYil8k3mUG6iZi3GhuLailAwDhEZgzACi/l/DRCpSCA++kZmITVGkeXV8bqFYv96WYP/rLdKLTlxQrz+9Ye3kHRRoTR3RUukrQnp6B+2GWZK3HYWBku4pn8bu6B3h0P4FvSDxp547IiBH2AhtjJM5EdEy9mcBGqrobUKvs+ZN0JiW9NQUDjqbOduYQjQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(186003)(66946007)(8676002)(8936002)(66556008)(66476007)(5660300002)(4326008)(6666004)(6486002)(316002)(558084003)(478600001)(41300700001)(36756003)(26005)(6506007)(38100700002)(53546011)(6512007)(107886003)(7366002)(7406005)(7416002)(921005)(86362001)(31696002)(31686004)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bXowSXhid21zVnhlUldxQVVsQ2ZsMXJqb3lsM1VDV0hZbksyeW1DVm9UcGQ3?=
 =?utf-8?B?ankzY2Q3Tkxyb0x1ZVlzOFFOTHhCWWlzRnRFUXJYTGtIclpVWWtHcDlvdGph?=
 =?utf-8?B?TE00UzRRV2NOT0ZYMzBHcUZPSEtWYkpNVmxpdTdWUXZLWk40ZmxocUd1emZX?=
 =?utf-8?B?Y2pwMmh5ak4xWEpOUXJkajJEV0xMYlZCVUxDZEtFL1plaXBaR0RCYXc0R1hQ?=
 =?utf-8?B?ZFhIMXdUeG9rR09VQzBFT3NjOFQ3SG1oWE1nTDUwOFRaVTBLa2FOeUFzS2lP?=
 =?utf-8?B?SFFyZ1ZrYmxXYncrbFJTTTBxcDdqOWovVGU0bnphcWtUVnp3YVdKL3F2WDQy?=
 =?utf-8?B?OEY1SUQ2UDFnYTcrMGhpSkkva2kzRW9kc3ZSZ09aeEJlZDB0V2U1a29Rc2Ft?=
 =?utf-8?B?Yi9GbzB0eHhNcEFqL3ZZVWFGTmRpS1JwcUVQQTN2aXhoUjM2dXhZbjhMMzZ6?=
 =?utf-8?B?TmdqZFFuWHhWZ3IxdHQ4dnZxY0p2dnVwVGFIRVZSVGpZTTdCZmJuNHZERVRJ?=
 =?utf-8?B?SHJ2cnV5L1ZJcHVwcis4Z1FaT0ZNS1NNMlovTnk0bVFNaGh5UmxVemZKNnlN?=
 =?utf-8?B?NTF6TUpPRmN4dVRSdmpCaDJzb0hPWnlpajVkT3MzRVdHQWtwOE9CcWsyZlFi?=
 =?utf-8?B?WEFCK0IzMGN1WjFiUHRESDlYWTJmMVUxYS8rV2NGMkhsWVJtcXA2Q0wvcVN0?=
 =?utf-8?B?RWp3N2ZkU0x4TDRwRSsyV2ZScFZ3c0NvbGpFRjJXenpCMVhnL0VzcGtBOUJ5?=
 =?utf-8?B?QUROZDN6T1lCbzJBUUY0NVdsRkpGQ0JER3ZiM2tOWnVYbTRDbW5NeXpqa1dr?=
 =?utf-8?B?MGJXaGs0SjZMYmg3L3k0bjJ2UFJGNXpERitES0dnYTNXWWtjZ3UyZWNWWldo?=
 =?utf-8?B?V3EycDZWMU9XVCtWK1dRckdmWTljSEpDaUlKOU4yY0VKUExCOUsyaDR3eHB1?=
 =?utf-8?B?MmVjOGtseXYvaDdWcnVPVHpQczA1MFYwNWhBU2ptSWV3VEtKT2U5ajM4Z1ZN?=
 =?utf-8?B?dFNhVFNoZWV2eUlvYWIvMGE0TXBsejdmZlRpSFVkT29tcUQvdG14WTN6U3h0?=
 =?utf-8?B?bis3cmVmbS9veDFwdk1OcklMSTVWMmJwYmRlRi9QWDd5VmFWNU9FWU5wUEVm?=
 =?utf-8?B?ek51dTluVGdXYy9iOGxMd0dGcVRIMnZmamFleVpxcm95UVlrak9PZU5KTnFz?=
 =?utf-8?B?dnJEd1g1U3ZRRlF0eFA0c211NDVJdk1HNW54U2Z1TG8vSjA5eUZUbkY2YXFX?=
 =?utf-8?B?SHV0d2F4Ni9BeE1XNHBjbXNQWnZTd0NSbDQvcG5TVUtnaThycTZ3N1d5eUg5?=
 =?utf-8?B?WHVYcHFJRmNZSU8wWnV0UHJIWW0wS2N4MnZ4ZFkwa2tkS2c1Y24vQ09wbGVR?=
 =?utf-8?B?a2JVMFhiZEU3QUgyV0hWU0Jad29NZGZML2lOSG1CTkNXQmROaUwvSlNxWXR6?=
 =?utf-8?B?dVczR1hUL1g4bUt5eWpaUnV6Y0dBYzdFMEpXMXE1ZEdwcHdZdDRhUTBwQ3Yv?=
 =?utf-8?B?RVNXTytka1lEMVdkQ1piNHk2a0Nnckc2Yk1idHNiVHZXSlpNa0JiRG4rSnlX?=
 =?utf-8?B?cUgrWWZiTkwzS0tLdFM0WHp3YktIK1pGY250SUdRbUxNZjBmNlgyYnUwTDRV?=
 =?utf-8?B?MlpaS1pRc3NOSVRVdFEwREFvdVI1a0Z0aGI2WjRNVm1ZTGhrQzRmODQzeFVB?=
 =?utf-8?B?OFVJZjlFZE8rdVdkZVhaOVcwTzVaZWNYVms3TFRxOEs0S2xPc3pqYlpSRjl4?=
 =?utf-8?B?MHM1Q2U1OHpEUndkWEtDUzdFUDdqcFFTZlprRjlwUkY4K2FwUjA0QnZ5ZXVX?=
 =?utf-8?B?ejJGa2s0VXI3bTUvL2JiZ2wySGVHSSttM3M5RTVOR2ZhOEp6a2NZRXhSRmVE?=
 =?utf-8?B?MFpScjNzSTVMdVZ5enBuajJWUnY3UjlxM2xMNVloVk11Vyt3TXFDaWZubENp?=
 =?utf-8?B?eWhWNGl1d1gxTW1tYVZXTHNKVUE1R29GeGdLa05lWk55UllSL0Zvb1R6MG14?=
 =?utf-8?B?ZjJlUGlXRjk2MmQvR3pYZ3kzQ1dKRklJWm4raVlSajdCazczeGdBdFE4bzNu?=
 =?utf-8?B?WlB3WTFIa244K1JIWmljd3Uyd01nSFhna0VPa1g3LzFvOVZONWF1dEJMaHpl?=
 =?utf-8?B?amxURS8zYmdZUWFnOEZHMVQwMVJRajF1cXMzM2RJMXlxYkhNYkJBc0tneGo5?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Z044WXozSkVEekNQck1kS20yS3EyaU9yM2x5WWU4K0U1R3Z0aWY4YVRsN2hN?=
 =?utf-8?B?UjYvdEZNZUVCL29oNzZiSGNCQVIza3BEdTI4a3hVRFRvVXVLdVZMZGdlQXNS?=
 =?utf-8?B?N0JWRmIzNy9XSWJHa1U3Smlab2MyN3oxQTdMbHZxa0p5L0dUK1hBZCtJWUl5?=
 =?utf-8?B?K0tYYkNZbFZFTDZFQjcyK2wyS0NYRjl5dXNDYXJtZHVIVnFnZnZ6V0JKcFhu?=
 =?utf-8?B?ZlZ5SSsranN5RzhiQjdyWXhpSUdrQnlrTjhHY2Y2Mkk0a1k4WmdVS2VlZTRU?=
 =?utf-8?B?b3FUdnU5Qkw4cmlNUW9IcXlPNkRtVUZOVHM5S0p5dVcrRXRtWUFEaFlKMHk1?=
 =?utf-8?B?QlJqVnlNTTF3WGdmSStUVGhGaU1uWG0vMGJac3IvY0Z6QlBhaFlTNFYwWTNw?=
 =?utf-8?B?aEJrZ2hjamdUcFJQcUxlK0ZmUEVLSFNrb2tlS3BtbHFEeFBhNmFQQXVFSVB2?=
 =?utf-8?B?cGt0UUVhRlMzd3RYMmJxZFNTd003WHJEeWJxbEgwQ1NuTXE2OFVFdXUycE93?=
 =?utf-8?B?SEt3VDZEMEwyV1h2MCtVR0lIZlZlRW1sUEFFTkRvc0Zza0U0RVcrbjVNckta?=
 =?utf-8?B?RlRhcTl5MGRZTXVsMC9kUTlFU0l4WW1RRVFQWVh3ZHhJQ0ZHRHd1ejlXQmpx?=
 =?utf-8?B?eWFzRmUwSnpnRFk0RkRNUXJ0NU15NUFHMjY0Ym9PV3NQclhweTNXR0FVUTNQ?=
 =?utf-8?B?OEllK0l3Z2VaRU1XZzVueGVOUUgzbUdSbGtYdWw1WXJBNEtZeGc3TnR3WFo1?=
 =?utf-8?B?bkV5VHRWRFAyQXFCR0wxZGxyZkJUaEFkSmhrUTF6SGE1aVNlSm1uN1U2RFJ2?=
 =?utf-8?B?bnVCL2xIc3JXUFdkeS9NRm54ZUZ4am4zTmFhOFZPRzExM1MybEJlaE5TOEN5?=
 =?utf-8?B?NkdWTWdTUGdXNnVlNys0Q0MrS1Mxc2ZLLzJxcVpvRmRDK3kxT0dKeGErbWlQ?=
 =?utf-8?B?ek8wZ1Y5V0tDQjdjUWlyOG92WVlqaHlqOTNNY2NnMEt4N3prTEhhMmZpSWZR?=
 =?utf-8?B?VUJZSzdQalJHVkFPdnBKSlZPZ21MNWkrOXJEYWhTc05lMXI3bDNUQTlKZjZk?=
 =?utf-8?B?ME5FUnJYV0plc1UzWVVLV3Mrb3VLUTgwdDg2MWFxY3NkRzFxQk4rWkJNVjBy?=
 =?utf-8?B?MVNPYWIrN0t5bFVQZ3NobTVwcWw5U2pQTHkwMjV5blFTaGJUQk4xeldRZFpl?=
 =?utf-8?B?K3lSWnl2OGpJNjdOVVR5MW5ZZW85bDZncmVCbHhlU201YVhXZ2VsdnIvNlNV?=
 =?utf-8?B?bFNmaXRrVHIvMDZBbjFXdG5WUEI4OFFNc1RBMG5rWmorYU82Y05qb2UyOTl1?=
 =?utf-8?B?VG9iRk80RXFQazNBL25SUGxRYThIVXljRmN6cEZZcVNiRFpjUnhKZFBNU21V?=
 =?utf-8?B?d1pNQVU0SC92eTZWVjdlK3BEbitzMmNVM2NTYW5LblZQRmtiTHA4cEt6ZTBa?=
 =?utf-8?B?d0d0cmRPRWVXL25Gak5zMytONTlMSEVEZXpnOUVZMFRnTzhiQ3d0WlFodDZE?=
 =?utf-8?B?a3BhRXdTR2szZEZncUVTQWoyTldqS1U2Y2swMFVlNElmZFVOV29nSnNickFt?=
 =?utf-8?B?TW9XNUV3SHBFYW5pSnQ4NERabW9XQmo1M3NiWlBGNDFxOFZKdVNPSDljY2g3?=
 =?utf-8?B?ZFJMZGQ3NVJhakRnZ2NPbkxDOThXQ0V4aS8zclVkUDE1UlFkZzVvNmk2TVl3?=
 =?utf-8?B?TXp4OWhBcUZJT1ZybWhCUlJkaUN3TnRPRmJMN0Z0em5iZS92VDA5ZEEwNk1Q?=
 =?utf-8?B?dWRGQTZ1eGZseVRPaWYxMXZHUU9RcjhQbHRIaVBCZ3d0ZlE1dmJkNi9XL2Fi?=
 =?utf-8?B?T3ljV2h0OEtrSDYwT1M4Y2dVcExlbnBHRStVWmQ4OTAxbnY2ZldlYzF5SHRP?=
 =?utf-8?B?ekp0aitCVW1rM2luQlFWaTdQSGdUa1IzKzR3ck1LMDROQVV2UitjUTFYRCs3?=
 =?utf-8?B?Wm9zWEkxaTlLUTROTFBjV2JZT00yVTFOelR0djFGVFpvNnU2aVZEQXRvVjNk?=
 =?utf-8?B?MXhLcWZUQlQzYUpmU0c0Y3h2bDFESk81VGJyNVhya2hkS3k0NUlydlNYaE5R?=
 =?utf-8?B?NWFQQ3RwQzdKdVk4RndUYkl3YmUwdERMYndibWV3TS9sdWF3cHJ5WU0zSEZr?=
 =?utf-8?B?c05mcXlwL1lYQUg2dld1Q2dMUllOaHU1M04zalBndWlMeVFVQXVTdGJyNTRK?=
 =?utf-8?B?VHNXM0RaU3hEMUNHbXlQSW5rTjVNWThFbzJrZTJpRkowOTIyTjBZb1FXK1E4?=
 =?utf-8?B?SHFYSjh2TWxUZ2RvaFZ5SElTOTEwTHZjT2VrenNyY1RVYU9LdUxJb1hOeEV4?=
 =?utf-8?B?MjNyWnFFUDRna1BpTlBGWldjL2sxaStrKzRGSEplK1lPYTE3Y0pFWElyelIv?=
 =?utf-8?Q?p56G09/uhJ5YxshRbgxTnocr+uI3NvtTUbnwujLPl1fzg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	llfe4eFxQZ/ZCTfyXaAPbYwjt8gBuaUhIhAR7ZDLcciQrQ7xsDLDxSPywr31y2RBTR9kPg52qS12wNzwiZT9wV4D8s+Msw7n+SF49G3lG1gD23M5iVu8ACJOrvQR+qiKPE2jFYgh4fkAQI38sVNfYtU6qYcwGSjjQYNqNAnY6AsqZCzaAAWBhp3xyHqh73ZtQ6f/iE9n5iVTQZ1afZUmvnWKsdCq9+fHaS3NPDnMFpMRYTdHUayTiQN/5teZ4YqRuwD2zo+0rRezFfcSHcKT7o9c1ZbklEta6Jeolp278ni8QvEeZ1WuXSGzXU9RdLUsPBiSpR1ZeLJcMT3YQDJq3oxkPsD0MqCOLU9Ob6oS57Sn6TqIhXP25NCIUHTeXBmx9gqnciWZmqzZGllEWKvTz1GGhAV8AlE1CE4AAbyXxT9OOn9T0vmW3xIkMoLSR0zupmkLMlooZahgVQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa737e46-6b1b-4330-0c8c-08db71a09181
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:11:05.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9deLw2SF0APDokiC7qZRJ9qIFixxwcbbobZodzZtv0y8Rvba2Z4WTVNkxjs6NYtC845SleWlN6pByBlMJ7Mj60Addn0mTTVaxUrFOec1mAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=717 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200136
X-Proofpoint-GUID: Q6MCF1Aq10CKq68-vpgBaYQwqTevAuhW
X-Proofpoint-ORIG-GUID: Q6MCF1Aq10CKq68-vpgBaYQwqTevAuhW
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/19/23 13:21, John Paul Adrian Glaubitz wrote:
> Acked-by: John Paul Adrian Glaubitz<glaubitz@physik.fu-berlin.de>

Thank you!
eric
