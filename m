Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C740733C19C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 17:24:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzhZf5Vcjz30Cx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 03:24:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256 header.s=selector1 header.b=A7Np8th/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prevas.dk (client-ip=40.107.8.104;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=A7Np8th/; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80104.outbound.protection.outlook.com [40.107.8.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzhZ83kqbz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:23:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaFInJPt/sHpJyACyHeIyNut38JaY+qdgBjm3FSh6zaTGU+qJvLiaJS0NGXAu6HI5h6eet24AhTLHPPD9sBvwk+xwss2mAv4J5F1H2HZG+kUqODq8apTTLhhmit+2GJEfqkzXYWJLFXxVGbwJypB1/eohVWliSI+OeW9o5tPbBZHoQDpy2BxnrlJLjlM6Y/zXk8smNbUOw8lmYwQMAKkO0IhZX9nHiFFavXffShPJHGt1+5/kr7E7UVCdp4Ww6l+0Iq/W51AYLYJlW4GtsVYE2x3au8+1VlaDIwrCZDGRSirV5pMhL9r9rrTikSgilQy1bZkd8RWnw6ufx+rA0hi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBbwNugU0x0J3FSyQnd74gqiwS2klXqmRUfnMBA3lq4=;
 b=XHDUtUCiyRwRggjlI7HTvR9GzGUsXcrOhLsTqxnw6X4eL3OXcePbNq0RjEPUTAQxQvA0p7AE0D0HiajqGPbG3AgpG5NXeUp1L9WlBEGRR0uDdt3n8Y7MGH/iadGI9HEn039MTD0KX56/gZuoNcKggewVQaK20n1Zuf4pQKBiVwvbjesuRkI6Iw5FNSAv1P6U2Red0UlKkR2i9TGmPYeH0No7eCPq69RB4EPwIOBmcVkyRUG4WsRPmoteNKmb32cgVyg1U7Z5uLJqu4ff8tR/DLcBALhyV1q5gTaLQKZkOsI336klpYfzQTDtsstE24I9Ti0sxUylMkvT40FPa7p6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBbwNugU0x0J3FSyQnd74gqiwS2klXqmRUfnMBA3lq4=;
 b=A7Np8th/olZDVdE/s2VxfmO9ozV/8AvZhJjl22F+B+zB5VmitFuPKcJwaqj0h/mbiFenoUNa7dSQsvFcO/V92NpIwjY3m9gmQHF9lwyKdfZL+XxUk/qzocJkHXTVf3Zh9uB0uphXCvTIPF3AcDWzDJKH0xRZZrpOoSYD0tw/3Ys=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=prevas.dk; 
Received: from DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:5:a::23) by
 DB8PR10MB3498.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 16:23:46 +0000
Received: from DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::71ec:bc55:9aad:f4f9]) by DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::71ec:bc55:9aad:f4f9%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 16:23:46 +0000
Subject: Re: [PATCH] powerpc/vdso32: Add missing _restgpr_31_x to fix build
 failure
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <a7aa198a88bcd33c6e35e99f70f86c7b7f2f9440.1615270757.git.christophe.leroy@csgroup.eu>
 <20210312022940.GO29191@gate.crashing.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <023afd0c-dc61-5891-5145-5bcdce8227be@prevas.dk>
Date: Mon, 15 Mar 2021 17:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210312022940.GO29191@gate.crashing.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.208.71.248]
X-ClientProxiedBy: AM6P194CA0043.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::20) To DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:5:a::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.71.248) by
 AM6P194CA0043.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 16:23:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 402e4c69-b669-4d44-e41f-08d8e7ceb4fb
