Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE1730BBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:48:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aaQkNVw/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BpfjSqPc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhMYy2FLpz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:48:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aaQkNVw/;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BpfjSqPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh3kz22XXz2xW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 21:55:05 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAKCi2014871;
	Wed, 14 Jun 2023 11:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=S+Fhn+GTrAoRiMRIyd4IyTAo6PZ98Fy+ZxVzBXbDQ1c=;
 b=aaQkNVw/6wbu/86RX4VEWqSJoJM32EvtHlCBJXcQi56NfRZ4hD5Lg5oA9RimHZsdoUl6
 IO8FB4zwrAuWuKtSSj9nQ1dwCSgcR4NV4c+NQtwYHL2XGyl2ooDZyqeN1oAERRPKMPZo
 ZCuZ1cMYFaw/zUEZO8B/vd//uSLTCegwO3E/zoIYnzNsm1soMBktZmax94KhrixBdKH5
 t0KZx+iBkY9MYE690tKgJecQBaylrKacwfDTIFGqJySx6EZceVANZEywjEir5K+au0pb
 jKFLJmIVhJMFTjLa08xUJTdTRSIqWv+0qTz0wgVwZsYBDDWJRfeuTcQXtDwS1qkJqCW+ Ug== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4gsty9r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:54:34 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35EA5wPq017723;
	Wed, 14 Jun 2023 11:54:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm56f7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITZdCJzKHmK8eMjeDW771BGgiAFH0T7EHFv8nJGqR06JB6MH0Acl0cAGo9kzHfcB4WXMm+i+W0TyRAWBHLtpxCtJgkFfDhSuv6/1/ZeraIezKYJpmm6BSKtkZuWlbISaic62mPQBncxI5XO4w2bB+FdsIxoFIATHwX/zXSkujedoVIoGFapKCT5MrnskORcXc80cSIGMHZC0zN02UQN/BTXpNwrxRhGzOzzg2cqHpCGUx0cs3VKkjf7pouZLNF+M++TMVTf47QFeEel4s48JFBmjIR+qJnTwxnazZWnLQ9nQqka7jrHTC/7pg/Zd7upoFiYgVST1YTDnPc9FyC1dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+Fhn+GTrAoRiMRIyd4IyTAo6PZ98Fy+ZxVzBXbDQ1c=;
 b=k5vlxYXWyM1RNPWhTUNWbgu195ZuyxZXu4qvNUnJWbNS1VsjT5hlxztzdLWT5sCo9LmLiPV0iBZebrhYVf6YQPhX6Xwoxk3Q5XxyB/rgn0HxDvS68gFke3DjFXNSK4ezZUcl1GFsqRNziaGPWfEF08BCMKlTjqsc4vNwLX+T44OvO+uYsqIPKRaQZX/9oxdBsewjMYId5vJkNdy4TMehlto4Inaii2q/kbE1VYKQj0r5cRK0Tx0V6LhASfxEnKt2eB7PADa6sl/2HM/E73nv+f92veCKYNSdvVG9bRAQhao1KsPesXFwHsEOM1Cn4eBs5T4XjXjdJOIRn9OWgPOgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+Fhn+GTrAoRiMRIyd4IyTAo6PZ98Fy+ZxVzBXbDQ1c=;
 b=BpfjSqPcmnfbxTV/zic9RLdukMbpy/mF8ILj0Trfk9nM2sd1Nv1QRrLECTaNywa8vpmMKReD0YtSwHw3XkoEuy1cseI7NIJ+bTD4ouIULVCR26hW2lbe2Kiuewjjnriwo7Mzh1g71oZAszqVli78A2bYP5yy+hpUm4I+LoJtZPE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH3PR10MB6739.namprd10.prod.outlook.com (2603:10b6:610:147::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 14 Jun
 2023 11:54:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 11:54:28 +0000
Message-ID: <715506f0-083d-0dc6-f1a1-781d025e4d15@oracle.com>
Date: Wed, 14 Jun 2023 06:54:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 01/21] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Content-Language: en-US
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
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
 <20230612172805.681179-2-eric.devolder@oracle.com>
 <6e362106-9d74-1e00-b94d-ce094367e939@huawei.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <6e362106-9d74-1e00-b94d-ce094367e939@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH3PR10MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: bc46c67f-2a7d-4a65-25dd-08db6cce1b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UR862IHm3oPUzxknYTD1aCl5h0OwQf19ZCQWUTEhqwlMUT1uzRb5ZS1f+IIGByzz02au9CB17YqWrtqvc+uHi9hNS/xAvh9jxDiMaat6357+suZM6aH3Nx4gnwHVQqsiuWssmUQyutdobk5FZ262ncIPYI2qq5Hc4gpoa3NsmRaZrMoAvUcR80Apv39unBlGjRoSGmv7KFO9pU6ceipKQKoiLw5CqaVaF5Rmf96ZUKTLvJO9Fyvm2Quzd1p6VplCT2oNhtxBvlukBZAzgI78c8mYbB4V1+/3bvojVx6M7HJVbZNqYJHF1hkD7PWLHtWYgy2TwXK2Z/cMzZ8EpDG8Q7fj8BOooI73Ijxv7P8MACiQpLJvq7gVM/j3rt2FSKBYz2ZRbNvp8zEQC13HdTO4m+Xkewd9zQPCi7tl/qLmcFlfZwvWsZ3NI3v047150nqnj7mQJqN6zkm6rB4SuQ0MwZMEtNelb2ip5djaUeFKPZ6Lg81a8OFYWFISkzDE986WBQSECrB+Sxsa1txA47qsyn0HWEqvE/3md/mD7FU4P5+zKrS7iU4lWiOscIMn+/wKnfwpmCrM4q1oR7gVn6MnG7Zv/FoPTb3xTOUElqb362GrRpJ5NKfDI3W1V30YElOu7z4Us4ap7EJRmcdB2z8LScmPYR2+fUwsF8fVYXoGHrs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(2616005)(107886003)(6512007)(53546011)(41300700001)(38100700002)(6506007)(31686004)(6486002)(6666004)(26005)(83380400001)(186003)(478600001)(4326008)(316002)(66946007)(921005)(7416002)(7366002)(66556008)(7406005)(8676002)(8936002)(2906002)(66476007)(5660300002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?b001b1FzWXFJWDh6MHRRQ3QwVHBrTThsQml4QjFKRm9CVUVlVW51K29DYUJS?=
 =?utf-8?B?RVRodk93UWNrUFRyT2IxTzlzUWZJaVNNQU5xTWJuQjBWMHNXNnVVcGdrdkxw?=
 =?utf-8?B?c2RraEN5aFpvbkRRaEpra3NYckpENWZBTmVBZHhHdFR3VGg3OFd2b1F5ZU5p?=
 =?utf-8?B?ZlhxUEwwUDFwclB3SkxSUXJxY0ZwSXdoYU00cm45UUJmT29rTXlVc2owanJw?=
 =?utf-8?B?Z2p1OXJxSUdNcFFyOTNWZitWcmUzczJDd1ZnYTB2VFkzK0xiSG1UTkFZL3pF?=
 =?utf-8?B?eFl4TzNpeGhlTWxOUDlLUWF0eXM5aTZtZ1B2VUpzcHEydENpUEZLOTBkaXNU?=
 =?utf-8?B?QmQzSGRVelVmd2hWZlk5M2V0am16M1JiS1lYMjJidGxEdmRZQ054aWJrWkx2?=
 =?utf-8?B?elFsQmRKa1Z6cDBTbzhJeEUzV2laUS9Qc2s0N0ZsWmRuV2JnL2VqUkY4SU5z?=
 =?utf-8?B?V3VucGVQcUtHZzNhQzlKbHZZVzdrTEp6cHVWVEI1cVRDSkRreU5lOTNNYTNF?=
 =?utf-8?B?SlN4VkZIWk80ZVVDSy8yMkpBYk5Wc3ZadnhpeHh1WmtRMGN0TzlhaUlFWGV0?=
 =?utf-8?B?dzlteDFUN3AwN3pEUnFGeDFudFFNcjdxS3o4RTgxVm1DM1dIcmhCdi9UZlFE?=
 =?utf-8?B?bWpIYVZ0TFlDaDJBTStGRyttMVhKTnNHYWRsUTQ1WklBQlFzclRsdFpxVUU5?=
 =?utf-8?B?dkFBcURKSU5yMXVnQ2Qrb3ZlaExGc3lRNVNGMzZ1aUYreXZxanNzUXVTZnF4?=
 =?utf-8?B?MmE3LzRNVXdqUkdrQk1FTlJhYkRyMGk4T0V5eUtkVGR1RkNreW1ZYlBoSFRG?=
 =?utf-8?B?OEh1bFJVUG9xb2ZxaitNMzZuTThMNXBsbWszUVE2SWdaSWZvMGJwb000L1h2?=
 =?utf-8?B?R0VWczJsK0pvUUk2Vlc1b0Y5bklEMmtSVVd3R2ZFbm52ajY3SkdqRHZWTlk5?=
 =?utf-8?B?TUo1MVd1SG1ZSk9VeHV0dDdnVm9DOWxndW5GVnpmRmdHUHdBV21pUTF3NXo4?=
 =?utf-8?B?YWpYaVU1bzhCZmk5c2t3VEdtTkdkaVJFTWRNTUJzcnVWK1NDYWthRmw3d3Ru?=
 =?utf-8?B?b1M3OGUxL3hYR1E4eW51TEJSOVZOa043di9NYlJsNmUxc24vNWZnRmpPUTdG?=
 =?utf-8?B?bXRFUjA4OGw3TUxWTjNBVWl3bjNZNE5IN2R2ZDNpRDJhY3QzRjF2Ukd0T3M2?=
 =?utf-8?B?bmtOVVZONkJIZnFMbFNXZUtqa1daSmgya3J2N1JDYmNmajQ2a0NmKy8zcUts?=
 =?utf-8?B?QUJ0OG5SVzMwSUxMdVduai9iQ0Q1Z1d6eDY3YkRuWjkwbm5RcFNZQkd1Mk9Y?=
 =?utf-8?B?VVNLNmc2RnBQRFR6aHJDTnhONmpabEVKSzNFR2NEWWVaL2w1Z2x6cTFCOE01?=
 =?utf-8?B?ODc5aWRhSVE1UTNYd3hOU00vTzZaV3p4bzlBUmlsQ2FNcTZWc3c4aVFNcVhw?=
 =?utf-8?B?NzRsQmIzUEtXc2lvazdUa0ZSNVQ5ZVYyK2d4YkNyVWJ6SllQZmw1QWlNd2hl?=
 =?utf-8?B?b2lUWWswdGNHOEMwV2tjSzFxNE4vYy9uQnZJUGJvYXMwdUZxalpMWmd3dE9u?=
 =?utf-8?B?aEYxQVV2UndWVUxlZDBLUXljbG94cVBCZUhKLzhYR29QZ09scHdlaFgvb0FG?=
 =?utf-8?B?aUVMTHdWOC8reUQwL3ZpcG1pakdRWjNhaUU3MmpTTTlSRlFDSEM3NVdWOVB5?=
 =?utf-8?B?L1JnclZRRmVCMUhHaXBQTXBzRVI4bmZMWGtwb2ZBUVEzUXVwZWRLb3NSeXBU?=
 =?utf-8?B?WXgwNUtYeWhlM0dISnBWdk5HOHVjVjRHMmhNb2NuQUJkTnJlR1lqRStFNGxX?=
 =?utf-8?B?cEtac0txeS8yTVRocEJqcFQyd2h6U1Q3YWgyQlpXL29TZm5SUHAzQTFjOVpx?=
 =?utf-8?B?TmZLTGhJNDJVQjVUZ1cvWSs5WTBTNzkxeEtHTWFndVFtWk5nVmdaVnBMMWE5?=
 =?utf-8?B?MEZuNG0xb2VhQWd2bThhR2JWWlBONzlQWWpCQWxNYmlNK1Q1SEtqdGt4MEFp?=
 =?utf-8?B?aXYwWG9NVXJxRUJjSjk3RG84WGMzYXAwRkVrUmRROE9NVGlMMzA5bGRoQTd3?=
 =?utf-8?B?cjM0d0hsNlViSDg2Q2t6MENIL2FXS0pDS2pma1ZLR1AyYm1IY3JWaVVGdllY?=
 =?utf-8?B?TENaOFRFMFhVNklIajVBYUJUWG9zYzlyYUVTVXdmc3hVd2p6NXFJQlkxRDJ0?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?aHVab09JL0djZndXMUE0eVBGZ0QzZmlrWUtOZmxrY3ZlTUMyWE5KWlM0SFJL?=
 =?utf-8?B?SVZNNzgvaENRb3ZEbzZsSkRQMzhUZDVlbmIzeVZGc2VxTVhab3I4eW1ibjgr?=
 =?utf-8?B?VEx1ZHpLdjF1SUVpQ1FHM2Jwb0VqOFR1bDZMc01LL1BMNDFCMWtsTmJvZmxW?=
 =?utf-8?B?MUhURDhDVWZwWWJnVm9ReHZhNkwwOXNUV0RNUW5aTldiUHpKRWVnTlB6OG1v?=
 =?utf-8?B?ZmhOL1FjT2lHTUFydFdPTUVESzc5RVhUNGNid2hoVk9SdlJYeFl3dktPb3Bq?=
 =?utf-8?B?dmt0MlgrMm5UZGt5ejlTN0o4UnFPTmZQcUpwOG1RZ05paytPN0VCNVRvYjZZ?=
 =?utf-8?B?Ty90dU5oZ1pjN3crS0sxaVdVM0wzMHJDTVpsZ3Q4UDB2QmZoYVZ0QVMxdTNn?=
 =?utf-8?B?YnNPTG9GZHliNlNwZnA5d1dVOWU2TjE0QkVtblgzK2gwZDVGRDVZSnBvd3Uz?=
 =?utf-8?B?SHNDaklBOTRDb1gxYXdpVXBBY1hvaTdaQWxCMTJqNmtyZGlGKzhmSjBkOXBC?=
 =?utf-8?B?NjY2RURreVdudkRRMG11Skk5RnhaTVJ3cjZzZUMraEk3OWVIRnFjK01wSWdC?=
 =?utf-8?B?VGFpNXN4YVlYUFJHOVZoMnBCeGphditzd2I0aGQ3VUtZRWN5aS8xTTBlMmJU?=
 =?utf-8?B?cHpyd0U4TWVpOWc1SFliZ3dhQzgwdUMzclpISW9DWTY5WEU4WWtmNGJmbWNF?=
 =?utf-8?B?Y2wyUjBwU0I5Uy9uMDRKNjA1SW1icE9XWnNEOWRHMnVNYUVpRHRySGZpVnBW?=
 =?utf-8?B?UFFGWjdSdUxVK3RhK1gzV013VFYxTmI0cW12QlloMm8wZ29wVXdxRjZRME1Z?=
 =?utf-8?B?NTZLU0pkRGVnSmVzL2RWQitCTWZ3alpSa1RSSjF4dHhQYXo2UlR5NmwrOG5H?=
 =?utf-8?B?aWZvWUh0K0JyVkM4NGJTM1czMCt6VGUrcjZDK1JzVGt1T0RNZ244V2xjeVpF?=
 =?utf-8?B?QXE5T1gvZkJ5a3RTOU96SmhOVFdVUWl2Ny9PVnRGanFtVGR2OHY5eWtsMGV2?=
 =?utf-8?B?VWM3UlNRZ2RsUTFHQld0Z0VSTy9YQmVOb0UzdzB3S3J1V0VsV3dub2cxMFpj?=
 =?utf-8?B?MSswcURleWhmRFd4NnpYc05HUGZxYWFmd2syRXFhcS8wdk5tL0YyYnpJcUY0?=
 =?utf-8?B?MEtzbzAzQ1FsTEZIaFpQdnZ6dXNJaVFZRmFzV3dpQnh1SjlKaFBUd1IxcVlQ?=
 =?utf-8?B?bC8vRnZYaWltSzA3dmpWeHFoRWc4NnViZlptNUJJbVpEWWhuSVZhV0xDeEVK?=
 =?utf-8?B?U0w0Uk5OVEVzOXJ3UzBMNzY0UUM5Z0xPNzZyZU5qa1M4OWpoRGlsSXpBRzJt?=
 =?utf-8?B?b21YTzkveEROVFNjRGFsQzdWamt1MitZckFsRTZYamJaV2JTa0NwUkptMUZ3?=
 =?utf-8?B?N3ZnRFhWNnIwWUEvcGNiVTAwY0wxNG14ZDFrR2hoMlJzNjRCR3lJcEVWQVBt?=
 =?utf-8?B?akRub0c1c0ZSeHFMT2tRM2grRXFIbVJDcnB5WE5CVTdxVktxeWNiRU9ZaTNF?=
 =?utf-8?B?eFFzdzBaZlgwS0FoSmVQaW5UYkdKdUJ3S2hLTFQzRzBpMG1pY3FTbkRXRjU5?=
 =?utf-8?B?VnJNOFFGYmZCUlNSRkhKL1RVSFBvSG9wSFpwWDQxT3luL0ZXQ1NJNEJMV29n?=
 =?utf-8?B?K1ZQeXhwMnp1SE5iU2RYY21GY1NRNG14NFJUYThKdXIrcEE3R3JVdDRiSUxp?=
 =?utf-8?B?Z1VyM1hYa0puamZPK2EvTUVXTWhGYVpDek9VdEluUkZBMDAvYzhtbk1YbHlC?=
 =?utf-8?B?UG8zc3gzQWNwNFJKNlBzWmIzRk96WmlwWWhROXJrWDlxNTZBV2xHdEZrdS9T?=
 =?utf-8?B?d0hzWllCUXFRVWNjbUprc3lZOUFSTVkrc1VZWldIMHZuUkZyWmgrYzNjWFZY?=
 =?utf-8?B?REZRelJwYU5kY1BCcXhCUkJIT0dkYit3cnBIZ0JIUU1OMnpvTzRqUG50cVRE?=
 =?utf-8?B?K05VLzZTMHliWTlYU1M5UUN2c1VYU2UwN2E5L3N1Kzk5azZKQmRaQzQwUmNK?=
 =?utf-8?B?NGxWVUQrSUlDT2pWanZrVjNRN3hBQnNaSzY3ZVJsbkFIQnQ5a25pUkNjWWlP?=
 =?utf-8?B?bDdPTE5kRWtGUG5WeHNLTzh4TXgyck1sc0F6L3NTWE02djNJWGxyVFJiVCts?=
 =?utf-8?B?QVB5eWdqN3ZPbWFlNGZ1YXU0blhRQ2hTQlhzNlV6NVFwREI1QUtMMWdLUm1t?=
 =?utf-8?B?SDljNlVoS0RXUUorWmRveEhGYS9mOE1oOFVIcTdRZ29VN29ySml3QUllaTEw?=
 =?utf-8?B?MTFUK3hpbDYrZEZpZy9SRXlPNjcxYkNEUzIxTzB2YjcrYy9Ka3FhRHJRejNI?=
 =?utf-8?B?RmJOc24xZWEyVXQ2ajR5QzNJS0V0elljVTVVV1hVK0k5WEFBS3VQNHZYSGNx?=
 =?utf-8?Q?Qi9kwQD8vdCOtF851Ztkm+vFUuX59vhrFAbVD3KY8d+sb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	YOHy5HrANjRdt4s25IefoE6P5fAwALZpmr2R8X7NV0Ys4TfA4H6QqFPIUXUi/v96FtPRCNy2QTdzr9H4xhD/KQIptyXii8RR2ayT6nuV8CzD3twi+cRu/0wtTG6lMTAYW76UHSh09yaJQ/xZVBUyg668ya2z7x/EK8PgvYnAJN+beDsXgA7UDZ4JqvejJUtHJ/OwZVXazVT8xT3YahYj94OtBMjHdXR2J7cgXx/9yc6OOeqNu8SbExK7S82pGRgDGx2gLhcvS+Q00dtnHeD01uI46ixMXAhHWX5kgtFz2NmvMcDX2YCm/VGAzfH1scChPbVQJs7OdjLPfZoeuY6v8AhhICn4rCXjbpbS+x5AddMZjimlcqYGWw+zmrjQ1TH74xLLWna4hVeOZ2ZRWvmG1RZrnKckKHAT4sqvL2Tq+r/50w0AOkEPupvA+ehf2B/RumpnAHytEsFTzQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc46c67f-2a7d-4a65-25dd-08db6cce1b34
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:54:28.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5T2I9Xk/+hMsinhKbBE6MyGC0Jb/4BTmyjOX0tPBdwKr4mPl2441GkY5aW9+MZd7EkGJmTLnpSaM6fOpErMzgJ/TVsxdDMz+S8AckRllYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6739
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_08,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140102
X-Proofpoint-GUID: DzaI8Q_JqgQ0JFaRdplEDL1zFgD56qDm
X-Proofpoint-ORIG-GUID: DzaI8Q_JqgQ0JFaRdplEDL1zFgD56qDm
X-Mailman-Approved-At: Thu, 15 Jun 2023 09:47:36 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/13/23 20:19, Leizhen (ThunderTown) wrote:
> 
> 
> On 2023/6/13 1:27, Eric DeVolder wrote:
>> The config options for kexec and crash features are consolidated
>> into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
>> is a new submenu "Kexec and crash handling" where all the kexec and
>> crash options that were once in the arch-dependent submenu "Processor
>> type and features" are now consolidated.
>>
>> The following options are impacted:
>>
>>   - KEXEC
>>   - KEXEC_FILE
>>   - KEXEC_SIG
>>   - KEXEC_SIG_FORCE
>>   - KEXEC_BZIMAGE_VERIFY_SIG
>>   - KEXEC_JUMP
>>   - CRASH_DUMP
>>
>> The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.
>>
>> Architectures specify support of certain KEXEC and CRASH features with
>> similarly named new ARCH_HAS_<option> config options.
>>
>> Architectures can utilize the new ARCH_SUPPORTS_<option> config
>> options to specify additional components when <option> is enabled.
>>
>> To summarize, the ARCH_HAS_<option> permits the <option> to be
>> enabled, and the ARCH_SUPPORTS_<option> handles side effects (ie.
>> select statements).
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/Kconfig         |  13 ------
>>   init/Kconfig         |   2 +
>>   kernel/Kconfig.kexec | 103 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 105 insertions(+), 13 deletions(-)
>>   create mode 100644 kernel/Kconfig.kexec
>>
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 205fd23e0cad..a37730679730 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
>>   
>>   menu "General architecture-dependent options"
>>   
>> -config CRASH_CORE
>> -	bool
>> -
>> -config KEXEC_CORE
>> -	select CRASH_CORE
>> -	bool
>> -
>> -config KEXEC_ELF
>> -	bool
>> -
>> -config HAVE_IMA_KEXEC
>> -	bool
>> -
>>   config ARCH_HAS_SUBPAGE_FAULTS
>>   	bool
>>   	help
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 32c24950c4ce..4424447e23a5 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1917,6 +1917,8 @@ config BINDGEN_VERSION_TEXT
>>   config TRACEPOINTS
>>   	bool
>>   
>> +source "kernel/Kconfig.kexec"
>> +
>>   endmenu		# General setup
>>   
>>   source "arch/Kconfig"
>> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
>> new file mode 100644
>> index 000000000000..660048099865
>> --- /dev/null
>> +++ b/kernel/Kconfig.kexec
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +menu "Kexec and crash features"
>> +
>> +config CRASH_CORE
>> +	bool
>> +
>> +config KEXEC_CORE
>> +	select CRASH_CORE
>> +	bool
>> +
>> +config KEXEC_ELF
>> +	bool
>> +
>> +config HAVE_IMA_KEXEC
>> +	bool
>> +
>> +config KEXEC
>> +	bool "Enable kexec system call"
>> +	default ARCH_DEFAULT_KEXEC
>> +	depends on ARCH_HAS_KEXEC
>> +	select KEXEC_CORE
>> +	help
>> +	  kexec is a system call that implements the ability to shutdown your
>> +	  current kernel, and to start another kernel.  It is like a reboot
>> +	  but it is independent of the system firmware.   And like a reboot
>> +	  you can start any kernel with it, not just Linux.
> 
> "kernel.  It is like", "firmware.   And like"
> 
> A few more spaces, I don't know the original author's intention, perhaps can be removed.
> 
I'll remove the extra spaces.

>> +
>> +	  The name comes from the similarity to the exec system call.
>> +
>> +	  It is an ongoing process to be certain the hardware in a machine
>> +	  is properly shutdown, so do not be surprised if this code does not
>> +	  initially work for you.  As of this writing the exact hardware
>> +	  interface is strongly in flux, so no good recommendation can be
>> +	  made.
>> +
>> +config KEXEC_FILE
>> +	bool "Enable kexec file based system call"
>> +	depends on ARCH_HAS_KEXEC_FILE
>> +	select KEXEC_CORE
>> +	help
>> +	  This is new version of kexec system call. This system call is
>> +	  file based and takes file descriptors as system call argument
>> +	  for kernel and initramfs as opposed to list of segments as
>> +	  accepted by previous system call.
>> +
>> +config KEXEC_SIG
>> +	bool "Verify kernel signature during kexec_file_load() syscall"
>> +	depends on KEXEC_FILE && MODULE_SIG_FORMAT
> 
> I see that there is no "depends on MODULE_SIG_FORMAT" on x86 and arm64.
> 
Good catch, I'll remove MODULE_SIG_FORMAT and place it on just s390 (which is the only arch that had 
it this way).

