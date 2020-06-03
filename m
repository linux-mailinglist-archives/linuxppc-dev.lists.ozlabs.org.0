Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 668161ECF95
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 14:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cSYg6MZxzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 22:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=wanghai38@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 938 seconds by postgrey-1.36 at bilbo;
 Wed, 03 Jun 2020 22:13:33 AEST
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cSVj2dvKzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 22:13:29 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8BD64301FB3ED8BC1805;
 Wed,  3 Jun 2020 19:57:45 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.205) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 3 Jun 2020 19:57:40 +0800
Subject: Re: [PATCH] cxl: Fix kobject memleak
To: Andrew Donnellan <ajd@linux.ibm.com>, <fbarrat@linux.ibm.com>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
References: <20200602120733.5943-1-wanghai38@huawei.com>
 <72e2df75-b74b-cbd4-4cbe-c0f994d4c4f7@linux.ibm.com>
From: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <a9ecd617-c541-aeb1-2e94-93abba475279@huawei.com>
Date: Wed, 3 Jun 2020 19:57:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72e2df75-b74b-cbd4-4cbe-c0f994d4c4f7@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, imunsie@au1.ibm.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2020/6/3 19:33, Andrew Donnellan 写道:
> On 2/6/20 10:07 pm, Wang Hai wrote:
>> Currently the error return path from kobject_init_and_add() is not
>> followed by a call to kobject_put() - which means we are leaking
>> the kobject.
>>
>> Fix it by adding a call to kobject_put() in the error path of
>> kobject_init_and_add().
>>
>> Fixes: b087e6190ddc ("cxl: Export optional AFU configuration record 
>> in sysfs")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wang Hai <wanghai38@huawei.com>
>
> Thanks for the fix!
>
> I note that the err1 label returns without calling kfree(cr) and I 
> can't see a reason why we do that - so perhaps we should remove the 
> return statement in err1: so it falls through?
>
kfree(cr) can be called when 
kobject_put()-->kobject_release()-->kobject_cleanup()-->kobj_type->release() 
is called.  The kobj_type here is afu_config_record_type


Thanks,

Wang Hai


