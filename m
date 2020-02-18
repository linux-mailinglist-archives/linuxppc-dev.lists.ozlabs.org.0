Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82922162B96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 18:09:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MS533TJbzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 04:09:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gz30Hrlj; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MS2l47NczDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 04:07:24 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id q84so20837431oic.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uLgNPVQq1MtiBLckdboiRiK//i51uKZ4EIoulFz+/Ro=;
 b=Gz30HrljWnI1dne563qj9XCUxnmnW2op3X7+PnY9aLY8HKR9X2WkvpSPsZ5Hp+ngaw
 9VgXXa17+peUzXNCoP4ysIWcjlEn26esjo8rpdS8jdBYajcNuQw828QebrjPw/GntFNk
 KDVztuIeMJS46ULSw4ykT6C34FV+4Lw4/2SljvEH341R3OhyIa/HbWRZBI1SHoB1kDpz
 LDWpNujXcZxPivwhASMfJ3w0FbYgMPNEwy1YWl7lq9087jxBbHPZUgulN9nG1h0WDE/R
 oh7035f13TwumifeUkKHO7gM1kIaNtgVRHynNHlEtz+xJVhXBkKOZI5e1YVftJvm9yVf
 5DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uLgNPVQq1MtiBLckdboiRiK//i51uKZ4EIoulFz+/Ro=;
 b=XjvTi3bNaixzfDAdUtN8nPNHswMYflSJDf0FrdUwlnqET5dvjn0euoCi/1+zfaPusP
 bM+ZIF/yDCjIWK76Nv0O8LDAdiuN6eMuAuES2NapxKjec8UGnUgL4ThfyMpgz6gaig2I
 byx1EK+C09IaCCTwI6HW68KApsYsTEH6roE8hp9U4qsz3mxeY+56tiVm2sfzwE0bYCq3
 5I4fbr8bWahQlIX3hDcyimiDJzauHvgPm0Wc0tk8iZRhppETF9yOB/C74ZUDA39Ede8b
 jjKax/lbT2Zcv2HR96vV3qpjhIaNTeqdE+7ql3AH3ZR3CEc8tLq8uDHzBd2Z0C4kZ80c
 drvA==
X-Gm-Message-State: APjAAAXYljW9hY5hGoBxvRwhdZONfvXVYHQr5wUP/dbT/xHKNxwTKzwP
 1T1GF4BTtbLTKsqT9xbd9aljGer3dHEjl9175oSqrEvR
X-Google-Smtp-Source: APXvYqylCbdkJC7BUs3b236d4spaUjbcaKK+3nHhWV3LKASOgcoEttbAoXuRAxnyK+CFJ/vJnG7uNhUl6fao9XJvP14=
X-Received: by 2002:aca:cf07:: with SMTP id f7mr1907798oig.5.1582045640209;
 Tue, 18 Feb 2020 09:07:20 -0800 (PST)
MIME-Version: 1.0
From: Radu Rendec <radu.rendec@gmail.com>
Date: Tue, 18 Feb 2020 12:07:09 -0500
Message-ID: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
Subject: MCE handler gets NIP wrong on MPC8378
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Everyone,

The saved NIP seems to be broken inside machine_check_exception() on
MPC8378, running Linux 4.9.191. The value is 0x900 most of the times,
but I have seen other weird values.

I've been able to track down the entry code to head_32.S (vector 0x200),
but I'm not sure where/how the NIP value (where the exception occurred)
is captured.

I also noticed most of the code has moved to head_32.h in newer kernel
versions, but EXCEPTION_PROLOG_1 and EXCEPTION_PROLOG_2 look pretty much
the same. I guess the same thing happens on a recent kernel, even though
I don't have an easy way to test it.

The original MCE that I see is triggered by a failed PCIe transaction,
but I was able to reproduce it by just reading from a (physically)
unmapped memory area. Sample code and kernel crash dump are included
below.

Can anyone please provide any suggestion as to what to look at next?

Thanks,
Radu

8<--------------------------------------------------------------------

#include <linux/module.h>
#include <linux/delay.h>
#include <asm/io.h>

