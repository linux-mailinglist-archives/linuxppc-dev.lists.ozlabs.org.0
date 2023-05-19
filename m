Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C8709A71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 16:50:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN8sm0JmKz3fMV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 00:50:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JDuBiVDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JDuBiVDj;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN8q15SSfz3fDF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 00:48:29 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96652cb7673so539788166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684507706; x=1687099706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BD6qB7twnufisotyY5nBfpaakG3WUms/sLLcs5/qPcg=;
        b=JDuBiVDj8o8HaMzkIB840oZkGv5wJJi7TNtUIrYqKhMie/96QidOGQDjQXE7b5+5S9
         tK8GWP5SEiIeHDVPjC3T2ENDFCeYqLi5SHh6A0hgK/rjIefTVUgKtRZiA8w7MSYtyRXh
         R0aHFCTNuZeLm/jFjl0vcQ1z/eRP+0aN//K8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507706; x=1687099706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BD6qB7twnufisotyY5nBfpaakG3WUms/sLLcs5/qPcg=;
        b=dJ058UAgn/NP9xTCMx7BNXuOwJmWca70p9TbItcwhawVa9Wrk6TyWd8JVPNYUEG09O
         WHsA43qOZGBpk0pA9fcGWFxNwRjjI6Y6r30K+u3grqCe8n+LsoePucFX9iJASDQoh4X9
         HQlOLSaC5dbOJKd0YEy792eEoLgmuDVff5zXtuZ9PLBqVQeUNOL7Spq5gpTkvGUTmkg1
         yJnDbNO8Qui3NU0ezJ7mJ74wBHe+oTDn68pYE91P+KpfjFboCQQqke5BvyyH/pUehxlj
         /zHejS0pZEIdKgYGLA4n9uY1VjuIF9T43pu9sXXArCmwG8g37R156NNOv0dxc360Msuw
         AMag==
X-Gm-Message-State: AC+VfDxfVmWJSdLyG5lyGamB98gNCcQ0EcTmBDxexPx/LL1R2N1Nj3K3
	odtKbjgWenqBPat6E1dRFyTbMQ==
X-Google-Smtp-Source: ACHHUZ6OprUYGsS72ehmUtvrfFocAu2GyTDDqdde/uRgkGX7E/HjFZLPkMJjnA4KZkxfiwtIcIB0dw==
X-Received: by 2002:a17:907:1609:b0:94f:1c90:cb71 with SMTP id hb9-20020a170907160900b0094f1c90cb71mr2302378ejc.65.1684507706237;
        Fri, 19 May 2023 07:48:26 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:62fd:274b:c2ab:69bb])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090680c200b0096a68648329sm2349437ejx.214.2023.05.19.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:48:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 May 2023 16:47:37 +0200
Subject: [PATCH v7 2/4] x86/purgatory: Remove PGO flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v7-2-b05c520b7296@chromium.org>
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=ZdKmKWLc9TEOfphmrnN/WwYYNZStN7R/TxB0+Zjd8HY=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkZ4wxpLapFX/30sji37lAIaagKHpP8BO2TaX+/
 sJHabfFQk2JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZGeMMQAKCRDRN9E+zzrE
 iBOhEACRW3xOCPLHp71KLmHTYNCd71GtWrKjkfxklAL33OghFmTvUpYrsF9LpYB/m7hEcL/ThHl
 hL85+iGqortM23o+IHkavb1dGe2lPjzhRrAlOP3VRhZdMb4Z30GB9soPtsVB1wTkIHAffgMXlXl
 OX9TTvAAdTwiK3QpxHsQTI7Zrwd7j4F5PLFwLvF1EJ5B9vHk24k8qUliTckaIUupc8s90pL+blD
 76ekelf8r6J/OuHnqjwfBNPIN+L5PKM1Qnvc+nhDbVClbug/NZoYEOQncnJUQzy4+pPlgWMhh1n
 jSBpPsZLhRFaaAvgOmnCFcJ4QK855FrYlgSZ62gNGa18oujDvo8M/P3rMJl+ZptFWkJHg4ftqjk
 d2p50qqwa36cAZSdv5xiIorPYJAvQcKnfbLTa/33NmhdJsRmYKEIBmzoJJMVV1WM2GQ1GoS3iqQ
 xsIbbnRtyfu5Oj+092A0UrmjBv44l9VFL0GioJ/h1dybPyj/xRudpeipiBI5UHl+PsrthS0eXyR
 BEhiiCDkPPQVspdv9HGVTw7RtC+jrD2P59F2ZJdHKAj43rczvbjLU1aFhLmXOsvEzExQ7jdyhrD
 dtwIMAsWCKWuA82FW3a1RMjpQzwZn57XSc6vVKzBJhtayoAZ/RnFP3+dNNhzAJAuESXOXu/+Yc9
 KoQnpw6oiVlAnVA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, llvm@lists.linux.dev, Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org, Simon Horman <horms@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If profile-guided optimization is enabled, the purgatory ends up with
multiple .text sections.
This is not supported by kexec and crashes the system.

Cc: stable@vger.kernel.org
Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 arch/x86/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 82fec66d46d2..42abd6af1198 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -14,6 +14,11 @@ $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
 
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS
 
+# When profile-guided optimization is enabled, llvm emits two different
+# overlapping text sections, which is not supported by kexec. Remove profile
+# optimization flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 # When linking purgatory.ro with -r unresolved symbols are not checked,
 # also link a purgatory.chk binary without -r to check for unresolved symbols.
 PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib

-- 
2.40.1.698.g37aff9b760-goog

