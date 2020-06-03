Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0211EC6E7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 03:44:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cBXj072fzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 11:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=wanghai38@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cBW521r3zDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 11:42:53 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 607BF51E75753D39F3C8;
 Wed,  3 Jun 2020 09:42:46 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.205) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 3 Jun 2020 09:42:42 +0800
Subject: Re: [PATCH] cxl: Fix kobject memory leak in cxl_sysfs_afu_new_cr()
To: Markus Elfring <Markus.Elfring@web.de>, <linuxppc-dev@lists.ozlabs.org>
References: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <25ad528b-beaf-820f-9738-ea304dcbc0d7@huawei.com>
Date: Wed, 3 Jun 2020 09:42:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b9791ff3-8397-f6e9-ca88-59c9bbe8c78f@web.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Munsie <imunsie@au1.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2020/6/3 1:20, Markus Elfring 写道:
>> Fix it by adding a call to kobject_put() in the error path of
>> kobject_init_and_add().
> Thanks for another completion of the exception handling.
>
> Would an other patch subject be a bit nicer?
Thanks for the guidance, I will perfect this description and send a v2
>
> …
>> +++ b/drivers/misc/cxl/sysfs.c
>> @@ -624,7 +624,7 @@ static struct afu_config_record *cxl_sysfs_afu_new_cr(struct cxl_afu *afu, int c
>>   	rc = kobject_init_and_add(&cr->kobj, &afu_config_record_type,
>>   				  &afu->dev.kobj, "cr%i", cr->cr);
>>   	if (rc)
>> -		goto err;
>> +		goto err1;
> …
>
> Can an other label be more reasonable here?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f359287765c04711ff54fbd11645271d8e5ff763#n465
I just used the original author's label, should I replace all his labels 
like'err','err1' with reasonable one.

