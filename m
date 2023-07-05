Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D007490E7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:17:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WV9iIM8W;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KqXklMmo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDYg3ZCtz3bZn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=WV9iIM8W;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=KqXklMmo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx3N44zQ7z2yjj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 01:23:47 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365Etjng010092;
	Wed, 5 Jul 2023 15:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=eyv04uG0Blvyh5hGuldNpjUzq//g2ZMtMqW35IYXSSw=;
 b=WV9iIM8WY7VLKtQtq0/Jrd69WKskTlXeiM1+6ga1LY8MsVF3yogcw9UtCppEBxruc6xt
 PErjL6myld2zienFnU1zNUR7kcPdcmTHi0BbxfV4jQ3aDK1hmmb6+Z6z3VWWS0sIbUXH
 awMd19ksLgQsEhJBCLdioTKLZ7yX9knKrGNFFHRtoJxJWUkT7epzs787njIa/fHRrXP1
 vED1F/v3Q2pSGHDgh7etkmP13ZKFzHkm/67CIPx7HIV2ZTjLr3TcBTPSoGW54XVFSr6I
 2bNoDaGjkVF687cMnoz87hHwES8vsZ+nt/qmlgCPg8eGiwltYNtEL0Hav0JBihiJc9UN Xg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rn9ybr6m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 15:23:23 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365F5IE0010152;
	Wed, 5 Jul 2023 15:23:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5r6wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 15:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF9yos0d9eIfKa8xciB4NeEXTORp+r/l9SUcMrqaqo9or1ssqE3itj4TtCGJCGN9uj2qdgTlZba9hAIMfA0/i3WhzKXnM1dkEFzy9SaZ7bpJo1T/J2rHH+jkcMh+8mosf6Kix8uvYRa96VwFuO7BEq+XkNKBolFf+HjX/+KvbU0Vv0qWdGF3m+EH3mvvxQJcB6c8wQjrzVm2IcxNZefnKYly31qAaCD8uSTB/nQh0sg641cNrzdaULdKBmmXQXa4DDpym0XnDkdxjmnVNHZ1S7qaA7YvH124cyjW6OOvzngs3C4XKm1066eRw4r+/qccPRQrhAUgTc3IPiim9Jr43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyv04uG0Blvyh5hGuldNpjUzq//g2ZMtMqW35IYXSSw=;
 b=SFYEtAchwAVu1k4uklPT9TWh6Xl4+kolPhkS6pH3G4XBAkMixdIOGvOoNsKwu/rIfreGp0dl8POT0Zil4Mq37xrLZuuy6y9TYqWpNOTvYtP8z+iQRRmEeVvzOpwZkKccvSCtsMKsCPcxhdPxfMMAD3epdJi+cBL27QOypnq5yF471PF7ZjK1YWQsIGfNiPh/SR2ksjQ3bpAKv7O2evbEQeE8TMmCGS3OxzS66uSpzoUgicMzMeLnKRMDfwKaxjSM4ORFURlPeTQlLQzuQNFcsiGU9k+mwwTaa277dtbk7TaA15wBqQiyYZVEyvGdKTcU5eb3rgOHbrDFxD4P8umKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyv04uG0Blvyh5hGuldNpjUzq//g2ZMtMqW35IYXSSw=;
 b=KqXklMmoRNYAgFGkmfRcS9KnWbfIVWcYj1PyORBqkf+wnYXAHLVKOtVMM0STxu7VqtP1LrColYDZGrIKGT32L3OAiII84Z+EWahUHKjElQxuu/OQooo+rJiPQNWScj+9NHhVv2/vpOM1FfSUBFR7hle4f0KGPRnXc/6/KCidP/w=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 15:23:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 15:23:15 +0000
