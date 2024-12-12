Return-Path: <linuxppc-dev+bounces-4041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E069E9EE3CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 11:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y87XP0QgVz30Vb;
	Thu, 12 Dec 2024 21:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733998260;
	cv=none; b=SUQbLFGupp+SxhF+XWMrlh4q6qhhHw+U3yzvOL3IvzaXMDoDICHNeNzLl3Mg+WVAwdpWh2SvnAhGYbrtb1x9P2Seq9/nwFYywWKizSiQh4WPmkt6cKVi7TWk+rTrM0K447lz9/0lLCWSYIv/dZcnlLXGXEC6RcKDKHANDxw7ohc3/hMEModlk1Y9pX9wIfDqtWg2lM4T+MxsQxBYkhGEuDcz5g/vIUxK9PfFBib80VoJ0p+VmLQFZnlUqBsHc/GR2qj21ilfxKeBJBOqgzdtJWghk7tkEJ3COiHKB+YrEx39py5jEusv33ndy/rFjRrng2g6VS42HGZPhWiAZi8XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733998260; c=relaxed/relaxed;
	bh=0FNPbKOE96JNcPoCxE7KjT3hmaY8FJM2oQ0rEIYEcUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyjLe9vjr9ZL929r+lfiD8HbpDkM1P8U7t5wQwxuHzPsJ+Mn5cznh5AggjbJ7bCb+0u0O72c5t/QiBlbbVrwk8WsFYlWHYPY/fveZkObIh3+6KaR5xvj5SfBsBc/KnNcmUBu8S8oFhQJrOgoMy6OhRGHZulbix1WWi6lAJ9aD+ldM1jvAermNnAXCYWzAYvEkwOg3i90QhE1Lpm2sSP/rpZvnl+DENh37suvDvbJPDsrrVi5EY89wk7qn8ay8oH0Gz4gHnAXaUsIMeJlx1d7yawPOzWbGtRhoepM92CYnithTy3PBSvBIlCp+9ZdvT/xV/BHF20RLk/sy3ZVljr31g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=zhengyejian@huaweicloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=huaweicloud.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=zhengyejian@huaweicloud.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1119 seconds by postgrey-1.37 at boromir; Thu, 12 Dec 2024 21:10:58 AEDT
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y87XL6R64z306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 21:10:57 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Y876F0n6sz4f3jJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 17:51:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 68F9E1A08DC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 17:52:09 +0800 (CST)
Received: from [10.67.111.172] (unknown [10.67.111.172])
	by APP4 (Coremail) with SMTP id gCh0CgCXcYVDslpnkZaEEQ--.63144S3;
	Thu, 12 Dec 2024 17:52:04 +0800 (CST)
Message-ID: <1f11e3c4-e8fd-d4ac-23cd-0ab2de9c1799@huaweicloud.com>
Date: Thu, 12 Dec 2024 17:52:03 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 0/5] kallsyms: Emit symbol for holes in text and fix
 weak function issue
Content-Language: en-US
To: Martin Kelly <martin.kelly@crowdstrike.com>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "pasha.tatashin@soleen.com" <pasha.tatashin@soleen.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "james.clark@arm.com" <james.clark@arm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "nicolas@fjasle.eu" <nicolas@fjasle.eu>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "surenb@google.com" <surenb@google.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
 "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
 "bp@alien8.de" <bp@alien8.de>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 Ye Weihua <yeweihua4@huawei.com>
Cc: Amit Dang <amit.dang@crowdstrike.com>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
 <44353f4cd4d1cc7170d006031819550b37039dd2.camel@crowdstrike.com>
 <364aaf7c-cdc4-4e57-bb4c-f62e57c23279@csgroup.eu>
 <d25741d8a6f88d5a6c219fb53e8aa0bcc1fea982.camel@crowdstrike.com>
From: Zheng Yejian <zhengyejian@huaweicloud.com>
In-Reply-To: <d25741d8a6f88d5a6c219fb53e8aa0bcc1fea982.camel@crowdstrike.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgCXcYVDslpnkZaEEQ--.63144S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww48WrWrXF4DKF4ftr43Wrg_yoW8XrWrpF
	WfKFW5CF4DCF48J3Z2krs7ZF1Yyws3W3y7Wwn8Jw1UurZ8JFy3Ar4Sqr4jgrWDZF93Ww4U
	ZF17tF95X34kZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU0EksDUUUUU==
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/11 04:49, Martin Kelly wrote:
> On Tue, 2024-12-10 at 21:01 +0100, Christophe Leroy wrote:
>>>
>>> Hi all, what is the status of this patch series? I'd really like to
>>> see
>>> it or some other fix to this issue merged. The underlying bug is a
>>> significant one that can cause ftrace/livepatch/BPF fentry to fail
>>> silently. I've noticed this bug in another context[1] and realized
>>> they're the same issue.
>>>
>>> I'm happy to help with this patch series to address any issues as
>>> needed.
>>
>> As far as I can see there are problems on build with patch 1, see
>> https://patchwork.kernel.org/project/linux-modules/patch/20240723063258.2240610-2-zhengyejian@huaweicloud.com/
>>   
>>
>>
> 
> Yeah, I see those. Additionally, this patch no longer applies cleanly
> to current master, though fixing it up to do so is pretty easy. Having
> done that, this series appears to resolve the issues I saw in the other
> linked thread.
> 
> Zheng, do you plan to send a v3? I'd be happy to help out with this
> patch series if you'd like, as I'm hoping to get this issue resolved
> (though I am not an ftrace expert).

Sorry to rely so late. Thanks for your feedback!

Steve recently started a discussion of the issue in:
https://lore.kernel.org/all/20241014210841.5a4764de@gandalf.local.home/
but there's no conclusion.
  
I can rebase this patch series and send a new version first, and
I'm also hoping to get more feedbacks and help to resolve the issue.

-- 
Thanks,
Zheng Yejian


