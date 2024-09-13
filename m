Return-Path: <linuxppc-dev+bounces-1314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E29779EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 09:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4mWR1TxQz2yYy;
	Fri, 13 Sep 2024 17:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726213395;
	cv=pass; b=cOJ/1e+27iODozs8sWmGdrfZtxydP0dqnhvl6mvG5j7/h9dVuG4Sgscae1xaDWZP1Udho7DdGt05AYpFCb6bDiZr26+1gaf0i9X72HWrw43hzac4HGDRNhLwQJ9f/KQMtTaFroZfrKqjzPnxACtfKstv7sC+Iy595D6XdH3zMoGsN1rDeWW0hvNJy4mltCJlUSpoXwUIqWIDBkf7YxIRuuo3UyVBIg4J1fwLlrgzCDDN8Y+PmWW1zDJmPzMwzJSffjtUtkBVFcfb5c2I1tNTdGkFNMp4Ba2dYz/cj8Y+CoShXLDch7CZyEmB6sJuLql1PM1xrtjUg9LStXkzTC3tig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726213395; c=relaxed/relaxed;
	bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kqk3l70mceCrxIS3j2weWk/FVsb6SoF8sm8qy3sexDBB/ZHYpPX/g9uW0UP6lEPaW+7tUAr5eBUL8OI25Dr0gCJ5KIn0Iwi1PU9ZNgre5e9ziHqLj9AadE89RLQ/JCEuzDmdNjKPV86TrQyNBqswXpO47H4Xxwp5jUIyK87GHNMnWnZwfJn9Ic3XIKKx+oey/28eoq51BkJWgHvAExIzFuegDONboJ6SndF3sFjsBKzEuXWxzqrwxrDns3eaTCyvM+jgMHOaHMC3FiAyEYFY9mBuBHvt5SCjsiTBgvqf32C7bRSpHpkGoouyUpfVfqeOrfujkp2Mr2LSmQdKSjfrhw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=h+rnHyjd; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gPsRzLaq; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=h+rnHyjd;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gPsRzLaq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4mWQ0WYMz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 17:43:11 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D7BVlo014250;
	Fri, 13 Sep 2024 07:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=; b=
	h+rnHyjdzNE2V8l7QMCyW3ewbHzJ5Lj4ajFKAYVYCoSPkIzRnDJHMEetzc6WbLtL
	VBbgJwUgU29MYsUom0QP/VoaN2AcAA8zxqkBd6OcspmLVeK2yQbveVR8uEGG7ssA
	gUGrb4XOyUAEWbupCUQ2g66V115YWaCNPYnjsGOkJvsOiqaY6io+rEz7JQixBAeX
	kQxRZLiohMyisEof+PeUeaURrItKmSg6NcCIzfplU851cwioK3Wl3/FM6zeRhnGc
	DCa1kOw1Hj4k2+h2nOWAppx0gW6doJidRW15R+Giavy+ENJ3RQzb3iTe0UaQQm1J
	MC1wiaHkMmWZ9B98AKTazg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2vxmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 07:41:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48D6JEIm000301;
	Fri, 13 Sep 2024 07:41:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9e0fdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 07:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu06ToTiLWNQm8yLnO7ecnXD7DfAe6sbu1UL5MY8EwxwOMFASyIIcVhTwygbr90LEV0DqvC2cTL+K4ji93N/uoW+P5VckXcv9RvlDEttzQ6xqp467f/4U6UpLrxmu27clKK8it7JXVjvqVD99Qoi75H7iae0AAUREih5Knvm6VNu8s1uBj9XIcNFTn5y91XeivyLg9PTVYwwtRWTAZL452aIiCGHSb7RObHmDXKEUSB9BzAhYZVRmwrkEIc7YHMDpghWZp9TgtS9OFV1CujzQ3wSNfth+z8oKlcy+DusGGocC7+3HC1H3/cO3uHM8CKv2Gc7gPYm5AK2BVwSQ0mYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=;
 b=tNE16uDoNWsEZDXM4KK7YHiUhNmKmEFgmZfZ43HiZg7cjKhEA4Gm4MosKUCHRV33cev5Rqo8KtYH8nOlECRg7DPv4qMJzvOrNVoG6BvRwkUOutCaxJbKARXQkqrAiahkS44oXaSAnR4HH+JPf+shDQHKm63tYgBRJqrsB1J0UAc8xs4cc+zOB6bBNmhSN0Fp7RoJcxX3FTN2Vqi1xEu3vTrRr54A6RBDvELqPHQEagm5sffQGXB5OQfuMJ2120AX/Qd40ZW9chVPx9Hu6T59bp3MZ6jBQztGQFkAB2tz3KSN2xtWR2MMzGywc6p4gf1BiRJaXuPdgWbLgAiwErxtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=;
 b=gPsRzLaq2Q117oXvXVmItspF0HIAZrwMs99NZ/zJ8nCNcsz9sZuoaC0YhHUzxoUsqcufVrgXu5en7X6oieqVrRKvzPQHp9+jb5EKKH0a5sNf+HEQPkG1qSShwxL/dW7zdTLEjnjPbTGYD4P/9YC3Whl3V+tjw7ZT/xotRvwHn2Q=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.9; Fri, 13 Sep
 2024 07:41:38 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 07:41:38 +0000