>> +	help
>> +
> 
> This blank line can be deleted.
> 
I will remove it.

Thank you, Zhen!
eric

>> +	  This option makes the kexec_file_load() syscall check for a valid
>> +	  signature of the kernel image.  The image can still be loaded without
>> +	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
>> +	  there's a signature that we can check, then it must be valid.
>> +
>> +	  In addition to this option, you need to enable signature
>> +	  verification for the corresponding kernel image type being
>> +	  loaded in order for this to work.
>> +
>> +config KEXEC_SIG_FORCE
>> +	bool "Require a valid signature in kexec_file_load() syscall"
>> +	depends on KEXEC_SIG
>> +	help
>> +	  This option makes kernel signature verification mandatory for
>> +	  the kexec_file_load() syscall.
>> +
>> +config KEXEC_BZIMAGE_VERIFY_SIG
>> +	bool "Enable bzImage signature verification support"
>> +	depends on KEXEC_SIG
>> +	depends on SIGNED_PE_FILE_VERIFICATION
>> +	select SYSTEM_TRUSTED_KEYRING
>> +	help
>> +	  Enable bzImage signature verification support.
>> +
>> +config KEXEC_JUMP
>> +	bool "kexec jump"
>> +	depends on KEXEC && HIBERNATION
>> +	depends on ARCH_HAS_KEXEC_JUMP
>> +	help
>> +	  Jump between original kernel and kexeced kernel and invoke
>> +	  code in physical address mode via KEXEC
>> +
>> +config CRASH_DUMP
>> +	bool "kernel crash dumps"
>> +	depends on ARCH_HAS_CRASH_DUMP
>> +	select KEXEC_CORE
>> +	select CRASH_CORE
>> +	help
>> +	  Generate crash dump after being started by kexec.
>> +	  This should be normally only set in special crash dump kernels
>> +	  which are loaded in the main kernel with kexec-tools into
>> +	  a specially reserved region and then later executed after
>> +	  a crash by kdump/kexec. The crash dump kernel must be compiled
>> +	  to a memory address not used by the main kernel or BIOS using
>> +	  PHYSICAL_START, or it must be built as a relocatable image
>> +	  (CONFIG_RELOCATABLE=y).
>> +	  For more details see Documentation/admin-guide/kdump/kdump.rst
>> +
>> +	  For s390, this option also enables zfcpdump.
>> +	  See also <file:Documentation/s390/zfcpdump.rst>
>> +
>> +endmenu
>>
> 
