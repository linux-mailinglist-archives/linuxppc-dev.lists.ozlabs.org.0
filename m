Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CAF6F3113
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 14:42:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q92sc5gJ4z3cDt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 22:42:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mKg+bkq0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mKg+bkq0;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q92p00CCsz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 May 2023 22:39:03 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc070c557so3012553a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 05:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682944740; x=1685536740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecmOgKj4rHuYIab/sfV0jN5x+nFDKq6SG67BJPIt7F0=;
        b=mKg+bkq0NR+B9AinP7+ox3WRRdl5CMkW6hn7AD82Fgqa+7fbUMNiNltYuZCdWKFzGc
         unhr5yMOsZL/or9r8PjKGOGnbVzP8zPkt+LRSVK8mg5G/t33oA9o1PY698FnKY8PYIET
         /LDgi+GpCXZLnhOflN7j/omuXZmCcamYmO4lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682944740; x=1685536740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecmOgKj4rHuYIab/sfV0jN5x+nFDKq6SG67BJPIt7F0=;
        b=GnVmznp0FCP3iKRfgBEN+y9O5rODSnxq0zgvipWz60uA7sO2G70AuA5a4cnPc1xWi2
         B1E6tXNobJrZYNagIzYgX3beo7RbDNTKYcGOSAJSKQrnhuUSOUNdG1RPqTPuO7EOantn
         UUbBv1oj1aY39Cv2KfD+EG3+2uX/idfZoOC9EgeVwJcWgXWfMjf5xKxUNr118pxb04mB
         DCCbWlBLmYlcFiK2tauy6X5H3yt59oVhGQWDFIqfJo2ySK7vh8pU4AbYyBHcr58CKlSH
         bFHdUE1weEf89JAjVQBthh8I6lpJnmPrdSCVL1quyIRyx6yeQOhe45y/3hdV5R5Orkap
         w3dQ==
X-Gm-Message-State: AC+VfDwEfqVfZMgBd5EaVT2Eubrt9/u+aTyTj0v4eWkkdZOEez1m8LcN
	WXgNXTGp+UQLxD2m0y8PzD/NUg==
X-Google-Smtp-Source: ACHHUZ61A+LRi+71XC3zKgGuQNso9mPlM0T8FY/poP6QaGXzZI8sTUhNY6Hk0v49L4lTBvUZBRM9uA==
X-Received: by 2002:aa7:dc0f:0:b0:506:c2b2:72fc with SMTP id b15-20020aa7dc0f000000b00506c2b272fcmr4483898edu.7.1682944740515;
        Mon, 01 May 2023 05:39:00 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:c573:159e:712e:688b])
        by smtp.gmail.com with ESMTPSA id c8-20020aa7c988000000b0050bcbb5708asm146772edt.35.2023.05.01.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:39:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 01 May 2023 14:38:21 +0200
Subject: [PATCH v6 3/4] powerpc/purgatory: Remove profile optimization
 flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v6-3-a2255e81ab45@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=5RExnAah9i9M9ThRE28+66klWLL9LdvzLPE8nTUxjoc=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkT7La8ioS0FTBvHSBrwIzNc4yErEKxBXHSQt+x
 JiCAoPrehyJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZE+y2gAKCRDRN9E+zzrE
 iPSPD/9e9vGoy1sdkIvKVHZQw4XGt6HvaPue9LcoY39HNyZE8mZATbQBYoSI3SkVObACWx/jlGW
 hny9wRcxVSR2gX6ndlP3hfzmhcAG5m4snPNfr1/kVb1t204udn4JAMSu6uB0tOAaEJf0cly/tPX
 MgzKHTBxQ934jsr55N3AFr9IVNmsahHF4f3aSWjNkqG17UbtDgv8cTwplGTAcFmuEaR2z1RjZkA
 F/yFwnqe+z3MZ88H8P+DkXvYeZmVqaAlsGnmPR7qa/hdj36aRty/zFgPnKfHUSJeGyp2fH2NnXz
 Cd1SzviJIuk0zXGetJ0TVMwvd06uiL48vL15JIziDBIUBrXgwgsjgWjbJX9UyVQgnQxw2mlzHtT
 Z7CLSbHlZeWWNhhMRi8OdxxXy970/+OBiTXjIC3RdYBoC1cs9ICI2TwUw+oOGh+NTL0sqsgyWmN
 qXAI32vfKKHiJSW146dpoerqe2/aEC2FUfzHHni/4c6Xc897c8ScvQ1KbXuolWzL1VEjHrXofQx
 UTbe/svZ2wrRRbzYDaPi17SrFGFPMeTLs/8NtUxrR/huyW2SHpZatS4Q5VxStlZ8eC+qZ/c8S1X
 VmC7nztI9HXeDK9dTlsMYGuPnA7hQ52n2CrQPyQ+zyQMCydIlCzoTIuFwmucPvw8iUBDg/Qb8sn
 WvYecPgPSx57Nlw==
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
 arch/powerpc/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 6f5e2727963c..5efb164330b2 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -5,6 +5,11 @@ KCSAN_SANITIZE := n
 
 targets += trampoline_$(BITS).o purgatory.ro
 
+# When profile optimization is enabled, llvm emits two different overlapping
+# text sections, which is not supported by kexec. Remove profile optimization
+# flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
 
 $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE

-- 
2.40.1.495.gc816e09b53d-goog

