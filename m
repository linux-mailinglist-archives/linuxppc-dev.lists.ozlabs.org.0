Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2B3106B2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 09:31:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX7tG2pT8zDvYs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 19:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=live.com (client-ip=40.92.253.83;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mayanksuman@live.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=PjSqO0fP; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253083.outbound.protection.outlook.com [40.92.253.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX7r81vqdzDvVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 19:29:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmUcGwxQtXHWSyVpIOOZ6VoJCLQuS0cGAwcz7ChjbHEZaWYDBKNGGOYZfKHcsu/y9XMZM6pmIhL+aFv4e48HmA7O4ahoK32FvvMvO0lrtoPoym5ZmI2+eV9iZ8QnymkXSp7XtK+K21oiPwE241NI0FlE/2e/Bf/VgW0jMcOeNK/a1KMFLUctsNESi9Zt+LDcrrlwPQen+h5OXhfHQdnI5W97ZIxFpPpl83qG+mAJwuA4vk4Qo7X8dz1YrTIhGp8RPrNA3FYvQRcR1whoaKDgXKTk26scyjflLFl88u9gmOekRnIYAPmmFiPXGH2U7TAf1vaGy/0F4KUP+8jOuSBYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/5QTaoq+R4i7gs8ypeSHJTVCXMm0u9PnWVSHCxRbms=;
 b=FVuhdyqhbWQNweAvxNBaOSU7lekPzzG5cPlonXiXq2XNEFI+eHk7erq3EKdfDt+hpv6jmuOUj86uIFQlkJAJBwhwJwHNRBINaP4oVF4LnEgAk/VaxGbiqGkYrKAPUEKdC1HcB7gSfeSFQ8BKhFoOqh6oj5u1q93JAnE8X5QglBqEoROXbKWrg8EUE25O+YIb/nRP/NrhGHdl/l63n7Z1tkU5N3L3OnPEnihuQR0eJl4x9dkXv6+7Aj4hpcLNJH3mIfLTgy0MTWoIBv1KdrfQtAkNeRp6e3iehcjasuKy6cBlR0ZPHrObfu1BjbddmSmJ34Fl1OsIhSbqKecMSS/srA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/5QTaoq+R4i7gs8ypeSHJTVCXMm0u9PnWVSHCxRbms=;
 b=PjSqO0fP2wVwVvZnlxM6ZjJFlQkF5TqWcYlsrUbi1A3ajuSg1InPY4gsHto8GQJKXhnIzH3fR1KCJ8iJNE2LVhIxOH/Vp8vDAg9TbOAwmvYOwe6mE8XPfKWL25AlTMrxlwt2RvkrRFQk1/BwqPWoIhY9olmeVPLEnHD1clbpmHIdAHd9696/IE2kOZ2rDPAmuooAjbq4ax/HSuiO4HHZbvvAGzWB3Ub9WJN4oWlxOa2LEw5F/mcv8vf3feI3/1JOpJHFfgMNjsOWkmb8JgzzM6kEXflj3Pa/gODTf2WiS9SOL5i0XtTVQXroma7LkOON0tjOIgKLq39qd3UzHdVGLw==
Received: from PU1APC01FT115.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::49) by
 PU1APC01HT055.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::336)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 5 Feb
 2021 08:29:23 +0000
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::46) by PU1APC01FT115.mail.protection.outlook.com
 (2a01:111:e400:7ebe::208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 5 Feb 2021 08:29:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4B191CE3C5488061D78A877C043C0AD67FD02F31A7D2E9EE3579EF2B26E75AAA;
 UpperCasedChecksum:DC58ED774A3411FC77DE5D199673280CBCBA05E3E3EFE8EE2BA94217B5C90B42;
 SizeAsReceived:8033; Count:47
Received: from PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297]) by PS1PR04MB2934.apcprd04.prod.outlook.com
 ([fe80::55d8:45ac:a6c8:b297%3]) with mapi id 15.20.3825.019; Fri, 5 Feb 2021
 08:29:22 +0000
