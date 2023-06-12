Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E172D004
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 21:58:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hE9gLc9s;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Rh+kyReq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2Yn4DG6z30fV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 05:58:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hE9gLc9s;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Rh+kyReq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 365 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 03:35:16 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QfzNN6CPtz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 03:35:15 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNo3N004946;
	Mon, 12 Jun 2023 17:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=NZZuJxOyu0pQQjE0DdROCOqHtPvJrreQOuwr7rzXmRQ=;
 b=hE9gLc9sobL7/YwCwFgz5NPWd9JSPM6k5frtWIdM9LGhc2ep9cMkeNdco7dAavQjz3LE
 SxwMy+i1TlBMWbpwszTxuRzipdMFUHANG6bShyNzx/Cq8DXZmHIhENE27w9hXnVwo4+q
 Po0OtA/BVhnBPJ+PRrLTvUHA7xc1ctu7MqXy+mEDBeLrC99VRAHrtp5Kep4F1MJS8wFw
 x9lGAQ5TMo3LrhcGRK4WRNv5LI44KrO6g7VTrfmExoaMdoRWLYSIwUp4DNlpLrkJQfti
 nHHB/0VsJNUOZzw3OongeteNmoR/fvgeek0OrOEyWgy0w+f27wbGNogzfSb4fZ30DxCT wA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fy3bg6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:32:57 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGk3SH014029;
	Mon, 12 Jun 2023 17:32:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm2u4cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:32:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAZFonD4EjmulWOmrTfiqarjY8kxTOyVku46w6XjXLWgkTBzp6+Q9IKyQcl+h1SQJ57nCyGtGufaqmosrdcvFip9uMZzpTCJwc5t9MWeyqhzwG02uxYjD2xtFtRCYv88cNCb09Pd/kbnZqb5YMgKKgCeSXapbhDC6NiFZGSfLnCCN4NA+wElEacr32EBf30KMuf6CNWDCGhuBGZJprjIhydBNdG0two8CXu97ioXmiFe7/ulh7w2Z3/Rfn17Sa0CI9Vo35Rhl5z17LJ1wlMOmIC38VSpAwFZ8hCUdn5v4ngjMwEwgEl5d8qMAWBP0e3b28OJZIUXhRxQgSrU+Ydjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZZuJxOyu0pQQjE0DdROCOqHtPvJrreQOuwr7rzXmRQ=;
 b=T8W11fseGf4XpgSQ/IAwEl60KgRM05RtiXyqvFSlEIfHFwf1fPyepotLhaWKHZQ6cfW+I7pw0LSsX4W+GDRJ3JmCHpH4zI+uQSO1q3qU5Rs5VJCd/IxKB041F3Z7HsmlUCdWT5Kq9iNaJ81zT2y1C6ZLOG5tbl7CjQr9fmR5zvydVqxGNrdS3fZ6QQdUceAngweeGbn8HrLnf0pJ/f0wfM6guVvEwsDb8yJdlXfPQT/1pp7vEktFLydopEddMbFCt39OJ+gD1D6TSz6XDERDgJNdyS7rYa3u4A/hM7rlmjeLv8QJPyRPfqRXOAFIocMZK276ltzgFRFAF23v7MpBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZZuJxOyu0pQQjE0DdROCOqHtPvJrreQOuwr7rzXmRQ=;
 b=Rh+kyReq1renj3SX5mSNb+Ch0x7gaeBZuQiiCMHWl3QizEpxOvPx8XlI745FWdZvPFcEeoUb10jhe9ewaKxB+IauW09u28x7i/X3aLc/PuQxJnTw7LgvoN392GB4e54QJZEEeA8/KkP2J+KUo0R3VZhrxQOTlvOJlxyt+fBZk1E=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:32:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:32:51 +0000
Message-ID: <de4c557a-c592-d9f7-d516-bc746d153fa1@oracle.com>
Date: Mon, 12 Jun 2023 12:32:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and CRASH
 options
