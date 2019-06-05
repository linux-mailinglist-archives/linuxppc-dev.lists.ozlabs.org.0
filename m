Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00525365F3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 22:48:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K1963p2BzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 06:48:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="lgnxW6WD"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K17D5h9GzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 06:47:04 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id z19so96873qtz.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=pnFDbu7dJL/T4wcolooEMmx0LXIPFQNRhEfaysUvNBs=;
 b=lgnxW6WDgo9OgeTZtYGhPaZKQERQRHNAceLcMWfBpeHl/YDylUCiVNyAt5t5ISX0bP
 32XXXKxxYHqZ40o/wtii3bLLD/2mcAkYWP6t+nVpw2r0QK6pOeksdlfmqe2RQ/QXGg/W
 K8Y5Z+tMieBZ1/41UVLlLUIDVlRXQcAd8nyXT5OdiP80XcD6VUtdiFR/mjMDyQYHWo40
 zCfm2SzgI2GEEawqub5HMd4OGuR3efeKwmeidgK5HAvPPX1TyaRX5KGXua7Pwkg42Wsx
 LtsFmyg9IhkFhJyLCv62YfE6qtU9eRCg9Sdp02XNSHvaO6qpAsH0qOOwHi4ijnhCYSIQ
 DBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pnFDbu7dJL/T4wcolooEMmx0LXIPFQNRhEfaysUvNBs=;
 b=dgFVHeIxzDnAfdXRV9KS07ZmpvfLZQg3mSzy6wSBctP8Ft45AhxgMHs4rrSwni3B5x
 qc80/EaiJ4yMDqu+fZxQm+6htL9dOeidiNYORuf8ioCx3vn+6e+5rjs7uk1NpshQxXuV
 uUiUAg7THuoKhrUO2g9wQZPBzBZ+Jn9sm78CQpdynBOfkufL/LXLe02pI2jkBf3kB59y
 mRiR1ZL+w3x0vSz3nuutcMOxVvNPSeFTTGLauflRxPErWCxiiEd9TAA+m678ErFdusGj
 bxGjMmU9hgnIStIxodhVjbtQd3QdVVheecEhNphhjBuO+z7jETgXeOmB+0ZxREDHGByk
 /XaQ==
X-Gm-Message-State: APjAAAU7aWU08rDfbfF5zFCVxYx+osCJvaWoR81GIIfUh74Zf24WiNtw
 SMjblgeCgJCnMnuxdJhxMG6ipg==
X-Google-Smtp-Source: APXvYqzs4H4AfOMtcePSi562KDEoJqI6zcLd6dh+tfb04CyiY/ymhHP+GPy7/iHlyBpcNYtMz5KBag==
X-Received: by 2002:ac8:644:: with SMTP id e4mr28852202qth.173.1559767620945; 
 Wed, 05 Jun 2019 13:47:00 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id e5sm10388470qkg.81.2019.06.05.13.46.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 13:47:00 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/eeh_cache: fix a W=1 kernel-doc warning
Date: Wed,  5 Jun 2019 16:46:19 -0400
Message-Id: <1559767579-7151-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Qian Cai <cai@lca.pw>, sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org,
 oohall@gmail.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The opening comment mark "/**" is reserved for kernel-doc comments, so
it will generate a warning with "make W=1".

arch/powerpc/kernel/eeh_cache.c:37: warning: cannot understand function
prototype: 'struct pci_io_addr_range

Since this is not a kernel-doc for the struct below, but rather an
overview of this source eeh_cache.c, just use the free-form comments
kernel-doc syntax instead.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/kernel/eeh_cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 320472373122..05ffd32b3416 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -18,6 +18,8 @@
 
 
 /**
+ * DOC: Overview
+ *
  * The pci address cache subsystem.  This subsystem places
  * PCI device address resources into a red-black tree, sorted
  * according to the address range, so that given only an i/o
@@ -34,6 +36,7 @@
  * than any hash algo I could think of for this problem, even
  * with the penalty of slow pointer chases for d-cache misses).
  */
+
 struct pci_io_addr_range {
 	struct rb_node rb_node;
 	resource_size_t addr_lo;
-- 
1.8.3.1

