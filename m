Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D1F4F12
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:15:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478kNR0jcFzF7Q4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:15:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="RkUIYnXt"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gQy0Kn9zF6tB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:18 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id d6so4018899lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiVnbA+aLQJgHhafT97yYdRXOf2rz2/qkrRHHeVl/y0=;
 b=RkUIYnXtYtHoaluers5poWFKyA9z83YZFiREEHR69eo9ytnTPqRk666oOcDh796rt5
 W1SjnIiqgz5KNK11xLTj256um9u/k4+/5+8GSUUNS1JotuxHOPV7fZbIa/ZjkUpQA3ac
 P0TDnhp2ooUva3vHkfByfLzAZyZAhhEcqhIuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiVnbA+aLQJgHhafT97yYdRXOf2rz2/qkrRHHeVl/y0=;
 b=aJUXrd2LsShfttE7VtuTyU1FkcBspo29phHyzfj17NPDohFC0/+6RZgBsxUysA9Z6/
 RofpFyllBdHVCziz0UFHDC8o2KeLgB2QAukNO8qK5GxSE3lhojo/L0i15H2AgY8VwLBY
 czudHWaWjd2rpvU4dgAfm5vHnY/iuXiqhIWlpWFOdOaCgAZ7bbw77IwOo9kSbKXPCcYH
 FhK1UABe3cigIwQlm90eWtP+gLfRCq/qYENiNO148HDSyATIfiG6yfKZgFff6JavCTTt
 B91OYs8kfCQtSMiTfIG18PDEbGIwvY0yf+iYTEx4wAggtYI4Q7LqTs3YZyGOLmamoY6P
 ghSA==
X-Gm-Message-State: APjAAAVIJnJXPTfWmZCZY3tUAGefe4kdYii9SBnJUNbNhbrRU6oY0CiS
 4CC3gQjH0ePriwzwupV5I1tO7Q==
X-Google-Smtp-Source: APXvYqyY1XtYAXaxuUxr5OqGf/UpqCH4S0tKcnokVcpJWs4tNPMtCmYKxFMQ4t+72vh1UpmamXg+gA==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr6601913lff.89.1573218133640; 
 Fri, 08 Nov 2019 05:02:13 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:13 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 36/47] soc: fsl: qe: make cpm_muram_free() ignore a
 negative offset
Date: Fri,  8 Nov 2019 14:01:12 +0100
Message-Id: <20191108130123.6839-37-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: Scott Wood <oss@buserror.net>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows one to simplify callers since they can store a negative
value as a sentinel to indicate "this was never allocated" (or store
the -ENOMEM from an allocation failure) and then call cpm_muram_free()
unconditionally.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index ea9bef1d2c77..4437f4e14d2c 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -176,6 +176,9 @@ void cpm_muram_free(s32 offset)
 	int size;
 	struct muram_block *tmp;
 
+	if (offset < 0)
+		return;
+
 	size = 0;
 	spin_lock_irqsave(&cpm_muram_lock, flags);
 	list_for_each_entry(tmp, &muram_block_list, head) {
-- 
2.23.0