Content-Language: en-US
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20230612172805.681179-1-eric.devolder@oracle.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: a47605ce-09df-4430-5614-08db6b6b0c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Uo1EMfd9VWaeBBNheHpJInFMrYPOEmNxaaFS3/7oEoJaAyGxlpvh39hM3NrSHHiLRM3OtWOwhzuXfXJZfqWxwxYEFtpG8ODemLxUQ/4DzvQ84xRtPlW1lw/HNNuSj5jx6M7b3toxZgf8egnW/b350WPorKZPTYI+ySFWhDmPoWgwT7/L/QssGBqLVWlyo2uXYTiL6KhYeg/VEdyx5CAZKeJVdCFmoDp3c3rkFXzzWfCTkeTAVvTFzjJbkcxxG9Ya/xAXsGwXQfXeAGr7YniR81YmgtXeujqnUx3qLXgatjD7DSolCHcg+ODbtKCW8EbmoxesegoEIGbKWCKUhbngcgRFlkodjo4haod+SRS5ej/SAt6aowy/vvsky3zpmWo3TSHWvNh0QRH8XvgmYAFf4JEq027SjrPKB/pvh6svHAgQTuGwHwoekbdU8zvISM2rbgcodTQoW7/zuLx0GcKRmGtifSXc5alljB5MJKu+P4b9XNmBo+GuMn6R+PsJQs4cdFyK3QIkTXjidYVEekUTli+/r9zl+pALP/qsgWE7OfrxSw1YT+HBbscQGQ4psKczZkIcRGWcfZtuosYi//TzbHrHOp2F34JC8MpAAL/zs+vQZzs9z7IY14l5mKzNwP7Sof0yC86z1y+o9Za1JM5luRzew4UdT/6Aa83k5wk18G3DCEtum3BVNmJ8su4SgSNp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(31696002)(86362001)(36756003)(66556008)(4326008)(478600001)(6666004)(107886003)(316002)(66476007)(66946007)(966005)(6486002)(8936002)(8676002)(41300700001)(5660300002)(30864003)(2906002)(7416002)(7366002)(7406005)(921005)(38100700002)(2616005)(6506007)(26005)(6512007)(53546011)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aXcyK0pHcFZyUEpmbHBnWWhOMVh0SWo3Vm95Y1hYVGg4Z0FjQmZCN0JVaXUw?=
 =?utf-8?B?MEs4RnFWYkIzWFdnUVFsZjY1U2lqTGZXNUZZOGVwekJiMU5vSm1xeHpKekdr?=
 =?utf-8?B?b2hxZmJCTytWZnlMVGxoQlZiK1p0N3YvbWNya2V1WG10bVF4TGI1aWI1b1Jv?=
 =?utf-8?B?QTdBNlpqWWkrczM0U2Jac1NOMktwZkpCK0p3bGxVWGdCcnd0dldiNDVOendj?=
 =?utf-8?B?c2J6OWtJbDkwcGY5SGQwS0lqSFQwaFNDWHc1M1dnRnRpaU1qUnpSdWFiS2FO?=
 =?utf-8?B?d1lXd1lpMlV6SUhMUEg1QnhHeThrREhqMFEzTm0rU0NQeUNiemhody9hOVZS?=
 =?utf-8?B?Nk8zZXJEZzd3NzRVOXZTL0dMejNRQUJWeEpYcGVlQjgvSlh6UnRyblRCNVNH?=
 =?utf-8?B?d25Ga1IxVlhjKzBDVjJobmMzNlI0eWlYV0pacmhXRWRLWjcxRE5ZZG9kVFVV?=
 =?utf-8?B?dUFKOW1XbkZGMDNPUGNjYWNBS0pUSzcyaVB6ZWpCdjJUUDVuRzgzbnFBTER0?=
 =?utf-8?B?cHU2SC9EKzZoUGFaMFU4dXBRZ1pBYnAxMFdCOWpFaDVkRjlSQXhWR1NpNjF0?=
 =?utf-8?B?c09EQ1hJeXNlSzJFNVY3bDVoWDMrMkliOER3emVYMWNxOThHRWZuT0tDbWFW?=
 =?utf-8?B?a0xhN01ieHpZUVpweDFmVTZVTDZwNG5uMm5kUlB2bm1lRXgyMUVraFhya1Fx?=
 =?utf-8?B?MzdCYnlzOFZqV1pDV21EZm0vT0lDRVBHT1Rjc0xMWVhRUDhUcGFoa0ZWN1RX?=
 =?utf-8?B?ak95QWVWdFRUYStNSFRwVXNjK2ljd3M1VDJydDBGMlI0K3Fzc1kva05yUG13?=
 =?utf-8?B?TE1lSGNpUjFsN1pUQnhBb0g3WEkyb2h1aTNDSUU4K1ozMFQyNUNlMnhpdXZr?=
 =?utf-8?B?VysyM0pyV2NnSzJKM1JDNXRKMTJoZWVxZWhaNHhVNG5EQ3hsV2c3MjF2bkhq?=
 =?utf-8?B?UXZXTC9DNzRObFpISXZHMDZBd3VLN1ByQnNtYmF5d1JjZld1bXZuQVpOUFdw?=
 =?utf-8?B?Nit0VzJMVzZuVjFoeGtqa2RSVzV0R3ZDRGwvY0ZUWGh2T0I3VWtNbXJjMXIx?=
 =?utf-8?B?Ykp0YUxVV2JxQVVTRHRqVnBQQlNGdGRCa0hianE4U2Q0eTVucEtzVnJEcUdT?=
 =?utf-8?B?dHFZdHlvYmZPTHJBNjV1YmVoOEZJdDhxS2RvT1JWZlFIcjc2OThJbmlVbm9M?=
 =?utf-8?B?ZTAxdVRxNkVCbTlWUnhwUk9VbDdQdGkrVWNDMUxyR0kyYW9GbWhscy9RSytN?=
 =?utf-8?B?aDVGSExPZ0xzM2FOK2hQNmNZSmhvZkZYSVBVQUMrVVR1WW44M1U4YUhVa0ls?=
 =?utf-8?B?WnlrTU82RHZoS3Rqdm9WenVjTXozVnd4Z3Q3Vm5DY0RFNEdPakkvdkdUcmt5?=
 =?utf-8?B?RTN1NGcrMENYTnJKTUFNV1VFc0dwSjhUeFFQd2RSYzUyS2xaQWh2RFI2S2kv?=
 =?utf-8?B?d0JkK1cvU3NyU1Z0QjVONjlvYk96c2daeElodTRwYS9mbXl3alJQb3BzYVhu?=
 =?utf-8?B?Nk5SbGtDOVVpWU80ZzIwdVMxdjlUUnNPRzd6bW9QVW1LYTdDclB2c1MwK1hu?=
 =?utf-8?B?U1VxbWZlS1dNOVp2S0VPMUIwcU9KbTlzNGRjZk9ZSU1mY3Ywc2pKNEpVZlRz?=
 =?utf-8?B?SE11NlhSYTM3dGtjVW9ObVovdFBNdWhiNzhscFNuRnhxZXBLUkE1N3U3YnFl?=
 =?utf-8?B?K0dZeVBINEZ4RkhFK1BBSmZQV05UL2ZtNWZhYVV1L09KZnBjT0pqSVR2T3d0?=
 =?utf-8?B?Z0JURjhKakF4VWFxZUZHWU9COEZHeENBZXkwMERjeWxkcXB0NGpFdWk2MEIx?=
 =?utf-8?B?Q0pHZHlrM2R4WnI0QWF6NEF1SDkwVFRyZlFtVk5OKzRwdXFGZTlvWFBMSHhs?=
 =?utf-8?B?QXRwZUVwcUYxUllqMktYcjdkb001bEQ2ZEFDUnhKcTBhZFNzWEphT3VRWUg5?=
 =?utf-8?B?WUNIRnhteDJPQkdLSytuRkhndjV1cWhka2ZMYVIxYks5bXhwL25nRm1wRzRh?=
 =?utf-8?B?REpYNjBUUmduK0F5UG1XaFcyZzZCNDZIRGc4R1RpbWhPbHNTYmRtVEFHOWRU?=
 =?utf-8?B?NVlMcjFJQjVBU3JuWUNQNE1Oc0J3bzJQWW1ZaVVRMGhUQUFLM2pmM3VaczVp?=
 =?utf-8?B?RjJLbVZFNUhTSVJNSFVMOVUxSmp1N0R4WWxRbUg4RitqV2s3NzlIVmxOcE96?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Szc3TnBYcE9pem5BYUpkUGxBWWN2Z3ZWdzRreXFacmQwS2NOa3gxSy8rcDVC?=
 =?utf-8?B?MDJDaUx0emNTc2hMTWZFTlRlRE5HV2xJRmU5REc3ck9OdTFsMU8yWVBlUC9z?=
 =?utf-8?B?VnoyV1o3NUhMU1V3bzE0djR3WFYzYk9UNnM0bFJqbU9WRG1maE1HYXc3dmRY?=
 =?utf-8?B?cFoxRTJwdnhKekpCekg2MkdiRkdUTEhDeWhxY0ZTR3JWQThIZ0s0Q1FHMEw4?=
 =?utf-8?B?UTdtaCs5NS9lUjBzYnludGhPakdWekRCS1ROZVNkSUlxYWFuMitOb0xxdXpP?=
 =?utf-8?B?Sy92M1VZT1FPam8zSFhRS2FtVHVFaEhlbFo0ZVVoOFA4Y2JyV3lQV29KKzNt?=
 =?utf-8?B?Q08xRHR0UVBMTGE4RzJIR1RPMkZ3Q1JEL0VTL3FVaDV5U05wWENKbSt0dC9s?=
 =?utf-8?B?U3RmeDgvVnpoUlc0RlRnOThrZjVKOXJWcTBnSG5iS3BaWEhadzVQVVY1ZUhr?=
 =?utf-8?B?UDhOOE1DY0VEcDdHa0txZWh2eStGR01iUnJzZ3AxK3VTa3pLSndGb2NxQ0tN?=
 =?utf-8?B?QVdOK21JYVI5U1pTbnZjSDR0N2dRM1o0SGo3SklkUUFldmFCRFpmZ1NtNGhK?=
 =?utf-8?B?UEVMYkVjaWNxOUdvMzQydUlHSkFjMGdJdG9DNVVhWGFWL09mQmJzNFptQVkw?=
 =?utf-8?B?NWtzS0tkUjJaRVUxTmNTVTVJcWxJK1RVem82ODhTWjdDc2pVVXg5ZDdLbDE1?=
 =?utf-8?B?dmhReVNKUmFsNEpuVWZLL1c2MkJaSDdwVldKaTIwZy9lYklleDlsaVUyWUlC?=
 =?utf-8?B?UXFzN3ppaGVuZTFQUXRkNXNQeGFRNUNGNTJIWm9kR0NsOVVrTml0cUEvYVZJ?=
 =?utf-8?B?eFM0ZzRaSXZpbFZJSlYzTHFDV3ZJL0s3UG0raVF4MDlrVGsxOXcvU2wzZ2w0?=
 =?utf-8?B?cG5LYnBYUGJjZHUxQXljVDZWT3d4SFllRlZvQ0NDaUpRaUIraWR2Z1N5WmhG?=
 =?utf-8?B?V1JkV29MK1dsM1JWUkxwWGJYVjUrSzZxalJObW52VW8yanZCQmljemJrSFFN?=
 =?utf-8?B?NHNrOTRFT1poV3pHZkZMd1kvQ3ZJTDVuWWxPT3pUZ2NCMTkzQUE3YmRZK0hj?=
 =?utf-8?B?K3VpRElCQzdKQk5UMXZjaGFETEpnVGRzZWpvMVo0WC9Fd3llUjNrMzZqaHgy?=
 =?utf-8?B?THhVOWVpM1lGWFFDN3hsaVRnakI4UmdFUkZOSHdUSUpOZFRqNmlrTW0wdGtu?=
 =?utf-8?B?WEYwMkRGM3BwNkw4MTZZb0x3R1ZyblJCVzZuVlo0TnJocGNOeVBiVWlMRnFZ?=
 =?utf-8?B?aXA2bngyTFFhbGVvRGJQSlR2ZU9aL0IzR1BpTUFXc2k3aVhsR1hzdjM0a0Nx?=
 =?utf-8?B?dW45N2pYZUphOUJ3L0lFTTZLQmN0bXZYam4wQjJZNlpMNE40YXpCKzdLZlpz?=
 =?utf-8?B?dFNNSmRlT2pjcVBlMWZNRnJhblJaTFl6NHdOQnF4L2xXbTNIc3lwb0EySWJi?=
 =?utf-8?B?dmFFUTM0d1JLblkrcTdnVzY2VkZUOEl3TVJpT01hL3NEWVMrMzBveUI3TnBh?=
 =?utf-8?B?SDZyOU1DTGlPayt3Ny94K3pnME9qbEoyZGJGakYwd0ordTU2c0JvRS9xV0Zo?=
 =?utf-8?B?OExucE5FZXRURGhCZ2ZGSVJPb1NiOEFleUQ3VlBpT1FtTW9NTGJqYjhUT21r?=
 =?utf-8?B?K1p4OWRLL2VPekk1eTZ6ckdRNllPaXFNeDhRd3J5c0tqSi9jWlhyMzBsQU1F?=
 =?utf-8?B?TElSaEMzZHM3WmZnODFObGJPM2ZRUkJLOUNHTFVHMExxb0dnbnZ1bEg3T3hh?=
 =?utf-8?B?UDNPQ2d6bWVyYmVwQkdnR1NBbGxOdWRjdE9kaWwwRlJtVTBwSnF5VGI3NWd6?=
 =?utf-8?B?Q09NUzUrTzJSdXgrWmpRQ3ZmMWdiQy9XYVBWajJDaDZGdWRjbzRxWjJIQUE2?=
 =?utf-8?B?VjZmSXhNamU4MW1aYTF2R0NqSE53UnFQT1kzQkhBbWlHazBSc0NjajFxN05B?=
 =?utf-8?B?RHJlQWxzM0t6dWxUZTRpRno4U0pDcnhzaDlBSDlzYnV3cEFyaHAyc1QxaUdy?=
 =?utf-8?B?TEVqcnc5Yk1SRXo3OUMyYkxOdjZCaWRVSmJlem1WeUE1c2lTcE5pK2Q4eFhE?=
 =?utf-8?B?bW1ZTFRTOFoyODJYV284cSthNTcrNUlocCtNR2I4NEx3RFJsQ2o3aUpJbGJi?=
 =?utf-8?B?MTlIdEkwV0lBdENGSDUvSXd4cXNMWlAyUjFEUE1Xd0YzRHFQOTZ3eGs0QTVF?=
 =?utf-8?B?d3FoVk1PTnRXeVNsU0dpdElkNXpiNWovbnA5Q3VPcTZpOEZXVHZQWmo5TmdH?=
 =?utf-8?B?enFZdk12OGs1UDVSbWNBVjdVdkZQVSt1Zmg5Z2NFL2pMbVBBUXJkOVNOVlVs?=
 =?utf-8?B?NHJYT1p4VUZIcUo5UjRsVC8ydEtLb0JjcVFKQWsvcEtVc255bTYwTi9DdWt2?=
 =?utf-8?Q?ilHEMiCaY0O6U0TGVHP43PFtIpYoagLogxY8WPo+hl1O8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	9cenXQ4F/cuRrvPWYSUbvzbw2U8SXgwg1XW8DBLXFDZErus6rhrlWnm2lFjpdfABWKO46am47SlVRYrNY/Qid28leSPTZZJxvwpNwXrHSTd0K5/Hc0LLpglMN4yvS3CecXuMiqW/jY+725R5mEZdl4Y+u/tkuLEzLzuLVlhW09Pwbv4/AxMPlNjob4KZSRrVkQLdtHmcgAlKPESVwjtxhA6J2DSPYDgoycKrvPN/tBUzlrqqgcvKtx85+8B4JtEfglwIccNyIUAFO0aUpwszV12YWu0u8bgXKZKqE+DJSDBDAnKfeEpyFz5of+A3nDSjK6KHZ2TmswFgMxqG/gjK2KyVQUeKfKCHbTYdsvsSqPpHb2iRqAeyXCm6zU3VSuIhDS5/M8ZIczhfxllvV+FU6IoUM1v+D2FKUsu9Ob633Aob8+z1dh2fMuqwnB7FzgGGvJt1Y4cKXC45YA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47605ce-09df-4430-5614-08db6b6b0c5b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:32:51.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WBCn6su3dzj1oOo1bwonLENeSYY3X13TNnSO+oT7nTRZKAaPqyEr8QWdMX/24MqufhmmDNsPTclfraDizs9QtuQnMqE0B+eN2STNkTu2Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6290
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120152
X-Proofpoint-GUID: iZLpZSe9WcldDRKjfA68tVFkgPcygnIw
X-Proofpoint-ORIG-GUID: iZLpZSe9WcldDRKjfA68tVFkgPcygnIw
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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

