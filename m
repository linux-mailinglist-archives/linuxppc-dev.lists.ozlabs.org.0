Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74E158888
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 04:06:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GnjQ1jtpzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 14:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n6WDDUbC; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gnd773jlzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 14:02:35 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 6so4945212pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 19:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Q+JO1fZOB0lKMDmVqxu6245Sva9CNNJOFjkmxWxmRY=;
 b=n6WDDUbCZ445V6OlluOnoSLEEQkCmfwepuCQ47yQmkNN+P+DvNQEXt1XA8Fa0xDVxG
 mNfulLp6vdth5/tUuLjyd+up5PHLO215agDTis/MYB9cYfY2ztaV6EHQzob/Rxb/FsdG
 zciYTskeUThlr0vnzYlhmfKZ3TRI8WN5MtSFRPD0wmtgCuMRz5qc3DwT0GXBY907X6tG
 V28vSDO3lmIvAh9EisV4zfZ5rkQtIdQIliG0uMmKOfl5YCeV1U3sZ2e/jDsPMR2EZ1Nb
 BfBQjpkr1xFlkfOguEdsGS8KbeLqBwyfSj0dKDtFzMtof5CD6KFGTjjzEXnEmhBAMQK1
 oBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Q+JO1fZOB0lKMDmVqxu6245Sva9CNNJOFjkmxWxmRY=;
 b=kJ8wQ9ES2AOugDX395rwvnysoJVr3gkXwECfk/N8Gxju6/4uGdjbaKLD4UoMd85xSC
 NeUet728FbAqe7Dc5Z9tGmMYmLkUlqhxfnlIR+FRPeA55CLE9cGdPRtpv+l7pXSCNS3b
 sr3bt1Io3uIyWfusA/N3/qp2lU6ZdKFbHxnlU0ufeYttujjROLtXuFG7JOfF2N1kMPI8
 gdC+dcwOjlLeXuWOl+ZOrbKyTc2cDniFCTXOydE7v/ZAnZfXiyAEKjngqKokDErkpIxP
 pRsHf8oeKpuYlTdiz0W+7XF3kLJ7gSHfQ+oSrtd4q7dXfH3W0JD9iCaVaO45Y42b2EF5
 7Asw==
X-Gm-Message-State: APjAAAUJTtmEWpkMRRIstxU1LyHl7e15W2+BzThYO2Lrn9aD6t1g3nBN
 Gd6WS9sgfNSb3uejjdGBDlQLtg0=
X-Google-Smtp-Source: APXvYqy4Y7dOg/D/Saba9q/P/Moy2/OqlmtLwEJRrgaM4SaEusdJIFoNRkNHSiNU1bZ5A/UCL7I99A==
X-Received: by 2002:a63:ba03:: with SMTP id k3mr4967289pgf.52.1581390151579;
 Mon, 10 Feb 2020 19:02:31 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m71sm1290633pje.0.2020.02.10.19.02.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 19:02:31 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
Date: Tue, 11 Feb 2020 10:59:42 +0800
Message-Id: <1581389982-5701-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1581389982-5701-1-git-send-email-kernelfans@gmail.com>
References: <1581389982-5701-1-git-send-email-kernelfans@gmail.com>
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
Cc: kexec@lists.infradead.org, Pingfan Liu <kernelfans@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A bug is observed on pseries by taking the following steps on rhel:
-1. drmgr -c mem -r -q 5
-2. echo c > /proc/sysrq-trigger

And then, the failure looks like:
kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
kdump: saving vmcore-dmesg.txt
kdump: saving vmcore-dmesg.txt complete
kdump: saving vmcore
 Checking for memory holes                         : [  0.0 %] /                   Checking for memory holes                         : [100.0 %] |                   Excluding unnecessary pages                       : [100.0 %] \                   Copying data                                      : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
[   44.337663] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
[   44.337677] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
[   44.337692] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
[   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba400000 nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
[   44.338548] Core dump to |/bin/false pipe failed
/lib/kdump-lib-initramfs.sh: line 98:   469 Bus error               $CORE_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-incomplete
kdump: saving vmcore failed

* Root cause *
  After analyzing, it turns out that in the current implementation,
when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updating as
the code __remove_memory() comes before drmem_update_dt().

From a viewpoint of listener and publisher, the publisher notifies the
listener before data is ready.  This introduces a problem where udev
launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
updating. And in capture kernel, makedumpfile will access the memory based
on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.

* Fix *
  In order to fix this issue, update dt before __remove_memory(), and
accordingly the same rule in hot-add path.

This will introduce extra dt updating payload for each involved lmb when hotplug.
But it should be fine since drmem_update_dt() is memory based operation and
hotplug is not a hot path.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index a3a9353..1f623c3 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -392,6 +392,9 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+	rtas_hp_event = true;
+	drmem_update_dt();
+	rtas_hp_event = false;
 
 	__remove_memory(nid, base_addr, block_sz);
 
@@ -665,6 +668,9 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	lmb_set_nid(lmb);
 	lmb->flags |= DRCONF_MEM_ASSIGNED;
+	rtas_hp_event = true;
+	drmem_update_dt();
+	rtas_hp_event = false;
 
 	block_sz = memory_block_size_bytes();
 
@@ -683,6 +689,9 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
 		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+		rtas_hp_event = true;
+		drmem_update_dt();
+		rtas_hp_event = false;
 
 		__remove_memory(nid, base_addr, block_sz);
 	}
@@ -939,12 +948,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 		break;
 	}
 
-	if (!rc) {
-		rtas_hp_event = true;
-		rc = drmem_update_dt();
-		rtas_hp_event = false;
-	}
-
 	unlock_device_hotplug();
 	return rc;
 }
-- 
2.7.5

