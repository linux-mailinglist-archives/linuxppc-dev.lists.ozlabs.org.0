Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3EB3EB9C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 18:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmT3X2B1gz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 02:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmT354tDYz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 02:07:10 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R441e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0UiuMApe_1628870823; 
Received: from 30.212.146.149(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UiuMApe_1628870823) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 14 Aug 2021 00:07:05 +0800
Subject: Re: [PATCH v6 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210812094532.145497-2-xianting.tian@linux.alibaba.com>
 <202108122040.lBf24DNp-lkp@intel.com>
 <0c808001-7643-fdcf-66ba-738654ec0c21@kernel.org>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <9f6b0b31-b2fd-0706-b40f-d7ffc5c48737@linux.alibaba.com>
Date: Sat, 14 Aug 2021 00:07:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0c808001-7643-fdcf-66ba-738654ec0c21@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/13 下午1:53, Jiri Slaby 写道:
> Hi,
>
> On 12. 08. 21, 14:26, kernel test robot wrote:
>>>> drivers/tty/hvc/hvc_console.c:190:26: warning: variable 'hp' is 
>>>> uninitialized when used here [-Wuninitialized]
>>             spin_unlock_irqrestore(&hp->c_lock, flags);
>>                                     ^~
>>     drivers/tty/hvc/hvc_console.c:149:23: note: initialize the 
>> variable 'hp' to silence this warning
>>             struct hvc_struct *hp;
>>                                  ^
>>                                   = NULL
>
> So you clearly didn't test your change as it would crash quite 
> instantly. I wonder, where do you intend to get hp from in the 
> console::print() hook?
>
> thanks,
According to analysis, this issue may can be solved just by adjust the 
alignment to L1_CACHE_BYTES:  
#define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))

Our analysis as below, the original __ALIGNED__ is sizeof(long) which is 
8 for 64bit cpu.
char c[N_OUTBUF] __ALIGNED__; //c[16] __ALIGNED__;

For 4K page, c[16] may cross the page when alignemnt is 8.

In the case the physical address of c[16] is noncontiguous.
|------8----|..........|-----8-----|    PAGE_1
..........................|-----------16----------| c[16] 
.........................................|-----8-----|.............|-----8-----| 
PAGE_2
But when the alignment is L1_CACHE_BYTES(eg, 64), or at least 
N_OUTBUF(16), we have no dma issue as c[16] won't cross the page, the 
physical address of c[16] is contiguous.
|--------64--------|.........|--------64---------| PAGE_3

..................................|--c[16]--|

Could you help comments this?  thanks

