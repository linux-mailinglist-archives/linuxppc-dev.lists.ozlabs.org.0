Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D33104E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 07:14:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX4rs1sZmzDwfg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 17:14:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=live.com (client-ip=40.92.253.76;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mayanksuman@live.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=vHFyax6O; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253076.outbound.protection.outlook.com [40.92.253.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX4qF5B5BzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 17:13:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCypQmEi/vDSJOkxYzHTylK/kOO0BCQGUMOxCjQwus7j8glEQZzNA+YsNsuYSOGpa2hLuzNepzaS0DssXbGhkXgLle+tXfDfHO6mGl3PfHyMD+gwQ5lBOjWA0ryGRkMYfZP+um2YJbJqC/+6gWZ/h/gBwIq7bwF47dSTkiOivq1B4orKB14X1aIXEJYxhP11zovSPMN/Ad3LTk5oUwia/AP1N9sxUpXKn2bXAaY7/wWGEtyS1cB6jOSXT8V5sU+3PqU05SzJyxI8pru5oK6PX9PMPDGgDxTlJjB11hyY4R48Y2QATwGHxHlBPKNTAsu3XwV++j/HDCrmaB1WfZX4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e+Hn2zYSyH3wZA+zwk1eP0P9L/Uc/O9GRIFLdTC5HI=;
 b=lw0nCNoS5hxOC6CjDbR6nTGROVkfQpwPzSqJRuxHbp9OF/d63cXtvEi4DQwfFk+lK65X85oZ2cis8rrkEGGgKrdhgcnWdrukjQVe4WSwX8ISC2t2N2bdHHhZzAxwUeWctQzmSA3Xbu08FmPV856FTdDkZEXNQu0UYPxCty0ytG4HCya8zXiCANwDrTUPegK99OyYCXF5ByalQve3RR/jcfXPyRIehiurZGO1cifUYV4rLErSRxtFG606mInKXq6Z5t/4w4fHliseFtA04EYyXrP0iuKz1coJy6a22sSy9aWgFG81rXaX6ytJA1PbU/ibONPdAMnMIM3UF1a4CHvKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6e+Hn2zYSyH3wZA+zwk1eP0P9L/Uc/O9GRIFLdTC5HI=;
 b=vHFyax6OQFONLZf8gemGBxP4foeohwY9iNmBs1+BXWZc9srkTATLHJs63ebZZng/ZD2+r72fOciJFUFN98teTcl9cWeRanHumXlSzTHLqSoZYjWWqI/3TCgscxFGmgjBDLig5jatm0uHpAh+oezl+FHnUG94SJaIuzGLZGlp4A9ePnlRUbYUdZpzzl3F96B24Z9kr5u4CkRPXYH54tKAQrhw4qZcgAUoeO3FRmaI1ecTCz+rx+vOTKanqWI5gHC/M7/+TL0r1Vh3jYYaLpcMMdP9LSYJFTVz/8tkEaXa552RASzdm1xYtw+gZ5tvudBQaMuBVbV8zrEjrWI1GG7A0A==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::45) by
 HK2APC01HT207.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::442)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 5 Feb
 2021 06:13:19 +0000
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::48) by HK2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebc::416) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 5 Feb 2021 06:13:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6B31E73FED300A683EA4544FF874DE5BEFFE0C18E1E5E22232FE3E17572D572A;
 UpperCasedChecksum:3F347C1490F8B92DA4226C1EB7D118FD872CB01362F6534359043393758DDE05;
 SizeAsReceived:8184; Count:48
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297]) by PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297%3]) with mapi id 15.20.3825.019; Fri, 5 Feb 2021
 06:13:19 +0000
Subject: Re: [PATCH] arch:powerpc simple_write_to_buffer return check
To: Oliver O'Halloran <oohall@gmail.com>
References: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
 <CAOSf1CGJ6ZeowMP8Zjo3TazYyaEGuEab4-QRKRJ2jjixUGGtCA@mail.gmail.com>
