Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112571D165C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:48:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MbbJ5F1XzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=i2BmTeKd; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MbRK3FTyzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 23:41:01 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id b6so16203397qkh.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIL0Xa30eWe4pB9L70dZk7zOy9oguvU9qefI9I02W/c=;
 b=i2BmTeKd6lucjvyoSCAFMWyWiKtK5PqHOl8WxIU7LwH2Vzirg7cKvwtklgHFjs9XYL
 gKWcWITZYNWJq6Kz3QN810QJuIZMKG2gZAmtnmk/XazYBWLXY588/FsRg4B8e/cTube4
 XCeidULijY2gMsBEBBArZLUC+YUCtFi+L+loMPlhmVVCwZdUvXPoabDzIgMthLHDRrO8
 DTCbLPaQOz242IQtcKjGdm8i7E3NiiiuvFXf0NIJ5lH333lM6UrUA+c97oaqewkON1pA
 6CatSmJ5gSSHFce1ZfZjkyA3EbIvPqJ6uBLSLH6VE5VOJHENMMhoa8EQ/N9XeyEsIhcn
 oNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIL0Xa30eWe4pB9L70dZk7zOy9oguvU9qefI9I02W/c=;
 b=GKWWxMoidY6aacfBunAS1gk3AzbkhUAhdNB62V1UYQ2bA44mR4hjDe69f5kiPvdFFM
 Buu94jO7AdXG7BLG+cOsERHlv7Ex7kYP63AQ3IPldnFf1JMekGAkh7fD2uqaM/Re9Rh+
 3AX8LPGpYwHjOdCrvnsyuhLdPt8kuyicorMUJGF/GQGQZ2vyORybtKlENGj4NnciFkod
 jDWoKoPmhYiBvuwW2W62FK/rum/22anW5Irsz8KChkzXHupdDiJ58Yr4/qXiwoWx2k3W
 tQlIPa2MwxAxqxWGmTtxfa1Eh0+YukrwMqV1HkzDe+YfDcoYtiEC8WR+tbnmabsoP6iA
 fegA==
X-Gm-Message-State: AGi0PuYypeRkDV/sa39La1DfDofbFagp3kl6p3ssJiRg1xWbB/ptUU9t
 R7E5kujGWtHlV9vXWjncGqIN6A==
X-Google-Smtp-Source: APiQypKCVvq9COXXOzbdahy5qMUwb2p2BOsLwmIYeCXGLbETKpuNWBa45a/FrKEP87HhfdxrFYdT4A==
X-Received: by 2002:a37:7302:: with SMTP id o2mr26009358qkc.474.1589377258319; 
 Wed, 13 May 2020 06:40:58 -0700 (PDT)
Received: from ovpn-66-156.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q2sm14044106qkn.116.2020.05.13.06.40.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 06:40:57 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/xive: silence kmemleak false positives
Date: Wed, 13 May 2020 09:40:46 -0400
Message-Id: <20200513134046.1089-1-cai@lca.pw>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 catalin.marinas@arm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

opal_xive_donate_page() will reference the newly allocated memory using
__pa(). Since kmemleak is unable to track the physical memory resulting
in false positives, silence those by using kmemleak_ignore().

unreferenced object 0xc000201b53e90000 (size 65536):
 comm "qemu-kvm", pid 124557, jiffies 4295650285 (age 364.370s)
 hex dump (first 32 bytes):
   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
 backtrace:
   [<00000000acc2fb77>] xive_native_alloc_vp_block+0x168/0x210
   xive_native_provision_pages at arch/powerpc/sysdev/xive/native.c:645
   (inlined by) xive_native_alloc_vp_block at arch/powerpc/sysdev/xive/native.c:674
   [<000000004d5c7964>] kvmppc_xive_compute_vp_id+0x20c/0x3b0 [kvm]
   [<0000000055317cd2>] kvmppc_xive_connect_vcpu+0xa4/0x4a0 [kvm]
   [<0000000093dfc014>] kvm_arch_vcpu_ioctl+0x388/0x508 [kvm]
   [<00000000d25aea0f>] kvm_vcpu_ioctl+0x15c/0x950 [kvm]
   [<0000000048155cd6>] ksys_ioctl+0xd8/0x130
   [<0000000041ffeaa7>] sys_ioctl+0x28/0x40
   [<000000004afc4310>] system_call_exception+0x114/0x1e0
   [<00000000fb70a873>] system_call_common+0xf0/0x278

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/sysdev/xive/native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 5218fdc4b29a..2d19f28967a6 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/cpumask.h>
 #include <linux/mm.h>
+#include <linux/kmemleak.h>
 
 #include <asm/machdep.h>
 #include <asm/prom.h>
@@ -647,6 +648,9 @@ static bool xive_native_provision_pages(void)
 			pr_err("Failed to allocate provisioning page\n");
 			return false;
 		}
+		/* Kmemleak is unable to track the physical address. */
+		kmemleak_ignore(p);
+
 		opal_xive_donate_page(chip, __pa(p));
 	}
 	return true;
-- 
2.21.0 (Apple Git-122.2)

