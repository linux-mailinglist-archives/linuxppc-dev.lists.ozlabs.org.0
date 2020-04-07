Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBC1A069A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:33:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGJq3JPszDqwp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:32:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=alikL2Ac; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0H0t1GzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b72so253227pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzGgbHCt6e1nrOseXLAjl+lrG2sd3AGSgQgkA9L7r3Q=;
 b=alikL2AcQqCbkfRM9Vbrs4A8/NhtHm1ax1MulN81LdaNHYoMh+8KUZ3tu9hERP3+Eg
 JUTNHvAD+0tQrjbFSrki/guiLc6Kh2ezBVwBHnyiSG0ESIQAuZhKWMLjn0rkwdFPE2E8
 xomAWSwUNQJDmQ5CauzD9Q8RjFekSQz7QjL1Jqitn/0qZg4ecfOOZ+oK8wXvV7FwtUqe
 MugX7AEMEZOzPY0SCXPQXYQbx7MN7S2zcoaqyHrN1naZL+NFRNg5UY1d4vJa92Jf4Iz7
 GJMD2JQH9owUoIzgqutTMVQrRtF+1SsWw7ElrUbeyAVQ8mMcBFEHC8ZczSbz0Annc7Qj
 WflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzGgbHCt6e1nrOseXLAjl+lrG2sd3AGSgQgkA9L7r3Q=;
 b=BUhkMI7KRIs7QE5b6No6pQP5ODmliFURiXf3TD8f5HXDNshrZeidwVwdyy51ZZzj46
 rUd+Y7AQ7f82BTmmmSL40CyAkXNNVrTV4EgnXm9iQ0M6sxRBHvxsRqHaKNACXLcV5j3e
 rVHAGS8aeHV1fofEPogcBYXe92ZnOVNtBVFmwO/S2h0F77AN+yoUtsF55/1YqnIf2G3R
 UX+y9cOO3gx6PmPv/mhN7Cvdv+/tuBwiy7DRWlZFRNrlD/nyVlZGNVUdbpbPKvcsFuDF
 /e2IgJcNTYFvFMaYhZW+RhsJjrj83wlypOiZX+CdNOaVk1TJwxfKcCKecfa+GCj+CuN3
 W7GA==
X-Gm-Message-State: AGi0PuZoCr2rGPFMnqNFY0gZhRrx+JuWf7j1cew+0i+5fFyQU9qO3oOx
 CQrxvul4ehJhln2TaQkNOBe5k0l5
X-Google-Smtp-Source: APiQypLWMZvwSMPVu/vHqqau6s2ywhOzlNgM3R+4ik0GWUJzhJhu9LRhAO9P3uAzXQbOHFhf9QNmZw==
X-Received: by 2002:aa7:984e:: with SMTP id n14mr893019pfq.291.1586236715925; 
 Mon, 06 Apr 2020 22:18:35 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/15] powerpc/pseries/ras: fwnmi avoid modifying r3 in
 error case
Date: Tue,  7 Apr 2020 15:16:28 +1000
Message-Id: <20200407051636.648369-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
index ed43c2e4d4ee..2c60e2be1bc5 100644
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

