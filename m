Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC62235470
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 23:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJyMp6lCqzDqQx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 07:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.189.84;
 helo=sonic306-22.consmr.mail.ne1.yahoo.com; envelope-from=ecs_dn@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=FrDkf9R4; dkim-atps=neutral
Received: from sonic306-22.consmr.mail.ne1.yahoo.com
 (sonic306-22.consmr.mail.ne1.yahoo.com [66.163.189.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJyKK2NSxzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 07:41:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1596318104; bh=/k4OSGhjfShCWgin373xsALQXqhB8hhrTniSmsKptIc=;
 h=Date:From:To:Cc:In-Reply-To:Subject:References:From:Subject;
 b=FrDkf9R49959pLstaQ+O/5VJeyppmiH+m7l3vNo5a16iiGrjuvsgbI/wL3+nvOctVJ4UByHBRYKUTHz0YVuqTqiZJrGV5zQId04NSF2TFCTItheu4xOghXrRwFBa9x4K2TGFJUHfYoM64BerHIxZDIc+cVkCrhUH2ZEB81rIFzjGaQ3FstIKvqRihSm2xvAlhft5p/zTxG+A+3iSLwlrqBejxvcGaiKMsBeiV0cnRx+G8t1YuUo8IekUekS45nzaga5zFtXhOPiPT2TxIexaDfhOZYWJOwp1dYA58sar9fn6ojbXnEKvsSmgDDcNtdG5NHcxyLmMKlhqkojr4M4+Mw==
X-YMail-OSG: Z6Gndm4VM1l3Vnb9h2OOWKSp4oRA7TcS2VCAwEgyHk.fJFlFLKe1S7QOjvsEMRF
 EasJDWTjKLlQfmBIyuqSVEgmJcYVSXqSXVm1Ci.kIomWPKPgArRJObHtU0cZwUOR.kN.2dmJ0K5O
 SpO9xjOy0ksML7Yr8UTIK2msruOLfoOTQfBcVO1zQPDY7HnmUsBe0_AIM0U3LS84xCc4wgQ6TdFo
 WSG4XPBPnawLkOJYvbG2pLSdQ5jcL3ovCxQjOI16zPtGDAnKtZwJkgJ914LOCdNWK9odITQHpRvn
 LXCwClv..z1AZXMu6RF7ew7Tc9pFsdlu4MT6NVhegXvOu_RdjW.oxYEj0VipgQUULEBKJZLfnl14
 Kp13i9VqlU7nzi4dGf3r8PrOkRyjo9O8MNQoJymDZ6aoY7RccX7_ZxWvhh.134c_bgyT15_Uh5ck
 BKjcQvQTHmDjSCOObE5yVnXSETiNSl3tJwBGkiGlJMxrCuU.egbbAZZAnya6tv4LclzEN1SMxKIv
 OfEYhnM8WrzDogffw6LF8rhXrGW3WQD2RjY2PbYyvj1SSngEtlo6tDb0IhyQK0dzVGFVhVVwp2lC
 RdsHDCOzyKgul6hs3q2EgdzVU.a1i4Or1w.LFuVcym1j0XMumCn3rqWw0A79ajLrCtTnjFiTbd95
 tCIlj0YsT2VFyCdukgTo1StNw0QsvOcwocYO8P13KiCwfR0WgO3vl42k4UBvGO8YrjlQ2oGxipjL
 PpT1EBqdDJ57KclwZ0Xwa74SEbqaXqhXPDU.i8s_BHS0SG_VXgLZ3oPIezwm.LeyZDMD4J5IqpvX
 8keVo9df8yzl_gdPlLPXXqeKJdckXW_YL9O5sUqD5FxPnf9753MVRECZY8e8_Snsi4wHiSm2pPS1
 0VOlbplNAOJzwscQflYI4BjLpxr1dIjfgFo3jbGNNt0W4pWXZrG29q5mxLe6ky81rx1ZMvLJhXDA
 NlJraEl.g8t5nF3grnmE1WT0CQlxhaXqCfLqr3opPf8jfiXtKjKFIZkk6p0i9HCJnSe4w5WboCt6
 ditRW4sKIUQw5rqgC21vC0e1OplDMwGdAcaiGWLr9eYNKAn3ACIdnbyXLGq1LokU1oXqWum2oYN3
 teAkS4INQyFhXHUvafmIOyvKFhErI7SZgMiiZlIOjG82bPQ1NJiG1nQCZwtHM_L_js_H5Y0sUlIT
 4dAOVDVdao609kR7uGPqOqL2vT6NXUB8JagvwPtgD9honLSKtQ98S7Q8HJAcDXWsGhxnMxZUBvq1
 wMUmXlPnO0VQIc3gqZYBf3CljY7.y3VUJx3Kf_eKkeh_otrkIGCoDU7JrnHZYioYchnyvmm29SYa
 Q5RKD9OLVLt.tXupj4FYpVe2DWHT_m64quINCTVWg
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Sat, 1 Aug 2020 21:41:44 +0000
Received: by smtp410.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 313a0681a8c3d6433bba6ad382ce1718; 
 Sat, 01 Aug 2020 21:41:40 +0000 (UTC)
Date: Sat, 1 Aug 2020 14:41:26 -0700 (PDT)
From: thefirst ECS <ecs_dn@yahoo.com>
To: linuxppc-dev@lists.ozlabs.org
Message-ID: <3103222.25048.1596318084416.JavaMail.Dan@DanHP>
In-Reply-To: <11049609.25021.1596315320093.JavaMail.Dan@DanHP>
Subject: Scott Wood fix for SysRQ Crash over Serial Console on Linux PowerPC
 2.6.32 kernel?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
References: <3103222.25048.1596318084416.JavaMail.Dan.ref@DanHP>
X-Mailer: WebService/1.1.16271 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.7)
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
Cc: scottwood@freescale.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I've been fighting with SysRq over serial for a while now and can't win, regardless of where I call emergency_restart or __handle_sysrq('b', NULL, 0); I can't seem to get it to reboot to U-Boot but instead I get a hung/crashed system:

SysRq : Resetting
Kernel BUG at c00bbe80 [verbose debug info unavailable]
Oops: Exception in kernel mode, sig: 5 [#1]
...

The NIP is always c00bbe80. 

The strange part is that echo b > /proc/sysrq-trigger works perfectly fine and quickly soft-reboots system.

Does writing to procfs somehow FIX some issue created when sending a BREAK signal over serial console? 

Because I don't get it, I see that the same exact code is called inside drivers/char/sysrq.c ie by __handle_sysrq(key, NULL, 0); (which is executed upon write_sysrq_trigger via echo b > /proc/sysrq-trigger) as when I also manually call it via __handle_sysrq('b', NULL, 0); 

And I hard coded to 'b' when I called it myself from drivers/serial/8250.c or sysrq.c due to another issue with normal way somehow not waiting or giving the supposed "5 seconds" to enter a letter after the BREAK signal. So it was almost impossible to trigger BREAK via Ctrl-A B by gnuscreen.

I can't figure out why the same code is called but giving completely different outcomes, other than maybe sending BREAK signal over serial console changes something with some interrupts in a way that's then magically fixed/undone by userland writing to procfs /proc/sysrq-trigger?

Or maybe some sort of race condition since I'm triggering the actual "b" reboot more or less at same time as the actual "BREAK" signal? (Because otherwise with original kernel code I was only once able to trigger SysRq reboot and that crashed same way, I triggered it by pressing b very quick after Ctrl-B i think. Otherwise usually I would just get SyRq: HELP menu and the 'b' would be printed to my terminal...)

I stumbled upon an old post at:
https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg75979.html

And in there Scott Wood said he had done some fix for SysRq over serial console it seems for powerpc but apparently my kernel doesn't have his fix since seems our dts doesn't have "compatible = "fsl,ns16550", "ns16550";"  but only has "ns16550" and my kernel (2.6.32) config doesn't have any CONFIG_SERIAL_8250_FSL. I was wondering if anyone knew if my issue would be helped by Scott's fix and where I could find it and perhaps try to port it to our kernel.

So again, echo m or c or b etc to /proc/sysrq-trigger works fine but triggering the same __handle_sysrq('b', NULL, 0) separately, crashes/hangs system and requires a hard reboot, power-cycle regardless of where I call it from after detecting a "BREAK" signal over serial console.

Below is an example of a successful reboot via echo b > /proc/sysrq-trigger 

SysRq : Resetting
BUG: sleeping function called from invalid context at mm/slub.c:1719
pcnt: 1 0 in_atomic(): 1, irqs_disabled(): 1, pid: 2471, name: bash
Call Trace:
[ec8d7d10] [c0007ec0] show_stack+0x54/0x16c (unreliable)
[ec8d7d40] [c0037c48] __might_sleep+0xe8/0x10c
[ec8d7d50] [c00c6e00] kmem_cache_alloc+0xa4/0xe0
[ec8d7d80] [c00bbecc] __get_vm_area_node+0x84/0x10c
[ec8d7db0] [c00148e8] __ioremap_caller+0x114/0x124
[ec8d7de0] [c039ab68] ourcustom_spi_init+0x24/0xa0
[ec8d7e20] [c039af3c] ourcustom_spi_reset+0x14/0xac
[ec8d7e40] [c0018f90] fsl_rstcr_restart+0x14/0x18
[ec8d7e50] [c0010114] machine_restart+0x30/0x4c
[ec8d7e60] [c005cd6c] emergency_restart+0x30/0x6c
[ec8d7e70] [c03211dc] sysrq_handle_reboot+0x14/0x24
[ec8d7e80] [c0321418] __handle_sysrq+0xac/0x15c
[ec8d7eb0] [c032153c] write_sysrq_trigger+0x74/0x80
[ec8d7ec0] [c0122704] proc_reg_write+0x80/0xb4
[ec8d7ef0] [c00d3b7c] vfs_write+0xb4/0x184
[ec8d7f10] [c00d3d34] sys_write+0x4c/0x90
[ec8d7f40] [c0011180] ret_from_syscall+0x0/0x3c

COMPARED to an example of when I try to trigger via sending BREAK signal (Ctrl-A b with screen):

NIP [c00bbe80] __get_vm_area_node+0x38/0x10c
LR [c00148e8] __ioremap_caller+0x114/0x124
Call Trace:
[c0667c60] [c004eabc] irq_exit+0x68/0xa4 (unreliable)
[c0667c90] [c00148e8] __ioremap_caller+0x114/0x124
[c0667cc0] [c039abdc] ourcustom_spi_init+0x24/0xa0
[c0667d00] [c039afb0] ourcustom_spi_reset+0x14/0xac
[c0667d20] [c0018f90] fsl_rstcr_restart+0x14/0x18
[c0667d30] [c0010114] machine_restart+0x30/0x4c
[c0667d40] [c005cd6c] emergency_restart+0x30/0x6c
[c0667d50] [c03211dc] sysrq_handle_reboot+0x14/0x24
[c0667d60] [c032143c] __handle_sysrq+0xd0/0x1d0
[c0667d90] [c03286e4] receive_chars+0x298/0x3e4
[c0667de0] [c0329650] serial8250_handle_port+0x84/0xdc
[c0667e00] [c0329958] serial8250_interrupt+0x90/0x128
[c0667e30] [c008e6fc] handle_irq_action+0x8c/0xa0
[c0667e50] [c008e774] handle_IRQ_event+0x64/0x13c
[c0667e80] [c00910e4] handle_fasteoi_irq+0x94/0x17c
[c0667ea0] [c00051b4] do_IRQ+0xc4/0xec
[c0667ec0] [c00118ec] ret_from_except+0x0/0x18
[c0667f80] [c0009310] cpu_idle+0x94/0x184
[c0667fb0] [c00023cc] rest_init+0xa0/0xb4
[c0667fc0] [c06089ec] start_kernel+0x33c/0x350
[c0667ff0] [c00003f4] skpinv+0x30c/0x348
Instruction dump:
bee1000c 542b0024 90010034 7c9f2378 7cbe2b78 7cd93378 800b000c 7cfa3b78 
7d1b4378 7d3c4b78 7d585378 5400016e <0f000000> 70a00001 41820018 7c600034 
Kernel panic - not syncing: Fatal exception in interrupt
Rebooting in 5 seconds..
------------[ cut here ]------------
Kernel BUG at c00bbe80 [verbose debug info unavailable]
Oops: Exception in kernel mode, sig: 5 [#2]
...

Thanks,
     -Dan
