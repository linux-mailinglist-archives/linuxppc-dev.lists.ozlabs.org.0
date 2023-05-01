Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C306F3104
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92rh2JNLz3fKg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:41:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bor1yKK2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bor1yKK2;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92nz0MP1z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:39:02 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so3012504a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944739; x=1685536739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyZE1O+cxDpMOUxQLEUk9VsIXQThIAsknzXOkfD+xSE=;
        b=Bor1yKK2atDVckaaacFDlLhe35dHV7MGl0KzzPQwtr6gc2yZ7rj62HkvMqa1gUrZCF
         De56iZ8j2RFUvdlBla1sV1FWLxwDCZPvJ/m3sydSXsDv3Mn60uKR1Q5coVx2BhYFR66n
         b1tqCnbj9wOx7TSJUVYjTeEUdEVeqCyLaMoog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944739; x=1685536739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyZE1O+cxDpMOUxQLEUk9VsIXQThIAsknzXOkfD+xSE=;
        b=DuteZmkDQ4fpsjluG1ZryMFTpve3va1YHJYPYH/k+UJgYYwkOvd2XYeeMPw5qtJ9eT
         ReSWIgFOT9vDcmCZtVVPx6YQh8v/gjE/wp4Xu9DiioywWWBHytuK89G9SUKZ3MYhZ4a3
         lyn/v65eQNS8AwkhUecMgGnMcZ9euWRiCWauG4RXCOoGs/MZpi51Ss+/FvisS3JPHsza
         a6RqHw8DYao188s1EyafvZstRKLGeKlIL/vxDGhV24bX1NQa/j+MQFU1r7CsysKmgwPR
         AaCYHA/lW8h4iHWOvuX7g7AVdmQI8ZromOrnTGyQm8jSU96Dhese+wfE9m+2/s0PnAa4
         CWMg==
X-Gm-Message-State: AC+VfDynDOMtC5vjyvVfZA7Gu5cNa8k4+nO+wVdt6ZhtyJjXHveVmc55
	+OF7Cj8OclKi+TL/9KRVu9Uh7g==
X-Google-Smtp-Source: ACHHUZ5W8pX/mlnkgDZDwQqd6X0QzsG4R/YF4KsuDrDWMgjJPrF9qf6XFE9TQ1s5FGzbbsIYHoflOg==
X-Received: by 2002:a05:6402:1017:b0:504:ae37:77d0 with SMTP id c23-20020a056402101700b00504ae3777d0mr5215516edu.10.1682944738849;
        Mon, 01 May 2023 05:38:58 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:38:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:20 +0200
Subject: [PATCH v6 2/4] x86/purgatory: Remove profile optimization flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v6-2-a2255e81ab45@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=IIFsucnr6ARsGWNiLz4pZTsRxLveIe3HXXJvtbCwLyQ=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7LYnFaWGIKBUoEDbI1Rl1OZD+N1VfYBBA8K+
 Cbk2bC/+xiJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y2AAKCRDRN9E+zzrE
 iL1pD/96xL2PRv+b9c7ULiPFv8LkyB4WqI/RqOYMHi4+V20nXkJNCl6THZaw46/PXI/ahEyqbtV
 aINfUi019U0CyjpAbSooeKs0kYmoILtUBcV+0muqaF2FSOLayMDme2oWP94AoGFc9DpK4yF2gc5
 piDu93s5rsKR/7UN9swT4exK5JuK5+1K4cRxXRDCk6cT4oDu9VaxWu3jpwJ9N1yZJJaFd9ozcBD
 tiBzCs9QZ+d8Rk3oo8twJIHoh0jz0VWeHaG6YiiaOuHgmmMmkMn0zafEIdbDZF/ssNRo6NmqhSE
 1ut2XoCk4RYoTYZ9D7PimkELbpvJDFePmQAnTXBkBRFIGJjPmn6uXKENW1XxAWV+ZKkY8EjjPiA
 7cyOsfuYzGYAKL1B8nlX9IqUkf1xyZvHIhcU0Ekyj9usjx91kt5YQzBHOjlIVMQR3GeOaHiH/I8
 qEEESlRHhE+X0b8NCKCUNOlnRvRMDqx7hVLoBich9HqrKbEXRAFcIsigOIOsyrRZ0PsD0mYfSBK
 NtuPU6Hdo3+JtSls9wVkvPngnrCvKBu7ntG9SyL/5RYHMzf4cs2YMwSzTP9xGgcVCZcgslRbcT2
 DQ2SxSadihHzYdn+eTWojbcD6m8KMroml7R3GT3eai+zzKi+LGRymBIYHJ29ghn9S636na8PXcW
 An9ssGUe6z7KqUQ==
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
 arch/x86/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 82fec66d46d2..7a7a4901ed41 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -14,6 +14,11 @@ $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
 
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS
 
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

