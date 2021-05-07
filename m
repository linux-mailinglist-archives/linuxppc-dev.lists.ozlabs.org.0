Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6437620C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 10:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc3bF5xkQz307l
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 18:32:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc3Zt2nn8z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 18:31:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fc3Zl4xtYz9sZZ;
 Fri,  7 May 2021 10:31:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC7ZO_ZzT3dM; Fri,  7 May 2021 10:31:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fc3Zl3y5Kz9sSh;
 Fri,  7 May 2021 10:31:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68B428B81F;
 Fri,  7 May 2021 10:31:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z5D5y6-Rjueu; Fri,  7 May 2021 10:31:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC9298B81C;
 Fri,  7 May 2021 10:31:42 +0200 (CEST)
Subject: Re: UBSAN: array-index-out-of-bounds in
 arch/powerpc/kernel/legacy_serial.c:359:56
To: Paul Menzel <pmenzel@molgen.mpg.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <9f1e8f9a-9ccd-fc96-04cc-30137dbe9011@molgen.mpg.de>
 <a7467e08-1e53-e974-d14b-13e6ff558dae@molgen.mpg.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3b1febc1-3635-fb5f-1ff3-6f9f0c8feb12@csgroup.eu>
Date: Fri, 7 May 2021 10:31:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a7467e08-1e53-e974-d14b-13e6ff558dae@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul,

Le 06/05/2021 à 21:32, Paul Menzel a écrit :
> [corrected subject]
> 
> Am 06.05.21 um 21:31 schrieb Paul Menzel:
>> Dear Linux folks,
>>
>>
>> On the POWER8 system IBM S822LC, Linux 5.13+, built with USSAN, logs the warning below.
>>
>> ```
>> [    0.030091] ================================================================================
>> [    0.030295] UBSAN: array-index-out-of-bounds in arch/powerpc/kernel/legacy_serial.c:359:56
>> [    0.030325] index -1 is out of range for type 'legacy_serial_info [8]'
>> [    0.030350] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
>> [    0.030360] Call Trace:
>> [    0.030363] [c000000024f1bad0] [c0000000009f4330] dump_stack+0xc4/0x114 (unreliable)
>> [    0.030386] [c000000024f1bb20] [c0000000009efed0] ubsan_epilogue+0x18/0x78
>> [    0.030400] [c000000024f1bb80] [c0000000009efafc] __ubsan_handle_out_of_bounds+0xac/0xd0
>> [    0.030414] [c000000024f1bc20] [c000000001711588] ioremap_legacy_serial_console+0x54/0x144
>> [    0.030430] [c000000024f1bc70] [c0000000000123c0] do_one_initcall+0x60/0x2c0
>> [    0.030444] [c000000024f1bd40] [c000000001704bc4] kernel_init_freeable+0x19c/0x25c
>> [    0.030458] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
>> [    0.030471] [c000000024f1be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
>> [    0.030484] ================================================================================
>> [    0.030641] ================================================================================
>> [    0.030668] UBSAN: array-index-out-of-bounds in arch/powerpc/kernel/legacy_serial.c:360:58
>> [    0.030697] index -1 is out of range for type 'plat_serial8250_port [9]'
>> [    0.030721] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0+ #2
>> [    0.030730] Call Trace:
>> [    0.030733] [c000000024f1bad0] [c0000000009f4330] dump_stack+0xc4/0x114 (unreliable)
>> [    0.030749] [c000000024f1bb20] [c0000000009efed0] ubsan_epilogue+0x18/0x78
>> [    0.030762] [c000000024f1bb80] [c0000000009efafc] __ubsan_handle_out_of_bounds+0xac/0xd0
>> [    0.030775] [c000000024f1bc20] [c0000000017115a0] ioremap_legacy_serial_console+0x6c/0x144
>> [    0.030790] [c000000024f1bc70] [c0000000000123c0] do_one_initcall+0x60/0x2c0
>> [    0.030802] [c000000024f1bd40] [c000000001704bc4] kernel_init_freeable+0x19c/0x25c
>> [    0.030816] [c000000024f1bda0] [c000000000012a2c] kernel_init+0x2c/0x180
>> [    0.030829] [c000000024f1be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
>> [    0.030842] ================================================================================ ```
>>
>>

The function is as follows, so when legacy_serial_console == -1 as in your situation, the pointers 
are just not used.

static int __init ioremap_legacy_serial_console(void)
{
	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
	void __iomem *vaddr;

	if (legacy_serial_console < 0)
		return 0;

...
}

When I look into the generated code (UBSAN not selected), we see the verification and the bail-out 
is done prior to any calculation based on legacy_serial_console.

00000000 <ioremap_legacy_serial_console>:
    0:	94 21 ff e0 	stwu    r1,-32(r1)
    4:	3d 20 00 00 	lis     r9,0
			6: R_PPC_ADDR16_HA	.data
    8:	7c 08 02 a6 	mflr    r0
    c:	bf 81 00 10 	stmw    r28,16(r1)
   10:	3b 80 00 00 	li      r28,0
   14:	83 a9 00 00 	lwz     r29,0(r9)
			16: R_PPC_ADDR16_LO	.data
   18:	90 01 00 24 	stw     r0,36(r1)
   1c:	2c 1d 00 00 	cmpwi   r29,0
   20:	41 80 00 80 	blt     a0 <ioremap_legacy_serial_console+0xa0>


So, is it normal that UBSAN reports an error here ?

Thanks
Christophe
