Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E133A1A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:48:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HpZp6rX6zDqR3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=paweldembicki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7C/10lL"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hgnq4B1KzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 02:42:19 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id h11so16909635ljb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxdsJUzrzirDV9SoFUmfun9q9AXOSWclIRGIX2baL2Y=;
 b=N7C/10lLvMRhc2gCSkGs8QaF+cwD/Qcw7BW0cuFy6wQsDwPxn8AmDJJUuIvTaSjEXg
 SuzZSrENjfTHUoDrJ6gD+eOIU3cpI6oqUldqD9gs2uNz8p7DQdwOTjAg+JMH/x601m7H
 Esxj/dVD0a+fnLHEKWjDWxB9FvUVdOvgv8KqwpaScBTvTAbmRS3azMY3CwiT4OWn4i6Y
 dWBL2iKbD9fISePhoUn07PDTAFHu94rMZVQ+81cO+p8GrIJhU6lTdQO7ywMxlzLHz6vS
 cuTS+gGOJOMt2YW8aJavsWZNikY7/5MZY90WYuuJip/QPnSi9RebnPJjk6zKZH75y4Fb
 3Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxdsJUzrzirDV9SoFUmfun9q9AXOSWclIRGIX2baL2Y=;
 b=NFdSSf2EYaQimrAfyZeweiu5rbzUCv5BwujmJbQFIbpaB9HKBsh9yab9eDD8p3c+tY
 ZMUVXXQVbbmO2B7hCFOkIIbMfwnLCcG/Mv0OHP0JgOa0xYFkIBwtvmta/cLKUHTB/r2y
 LxlxwiRsDl4d5ODB9KZshfAMXtgFl70956B03ekbJdJAPU9xIBc4L7ADsGb9G1ycCGrx
 OCe0hpWW5Uyh4cxAZ5ntk5kdaCRB0Lv2zIhRircSTMtOZR2tHYB+ncjDmwPCYXOGRK7u
 4isWbBwj9r2B9kZErDJcXGtmUhHme78vRg+CwmRJFCjb/cC1DCXIQVSwumCs5fAPWzwX
 yqTg==
X-Gm-Message-State: APjAAAXYBNzNQW+8//M+UiIB8MlXbnYkTgeu104eA28OCKBB7ZERDtgZ
 q/pEN2RShYEPUID5EVeaa5Q=
X-Google-Smtp-Source: APXvYqxXFTRtKG8W/wE7vPy3gcwzNZsFCLLCuA9ttno3xoT+sqGIVtk64GC8X0e7QSJHyfZsXHThsg==
X-Received: by 2002:a2e:4256:: with SMTP id p83mr14154095lja.201.1559580135602; 
 Mon, 03 Jun 2019 09:42:15 -0700 (PDT)
Received: from krolik-desktop.lan ([91.238.216.6])
 by smtp.gmail.com with ESMTPSA id d5sm3251109lji.85.2019.06.03.09.42.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 09:42:15 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: 
Subject: [PATCH] powerpc: Enable kernel XZ compression option on PPC_85xx
Date: Mon,  3 Jun 2019 18:41:14 +0200
Message-Id: <20190603164115.27471-1-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:45:39 +1000
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
Cc: Christian Lamparter <chunkeey@gmail.com>, linux-kernel@vger.kernel.org,
 Pawel Dembicki <paweldembicki@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable kernel XZ compression option on PPC_85xx. Tested with
simpleImage on TP-Link TL-WDR4900 (Freescale P1014 processor).

Suggested-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..daf4cb968922 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -196,7 +196,7 @@ config PPC
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_KERNEL_GZIP
-	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
+	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x || PPC_85xx
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-- 
2.20.1

