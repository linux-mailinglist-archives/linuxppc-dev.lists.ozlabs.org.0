Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167E41EC9D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 08:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cKSF2stQzDqND
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=wanghai38@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cKQ917Y0zDqDK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 16:54:08 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BA4BC407E5811365DDB7;
 Wed,  3 Jun 2020 14:54:05 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.205) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 3 Jun 2020 14:54:03 +0800
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
 <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
 <20200603061443.GB531505@kroah.com>
 <20ae5516-7e41-f706-46ba-955e1936f183@huawei.com>
 <20200603065024.GA587198@kroah.com>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <0d51c5c2-80d7-610d-3866-6bc85eeaeadf@huawei.com>
Date: Wed, 3 Jun 2020 14:54:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200603065024.GA587198@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.215.205]
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Elfring <Markus.Elfring@web.de>, Ian Munsie <imunsie@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2020/6/3 14:50, Greg Kroah-Hartman 写道:
> On Wed, Jun 03, 2020 at 02:34:07PM +0800, wanghai (M) wrote:
>> 在 2020/6/3 14:14, Greg Kroah-Hartman 写道:
>>> On Wed, Jun 03, 2020 at 09:42:41AM +0800, wanghai (M) wrote:
>>>> 在 2020/6/3 1:20, Markus Elfring 写道:
>>>>>> Fix it by adding a call to kobject_put() in the error path of
>>>>>> kobject_init_and_add().
>>>>> Thanks for another completion of the exception handling.
>>>>>
>>>>> Would an other patch subject be a bit nicer?
>>>> Thanks for the guidance, I will perfect this description and send a v2
>>> Please note that you are responding to someone that a lot of kernel
>>> developers and maintainers have blacklisted as being very annoying and
>>> not helpful at all.
>>>
>>> Please do not feel that you need to respond to, or change any patch in
>>> response to their emails at all.
>>>
>>> I strongly recommend you just add them to your filters to not have to
>>> see their messages.  That's what I have done.
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>> .
>> Okay, so I don’t have to send the v2 patch.
> No, all should be fine, I'll review the patch when after 5.8-rc1 is out,
> and if I find any problems with it, will let you know then.

Got it. Thanks.


thanks,

Wang Hai



