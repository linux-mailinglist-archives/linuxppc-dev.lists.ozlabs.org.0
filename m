Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CF23B20D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:03:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGhZ5HsdzDqWM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:03:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AL5UCFku; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVg2BhKzDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:35 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id c10so764064pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TactvkA63oDsvSndGpOqYBmZTeiVX7ufbg9omh1sGRU=;
 b=AL5UCFkuWWFZqin3qaGL1cZrZcsPo4chkNkea1AUYWnrnC0XURHQXd2ucq5KIIvu7f
 FVVfmduuavdcMsGBGB41aTAcbMFWHyT8JjEV4/TkVux9G2I/959kfCRcdSJn4KpYpu9v
 0nFHO17GHpf8m2tmMKOWmGTe+DDPsOZ/venONgr8hdgZwmm4mnCvaEUEe3J8TyTvxxQu
 VHDQmGgiXlCsK26D/TybNQGHEzYkz2ocoD8kll27NRuaQ5ppDO1jC58DprJ3s0Ogj1LI
 g20FMblMVkssygbsL/DksXTrrAJBWF2R7NntSWhxwSbtg+uHwbelrfbTLT6sVThNi9fF
 BmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TactvkA63oDsvSndGpOqYBmZTeiVX7ufbg9omh1sGRU=;
 b=OYkQ2F8q95ITSSBxFmV+/a07fkuIj8Mc4LVSVEUswLh6EITW2ViDL0VimOuKlSTkT/
 /goI7wLBAzzpG8H3qAEyhRIvAw3/unqp8MChDMHZp3Gg/RHwk3DRAYuUy07pegHMmxU+
 8AOVqWu6jCf8KVWIDKAQ9zDY4HOn9Z+u1+1qNJWzEKcIbFH0cSZ1m74ln27KBFdEOIOK
 p9KXkaHSyzEWaasYZ05PfPjLTiRf+QIQcZXds5PWGZInh22a8F1ZBmAeLO8sS9qIGMQh
 UtHkt0h6mXaub5JR+I82w895jC4w06WwR+he1Bpy0oh6cbLKNx3OWcxuV42bAzH9E19R
 iA1Q==
X-Gm-Message-State: AOAM530X7E1J5LnkqcerHmbx4C8jMS/VDUfteaNj/QKzN32EvgPDV/+R
 mOyXwRxZWk1GE4xzeYQQjw8lnC3w
X-Google-Smtp-Source: ABdhPJzKyamOY2sbVeyUzExAMg7iB8gvp8uxjNe041Pp2/HSNUSfiA7yGcBx6SuDpTkIVycgtuM0Gw==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr1851414pjb.230.1596502472085; 
 Mon, 03 Aug 2020 17:54:32 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:31 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/powernv: Staticify functions without prototypes
Date: Tue,  4 Aug 2020 10:54:07 +1000
Message-Id: <20200804005410.146094-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a few scattered in the powernv platform.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
 arch/powerpc/platforms/powernv/rng.c         | 2 +-
 arch/powerpc/platforms/powernv/vas-window.c  | 9 ++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 9af8c3b98853..663bd69ac51b 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -38,7 +38,7 @@
 
 static int eeh_event_irq = -EINVAL;
 
-void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
+static void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 	eeh_probe_device(pdev);
@@ -190,7 +190,7 @@ PNV_EEH_DBGFS_ENTRY(inbB, 0xE10);
 
 #endif /* CONFIG_DEBUG_FS */
 
-void pnv_eeh_enable_phbs(void)
+static void pnv_eeh_enable_phbs(void)
 {
 	struct pci_controller *hose;
 	struct pnv_phb *phb;
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 8035caf6e297..72c25295c1c2 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -65,7 +65,7 @@ int powernv_get_random_real_mode(unsigned long *v)
 	return 1;
 }
 
-int powernv_get_random_darn(unsigned long *v)
+static int powernv_get_random_darn(unsigned long *v)
 {
 	unsigned long val;
 
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 6434f9cb5aed..5f5fe63a3d1c 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -186,7 +186,7 @@ static void unmap_winctx_mmio_bars(struct vas_window *window)
  * OS/User Window Context (UWC) MMIO Base Address Region for the given window.
  * Map these bus addresses and save the mapped kernel addresses in @window.
  */
-int map_winctx_mmio_bars(struct vas_window *window)
+static int map_winctx_mmio_bars(struct vas_window *window)
 {
 	int len;
 	u64 start;
@@ -214,7 +214,7 @@ int map_winctx_mmio_bars(struct vas_window *window)
  *	 registers are not sequential. And, we can only write to offsets
  *	 with valid registers.
  */
-void reset_window_regs(struct vas_window *window)
+static void reset_window_regs(struct vas_window *window)
 {
 	write_hvwc_reg(window, VREG(LPID), 0ULL);
 	write_hvwc_reg(window, VREG(PID), 0ULL);
@@ -357,7 +357,8 @@ static void init_rsvd_tx_buf_count(struct vas_window *txwin,
  *	as a one-time task? That could work for NX but what about other
  *	receivers?  Let the receivers tell us the rx-fifo buffers for now.
  */
-int init_winctx_regs(struct vas_window *window, struct vas_winctx *winctx)
+static void init_winctx_regs(struct vas_window *window,
+			     struct vas_winctx *winctx)
 {
 	u64 val;
 	int fifo_size;
@@ -499,8 +500,6 @@ int init_winctx_regs(struct vas_window *window, struct vas_winctx *winctx)
 	val = SET_FIELD(VAS_WINCTL_NX_WIN, val, winctx->nx_win);
 	val = SET_FIELD(VAS_WINCTL_OPEN, val, 1);
 	write_hvwc_reg(window, VREG(WINCTL), val);
-
-	return 0;
 }
 
 static void vas_release_window_id(struct ida *ida, int winid)
-- 
2.26.2

