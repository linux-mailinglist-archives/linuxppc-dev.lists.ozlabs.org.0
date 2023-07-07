Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBCD74B8C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 23:45:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wIjTw3vH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=g4CMBQzQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyRlf5QS2z3cCs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 07:45:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wIjTw3vH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=g4CMBQzQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyC7q3WXkz3bpM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 22:17:10 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367BTuV6022708;
	Fri, 7 Jul 2023 12:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=wIjTw3vHw72SNVON/pdWkHPoZiAi2yBYdb2AseaHEzOzQMbyz6z/a4U9BLZJ+T3IbcnO
 yuZQl6J42o2EfOspLPBy9I1Kg/lMi5jPpFsMDMDa0E02Rqi+6aQmIlW6HyOf00QxROdj
 /SWG7n/31KfM6nZWrIvULCcOU08G8zdnF/ZDwbn1hT4QDXLg8MD/sqLACRW+qBz6+o+H
 LvpZYvbmkM4NQwSeVBFQwL/AUrSGWCLmGM3fKK1VfjlLJNyTPoAt4YncciEioGHG5tUJ
 2xw/ZtNRXOkoU4yZCcqZcp5BmV5CmPeog+svGi0XrhS8HrGPdTCMNSH3L18wzESBE1oA YQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rphvjr24h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 12:16:39 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 367CBgG9033490;
	Fri, 7 Jul 2023 12:16:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak8jk30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Jul 2023 12:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEjn/7Ywo9Fbq/tgQeLFZLTHZkKIAroDugvBHsYKxv384ta2ingouPaLkDPWL3DFx8VgVKq1SpGw3ewmQObRHdYUjO+T0DSqC4WLEaTlRNf6gDw8UmT9t6jEzmwnU6cqX5vBfzsJb9zbcDzAAztIvO0ZZm8vP4f6h7Yw+3VTK2tvdNKEUkPtpL/2UFlhpvSbCMXp/0iAoc+DLHZ2xAxpRPwfItN2GmPudMo0j/tHrzbZUmfzeeR5NFKiuY4jrYDCEKpGDjp43a2E80w5WjAjzePZ9v8BCCWbDtS7tGjvPrgcSuyTkmoy9F0Yp4DBDgWCjnwaqsJvEVS+oMTaFT18/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=grFtC4jyurLntw1grpmG/h0Dg8s1g07IdFLf/74YUy9quuJaNi7JYMOL67slP35YutZjOU8pPSrPCR3TW29ZtL+Jc2dx+vSn6WtDv6+HZ3S2HszU2zs/jTWcERtiWzWgVGFQKb5at7OBNX+n9aGuzZ5iuxHsWJXc/Thl3967zQ2u34xupoTk8AoCJPNC/ICNsthqmQ39P2VKnKuMYmXQmv9KaGty9S3miuduNLTP0XDNJJ1SmV1FzuwH1ZaQXdsKW4HJlcScJRwSCea4GjVS9PNkinvHLG1VUOgdvqU9G+lptL1P3GCaCFknODYyc8YRiYdfDNq9FPeLsUnj9wh4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDszClylungj96Uc5t9pZUbglqh0g62lyINCCXnVMF8=;
 b=g4CMBQzQ1xOpwI+JpJwuVxwMjXZUffwMJqo/Ai9s4zNtbDMIuUSjnpHXa2qyhSwJWQpu9M27n100FWQq0xooml5MJ839xjPUWPSR31gp3qafetqYpKpad/YURFceRV+OTXNHYkLSmS8zcui9QXeYnGq/oAqQjFyXZYuWSDGaliM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB5354.namprd10.prod.outlook.com (2603:10b6:610:df::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 12:16:35 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 12:16:34 +0000
Message-ID: <c7e2b428-eb61-50c3-dd44-2d3fbe39301d@oracle.com>
Date: Fri, 7 Jul 2023 07:16:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
        "dalias@libc.org" <dalias@libc.org>,
        "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
 <20230706222027.189117-3-eric.devolder@oracle.com>
 <0d1097dd-f0cb-8518-cf88-e6afbd2a6a19@csgroup.eu>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <0d1097dd-f0cb-8518-cf88-e6afbd2a6a19@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 252203d0-9f79-4b83-f58e-08db7ee4017f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ge0sogSf7HeEvH0EQ548JJlBeqIFcCq6R3TsPY+81flrZ9fGAcllMQMuu3EzpmpEwlgw4p4z9Uj891ZP/oKRFUG1EGMdzrWfJB05WMir3KYW+hy/zue993l/tp/ikj0dSZqt+6LAjDdXNR8ZSfJhuen+964s6QT7Vf5sjmUqiox2MyMRMcwHSREKrNtJEAsc6ZZbWJfhcZK5Jx4n7HDp56/k9y9H3Vm6i+uv48asQJm6o3Xb2G+9m0/P3QC+kHl9riE15SfUaQ/PV8g8FzT6TMHg2yWdC8kbgxGlv8ysKp10HW6p6/AkuEMs0OW1hKJ1W9UpJx2IqdUdReQFIV5bmKtQGZST+VM6Y7jA6jD3XXrhXvLqbQynoTX0lQCYxHmrL0vRIbNwwo9nt7/ccPSlZKh6QUaEW9FsdIHGEpQhzyYkLJgjfgKXvTOc8AycdX4LnlDZlUqp+MF/BHqaEhjNuWZxf1vT4xN3tC13H8fqFZN9LBY9Fc8aUi81wewOvBAk8in8PTGPDFNvdwfa451zs+WHLJngntEJSgC7chjnLG7sXqILJcA1uagdcNNwwRKJwI9+mg7Uf798ScL8gm3eo8TeMipYIk5kScVe8aREtlTJmQoe2SHOav8Ex+96KUYJfgEhqRMxdMjfqJqCVv28csymBzIGMABDr3bnPmSUuE4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(316002)(921005)(38100700002)(31696002)(36756003)(86362001)(31686004)(8936002)(41300700001)(26005)(7366002)(6512007)(5660300002)(107886003)(7416002)(7406005)(6506007)(53546011)(186003)(8676002)(2906002)(83380400001)(2616005)(66574015)(6666004)(66946007)(478600001)(110136005)(54906003)(6486002)(4326008)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WkN2VUpPSm1zL3N4OXBEdGJMNW4zSS9ZOTlmTDMwb2o3UENzaE1mQUozYndk?=
 =?utf-8?B?bEVnMmFCMkZla0JoanVrSXc1b3dnM0xmSDJ4WkZLc09nem0yRHp0aFlDRGtT?=
 =?utf-8?B?Q3FwWVJWVzM0WUdwNnRaWFJaVzBwVjFwd1B3TG04dGo3MGFvUVhWMFBqU2Uw?=
 =?utf-8?B?ellqUGVaT3RGZVlING11QWEwalIzSTVnNUR3L0xlMGlEN3pWWkdFWWRJVlA3?=
 =?utf-8?B?RWE4SU9Fd3BRSTlxemNVdjFsajJXZitCbzQ5TzJxdmNjUUJxUDdBZTROLysz?=
 =?utf-8?B?WWYreGdnSnVsUUc0UGorU0Zob2IzbmpoSzRCOUEyWklDa1F1Tm9xU0VYOW9V?=
 =?utf-8?B?S1ZuYk9XcXFPdm92TlY4RjFtOGpqWTJnTGxLS0puNmV0bXhIenJDc3hMbGRF?=
 =?utf-8?B?RHlhOVAvejdGS0h6UTB5TUtPc3k4d1hCWjFndkxRVFZtbVZneEYxbm8zTGF5?=
 =?utf-8?B?Uko0anZRNTd2YUxnMlBJZ3ptdWJOQzVmNHNhNWRlZDRMQ1ZSZkNEdngxeStJ?=
 =?utf-8?B?dm5OZ0hwMWJiWHpLNVl4VnFzcUExTkFlSWJEZUpPckp1SEFqN1pvRXZEMTNj?=
 =?utf-8?B?TGhvOExrc1E3RmV5V0ZQRUZLeWgyWk9BMUZac1ZvTmVJdU1YLzNRdzVtalYx?=
 =?utf-8?B?WXBkcGRJdjc4NHNyZWlGSCtKeGdoUVpJWEwwY3ZzL1JEOC9SV2RxWnhaK0R0?=
 =?utf-8?B?dlVwSU9vTE5kYk0wOWxnS0Nha1BWNGVPQm10RG9QWFV0Qk51NFN3QmhWMjhU?=
 =?utf-8?B?bnVRRmR5ZC84MkxiV2NIWFlaZjVjYldqZm5kRTlBSUM1OE5VOHZzZWNGdmx3?=
 =?utf-8?B?ckVnTkwyUVNBWnRhdDQzcXJ2UWJmZTFyL09hZzVVVWJGeDA4b3MzUnY5elJS?=
 =?utf-8?B?Sk5TZFNRN3ZkWkZhSlNvejNJUWZYVnZEZWNGdHFUVy9Zcmp0S1BZUFl1WWkz?=
 =?utf-8?B?c1NMYnh0am5BYkl2d3VsbGxvRXREMWN3b0NlUGN3aVFvRWtxeEYrWWFVOThU?=
 =?utf-8?B?R25lSXpRUU1sc0taYnNNb3VkM2hDVzNIZlVBQUwreGZDcitHMlVXR0E0Vklv?=
 =?utf-8?B?UkdPN0VaSkpnR2NJZHVlYUhOckFFc1ZiTjVkNytLM25aRXZOSHNlcHBrWnJ2?=
 =?utf-8?B?UzZha2VqMFZwOWdUbS9oT3RYU0lkZFJEVHM3ekgvb0NaMDF0NzRMQXhBVG03?=
 =?utf-8?B?cnJOUVVuWHpkL0NNSGNDZVp3VEFuRXc3MWxOaStXZ3pzY2pydG10eEt1SGxQ?=
 =?utf-8?B?ZVdkbWMvcTAydmZrc0ZsbzR1cXVCdGQydVM2UE9xeFg4R0MwMklMeCttSFBX?=
 =?utf-8?B?cmlqUHRUVW0vT21iU2UwNnFSVTdJNUlTbUdaMEVud0JWVjZ2YXN5cjlhdThD?=
 =?utf-8?B?eGtnOGd1dXVXVFJsSG1MOVltaWNxQ0o0LzdvdUFVRkJlOEVObEVONytUVVhy?=
 =?utf-8?B?eVIzSUttVlp0L2FXSFVzQkVHbHdlZzFoUUtFbEt3UFBrNmdIOFFSWWNqK25S?=
 =?utf-8?B?cWVWQ0MwQ1RmUVluVDhPSFRWZCs1NlJpcjM0dkxyYmNsQkpQdVhyMFBQZStI?=
 =?utf-8?B?aDRQcWdlTWxaaFNBM285b25Qc3Btb3F1S0UrZzYxQk9EeUxHK3NTaWNveFpO?=
 =?utf-8?B?R3g0dnVqbzdyM2tIdEVLeE5JSkRwWHhNbFpkZXZ6UkYrQk9QN2dYRkwrbWVv?=
 =?utf-8?B?ZFFjbTNFVktldHJadWJBYUZ6ekpNZkV1YlpuQzVjR1kzZlJmM0I4VmErOHRr?=
 =?utf-8?B?dEQ4cjVJV0J2Z3Q1WitPZWxoWnArOEVhdHUwQlhQWjRIVXkvT0t4MW5EeUZB?=
 =?utf-8?B?SjVteTFnM29nZXhDaDJzY05FekY5aTRQd3MyeFBUQm9VdGc5MWs5WFBoeith?=
 =?utf-8?B?dnowbzhjUVlKVE9qNVdweXAyRy9vSlBKbDg2dW1xMDZUSDVnTWZVNGFTczJi?=
 =?utf-8?B?Y0EydFVRNFpidDd1Y2p4eHMxZGx1aG9yYjhOVks1WFc3c05Ob1A1UTlzWU1k?=
 =?utf-8?B?OS9rSnhJK2RaWFBWQ280QXZTZllndmF5Q2MrQUtWazZlaDBRUTlVMkVVa09p?=
 =?utf-8?B?VlgyaGt4VUYvWlpvQlcreDVYdmNwL1ZvdGxFNkRzRUREck5wRlViUlBOWW9N?=
 =?utf-8?B?UmdOKzVsRkFtR1Q1MC9vcW5qalk3VHNZUnNkNE4wd3FRTHZlQ0krSnNHR3JY?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Rldiakk0NG11aTlaNERqOEpweEtHejFWNlVTSW9BYnM4MTU4ZTdHU3dHZWxM?=
 =?utf-8?B?Rkw0bzY2UjJnLzFoNFJ3Sy9qMmRrOTZuVzhvSVZCNUFEbkFmSVVIckdtWDRm?=
 =?utf-8?B?dnUvNisxWWVHTkMvbmYwM2x3S04rbGU1RXVNekVFWXpYVVFFREdhOXZjQWw4?=
 =?utf-8?B?ZHdaSlh0YkNvci9FSW40Q2RqSlFvRUpBbm5DK2xyaEhZdkE3RGIzZ1MrN2V2?=
 =?utf-8?B?UjB2cHJZSXJzMEpYTHVnMTFOc0F3cnNuZVRoRURra2x5SHZXbkJxeUt6V0hS?=
 =?utf-8?B?OW9HZWd0SFViQlN3U0FBNnhCbnp3Nk9SQ3lCR0hYaTllSnV4dVFEWVJwa1Yr?=
 =?utf-8?B?aTNTTUkxaitrZjIzZ05GazNPSzg3V0NpUmdsTmEzc3UyUkdRNlNuWkRBTWlQ?=
 =?utf-8?B?bU12TWZvNCtNZi91L0UwelNlcnlJT2ZYZVVCRVFRUy9vZk96R0xKdFUyMmhl?=
 =?utf-8?B?ZXhkRkFvTTZPdWtGRlY4NnllOUZlMGFjSDM2TW9tQkJYeVpudXR5TG1pUmNM?=
 =?utf-8?B?bGQ0U1ZQUGhPajFRcnpxNkFTYkZ3WEFpT1NISFBqSTlHc3d3YU5zbk0yMUo5?=
 =?utf-8?B?L01EVDZOeDFuaFJhS1B2MlZmeFVORi9qY1ppYmEzMVlqSkdTWEdWR3JHNzJT?=
 =?utf-8?B?eDRYSnArUHdhSnFsb0pJTXVXZkRIWlRzOEJHZXNjaW1ibmpBOGkvZEVXWDdE?=
 =?utf-8?B?WG9WVlRHSnh1STBTSFkzWFQzdVVxcXVzSTdjRUhEWG4wR2hGRlRUZnpWSmFn?=
 =?utf-8?B?TXB1OXAvNnNxSzVaNkdEdWlSSVJnNUhyYk9IeS9JM0kyL0dxZE43RmxVT3Fa?=
 =?utf-8?B?Z01makRlSmZ1dHJ1Y1luaEVjUndoaWJEMkVjOUh6MzN0RW1nUitVTHJHT1ZT?=
 =?utf-8?B?NSsrTVFocWtScERMakpDcG5ud1hJVFdUd24yZFZmNUxpa3VQZWtmbnhHbDZD?=
 =?utf-8?B?eTFDaXkwVDRQTml1Nk1Cd3ZKenBkY2ZnSkFJZkRMS25OcjVhMUExWVZaUDh4?=
 =?utf-8?B?djVWUldRK09IcUR1Mm5JMkpiZzZ3K2IxVGR6bEZyR1A0UmozRHFOQmh6U3dL?=
 =?utf-8?B?WmVPd290UVR0RTRwbllxUEsxUWtDbzV3bTRBR1BKT0xGU3lUbDlUYm4rMnZN?=
 =?utf-8?B?RG44NjE2SEl0eDFZUjlSbk9kK1NySXZnUmdjUUQ2a2JScmRxRXhJamJvanVJ?=
 =?utf-8?B?bmUyTklHNTVHejBhcWpxNUNHWkx2b2hBYXFKUGZWTXJQMXVPV2xnbUhqdm5Z?=
 =?utf-8?B?U2dDSTB2RVJ1WUpZQkZneGx0NnFmSmE4UXNMczRWMy92VG5PUktiRE9hc3p0?=
 =?utf-8?B?aS9tY1V3NDl2MUtIaTJ4dHdsSkNVRVlvOWFkRFdzL2lTV1U3WDRYSGRaV0N4?=
 =?utf-8?B?YWNaclJkNXJYZE9GbHRxYXBBalBYS1FoaEIwY0R5Y2N3TmZFWFZNSmVhWWd5?=
 =?utf-8?B?cVJITXRDUmlLR2xpNVlMai9zbVNCajJyU0Vxa1RjRVZVSEpvWkRRa3VGTWls?=
 =?utf-8?B?S0JDVll5ajg5aGFyUDVaZk9kRmcvTk1PQnhSZjl5eEN4eEF2NzVWMWlYd2lX?=
 =?utf-8?B?bzRzUCs5MWZDNlhFdVZCY0RVSVdGT2FTdjIvZ2RBcktJQnRMdEUwbVBYM1FX?=
 =?utf-8?B?YnJZd1ZNWTh4NHBXSXNZU2prSXZFdm4rRGpRZEl5Vlk2bVF6aC9LUlFaZDdP?=
 =?utf-8?B?V003MzMxWkNsRmVxVHBQVFJEak03NWZlNXd1SlhLb1IzcXNhNkdRT3Z0cVgw?=
 =?utf-8?B?WWZWMWR4SDgyNTRYRU4rZGxhanZ5NHRiaGRVVVFjUzE0dVBFTHF1VlI3TFgy?=
 =?utf-8?B?eFpuaE1jNXhWdER6TVkwQnowbEtGbllGbUlTUktVUkVIL2xvNndnN2VOb2Fp?=
 =?utf-8?B?ZSt5YnpuYmdvV002WWovT2lrVVJCaVFMcDdxMVlpalVUbUV2bWFEd1JCeEtS?=
 =?utf-8?B?NGI0RHAvK0x1c2l1MUFCRVNWMU04MjdPOTBXTDFjc0NWZXhOQk9Pc2hxUXdC?=
 =?utf-8?B?a0JXNDFzdFpuUXBEZWFDbXZ5MXNWeVBkaG5JRXlyTWQxUU1YRi9SYnpBYThF?=
 =?utf-8?B?NHpoSjBxOG5nVFVFZWV2amFhL1JvSXMxdFJtKzZ6SDBXTFpJQTJETExsay8v?=
 =?utf-8?B?S3IvQ3JSVnhncHVIQWdsMW5uSklaRkN4TExmeFhJWkFoUGs5aURpekdTWkps?=
 =?utf-8?B?N2x0d1FGMTFpUFNzZ2VaYmkrRHhTcmJYOFdFVkdMRjJjejBaSlJzaG1WdnRX?=
 =?utf-8?B?QlQ2UzlBM0svUDh0aU1ySVZNM1lxbWZHakJGcGRsUlVKSVpZRHdMc3ZQdzJ4?=
 =?utf-8?B?M243R2xPUW0rOXBRUHlyaWpVSXlIdThZL3NFS1kvY0hvSTNjM3ppeE92Njdv?=
 =?utf-8?Q?3305T3+MdCUySFL5ZUBa/Ewa+OOapb4v3/SjZgDVQArpc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	QosDKHLeGs/CAfeT83EgBxsYfRhqD1IVA7bDlwoI6+IZRKAEoSJh03ihhFn/rdNy5bkmeaNGQHS1QKNzIigFisZRZxC5wv5cgJOF9pC6azWAbbFk7GwUvAl8sALDsjOLEtMC3dp+vNxrQPfXnuLA/F+KUFEbhepn2zYNUaI1lVxdHQ08JLTYjBwRQjnVOpyhSMfKnoRNqJVi3JW1+vZVIheJJxr/RjwDUhsuKuZInCFtWypn9SsFLQi22asr3UmBpFDOxxCuoPhKtWSq/QGlP11t6DBaBSMJbGHTwQR+ZeWOkl1lQF4s4UJWdcV3LnNHTaJ4uWbvkh3yyWsjwZ7eswjCDWJ7xULjQr/7mp4lAkDUD/AAHzRbMHifwrUE+rLI7pnoiwubRQ6FSeut85UCq36PuVOQwIfMKX564Bo9C8o3UXSuYQcYe5HmErFWEmNi4mgPX3irKqe/gg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252203d0-9f79-4b83-f58e-08db7ee4017f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 12:16:34.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tadNWrXpdlNZJHPF8w06ExCZ4V0Xl4cFbNlKdwShlDQC+aMfq8ZLLaLpMP3KgaGxLhTvLtbGOYOzxgLHtiZosrjtCJpzJoAMFTUyeoEQbqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_08,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070114
X-Proofpoint-GUID: bhlY-lzXrhqQr_Fg9wxavC4FSAdtsUu7
X-Proofpoint-ORIG-GUID: bhlY-lzXrhqQr_Fg9wxavC4FSAdtsUu7
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>, "hpa@zytor.com" <hpa@zytor.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "ardb@kernel.org" <ardb@kernel.org>, "tsi@tuyoix.net" <tsi@tuyoix.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "bhe@redhat.com" <bhe@redhat.com>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "ojeda@kernel.org" <ojeda@kernel.org>, "juerg.haefliger@canonical.com" <juerg.haefliger@canonical.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "frederic@kernel.org" <frederic@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "kees
 cook@chromium.org" <keescook@chromium.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "xin3.li@intel.com" <xin3.li@intel.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "ziy@nvidia.com" <ziy@nvidia.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "ndesaulniers@google.com" <ndesaulniers@google.com>, "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "tj@kernel.org" <tj@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/7/23 00:58, Christophe Leroy wrote:
> 
> 
> Le 07/07/2023 à 00:20, Eric DeVolder a écrit :
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
> 
> 
> Why do you need to duplicate the ARCH_SELECTS_ entries in each
> architecture ?
> 
> Why not define them in arch/Kconfig then select if from each architecture ?
> 
> For instance here for x86 for ARCH_SELECTS_KEXEC_FILE all you'll have to
> do is:
> 	select ARCH_SELECTS_KEXEC_FILE if KEXEC_FILE
> 	select HAVE_IMA_KEXEC if IMA && KEXEC_FILE
> 
> 
> Christophe

Hi Christophe, thanks for looking at this!
The ARCH_SELECTS_ is where the "customization" is performed for that option. The customization is 
putting in place the differences that the arch had from the common option.

For example, with ARCH_SELECTS_KEXEC_FILE, here are all the uses:

x86:
     select HAVE_IMA_KEXEC if IMA

arm64:
     select HAVE_IMA_KEXEC if IMA

powerpc:
     select KEXEC_ELF
     select HAVE_IMA_KEXEC if IMA

riscv:
     select HAVE_IMA_KEXEC if IMA
     select KEXEC_ELF

And there are archs (parisc, riscv, s390) that support KEXEC_FILE that do not need 
ARCH_SELECTS_KEXEC_FILE.

So there isn't a clear path for optimizing the IMA statement, in this example, that I'm aware of.

But perhaps I don't quite understand the technique you are suggesting, either...

eric



> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>    arch/x86/Kconfig | 92 ++++++++++--------------------------------------
>>    1 file changed, 19 insertions(+), 73 deletions(-)
>>
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 7422db409770..9767a343f7c2 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -2040,88 +2040,34 @@ config EFI_RUNTIME_MAP
>>    
>>    source "kernel/Kconfig.hz"
>>    
>> -config KEXEC
>> -	bool "kexec system call"
>> -	select KEXEC_CORE
>> -	help
>> -	  kexec is a system call that implements the ability to shutdown your
>> -	  current kernel, and to start another kernel.  It is like a reboot
>> -	  but it is independent of the system firmware.   And like a reboot
>> -	  you can start any kernel with it, not just Linux.
>> -
>> -	  The name comes from the similarity to the exec system call.
>> -
>> -	  It is an ongoing process to be certain the hardware in a machine
>> -	  is properly shutdown, so do not be surprised if this code does not
>> -	  initially work for you.  As of this writing the exact hardware
>> -	  interface is strongly in flux, so no good recommendation can be
>> -	  made.
>> -
>> -config KEXEC_FILE
>> -	bool "kexec file based system call"
>> -	select KEXEC_CORE
>> -	select HAVE_IMA_KEXEC if IMA
>> -	depends on X86_64
>> -	depends on CRYPTO=y
>> -	depends on CRYPTO_SHA256=y
>> -	help
>> -	  This is new version of kexec system call. This system call is
>> -	  file based and takes file descriptors as system call argument
>> -	  for kernel and initramfs as opposed to list of segments as
>> -	  accepted by previous system call.
>> +config ARCH_SUPPORTS_KEXEC
>> +	def_bool y
>>    
>> -config ARCH_HAS_KEXEC_PURGATORY
>> -	def_bool KEXEC_FILE
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
>>    
>> -config KEXEC_SIG
>> -	bool "Verify kernel signature during kexec_file_load() syscall"
>> +config ARCH_SELECTS_KEXEC_FILE
>> +	def_bool y
>>    	depends on KEXEC_FILE
>> -	help
>> +	select HAVE_IMA_KEXEC if IMA
>>    
>> -	  This option makes the kexec_file_load() syscall check for a valid
>> -	  signature of the kernel image.  The image can still be loaded without
>> -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
>> -	  there's a signature that we can check, then it must be valid.
>> +config ARCH_HAS_KEXEC_PURGATORY
>> +	def_bool KEXEC_FILE
>>    
>> -	  In addition to this option, you need to enable signature
>> -	  verification for the corresponding kernel image type being
>> -	  loaded in order for this to work.
>> +config ARCH_SUPPORTS_KEXEC_SIG
>> +	def_bool y
>>    
>> -config KEXEC_SIG_FORCE
>> -	bool "Require a valid signature in kexec_file_load() syscall"
>> -	depends on KEXEC_SIG
>> -	help
>> -	  This option makes kernel signature verification mandatory for
>> -	  the kexec_file_load() syscall.
>> +config ARCH_SUPPORTS_KEXEC_SIG_FORCE
>> +	def_bool y
>>    
>> -config KEXEC_BZIMAGE_VERIFY_SIG
>> -	bool "Enable bzImage signature verification support"
>> -	depends on KEXEC_SIG
>> -	depends on SIGNED_PE_FILE_VERIFICATION
>> -	select SYSTEM_TRUSTED_KEYRING
>> -	help
>> -	  Enable bzImage signature verification support.
>> +config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
>> +	def_bool y
>>    
>> -config CRASH_DUMP
>> -	bool "kernel crash dumps"
>> -	depends on X86_64 || (X86_32 && HIGHMEM)
>> -	help
>> -	  Generate crash dump after being started by kexec.
>> -	  This should be normally only set in special crash dump kernels
>> -	  which are loaded in the main kernel with kexec-tools into
>> -	  a specially reserved region and then later executed after
>> -	  a crash by kdump/kexec. The crash dump kernel must be compiled
>> -	  to a memory address not used by the main kernel or BIOS using
>> -	  PHYSICAL_START, or it must be built as a relocatable image
>> -	  (CONFIG_RELOCATABLE=y).
>> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
>> +config ARCH_SUPPORTS_KEXEC_JUMP
>> +	def_bool y
>>    
>> -config KEXEC_JUMP
>> -	bool "kexec jump"
>> -	depends on KEXEC && HIBERNATION
>> -	help
>> -	  Jump between original kernel and kexeced kernel and invoke
>> -	  code in physical address mode via KEXEC
>> +config ARCH_SUPPORTS_CRASH_DUMP
>> +	def_bool X86_64 || (X86_32 && HIGHMEM)
>>    
>>    config PHYSICAL_START
>>    	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
