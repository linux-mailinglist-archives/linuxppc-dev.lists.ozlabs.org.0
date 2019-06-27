Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DE58CF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 23:22:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZXtJ6rMDzDqmR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="NLu9PuPk"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZXrZ2cPszDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 07:21:16 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id y57so4114291qtk.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=BnGhhmLs0NKuNQcACyeoZ7fY58jMOrioFdYaVDGXO5k=;
 b=NLu9PuPkHBmYWLZ8E4QUHmn9nNhXAtdHQH82TM0Dr8TRjBFZZrOIqCUwNaxAIil5Le
 bVPEEnjZsAO3KxORiGQhnUYvPUseFp0QiGXaNMwrD8YiPBdOh+QkDBaWZQTLHDdtpM0F
 AgiMVtXg40Dff2IZgnkBNNcJUHbTsa1pcDIhzuV2PKkKQ3fw7U7Czpynfy+GOdskIaYY
 l4ij8bff1xzTpcA54AetcjD4kx8PXCEGhHLStIDWWVHoPrirTdn+4h3TXndV8F0KzqSp
 UfggSc+CgJuMY8KOnW8lKxSTwIxr5N346ljeAQD5bMpp7bH+Zpx7jnqSKbnhFtMhZoXb
 KuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=BnGhhmLs0NKuNQcACyeoZ7fY58jMOrioFdYaVDGXO5k=;
 b=X/Pq46szxGjKuYgXFs+vij+awNYuG+WC7qrd4mQixbI44AVDlfbVKb8nVjzDwik5uY
 fX6jq7kruMEy13Kvoz5Gdwx1HldoXqwKdwLSkErtb0C9yL+wYPRpXOUKhfreL1vkaQmL
 Xs44HiWgAQumbGSAhuzWDwypNS0aXflmgqldUMbNe6KqkPepgdtJnZ1ukWs5o8xHzxBm
 lg8V7LZ7jdN6H6Yucbgm3LT6CSFH4Z9U5W44MAJc0GSlCzX0Jq4tgiv/sB0fkaDtWCJJ
 K5Aj59RPW4rTohSF5bVPon3A6JGZxmb9c5maaFsw39DwUTodIh6q76VC3AnvWi4SIbnF
 zsfg==
X-Gm-Message-State: APjAAAWBe8YvZS40K1zQMBtJJRch1HU6xuI+lDmSepz0cbkwaqt3uC6z
 6zICYaQL+GlQUOcFByQYByGXNQ==
X-Google-Smtp-Source: APXvYqyucLMnFlL8PrwfSlv+M76FN5qa+AodHhkkhAM/WJtk3b6+nDqi+cN50FBmBZzV1nKbPYK+DQ==
X-Received: by 2002:a0c:b521:: with SMTP id d33mr5116673qve.239.1561670474522; 
 Thu, 27 Jun 2019 14:21:14 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 16sm126561qkl.100.2019.06.27.14.21.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 14:21:13 -0700 (PDT)
Message-ID: <1561670472.5154.98.camel@lca.pw>
Subject: power9 NUMA crash while reading debugfs imc_cmd
From: Qian Cai <cai@lca.pw>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Thu, 27 Jun 2019 17:21:12 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Read of debugfs imc_cmd file for a memory-less node will trigger a crash below
on this power9 machine which has the following NUMA layout. I don't understand
why I only saw it recently on linux-next where it was tested everyday. I can
reproduce it back to 4.20 where 4.18 seems work fine.

# cat /sys/kernel/debug/powerpc/imc/imc_cmd_252 (On a 4.18-based kernel)
0x0000000000000000

# numactl -H
available: 6 nodes (0,8,252-255)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
53 54 55 56 57 58 59 60 61 62 63
node 0 size: 130210 MB
node 0 free: 128406 MB
node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85
86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108
109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
node 8 size: 130784 MB
node 8 free: 130051 MB
node 252 cpus:
node 252 size: 0 MB
node 252 free: 0 MB
node 253 cpus:
node 253 size: 0 MB
node 253 free: 0 MB
node 254 cpus:
node 254 size: 0 MB
node 254 free: 0 MB
node 255 cpus:
node 255 size: 0 MB
node 255 free: 0 MB
node distances:
node   0   8  252  253  254  255 
  0:  10  40  80  80  80  80 
  8:  40  10  80  80  80  80 
 252:  80  80  10  80  80  80 
 253:  80  80  80  10  80  80 
 254:  80  80  80  80  10  80 
 255:  80  80  80  80  80  10

