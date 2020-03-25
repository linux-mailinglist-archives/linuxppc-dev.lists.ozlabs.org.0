Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC019261D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:49:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPxn6jGVzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oegKBQsw; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdT1PtszDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:09 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i13so857953pfe.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=oegKBQswDcGCZ5OiKMU1d24OmLSSS/ie8KjlR6oDKHJHHruoJ/Pu6Ra64ZhBiDH9Gw
 RpddJIYIOrWSBi+sDVOlD5ohQpaS0kxv0J+enuSWPMLCWq+MFDb9DEytEXx/eIZr5lxq
 UzPRCOFznsR0f1/TIeiFa4acqTfwGN+m7Q3jYGKYjfvhCCbt9Ay3KUHtVqdJWokoFoLe
 YpvJngAtgBQIzLJhthzAUymR41xWwUSvIeviONa/olptD4JQrE2M7Lc9562QHzzkLkEA
 Ks4ADmS8xd3obKmXHzXjvgtVQ/YzOmp3qI67Ykr4jHMQ/Z6Ol8DqplnD53+j8b/A3WRF
 YCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=jpdR9+W4lHPBt+aelyozL2OP5OSpw9yubZNqEgk7IQZNP+Gx38SWpNJp4F716w6f1d
 QbBZuGnz7WapDLQblX9ukKMMGxMXN40b4PcSr/pv2bVaRdnHKzPUVf2N5D+IB7JbZQhv
 jSjXGcxATLf1fSRGisHgjf88pe0hCNUa4doqffoorE/aFgtOsMZSacBw5lrvyEJqqflp
 kCe9wXLfCp7kogAmVD+D3805E61MzU6cxBVnZOQjNFJ9cIc3G8KVqep0iv/WIfsJbYh0
 71hMU4TqEj/sD4FDXyEGDwgdB7VxNbV7r9UMuZ5EjtWMdQ2ULs03TPH5bFDKeE3CkvPO
 9AMQ==
X-Gm-Message-State: ANhLgQ0yfjPLCAGgwRUB1GThfTn1jZCnP6FR4shp52YoBx2u/b/fghir
 r1cqC6CSDAa5OJmGq5qqAS48axEB
X-Google-Smtp-Source: ADFU+vvCK+XKVJIJ9eosBmTLC2fPiWV7XL+H+vTN4CHCxcPsFdGxDlhz9h/wOWpBMx6YJg7qU9MkLg==
X-Received: by 2002:a63:a51e:: with SMTP id n30mr2498357pgf.414.1585132506524; 
 Wed, 25 Mar 2020 03:35:06 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/12] powerpc/pseries/ras: fwnmi avoid modifying r3 in
 error case
Date: Wed, 25 Mar 2020 20:34:04 +1000
Message-Id: <20200325103410.157573-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If there is some error with the fwnmi save area, r3 has already been
modified which doesn't help with debugging.

Only update r3 when to restore the saved value.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/ras.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 9a37bda47468..a40598e6e525 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -423,18 +423,19 @@ static inline struct rtas_error_log *fwnmi_get_errlog(void)
  */
 static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
 {
+	unsigned long savep_ra;
 	unsigned long *savep;
 	struct rtas_error_log *h;
 
 	/* Mask top two bits */
-	regs->gpr[3] &= ~(0x3UL << 62);
+	savep_ra = regs->gpr[3] & ~(0x3UL << 62);
 
-	if (!VALID_FWNMI_BUFFER(regs->gpr[3])) {
+	if (!VALID_FWNMI_BUFFER(savep_ra)) {
 		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
 		return NULL;
 	}
 
-	savep = __va(regs->gpr[3]);
+	savep = __va(savep_ra);
 	regs->gpr[3] = be64_to_cpu(savep[0]);	/* restore original r3 */
 
 	h = (struct rtas_error_log *)&savep[1];
-- 
2.23.0

