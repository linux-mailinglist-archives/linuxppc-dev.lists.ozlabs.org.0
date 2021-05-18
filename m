Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F5387070
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 06:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fkj4H01sfz307J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 14:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=tanxiaofei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fkj3w6TGLz2xvS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 14:01:29 +1000 (AEST)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fkj183rCwzlfn2;
 Tue, 18 May 2021 11:59:08 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 12:01:23 +0800
Received: from [127.0.0.1] (10.40.192.162) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 18 May
 2021 12:01:23 +0800
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
To: Johan Hovold <johan@kernel.org>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
 <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
From: Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <e88b6fcd-bfe1-9812-905a-862825f420ce@huawei.com>
Date: Tue, 18 May 2021 12:01:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.192.162]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Johan,

Thanks for reviewing this patch.

On 2021/5/17 22:15, Johan Hovold wrote:
> On Mon, May 17, 2021 at 02:37:10PM +0800, Xiaofei Tan wrote:
>> Fix coding style issues of block comments, reported by checkpatch.pl.
>> Besides, add a period at the end of the sentenses.
>>
>> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
>> ---
>>  drivers/tty/hvc/hvc_console.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
>> index 39018e5..a61cdf0 100644
>> --- a/drivers/tty/hvc/hvc_console.c
>> +++ b/drivers/tty/hvc/hvc_console.c
>> @@ -177,7 +177,8 @@ static void hvc_console_print(struct console *co, const char *b,
>>  			r = cons_ops[index]->put_chars(vtermnos[index], c, i);
>>  			if (r <= 0) {
>>  				/* throw away characters on error
>> -				 * but spin in case of -EAGAIN */
>> +				 * but spin in case of -EAGAIN.
>> +				 */
>
> How is this an improvement? First, the multi-line comment style is
>
> 	/*
> 	 * ...
> 	 */
>

Yes, mostly we use this style. I can follow it if new version is needed.
BTW, How about add the '/*' check into checkpatch.pl?

> Second, that sentence is not capitalised so why do add a period?
>

How about capitalize the sentence, or just remove the period ?

> Third, why are you sending checkpatch.pl cleanups for files outside of
> staging?
>

I'm sorry, Is this a rule, or kind of tradition? I've never heard of 
this before.

> Unless doing some real changes to the files in question as well this is
> mostly just churn and noise that makes it harder to backport fixes and
> do code forensics for no real gain.
>

I'm not sure. But if cleanup patches have made it hard to backport fixes 
and do code forensics, then the code quality may not be
good enough.

> Greg may disagree, but I don't think we should be encouraging this kind
> of patches.
>
> Johan
>
> .
>

