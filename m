Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561EB38AFD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm9Pn2NCMz3btK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=tanxiaofei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm9PL3T6vz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:21:38 +1000 (AEST)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fm9Kq0pdYzBtmN;
 Thu, 20 May 2021 21:18:39 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 21:21:26 +0800
Received: from [127.0.0.1] (10.40.192.162) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 20 May
 2021 21:21:26 +0800
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
To: Johan Hovold <johan@kernel.org>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
 <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
 <e88b6fcd-bfe1-9812-905a-862825f420ce@huawei.com>
 <YKYcFfKiHT39Gyey@hovoldconsulting.com>
From: Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <7e63a708-64c4-b369-066b-7f83d65bf178@huawei.com>
Date: Thu, 20 May 2021 21:21:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YKYcFfKiHT39Gyey@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.192.162]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

Hi Johan，

On 2021/5/20 16:21, Johan Hovold wrote:
> On Tue, May 18, 2021 at 12:01:22PM +0800, Xiaofei Tan wrote:
>> Hi Johan,
>>
>> Thanks for reviewing this patch.
>>
>> On 2021/5/17 22:15, Johan Hovold wrote:
>>> On Mon, May 17, 2021 at 02:37:10PM +0800, Xiaofei Tan wrote:
>>>> Fix coding style issues of block comments, reported by checkpatch.pl.
>>>> Besides, add a period at the end of the sentenses.
>>>>
>>>> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
>>>> ---
>>>>  drivers/tty/hvc/hvc_console.c | 15 ++++++++++-----
>>>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
>>>> index 39018e5..a61cdf0 100644
>>>> --- a/drivers/tty/hvc/hvc_console.c
>>>> +++ b/drivers/tty/hvc/hvc_console.c
>>>> @@ -177,7 +177,8 @@ static void hvc_console_print(struct console *co, const char *b,
>>>>  			r = cons_ops[index]->put_chars(vtermnos[index], c, i);
>>>>  			if (r <= 0) {
>>>>  				/* throw away characters on error
>>>> -				 * but spin in case of -EAGAIN */
>>>> +				 * but spin in case of -EAGAIN.
>>>> +				 */
>>>
>>> How is this an improvement? First, the multi-line comment style is
>>>
>>> 	/*
>>> 	 * ...
>>> 	 */
>>>
>>
>> Yes, mostly we use this style. I can follow it if new version is needed.
>
> This is the preferred style outside of networking.
>
>> BTW, How about add the '/*' check into checkpatch.pl?
>
> Checkpatch already has too many checks IMO and I'm a bit surprised that
> it doesn't check this already. Perhaps it's because you used the -f to
> run checkpatch on in-kernel code, which you should not.
>
>>> Second, that sentence is not capitalised so why do add a period?
>>>
>>
>> How about capitalize the sentence, or just remove the period ?
>
> How about just leaving this unchanged?
>

OK
And I will keep the patch 8/9, and combine space issues into
one new patch, and remove the others.

>>> Third, why are you sending checkpatch.pl cleanups for files outside of
>>> staging?
>>>
>>
>> I'm sorry, Is this a rule, or kind of tradition? I've never heard of
>> this before.
>
> Many subsystems reject pure style changes unless you're also doing some
> real changes to the code in question. This is a good default rule, even
> if some maintainers may occasionally accept churn like this.
>
> You appear to be paid to do kernel work. Why don't you start fixing bugs
> or help out reviewing new code instead of sending trivial patches like
> this? We can always need another hand.
>
> But if all you you want is to increase your company patch count then
> please go work in drivers/staging where most trivial style changes are
> currently accepted.
>
>>> Unless doing some real changes to the files in question as well this is
>>> mostly just churn and noise that makes it harder to backport fixes and
>>> do code forensics for no real gain.
>>
>> I'm not sure. But if cleanup patches have made it hard to backport fixes
>> and do code forensics, then the code quality may not be
>> good enough.
>
> No, that has nothing to do with code quality, it's just that you
> introduce noise in the logs and do pointless changes of context which
> makes it harder to use tools like git blame and makes backporting harder
> for no good reason.
>
> Johan
>
> .
>

