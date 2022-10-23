Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4460943A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Oct 2022 17:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwM2840cyz3cJs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 02:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43; helo=out30-43.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com (out30-43.freemail.mail.aliyun.com [115.124.30.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwM1Y1sH7z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 02:04:31 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VSptLky_1666537463;
Received: from 30.13.157.28(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0VSptLky_1666537463)
          by smtp.aliyun-inc.com;
          Sun, 23 Oct 2022 23:04:25 +0800
Message-ID: <13658301-6af4-9dcf-0158-d24745d49f4f@linux.alibaba.com>
Date: Sun, 23 Oct 2022 23:04:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Content-Language: en-US
To: "Luck, Tony" <tony.luck@intel.com>, David Laight <David.Laight@ACULAB.COM>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
 <359bae4e-6ce3-cc7e-33d0-252064157bc6@linux.alibaba.com>
 <Y1IbOAvpGzA8bst1@agluck-desk3.sc.intel.com>
 <1643d19d795b4a8084228eab66a7db9f@AcuMS.aculab.com>
 <SJ1PR11MB6083624E288992BFA902CC8CFC2D9@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <dda2321d-15f4-342a-2fbe-5c535858eb34@linux.alibaba.com>
 <SJ1PR11MB6083CEDBA2719825A1AD325EFC2D9@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <SJ1PR11MB6083CEDBA2719825A1AD325EFC2D9@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Williams, Dan J" <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/10/22 AM12:30, Luck, Tony 写道:
>>> But maybe it is some RMW instruction ... then, if all the above options didn't happen ... we
>>> could get another machine check from the same address. But then we just follow the usual
>>> recovery path.
> 
> 
>> Let assume the instruction that cause the COW is in the 63/64 case, aka,
>> it is writing a different cache line from the poisoned one. But the new_page
>> allocated in COW is dropped right? So might page fault again?
> 
> It can, but this should be no surprise to a user that has a signal handler for
> a h/w event (SIGBUS, SIGSEGV, SIGILL) that does nothing to address the
> problem, but simply returns to re-execute the same instruction that caused
> the original trap.
> 
> There may be badly written signal handlers that do this. But they just cause
> pain for themselves. Linux can keep taking the traps and fixing things up and
> sending a new signal over and over.
> 
> In this case that loop may involve taking the machine check again, so some
> extra pain for the kernel, but recoverable machine checks on Intel/x86 switched
> from broadcast to delivery to just the logical CPU that tried to consume the poison
> a few generations back. So only a bit more painful than a repeated page fault.
> 
> -Tony
> 
> 

I see, thanks for your patient explanation :)

Best Regards,
Shuai

