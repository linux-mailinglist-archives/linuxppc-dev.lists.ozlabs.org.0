Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D338BC68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 04:23:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmVld1FQ0z300C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 12:23:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=tanxiaofei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmVlF4FTbz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 12:23:21 +1000 (AEST)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FmVgx0sJhz16PtQ;
 Fri, 21 May 2021 10:20:29 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 10:23:16 +0800
Received: from [127.0.0.1] (10.40.192.162) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 21 May
 2021 10:23:16 +0800
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
To: Johan Hovold <johan@kernel.org>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
 <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
 <e88b6fcd-bfe1-9812-905a-862825f420ce@huawei.com>
 <YKYcFfKiHT39Gyey@hovoldconsulting.com>
 <7e63a708-64c4-b369-066b-7f83d65bf178@huawei.com>
 <YKZpi8cmH3mtXT99@hovoldconsulting.com>
From: Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <07453180-0aa4-e260-a50d-23d27973907b@huawei.com>
Date: Fri, 21 May 2021 10:23:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YKZpi8cmH3mtXT99@hovoldconsulting.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.192.162]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

On 2021/5/20 21:52, Johan Hovold wrote:
> On Thu, May 20, 2021 at 09:21:25PM +0800, Xiaofei Tan wrote:
>
>>> Checkpatch already has too many checks IMO and I'm a bit surprised that
>>> it doesn't check this already. Perhaps it's because you used the -f to
>>> run checkpatch on in-kernel code, which you should not.
>>>
>>>>> Second, that sentence is not capitalised so why do add a period?
>>>>>
>>>>
>>>> How about capitalize the sentence, or just remove the period ?
>>>
>>> How about just leaving this unchanged?
>>
>> OK
>> And I will keep the patch 8/9, and combine space issues into
>> one new patch, and remove the others.
>
> Yeah, 8/9 is arguably a fix even if it's for a very minor issue
> (repeated words in a comment).
>
> It doesn't look like any of the white space issues are worth fixing,
> though. Such pedantry can usually be addressed when the code in question
> is being modified for other reasons.
>

OK, it is reasonable. thanks.

> Johan
>
> .
>

