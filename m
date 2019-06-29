Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6BA5AAE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 14:27:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bXvY6zCszDqv3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 22:27:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bXsM1zx2zDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 22:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45bXsF2lhBz9s3C;
 Sat, 29 Jun 2019 22:25:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s/exception: Fix machine check early corrupting
 AMR
In-Reply-To: <20190621225554.1913-1-npiggin@gmail.com>
References: <20190621225554.1913-1-npiggin@gmail.com>
Date: Sat, 29 Jun 2019 22:25:18 +1000
Message-ID: <874l48k28h.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The early machine check runs in real mode, so locking is unnecessary.
> Worse, the windup does not restore AMR, so this can result in a false
> KUAP fault after a recoverable machine check hits inside a user copy
> operation.
>
> Fix this similarly to HMI by just avoiding the kuap lock in the
> early machine check handler (it will be set by the late handler that
> runs in virtual mode if that runs). If the virtual mode handler is
> reached, it will lock and restore the AMR.

For the archives, this is how I tested this.

Build with KUAP enabled, disassemble load_elf_binary(), in there is a
call to __copy_tofrom_user(), preceded by a write to AMR, eg:

c00000000045eec8:	a6 03 3d 7d 	mtspr   29,r9
c00000000045eecc:	2c 01 00 4c 	isync
c00000000045eed0:	78 93 44 7e 	mr      r4,r18
c00000000045eed4:	78 e3 83 7f 	mr      r3,r28
c00000000045eed8:	b1 c1 c3 4b 	bl      c00000000009b088 <__copy_tofrom_user+0x8>


Boot mambo using skiboot.tcl, break into the mambo shell. Add a
breakpoint at the branch to __copy_tofrom_user():

  systemsim % b 0xc00000000045eed8
  breakpoint set at [0:0:0]: 0xc00000000045eed8 (0xC00000000045EED8) Enc:0x00000000 : INVALID

Continue, run `ls` in the system shell and it should break at your breakpoint:

  systemsim % c
  4439260000000: [0:0]: (PC:0x00007FFFB43B2F00) :      2.1 Mega-Inst/Sec :      2.1 Mega-Cycles/Sec [1 Zaps  0 PA-Zaps] *ON*  [0:0] pri=4 extra=0
  4440009381609: (7208208132): # ls
  [0:0:0]: 0xC00000000045EED8 (0x000000000045EED8) Enc:0xB1C1C34B : bl      $-0x3C3E50
  INFO: 4440936223969: (8135050536): ** Execution stopped: user (tcl),  **
  4440936223969: ** finished running 8135050536 instructions **

Print the AMR, it has been cleared:

  systemsim % p amr
  0x0000000000000000

Then inject a machine check exception, and continue:
  systemsim % exc_mce
  systemsim % c
  4440936231861: (8135058428): [ 8673.510176] Disabling lock debugging due to kernel taint
  4440936246871: (8135073438): [ 8673.510205] MCE: CPU0: machine check (Warning) Host TLB Multihit [Recovered]
  4440936266680: (8135093247): [ 8673.510244] MCE: CPU0: NIP: [c00000000045eed8] load_elf_binary+0xef8/0x1970
  4440936282657: (8135109224): [ 8673.510275] MCE: CPU0: Probable Software error (some chance of hardware cause)
  [0:0:0]: 0xC00000000045EED8 (0x000000000045EED8) Enc:0xB1C1C34B : bl      $-0x3C3E50
  INFO: 4440936296116: (8135122683): ** Execution stopped: user (tcl),  **
  4440936296116: ** finished running 8135122683 instructions **

