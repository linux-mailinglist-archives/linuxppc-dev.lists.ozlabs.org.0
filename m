Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E0435D76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 10:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZhF46kJKz3cDX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZhDb5W6Xz2yPD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 19:56:45 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Ut7VcNC_1634806588; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ut7VcNC_1634806588) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 21 Oct 2021 16:56:29 +0800
Subject: Re: [PATCH v11 0/3] make hvc pass dma capable memory to its backend
To: Greg KH <gregkh@linuxfoundation.org>
References: <20211015024658.1353987-1-xianting.tian@linux.alibaba.com>
 <YXEmW071C+GlmXqw@kroah.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <16ffdf1c-7ea9-7466-fcc5-7e6b09ca5a28@linux.alibaba.com>
Date: Thu, 21 Oct 2021 16:56:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YXEmW071C+GlmXqw@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am very glad to get this reply:)

Thank you and other experts' kindly help and guide, which improved me a lot.

在 2021/10/21 下午4:35, Greg KH 写道:
> On Fri, Oct 15, 2021 at 10:46:55AM +0800, Xianting Tian wrote:
>> Dear all,
>>
>> This patch series make hvc framework pass DMA capable memory to
>> put_chars() of hvc backend(eg, virtio-console), and revert commit
>> c4baad5029 ("virtio-console: avoid DMA from stack”)
> Thanks for sticking with this, looks much better now, all now queued up.
>
> greg k-h
