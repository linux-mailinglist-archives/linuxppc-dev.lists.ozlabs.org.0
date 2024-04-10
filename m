Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F389EB30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 08:45:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Asj7+RZD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDtdC252kz3dXC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 16:45:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Asj7+RZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDtcT1DZzz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 16:45:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712731506; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ebzbpFm8mKtEwX879U96DPZbzdY2iwe+NayJYElOkPM=;
	b=Asj7+RZD2qJ3sk6kwrOGu/K8WACsgX4zQ/QnqQtLILH+U2iD9p19DDk+0mOnW/oklBThk5AI4z1MOorrcyXMNXUw7GLF6c9SN5gkXoJD0tFDaHt4nfwWIlWqU4joGLO/HjZxwvLcQJLpndBh9KPxU5llzB+d7hRcqatQjbraZF8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W4GtVHI_1712731503;
Received: from 30.178.67.212(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W4GtVHI_1712731503)
          by smtp.aliyun-inc.com;
          Wed, 10 Apr 2024 14:45:04 +0800
Message-ID: <f3c7ef07-8fad-4ef6-9095-16e4bd734477@linux.alibaba.com>
Date: Wed, 10 Apr 2024 14:45:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv12 1/4] genirq: Provide a snapshot mechanism for interrupt
 statistics
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-2-yaoma@linux.alibaba.com> <87frvu7t85.ffs@tglx>
Content-Language: en-US
From: Bitao Hu <yaoma@linux.alibaba.com>
In-Reply-To: <87frvu7t85.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2024/4/9 17:58, Thomas Gleixner wrote:
> 
> This does not apply anymore.
OK, I will update this patch based on the latest kernel code.
> 
> Also can you please split this apart to convert kstat_irqs to a struct
> with just the count in it and then add the snapshot mechanics on top.
> 
OK, I will split this patch into two. The changelog for the first patch
will be as follows.

genirq: Convert kstat_irqs to a struct

The irq_desc::kstat_irqs member is a per-CPU variable of type int, and
it is only capable of counting. The snapshot mechanism for interrupt
statistics will be added soon, which requires an additional variable to
store snapshot. To facilitate expansion, convert kstat_irqs here to
a struct containing only the count.

By the way, what do you think of my reason for using printk() instead of
pr_crit()? Should I change this part of the code in v13?

Besides, are there any other issues with this set of patches? I hope we
can resolve all points of contention in v13.

Best Regards,

	Bitao Hu