My apologies, but this patch series is 13 patches, not 21. The last patch is "PATCH v1 13/21 
sh/kexec: refactor for kernel/Kconfig.kexec"
I'll correct for v2.
eric

On 6/12/23 12:27, Eric DeVolder wrote:
> The Kconfig is refactored to consolidate KEXEC and CRASH options from
> various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.
> 
> The Kconfig.kexec is now a submenu titled "Kexec and crash features"
> located under "General Setup".
> 
> The following options are impacted:
> 
>   - KEXEC
>   - KEXEC_FILE
>   - KEXEC_SIG
>   - KEXEC_SIG_FORCE
>   - KEXEC_BZIMAGE_VERIFY_SIG
>   - KEXEC_JUMP
>   - CRASH_DUMP
> 
> Over time, these options have been copied between Kconfig files and
> are very similar to one another, but with slight differences.
> 
> The following architectures are impacted by the refactor (because of
> use of one or more KEXEC/CRASH options):
> 
>   - arm
>   - arm64
>   - ia64
>   - loongarch
>   - m68k
>   - mips
>   - parisc
>   - powerpc
>   - riscv
>   - s390
>   - sh
>   - x86
> 
> More information:
> 
> In the patch series "crash: Kernel handling of CPU and memory hot
> un/plug"
> 
>   https://lore.kernel.org/lkml/20230503224145.7405-1-eric.devolder@oracle.com/
> 
> the new kernel feature introduces the config option CRASH_HOTPLUG.
> 
> In reviewing, Thomas Gleixner requested that the new config option
> not be placed in x86 Kconfig. Rather the option needs a generic/common
> home. To Thomas' point, the KEXEC and CRASH options have largely been
> duplicated in the various arch/<arch>/Kconfig files, with minor
> differences. This kind of proliferation is to be avoid/stopped.
> 
>   https://lore.kernel.org/lkml/875y91yv63.ffs@tglx/
> 
> To that end, I have refactored the arch Kconfigs so as to consolidate
> the various KEXEC and CRASH options. Generally speaking, this work has
> the following themes:
> 
> - KEXEC and CRASH options are moved into new file kernel/Kconfig.kexec
>    - These items from arch/Kconfig:
>        CRASH_CORE KEXEC_CORE KEXEC_ELF HAVE_IMA_KEXEC
>    - These items from arch/x86/Kconfig form the common options:
>        KEXEC KEXEC_FILE KEXEC_SIG KEXEC_SIG_FORCE
>        KEXEC_BZIMAGE_VERIFY_SIG KEXEC_JUMP CRASH_DUMP
>    - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
>    NOTE: PHYSICAL_START could be argued to be included in this series.
> - The Kconfig.kexec is now a submenu titled "Kexec and crash features"
> - The Kconfig.kexec is now listed in "General Setup" submenu from
>    init/Kconfig
> - To control the main common options, new options ARCH_HAS_KEXEC,
>    ARCH_HAS_KEXEC_FILE and ARCH_HAS_CRASH_DUMP are introduced.
>    NOTE: I went with ARCH_HAS_ due to the existing ARCH_HAS_KEXEC_PURGATORY.
> - To account for the slight differences, new options ARCH_SUPPORTS_KEXEC,
>    ARCH_SUPPORTS_KEXEC_FILE and ARCH_SUPPORTS_CRASH_DUMP are used to
>    elicit the same side effects as the original arch/<arch>/Kconfig
>    files for KEXEC and CRASH options.
>    NOTE: I'm open to a better name than 'ARCH_SUPPORTS', perhaps
>    ARCH_CUSTOMIZE ?
> 
> An example, 'make menuconfig' illustrating the submenu:
> 
>    > General setup > Kexec and crash features
>    [*] Enable kexec system call
>    [*] Enable kexec file based system call
>    [*]   Verify kernel signature during kexec_file_load() syscall
>    [ ]     Require a valid signature in kexec_file_load() syscall
>    [ ]     Enable bzImage signature verification support
>    [*] kexec jump
>    [*] kernel crash dumps
>    [*]   Update the crash elfcorehdr on system configuration changes
> 
> The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP. In the
> process of consolidating these options, I encountered slight differences
> in the coding of these options in several of the architectures. As a
> result, I settled on the following solution:
> 
> - Each of three main options has a 'depends on ARCH_HAS_<option>'
>    statement: ARCH_HAS_KEXEC, ARCH_HAS_KEXEC_FILE, ARCH_HAS_CRASH_DUMP.
> 
>    For example, the KEXEC_FILE option has a 'depends on
>    ARCH_HAS_KEXEC_FILE' statement.
> 
> - The boolean ARCH_HAS_<option> in effect allows the arch to determine
>    when the feature is allowed.  Archs which don't have the feature
>    simply do not provide the corresponding ARCH_HAS_<option>.
>    For each arch, where there previously were KEXEC and/or CRASH
>    options, these have been replaced with the corresponding boolean
>    ARCH_HAS_<option>, and an appropriate def_bool statement.
> 
>    For example, if the arch supports KEXEC_FILE, then the
>    ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
>    KEXEC_FILE option to be available.
> 
>    If the arch has a 'depends on' statement in its original coding
>    of the option, then that expression becomes part of the def_bool
>    expression. For example, arm64 had:
> 
>    config KEXEC
>      depends on PM_SLEEP_SMP
> 
>    and in this solution, this converts to:
> 
>    config ARCH_HAS_KEXEC
>      def_bool PM_SLEEP_SMP
> 
> 
> - In order to account for the differences in the config coding for
>    the three common options, the ARCH_SUPPORTS_<option> is used.
>    This options has a 'depends on <option>' statement to couple it
>    to the main option, and from there can insert the differences
>    from the common option and the arch original coding of that option.
> 
>    For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
>    KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
>    'select CRYPTO' and 'select CRYPTO_SHA256' statements.
> 
> Illustrating the option relationships:
> 
> For KEXEC:
>   ARCH_HAS_KEXEC <- KEXEC <- ARCH_SUPPORTS_KEXEC
> 
>   KEXEC                      # in Kconfig.kexec
>   ARCH_HAS_KEXEC             # in arch/<arch>/Kconfig, as needed
>   ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
> 
> 
> For KEXEC_FILE:
>   ARCH_HAS_KEXEC_FILE <- KEXEC_FILE <- ARCH_SUPPORTS_KEXEC_FILE
> 
>   KEXEC_FILE                 # in Kconfig.kexec
>   ARCH_HAS_KEXEC_FILE        # in arch/<arch>/Kconfig, as needed
>   ARCH_SUPPORTS_KEXEC_FILE   # in arch/<arch>/Kconfig, as needed
> 
> 
> For CRASH:
>   ARCH_HAS_CRASH_DUMP <- CRASH_DUMP <- ARCH_SUPPORTS_CRASH_DUMP
> 
>   CRASH_DUMP                 # in Kconfig.kexec
>   ARCH_HAS_CRASH_DUMP        # in arch/<arch>/Kconfig, as needed
>   ARCH_SUPPORTS_CRASH_DUMP   # in arch/<arch>/Kconfig, as needed
> 
> To summarize, the ARCH_HAS_<option> permits the <option> to be
> enabled, and the ARCH_SUPPORTS_<option> handles side effects (ie.
> select statements).
> 
> Examples:
> A few examples to show the new strategy in action:
> 
> ===== x86 (minus the help section) =====
> Original:
>   config KEXEC
>      bool "kexec system call"
>      select KEXEC_CORE
> 
>   config KEXEC_FILE
>      bool "kexec file based system call"
>      select KEXEC_CORE
>      select HAVE_IMA_KEXEC if IMA
>      depends on X86_64
>      depends on CRYPTO=y
>      depends on CRYPTO_SHA256=y
> 
>   config ARCH_HAS_KEXEC_PURGATORY
>      def_bool KEXEC_FILE
> 
>   config KEXEC_SIG
>      bool "Verify kernel signature during kexec_file_load() syscall"
>      depends on KEXEC_FILE
> 
>   config KEXEC_SIG_FORCE
>      bool "Require a valid signature in kexec_file_load() syscall"
>      depends on KEXEC_SIG
> 
>   config KEXEC_BZIMAGE_VERIFY_SIG
>      bool "Enable bzImage signature verification support"
>      depends on KEXEC_SIG
>      depends on SIGNED_PE_FILE_VERIFICATION
>      select SYSTEM_TRUSTED_KEYRING
> 
>   config CRASH_DUMP
>      bool "kernel crash dumps"
>      depends on X86_64 || (X86_32 && HIGHMEM)
> 
>   config KEXEC_JUMP
>      bool "kexec jump"
>      depends on KEXEC && HIBERNATION
>      help
> 
> becomes...
> New:
>   config ARCH_HAS_KEXEC
>      def_bool y
> 
>   config ARCH_HAS_KEXEC_FILE
>      def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> 
>   config ARCH_SUPPORTS_KEXEC_FILE
>      def_bool y
>      depends on KEXEC_FILE
>      select HAVE_IMA_KEXEC if IMA
> 
>   config ARCH_HAS_KEXEC_PURGATORY
>      def_bool KEXEC_FILE
> 
>   config ARCH_HAS_KEXEC_JUMP
>      def_bool y
> 
>   config ARCH_HAS_CRASH_DUMP
>      def_bool X86_64 || (X86_32 && HIGHMEM)
> 
> 
> ===== powerpc (minus the help section) =====
> Original:
>   config KEXEC
>      bool "kexec system call"
>      depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
>      select KEXEC_CORE
> 
>   config KEXEC_FILE
>      bool "kexec file based system call"
>      select KEXEC_CORE
>      select HAVE_IMA_KEXEC if IMA
>      select KEXEC_ELF
>      depends on PPC64
>      depends on CRYPTO=y
>      depends on CRYPTO_SHA256=y
> 
>   config ARCH_HAS_KEXEC_PURGATORY
>      def_bool KEXEC_FILE
> 
>   config CRASH_DUMP
>      bool "Build a dump capture kernel"
>      depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>      select RELOCATABLE if PPC64 || 44x || PPC_85xx
> 
> becomes...
> New:
> config ARCH_HAS_KEXEC
>      def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
> 
> config ARCH_HAS_KEXEC_FILE
>      def_bool PPC64 && CRYPTO && CRYPTO_SHA256
> 
> config ARCH_HAS_KEXEC_PURGATORY
>      def_bool KEXEC_FILE
> 
> config ARCH_SUPPORTS_KEXEC_FILE
>      def_bool y
>      depends on KEXEC_FILE
>      select KEXEC_ELF
>      select HAVE_IMA_KEXEC if IMA
> 
> config ARCH_HAS_CRASH_DUMP
>      def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
> 
> config ARCH_SUPPORTS_CRASH_DUMP
>      def_bool y
>      depends on CRASH_DUMP
>      select RELOCATABLE if PPC64 || 44x || PPC_85xx
> 
> 
> Testing Approach and Results
> 
> There are 388 config files in the arch/<arch>/configs directories.
> For each of these config files, a .config is generated both before and
> after this Kconfig series, and checked for equivalence. This approach
> allows for a rather rapid check of all architectures and a wide
> variety of configs wrt/ KEXEC and CRASH, and avoids requiring
> compiling for all architectures and running kernels and run-time
> testing.
> 
> As such, I developed the following script to compare the before and
> after of 'make olddefconfig'. The new symbols introduced by this
> series are filtered out, but otherwise the config files are PASS
> only if they were equivalent, and FAIL otherwise.
> 
> The script performs the test by doing the following:
> 
>   # Obtain the "golden" .config output for given config file
>   # Reset test sandbox
>   git checkout master
>   git branch -D test_Kconfig
>   git checkout -B test_Kconfig master
>   make distclean
>   # Write out updated config
>   cp -f <config file> .config
>   make ARCH=<arch> olddefconfig
>   # Track each item in .config, LHSB is "golden"
>   scoreboard .config
> 
>   # Obtain the "changed" .config output for given config file
>   # Reset test sandbox
>   make distclean
>   # Apply this Kconfig series
>   git am <this Kconfig series>
>   # Write out updated config
>   cp -f <config file> .config
>   make ARCH=<arch> olddefconfig
>   # Track each item in .config, RHSB is "changed"
>   scoreboard .config
> 
>   # Determine test result
>   # Filter-out new symbols introduced by this series
>   # Filter-out symbol=n which not in either scoreboard
>   # Compare LHSB "golden" and RHSB "changed" scoreboards and issue PASS/FAIL
> 
> The script was instrumental during the refactoring of Kconfig as it
> continually revealed problems. The end result being that the solution
> presented in this series passes all configs as checked by the script.
> 
> Regards,
> eric
> 
> 
> ---
> v1: 12jun2023
>   - Initial
>   - Based on 6.4.0-rc6
> 
> ---
> Eric DeVolder (21):
>    kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
>    x86/kexec: refactor for kernel/Kconfig.kexec
>    arm/kexec: refactor for kernel/Kconfig.kexec
>    ia64/kexec: refactor for kernel/Kconfig.kexec
>    arm64/kexec: refactor for kernel/Kconfig.kexec
>    loongarch/kexec: refactor for kernel/Kconfig.kexec
>    m68k/kexec: refactor for kernel/Kconfig.kexec
>    mips/kexec: refactor for kernel/Kconfig.kexec
>    parisc/kexec: refactor for kernel/Kconfig.kexec
>    powerpc/kexec: refactor for kernel/Kconfig.kexec
>    riscv/kexec: refactor for kernel/Kconfig.kexec
>    s390/kexec: refactor for kernel/Kconfig.kexec
>    sh/kexec: refactor for kernel/Kconfig.kexec
>    crash: move a few code bits to setup support of crash hotplug
>    crash: add generic infrastructure for crash hotplug support
>    kexec: exclude elfcorehdr from the segment digest
>    crash: memory and CPU hotplug sysfs attributes
>    x86/crash: add x86 crash hotplug support
>    crash: hotplug support for kexec_load()
>    crash: change crash_prepare_elf64_headers() to for_each_possible_cpu()
>    x86/crash: optimize CPU changes
> 
>   .../admin-guide/mm/memory-hotplug.rst         |   8 +
>   Documentation/core-api/cpu_hotplug.rst        |  18 +
>   arch/Kconfig                                  |  13 -
>   arch/arm/Kconfig                              |  29 +-
>   arch/arm64/Kconfig                            |  61 +--
>   arch/ia64/Kconfig                             |  28 +-
>   arch/loongarch/Kconfig                        |  26 +-
>   arch/m68k/Kconfig                             |  19 +-
>   arch/mips/Kconfig                             |  32 +-
>   arch/parisc/Kconfig                           |  34 +-
>   arch/powerpc/Kconfig                          |  55 +--
>   arch/riscv/Kconfig                            |  48 +--
>   arch/s390/Kconfig                             |  65 +---
>   arch/sh/Kconfig                               |  46 +--
>   arch/x86/Kconfig                              |  90 +----
>   arch/x86/include/asm/kexec.h                  |  18 +
>   arch/x86/kernel/crash.c                       | 140 ++++++-
>   drivers/base/cpu.c                            |  14 +
>   drivers/base/memory.c                         |  13 +
>   include/linux/crash_core.h                    |   9 +
>   include/linux/kexec.h                         |  63 +++-
>   include/uapi/linux/kexec.h                    |   1 +
>   init/Kconfig                                  |   2 +
>   kernel/Kconfig.kexec                          | 134 +++++++
>   kernel/crash_core.c                           | 355 ++++++++++++++++++
>   kernel/kexec.c                                |   5 +
>   kernel/kexec_core.c                           |   6 +
>   kernel/kexec_file.c                           | 187 +--------
>   kernel/ksysfs.c                               |  15 +
>   29 files changed, 900 insertions(+), 634 deletions(-)
>   create mode 100644 kernel/Kconfig.kexec
> 
