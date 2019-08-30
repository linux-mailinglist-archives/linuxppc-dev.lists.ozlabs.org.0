Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247A6A3F9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 23:20:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KspC5jN3zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 07:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="YqAp1gZn"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KsfY4tv4zDr2k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 07:13:56 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id p13so7382125qkg.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=9IiJZpTOSKCR6WBakH7U6sQn4CVu6WS5L5+lBv5zZD8=;
 b=YqAp1gZnZGhxy+02UnsSNupu7fjtaE0/i2HaaFGvIhcULR4hjVd4JoVJn34+hKBhLe
 8N/em8npCSQtXMgnsEOlprv+hv4/UEGIC7NrdGwKEbii4Mpvx5WHvY5rN3kYlV1OsWLq
 AxjpK4vUL71fRI5LiwGy7I0v/6+BATFU6kQOxoNMElSnnnm8hdHrVf00BPDlFiFtucJx
 xpuPxoJEO6MAhpPDDk1ohzEr1xJRhp9uJUBYFEC0ZwwtkapNKk8/nwjTVusDTNOJtlSe
 6gqeZyQPy/dAyrKYEx3BbqBAiLy/c4Ghvnx7td96UddgzuxPPStDNSbalxV0FAnBm9/J
 SQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=9IiJZpTOSKCR6WBakH7U6sQn4CVu6WS5L5+lBv5zZD8=;
 b=hZQnn+/jLyGJPctKRbfbVbMcC++k1TN0z2sriL2xJI7c3cfhiKBDzL3V2sfAwWKvD2
 8ZYyChfShDOock+YrGPIaZeKYO1sBj/NRIqlEdccayB0TtqWUv+nEvvae5cyXxqHR+oc
 Vk9LISY2VIaYBuk0YqIsMlQF5A1AVmGjxcAxti9zEXCvRyIHMvzx/lC4WtY516+OxNcL
 FCbYPxwHkNypz+UfOZJp64P15vKhizRLBJcCO5/r4TSmCMUPPnT7bo3yAHrYcvWsHofM
 QXY60B/emxczR4Nd034AF+Hm+JMXHT2UUJ8H81ZnVxKZgJvvQNi8bRM25zb27Wt+m26a
 Cg8A==
X-Gm-Message-State: APjAAAVafQ36r3BeVi4Hcqz6peL9WuMe3zbI//ePQz9fisIyj8ZrNQS6
 1MOJvWrShEh49ArISAcALwBlEA==
X-Google-Smtp-Source: APXvYqwf+deiXMLQ1zMscUAYYr5DMgHb0Cq82Gs2lVSvOmUvm3SfCqYCe4A0+PRYJnHkzWzvTqo+cg==
X-Received: by 2002:a37:7b06:: with SMTP id w6mr17404332qkc.436.1567199632974; 
 Fri, 30 Aug 2019 14:13:52 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id c14sm2226977qta.80.2019.08.30.14.13.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 14:13:52 -0700 (PDT)
Message-ID: <1567199630.5576.39.camel@lca.pw>
Subject: lockdep warning while booting POWER9 PowerNV
From: Qian Cai <cai@lca.pw>
To: Bart Van Assche <bvanassche@acm.org>
Date: Fri, 30 Aug 2019 17:13:50 -0400
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config

Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH) would generate
a warning in lockdep_register_key() at,

if (WARN_ON_ONCE(static_obj(key)))

because

key = 0xc0000000019ad118
&_stext = 0xc000000000000000
&_end = 0xc0000000049d0000

i.e., it will cause static_obj() returns 1.