Message-ID: <6ac04399-9c17-b036-5b14-92eadb65522b@oracle.com>
Date: Wed, 5 Jul 2023 10:22:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-4-eric.devolder@oracle.com>
 <09f70de6-9409-4fa4-b9ea-831078d914e7@app.fastmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <09f70de6-9409-4fa4-b9ea-831078d914e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ0PR10MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: 34216371-cbe4-46ac-62f8-08db7d6bc07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pR0vymp7wbySYYYlTHiBt7QOFpqHXAi7/MdNQaLfno9TxZUfA/pPUws6V/m1nsmL7pLI9Vx+9713PPSe8JHBNzBTYZ4muZhpd+YvjnnhQ4+htF85xh3ilbWc1YdNmiLIUc/OEiWyxzDxk6NPx4XrM1BkfUvvI0lMd5I9qpUyCv/xRHfuymxt1oL3rWC1g6Xm96pkZPSO0crgtF0NB5EWH1WVrk2gNZB2qjc2rQRiW+u7vh0nawWI4grlHCebUDW3gmnAB0Zc4T0BHLobHrbWZ7ckbXEHhIH/keUEZ4E+tA7nfv/nWdb1RRzP2ivjc4tpX55rqf2NSxdkPuSSBeuBgXSlNbOleoEkGWsgpy5iPWdV0eOCubvGgrjaLLQE9aOcjq5sG3Y8gccyiUfppWdtA2jBkgpf31uKJJPz2MsJeShoYdyIgGsaS3np51ba7bj827yVSLEYisHlBHds47i/89sNHjZJsAAgNKhLOcatj9A63v/93J3aXe8K+Fps5xmhpSrH2OjSVQTEXrX14pgCbzTHYnnGz5ClP+EocxrryVBDuX/1AKmDM3f9uKYbc6YNUeI1FQ1Pfj/olAa0KosHNh1So0gvDLBIT914PUBaR800IlegzWxlXa5BoL4nDFE7yebpoLX10+CN0kuZGlXp5n9RTvEP3jUuPhFHm/og5/Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(66476007)(54906003)(110136005)(316002)(66556008)(8676002)(41300700001)(4326008)(8936002)(66946007)(921005)(38100700002)(53546011)(6506007)(31686004)(7366002)(6512007)(107886003)(478600001)(7406005)(5660300002)(7416002)(26005)(186003)(6486002)(6666004)(31696002)(86362001)(83380400001)(36756003)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OUQvanY4djRyOFdHcWRFQlYzVjZmcGJheUpsRkRIMFFFQTFSUFVSaCtKZ2NZ?=
 =?utf-8?B?OUtkTzBqR0VoWk90aXh5MUs0cTZ1NFlNS0daeGthQVRFUmJtSER5WTlHMkx3?=
 =?utf-8?B?S2NJOWlZZXBxVEJOc2MvNWFMQ095THY4TW5EZGlvcGxUeG9GZHM2aWpXdHl1?=
 =?utf-8?B?ZERMUmdXY2ZwTUgwbUpzanBhWFZLMDZVUVdBQzIxbVdKZ3RvVnExQUIrQ3pD?=
 =?utf-8?B?eWZLYUMzUG54ZlI1YTErNWtFOVFLdXdUaUU0R2RTQmJrMjFoMTQwRnFxSk9x?=
 =?utf-8?B?U3lCLytpRVBWYWYrcHlGNzhHVDNHWG55dTJSZFpnRC9DajhRYlN1d1p4SUpp?=
 =?utf-8?B?c2t6dlprNTlSY0lhYnV5dlhkKzVrd0hnQWtnSDVqZjBPdk42YVlWMVI3WjEz?=
 =?utf-8?B?UXVJckVxeEJVdzFINmJHZk9wd3FuclJuaVlUZWRLRU1yRHAxWUppazZwODRy?=
 =?utf-8?B?Q0ZCa1JTYzZtSTV6YjJvYU9pMytDSW9McHRIY1pKalozSkdhb3EzUDh3dW8v?=
 =?utf-8?B?NThNb0J0cXhhK3RyOWFFS1VyWXBVS1FyblYwWmJZK2JXa1pWNUx2MVN3SnRz?=
 =?utf-8?B?RzNUdzI3dTZ4QVQzME8xTHVPZm5ONkR6Qjk1VVJGQytPaVA2Q1V6SS8zSlpL?=
 =?utf-8?B?YWJ5UlZ6QzlLalN2aS9kS2NkcVZqaEtnbUJ5a2VFWFIvaE00ZlpOdVVuVUNi?=
 =?utf-8?B?UzRQcVQwZDhWUlBMcTRTZi9UbXBVTmZiWm1DSDRTQm93Wk1FR3N5YXVuWW5r?=
 =?utf-8?B?eWNRMVRzME9qTG11SlZrRFoxcEhLYmNLa1FFYnFabXp6Z0RaRVJGOE9tcG9v?=
 =?utf-8?B?dU1keEZUVTkvTVEydWJkTEpEZFJ6cUEzUVpuTUppQ1pMTnhqOUxUM3FPNWo1?=
 =?utf-8?B?YUNxWDhOYTFtVUZNTjBOM3FsRnUxVzlQL25NdTRDY3pjYkpmQ1ZVRi83bkIz?=
 =?utf-8?B?THA4SkFUeTN6RHcwWENlNm1scDJ4ZHY1NGRxVUZnZjY4NHBtRENacDhuM1Iv?=
 =?utf-8?B?bDFDanpOK0lBVk02L1J6RUtDYjFQK2hsMjJJc2JmL0VNV0dPNWdnbjlsYzdt?=
 =?utf-8?B?Uzh5azJxd2Z3MkxBM3UwUEhaU2d6dzhXREFwM1RuU3BzRjVoUnE2dDdoUlJu?=
 =?utf-8?B?ZGp3SjlFMXIxRkJpUEtGZlhYU1FiYURjSFBxM1VRSXdUbXZxcnZER0VVbmxK?=
 =?utf-8?B?eUNaeTRzVFV5enA3dTBrN2tDUWlSaktORGJTbmYwRnljWTNjMm1hbm1NTmxa?=
 =?utf-8?B?T3ovTFRZUW1vbTR5anFkbEFJTXV6MmJXTnpUVmIrNCtwZ0VhT3JBK3Myek83?=
 =?utf-8?B?Q0hpZEsxYmxQZkI1ZDVIUktPUzdBS0FNenI5SEFibWluVDByZkJtK2dpeU1i?=
 =?utf-8?B?cWI2WjFYQUV1emRuY2I4YkE1dzhjM3R5NG1HMWk5ZmFLWUJIV3h2QUViNE9h?=
 =?utf-8?B?K1M0Q1pWRExyVGF3emQ0eHhIa3lQK09ITGtsM3kxZm9hWUlUaVpMakJwSDZ3?=
 =?utf-8?B?b0Y4eWl3ZFppT1hjN2t3b1dQZEJYTE5HVENhczhxK0Z2c21mblJFcDdCVDh2?=
 =?utf-8?B?YmJwU2VSQzVZaVo4eEdmUkRHblNwZ0psQWR6MWE2VHoxSEM1dG9MQ3MzM2do?=
 =?utf-8?B?TVNGQlhwVVhNVVFrRm1uekptV21aSmRuUnE1RTRKMXBBS1VxTzFjYkdleW1r?=
 =?utf-8?B?NUdvR2F6RnlYei9vaE1HeXJVOWtiQ3BTZXk1NFUrcWpNQU4wbVJUT0JadVFQ?=
 =?utf-8?B?TlpzRUR2QmRTYnB6WWtoM3oyYndxRURrOWhpeFExMy9OV1hLOUhCcFFOWS9I?=
 =?utf-8?B?S25zUkl1MkJKWEdQbGdzUmRPVEJzYTRtV3ZKeFJ3WTdIQ3hpUlNjVnJZTWdq?=
 =?utf-8?B?UHp0OE1NL041Vzk2Vkd6c3Z4L21ET3FqaUpvdXRVK0lZV0dRL0xZQlIwYUVZ?=
 =?utf-8?B?ZWJhanNwQXlhOW1DbTcyQS9Pa1dwYllVSEV1b05XaldBN3BFMzZQdVd3TVdo?=
 =?utf-8?B?b2t4WnRrYWtIcGtYREI4aEpWYko2TG5XandOTGRmWWdtc3VHTEgzT2hWMkxO?=
 =?utf-8?B?RnIzclZ4Zk1oSGl3N1lqS1lHR0ZpUUN3OXA3alBLTnVuMGFvM0IzclVYbitt?=
 =?utf-8?B?WXh0UUhEWTJkNHEvRU1IY1VMeHRvREM2NEFvSUJkWWFSODNOM0F5amVpNkwz?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?UUpSYWpadlBxSHJYeGZwY04yeVEwRzBoMVhVTGpoVG5PSXlTdSt1NEtWMUVm?=
 =?utf-8?B?NXFsTFVKb0trSGdmTHpOdUNDbzJNOFowdkhsNmhLR2RmVTZ1ZG8xV3hKSWtx?=
 =?utf-8?B?OGtHVHhnbkY5SHpsRXpOMk9neFlXeHhySllHQTlxVjhFSVZ5dWRCejlacTkw?=
 =?utf-8?B?ejVIVVV6VG96UjFLdmVhK1ovKzBhYml0eTdEcVR4aFJmWmxnK3VwUlpMVVdp?=
 =?utf-8?B?M09qUkJKckRrU0d4aS8vSHlKV05jU1hWdTI0cEx4SG82R2NWcXVIVnRBQ2sx?=
 =?utf-8?B?Q1FoNmZzSTAxMUtKRmZoaTBxb1VqbFcyckFyWG1vQURsejNFZWo1MG9LUWhm?=
 =?utf-8?B?SjQ2dGk1SndMY1lRaXZtUHNUaGovVWRTMHJBRU01anJyUTZCNDhhQTRsUW5M?=
 =?utf-8?B?MTB6d1NZZXFKdTdndlJFUU5DYTIrbk04NFdqWDVlaG5MNThRenkzb0VGOWlN?=
 =?utf-8?B?cnFnRTV2N1Vxc0FxbVJmbFhYNjZFOGN0TUFqUzJMWTVlY3I0UVJmM1RQa3JB?=
 =?utf-8?B?U0tJZG9NSUY4S1FMeGlKRHU3eHlCelNpN3djM3BsekFVNG8reGFucm1VK1dn?=
 =?utf-8?B?bW4zc3cyc0VJcVdHWHpHOWtDZzFla3N0cWt0UjBLTklQam95dFJKREZ2a05p?=
 =?utf-8?B?c1Fkb1B5NXNhbnJwdG5BTlI5N2NtK2lUMXlkSjkxb3hjZTFqeFlOWlFmZE9K?=
 =?utf-8?B?dDB5d1dydVlqUGZsVStXTWx6Q092ckUvN1FzS0lmVUxJbUdQVTk2RzhsNTJR?=
 =?utf-8?B?RGgva3ZyWExNd1JLc3gxNDdDdFNKYnY1WUNWOWR0cWx1UHAwNkVVWFc5UU5i?=
 =?utf-8?B?U2dJcXJKNWpqckVjUDBaQk5majI1SnRiZDBJcEFGalFaaWx3UkpmbytJanVP?=
 =?utf-8?B?TC90ZlBDcldDdkdLM3k2OE5NNnhZZ1krQnZocWxJUlRBaG84ay80NHNqbVBm?=
 =?utf-8?B?eW1KV0pSSlRxbS9tRFFqMEdDTnIwOGRaUDIrWFBodXA0SEF2UCthSnFvUndH?=
 =?utf-8?B?OFlTYjVhRHJVY3hOZ1VOMzN1VVQxdG5WT2RwMGdtWkd0Wko1bEl1bzYyMHIr?=
 =?utf-8?B?ZUxFdS83cHZiSlNZMEJMUkZxY1l5eURCVFFkYzhzcGI5SjJsZ0Nob21jU3A0?=
 =?utf-8?B?d0FRd2FTcWlpZ1IyVW5qRDVoOW0xZkNySk5jWndQejIrVThGYlJnQ01aZGFS?=
 =?utf-8?B?VUtabzdsVW80akozbVJyZDZzTGh4SGJncFYrUVA4L05pODhPaEFDTnZ2MDRQ?=
 =?utf-8?B?eC8rMk11YXc0NnpHUHozM1dsK1pjMGdENnMrb0xLb2dDczNKYjFXNXVVclVi?=
 =?utf-8?B?YU5VT3E4SHJtZFluQWpEcVpQVno1UUkxaXZQMWdSWFl4UklVc292ZHpHcWtx?=
 =?utf-8?B?V1NsU1JVb3l5Yk0zRGxRNHA0NzFnWUZsd0FRbEhDQ29SQ2N4WDBETlY1Q3F1?=
 =?utf-8?B?VVQ2YUlxZVBIZlM0MW5RZDMvSG82T1AwWlVSMlFEN1B1b1FIejd6MkRDL1Bv?=
 =?utf-8?B?UGlDY1FuMjh2WjQ5NHdMZHJXL1VyM2JTL0pTeUV5bC96UGRuTzljdVdzbjE2?=
 =?utf-8?B?cVE1cmwrWEErQjVwVXEwWFUyMkIrdlg5Y0dyeDlIUERsTi9JZXhwV1YxNVBl?=
 =?utf-8?B?dmxVL0FlRmhoNWo0NW5XZnZ0ODIvdjhQYy9waGlySlpyVXZOQWZVODJaa1Vj?=
 =?utf-8?B?M0ZPQ1h1b1UwV3JKbUxDZjhsTkVQUFNUSzArZXVNRm0vOHIxcExEaGEwOWcw?=
 =?utf-8?B?RUxVek5CUzhXUVJQamlITGFQMlZqWE5EYzFkSldrZVhqNkxlQld1bnJFRWN1?=
 =?utf-8?B?QXBzNnhGK0RVK3NnUzIwVkRuM3BzUVFWVVBLR00wSFh5ODIvdnRxV3JycTNG?=
 =?utf-8?B?c2NUR2lDSUdXU0hJVURVd1FnMU5wUnhKNmRqWTIwODZlNHJtWTgvM1lSNGtB?=
 =?utf-8?B?TlR1d05ta2hlZlptdWphZ0NHbStjVU1TMlFpK0dKeVVQdU9zUmZuZU5iZlBm?=
 =?utf-8?B?aXl3NlJ0Vk0ySWlmN0RTRldLRDIyODh2M1RuNS9relF4VHRGZGl4dFZXUERT?=
 =?utf-8?B?RkZnc0ltdnRDSVRsc2lrMXZKL0I5QU83NXRhN3Z0aGk1ZVlZWTNyVXcyRHFI?=
 =?utf-8?B?TDdNR2U3Vzk4UGNTSTVZaEhSUkpyRXMzeWI5OFg5YmxYVGQ4dTY0TmNWSStD?=
 =?utf-8?B?WVh2VTQ2TFplTjZYaVdySlovMUJFNzEyaW9ONGh4ei9uZmk2UGV3dktTTThy?=
 =?utf-8?B?dmVHNmR0eFVjVjQxZEs0R3h2V1Y4VEQrdkVha1B2NEdRL3Vla1hOSzk5TUE3?=
 =?utf-8?B?R2RKMlJFQXQwWW14cEdVM2VmWDdJRFJKM0F4dVBodlVXQmVGYjZHVGsrN3hq?=
 =?utf-8?Q?dczLDPOkeDgSKNhNV5OzmPjmgw7U3VenDuMRvFfDo91mD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	2Rf42mbK9jO8mH7J3CkPfVXhB1sjPidDOjeCPbKZ4fR9j0Gry/lVn94ocmFUIYISMSSjN/zdAyfXtDzI2XyueJsSpWQDRlqJCSMrUhoCp/DY0WwRFNrH0MRgEnD+k33nT/zn302qB9cCJImINpUcrrm5INs2Zk+IZUEZCNWzdsWcChn4ceF3tLeKrKkAxQLrL7KpdA163oD5Tcl9Tqf+i9zB8tZLk3eZWBf9xxwP3VAj0qAxY9YstiK1S5Zo97RX8FBtGLdutozr5+2heBozn6yhYTxrWLWi+r3nYEGwzLjdOr1Y1kaLxHxRHFHuJogc/MeJTb2tJ7vRqNVDHdgq0+2zlWidRrZm/6Tz/jwVmrXT08o1ebF4Rv+5iukOQ2MjoPR4QgDzXYtHoW0sCf7T5wTMu6W5J778LO5aABcEaUgE1TGav1Nbibwx8Vwo1p9cqgpWfiFyvWxjZg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34216371-cbe4-46ac-62f8-08db7d6bc07b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:23:15.0715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSVzQaINmzjvV9s4XlpR+G238SHDHWzhrdIPalUhmIrdtYih1Ecg+MYDABMShE9i4qFxsWEZaOhmlx822pqiL5dsaYgA8t+QxYk746YHIr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_07,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=749 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050139
