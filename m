Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0725871C69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 11:58:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HJFmxo8a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpsxK3y30z3dXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 21:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HJFmxo8a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpswW4TfBz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 21:57:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709636260; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=j65dJlefD3YD0cqeyDWt8oxBp32fVKAN6EtBWBvh2Tg=;
	b=HJFmxo8ajD2YrYlW39sSkREIv7ir5cCgng7pRmCqT4kdxUdd3HMe2H5TsaN8S4K7HBup+jjYiSQc3bBbGfCTV/Pd17WW2Bz/xtS82X64mrIaORABGIfKdUFoMk1oNMzv17ZUB40zFZ3aAx/VWQ1fsogtxtW7xbAE5x55CwO6u4c=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1tyYEr_1709636255;
Received: from 30.178.67.161(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1tyYEr_1709636255)
          by smtp.aliyun-inc.com;
          Tue, 05 Mar 2024 18:57:37 +0800
Message-ID: <28a24e4b-c322-4631-ad6d-7259ca3d084d@linux.alibaba.com>
Date: Tue, 5 Mar 2024 18:57:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitao Hu <yaoma@linux.alibaba.com>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for interrupt
 statistics
To: Thomas Gleixner <tglx@linutronix.de>,
 Doug Anderson <dianders@chromium.org>
References: <20240228072216.95130-1-yaoma@linux.alibaba.com>
 <20240228072216.95130-3-yaoma@linux.alibaba.com>
 <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
 <87plwdwycx.ffs@tglx>
 <3a89fafb-f62e-472f-b40b-8bf97954e9e3@linux.alibaba.com>
 <87wmqiulaw.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87wmqiulaw.ffs@tglx>
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

On 2024/3/4 22:24, Thomas Gleixner wrote:
> The above is not even configurable by the user. It's only selectable by
> some other config option.
> 
>> +# Snapshot for interrupt statistics
>> +config GENERIC_IRQ_STAT_SNAPSHOT
>> +       bool
>> +       help
>> +
>> +         Say Y here to enable the kernel to provide a snapshot mechanism
>> +         for interrupt statistics.
> 
> That makes is visible which is pointless because it's only relevant when
> there is an actual user.
I guess I may have misunderstood your intentions earlier. Initially, I
thought you were suggesting that when "SOFTLOCKUP_DETECTOR_INTR_STORM"
is not enabled, people should be able to choose
"GENERIC_IRQ_STAT_SNAPSHOT" through menuconfig, so I attempted to make
"GENERIC_IRQ_STAT_SNAPSHOT" visible to the user. However, after
analyzing the previous emails, it seems that what you were actually
proposing was to directly disable "GENERIC_IRQ_STAT_SNAPSHOT" when
"SOFTLOCKUP_DETECTOR_INTR_STORM" is not enabled, as a way to save
memory. If my current understanding is correct, then the code for that
part would look something like the following.

Does this align with your expectations?

Best Regards,
	Bitao Hu

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 2531f3496ab6..a28e5ac5fc79 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -108,6 +108,10 @@ config GENERIC_IRQ_MATRIX_ALLOCATOR
  config GENERIC_IRQ_RESERVATION_MODE
         bool

+# Snapshot for interrupt statistics
+config GENERIC_IRQ_STAT_SNAPSHOT
+       bool
+
  # Support forced irq threading
  config IRQ_FORCED_THREADING
         bool
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 49f652674bd8..899b69fcb598 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1032,6 +1032,7 @@ config SOFTLOCKUP_DETECTOR
  config SOFTLOCKUP_DETECTOR_INTR_STORM
         bool "Detect Interrupt Storm in Soft Lockups"
         depends on SOFTLOCKUP_DETECTOR && IRQ_TIME_ACCOUNTING
+       select GENERIC_IRQ_STAT_SNAPSHOT
         default y if NR_CPUS <= 128
         help
           Say Y here to enable the kernel to detect interrupt storm