From: Mayank Suman <mayanksuman@live.com>
Message-ID: <PS1PR04MB29349F268D8D60A8A43B4507D6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
Date: Fri, 5 Feb 2021 11:43:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <CAOSf1CGJ6ZeowMP8Zjo3TazYyaEGuEab4-QRKRJ2jjixUGGtCA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [i+CSG2vXfBROR5cld2N6PXE4G6feH2doo5JRPXP0uQg=]
X-ClientProxiedBy: BMXPR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::16) To PS1PR04MB2934.apcprd04.prod.outlook.com
 (2603:1096:803:3e::21)
X-Microsoft-Original-Message-ID: <bef1361f-dbd7-bbca-e6b7-dc7ec4ade269@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.120] (103.127.101.171) by
 BMXPR01CA0076.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 06:13:17 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 682d8e1f-0987-44bd-504c-08d8c99d2205
X-MS-TrafficTypeDiagnostic: HK2APC01HT207:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0o+kwxJ9AYYchqNZQY8urdb7FQ/KxKRIq6uf1vMh2pspFvmXHhFxOGGrwSs/looSTEMC42U66wh1ENEq2bQ9wiqg02nVS1QmXHn4s/3PHUw1Xvs+4a41pAbOfkShW1Rsaps5yLa1JMYM/5u6tFyzxpxACzQSDfQdKfMLGF3cr6K0Zrjmtw1Y6qGe64jm04ALxhHTDdjMF3Yt3ZvPUzwDB4BgX/k5BT8fweGvBKzRy0S0gCx79NhkKLGzAK+sHmjyIBv6522jD70E0cBWgyhisUGQ5Oo+ft8zfrZCjcPYwKS8pmz74n6yllylDmoMhn5c0XJnftQbCrH3aJ516WcNrx0C9xC0LqEofmd1zamAH7TgwseXu+CCoo2lb/X4mWeRmiyKe/FBFcmPEx8Uw2KzUw==
X-MS-Exchange-AntiSpam-MessageData: WU/18ZY5xlAyi12WhSe2zhUaQDNlLRO3CI8Pc+9B4J3DacMbYKvypMdtDUupX2W+GS6Wi6NsGv+BEf2zEWtQrdV+r1eKNEkQVaEe6+ok7SPkPeB0b1C6Gp+aVdzP9AcHk9o02v/wg8AVhIOworvsJg==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682d8e1f-0987-44bd-504c-08d8c99d2205
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 06:13:19.5638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT207
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/02/21 4:05 am, Oliver O'Halloran wrote:
> On Fri, Feb 5, 2021 at 5:17 AM Mayank Suman <mayanksuman@live.com> wrote:
>>
>> Signed-off-by: Mayank Suman <mayanksuman@live.com>
> 
> commit messages aren't optional

Sorry. I will include the commit message in PATCH v2.

> 
>> ---
>>  arch/powerpc/kernel/eeh.c                    | 8 ++++----
>>  arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>> index 813713c9120c..2dbe1558a71f 100644
>> --- a/arch/powerpc/kernel/eeh.c
>> +++ b/arch/powerpc/kernel/eeh.c
>> @@ -1628,8 +1628,8 @@ static ssize_t eeh_force_recover_write(struct file *filp,
>>         char buf[20];
>>         int ret;
>>
>> -       ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
>> -       if (!ret)
>> +       ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> 
> We should probably be zeroing the buffer. Reading to sizeof(buf) - 1
> is done in a few places to guarantee that the string is nul
> terminated, but without the preceeding memset() that isn't actually
> guaranteed.

Yes, the buffer should be zeroed out first. I have included memset() in Patch v2.

> 
>> +       if (ret <= 0)
>>                 return -EFAULT;
> 
> EFAULT is supposed to be returned when the user supplies a buffer to
> write(2) which is outside their address space. I figured letting the
> sscanf() in the next step fail if the user passes writes a zero-length
> buffer and returning EINVAL made more sense. That said, the exact
> semantics around zero length writes are pretty handwavy so I guess
> this isn't wrong, but I don't think it's better either.
> 

simple_write_to_buffer may return negative value on fail.
So, -EFAULT should be return in case of negative return value. 
The conditional (!ret) was not sufficient to catch negative return value.