X-Proofpoint-GUID: sqfXT74lvJ9i0IYdyL5aPqqpyPs4B9i8
X-Proofpoint-ORIG-GUID: sqfXT74lvJ9i0IYdyL5aPqqpyPs4B9i8
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Zhen Lei <thunder.leizhen@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, tsi@tuyoix.net, Alexander Gordeev <agordeev@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Baoquan He <bhe@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Juerg Haefliger <juerg.haefliger@canonical.com>, borntraeger@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Xin Li <xin3.li@intel.com>, Nicholas Piggin <npiggin@gmail.com>, Russell King <rmk+kernel@armlinu
 x.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Zi Yan <ziy@nvidia.com>, hbathini@linux.ibm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nick Desaulniers <ndesaulniers@google.com>, sourabhjain@linux.ibm.com, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>




On 7/5/23 10:05, Arnd Bergmann wrote:
> On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool (!SMP || PM_SLEEP_SMP) && MMU
>>
>>   config ATAGS_PROC
>>   	bool "Export atags in procfs"
>> @@ -1668,17 +1656,8 @@ config ATAGS_PROC
>>   	  Should the atags used to boot the kernel be exported in an "atags"
>>   	  file in procfs. Useful with kexec.
>>
>> -config CRASH_DUMP
>> -	bool "Build kdump crash kernel (EXPERIMENTAL)"
>> -	help
>> -	  Generate crash dump after being started by kexec. This should
>> -	  be normally only set in special crash dump kernels which are
>> -	  loaded in the main kernel with kexec-tools into a specially
>> -	  reserved region and then later executed after a crash by
>> -	  kdump/kexec. The crash dump kernel must be compiled to a
>> -	  memory address not used by the main kernel
>> -
>> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +	def_bool y
>>
> 
> I see this is now in linux-next, and it caused a few randconfig
> build issues, these never happened in the past:

