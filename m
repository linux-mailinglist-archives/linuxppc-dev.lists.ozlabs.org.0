Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737C4D62BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 15:01:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFSKF2vJ6z30Km
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 01:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codethink.co.uk (client-ip=78.40.148.184;
 helo=imap2.colo.codethink.co.uk; envelope-from=ben.dooks@codethink.co.uk;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1371 seconds by postgrey-1.36 at boromir;
 Sat, 12 Mar 2022 01:01:13 AEDT
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFSJn3hzxz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 01:01:11 +1100 (AEDT)
Received: from [167.98.27.226] (helo=[172.16.103.108])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nSfSn-0000Di-Kl; Fri, 11 Mar 2022 13:37:49 +0000
Message-ID: <509d2b62-7d52-bf5c-7a6c-213a740a5c00@codethink.co.uk>
Date: Fri, 11 Mar 2022 13:37:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Content-Language: en-GB
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang
 <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
 <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/03/2022 02:38, Guo Ren wrote:
> Hi Arnd,
> 
> On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> If the current task is in COMPAT mode, set SR_UXL_32 in status for
>> returning userspace. We need CONFIG _COMPAT to prevent compiling
>> errors with rv32 defconfig.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>   arch/riscv/kernel/process.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 03ac3aa611f5..54787ca9806a 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>>          }
>>          regs->epc = pc;
>>          regs->sp = sp;
>> +
> FIxup:
> 
> + #ifdef CONFIG_COMPAT
>> +       if (is_compat_task())
>> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
>> +       else
>> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
> + #endif
> 
> We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
> set SR_UXL at all. SR_UXL is BIT[32, 33].

would an if (IS_ENABLED(CONFIG_COMPAT)) { } around the lot be better
than an #ifdef here?

>>   }
>>
>>   void flush_thread(void)
>> --
>> 2.25.1
>>
> 
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