Subject: Re: [PATCH] arch:powerpc simple_write_to_buffer return check
To: Christophe Leroy <christophe.leroy@csgroup.eu>, ruscur@russell.cc,
 oohall@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
 <8be2b91b-cef1-ea68-836a-94c8a574d760@csgroup.eu>
From: Mayank Suman <mayanksuman@live.com>
Message-ID: <PS1PR04MB293467B694912148C8F3FE5FD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
Date: Fri, 5 Feb 2021 13:59:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <8be2b91b-cef1-ea68-836a-94c8a574d760@csgroup.eu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TMN: [j8AYjhE1A3Q3v/PCuuFVOU4R5QNs/YUzQB7QZgEJx6I=]
X-ClientProxiedBy: PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::16) To PS1PR04MB2934.apcprd04.prod.outlook.com
 (2603:1096:803:3e::21)
X-Microsoft-Original-Message-ID: <09ac289b-ee71-3c19-dfdc-ab8b6d6a4f90@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.120] (103.127.101.171) by
 PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 08:29:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bb59c8aa-6ab3-4adc-df94-08d8c9b023d5
X-MS-TrafficTypeDiagnostic: PU1APC01HT055:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yc07yJ6IiKj7tyFLKb/jLolS1l9B4MpKTMIr7ra3kBRo2MWp2OaC3srr61mnx/vZ3sK4PavaYovhjPSOc707Jkas53C8VKC5DmmpI9ugpT3qeiddHa5KFpu3E2kqb6Sr+Qv8/E5nIRimMgPSJOZ6Qc1PUYh/j+jvZHFyPRWXz4IDaqsFrEjEiqfNQerk0EFwG/8JTEILnqQMLSmay2nEf7J/Fz/UYmC6XEnl7CeAVr+I9OpWWlD1TWMHyJ1lSNVZS1Mk24GNAb0TIjGJ/0CLFAPnFl64sFgXz0QIpktveENpzrkHYKHeFQOvnOYkksx2WQlMFDJON+uut6yHLOq2LEK1l6tgtSwiLKNb6nf23ZGV7dWGjNiywhwjgZNoCWP1YqwXJlz7F6IS3hI2DLzixw==
X-MS-Exchange-AntiSpam-MessageData: 1YdfOaf+2p89Oudu8YwiqbZfKUBidrzGzxvt8prASV+fJbzbZdGLdFHdjRH7U/DDgByhg5ezXgcYzcnBnKzkSTKYkBEu+swa84H5sWuUpELT+ZIgJHk345MMW9h2EaLYWQFhbyaSzVLFGnL1P9brkg==
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb59c8aa-6ab3-4adc-df94-08d8c9b023d5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:29:22.8939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT115.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT055
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/02/21 12:51 pm, Christophe Leroy wrote:
> Please provide some description of the change.
> 
> And please clarify the patch subject, because as far as I can see, the return is already checked allthough the check seams wrong.

This was my first patch. I will try to provide better description of changes and subject in later patches.

> Le 04/02/2021 à 19:16, Mayank Suman a écrit :
>> Signed-off-by: Mayank Suman <mayanksuman@live.com>
>> ---
>>   arch/powerpc/kernel/eeh.c                    | 8 ++++----
>>   arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>> index 813713c9120c..2dbe1558a71f 100644
>> --- a/arch/powerpc/kernel/eeh.c
>> +++ b/arch/powerpc/kernel/eeh.c
>> @@ -1628,8 +1628,8 @@ static ssize_t eeh_force_recover_write(struct file *filp,
>>       char buf[20];
>>       int ret;
>>   -    ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
>> -    if (!ret)
>> +    ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
>> +    if (ret <= 0) >           return -EFAULT;
> 
> Why return -EFAULT when the function has returned -EINVAL ?

If -EINVAL is returned by simple_write_to_buffer, we should return -EINVAL.

> And why is it -EFAULT when ret is 0 ? EFAULT means error accessing memory.
> 

The earlier check returned EFAULT when ret is 0. Most probably, there was an assumption
that writing 0 bytes (by simple_write_to_buffer) means a fault with memory (or error accessing memory).
