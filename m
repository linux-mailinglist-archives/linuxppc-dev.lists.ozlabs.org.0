Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8A2D08B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 02:09:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq4vz5kHDzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 12:09:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=szrdLk9d; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq4qm0fY7zDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 12:05:39 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id t7so8141994pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 17:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=19MOUQb0BMVRebWUPI7yFMElkTqYHuhqFHQp5fLnK18=;
 b=szrdLk9dto8W1Ap+D2ZAytdM4rgBoMAqZrNjg451yQ85E9XmGqMcwcPrMj4Ep7CzLq
 yeom5AdBUh2SaQ9SalQEQkI5fUIdqWWbMTIj15D//g074ltRT7KKuY+J9qUr+nequp9Z
 ziZW0eL6ukbfIUoUAkW9vUsgFvvqFDMNgqPvLdOxO6+z1ahFULxMlD8kI1k1tAJASWXp
 1+kutVM16xSDWII4Mb6lR9ejSPRsgvPnGGN1HFqMZ8kEIykIoIeP5UKCjV0QAwONFVzv
 CB2FC0R9FcMCr/sHfNny/z1DvaQTs1zjKKiPKh4VnkEdjmFJWWf2fsgUwUgjuELrPwJE
 6PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=19MOUQb0BMVRebWUPI7yFMElkTqYHuhqFHQp5fLnK18=;
 b=KbGjcEoIWJF1Lk3J9wknV8pWAvNVq54n4w2oXauCiHjAjK/4PgUbHq1Frw5LRVYyZf
 bEvE4eE3oLMZjed4u+KvlJRSpDYOuYzmgSb+bfyyd98wOoVGdzAUBWsnjuxsCTYnDey4
 lcq4MX6BSL0wSnh2BKBtbbUHf+H2QX4e/eyidTdvHCexSpouq0c+hDKGX8xHCOeUGKQ1
 kKpCBA0wkLmHeQOOvNtG7IgrgzTLrIQ+6KHZB5zkf8UCGvSNNbPxLvoz2EJ95r1j31lZ
 hwCn2VsHKdsddBG1sD9eDjPsO2g0YmaAWeo2omkXywN+wlhVKYIjvPwYCmkZ70A8EpTi
 OTWA==
X-Gm-Message-State: AOAM530VxdRjcDJaE19arWak0N3FI32klD3KVkwB2fmTdiexG80FfHxh
 y56JLBtLNaV3ygQhOxSv9Z00GbyO0rM=
X-Google-Smtp-Source: ABdhPJwkZZN2tOcQ01u9g4AUYLP+/5cMuHoe+An+fFMRSj5dTySoC3At7eKkCUbw2qGofVrgzqrEFQ==
X-Received: by 2002:a17:902:bcc2:b029:d8:f4a9:5093 with SMTP id
 o2-20020a170902bcc2b02900d8f4a95093mr13824579pls.83.1607303137210; 
 Sun, 06 Dec 2020 17:05:37 -0800 (PST)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id y27sm1312767pfr.78.2020.12.06.17.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 17:05:36 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/powernv/idle: Restore CIABR after idle for Power9
Date: Mon,  7 Dec 2020 12:05:19 +1100
Message-Id: <20201207010519.15597-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207010519.15597-1-jniethe5@gmail.com>
References: <20201207010519.15597-1-jniethe5@gmail.com>
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

On Power9, CIABR is lost after idle. This means that instruction
breakpoints set by xmon which use CIABR do not work. Fix this by
restoring CIABR after idle.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/platforms/powernv/idle.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 1ed7c5286487..e6f461812856 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -589,6 +589,7 @@ struct p9_sprs {
 	u64 spurr;
 	u64 dscr;
 	u64 wort;
+	u64 ciabr;
 
 	u64 mmcra;
 	u32 mmcr0;
@@ -668,6 +669,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		sprs.spurr	= mfspr(SPRN_SPURR);
 		sprs.dscr	= mfspr(SPRN_DSCR);
 		sprs.wort	= mfspr(SPRN_WORT);
+		sprs.ciabr	= mfspr(SPRN_CIABR);
 
 		sprs.mmcra	= mfspr(SPRN_MMCRA);
 		sprs.mmcr0	= mfspr(SPRN_MMCR0);
@@ -785,6 +787,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	mtspr(SPRN_SPURR,	sprs.spurr);
 	mtspr(SPRN_DSCR,	sprs.dscr);
 	mtspr(SPRN_WORT,	sprs.wort);
+	mtspr(SPRN_CIABR,	sprs.ciabr);
 
 	mtspr(SPRN_MMCRA,	sprs.mmcra);
 	mtspr(SPRN_MMCR0,	sprs.mmcr0);
-- 
2.17.1