Date: Fri, 13 Sep 2024 08:41:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
        Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Chris Torek <chris.torek@gmail.com>,
        Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuKHpFB+uWuJe2xm@ghost>
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|PH0PR10MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 990babd1-23ab-4013-2fc9-08dcd3c77fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGV0b3h2MkZRRHFjR3F1SW93N2hhQVgwWFZrVS9JZU5MWW5yeEhCQU5uNU5P?=
 =?utf-8?B?K3d1Vk9CWnc0aHB4d1RqbnZIZnMvWVFYdkZYVkxXZmRxa2UzemxRSlJyZkxl?=
 =?utf-8?B?ejZGM09pditNamxnUUs3eWcwQlVKZXdWMWNnY2sraUN0MWVMYnc3ZEJWTWlw?=
 =?utf-8?B?SGtYVmMwN0VnZ3BBbHBMZVhDWjY1WkYyYXM0c2lNMDEwQXZvUGU4UzRWQzZP?=
 =?utf-8?B?djZ0M0hPNFB6NXVUYkgxcjJhb3pFcDBLNyt5dE83eGs2QXNlTWV4UmRvMDZQ?=
 =?utf-8?B?TDRjL2xVM2RqbWcyemxjd3ZtSGNPOVBnNUl1bk8rZEtneGlYR3Fhb3VRSHdz?=
 =?utf-8?B?MFVsVjNMWFlXOTNERTB5YmM4Y05MMHF4M2RPUEk2SUx2Wkl6enpvQlhCSksy?=
 =?utf-8?B?Z3l1a2h1Y0hqbkFwY3d3MkhpYTNrSklSRlRwcFEveEpzY2VPMmZ0K2tpZFp2?=
 =?utf-8?B?RERaYTJqNzBodE5wcVp4SS91d2FvMUxXUElhOXZKWjNjU01kQjFjaHFDZ3Vx?=
 =?utf-8?B?OW1ScGlDQjBpN1hvcnZPVUFrdW1Ja3RLUnIybjZ4dXZ2enUyTVdScnJSQzk4?=
 =?utf-8?B?bTZmejRObUZlN2xpMnYySmVQWXI2V2FzeGI2MjJjcnhtSnQzMHF0RGxRenlr?=
 =?utf-8?B?elNGRFBoTWNnNk5rUjFvUHZDZ0lzT0U5d1E0Z2JvMHdOVUdlQlFJNytqQlU1?=
 =?utf-8?B?TkE3S0VDeEtjelJTc0VFd0taU2M1RUoza0JaWlMyejJvREc4VGVCdWxaUnpk?=
 =?utf-8?B?SGMrM0xlVXVjZXZ2SXlWSjN4elRTL2hjU2xXOEtwTXBqOUhOeU5TVTZBUjBO?=
 =?utf-8?B?SVpUemhXc0E0V0hva1FGK01jcHlJc1Bmbkt1K2ptdTNlZVJBUURNdGx2UEoz?=
 =?utf-8?B?MlpPbWFQU292TVpXaE00SzJObDJPNjZydkFUMTJTdDFlSWNVQjJwa1RRSHJl?=
 =?utf-8?B?RUVSVkNJcFhQYlJVZms2Vkp0bi9tVkhwQ1djUjJaaTdsV0xhVTlEY09pSks1?=
 =?utf-8?B?Wjh1Qm9MdDdKMnNYbDhlZlNGbTVrRGpHSER0YTdjUnJUUzZ2eUNUV0Y3cDFP?=
 =?utf-8?B?ZU12d09MdUo2ajJ3NE5Va2krWmhzRUxoRjhFb3gvek43R2JORVJWZzZpV3VC?=
 =?utf-8?B?TnpqY2V2SWNoTVR6QkFKdVloMXIvcHg3cktSdnNFWCtJdUpyUmgxOHhLbU5r?=
 =?utf-8?B?cy9zUzJRN1lCZHpnVmVFL3B6ZjlTa0F0ampFelVjMHQ2eGRxcG9RRHBVNzNp?=
 =?utf-8?B?Vm9xSFF5YkVNc0M5Zi9wZ2VaM2ZLWHA5ekNYVU1ldnhnU1BleWNrOGZzYWNh?=
 =?utf-8?B?VE8xTlhKMUFpM3hLM2cwb292SGduY1U1VGZjWlZIUTQveWYzMjFoSHMxbzR0?=
 =?utf-8?B?S3ZlT0JJNHRkZVpWcHM0bndQWW9QWXBDREhBTVRpMWZqWS9kWUJtMmNEVVVN?=
 =?utf-8?B?aWs1MkQ1dnFLbi9ZdmxCTDdpUytpTlZuQnJrVVFVQkRIUlVyWUlmd2lxNVJ5?=
 =?utf-8?B?bHZpWmx4RzBKMmR2UE5tdWhLNVZWSkE3OVBYeWJEc094WDI0eUxZc2Fadk1s?=
 =?utf-8?B?MTU2TldNZkZxMGVHNENJcWlhVHIwdjdWOWIyZjh4T2c5Z1J3QW9tRFlmay84?=
 =?utf-8?B?ZXc4YUZ0NzJYQVNYNlJyUkdBTURod1hsenNRaUk4MUxGU25iaEphUFIvTlV1?=
 =?utf-8?B?T0g0cmZnendMYUhEc1ZkaG5ESTVZakphUmZtWU1XajlwMGpabjFkM2ZiWEx3?=
 =?utf-8?B?bG9yS0NVOW5hdEpqWHM3TjJZZmJBYjlzWmlHNjBZM2FvS2E5OGNUc3JoMlh4?=
 =?utf-8?B?Nk51VmF6U2dFaXdZbVNWZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmZ1WlVSTUUyY3hvcFgwelVRV0RVWUIyQmNja3lTeThNZ0syODhsdkFjUG5x?=
 =?utf-8?B?elVrODJBMStteVFmTnVTOC9PYjh2WTUwbE8wVmFxWmdoZXJVRjNFcURDckta?=
 =?utf-8?B?Z2lnNlFITmZqYXU3R0hDM1dpL1UzeG8wSUdWSXAzYUFKaGgwRmVid1lXY1cw?=
 =?utf-8?B?aWhUVkVmMm9lN1Q3NSt3KzlQN3BKMnU4UjRzWWtQZk52N3dJcnFDWW14ZHNt?=
 =?utf-8?B?ZjhreDJjK0dOMmliV21abUFCLzVEZEFQcW9YVzNQNXpXOWRaczBkcTBmdEFl?=
 =?utf-8?B?cThtWkVISi9OVGJnVUNwOFFac0d3NzZtb09JSG9iU092bnp4a3pqRjJoQVJk?=
 =?utf-8?B?b2dES0lMeUkzS1M1R3pWam1zSC9DN2NRcnZSK1psTHlaZ1ZYaE9SWWZuUUFS?=
 =?utf-8?B?Q0FsZ2FpK1dDS0JMbVFwNzR4QkZ2NnUwd0tPNGsybDBOZloxRjhNUWtRenZL?=
 =?utf-8?B?amJDT3FOUWZ4VlZJaXVweU5kenVqbnNlSXRseFJYbWRDdDkrcTV6SDBxQmRu?=
 =?utf-8?B?cVFITXJZR0tXWEJUV0tEck9XcjFxVTdaMnI1cjlpNnl1dEtRQlUyVDBTT2hX?=
 =?utf-8?B?WUY3eDQ1YTdORGRlWmxDSGlnQnNBUkkwdTdPak1RMzlPMmZHeHdKMkIxYWFQ?=
 =?utf-8?B?b05leTJqYmlZd2MrZFJ6d1FIRzFTZFZRQnZnV0RJM0hSQjdnSTRHWE54SUZo?=
 =?utf-8?B?Ykw5T0NDY2twaTU4RnZ2a3pQMUxmMDVvSXFjcGY4clBTVlI1TjMzaVRreFBX?=
 =?utf-8?B?UTZ6MTYyNnJObi9pMjltd2p1UXZKYlZ0OFdQNE9wK1ZrK3paTXRaK041KzdI?=
 =?utf-8?B?dlFjQStoak1qZXU2WFc2QWR6QVh1TWN5bW1VOXMvd0hKZGVTaHJqNGF0TTRl?=
 =?utf-8?B?Q3RWcXYvM28xZXE5V1RPWXVDRmdUekovdjIyZmxQc1VpVGFvRFVMRExhZmYx?=
 =?utf-8?B?VWJiUDV5Y210V0dIck9nV1BRQU1pL1NVTm9kbVRXSG1oWFovM0s4K3BIUXc0?=
 =?utf-8?B?K0lTcWxuVVc5cWJDR2tGK3ZaM3ErWFRpSjNxUlVRMmJFRCtCWlQyWDNPdG1N?=
 =?utf-8?B?MDViYzhraGk2UzVkbkE1NWRiWGNEbTBMY3FIS0ZZUjFQaTV2TFZGWUtmTXlT?=
 =?utf-8?B?TnBZQ1hWaDNoSjZ6UCtpWXBIZVBoYTZOSkJZWWVJOEhOWnJWYmNTLzNoVTRC?=
 =?utf-8?B?L0ZJYmE0MTc1NVE3aUMzMlM4TFlobnI3NDBZeWo4cUlkdkFDcFRTMGk0cUV6?=
 =?utf-8?B?Tzl1enZEU2VZM2xuakptMDdudytxVSt5RmxTeVRuaXk5OFVCSUs4MHJXN0ho?=
 =?utf-8?B?VTlWcEJvc1dGRzJ0NXVkaWV3R09ydTM2R2VOZENyaWpRSlZoR1FvSGxEUndV?=
 =?utf-8?B?UFo1Z1NzVDZERkhKSWNmYVZwaXhidGFHQVlwdFNKYTJ4Y2NUV2hsVlJGZDcw?=
 =?utf-8?B?OGNZRmRWL0E4cE9CVUZDbTVaaFcya3prZGExTXFiZTd3SHl2LzJ2bGlWdlpo?=
 =?utf-8?B?UW93VmEweWlWM216ME0yZ0pmZEpsMk5ONDhtSGtWbGNkaFN1aFZ4SlU2aTVK?=
 =?utf-8?B?TDlvOHd5bzFDS0YvL3I4aFlHUmZnN3BrVXBwb2o1K0pEMHJqS3l6MWhaT3ov?=
 =?utf-8?B?bDJ6b1JOdlhGelBVOU5TT21OYkpJWXU1RGxSb0tPSnp2Ny81d2RvSjArelgv?=
 =?utf-8?B?andXY1FKMExzOHVBTFQ4V1NBZ0UybVVWWHNWU0FMM09wZmZJN1Q1dUpzR05w?=
 =?utf-8?B?UmtWN0lkaFBpQVpWdjNYVXB3VGpCM1JSZ0laWVlZR3lXdjhQRWtObTIvaWtG?=
 =?utf-8?B?WjBnazk0UGxzakxVYklKN2hla1dMQXRQMkhMS0tKb1hGdzlhMGVFVFRvUm1V?=
 =?utf-8?B?Z1ZBUmMvRnJoL01FU3VxcDg2b1V1ZWRWeFpYMkhLdE1MU01nbm1XaWVZbzdm?=
 =?utf-8?B?WXpuSjN0SkM0eHlLYVh3K291UmhiakZFbmdHRG1oMFRldnRyMHN3RzU5dFVk?=
 =?utf-8?B?SVBFRTg3aHlNOFA0cFBvcHNFRU5ubU1vYWlSUzdRNzJPdFJvaW9sekhLcGx0?=
 =?utf-8?B?VDdnZVZsejVyTDFKVTcwTWJNUGNDVWVkQTlVbTJpYWV4RGhEQiszTXZEVkJS?=
 =?utf-8?B?OXp3R0hOdkxDeFl5bU5BbnNzcHBCQVhTMUZ4bVMyUm84WnZianhkVXpXQVFJ?=
 =?utf-8?B?M0l3OUxKZUdWWWc3WUZMVXR3SGtweU0zSld3U2JzK1BhMkptb1U2QklJa0kw?=
 =?utf-8?B?SERxQ0hZYkdpWVh2Ny90VEYvVTRBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qa0fWl7zk7gHEBDs/9OGNnrF/w7hH2W5IU7QlUAYbRF0HIG9jvoGs4TKD9EmEJGhyTIqbmg9G+icBLmro35ixXBuzrrnzv3IKNu7Ko/iliDN40JqSqerTeG/hh3crm+hFpxvuZDluNfPUDNtq4uhxZVIZE+B6jjUmYZiizSk0mmG6kJf0QhycoRAZukLNrh53Ndpp1mgqPwtQXr3kkBBj2OSIkma+7kDU5o/q+8nyZI/iyU0KSDpLCOlOy0D4y8N0aCLYfGAfSsy8ayStw1E++uvxIghUln4gPxL4eKQviY0H5fyJ93uP77YuckD6wnT022FrHvlAvIqNMs/qWVdKxFUhEIR6pEd7b5tKe108ZtN2X+q8t/ZSt+YWYA9yYuAaXM9GUVyr7RmPzU/qI2knTAukFTh+0BqHwUUtVhXfhRSGAzvwpJAXPxN5P4L297rLtLh7KxV+m5+NAPi138HIi4r4u7F7k10Pd2oCEyye9c92lm4/vNwOrdKg/GWIb3iIqeue3GzDYcQYcq/Eckp4TKugZQE1qiBxjMzfIwUL7e0oSQpcDxjlRkh5edv74BzkWkXyYHL8bgVCz1ih6WP7Btd+wb9BrbL+JZ2QAFBesI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990babd1-23ab-4013-2fc9-08dcd3c77fd9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:41:38.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSM31kaqwQTvTR9Q2/R/XE/o7zSbViY03Ft7YTMXSqmjOH+6q+OVStQ5koJz09O4cMOKfYDZAMml7IlUI2yqsfXHe4OOjpJX2tnUTiGakH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_04,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409130052
