Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B0187BF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 10:20:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hSMW5G6NzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:20:55 +1100 (AEDT)
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
 header.s=20161025 header.b=qBbspeyE; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hS7d30f5zDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 20:10:37 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so10228902pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=qBbspeyErzhzcjyKqJH9Y/1cvS28D/yt/f0jSCOmmfyGa+XeafaK30VAZIzR59fhde
 EKnMoPLFcWRfiPxIZBCVsGbxUF6UsFtHfjDSDpaztHvMkVhFsTm7vQ7BfE+qCMC+25Vi
 9gF7XjBSzMwzsSOOyvvCgtuuMuj7GPRxfgdKzzQpFP9V7ZHutgVP6LZS9l1aWANeXzQI
 hxiVqaOTt+ispEYyxYjHz4OopsuL+ppQ0+uxmgBKpYLdnHuJUkgDXfbFFT2rYwKFN29u
 C8FJ+V93JApdhTf+r90W7EIVN+YT+AznLIPbs+AjOHJz88umBk38BPPCLby7RHlJS5tB
 BcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIQfjMq+C2jUbP9ScwG0NM6KSCSOR34SFi5O3FOeAcI=;
 b=V2RD3ae6UH1bimNk5B5LQf02/iyxOAZ8Ee6/t47Hu2KVAuuLq2W7V/tMr6HrwYeAPX
 vAOsda9ShIZV0F1i+9z2jbkvj3+BmhL9nnEQC9es9a25oik7XKXgasN4YTjVtR9B75Gr
 YDiMJKwvwtj+58opBRT77A1y9vskyNrtRdM74jfWxE3mPsWHp7T2mBuIHVNCffo46zY5
 TTzJB+yNApGDcqu6Tn4mKs25aK9oSIaIQauQw2bFw/I7WQsEdY/D3asG0uYWT1UuJkHr
 kxKHxQYtnq7GvA2B4rCqq1B/E6rwEq0hp4WEH9zxy9X+G+36gLBiBD04bIq13EUkI7qg
 c2dA==
X-Gm-Message-State: ANhLgQ0vnVcW03C/T+evJfiiU++LTaGeQ3pZ0LlbVKvLKrkY2eDkWHT6
 dvPDDh7sbBlBQ5Y775OOXdM2iuB4
X-Google-Smtp-Source: ADFU+vsjhoX3k1p1AZtqDaDAQ55bey4cQqiJZVXmrb6+q7Mz1+StwNReWrinGK8FSBV7aKaaYIYo/w==
X-Received: by 2002:a17:902:b285:: with SMTP id
 u5mr3329893plr.208.1584436233907; 
 Tue, 17 Mar 2020 02:10:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i13sm2463745pfd.180.2020.03.17.02.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:10:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] powerpc/pseries/ras: fwnmi avoid modifying r3 in error
 case
Date: Tue, 17 Mar 2020 19:09:12 +1000
Message-Id: <20200317090913.343097-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317090913.343097-1-npiggin@gmail.com>
References: <20200317090913.343097-1-npiggin@gmail.com>
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

