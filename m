Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 586081C0CCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:52:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cyxz4pmkzDr68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JbR/WuKG; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CymL1rjtzDrJf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:44:18 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w3so3233430plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w9BJBjduMf+4uiiWGiEJEyr+crEudThA0PFW+uCEMtk=;
 b=JbR/WuKGguzNq7Z9qfboBsZeyuzErHJo/KbuO3DT9lxaAgyMVZFXXGU+NsDGMBhqAM
 avVOPbVXu/9ioen6p8Ru0mUqfD4YoDiiSBgoQCv4qlNMvnxig7y3D/hxaoE7t+bHW9wL
 pqb1G+lzhSLos/KI3KQCzL0qR4r35gyJMencfiusQfEB45pIoL2xw3natdLDR9eIqIkJ
 PMls/G1UEMCb5wqJG9XsbwLsFqC1ptbUNNhULi/gofDNwS3IdZ0JjXmK43Ubj1LZjgm1
 H92KQA27SjHmOcOLU1G4NHRjIYyJXsN3k2kdcFzEgRLlBb24hUd5BrmYb2r4+rRld5My
 LJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w9BJBjduMf+4uiiWGiEJEyr+crEudThA0PFW+uCEMtk=;
 b=ALAuQSggUrPlvTIaLeAq5M86X7jLHr197BzPrySJIb8jR3zZzH8JPmHUzMZbI48Qit
 Hsc1PJNL+bT4fvVo3OJwp/VNq/GZZItkh2Y0uixcZ8sb2YiWGyyX8yIjvsgM2mVzteoR
 Anj78hHowTeQ7u7moOhzt3Hsj4nhrv14oE2iclr5up5QtTE+m66pVZ2JyfVtQme3aX6Q
 o1p1AIODf2taMZf6LseSIrO5kSACQhgxMK6IusNNDc2RX9oqS+kopnaFiAINdwPPKhjx
 AF9yH99p5T4pS1/kRweEVIFMFUQCwanR5RbFPYYmS6EWsQmIHfgvjq4I4V+n44V6KFm0
 hf4w==
X-Gm-Message-State: AGi0PuZRtcHOq4brxBlY6Vv45RmAFjcSUJezosi7tu91InkA0tUKvii+
 3AeStrua4r1eY0bmoNyuRNY/O3ZAmRrtwQ==
X-Google-Smtp-Source: APiQypLTyOdwKD/p+BnEz626CjplgA3rtFa0PGc02cx3jHRVptdmFbovGF9NeVD5UiETIiBpgDTnHw==
X-Received: by 2002:a17:902:d910:: with SMTP id
 c16mr2479947plz.212.1588304654921; 
 Thu, 30 Apr 2020 20:44:14 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:44:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 04/28] powerpc/xmon: Use bitwise calculations
 in_breakpoint_table()
Date: Fri,  1 May 2020 13:41:56 +1000
Message-Id: <20200501034220.8982-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A modulo operation is used for calculating the current offset from a
breakpoint within the breakpoint table. As instruction lengths are
always a power of 2, this can be replaced with a bitwise 'and'. The
current check for word alignment can be replaced with checking that the
lower 2 bits are not set.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: New to series
---
 arch/powerpc/xmon/xmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index bbfea22f4a96..e122f0c8a044 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -857,8 +857,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 	off = nip - (unsigned long) bpt_table;
 	if (off >= sizeof(bpt_table))
 		return NULL;
-	*offp = off % BPT_SIZE;
-	if (*offp != 0 && *offp != 4)
+	*offp = off & (BPT_SIZE - 1);
+	if (off & 3)
 		return NULL;
 	return bpts + (off / BPT_SIZE);
 }
-- 
2.17.1