X-Proofpoint-GUID: BKO-C6EVIEUXnKZ6RDOnEyJcDe-QaW6n
X-Proofpoint-ORIG-GUID: BKO-C6EVIEUXnKZ6RDOnEyJcDe-QaW6n

On Wed, Sep 11, 2024 at 11:18:12PM GMT, Charlie Jenkins wrote:
> On Wed, Sep 11, 2024 at 07:21:27PM +0100, Catalin Marinas wrote:
> > On Tue, Sep 10, 2024 at 05:45:07PM -0700, Charlie Jenkins wrote:
> > > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> > > > * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
> > > > > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> > > > > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > > > > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > >> It's also unclear to me how we want this flag to interact with
> > > > > > >> the existing logic in arch_get_mmap_end(), which attempts to
> > > > > > >> limit the default mapping to a 47-bit address space already.
> > > > > > >
> > > > > > > To optimize RISC-V progress, I recommend:
> > > > > > >
> > > > > > > Step 1: Approve the patch.
> > > > > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > > > > > > Step 3: Wait approximately several iterations for Go & OpenJDK
> > > > > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
> >
> > Point 4 is an ABI change. What guarantees that there isn't still
> > software out there that relies on the old behaviour?
>
> Yeah I don't think it would be desirable to remove the 47 bit
> constraint in architectures that already have it.
>
> >
> > > > > > I really want to first see a plausible explanation about why
> > > > > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> > > > > > like all the other major architectures (x86, arm64, powerpc64),
> > > > >
> > > > > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
> > > > > configuration. We end up with a 47-bit with 16K pages but for a
> > > > > different reason that has to do with LPA2 support (I doubt we need this
> > > > > for the user mapping but we need to untangle some of the macros there;
> > > > > that's for a separate discussion).
> > > > >
> > > > > That said, we haven't encountered any user space problems with a 48-bit
> > > > > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
> > > > > approach (47 or 48 bit default limit). Better to have some ABI
> > > > > consistency between architectures. One can still ask for addresses above
> > > > > this default limit via mmap().
> > > >
> > > > I think that is best as well.
> > > >
> > > > Can we please just do what x86 and arm64 does?
> > >
> > > I responded to Arnd in the other thread, but I am still not convinced
> > > that the solution that x86 and arm64 have selected is the best solution.
> > > The solution of defaulting to 47 bits does allow applications the
> > > ability to get addresses that are below 47 bits. However, due to
> > > differences across architectures it doesn't seem possible to have all
> > > architectures default to the same value. Additionally, this flag will be
> > > able to help users avoid potential bugs where a hint address is passed
> > > that causes upper bits of a VA to be used.
> >
> > The reason we added this limit on arm64 is that we noticed programs
> > using the top 8 bits of a 64-bit pointer for additional information.
> > IIRC, it wasn't even openJDK but some JavaScript JIT. We could have
> > taught those programs of a new flag but since we couldn't tell how many
> > are out there, it was the safest to default to a smaller limit and opt
> > in to the higher one. Such opt-in is via mmap() but if you prefer a
> > prctl() flag, that's fine by me as well (though I think this should be
> > opt-in to higher addresses rather than opt-out of the higher addresses).
>
> The mmap() flag was used in previous versions but was decided against
> because this feature is more useful if it is process-wide. A
> personality() flag was chosen instead of a prctl() flag because there
> existed other flags in personality() that were similar. I am tempted to
> use prctl() however because then we could have an additional arg to
> select the exact number of bits that should be reserved (rather than
> being fixed at 47 bits).

I am very much not in favour of a prctl(), it would require us to add state
limiting the address space and the timing of it becomes critical. Then we
have the same issue we do with the other proposals as to - what happens if
this is too low?

What is 'too low' varies by architecture, and for 32-bit architectures
could get quite... problematic.

And again, wha is the RoI here - we introducing maintenance burden and edge
cases vs. the x86 solution in order to... accommodate things that need more
than 128 TiB of address space? A problem that does not appear to exist in
reality?

I suggested the personality approach as the least impactful compromise way
of this series working, but I think after what Arnd has said (and please
forgive me if I've missed further discussion have been dipping in and out
of this!) - adapting risc v to the approach we take elsewhere seems the
most sensible solution to me.

This remains something we can revisit in future if this turns out to be
egregious.

>
> Opting-in to the higher address space is reasonable. However, it is not
> my preference, because the purpose of this flag is to ensure that
> allocations do not exceed 47-bits, so it is a clearer ABI to have the
> applications that want this guarantee to be the ones setting the flag,
> rather than the applications that want the higher bits setting the flag.

Perfect is the enemy of the good :) and an idealised solution may not end
up being something everybody can agree on.

>
> - Charlie
>
> >
> > --
> > Catalin
>
>
>

