Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B0651E90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 11:14:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbsr91jGlz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nLDU6NbS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nLDU6NbS;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbsqB3fxWz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 21:13:40 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id l4so489309pld.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 02:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKWuiWJK1VUk2sx6mP2owWmQ2TcPLqUMaM1CIaK+WNw=;
        b=nLDU6NbS02qEIso3O1llT91Th+xwxyVdcHH2xvwS0nKtaCIC3aKIRU0gvRLlHrwcrp
         rQWK1qO4+yi4InODdFkoT4N2zxGnR5jB3KqWNMAuR5lAySOK2i0kF0aoRDMZx2U0n3u9
         c280ebDXDKhr5j4NquUcsv9m8DITxInf2uHg7fLm+J43GDizKZ/osz7IPEe6uzAPldkA
         z6ggB8hlDUFI/eQQ9kSLBLe/HMv6aD93gam8WZ0q3gtGMWD3RB879WYaztX4lBh29MJD
         yCcbjDPvshDsw+kAWLY8jZDXJDX10jtecZKycQAL/0gBEfEnuxF0pxr/2qflwMm8LPSY
         cH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKWuiWJK1VUk2sx6mP2owWmQ2TcPLqUMaM1CIaK+WNw=;
        b=plO2g1Osk2RCQEEh9D12ffiqKaOssMoXIRXXpRXpRD6visO0cSJSwFtRzv1wclBw93
         rbUt1owq1szWL1xr0QVK1XvpuoHlJU1pAnZGzWnYj+goyTKnGozeSe2+c1ERtB0q2Lps
         hFXczahl9+cTwwH5DwrEIcuDPlFQGxCZP6dVEKrk0h7Lqm6fWE/jOD/+dfNf7zSgqees
         kbzvpX+gEiAwdZ/9R78sT0kmNsv7lC8x3VawgcOoee2xUXfqfRRC6U7JcD7whGIq30R+
         4/0sr/rBfLiCud/OGRQWyEq66PfIHrUHcXD6Dzx5oNr/tly79FBLOC+uL/O3l439DpI9
         4QIg==
X-Gm-Message-State: ANoB5pnfnaoLsyG2spkjSYjL9t/2giLY3KkU0rMEV2G2uE8NQbid2MzO
	Qji4bfivv0IK5i6WAcj5rUy3VlfVM34=
X-Google-Smtp-Source: AA0mqf7Np0s/2XeR23VVVqkPaORBn/PV5YYEGpKvssPmLDbdOtBhOfylLp1que/1ewEJPRQ5FWJ28Q==
X-Received: by 2002:a17:90a:6be6:b0:219:34cb:476c with SMTP id w93-20020a17090a6be600b0021934cb476cmr48632133pjj.9.1671531217733;
        Tue, 20 Dec 2022 02:13:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (203-219-149-28.tpgi.com.au. [203.219.149.28])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a694300b002190eabb890sm10766225pjm.25.2022.12.20.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 02:13:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH] tools/objtool: tolerate STT_NOTYPE symbols at end of section
Date: Tue, 20 Dec 2022 20:13:23 +1000
Message-Id: <20221220101323.3119939-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hand-written asm often contains non-function symbols in executable
sections. _end symbols for finding the size of instruction blocks
for runtime processing is one such usage.

optprobe_template_end is one example that causes the warning:

  objtool: optprobe_template_end(): can't find starting instruction

This is because the symbol happens to be at the end of the file (and
therefore end of a section in the object file).

So ignore end-of-section STT_NOTYPE symbols instead of bailing out
because an instruction can't be found. While we're here, add a more
descriptive warning for STT_FUNC symbols found at the end of a
section.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tools/objtool/check.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4350be739f4f..4b7c8b33069e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -427,6 +427,15 @@ static int decode_instructions(struct objtool_file *file)
 			if (func->type != STT_NOTYPE && func->type != STT_FUNC)
 				continue;
 
+			if (func->offset == sec->sh.sh_size) {
+				/* Heuristic: likely an "end" symbol */
+				if (func->type == STT_NOTYPE)
+					continue;
+				WARN("%s(): STT_FUNC at end of section",
+				     func->name);
+				return -1;
+			}
+
 			if (func->return_thunk || func->alias != func)
 				continue;
 
-- 
2.37.2

