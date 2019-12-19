Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD5125A7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 06:19:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dgDH3wJnzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 16:19:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=chenzhou10@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dYwL45Y8zDqmF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 12:20:31 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4843F5B79693D50AF8D0;
 Thu, 19 Dec 2019 09:20:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.131.64) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Thu, 19 Dec 2019
 09:20:20 +0800
Subject: Re: [PATCH] powerpc/setup_64: use DEFINE_DEBUGFS_ATTRIBUTE to define
 fops_rfi_flush
To: Michael Ellerman <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <paulus@samba.org>
References: <20191218020842.186446-1-chenzhou10@huawei.com>
 <8736dhoq0j.fsf@mpe.ellerman.id.au>
From: Chen Zhou <chenzhou10@huawei.com>
Message-ID: <69722925-d0ab-ab7e-022f-c901ead3989a@huawei.com>
Date: Thu, 19 Dec 2019 09:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <8736dhoq0j.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.131.64]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 19 Dec 2019 16:17:52 +1100
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
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Nicolai
 Stange <nicstange@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 2019/12/18 19:02, Michael Ellerman wrote:
> Chen Zhou <chenzhou10@huawei.com> writes:
>> Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
>> debugfs files.
>>
>> Semantic patch information:
>> Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
>> imposes some significant overhead as compared to
>> DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().
> 
> I know you didn't write this text, but these change logs are not great.
> It doesn't really explain why you're doing it. And it is alarming that
> you're converting *to* a function with "unsafe" in the name.
> 
> The commit that added the script:
> 
>   5103068eaca2 ("debugfs, coccinelle: check for obsolete DEFINE_SIMPLE_ATTRIBUTE() usage")
> 
> Has a bit more explanation.
> 
> Maybe something like this:
> 
>   In order to protect against file removal races, debugfs files created via
>   debugfs_create_file() are wrapped by a struct file_operations at their
>   opening.
>   
>   If the original struct file_operations is known to be safe against removal
>   races already, the proxy creation may be bypassed by creating the files
>   using DEFINE_DEBUGFS_ATTRIBUTE() and debugfs_create_file_unsafe().
> 
> 
> The part that's not explained is why this file is "known to be safe
> against removal races already"?
> 
> It also seems this conversion will make the file no longer seekable,
> because DEFINE_SIMPLE_ATTRIBUTE() uses generic_file_llseek() whereas
> DEFINE_DEBUGFS_ATTRIBUTE() uses no_llseek.
> 
> That is probably fine, but should be mentioned.

Thanks for your explanation. This part indeed should be mentioned.

Chen Zhou

> 
> cheers
> 
>> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> ---
>>  arch/powerpc/kernel/setup_64.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>> index 6104917..4b9fbb2 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -956,11 +956,11 @@ static int rfi_flush_get(void *data, u64 *val)
>>  	return 0;
>>  }
>>  
>> -DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
>>  
>>  static __init int rfi_flush_debugfs_init(void)
>>  {
>> -	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
>> +	debugfs_create_file_unsafe("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
>>  	return 0;
>>  }
>>  device_initcall(rfi_flush_debugfs_init);
>> -- 
>> 2.7.4
> 
> .
> 

