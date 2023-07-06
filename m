Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5378749D57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Bzo3QT7R;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QTc2SaAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxcfC5RHWz3cXC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:22:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Bzo3QT7R;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QTc2SaAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxbLD6zvLz3bc7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 22:24:03 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3668NsBs023431;
	Thu, 6 Jul 2023 12:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=iQPGfUQOxAWGhyaxgtO6W71KjzA0XFpZtIbD4tADgko=;
 b=Bzo3QT7RBD/J4k5DqAGn2AKcfdWUMjEH69ZJaHirtrJ0TUpyG/Dm9Qu0ZVc2QtaJhaAX
 0zzpeH88mt7i2HLtXI1Cg4ADDFR3SEotHj4fY6H+bUH5PCad5GqjCxJuJ/0RV+Dd+rWt
 lNyFYolyfXO3fa4d3+7wcnx3V5XmPGUSDx8eeCxuVzn3VHrFWEDBaqkat/fo6ymskzbq
 OnzQbq5s+vQaOGbZ8mRVimepkr3hKc2Unz4y/HbwXa5f246QxlevtCy/M/NNQO0zZY5M
 H9HLCpbPjxji7t9KeR7u/KXG0HNi5HdSu+WApqZQjHGaFfztBsOllaAHeP/ZTmPKlPzF Ew== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rnrpagjh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 12:23:30 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366C6h9M024675;
	Thu, 6 Jul 2023 12:23:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7dfqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 12:23:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/1kHccEmLSxe3YvcMyHc8mwTehtFM4lO/HJSu+KYzpnv/fnPj7vGalcFcBXVW11XDbIViWYBPMeVBFBZWqaVMfXjRn2fBo8wHXrQtTzsm3k+YLaadU3fv/NLCztg7XButFBcV1k5vUDLia5QCq2jr+ae4aJdenvEB3fgyr8MojOrCGS9ZY49MTafM9M72Yt81sJz5ZmcQZcpnn0mI65v9HN5X2bCXE1gWu+MpYQ/W6mCGpVXIIDTRLNRAXOtJiZC6An6i/QvrRtNsaT3VwO4dyiGQPq/d/FkJ+ho7ytwAuaEpZ3AhbIlS+xbGchWuHeHxbLvscUR2pBdiwU4rzl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQPGfUQOxAWGhyaxgtO6W71KjzA0XFpZtIbD4tADgko=;
 b=T02JCKdvTs0uOR0SEnG4ZsF6du+4zE5ZXwiWpa/80hLz+XXX0GLNsKRLxEPPjde4T50iRviIaukM9cz8T7WP/KOX5hbM58Mwc9B6LXtZW2ustfgTTYuUAuGAJtrmOnRu+EQhyMz68NUVbF2e44DMqcSWhZcVoBAQy4h3hrw5BBt9uMW9GGFcta6fIrAe0W5HYjqagwRcnM/EidIlRh+s8Q4vEe6PM+OcN1fWlvX1CQwbvOixVi/TSVdoVFyEMkh2J2HdCvr92rPgY2CTaiNk1fbxUNW8WMYR70kmM3ei5Q4pFG9FYAu/K4++HXgI5AykRmO6wtCPuxKE7qSzXG3xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQPGfUQOxAWGhyaxgtO6W71KjzA0XFpZtIbD4tADgko=;
 b=QTc2SaAWcwcJ+YNnkIjvqooCX0NTt3QCqY7nK8I8oR+m5AxZ6jDAhUROOfgT+NGCkvmFXjYALDXJhomW3tooRo+B98rVM/wOdgrp31pq3WlnzcVaU86lT8NNAufFdLiSzAzd1WQP/QE9y2lNidgZlPT7oPK5F34DLwu4UVYNcYQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN0PR10MB5032.namprd10.prod.outlook.com (2603:10b6:408:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 12:23:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 12:23:25 +0000
Message-ID: <5dc44667-2421-f926-babd-e2f5c86b8e57@oracle.com>
Date: Thu, 6 Jul 2023 07:23:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 01/13] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
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
 <20230705142004.3605799-2-eric.devolder@oracle.com>
 <c057ba7a-3cc2-44ac-a961-fa062b909876@app.fastmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <c057ba7a-3cc2-44ac-a961-fa062b909876@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:806:120::31) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BN0PR10MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: a56c29e8-95ab-4a59-9d26-08db7e1bcbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MvXfJ2+RXtrVWT5vNgHZ8A7YEQ/VWW5Sv2mORKugRW0yPvFNo7tjZGazGA3s8ZYuxQmLdxOdtcxn2Ai863hzZV80ik8y4EU6VvWeEQ54b1hKljJZkHjxDXYT5sRBZouyE61V8nRCrDtP2oZfBtt7uugDVehs+uiGpn2b3bnlNYNJjSl6AUM0LLBl5U9tAHyUCmmB90tLyCD38apXUQSiwXzaSDz8dRK5kqVdZQujWgi6IGxwEHx9r4UX+zS2oNGgQMUAkc88X1NjimKQMo2ZTGUNPvZDdmJiTkvVaspoTBZfvi+TSFNl5ITZqZKydiW0ISVFB3IUzZco44o/vHiuPUiPO9PSmM4yKrUqB+uPSgzpmvRwZRvlSCr/ztm7RLQSkW6cwGkAq0ch2+0XqphKQZoKpFO+Ne2SRe+lG+/hsm1/XBm2T66+Daj0S2yIOUwPn7B+8o6WTHmNMj+Q5us8Uc4XrsvZuAqdEF7EXcZ2047x0xej1Z1n83c3IqifOfUegqUvrScgWa5bPLHnrxqZHJz/oJ6ouAKJGFCS+Wmi1GLJlOqMggLqLNPQY860kDcvdkyjcu37qSoZqfdBDNZgqfyVynVn/fx0XbsampmwvhFE36+TSrtaXsY+scEkuHu4tnJEBBd9XRH3RL3pxtAaOvnVJKnG33B+xPc3lgKTKic=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(478600001)(5660300002)(8936002)(7406005)(8676002)(41300700001)(66946007)(66556008)(66476007)(7416002)(316002)(4326008)(7366002)(2906002)(110136005)(54906003)(6486002)(6666004)(6512007)(2616005)(107886003)(26005)(6506007)(186003)(53546011)(31686004)(921005)(83380400001)(36756003)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VmFGM3lVMnFIbXlHRWZ5eGRHczNBNGlYWHFDUmNyYVVkWUN0T0lGbkNsQjhN?=
 =?utf-8?B?b0R5RUxWVTJDL1Nmeml5cTh5ZzZLMHRFaE5Nc1c0aEFZZHJML0dSYmRkU3Na?=
 =?utf-8?B?SHdPOSttUm1OYzRYUWdzcG9ZMUdqV2M1cW9tcWxqWUp6cGxrYnBzYUtGZkVW?=
 =?utf-8?B?U0VUZFlZNERWZXVkSVVvcGtxYjNFZ0tReFRoZ0RvOFFSbFJXalZ1ZjZtaWZH?=
 =?utf-8?B?L1pEeWZ5czl6eWRWVzVQUk1Dd1lITm9VSzNXN0tza2liUkwxeHR0ZnhXL3dC?=
 =?utf-8?B?dmc2Zys1ZVM5UDN3cnFpRXhIU3pBNktoWjU5Qkhza2JOdDFaVWNRNmQvQkpZ?=
 =?utf-8?B?VEpEbmUwQlg2VlNwUXlrUGRjWTJIeXpBNkJHZm1EUzBkOTlGVGVCemtpYkdQ?=
 =?utf-8?B?bzBab1VDd1BCZ1g1aW9rQVhJMDVxRHE1VEZyMFA1ZGZocjI3NUlmRDdSTmha?=
 =?utf-8?B?WmlkWmZhMVZmNHZSc3VvTHBzQ2JzR1ZLQURiREVRM0V0bXhINXVrU3U1TFpO?=
 =?utf-8?B?aEN4dmo0QXBhMm53RXd0UHpXbEhKRTgvc21tZXZYRXJUODlrVUlyU3c0WWNN?=
 =?utf-8?B?YVRBTk13R1JhN1VGbzUySk0zK1lEOXZHTFFjRzJQcGtSbHA4Vmo5dURPK3NL?=
 =?utf-8?B?Rm9KQnk2TDJaR1lZbkpSL1A3dWRLUGQ0UkxvUXRQVzRzc25XbGloMjRxZGQy?=
 =?utf-8?B?NHZVbGYrZ3kyTGxFQUQ4bjN0aVhlK0wybUc0cWJuUTRVd1V2VEVPMWRDZElD?=
 =?utf-8?B?UVRJYWhHbytKUUFQcVNUWGtROE53Qis1azRzVTJ3cUs1MmU3WmlEQmkvU0V1?=
 =?utf-8?B?V2tRLzZsdDRYOWZyd0lDRXhLcHJMOUxVOXdYT2JiS3hJWXRYalVlTkc2bGx2?=
 =?utf-8?B?OXZZYXZpQVB6UWs3UUpqQUNZY0RvLzhqRlNtZlhycndzYlRibkUrbE9SMWVM?=
 =?utf-8?B?eWpPM2JQakkydDlOeTBLZHNhUzFCbEljelkvOEVZRU5FSTVJRzdJc1pKa05x?=
 =?utf-8?B?NlNBOFd3bXlkMXNxa3NuQjN2Y1BhVFNnMDhOME9IdHFFb1RpNFFvVldxeXFC?=
 =?utf-8?B?MUlaS3h1UDFJemlPUmp6dE8yNjJOTlZjay90VmtQaVRrN2E5RjBNWWtlTmlh?=
 =?utf-8?B?VHliK2cyQjFzdFYzV1JvTjF0TkRxSitmcUVwd1Z4dUZEdXA1bTBqM3BDODF6?=
 =?utf-8?B?QVcrOXRHcmJaTmVQa0lzV2ZYeFVZdDFPZU9rTUlrOURUMGVYeFVMcDRwVjc5?=
 =?utf-8?B?aEV2a0lEWm1BM3ZZWTJEWk5qKytVK0JQUHNXRGMvWXhqN3loNUF3UDlVcDlz?=
 =?utf-8?B?VGlCditZK3hHb1J1Q1BVR00rR2UzaCtNWmtseW5JRFRHQStWRVVNWTZ2OTNP?=
 =?utf-8?B?QlppMDhMMW53VGIzZ3dXMVZ6MmxtcGhsc0kyekZiSEFLZWtrUENlSnVRUysy?=
 =?utf-8?B?TzJUYlZMY01SeW04anNTdEQ1ekxTcWdUMzJ6QzJQRGlIczlZSVR3MG8zajVl?=
 =?utf-8?B?NUdRa3llSG9sUXVud1Bvd3ZEZFYxTU9BQmYrM04zVnlTZ2ExYkUrd0ZVT2c2?=
 =?utf-8?B?SGp0VWhoTERKcEthQTY4VDBlQTZENEJEbnR3R3c3RVh3TkdwMlRsM2dKODNa?=
 =?utf-8?B?TXBndGhJOWVIc0laV1JqaTQyM3o0M29FdEFkeXR5S3hBaFo2KytxTzFSVml0?=
 =?utf-8?B?SW1WSVNzMmJSREw2NVUzKy84QmZxd3MyT2xXRjN4OEVaUnNtSzdjL1Mycit3?=
 =?utf-8?B?dnZDRDBsUmxUTk5DYzRES2RMdElCTTkzWFNVcm1NT3hleWp1dEN5blo0bXJV?=
 =?utf-8?B?RTVpQmU1K3hEb1c0ZXV4b1dQT3BMSXEwYloxd2IzK2F4OGVRTzhuSjZwYStE?=
 =?utf-8?B?SGZxSGNoc1FhN3R2d2JQY0lzRTdWMkc0TVdUdGZpNHlMdEoyMHZ2c2hlUVJZ?=
 =?utf-8?B?N3crL2k4cUQ5QkFsbXhZYUNNakJrYi9oU1hKYndSSWs5Tk5vTVU4RnhLWGJz?=
 =?utf-8?B?VWhnVWIwYW1pVWN1Z3RQZmxoankrTUgwTDhKYjBOSDN6WExUU2ZGTGpybmxO?=
 =?utf-8?B?Z2RCYWViUC9LSGhKQWRYUjhmZys4UDRzcmNBTDNrc0pzeDMzQ2xBMjB6aEtv?=
 =?utf-8?B?YXZ1Z1luR2M4VFQrd0pkUEJ1N3ZFdnk1REM2b2xGOUhRbVVFalM3dVNXNWZS?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?QkhQNk9RNkpjQ2Y4dzVGQ0F0ZlJFa0pCeFB2Q0xOekl6TmlSdERrT2lWLzZM?=
 =?utf-8?B?eWl4TlNiVWR3SVVPb2xnbzdXeGRyekZFR09jcUt3bGN6dWpTbVN0aHd5T09R?=
 =?utf-8?B?cVdsWjVsYWJCaGY1NWpyTUNqQXMxdzdGSWdoMDJQS0sxdHQ5YlZQOWtJV2xU?=
 =?utf-8?B?dVozSlJDU0VHcjNrdHZKdkNtemNVL0VtMTNlT1lIc3phdmNBaEdVdGE2Q1ox?=
 =?utf-8?B?czVDK2wxQ2VMSk81c2RGMkwvRGhpcmNKRENUb2ZnaFBSSk9kSEx4Vnd2SzBt?=
 =?utf-8?B?N1FTWU1iWU9YT0ZsNzNBU2lCUE1hcWZMek5YWG1RaVRmSWl3TEVCWDRERk1M?=
 =?utf-8?B?ZERMQlVMUnowUDcySDFubmhFRGtzOFhUaXpnVEdSUWVZejhWaXAwaEFIbTAy?=
 =?utf-8?B?WWNNSC9mR2Z6eUY4anY0RUUvZ0djZnVQcVBneGNXbXNkTDJxQnBwSUFEL3Vz?=
 =?utf-8?B?d213c3N4aG9qcWxrOW5mZXNlV05iQllveVVtdTVvN3dUYTVlZC9ZTVJKVFZ0?=
 =?utf-8?B?Z3UzZCtpWWpBWmpBODBBVDZVd0xSa2FZaDNYbnZ0Zjl6WkxHUU50WWIra1ZH?=
 =?utf-8?B?Qmt6TVNjbS9XL3o3VWxQSFhvd3dqb1NqTnhVWjhTOVdraC8zNlZzQVlxVHJF?=
 =?utf-8?B?RWF5Rzg2SVZVTis4THI2V3lTUFdsUnRHcSttb3F1L1l4K25mQ09zZ05oVEdt?=
 =?utf-8?B?dEliRmtCakgrNWtYRFhaUGx5dGdsMFpHUU5MelI4bXRMOFpxZ2RHMUUvaGNH?=
 =?utf-8?B?dWFLQVMxT3RydDFMUWU0aW9rMlFGdjI0QzZZZEV3UklGU2dkd096QWl5OUIr?=
 =?utf-8?B?US9ibU5DYkc3S1BZRDdsalNRU0JlM2Q2cXlTUUY4UlNnUU1NaGZUQ3ZsTUlE?=
 =?utf-8?B?c2V2RDI5c3ZGYlVxSnFRYlZ2dXRUU0FFdmM0ZHBoSjByOTAzV1NrYmprK21D?=
 =?utf-8?B?R1BaNmRIYW1TODVmWXdDSiszTXRvdE4xNlhKN2NZdzlGRDRCY3ZKVXNxMjU5?=
 =?utf-8?B?VU9DUzAwaDg2VkpTS0JocVF5ekp3TXN1TFk3TWZLR1VOU2gwVjk3UVhua3Uy?=
 =?utf-8?B?eEsyb01IcDJmTzlLNFBWZVdYcERLemFKbGpRY0JWbEtScHFvb3R1ODRJeWdp?=
 =?utf-8?B?QnBtYjVncG9WeHlMWlFZZ3gxempRbU1UZjA3czRRUnU2YkNmUExNdklmd0FQ?=
 =?utf-8?B?dnVwNVNIY3hTWjRwemdCNXVtMEdvR0g2VVh5clV5QlJ2UEhJT2REZkthV1Rl?=
 =?utf-8?B?eHFaem9EeE1pRXlzMmJXaVF3MDdpdG03alNyUStoNEd4TnRZZm1SOE0wNmIw?=
 =?utf-8?B?c0F4alJIbyt2Y2hiQTRtUnRtSDhTREE2SFBNWUdZQWNoVzRkcCtOT1J6NmRZ?=
 =?utf-8?B?Z2duTHFCTFo3NDJnM0xwVjhlaG5RSlBpVmVZNVRWWTU2Unp2bDlYbTAvYzVr?=
 =?utf-8?B?QUxnU1JGUlRGb1RTdXBGQ0lUWlE1Z3d2WjFTZnZ3UFlFd3pvVnR3d1ZkQ2dS?=
 =?utf-8?B?N3o4ZWYxWlRFcHlVSTBUN2YveUpabzUxRnMrOGhHd3JmMW9NOURRaHF5aytD?=
 =?utf-8?B?RU1uVWpDSFlZOEVhTlNnVjNjTzhOYzk1WVQ4cjZValdQOHpob0pkM1Zablhz?=
 =?utf-8?B?NFZsL0NpdldBQ2txcVQwV1BLUk9SS3piWmlZYjFHVFo5bkp0TitJSVA3VDZO?=
 =?utf-8?B?YmNtRHdTbmlMMXNPL0tNVHNBbGdZZGJEemcwdDFxcWIxNFEyV1ZBNUtMRVB1?=
 =?utf-8?B?NitjdjlYQ2t0QmpoaDhvZjNzZkQ3YlNjMDJPK2s3K0ZvbW1xTnNWV3Y5eDVX?=
 =?utf-8?B?N3N4WmJaOEdUcFpoNGZ4K3p3dUZiQW5RNHVJMDN5bFA4NUVTYkt2aUtxa0No?=
 =?utf-8?B?MVQ1R0VKenZldVVmR1FPckcvZGJiK1cyKy9iaUNsVVBFSUtKMi9kOTdNbjFy?=
 =?utf-8?B?YVlZWTVKcXNyMkNsRW1sSlZreFIrQ2tLbTlLZVV5Q2tqVVdSUnNuZ0plMUdU?=
 =?utf-8?B?cGVUS1d2T2VSMVovYkNXWlprYjlVWndadlREZmlMekFUaUJpbDFyMWtkVElG?=
 =?utf-8?B?dmlxUks2bkNxTUVWc3AwUm8vbnJIWlZzZnpjai9NSEpTTUVsY0JiZzNNcC9C?=
 =?utf-8?B?aUhTZkxCVGZBOXZOSUVQM1U2V2QvVUgrVmhCQ0M2eldER2ZSemFjNVZhci9Y?=
 =?utf-8?B?dWVNaTFSbnovNzI2L3NjbDJ4aUpGWm9sNGFSbjVaQWc4aWp0eGZRRTYybmwz?=
 =?utf-8?B?c0ZWR2o3c0hQaUtXTVA3Rnd1bENoOGpJYnZpekMxNVI4SGVLdWNOelhDcENK?=
 =?utf-8?B?OWJ5d2kwekc5UnVvOGVuTnQwMmJUQURMeVFvaS83R3pwQ0Qxa1Eza2RZTUZ4?=
 =?utf-8?Q?dE5FzOhCqOFPB5p1oVXTCphUCfNleuU/K5DKT5rwhtG+H?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	YjxMDMM+qkQgfSkF0AbwKSdjILepzTZTW6In7D7eJyyt0aVO6jK7ojTDoIYqEBqfBpxU3e4JGRXh2Da9PL/HCjBRfij9HRBcQTf9dbnIRx77YWCerx56OOjeD9m1CcYjZDWKea6qlTzGkTRjJ5DfiI/aD73t2ZLLermT2EAbwJBfn9mZwQkyayjufxw2cehAPZoiV7zcgGBO1CYmbWFXbL45sjm8Zc1RXC5O4i5OyZNJVny0i4jWIpR+ulxFUkJQYO0RbnGd4erikeo310DT0Yql0HQyGAd3xQvuxDTv9niktS8rOEZgIMWc0W6pUuBxiqOjxp+5jYfp5T3S2Ykd0UyV7SMZ/WADZyinzIsYeClzHbv0pCjqNPNjm14eVPSw9NXy9vadEBiQ3PwqXi62rmZoV7IQ1c75Ay4vx8K9Iq+MMuWc8Jj/YMj3ESEBuJXyTkEjPNjI1Nf2NQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56c29e8-95ab-4a59-9d26-08db7e1bcbe0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 12:23:25.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kSeCzmU5Xmn0Sj58dk2i40vaJEsTbYGPQrHmcJlEH4AQgLtlq7ccl68LpeV5lGo8b2N2VXBa+06SbKr9D4Xqjj5gYk0fTLY5j/oKPoq5N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5032
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_07,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060111
X-Proofpoint-GUID: p3jMpqSGdYYp7HqQe2X85Rsn1l7lqnO2
X-Proofpoint-ORIG-GUID: p3jMpqSGdYYp7HqQe2X85Rsn1l7lqnO2
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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



On 7/6/23 07:18, Arnd Bergmann wrote:
> On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
>> +
>> +config CRASH_DUMP
>> +	bool "kernel crash dumps"
>> +	depends on ARCH_SUPPORTS_CRASH_DUMP
>> +	select CRASH_CORE
>> +	select KEXEC
> 
> Today's linux-next now runs into a warning on arm64 and
> presumably others, with the same problem as on arm earlier:
> 
> WARNING: unmet direct dependencies detected for KEXEC
>    Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
>    Selected by [y]:
>    - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]
> 
> I think the easiest way to make this reliable would be
> this fixup:
> 
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index d82a7ce59c051..e58ca6128d6ee 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -91,6 +91,7 @@ config KEXEC_JUMP
>   config CRASH_DUMP
>          bool "kernel crash dumps"
>          depends on ARCH_SUPPORTS_CRASH_DUMP
> +       depends on ARCH_SUPPORTS_KEXEC
>          select CRASH_CORE
>          select KEXEC
>          help
> 
>     Arnd

Will do, thanks!
I changed my testing to include allnoconfig and allyesconfig and that revealed some minor issues as 
well. Almost there!
eric