[   23.738200][   T13] ahci 0004:03:00.0: enabling device (0541 -> 0543)
[   23.748692][    T5] tg3.c:v3.137 (May 11, 2014)
[   23.748731][    T5] tg3 0005:01:00.0: enabling device (0140 -> 0142)
[   23.751478][   T13] ahci 0004:03:00.0: AHCI 0001.0000 32 slots 4 ports 6 Gbps
0xf impl SATA mode
[   23.751517][   T13] ahci 0004:03:00.0: flags: 64bit ncq sntf led only pmp fbs
pio slum part sxs 
[   23.791077][   T13] scsi host0: ahci
[   23.802752][   T13] ------------[ cut here ]------------
[   23.802786][   T13] WARNING: CPU: 0 PID: 13 at kernel/locking/lockdep.c:1120
lockdep_register_key+0x68/0x200
[   23.802814][   T13] Modules linked in: mdio tg3(+) ahci(+) libahci libphy
firmware_class libata dm_mirror dm_region_hash dm_log dm_mod
[   23.802884][   T13] CPU: 0 PID: 13 Comm: kworker/0:1 Not tainted 5.3.0-rc6-
next-20190830 #4
[   23.802930][   T13] Workqueue: events work_for_cpu_fn
[   23.802962][   T13] NIP:  c00000000019eed8 LR: c000000000129400 CTR:
c0000000008a46dc
[   23.802988][   T13] REGS: c00000002db2f130 TRAP: 0700   Not tainted  (5.3.0-
rc6-next-20190830)
[   23.803032][   T13] MSR:  900000000282b033
<SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48800a89  XER: 20040000
[   23.803096][   T13] CFAR: c00000000019eeac IRQMASK: 0 
[   23.803096][   T13] GPR00: c000000000129400 c00000002db2f3c0 c000000002bb9400
c0000000049d0000 
[   23.803096][   T13] GPR04: 0000000000000000 c000000002d84718 0000000000000000
ffff0a01ffffff10 
[   23.803096][   T13] GPR08: c000000000b8a16b c000000000a515cc c000000000b8a16a
0000000000000044 
[   23.803096][   T13] GPR12: 0000000088800a89 c0000000049d0000 c00800000eea3290
0000000000000001 
[   23.803096][   T13] GPR16: c000001bca584500 c000000007244954 c000001bca584508
0000000000000020 
[   23.803096][   T13] GPR20: c000000001aea180 0000000000000001 c00800000eee7560
c000001bca584500 
[   23.803096][   T13] GPR24: c000001bca584448 000000000002000a c000000001aea148
c000000000b8a161 
[   23.803096][   T13] GPR28: c000000001aea020 c000000001aea118 c000000001aea000
c00000002db2f440 
[   23.803407][   T13] NIP [c00000000019eed8] lockdep_register_key+0x68/0x200
[   23.803432][   T13] LR [c000000000129400] wq_init_lockdep+0x40/0xc0
[   23.803461][   T13] Call Trace:
[   23.803491][   T13] [c00000002db2f3c0] [c000000000b8a16a]
trunc_msg+0x385f9/0x4c30f (unreliable)
[   23.803531][   T13] [c00000002db2f440] [c000000000129400]
wq_init_lockdep+0x40/0xc0
[   23.803577][   T13] [c00000002db2f4c0] [c000000000128d90]
alloc_workqueue+0x1e0/0x620
[   23.803623][   T13] [c00000002db2f5c0] [c0000000006ca048]
scsi_host_alloc+0x3d8/0x490
[   23.803701][   T13] [c00000002db2f660] [c00800000ee73198]
ata_scsi_add_hosts+0xd0/0x220 [libata]
[   23.803771][   T13] [c00000002db2f6f0] [c00800000ee6d440]
ata_host_register+0x178/0x400 [libata]
[   23.803840][   T13] [c00000002db2f7d0] [c00800000ee6d8f4]
ata_host_activate+0x17c/0x210 [libata]
[   23.803883][   T13] [c00000002db2f880] [c00800000edf4c3c]
ahci_host_activate+0x84/0x250 [libahci]
[   23.803944][   T13] [c00000002db2f940] [c00800000f050c7c]
ahci_init_one+0xc74/0xdc0 [ahci]
[   23.803992][   T13] [c00000002db2faa0] [c00000000062b188]
local_pci_probe+0x78/0x100
[   23.804048][   T13] [c00000002db2fb30] [c00000000012c0b0]
work_for_cpu_fn+0x40/0x70
[   23.804087][   T13] [c00000002db2fb60] [c000000000130328]
process_one_work+0x388/0x750
[   23.804135][   T13] [c00000002db2fc60] [c00000000012fe30]
process_scheduled_works+0x50/0x90
[   23.804180][   T13] [c00000002db2fca0] [c000000000130c50]
worker_thread+0x3d0/0x570
[   23.804216][   T13] [c00000002db2fda0] [c000000000139a08] kthread+0x1b8/0x1e0
[   23.804253][   T13] [c00000002db2fe20] [c00000000000b660]
ret_from_kernel_thread+0x5c/0x7c
[   23.804298][   T13] Instruction dump:
[   23.804326][   T13] fbc10070 4194002c 7fa3eb78 481864a5 60000000 70630001
41810018 7fa3eb78 
[   23.804373][   T13] 48075121 60000000 70630001 40810020 <0fe00000> ebc10070
eba10068 38210080 
[   23.804419][   T13] ---[ end trace 9ceca43eedad2a2b ]---
[   23.810924][    T5] tg3 0005:01:00.0 eth0: Tigon3 [partno(BCM95719) rev
5719001] (PCI Express) MAC address 08:94:ef:80:81:c0
[   23.810967][    T5] tg3 0005:01:00.0 eth0: attached PHY is 5719C
(10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[   23.811027][    T5] tg3 0005:01:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0]
ASF[1] TSOcap[1]
[   23.811074][    T5] tg3 0005:01:00.0 eth0: dma_rwctrl[00000000] dma_mask[64-
bit]
[   23.811284][   T13] scsi host1: ahci
