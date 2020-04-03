Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E687B19D87B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:00:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1mL18bdzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:00:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dAkP3otv; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11k5f33zDrcN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:06 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id nu11so2940444pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=dAkP3otvt3Z1ar5kKjqMT7Ic2f2g7VerrMm/dPZIALVTjKBAouORIHMm5mrSO9bdKP
 JywWDQQTk5TfstDYFzkoPaOXfzcCad5yH49MCQwfTdaHKLHR7L3w3GuAP1tIi7yeguTz
 2QfNsFtp0qypEdhjgespkE5eqJgpk5cMMSxvK6LmLIJq6C5RG9QTJnbuq+fQDZVVepVj
 fqPYvg/U/QxYoXbzwNjEzqCZm4zX+bQQTJlj0tMKqYWo+r6S6GYORcFp5roS6sJTMC0r
 Q5oEYVbmR9wA7YJd48za5w9zyl6hbKPeHnzDs8ZgFv/ZuqAYfyLCEOv2CHCaRGPLkcnN
 Jyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=PVNi7/ijnVneW2CZ4bI/5Cim/9ETpI6P2u+T5uLK4FROLY3lzPnHSvc36Vzory4w5B
 mBTCsYHiijoU8fWDNROnz15M4+vgQv5xYrsa/qgJzmkPQ0oiud12oAvly/F0U00HTNkN
 Zplhk3pnPBsKtTfWFEgpfSEfZHDNUfapIseZYf8IiaGnuG9zBsqMFsrn/lW+w5+PE7wB
 QAIXfws+rBU3xdmo9POzqhnmikY0UGkvdyZfZHtoy+JoYksyVqSVqTtqFrI/RUgFLF9D
 4FtFo+5papc3T65KbmRtNQpn7cR89x5RrNgqGQW9v7CM/6/8li/t3OOkaSsrwE9/A7Aa
 kiOA==
X-Gm-Message-State: AGi0PubICN4pGy+dtEnoBkjdg++ppVLPd+7znQuwxy+R0618mH66mIJF
 DQc82T6qT2/bQ4rrIIOfmsVT+FMM
X-Google-Smtp-Source: APiQypID6AuEcXr5/3iR92gIU/OYs9Hh8/HYd0jiEXb22/+M8j/6S82ZPoF+9eaomV59xJnT1kgfZQ==
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr7786822plm.306.1585920424082; 
 Fri, 03 Apr 2020 06:27:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/14] powerpc/pseries/ras: fwnmi avoid modifying r3 in
 error case
Date: Fri,  3 Apr 2020 23:26:15 +1000
Message-Id: <20200403132622.130394-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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

