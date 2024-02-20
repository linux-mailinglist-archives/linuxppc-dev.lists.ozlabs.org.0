Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD485B81F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 10:50:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ejkd3q1q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfF4r681yz3cRv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 20:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ejkd3q1q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfF466slGz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:49:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1708422560; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KVGuMbs0Ek78rNZXhgXCoIlF0qOOV7+uQghBDmhesIA=;
	b=Ejkd3q1qWMLFUU+gv9DjfIC2T7WYX3bdfUroJmraAP7rQ1ykqAcaeb55KrtpAzkw3BEojgV7gJGArOCi46RwSqq+GZTJQWiFStKbFYHWOAdvl/QZsLApvci+u1n10wPONJlimOzyTOevtp2cpws4eJk0F6QmgqGAuE1OMYWtNzc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0W0wRtoq_1708422556;
Received: from 30.178.67.228(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W0wRtoq_1708422556)
          by smtp.aliyun-inc.com;
          Tue, 20 Feb 2024 17:49:18 +0800
Message-ID: <335d1e82-8e70-475d-a4d5-12dbbd7ca660@linux.alibaba.com>
Date: Tue, 20 Feb 2024 17:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv8 2/2] watchdog/softlockup: report the most frequent
 interrupts
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 pmladek@suse.com, akpm@linux-foundation.org, kernelfans@gmail.com,
 liusong@linux.alibaba.com, deller@gmx.de, npiggin@gmail.com,
 jan.kiszka@siemens.com, kbingham@kernel.org
References: <20240219161920.15752-1-yaoma@linux.alibaba.com>
 <20240219161920.15752-3-yaoma@linux.alibaba.com> <87le7fiiku.ffs@tglx>
From: Bitao Hu <yaoma@linux.alibaba.com>
In-Reply-To: <87le7fiiku.ffs@tglx>
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024/2/20 17:35, Thomas Gleixner wrote:
> On Tue, Feb 20 2024 at 00:19, Bitao Hu wrote:
>>   arch/mips/dec/setup.c                |   2 +-
>>   arch/parisc/kernel/smp.c             |   2 +-
>>   arch/powerpc/kvm/book3s_hv_rm_xics.c |   2 +-
>>   include/linux/irqdesc.h              |   9 ++-
>>   include/linux/kernel_stat.h          |   4 +
>>   kernel/irq/internals.h               |   2 +-
>>   kernel/irq/irqdesc.c                 |  34 ++++++--
>>   kernel/irq/proc.c                    |   9 +--
> 
> This really wants to be split into two patches. Interrupt infrastructure
> first and then the actual usage site in the watchdog code.
> 
Okay, I will split it into two patches.
