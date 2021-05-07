Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C083769B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 19:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcJ2G6jPqz309V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 03:52:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcJ1r6RQnz2yY3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 03:52:30 +1000 (AEST)
Received: from [192.168.0.3] (ip5f5aeecf.dynamic.kabel-deutschland.de
 [95.90.238.207])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id B24FC61E5FE33;
 Fri,  7 May 2021 19:52:25 +0200 (CEST)
Subject: Re: UBSAN: array-index-out-of-bounds in
 arch/powerpc/kernel/legacy_serial.c:359:56
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <9f1e8f9a-9ccd-fc96-04cc-30137dbe9011@molgen.mpg.de>
 <a7467e08-1e53-e974-d14b-13e6ff558dae@molgen.mpg.de>
 <3b1febc1-3635-fb5f-1ff3-6f9f0c8feb12@csgroup.eu>
 <64a8b6fd-5fee-c0bf-7f8f-946dbe6b7973@molgen.mpg.de>
 <2fee0345-e8e1-b25f-b8be-4ce38e9c6939@csgroup.eu>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <c9e9f663-3c3b-087a-a735-750403351163@molgen.mpg.de>
Date: Fri, 7 May 2021 19:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2fee0345-e8e1-b25f-b8be-4ce38e9c6939@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Christophe,


Am 07.05.21 um 10:59 schrieb Christophe Leroy:

> Le 07/05/2021 à 10:42, Paul Menzel a écrit :
>> [+Andrey]

>> Am 07.05.21 um 10:31 schrieb Christophe Leroy:
>>
>>> Le 06/05/2021 à 21:32, Paul Menzel a écrit :
>>>> [corrected subject]
>>>>
>>>> Am 06.05.21 um 21:31 schrieb Paul Menzel:
>>
>>>>> On the POWER8 system IBM S822LC, Linux 5.13+, built with USSAN, 
>>>>> logs the warning below.
>>>>>
>>>>> ```
>>>>> [    0.030091] ================================================================================
>>>>> [    0.030295] UBSAN: array-index-out-of-bounds in arch/powerpc/kernel/legacy_serial.c:359:56
>>>>> [    0.030325] index -1 is out of range for type 'legacy_serial_info [8]'
>>>>> [    0.030350] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
>>>>> [    0.030360] Call Trace:
>>>>> [    0.030363] [c000000024f1bad0] [c0000000009f4330] dump_stack+0xc4/0x114 (unreliable)
>>>>> [    0.030386] [c000000024f1bb20] [c0000000009efed0] ubsan_epilogue+0x18/0x78
>>>>> [    0.030400] [c000000024f1bb80] [c0000000009efafc] __ubsan_handle_out_of_bounds+0xac/0xd0
>>>>> [    0.030414] [c000000024f1bc20] [c000000001711588] ioremap_legacy_serial_console+0x54/0x144
>>>>> [    0.030430] [c000000024f1bc70] [c0000000000123c0] do_one_initcall+0x60/0x2c0
>>>>> [    0.030444] [c000000024f1bd40] [c000000001704bc4] kernel_init_freeable+0x19c/0x25c
>>>>> [    0.030458] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
>>>>> [    0.030471] [c000000024f1be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
>>>>> [    0.030484] ================================================================================
>>>>> [    0.030641] ================================================================================
>>>>> [    0.030668] UBSAN: array-index-out-of-bounds in arch/powerpc/kernel/legacy_serial.c:360:58
>>>>> [    0.030697] index -1 is out of range for type 'plat_serial8250_port [9]'
>>>>> [    0.030721] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
>>>>> [    0.030730] Call Trace:
>>>>> [    0.030733] [c000000024f1bad0] [c0000000009f4330] dump_stack+0xc4/0x114 (unreliable)
>>>>> [    0.030749] [c000000024f1bb20] [c0000000009efed0] ubsan_epilogue+0x18/0x78
>>>>> [    0.030762] [c000000024f1bb80] [c0000000009efafc] __ubsan_handle_out_of_bounds+0xac/0xd0
>>>>> [    0.030775] [c000000024f1bc20] [c0000000017115a0] ioremap_legacy_serial_console+0x6c/0x144
>>>>> [    0.030790] [c000000024f1bc70] [c0000000000123c0] do_one_initcall+0x60/0x2c0
>>>>> [    0.030802] [c000000024f1bd40] [c000000001704bc4] kernel_init_freeable+0x19c/0x25c
>>>>> [    0.030816] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
>>>>> [    0.030829] [c000000024f1be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
>>>>> [    0.030842] ================================================================================
>>>>> ```
>>>
>>> The function is as follows, so when legacy_serial_console == -1 as in 
>>> your situation, the pointers are just not used.
>>>
>>> static int __init ioremap_legacy_serial_console(void)
>>> {
>>>      struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
>>>      struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
>>>      void __iomem *vaddr;
>>>
>>>      if (legacy_serial_console < 0)
>>>          return 0;
>>>
>>> ...
>>> }
>>>
>>> When I look into the generated code (UBSAN not selected), we see the 
>>> verification and the bail-out is done prior to any calculation based 
>>> on legacy_serial_console.
>>>
>>> 00000000 <ioremap_legacy_serial_console>:
>>>    0:    94 21 ff e0     stwu    r1,-32(r1)
>>>    4:    3d 20 00 00     lis     r9,0
>>>              6: R_PPC_ADDR16_HA    .data
>>>    8:    7c 08 02 a6     mflr    r0
>>>    c:    bf 81 00 10     stmw    r28,16(r1)
>>>   10:    3b 80 00 00     li      r28,0
>>>   14:    83 a9 00 00     lwz     r29,0(r9)
>>>              16: R_PPC_ADDR16_LO    .data
>>>   18:    90 01 00 24     stw     r0,36(r1)
>>>   1c:    2c 1d 00 00     cmpwi   r29,0
>>>   20:    41 80 00 80     blt     a0 <ioremap_legacy_serial_console+0xa0>
>>>
>>> So, is it normal that UBSAN reports an error here ?
>>
>> If it’s useful, I could disassemble the code here. But please tell me 
>> how.
>>
>> Sorry, I do not know. I just selected the option, and saw the error. 
>> Maybe Andrey has an idea.
> 
> No need for you to disassemble, I just wanted to show that without UBSAN 
> there is no problem with the index as it is used only after boundary 
> checking. (But if you want to do so, if is just an 'objdump -dr 
> legacy_serial.o')

Thank you for the hint.

> Now, with UBSAN, I see that UBSAN does the verification of the index 
> earlier than expected. So what to do here, we can modify the code, but 
> that modification would just be to make UBSAN happy as there is no 
> problem in itself.

In #gcc@irc.freenode.net I was told by zid (they weren’t so happy with 
the wording), but maybe you understand it:

> It's not legal C to generate pointers to things other than 0,
> objects, or 1 past the end of an object, not just dereference them,
> so technically that's not legal per the C spec.
> 
> In practice it won't matter until it's dereferenced of course unless
> you're doing something weird, let's say.. instrumenting the code

Kind regards,

Paul
