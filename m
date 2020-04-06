Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002119F1D5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:51:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkmG5ZfczDrBl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KVGDqPtx; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjst2rcpzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:11:14 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d17so7195609pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dDBXGVku/MFvetM4oCvsO4ISB4KeIoxSgWDtUQwf8oo=;
 b=KVGDqPtxJLlZqwmYKUsb3BebraHNI09GhjMXY8mnmPeWsMkYw022dzLk1XkrNZzH2i
 7yzT7VAR2ot/mWBXcBSi3bPROX/TJvOvAquj4/jRkvblOL/31M6LrLeVc4VBt1QPOH0Q
 taYegWpxSA+qnAYIPJ9jWktm2UBvGblmYT1Ywok518MONO3q2AYCvx6QtkkNcv9iGAV2
 YWJTVMQFI/5B3+aZrTcNxw/islgCeLdS9WDFIgWj6fNVdeuNY6+e2XxSvZvPzOuHGy8r
 03bya2Opq/zKugrAcmOdNGXQn9T/O8ZquN7HQSnlhhsRO5qgz5Z9j1yDrXQEqCjzfm/t
 Qimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dDBXGVku/MFvetM4oCvsO4ISB4KeIoxSgWDtUQwf8oo=;
 b=B/Gr8gaZT8Na0HlROPJFCgK4gk5OVAEaD042dMKDDhqORIZTmwfEf9bOXWF4vI3l+b
 2WRjHZXqcXu5nw60k+8nLLz5bzuQIKE7uVvT/Lj9ZHoeK5exvtVKek4DeR9LuNOQxyUC
 p9t45gSeAAWK0fGxq+b4atWgBVFCWb318nJ7wvjVW4mVsKu+3SoXKvNs+g8I0f1JlJzT
 pzZP6XIqSV0GsoPFYMZ0Ankl1S6keQU/w+KzZXYEdGlFuy6dsJKY3LlxIAauLCwuim/C
 a7vdRaBh48ebzyGuQi2cmdkA3O/n9WFdfCEdCb3N3/+2j18n0ou3PqLbG7D2DLAgoEz6
 +i2A==
X-Gm-Message-State: AGi0PuYmt/n7vZPCOAfJMM/Osu4Tav/bEmqTTPYyvPujkl+c5JEkUUUF
 BTGUpeWgmgODkBRSkUiua+aeVCySAwg=
X-Google-Smtp-Source: APiQypKE25SGcewlYAyJQ4Uv9tMbhNMJ4h8M2xeOvI4E7xxPIhOSph6pAVkJ0baDqNIf05e3YmjGoA==
X-Received: by 2002:a63:ba1d:: with SMTP id k29mr20117006pgf.413.1586160672138; 
 Mon, 06 Apr 2020 01:11:12 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:11:11 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 21/21] powerpc sstep: Add support for prefixed fixed-point
 arithmetic
Date: Mon,  6 Apr 2020 18:09:36 +1000
Message-Id: <20200406080936.7180-22-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds emulation support for the following prefixed Fixed-Point
Arithmetic instructions:
  * Prefixed Add Immediate (paddi)

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3: Since we moved the prefixed loads/stores into the load/store switch
statement it no longer makes sense to have paddi in there, so move it
out.
---
 arch/powerpc/lib/sstep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 8b6aee0ee636..eb24dbfc051a 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1335,6 +1335,26 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	switch (opcode) {
 #ifdef __powerpc64__
+	case 1:
+		prefix_r = word & (1ul << 20);
+		ra = (suffix >> 16) & 0x1f;
+		rd = (suffix >> 21) & 0x1f;
+		op->reg = rd;
+		op->val = regs->gpr[rd];
+		suffixopcode = suffix >> 26;
+		prefixtype = (word >> 24) & 0x3;
+		switch (prefixtype) {
+		case 2:
+			if (prefix_r && ra)
+				return 0;
+			switch (suffixopcode) {
+			case 14:	/* paddi */
+				op->type = COMPUTE | PREFIXED;
+				op->val = mlsd_8lsd_ea(word, suffix, regs);
+				goto compute_done;
+			}
+		}
+		break;
 	case 2:		/* tdi */
 		if (rd & trap_compare(regs->gpr[ra], (short) word))
 			goto trap;
-- 
2.17.1

