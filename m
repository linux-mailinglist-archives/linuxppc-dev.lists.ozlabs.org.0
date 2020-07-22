Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69142228DCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 03:55:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBJTF4QByzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 11:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W0zV9K1q; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBJPZ5JNpzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 11:52:34 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id m9so369718pfh.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 18:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iK8P7ciTYQiTHZiRkUZ2UDN91Jp0neAG81UxDF/u9mI=;
 b=W0zV9K1qzDquBHyhEIEm4RZIVaJqQzcDaHp5zbiB9VALg+kbXboKpPP80B/ofPirA8
 MUnjA/JLggYFTt9LOc3GhCwvnxNsMf065ymFKzgR5WmcRtuCgFps9mmZgYt26Q1/xQLd
 vkKgx2SbRpCz/ifu7G3qPYvRwleDvhSAhv84VBSNgWjbhkN4RX5RsO7LJSX1/6+vKGvr
 +/rE0/PrIeyIUsVDSLsDpcxUA+sS5OOJKC1Bvi9FZs32EgNvZrLyoTYO80gpEQoXkJYT
 EaDgB4GnQAC2ndaJ5fBIIn+Tod48qQRLIrzoI5y4NuQlitPMFeP7cjCBQaZDUaiP2mYy
 Q4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iK8P7ciTYQiTHZiRkUZ2UDN91Jp0neAG81UxDF/u9mI=;
 b=B8mic32517L+UmOLDdh2q/gw9C8SY/4/fpXza5KyiZe79uq88zz0/wIoTz6X4JXnLQ
 S8qDn3dS+OI8YMTQQhSRYivAe24b5ix6Y/4wV95Z6SWZkkUzcGUfEb/ho0b7UkW0R5RY
 vv51SIsUhXfzlOChkL70GExI1i8ec23VtxfbD7K9W5lyOzL/cbALyAlotYPKamGe8fov
 YC9BoLb/+QQoXca/a03EjaK7ZT3nbQ6hHjIILeKuMYOK6wAzn37P/jNoo71wz0piqMS7
 pRPk0owvU2jmay3ce0E5U0iyZVzDriacTtichX5Wg2fO21LU3qDvQY07w02MM6mWmiYl
 gV+A==
X-Gm-Message-State: AOAM530bdNkXi24huDQvNFjVlKcgxCX5nQikdlLBQeSqe9Ixr/Tby+NV
 DeW+EGBV+tNwCJRNQnL/BQFpSKg=
X-Google-Smtp-Source: ABdhPJyV51XshsdpqbndJMHojB3nvp2XoQBkiTsuagQ4pHnI3wym3aO3MmcAy4VHpQ+CEf+iUXyJ+w==
X-Received: by 2002:a63:e80e:: with SMTP id s14mr25496482pgh.32.1595382752073; 
 Tue, 21 Jul 2020 18:52:32 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v22sm21533746pfe.48.2020.07.21.18.52.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 18:52:31 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv3 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
Date: Wed, 22 Jul 2020 09:52:10 +0800
Message-Id: <1595382730-10565-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>
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
So in kdump kernel, when read_from_oldmem() resorts to
pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, as it
can be observed "Bus error"

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
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
v2 -> v3: rebase onto ppc next-test branch
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 1a3ac3b..def8cb3f 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -372,6 +372,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+	drmem_update_dt();
 
 	__remove_memory(nid, base_addr, block_sz);
 
@@ -607,6 +608,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	lmb_set_nid(lmb);
 	lmb->flags |= DRCONF_MEM_ASSIGNED;
+	drmem_update_dt();
 
 	block_sz = memory_block_size_bytes();
 
@@ -625,6 +627,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
 		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+		drmem_update_dt();
 
 		__remove_memory(nid, base_addr, block_sz);
 	}
@@ -877,9 +880,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 		break;
 	}
 
-	if (!rc)
-		rc = drmem_update_dt();
-
 	unlock_device_hotplug();
 	return rc;
 }
-- 
2.7.5

