Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 154461A2D7E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 04:03:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yPYf4X3SzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 12:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LMeOXr4D; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yPTR0cGtzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 11:59:23 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id cp9so555253pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+nzNcvHE7znKtUbTH1h7qAqABqp+roGwnZR7QhEKjNg=;
 b=LMeOXr4DEpGU949d4FXAjBBrSehRR+SLJBEMB6pJvxTGHLcGmO+Aak6KwZrM75DwhL
 3uV8PX0N+0OBLxq7yDwWJV3qeU11jjPqEQPIc0dWZqR0q8gbkd4wvmFl4AhPvLyb+UoZ
 Yz2bP4Xm2YX0oPe/B6VY0LWws/Kjo95nPD8lu1GyCh8f9GpmLSc75hF3X5Npn6sZnmqQ
 0oag58vkruy45/qCUKUIsCYrBBv6HIeScBS6/VwUDouIO0ZWvDMuaFvkN1lNkSLtUoaK
 TJp6ptQZj+JfhFxC0t8gssnyy8A1LxkbAMNF1eNxy+WkUGFMzN3s9TcVzn2+tvWMzfmL
 jTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+nzNcvHE7znKtUbTH1h7qAqABqp+roGwnZR7QhEKjNg=;
 b=dPXeRBCWs5TA2ZxqyA75TGJ4vurbulXn1mRzevsNfe57LaIzTyUOtz4M/SQFG5yQpE
 9HODQ2/W9vg374/OVUitiWMbQKHCybATm7qhPlhcNmboHXpKtXoNJhPNdWvNxZafM0sZ
 I+c7r2CBvj3BUYeYsB7IFkB7jLOGXLPNW8OzMup0lBhg+YgZOPlBvRNEerhBJE0jNy6W
 TXxy4Dh6LczIUaBvrWRvT13hiMlh2K/0VeoQa7gGUAEGP6UOz1payVbHrPk8QNhttsFQ
 iTM7I5g0xDbOGCKWbwJggZ4CbB3BZF8Np+jdENl/hwkOvg/M/jT3f4KTYb0klnYTQfl5
 T/Dw==
X-Gm-Message-State: AGi0PuawE7rzQofQ6zKPt2h7P6OvSpt5Pry5QiNRsVLwrjHkfF40tuQc
 Mfl4z1CMGShEOotae08iNSX+EW0mmg==
X-Google-Smtp-Source: APiQypIXcVvSFd4LPa6h3J2f9FhTYsaMvRnAl7LRvhih+g2bob+2p8SKKBLhG/A/NC2TKWcyi9NG4Q==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr10035156plo.12.1586397560894; 
 Wed, 08 Apr 2020 18:59:20 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w27sm17822530pfq.211.2020.04.08.18.59.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 18:59:20 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv2 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
Date: Thu,  9 Apr 2020 09:56:51 +0800
Message-Id: <1586397411-24259-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1586397411-24259-1-git-send-email-kernelfans@gmail.com>
References: <1586397411-24259-1-git-send-email-kernelfans@gmail.com>
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
Cc: Libor Pechacek <lpechacek@suse.cz>, Pingfan Liu <kernelfans@gmail.com>,
 kexec@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Leonardo Bras <leonardo@linux.ibm.com> 
Cc: Libor Pechacek <lpechacek@suse.cz> 
Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com> 
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
v1 -> v2: improve commit, and more detail about the SIGBUG failure path
 arch/powerpc/platforms/pseries/hotplug-memory.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 4bd9004..72cd4a5 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -394,6 +394,9 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+	rtas_hp_event = true;
+	drmem_update_dt();
+	rtas_hp_event = false;
 
 	__remove_memory(nid, base_addr, block_sz);
 
@@ -667,6 +670,9 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	lmb_set_nid(lmb);
 	lmb->flags |= DRCONF_MEM_ASSIGNED;
+	rtas_hp_event = true;
+	drmem_update_dt();
+	rtas_hp_event = false;
 
 	block_sz = memory_block_size_bytes();
 
@@ -685,6 +691,9 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
 		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+		rtas_hp_event = true;
+		drmem_update_dt();
+		rtas_hp_event = false;
 
 		__remove_memory(nid, base_addr, block_sz);
 	}
@@ -941,12 +950,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
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

