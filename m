Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E685B2D08B2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 02:07:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq4sk6GDKzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 12:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uPxuIzHv; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq4qk0L91zDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 12:05:37 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id b26so8144645pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 17:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TL1x+bdJSdlG5/HNbCw0/N2qKiT2OeDQRKxqlJLwJsU=;
 b=uPxuIzHvBN3/xHysZw0JP++ZE+Ipib0IJWNJI6H9doJ1/OMJFyZVKYrHxk2YKyyzM+
 gqKHR+ddYF1EvA8H/K3lNRJOwvvZ+zJLpjfvcUFmjSxrCPcCkiU68J4Q1c2IuGlcgvsQ
 Kj/sDxhbqfqPsWqX5BvZZYcbk26x08LBfxm6sFDiah6pu0+PN4fVNyqs6UtozvPXLPlI
 a/m0t3nfrRv3PRNiuoBshFITaIoRQooAcUtqHLRxLGB03pSqIavQqVYVwHlVQtHPeu+k
 ZDuqaGfsM38OO79KyED0/tMG24LKUSg+X2JNCToq5gZzZ8QcF/fFchRt/8o+wJPrvZyZ
 mcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TL1x+bdJSdlG5/HNbCw0/N2qKiT2OeDQRKxqlJLwJsU=;
 b=n4Uf5jFx9k1D8/5JYjFRZ59q8duVyTrk9xcSg4QUQsezBt9ngg+WgmBcBHtD5zmTTa
 SaMktc94aMlYATzqGUNwR7KZNEcS4cpEPNMw0lIZShheZO7qAQbs62zW7lzHrczpn1gt
 mu9Y4pDK01u7bJ2LZLA/jxUxkLrlqcgyVLtGtFMiJZ/qveHMTCM1ENB7mAsK1HXJkZgq
 CLWom7Klz73R5UTao4FEZewgM9ZX5uLZjGA7C5kj7gPphbg+l4CP5Xqh1e9rkBI1tm2E
 IkhqlWwsvZKwVHqjnhXBTzphTa/Yo123kMPZkNDIXWs/23eatY/BdGofpkEciv5sqxJm
 Vx6A==
X-Gm-Message-State: AOAM530Hgm01Yps6Uz2X57aOykEyx9rLNYuWerEMTTBLkDmPvYucMEqr
 4pdaLchcTcdG0OwlRNB8sVSN2Ge2ShI=
X-Google-Smtp-Source: ABdhPJyFL1gaYbocPetSJMRLmr5H8mSsxMj+tvWH0QAsUKcMHcU+eiKbGzd6bu0Cxpea1uUCea6fow==
X-Received: by 2002:a63:4c12:: with SMTP id z18mr16492685pga.66.1607303134767; 
 Sun, 06 Dec 2020 17:05:34 -0800 (PST)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id y27sm1312767pfr.78.2020.12.06.17.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 17:05:34 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/book3s64/kexec: Clear CIABR on kexec
Date: Mon,  7 Dec 2020 12:05:18 +1100
Message-Id: <20201207010519.15597-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The value in CIABR persists across kexec which can lead to unintended
results when the new kernel hits the old kernel's breakpoint. For
example:

0:mon> bi $loadavg_proc_show
0:mon> b
   type            address
1 inst   c000000000519060  loadavg_proc_show+0x0/0x130
0:mon> x

$ kexec -l /mnt/vmlinux --initrd=/mnt/rootfs.cpio.gz --append='xmon=off'
$ kexec -e

$ cat /proc/loadavg
Trace/breakpoint trap

Make sure CIABR is cleared so this does not happen.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/kexec.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/include/asm/book3s/64/kexec.h
index 6b5c3a248ba2..d4b9d476ecba 100644
--- a/arch/powerpc/include/asm/book3s/64/kexec.h
+++ b/arch/powerpc/include/asm/book3s/64/kexec.h
@@ -3,6 +3,7 @@
 #ifndef _ASM_POWERPC_BOOK3S_64_KEXEC_H_
 #define _ASM_POWERPC_BOOK3S_64_KEXEC_H_
 
+#include <asm/plpar_wrappers.h>
 
 #define reset_sprs reset_sprs
 static inline void reset_sprs(void)
@@ -14,6 +15,10 @@ static inline void reset_sprs(void)
 
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
 		mtspr(SPRN_IAMR, 0);
+		if (cpu_has_feature(CPU_FTR_HVMODE))
+			mtspr(SPRN_CIABR, 0);
+		else
+			plpar_set_ciabr(0);
 	}
 
 	/*  Do we need isync()? We are going via a kexec reset */
-- 
2.17.1

