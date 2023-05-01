Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E256D6F3116
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92tX5prBz3fKB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hODYeDeY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hODYeDeY;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92p13Tv3z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:39:05 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc4d96e14so8630210a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944742; x=1685536742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsOOlRTCOjL3abNi/3ZUSQqB4+vgvV69cdyU9ee1C48=;
        b=hODYeDeYg6APhZAviVEDv24zkkV5PSyD9YF80bCIKMgiHcDDsd8y08C3drl6nvnGJD
         IlJxYRT/wEBGX7nbEciydDBBtR5sxWJSS+Q1JOTL+EYkrNHQvWMsz4+2JhTAsCU5cMFe
         Ea+MOxsYngr/dEQhvm3KkMoPZiJyiwADd2JrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944742; x=1685536742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsOOlRTCOjL3abNi/3ZUSQqB4+vgvV69cdyU9ee1C48=;
        b=cp23S4FE9lEKsinPtns3NJHIFEPIiOAaJ4G9J0UTmBlZXc6dOdGpFSzl4G9yTy4/o7
         CRnWArCBGqmtxmWD9rmI8tD71ubtZypPydPEoZoIQ0zEwkP+G5GLy0kvPUdD9HgMSnNZ
         z1lXYYSbSiELRMNxqPNgdPR6WKkLXg1Ok8ythggofXnHvETNbtO/VU7FYEx2ctQR9e9A
         GZs8nhLE23GrghMZIjoWofQxi7ctj6SvCfqn/3CMQwJzaauUBW7XVvdZBKAhtts+4p00
         r4YHP6+pP46C2YijmYzxTma1UNXgkPOIQyrxU9OVJc0wT3LnW1mPxM1gbSNjZ4Ks4zSO
         n0eA==
X-Gm-Message-State: AC+VfDz47hXhhexLaLojy9VUrsaHdEkB82k5xuP9yhIBh+6OkC6qtIh8
	PkcGyDUVlbI3xEVwpFr7WiVDAw==
X-Google-Smtp-Source: ACHHUZ4EUorB+1FZYBv1RP6+ov+r8A+Pc1H1dxULnrAhwBqWHXQ9LjOP3Ez/dznJWtTpBeBKUxYLqg==
X-Received: by 2002:a05:6402:27c8:b0:504:77ed:5a33 with SMTP id c8-20020a05640227c800b0050477ed5a33mr5864584ede.8.1682944742259;
        Mon, 01 May 2023 05:39:02 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:39:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:22 +0200
Subject: [PATCH v6 4/4] risc/purgatory: Add linker script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=ECbK3ORJb/ox8qpp2VcGabf7Ou2PzFFDokGI84nq/PQ=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7Lc5MTx2hMC4Re9phVjZPNed9BIxos1Pxii0
 61fGiCxDbqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y3AAKCRDRN9E+zzrE
 iJuYD/9j2b1eDvjy+uQCumtGC2Jn+H/Md0JWPsxPb46aNyMDJJYtpnBOkQyLCIR1Ro6iTpnQQLM
 +8uN/ou0X4CF9cfN+g6f5JwkPoQfQcP+jYNP8HE3vvJyaw+gY8gFKrsolGYojIu5+7EZscjeM+x
 7hCRkxslbxzkKo8bCXJPNM5bL+TS+8voKLtJw5vxmDtH71krf0z6Gp38OUM1qbruri9kSi75MmP
 pPIc503fFiicjySfDDJ804XtSoK2FjXUVn96C+XtJdu8JE5WpzayNi5G1CCxtOHmymMyPL11Nyb
 +Y3kXDpLRgX+07NcFuZOiO/0ThN8bGM98On1cBYfS5PV2bqYo2Cv6+KOCjnObJd8T8zLrIWY31E
 dkIZGehfJGieHtPMQYd0Up0Q7UFloD9EOCUk3YXQjbVL5YW62U0ajBT0UqSNiyO8Fk5AdOGQnDv
 M1oDH7eB6zhw04nOc8MvRcEL1vb70bgueckn6cp6u0ViYD7VRwHLkKiDx9y2wl93EfhhVpu9EpQ
 108x63OJbcTsVjOEtHREb8lzuERyPHJsPH5o49C5N+yZd7HKY8dMY7vi4/kdo4rqsrCdLSOYIRN
 nVm4G0/Z6eWsohGrZwA5weUUpMcYwEHd+mCMobjyQ8WPRg/nBapyYtxdaEgYMK3As9R4j0j3G0s
 Q5pwBDSsFyR/N1Q==
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

If PGO is enabled, the purgatory ends up with multiple .text sections.
This is not supported by kexec and crashes the system.

Cc: stable@vger.kernel.org
Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 arch/riscv/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 5730797a6b40..cf3a44121a90 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
 
+# When profile optimization is enabled, llvm emits two different overlapping
+# text sections, which is not supported by kexec. Remove profile optimization
+# flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 # When linking purgatory.ro with -r unresolved symbols are not checked,
 # also link a purgatory.chk binary without -r to check for unresolved symbols.
 PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib

-- 
2.40.1.495.gc816e09b53d-goog