Now we're back at our breakpoint. Continue again and we should get an
oops due to a bad AMR fault:

  systemsim % c
  4440936301692: (8135128259): [ 8673.510312] ------------[ cut here ]------------
  4440936321016: (8135147583): [ 8673.510336] Bug: Write fault blocked by AMR!
  4440936331347: (8135157914): [ 8673.510350] WARNING: CPU: 0 PID: 95 at arch/powerpc/include/asm/book3s/64/kup-radix.h:102 __do_page_fault+0x604/0xe60
  4440936352510: (8135179077): [ 8673.510410] Modules linked in:
  4440936365222: (8135191789): [ 8673.510436] CPU: 0 PID: 95 Comm: ls Tainted: G   M              5.2.0-rc2-gcc-8.2.0 #273
  4440936383775: (8135210342): [ 8673.510473] NIP:  c0000000000716b4 LR: c0000000000716b0 CTR: c000000000ca88b0
  4440936401995: (8135228562): [ 8673.510508] REGS: c0000000ec883530 TRAP: 0700   Tainted: G   M               (5.2.0-rc2-gcc-8.2.0)
  4440936430641: (8135257208): [ 8673.510545] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28002422  XER: 20040000
  4440936498754: (8135325321): [ 8673.510597] CFAR: c00000000011b8e4 IRQMASK: 1 
  4440936505159: (8135331726): [ 8673.510597] GPR00: c0000000000716b0 c0000000ec8837c0 c0000000015f4900 0000000000000020 
  4440936515814: (8135342381): [ 8673.510597] GPR04: c000000001824550 0000000000000000 746c756166206574 64656b636f6c6220 
  4440936528594: (8135355161): [ 8673.510597] GPR08: 00000000fed30000 c000000001130de8 0000000000000000 9000000030001033 
  4440936541374: (8135367941): [ 8673.510597] GPR12: 0000000000002000 c0000000018e0000 0000000080000000 00007fffe2e3de09 
  4440936554154: (8135380721): [ 8673.510597] GPR16: c000000000ed2c50 0000000010000000 c000000000ed2c50 00000000100d3648 
  4440936564809: (8135391376): [ 8673.510597] GPR20: c0000000f0968b00 00000000100e3648 00007fff930a0000 0000000002000000 
  4440936577589: (8135404156): [ 8673.510597] GPR24: 0000000002000000 c0000000ee830600 0000000000000301 00007fffe2e3de09 
  4440936590369: (8135416936): [ 8673.510597] GPR28: 0000000000000000 000000000a000000 0000000000000000 c0000000ec883900 
  4440936611699: (8135438266): [ 8673.510918] NIP [c0000000000716b4] __do_page_fault+0x604/0xe60
  4440936628747: (8135455314): [ 8673.510951] LR [c0000000000716b0] __do_page_fault+0x600/0xe60
  4440936642325: (8135468892): [ 8673.510978] Call Trace:
  4440936655614: (8135482181): [ 8673.511000] [c0000000ec8837c0] [c0000000000716b0] __do_page_fault+0x600/0xe60 (unreliable)
  4440936677874: (8135504441): [ 8673.511045] [c0000000ec883890] [c00000000000b0d4] handle_page_fault+0x18/0x38
  4440936700658: (8135527225): [ 8673.511091] --- interrupt: 301 at __copy_tofrom_user_power7+0x230/0x7ac
  4440936709188: (8135535755): [ 8673.511091]     LR = load_elf_binary+0xefc/0x1970
  4440936728082: (8135554649): [ 8673.511142] [c0000000ec883b90] [c00000000045ee80] load_elf_binary+0xea0/0x1970 (unreliable)
  4440936750368: (8135576935): [ 8673.511187] [c0000000ec883c90] [c0000000003d2f88] search_binary_handler.part.12+0xb8/0x2b0
  4440936772446: (8135599013): [ 8673.511230] [c0000000ec883d20] [c0000000003d3934] __do_execve_file.isra.14+0x684/0xa10
  4440936793891: (8135620458): [ 8673.511272] [c0000000ec883df0] [c0000000003d41b8] sys_execve+0x38/0x50
  4440936813829: (8135640396): [ 8673.511311] [c0000000ec883e20] [c00000000000bdf4] system_call+0x5c/0x70
  4440936828817: (8135655384): [ 8673.511340] Instruction dump:
  4440936848134: (8135674701): [ 8673.511361] 60000000 2fb70000 e93f0168 419e0620 2fa90000 409cfba4 3c82ff8e 38846b88 
  4440936874244: (8135700811): [ 8673.511412] 3c62ff8e 38636c98 480aa1d1 60000000 <0fe00000> e80100e0 3b80000b eae10088 
  4440936891327: (8135717894): [ 8673.511464] ---[ end trace 0698ac8ff1068918 ]---
  4440938377906: (8137204473): Segmentation fault


Apply the fix, retest, and no oops is seen.

cheers
