Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D9873561
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 12:10:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UYyNF/Dh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqV8d0jxqz3vdx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 22:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UYyNF/Dh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqV7r2Vlfz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 22:09:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709723374; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ceV/dYyY4lcQMo0rvtqY++7MI8S81r5Jn7ui5rksdP4=;
	b=UYyNF/DhVtuENrhLbkQqg/AwofiffYrNphckSKAiWUO7JIi1P79HxiHBMIMz7ItN2DkTgJv1PTDwTpzeCa5yR8YgFbNAVUYWQZ7cnoBnHJ9c7HNRay0iVA0vnBoN7wbHEkOK3qGwrDGeZN0l56g05Gr3xHv/w2/kq8sYTpwHibM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1xQ1s7_1709723370;
Received: from 30.178.67.110(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1xQ1s7_1709723370)
          by smtp.aliyun-inc.com;
          Wed, 06 Mar 2024 19:09:32 +0800
Message-ID: <5ab46413-5810-475a-b8c1-3c9b142ea35c@linux.alibaba.com>
Date: Wed, 6 Mar 2024 19:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for interrupt
 statistics
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
 Doug Anderson <dianders@chromium.org>
References: <20240228072216.95130-1-yaoma@linux.alibaba.com>
 <20240228072216.95130-3-yaoma@linux.alibaba.com>
 <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
 <87plwdwycx.ffs@tglx>
 <3a89fafb-f62e-472f-b40b-8bf97954e9e3@linux.alibaba.com>
 <87wmqiulaw.ffs@tglx>
 <28a24e4b-c322-4631-ad6d-7259ca3d084d@linux.alibaba.com>
 <87h6hkvcor.ffs@tglx>
From: Bitao Hu <yaoma@linux.alibaba.com>
In-Reply-To: <87h6hkvcor.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: pmladek@suse.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, yaoma@linux.alibaba.com, kernelfans@gmail.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024/3/6 00:57, Thomas Gleixner wrote:
> 
>> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
>> index 2531f3496ab6..a28e5ac5fc79 100644
>> --- a/kernel/irq/Kconfig
>> +++ b/kernel/irq/Kconfig
>> @@ -108,6 +108,10 @@ config GENERIC_IRQ_MATRIX_ALLOCATOR
>>    config GENERIC_IRQ_RESERVATION_MODE
>>           bool
>>
>> +# Snapshot for interrupt statistics
>> +config GENERIC_IRQ_STAT_SNAPSHOT
>> +       bool
>> +
>>    # Support forced irq threading
>>    config IRQ_FORCED_THREADING
>>           bool
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index 49f652674bd8..899b69fcb598 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -1032,6 +1032,7 @@ config SOFTLOCKUP_DETECTOR
>>    config SOFTLOCKUP_DETECTOR_INTR_STORM
>>           bool "Detect Interrupt Storm in Soft Lockups"
>>           depends on SOFTLOCKUP_DETECTOR && IRQ_TIME_ACCOUNTING
>> +       select GENERIC_IRQ_STAT_SNAPSHOT
> 
> This goes into the patch which adds the lockup detector parts.
> 

OK, I will implement this in the next version.

Best Regards,
	Bitao Hu
