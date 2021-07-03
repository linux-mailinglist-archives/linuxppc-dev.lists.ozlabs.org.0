Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 151703BA746
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 06:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GH0580cpBz3bNr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 14:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=yi.zhang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GH04k1pVzz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 14:55:14 +1000 (AEST)
Received: from dggeme752-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GH00x4FJmzZpPy;
 Sat,  3 Jul 2021 12:52:01 +0800 (CST)
Received: from [10.174.178.134] (10.174.178.134) by
 dggeme752-chm.china.huawei.com (10.3.19.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 3 Jul 2021 12:55:09 +0800
Subject: Re: [powerpc][5.13.0-next-20210701] Kernel crash while running
 ltp(chdir01) tests
To: Theodore Ts'o <tytso@mit.edu>
References: <26ACA75D-E13D-405B-9BFC-691B5FB64243@linux.vnet.ibm.com>
 <bf1c5b38-92f1-65db-e210-a97a199718ba@linux.dev>
 <4cc87ab3-aaa6-ed87-b690-5e5b99de8380@huawei.com>
 <03f734bd-f36e-f55b-0448-485b8a0d5b75@huawei.com> <YN86yl5kgVaRixxQ@mit.edu>
 <36778615-86fd-9a19-9bc9-f93a6f2d5817@huawei.com> <YN/a70ucYXu0DqGf@mit.edu>
From: Zhang Yi <yi.zhang@huawei.com>
Message-ID: <66fb56cd-f1ff-c592-0202-0691372e32f5@huawei.com>
Date: Sat, 3 Jul 2021 12:55:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <YN/a70ucYXu0DqGf@mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.134]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme752-chm.china.huawei.com (10.3.19.98)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Jan Kara <jack@suse.cz>,
 Guoqing Jiang <guoqing.jiang@linux.dev>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/7/3 11:35, Theodore Ts'o wrote:
> On Sat, Jul 03, 2021 at 11:05:07AM +0800, Zhang Yi wrote:
>>
>> Originally, I want to add this shrinker as a optional feature for jbd2 because
>> only ext4 use it now and I'm not sure does ocfs2 needs this feature. So I export
>> jbd2_journal_[un]register_shrinker(), ext4 could invoke them individually.
> 
> The reason why bdev_try_to_free_page() callback was needed for ext4
> --- namely so there was a way to release checkpointed buffers under
> memory pressure --- also exists for ocfs2.  It was probably true that
> in most deployments of ocfs2, they weren't running with super-tight
> memory availability, so it may not have been necessary the same way
> that it might be necessary, say, if ext4 was being used on a Rasberry
> Pi.  :-)
> 
>> And one more thing we to could do is rename the 'j_jh_shrink_count' to something
>> like 'j_checkpoint_jh_count' because we always init it no matter we register the
>> shrinker or not later.
> 
> That makes sense.
> 
> In fact, unless I'm mistaken, I don't think it's legal to call
> percpu_counter_{inc,dec} if the shrinker isn't initialized.  So for
> ocfs2, if we didn't initialize percpu_counter, when
> __jbd2_journal_insert_checkpoint() tries to call percpu_counter_inc(),
> I believe things would potentially go *boom* on some implementations
> of the percpu counter (e.g., on Power and ARM).  So not only would it
> not hurt to register the shrinker for ocfs2, I think it's required.
> 
> So yeah, let's rename it to something like j_checkpoint_jh_count, and
> then let's inline jbd2_journal_[un]register_shrinker() in
> journal_init_common() and jbd2_journal_unregister_shrinker().
> 
> What do you think?
> 

Yeah, it sounds good to me. Do you want me to send the fix patch, or you
modify your commit 8f9e16badb8fd in another email directly?

Thanks,
Yi.
