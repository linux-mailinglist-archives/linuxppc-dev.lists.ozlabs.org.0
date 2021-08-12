Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06E3EA1AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 11:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Glgxc16wkz3bbF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 19:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlgxB5zswz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 19:14:17 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Uim5XHy_1628759649; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Uim5XHy_1628759649) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 Aug 2021 17:14:09 +0800
Subject: Re: [PATCH v4 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Arnd Bergmann <arnd@arndb.de>
References: <20210806030138.123479-1-xianting.tian@linux.alibaba.com>
 <20210806030138.123479-2-xianting.tian@linux.alibaba.com>
 <CAK8P3a2=BmVv0tvUKaca+LYxuAussAJtAJW9O3fRN2CbV2-9aw@mail.gmail.com>
 <f18d017b-d6f7-cf87-8859-8d6b50c7c289@linux.alibaba.com>
 <CAK8P3a2ykLvJkhX+wDAOHdyLHjPFAfhOxi5BNM9kTKv_8F7VQg@mail.gmail.com>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <a5bb4fbb-a9c4-9b9a-3cfe-09d3b99c7915@linux.alibaba.com>
Date: Thu, 12 Aug 2021 17:14:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2ykLvJkhX+wDAOHdyLHjPFAfhOxi5BNM9kTKv_8F7VQg@mail.gmail.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Amit Shah <amit@kernel.org>,
 gregkh <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Omar Sandoval <osandov@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/12 下午4:54, Arnd Bergmann 写道:
> On Thu, Aug 12, 2021 at 10:08 AM Xianting TIan
> <xianting.tian@linux.alibaba.com> wrote:
>> 在 2021/8/6 下午10:51, Arnd Bergmann 写道:
>>> On Fri, Aug 6, 2021 at 5:01 AM Xianting Tian
>>>> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
>>> I think you need a higher alignment for DMA buffers, instead of sizeof(long),
>>> I would suggest ARCH_DMA_MINALIGN.
>> As some ARCH(eg, x86, riscv) doesn't define ARCH_DMA_MINALIG, so i think
>> it 's better remain the code unchanged,
>>
>> I will send v5 patch soon.
> I think you could just use "L1_CACHE_BYTES" as the alignment in this case.
> This will make the structure slightly larger for architectures that do not have
> alignment constraints on DMA buffers, but using a smaller alignment is
> clearly wrong. Another option would be to use ARCH_KMALLOC_MINALIGN.
yes, I unstand you, the align size must  L1_CACHE_BYTES at least.
>
> Note that there is a patch to add ARCH_DMA_MINALIGN to riscv already,
yes, I summited this patch, it is discussing, seems they don't want to 
apply it.
> as some implementations do not have coherent DMA. I had failed to
> realized though that on x86 you do not get an ARCH_DMA_MINALIGN
> definition.
I didn't find the definition in arch/x86/include/asm/cache.h and other 
place, x86 is dma coherent, it may doesn't need it.
>
>         Arnd
