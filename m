Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DBD481AB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPh3f2lnLz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:18:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pourZ0bK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pourZ0bK; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPh2x5r3nz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 19:17:27 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id s1so48983201wra.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 00:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=geuEd/JcVeINOoHDxuDR/f+b5PFdApW3RHaOzhYDz4g=;
 b=pourZ0bKL9XPfFz/dG0H1gKSiqKzUvd7BDl1XzO6XAtsHctTIiLIskunz5V8qe3n1z
 kTuR6hOUZHez5KIqbbf9IrKWWkKGgW426b7+6HdgnBF4GLtSiDP8EoxxNbrzE/saR6cs
 0B1G0wyxrXRdCqOKl+2fDOis9F+QxAgvYpyTobEy5Gpm8xQddxrzIsxr9zzebp4Y37z/
 BKfdE2DOBLC7IVsO4tZGf0WZc59YhejjaaSq6KNMx3Iqe8WwJIt2pKDC1aZqb+nedj/x
 gcRfmWokftEvX5Zt10OO07+PTeDTSx1USlI+BlfTqvup4QLOdR48eQVqiZ7TJpHcZter
 iUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=geuEd/JcVeINOoHDxuDR/f+b5PFdApW3RHaOzhYDz4g=;
 b=pHSu8ZUZFeq3eiZZ+vwrfJSB3vtokiX8Dv0r0S9hqJDCFZuR6nZoXZX5xSpfgYaZcx
 fB1JebrFsk/UBqxFkfRKLwPMMDaN4n9wVAEUUfuaT9WnLMB2sFq2l0vuRKegcKubwQtS
 4fpb2IydNZMWaknxhQHaQBxsw/DyhgzNo81ODlZqZI8RYSlWr8wz4IM1JHdbjD9ADNTO
 oavUep5pt5OocwMVruIKKjwPoffMfFaUylgi5rA5JGjc9aRg988BDAb/bKnsUk+33awf
 GVf+dBtUpoeUiNivfRSGF9YVDbOTmattwgGGLcy1ADfQ8/Ru1kI7uaH1R0lTwZUortyx
 lXAQ==
X-Gm-Message-State: AOAM5325V+udsAOXIraKywtSefYcUGitxrXKpP25c5XvaOBjh88nGi6E
 pr4HDvvEB6LFRkN+R0Rk1p0=
X-Google-Smtp-Source: ABdhPJyR7kaVjSgs+djhL3tFHlq05F2u70kbJgoT2AcELMTnDfIQzYICWJaKD3bIoq8xV0fARDl8Yw==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr24161840wrx.49.1640852241270; 
 Thu, 30 Dec 2021 00:17:21 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2626:5600:789b:54e9:fc28:95aa])
 by smtp.gmail.com with ESMTPSA id u12sm22736319wrf.60.2021.12.30.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 00:17:20 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/ptdump: fix conversion to GENERIC_PTDUMP
Date: Thu, 30 Dec 2021 09:17:03 +0100
Message-Id: <20211230081703.31162-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
replaces the use of the powerpc-specific config PPC_DEBUG_WX by the
generic DEBUG_WX. The commit misses the use of PPC_DEBUG_WX in the
function note_prot_wx().

Replace this last occurrence of PPC_DEBUG_WX to complete the conversion.

This issue is identified with the script ./scripts/checkkconfigsymbols.py.

Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/powerpc/mm/ptdump/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 031956d0ee84..be120e09aa3e 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -183,7 +183,7 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
 	pte_t pte = __pte(st->current_flags);
 
-	if (!IS_ENABLED(CONFIG_PPC_DEBUG_WX) || !st->check_wx)
+	if (!IS_ENABLED(CONFIG_DEBUG_WX) || !st->check_wx)
 		return;
 
 	if (!pte_write(pte) || !pte_exec(pte))
-- 
2.17.1