Arnd,
Thanks for looking at this!

I received randconfig errors from Andrew Morton's machinery. When investigating I
found that randconfig was able to specify CRASH_DUMP without KEXEC, and that lead
to problems. I believe this situation existed prior to this series as well.
Specifically CRASH_DUMP does not have a dependency on KEXEC, or select (only s390
has this hole closed).

For CRASH_DUMP, this series now selects KEXEC to close this gap, which is what a
sane config would have (ie both CRASH_DUMP and KEXEC).

Do you think the changes outlined below are still needed?
eric


> 
> * The #ifdef CONFIG_KEXEC check in arch/arm/include/asm/kexec.h
>    needs to be changed to CONFIG_KEXEC_CORE:
> 
> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
> 
>    same thing on m68k
> 
> * ARCH_SUPPORTS_CRASH_DUMP needs the same dependency as ARCH_SUPPORTS_KEXEC,
>    otherwise we seem to run into an obscure assembler error building the kdump
>    core on architectures that do not support kdump:
> 
>    /tmp/ccpYl6w9.s:1546: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
> 
> * Most architectures build machine_kexec.o only when KEXEC is enabled,
>    this also needs to be changed to KEXEC_CORE:
> 
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -59,7 +59,7 @@ obj-$(CONFIG_FUNCTION_TRACER) += entry-ftrace.o
>   obj-$(CONFIG_DYNAMIC_FTRACE)   += ftrace.o insn.o patch.o
>   obj-$(CONFIG_FUNCTION_GRAPH_TRACER)    += ftrace.o insn.o patch.o
>   obj-$(CONFIG_JUMP_LABEL)       += jump_label.o insn.o patch.o
> -obj-$(CONFIG_KEXEC)            += machine_kexec.o relocate_kernel.o
> +obj-$(CONFIG_KEXEC_CORE)       += machine_kexec.o relocate_kernel.o
>   # Main staffs in KPROBES are in arch/arm/probes/ .
>   obj-$(CONFIG_KPROBES)          += patch.o insn.o
>   obj-$(CONFIG_OABI_COMPAT)      += sys_oabi-compat.o
> 
> 
>     Arnd
