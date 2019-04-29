Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB1DCED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 09:34:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxJ16CmmzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Fh/wZaUy"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxGg6cBkzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:33:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44sxGT2jZbz9v0y2;
 Mon, 29 Apr 2019 09:33:21 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Fh/wZaUy; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bO6DokDstN8z; Mon, 29 Apr 2019 09:33:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44sxGT1jFRz9v0xk;
 Mon, 29 Apr 2019 09:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556523201; bh=7CTRK/8qInJdy1dx5534FmmJLk0unaE33S881hadV8c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fh/wZaUyyVgjfKzHzM89CGmfKYY4iBpejpgMzwPoY97QRcFLO9kHoyrfPnGncOMii
 ZFnZDq1INeQ6SWrphd4YBdWfLxo3fcrUfBzqv8vR0pdwRFkgikznLFNP8VVLN65BPL
 l1SBXDwuARHBus389CyOpHkxdr9BeNxRRTo319ok=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8D858B7C5;
 Mon, 29 Apr 2019 09:33:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x2EC6LBWASbf; Mon, 29 Apr 2019 09:33:25 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A81768B7BE;
 Mon, 29 Apr 2019 09:33:25 +0200 (CEST)
Subject: Re: BUG: crash in __tlb_remove_page_size with STRICT_KERNEL_RWX on
 BOOK3S_32
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87pnp9mknl.fsf@depni.sinp.msu.ru>
 <db886597-8867-93e6-a507-6da4963ce0bd@c-s.fr>
 <878svwn85h.fsf@depni.sinp.msu.ru>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0cb9dc35-af5b-912f-53b6-d83558ecbbcb@c-s.fr>
Date: Mon, 29 Apr 2019 07:31:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <878svwn85h.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/26/2019 02:38 PM, Serge Belyshev wrote:
> Hi!
> 
>> Could you please compile your kernel with CONFIG_PPC_PTDUMP, and
>> provide the content of:
>>
>> /sys/kernel/debug/kernel_page_tables
> 
> ---[ Start of kernel VM ]---
> 0xe1000000-0xefffffff  0x21000000       240M        rw       present           dirty  accessed

The above line is not correct, should start at the end of the area 
covered by bats, ie at 0xe0400000 with the current (uncorrect) bats


> ---[ vmalloc() Area ]---

[...]

> 
>> /sys/kernel/debug/powerpc/block_address_translation

[...]

> ---[ Data Block Address Translation ]---
> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
> 2: 0xc0c00000-0xc13fffff 0x00c00000 Kernel RW coherent
> 3: 0xc1400000-0xc23fffff 0x01400000 Kernel RW coherent
> 4: 0xc2400000-0xc43fffff 0x02400000 Kernel RW coherent
> 5: 0xc4400000-0xc83fffff 0x04400000 Kernel RW coherent
> 6: 0xc8400000-0xd03fffff 0x08400000 Kernel RW coherent
> 7: 0xd0400000-0xe03fffff 0x10400000 Kernel RW coherent

As pointed by Segher, those are not correct, bat 2 for instance should 
be 0xc0c00000-0xc0ffffff

Could you try the below changes ?

commit 5953416b8ef52107e8f04559a08a90aa5368cfcd
Author: Christophe Leroy <christophe.leroy@c-s.fr>
Date:   Mon Apr 29 07:22:08 2019 +0000

     powerpc/32s: fix BATs setting with CONFIG_STRICT_KERNEL_RWX

diff --git a/arch/powerpc/mm/ppc_mmu_32.c b/arch/powerpc/mm/ppc_mmu_32.c
index 8a21958484d8..159bdf0394e6 100644
--- a/arch/powerpc/mm/ppc_mmu_32.c
+++ b/arch/powerpc/mm/ppc_mmu_32.c
@@ -102,7 +102,7 @@ static int find_free_bat(void)
  static unsigned int block_size(unsigned long base, unsigned long top)
  {
  	unsigned int max_size = (cpu_has_feature(CPU_FTR_601) ? 8 : 256) << 20;
-	unsigned int base_shift = (fls(base) - 1) & 31;
+	unsigned int base_shift = (ffs(base) - 1) & 31;
  	unsigned int block_shift = (fls(top - base) - 1) & 31;

  	return min3(max_size, 1U << base_shift, 1U << block_shift);
@@ -158,7 +158,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned 
long base, unsigned long to

  unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
  {
-	int done;
+	unsigned long done;
  	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;

  	if (__map_without_bats) {
@@ -170,10 +170,10 @@ unsigned long __init mmu_mapin_ram(unsigned long 
base, unsigned long top)
  		return __mmu_mapin_ram(base, top);

  	done = __mmu_mapin_ram(base, border);
-	if (done != border - base)
+	if (done != border)
  		return done;

-	return done + __mmu_mapin_ram(border, top);
+	return __mmu_mapin_ram(border, top);
  }

  void mmu_mark_initmem_nx(void)


Christophe