# cat /sys/kernel/debug/powerpc/imc/imc_cmd_252

[ 1139.415461][ T5301] Faulting instruction address: 0xc0000000000d0d58
[ 1139.415492][ T5301] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1139.415509][ T5301] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=256
DEBUG_PAGEALLOC NUMA PowerNV
[ 1139.415542][ T5301] Modules linked in: i2c_opal i2c_core ip_tables x_tables
xfs sd_mod bnx2x mdio ahci libahci tg3 libphy libata firmware_class dm_mirror
dm_region_hash dm_log dm_mod
[ 1139.415595][ T5301] CPU: 67 PID: 5301 Comm: cat Not tainted 5.2.0-rc6-next-
20190627+ #19
[ 1139.415634][ T5301] NIP:  c0000000000d0d58 LR: c00000000049aa18 CTR:
c0000000000d0d50
[ 1139.415675][ T5301] REGS: c00020194548f9e0 TRAP: 0300   Not tainted  (5.2.0-
rc6-next-20190627+)
[ 1139.415705][ T5301] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:
28022822  XER: 00000000
[ 1139.415777][ T5301] CFAR: c00000000049aa14 DAR: 000000000003fc08 DSISR:
40000000 IRQMASK: 0 
[ 1139.415777][ T5301] GPR00: c00000000049aa18 c00020194548fc70 c0000000016f8b00
000000000003fc08 
[ 1139.415777][ T5301] GPR04: c00020194548fcd0 0000000000000000 0000000014884e73
ffffffff00011eaa 
[ 1139.415777][ T5301] GPR08: 000000007eea5a52 c0000000000d0d50 0000000000000000
0000000000000000 
[ 1139.415777][ T5301] GPR12: c0000000000d0d50 c000201fff7f8c00 0000000000000000
0000000000000000 
[ 1139.415777][ T5301] GPR16: 000000000000000d 00007fffeb0c3368 ffffffffffffffff
0000000000000000 
[ 1139.415777][ T5301] GPR20: 0000000000000000 0000000000000000 0000000000000000
0000000000020000 
[ 1139.415777][ T5301] GPR24: 0000000000000000 0000000000000000 0000000000020000
000000010ec90000 
[ 1139.415777][ T5301] GPR28: c00020194548fdf0 c00020049a584ef8 0000000000000000
c00020049a584ea8 
[ 1139.416116][ T5301] NIP [c0000000000d0d58] imc_mem_get+0x8/0x20
[ 1139.416143][ T5301] LR [c00000000049aa18] simple_attr_read+0x118/0x170
[ 1139.416158][ T5301] Call Trace:
[ 1139.416182][ T5301] [c00020194548fc70] [c00000000049a970]
simple_attr_read+0x70/0x170 (unreliable)
[ 1139.416255][ T5301] [c00020194548fd10] [c00000000054385c]
debugfs_attr_read+0x6c/0xb0
[ 1139.416305][ T5301] [c00020194548fd60] [c000000000454c1c]
__vfs_read+0x3c/0x70
[ 1139.416363][ T5301] [c00020194548fd80] [c000000000454d0c] vfs_read+0xbc/0x1a0
[ 1139.416392][ T5301] [c00020194548fdd0] [c00000000045519c]
ksys_read+0x7c/0x140
[ 1139.416434][ T5301] [c00020194548fe20] [c00000000000b108]
system_call+0x5c/0x70
[ 1139.416473][ T5301] Instruction dump:
[ 1139.416511][ T5301] 4e800020 60000000 7c0802a6 60000000 7c801d28 38600000
4e800020 60000000 
[ 1139.416572][ T5301] 60000000 60000000 7c0802a6 60000000 <7d201c28> 38600000
f9240000 4e800020 
[ 1139.416636][ T5301] ---[ end trace c44d1fb4ace04784 ]---
[ 1139.520686][ T5301] 
[ 1140.520820][ T5301] Kernel panic - not syncing: Fatal exception