static void __iomem *bad_addr_base;

static int __init test_mce_init(void)
{
        unsigned int x;

        bad_addr_base = ioremap(0xf0000000, 0x100);

        if (bad_addr_base) {
                __asm__ __volatile__ ("isync");
                x = ioread32(bad_addr_base);
                pr_info("Test: %#0x\n", x);
        } else
                pr_err("Cannot map\n");

        return 0;
}

static void __exit test_mce_exit(void)
{
        iounmap(bad_addr_base);
}

module_init(test_mce_init);
module_exit(test_mce_exit);

MODULE_LICENSE("GPL");

8<--------------------------------------------------------------------

[   14.977053] mce: loading out-of-tree module taints kernel.
[   15.004285] Disabling lock debugging due to kernel taint
[   15.026151] Machine check in kernel mode.
[   15.030153] Caused by (from SRR1=41000): [   15.033982] Transfer
error ack signal
[   15.037652] Oops: Machine check 1, sig: 7 [#1]
[   15.042088] PREEMPT [   15.044091] MPC8378_CUSTOM
[   15.046967] Modules linked in: mce(O+) iptable_filter ip_tables
x_tables ipv6 mpc8xxx_wdt yaffs spidev spi_fsl_spi spi_fsl_lib
spi_fsl_cpm fsl_mph_dr_of ehci_fsl ehci_hcd
[   15.067486] CPU: 0 PID: 1213 Comm: insmod Tainted: G   M     C O
4.9.191-default-mpc8378-p3c692a64ae1d #31
[   15.078175] task: 9e83e550 task.stack: 9ea2e000
[   15.082699] NIP: 00000900 LR: b147e030 CTR: 80015d50
[   15.087659] REGS: 9ea2fca0 TRAP: 0200   Tainted: G   M     C O
(4.9.191-default-mpc8378-p3c692a64ae1d)
[   15.098084] MSR: 00041000 <ME>[   15.100973]   CR: 42002228  XER: 00000000
[   15.104976] DAR: 80017414 DSISR: 00000000
GPR00: b147e030 9ea2fd50 9e83e550 00000000 b1480000 9c652200 9ea2fd18 00000000
GPR08: 9c652200 00000000 b1480000 00001032 80015d50 100b93d0 b147e308 805eb3d8
GPR16: 0000003a 00000550 b1473b5c b147c2a4 8048e444 80082b08 00000000 b147c0e8
GPR24: 00000124 00000578 00000000 00000000 b147c0a0 b147e000 9eb7c280 b147c0a0
NIP [00000900] 0x900
[   15.139310] LR [b147e030] test_mce_init+0x30/0xa8 [mce]
[   15.144528] Call Trace:
[   15.146973] [9ea2fd50] [b147e000] test_mce_init+0x0/0xa8 [mce] (unreliable)
[   15.153940] [9ea2fd60] [b147e030] test_mce_init+0x30/0xa8 [mce]
[   15.159864] [9ea2fd70] [80003ac4] do_one_initcall+0xbc/0x184
[   15.165527] [9ea2fde0] [804857e8] do_init_module+0x64/0x1e4
[   15.171107] [9ea2fe00] [80086014] load_module+0x1c78/0x2268
[   15.176680] [9ea2fec0] [80086780] SyS_init_module+0x17c/0x190
[   15.182433] [9ea2ff40] [80010acc] ret_from_syscall+0x0/0x38
[   15.188005] --- interrupt: c01 at 0xfdfdb64
[   15.188005]     LR = 0x10013c64
[   15.195309] Instruction dump:
[   15.198274] 00000000 XXXXXXXX 00000000 XXXXXXXX 00000000 XXXXXXXX
00000000 XXXXXXXX
[   15.206047] 00000000 XXXXXXXX 00000000 XXXXXXXX 7d5043a6 XXXXXXXX
7d400026 XXXXXXXX
[   15.213824] ---[ end trace d38922938e009d45 ]---
[   15.218434]
[   16.219951] Kernel panic - not syncing: Fatal exception
[   16.225174] Rebooting in 1 seconds..
