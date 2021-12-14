Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7D47400F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 11:04:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCv9M2zkqz3cPt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 21:04:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=loongson.cn;
 envelope-from=yangtiezhu@loongson.cn; receiver=<UNKNOWN>)
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JCv8s2KCSz2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 21:03:37 +1100 (AEDT)
Received: from [10.130.0.135] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_Nzfa7hhAZYAAA--.3224S3;
 Tue, 14 Dec 2021 18:03:13 +0800 (CST)
Subject: Re: [PATCH v2 0/2] kdump: simplify code
To: Matthew Wilcox <willy@infradead.org>,
 David Laight <David.Laight@aculab.com>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
 <YbXhVxRJfjvKw++W@casper.infradead.org>
 <b7a75ae9253445af81ff2fedd5268af4@AcuMS.aculab.com>
 <YbdcKK3Cq6ITTg/l@casper.infradead.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <36440c0f-8b8a-c401-684f-6f54ce9c061e@loongson.cn>
Date: Tue, 14 Dec 2021 18:03:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <YbdcKK3Cq6ITTg/l@casper.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_Nzfa7hhAZYAAA--.3224S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4fCF1DZFWDCw13KF18AFb_yoW8Wr18pr
 WYya42yrs7X3s8Gw4Iyr4fJ3yFqw42yFWrW3Z5Xw15Ar90qFnFvr1jyr1S9a4UWrn7Wa1x
 AFyYqr9I93WDA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWr
 Zr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JU6c_fUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Baoquan He <bhe@redhat.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vivek Goyal <vgoyal@redhat.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/13/2021 10:43 PM, Matthew Wilcox wrote:
> On Mon, Dec 13, 2021 at 08:30:33AM +0000, David Laight wrote:
>> From: Matthew Wilcox
>>> Sent: 12 December 2021 11:48
>>>
>>> On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
>>>> From: Tiezhu Yang
>>>>> Sent: 11 December 2021 03:33
>>>>>
>>>>> v2:
>>>>>   -- add copy_to_user_or_kernel() in lib/usercopy.c
>>>>>   -- define userbuf as bool type
>>>>
>>>> Instead of having a flag to indicate whether the buffer is user or kernel,
>>>> would it be better to have two separate buffer pointers.
>>>> One for a user space buffer, the other for a kernel space buffer.
>>>> Exactly one of the buffers should always be NULL.
>>>
>>> No.  You should be using an iov_iter instead.  See
>>> https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
>>> for a start on this.
>>
>> iov_iter gets horribly expensive...
>
> Oh, right.  Reading the kcore is a high-performance path, my mistake.
>

Hi,

Thank you for your discussions.

The intention of this patchset is to simplify the related code with no
functional changes and no side effects.

At this moment, if you are OK, I will send v3 used with inline function
copy_to_user_or_kernel() to keep it simple, maybe other more changes can
be done in the future if no any side effect.

The v3 will contain the following three patches to make the changes
more clear:

kdump: vmcore: remove copy_to() and add copy_to_user_or_kernel()
kdump: crashdump: use copy_to_user_or_kernel() to simplify code
kdump: vmcore: crashdump: make variable type of userbuf as bool

