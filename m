Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76843470CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 17:25:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45R1Vx531xzDrhm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 01:24:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=chunkeey@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RyHDIUCD"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45R1T70lj1zDrfy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 01:23:21 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id z23so4995234wma.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZesVLTiSYqAB+BTwYzkqLpUwEabag45PR8QZGWwJXF4=;
 b=RyHDIUCD78z3uvuNl3Y1uyWxHkwLz14a/EmVWQSGjUdYfhr2NGYT3NqJOqX4LtUBIZ
 2OoYu0qER+RS3rOC56pefumtuPKjlgUgBls6NL1+R5sS7fjNY5oGtQs6ny+H2XoNioVr
 TQ2g1b7ZeFWNQPSCCTPM9GP1zaGGkthz9khYw1IdHJXjN1WLxyqufzU34eY0UdGqn9wj
 rSXUCBJzHSoWnUN9JM1KVrtz2lU+bb9DdYdousmBAXsptTtCZp6RoMTz2A9xivolRm7J
 3P8IMrYB9RcTmUu3tb3Nxq6Q3YdbhTDYT/+3UZX7El/s3pgr56ChdrTG9EXhV9GHjy1F
 9S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZesVLTiSYqAB+BTwYzkqLpUwEabag45PR8QZGWwJXF4=;
 b=fY1ip0X8/tQaV2dTRZdtViatF5D+Mh12cJMHaAwitmI87trsqISyBaGF29lyK2Czm3
 xH+WTV2r0ZtWs4HQPjRWpEhHWPhSzK3zm3UPdyYt7EHumGfePv6/SH825bYvDyf9n5kc
 EW23ePNNRWWVzLqpW7N8rbFmwROLjSWjfn0MRT10TNGonI4QwS+nYerR2PqFKw02sfOh
 mKDCaJ3Qpar3P17sBiGf9bQh+7MKJgKjM2hBeQCjSWY3IEM8KHLJkhuRAO8LpNWmr5AV
 ZMtUQJEJrKMVM2hdVmIDEUmRBFityAez899Kzx1DRIM6/8I9gIBrMzbZo3wGqeXOX+Jm
 SPWw==
X-Gm-Message-State: APjAAAWWHdHrQ86P04CEhwNGkQIt6TbtQahodTZ7SDcFaNWB78ggD5pg
 HvL0rSGkGqkO10gnf4LMLcnl6c14gB8=
X-Google-Smtp-Source: APXvYqwQFoGVBDvgJXgwdanW/V6itki8dg2ccUFOSQLM141JfLP3T7aLgszaGXvIg/wIUXL19gcd+g==
X-Received: by 2002:a1c:151:: with SMTP id 78mr3994231wmb.46.1560612194347;
 Sat, 15 Jun 2019 08:23:14 -0700 (PDT)
Received: from debian64.daheim (pD9E2960F.dip0.t-ipconnect.de.
 [217.226.150.15])
 by smtp.gmail.com with ESMTPSA id l1sm7256063wmg.13.2019.06.15.08.23.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 08:23:13 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.92)
 (envelope-from <chunkeey@gmail.com>)
 id 1hcAWP-0006qi-3K; Sat, 15 Jun 2019 17:23:13 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/4xx/uic: clear pending interrupt after irq type/pol
 change
Date: Sat, 15 Jun 2019 17:23:13 +0200
Message-Id: <20190615152313.26288-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When testing out gpio-keys with a button, a spurious
interrupt (and therefore a key press or release event)
gets triggered as soon as the driver enables the irq
line for the first time.

This patch clears any potential bogus generated interrupt
that was caused by the switching of the associated irq's
type and polarity.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 arch/powerpc/platforms/4xx/uic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/4xx/uic.c b/arch/powerpc/platforms/4xx/uic.c
index 31f12ad37a98..36fb66ce54cf 100644
--- a/arch/powerpc/platforms/4xx/uic.c
+++ b/arch/powerpc/platforms/4xx/uic.c
@@ -154,6 +154,7 @@ static int uic_set_irq_type(struct irq_data *d, unsigned int flow_type)
 
 	mtdcr(uic->dcrbase + UIC_PR, pr);
 	mtdcr(uic->dcrbase + UIC_TR, tr);
+	mtdcr(uic->dcrbase + UIC_SR, ~mask);
 
 	raw_spin_unlock_irqrestore(&uic->lock, flags);
 
-- 
2.20.1