X-MS-TrafficTypeDiagnostic: DB8PR10MB3498:
X-Microsoft-Antispam-PRVS: <DB8PR10MB34983D921AEA33226B5BD01D936C9@DB8PR10MB3498.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdtMSQcxiQ1yc0mcUBKJSGtKUHxhi3Wvy4DjGWPxtD2aiK7GHAn/fZhAEpP2pKkpvjsDGkJ7eYwn0bF2aZVyZ7/SPVilv+RynhYSDGwBgo8TXmY5rBrtdFRF8APxOInc8ozlNhq7s/SY8el28n7nYU5E6fmwkpyS/5vv9qVI3xiqY7fdPwXp7YBYaxndGmMggAxtAoxHQ9tyU0ke79GhLyJhkyG92I3gbT9RV/8gzFkxjZktBb2d8r7Si7+efI4M51TxAQlEYusJWaMkdyg+ocg4ssCdzm3YXOH4JlEkH1Ab8SchTzAPBQGK+8n//n/F6cKS43P4+c7W34B6GaV74MXNA94B8pqt24NEm94eoar8kjCwJnwhq84QRg4ya2rBDNW5HewVGVwcp7GniWQUB+vduMcsPzyCSAanxheEUw7m3QVMYnsosF1BGNq4iec9A4HKC+v/NQlTMrCAXAsq10qJ3EtRAyDbJUxcKY/i4okAHrNmMHIFMbszc4c8MvLE8wpMCZ9fBK9ltcDwWAuSTLAi7Xz0uBLEzn/QBRjwM2dVRyM6hAfXlzmplWVssUMB3GpFIHYEj1/yV3N/YtidCo/Gx6UB2hdQemB6Axih89OPLA1Ovdycg5T8ZxnQA69XWsRFSugoViEVybU8LMW/Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(346002)(366004)(396003)(136003)(376002)(66476007)(4326008)(8936002)(31686004)(186003)(31696002)(6486002)(16526019)(956004)(66556008)(52116002)(44832011)(478600001)(4744005)(16576012)(8976002)(316002)(2906002)(110136005)(5660300002)(86362001)(26005)(2616005)(36756003)(8676002)(54906003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?Qw95G3a4AZSPQuIGyclZ1qoNu7bv8vwEZd/SvWPSDagD19TIUSSEJ1ck?=
 =?Windows-1252?Q?rm1fJvpzsJcphJucTLUObVAmlSsvdwxym2awBHb3dUxq5dPVwJo81rqU?=
 =?Windows-1252?Q?y3EHUtWc9Y7IRjKP9IzcOIXiTCxrlKKHJ+Yj5/GtbS9rtIfFxbWJcWhq?=
 =?Windows-1252?Q?dmYM2Q0Cp7NkWggcRbboTmyU0DibUDKb4RkbCc8oYc5Cx+yIxOIIP7o4?=
 =?Windows-1252?Q?M1TgSGgnOqWGG7euLi/S27Yil9pO8HxhCaQzDoEEzCsvqr97LdasXNoP?=
 =?Windows-1252?Q?QmLZvBU4ARxjTk7tb/ezcABBqIInZqsRGdlxpJxZqTJqEzegI9xVybqI?=
 =?Windows-1252?Q?QAnt+jH0ZSlMESIVMg1IKoCQPZ8ZdjZhHkgJO4olXI8ZWdka/9YRMiC5?=
 =?Windows-1252?Q?oyjg0jHDNON28fu1kdva/q65LeUUGdo2y/ZbOkdEPXWui6D7Gq70SBtB?=
 =?Windows-1252?Q?bGPGzJqFpDh8aK71uyjXZ0ljnUmgDmAe/dP4mvL66ofgYt9aV6X2rBVD?=
 =?Windows-1252?Q?hwY7zQm8gV6Vj1WmswJiEksQMjd/tWX8NjRUHK8VnYV3t6zSvRwQEBlU?=
 =?Windows-1252?Q?QaIr9/JEfYm+navoMYOfcBT4c4V9G2fMQWHCbFWyRpEJlO8gUU8bUbpn?=
 =?Windows-1252?Q?Q0Fi341m4Dw41lLEbbU8IeXAKwbdkyfNmxauQ7U8E/61edrz4petg3S9?=
 =?Windows-1252?Q?Yj5yRCRKY34mVxWfjad80vsuQzXddpXNyz011jjOAShDuoS4p5xSqgEf?=
 =?Windows-1252?Q?6NEXQtHtlKodc1XcGbk3m1xzDG47XGtnWGCzqdj/Iv+Aww0m05RbQc4v?=
 =?Windows-1252?Q?KZn12Y6EVdEIH3e9nZPMlwX0DVNUXHEZgwja7ZmiufkFmrtdnWdHrHU/?=
 =?Windows-1252?Q?arvAzvk+4bXA2JYZjpdDLYogLO0Qj2rYXExS0voS4DEjpJXP4a87mBio?=
 =?Windows-1252?Q?ITrShQfhLCbN5k5AnSYJ/8ISZdF7zJUBtnG/F9VzWkq8b+Kqpjibyetq?=
 =?Windows-1252?Q?hNwX7GJz68tGlYW/Lak9wXtjzbp74m/3k9Et9my/26NAjmcTCjyFnnVp?=
 =?Windows-1252?Q?rVoRiioncJwB4xUPqGgtxtSQEAuD8dIw4ymaEC7nHdnmuKooqLceVY9p?=
 =?Windows-1252?Q?7W06DJIS3NLnFKlLhgIoSKrEYex26hwyEGBR+nhRZydEp9gzrvd4c1iL?=
 =?Windows-1252?Q?FwNF5axx1rKY2C0sJlCM+rjxB6L3wprDtk6ia+StRY12j3gN9fQT89vY?=
 =?Windows-1252?Q?G5hrfAMGiPADqS+Iq+QSiyxYqfw6k6M053Pn5LFRLSdcikclSZWhvgev?=
 =?Windows-1252?Q?BkwGpi2aN+CyaIAJMmM0Z+cU4aa4hHVN+zt5z1UuIJtew5a3dfPKduAu?=
 =?Windows-1252?Q?AsTdeHQDmGXGJws8rVhCzjEvobWkNNas+xKGaFIhmeDclvV5t6LA27aE?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 402e4c69-b669-4d44-e41f-08d8e7ceb4fb
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB1881.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 16:23:46.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJwUlfjpJvMGXiPEs3iNyV0bu3kogkRtkP8B5SILSfn+EAKxalCLmddX7XDmJNwtWWzNVl4tqR4vjKcGzL7RgMjeNbzIwBHo/n6/PixkNJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3498
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/03/2021 03.29, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, Mar 09, 2021 at 06:19:30AM +0000, Christophe Leroy wrote:
>> With some defconfig including CONFIG_CC_OPTIMIZE_FOR_SIZE,
>> (for instance mvme5100_defconfig and ps3_defconfig), gcc 5
>> generates a call to _restgpr_31_x.
> 
>> I don't know if there is a way to tell GCC not to emit that call, because at the end we get more instructions than needed.
> 
> The function is required by the ABI, you need to have it.
> 
> You get *fewer* insns statically, and that is what -Os is about: reduce
> the size of the binaries.

Is there any reason to not just always build the vdso with -O2? It's one
page/one VMA either way, and the vdso is about making certain system
calls cheaper, so if unconditional -O2 could save a few cycles compared
to -Os, why not? (And if, as it seems, there's only one user within the
DSO of _restgpr_31_x, yes, the overall size of the .text segment
probably increases slightly).

Rasmus
