Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACA7095FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 13:08:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN3xZ1mStz3fPv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 21:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN3x42RSbz3fBg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 21:08:21 +1000 (AEST)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id CF7CAE000B;
	Fri, 19 May 2023 11:08:12 +0000 (UTC)
Message-ID: <6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr>
Date: Fri, 19 May 2023 13:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <87wn1h5nne.fsf@igel.home>
 <4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr> <87ttwi91g0.fsf@igel.home>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87ttwi91g0.fsf@igel.home>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/11/23 20:18, Andreas Schwab wrote:
> On Mai 09 2023, Alexandre Ghiti wrote:
>
>> On 5/9/23 21:07, Andreas Schwab wrote:
>>> That does not work with UEFI booting:
>>>
>>> Loading Linux 6.4.0-rc1-1.g668187d-default ...
>>> Loading initial ramdisk ...
>>> Unhandled exception: Instruction access fault
>>> EPC: ffffffff80016d56 RA: 000000008020334e TVAL: 0000007f80016d56
>>> EPC: ffffffff002d1d56 RA: 00000000004be34e reloc adjusted
>>> Unhandled exception: Load access fault
>>> EPC: 00000000fff462d4 RA: 00000000fff462d0 TVAL: ffffffff80016d56
>>> EPC: 00000000802012d4 RA: 00000000802012d0 reloc adjusted
>>>
>>> Code: c825 8e0d 05b3 40b4 d0ef 0636 7493 ffe4 (d783 0004)
>>> UEFI image [0x00000000fe65e000:0x00000000fe6e3fff] '/efi\boot\bootriscv64.efi'
>>> UEFI image [0x00000000daa82000:0x00000000dcc2afff]
>>>
>> I need more details please, as I have a UEFI bootflow and it works great
>> (KASLR is based on a relocatable kernel and works fine in UEFI too).
> It also crashes without UEFI.  Disabling CONFIG_RELOCATABLE fixes that.
> This was tested on the HiFive Unmatched board.
> The kernel image I tested is available from
> <https://download.opensuse.org/repositories/Kernel:/HEAD/RISCV/>.  The
> same kernel with CONFIG_RELOCATABLE disabled is available from
> <https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/kernel/standard/>.
>

I have tested the following patch successfully, can you give it a try 
while I make sure this is the only place I forgot to add the -fno-pie flag?

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fbdccc21418a..153864e4f399 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -23,6 +23,10 @@ ifdef CONFIG_FTRACE
  CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
  CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
  endif
+ifdef CONFIG_RELOCATABLE
+CFLAGS_alternative.o += -fno-pie
+CFLAGS_cpufeature.o += -fno-pie
+endif
  ifdef CONFIG_KASAN
  KASAN_SANITIZE_alternative.o := n
  KASAN_SANITIZE_cpufeature.o := n

Thanks

Alex

