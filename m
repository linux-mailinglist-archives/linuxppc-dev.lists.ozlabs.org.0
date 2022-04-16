Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FA503213
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 02:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KgDt95zlHz3by6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 10:42:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KaItwtfz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KaItwtfz; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KgDrp6P3mz301s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 10:40:58 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id be5so8196521plb.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 17:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/yp2SiPCDYhZ9QJZ/VkI3pUZmOOKH2y3TvYwr4r/ZY=;
 b=KaItwtfz20xnWMtNTiOqG2T72TphlDwszWNLq4pqt1Jy2NZGmz4xPEv7EjGhIFMi2E
 F9OgIDcC54Zx2zt/Hc+cI8xZuyo5DfmMAdWKoggxKdi7cqSaPSSOvQeZo4IkNe6FZqjW
 766dPYHxy1CDcGyaM/Z80nLgd+sTo05wF5k6mWrg8+8FRzyf7bZpXhpKU1TmqG2iAc+T
 trXclf97t/OX+AuOY1U0xx/4aO1cfsSbMRR8jpD1VLLVDXr57cYQeftuyZwU7l5NQ2uC
 mmuQdoTbb24IrxRsmtippfaiePCKwvbxgOuSPIEYDge1N3I/qm3TPyMI9RYvYE1jdoL9
 d4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C/yp2SiPCDYhZ9QJZ/VkI3pUZmOOKH2y3TvYwr4r/ZY=;
 b=Ah8JH8+kikneiZukBw5DqZ+Mn4JLjbh9ihVMqLbdRE7Ho+fSWpBgU6oDybU0tSRWb5
 kBMu3xaS9CkpeNXUW8TQCZoWRd0RxpSx7Gpel58n91Y1AyUbtaGY76Z9VfEP/w7qJP3C
 lGGzmzByIFWGEhcDGhjrG6TNNgZ8L/mlNKLVosZnmLRwD2ASjYqYGhd+lYe6SPbVtiHp
 vMWlZhJir2sF2bnVIP3TyYztjElYShPuUwzsZRViVA7kcslJz4+pEPBMTNMuVbnMg3xI
 YQll6/cbzNr+J9MgaWLk8ra5HpyhuMnZZTGYuEk3paobaejJzoXorTqXwQEVBI8eR43a
 9D1Q==
X-Gm-Message-State: AOAM531GL+X0stYbAcx9j1LAep49N3pXWEqCxKz9jlVgt+q7qgw74ZMZ
 Ic2ObHg0Qw7X733EJCgdeso=
X-Google-Smtp-Source: ABdhPJzsACZqcMn+IVHVYYnMsaYkZAQYl/1YN2wyFMIwCE7NodBJ76t90Djj26qvoMib2GCP1YQ1Lg==
X-Received: by 2002:a17:902:7884:b0:158:b5b6:572c with SMTP id
 q4-20020a170902788400b00158b5b6572cmr1452146pll.144.1650069656404; 
 Fri, 15 Apr 2022 17:40:56 -0700 (PDT)
Received: from balhae.roam.corp.google.com
 ([2607:fb90:461:36d2:dba1:7530:2cda:19b1])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm3913537pfu.82.2022.04.15.17.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:40:55 -0700 (PDT)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ian Rogers <irogers@google.com>, Michael Petlan <mpetlan@redhat.com>
Subject: [PATCH 1/3] perf symbol: Pass is_kallsyms to symbols__fixup_end()
Date: Fri, 15 Apr 2022 17:40:46 -0700
Message-Id: <20220416004048.1514900-2-namhyung@kernel.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220416004048.1514900-1-namhyung@kernel.org>
References: <20220416004048.1514900-1-namhyung@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 Song Liu <songliubraving@fb.com>, linuxppc-dev@lists.ozlabs.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The symbol fixup is necessary for symbols in kallsyms since they don't
have size info.  So we use the next symbol's address to calculate the
size.  Now it's also used for user binaries because sometimes they
miss size for hand-written asm functions.

There's a arch-specific function to handle kallsyms differently but
currently it cannot distinguish kallsyms from others.  Pass this
information explicitly to handle it properly.  Note that those arch
functions will be moved to the generic function so I didn't added it
to the arch-functions.

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/symbol-elf.c | 2 +-
 tools/perf/util/symbol.c     | 7 ++++---
 tools/perf/util/symbol.h     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 31cd59a2b66e..ecd377938eea 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1290,7 +1290,7 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
 	 * For misannotated, zeroed, ASM function sizes.
 	 */
 	if (nr > 0) {
-		symbols__fixup_end(&dso->symbols);
+		symbols__fixup_end(&dso->symbols, false);
 		symbols__fixup_duplicate(&dso->symbols);
 		if (kmap) {
 			/*
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index dea0fc495185..1b85cc1422a9 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -217,7 +217,8 @@ void symbols__fixup_duplicate(struct rb_root_cached *symbols)
 	}
 }
 
-void symbols__fixup_end(struct rb_root_cached *symbols)
+void symbols__fixup_end(struct rb_root_cached *symbols,
+			bool is_kallsyms __maybe_unused)
 {
 	struct rb_node *nd, *prevnd = rb_first_cached(symbols);
 	struct symbol *curr, *prev;
@@ -1467,7 +1468,7 @@ int __dso__load_kallsyms(struct dso *dso, const char *filename,
 	if (kallsyms__delta(kmap, filename, &delta))
 		return -1;
 
-	symbols__fixup_end(&dso->symbols);
+	symbols__fixup_end(&dso->symbols, true);
 	symbols__fixup_duplicate(&dso->symbols);
 
 	if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
@@ -1659,7 +1660,7 @@ int dso__load_bfd_symbols(struct dso *dso, const char *debugfile)
 #undef bfd_asymbol_section
 #endif
 
-	symbols__fixup_end(&dso->symbols);
+	symbols__fixup_end(&dso->symbols, false);
 	symbols__fixup_duplicate(&dso->symbols);
 	dso->adjust_symbols = 1;
 
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index fbf866d82dcc..5fcdd1f94c56 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -203,7 +203,7 @@ void __symbols__insert(struct rb_root_cached *symbols, struct symbol *sym,
 		       bool kernel);
 void symbols__insert(struct rb_root_cached *symbols, struct symbol *sym);
 void symbols__fixup_duplicate(struct rb_root_cached *symbols);
-void symbols__fixup_end(struct rb_root_cached *symbols);
+void symbols__fixup_end(struct rb_root_cached *symbols, bool is_kallsyms);
 void maps__fixup_end(struct maps *maps);
 
 typedef int (*mapfn_t)(u64 start, u64 len, u64 pgoff, void *data);
-- 
2.36.0.rc0.470.gd361397f0d-goog

