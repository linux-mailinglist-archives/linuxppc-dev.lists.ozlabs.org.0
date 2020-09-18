Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895026F96C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:38:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt80d3PhXzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:38:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EnDmYO0S; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7r26SDGzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:14 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id u3so2720207pjr.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvmSZm2nrBOf1qBTVk3t5DDPFfNqHoAcR6KPUrlAhkU=;
 b=EnDmYO0SWBi20oYP5/87nw7eFc8jLZlwxzz8hAW/1I4R7bKLQqFE2pavl794kmBxbX
 LZcTZ3qOrAwSyjzBcPZoBYQQoVVA5HcbvTHNOlVWiYac+6VonaHZOwRbfqoeegeYx4Ov
 SF0+E6Yyn+q+6injjL26hjzTZk5yJ7aNaLkvsCln8VjsrYIfot5Z7fjVImtcDPOuYsgf
 9HmJq6Kz3/fLgvGqhcHauo4qqj6+HOszsykHmppVE6ouD88HODr9NjVqCi5X4UM7dIBy
 Qq+jeBd21m1t71vupXUd+JUVyce94jqHv7YmtU70SsWa5CFW064JWlfX1YTnrE3+LLQq
 qtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvmSZm2nrBOf1qBTVk3t5DDPFfNqHoAcR6KPUrlAhkU=;
 b=t7NYJFciW3ecG3zJL9bygdvE04m231QiNyD6+iSdv/latZsbEyDvb/7zjTtWFo8mqn
 h0JJwEw70SxyKntxlUdj5YvcEx1rfZVd/56sy57oJxGMC0Mi9cNi5mW56n8bPffF6GzU
 3wxGA07ItN5KiX1G8LRGwSYInrqBKdwhp64kon4Sz6r8fYfJlqBb3C526efLmxAjWrBe
 LbZR3Jzu5FTGQpnx7ejPoOWNPO5eYpSX59dsNhrb1mbS78itGoiBRE+eGMAlxVJ/hjtP
 GaoOFcew+s4yUQXKeedw1ZpSp93+3ilF+4VoK0UlZPUIFMiodf/fs43xnGbDSCVUNVpd
 v3ZQ==
X-Gm-Message-State: AOAM532jkinx2sBsU0AurVIaUZQklsaXxnUnTjJUsMNoPQ5Y76HrBlG2
 2+HvHkHV+AmgxKcXHJi1DB8XzEdAyOVYFA==
X-Google-Smtp-Source: ABdhPJw8pgqZxMaMy3FXc1dxypLM3oWjW57BPIAt6TAOYBKpxPTAdKjKrfIdQJSgqtN5SW4/iDtwQg==
X-Received: by 2002:a17:902:d88e:b029:d0:89f4:6222 with SMTP id
 b14-20020a170902d88eb02900d089f46222mr32435048plz.10.1600421469872; 
 Fri, 18 Sep 2020 02:31:09 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/9] powerpc/eeh: Delete eeh_ops->init
Date: Fri, 18 Sep 2020 19:30:45 +1000
Message-Id: <20200918093050.37344-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918093050.37344-1-oohall@gmail.com>
References: <20200918093050.37344-1-oohall@gmail.com>
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

No longer used since the platforms perform their EEH initialisation before
calling eeh_init().

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h | 1 -
 arch/powerpc/kernel/eeh.c      | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 765bcf63edea..85030c05e67e 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -216,7 +216,6 @@ enum {
 
 struct eeh_ops {
 	char *name;
-	int (*init)(void);
 	struct eeh_dev *(*probe)(struct pci_dev *pdev);
 	int (*set_option)(struct eeh_pe *pe, int option);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 28a0ea5d9faa..98faf139e676 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -965,14 +965,6 @@ int eeh_init(struct eeh_ops *ops)
 		return ret;
 	}
 
-	if (eeh_ops->init)
-		ret = eeh_ops->init();
-	if (ret) {
-		pr_warn("%s: platform EEH init failed (%d)\n",
-			__func__, ret);
-		return ret;
-	}
-
 	/* Initialize PHB PEs */
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
 		eeh_phb_pe_create(hose);
-- 
2.26.2

