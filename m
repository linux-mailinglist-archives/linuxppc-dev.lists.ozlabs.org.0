Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C73FFA6F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 08:34:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H17L30C5zz2xr2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 16:34:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=jQ4oB/br;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=jQ4oB/br; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H17KM6lr1z2xff
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 16:33:25 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 8so4612221pga.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Sep 2021 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS+YXfe9u/TEXYOp2DOJCIAMmL6l7j1IqPe1xSf5Bgo=;
 b=jQ4oB/brC30RET/uk48tH0axrasHsomZbuXvokW23VVc14NelDVtNe9iWD+Pk67Zb7
 hIUp4D8isSzJC0raOnJ2sgZMY0X27E2gQV7iyj+8H0g8vHGVlpq2IuaMl8EL/nImjn/8
 TGMHsYWSKK0PRmnkIEyXfcbq2m09id7BLe8Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uS+YXfe9u/TEXYOp2DOJCIAMmL6l7j1IqPe1xSf5Bgo=;
 b=V0U7yhevFB4C+AvjBCzouS22t3N02ct/Yr14eyHe7RhX9w+jS9agdbKPmBWZCTUktP
 XNO41K74ky2FzXpI1c4AbYqCoUmMkRYnNeuTvCDn6CJAoiYhN2+1UlG740kU50rl6Cap
 nAaZuPSI8xavqZO5CcLuvGoisc31ay8hVFRKP1Hl7RSGh1NPCAmJvZUfBq2UBrIdRSQU
 VTq7vQx5mrBYXkQnDgGppdbbp1/D1VADolaJheUVSbXSse7WN7YKcKqiw/MHMWNVKFLt
 9Ihz+2CONS6gBbU9leKLcA9w4TlQFfBV5zfnFAY2H2G7ismPu9uzAoYR1xbVY/Xc6Lm9
 J1eQ==
X-Gm-Message-State: AOAM532B4S4T7N60TNaKSjKlDT0mgF3AFW799Uf/Vg8Wcdnp5wwjzfpo
 9i7w0yOE0//t0NtLbVLrQIcGKiI6icbydQ==
X-Google-Smtp-Source: ABdhPJwnmuTtceVCUijiJojZ8WwDe8tu3YDD6xi8EO+0OZlAOJ3H//w9niJ7CEFW+gJvKEGLPrIFug==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr2204877pgx.177.1630650802067; 
 Thu, 02 Sep 2021 23:33:22 -0700 (PDT)
Received: from linkitivity.lan ([2001:4479:e200:df00:ddd7:1b3:9327:fcf5])
 by smtp.gmail.com with ESMTPSA id b20sm3744102pfl.9.2021.09.02.23.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 23:33:20 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Remove unused prototype for of_show_percpuinfo
Date: Fri,  3 Sep 2021 16:32:46 +1000
Message-Id: <20210903063246.70691-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 6d7f58b04d82 ("[PATCH] powerpc: Some minor cleanups to setup_32.c")
removed of_show_percpuinfo but didn't remove the prototype.

Remove it.

Fixes: 6d7f58b04d82 ("[PATCH] powerpc: Some minor cleanups to setup_32.c")
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/platforms/powermac/pmac.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/pmac.h b/arch/powerpc/platforms/powermac/pmac.h
index 0d715db434dc..29d2036dcc9d 100644
--- a/arch/powerpc/platforms/powermac/pmac.h
+++ b/arch/powerpc/platforms/powermac/pmac.h
@@ -27,7 +27,6 @@ extern void pmac_nvram_update(void);
 extern unsigned char pmac_nvram_read_byte(int addr);
 extern void pmac_nvram_write_byte(int addr, unsigned char val);
 extern void pmac_pcibios_after_init(void);
-extern int of_show_percpuinfo(struct seq_file *m, int i);
 
 extern void pmac_setup_pci_dma(void);
 extern void pmac_check_ht_link(void);
-- 
2.25.1

