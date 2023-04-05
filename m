Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03A6D7F37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 16:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps6Jh6QLNz3fYC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 00:21:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dw4QAoMp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dw4QAoMp;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps6D5532Nz3cjJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 00:17:57 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id b20so141490408edd.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 07:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOC1m1IyvFx7hqlIu85ltj9Okdj8PWnyI3fah+Gac6o=;
        b=dw4QAoMpVGLEOeYQ9Yo6hrg7uuDz1mqcfEuifQdcdnb1mCRfnp4USqcIZ/tj+yoqqd
         NuZo8Fl4HHUAk4my79oi/1gAt96ZaHSFf0NyBNIA2ujrdK0vV+BtAz9cZUh1HP/21L01
         ZfOBKFtABC40OHga/xcc6LZLy5bp81QTL5BA33wmnqyDDroTbAF7IVTNrZhDCZYY5uav
         cpNPwfW8+ndEboG7KmpMryAu2BP5Ht2BhpnVlW+EgEVP3Hv8o6yChfq1iPaWIKJDgzD/
         9Y/9bUrxWUeU4eBT8lu+LsRKzoAiRRbIgYAetGEXNMYLkTxdyCEUikhfLAP1CktMT2oa
         eHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOC1m1IyvFx7hqlIu85ltj9Okdj8PWnyI3fah+Gac6o=;
        b=PlYURye/ViczP/4wX5WjzMp9RL9WuKrLKRVBa7N9KuzIDfyG4oOfEFtRXODQ6f6b4Q
         s15TxiyWssk75E9Fc3UW2PtlStxiyEUPDfXdzYtO4Fl/t/3B6Pul30bjCQBrFs77izG4
         1X3gRRfoj4Qb55RxFUHJ8vFYRg72kcpqib0sHPOOWO6b6NEB4Ivau3XLW6zFIpH5YcOK
         wIcxQntQMHsjJLp4UoQG+kRKEEhha0AF8NxMh+h2uwlq4FfRWQTvAoqr6gKfp91q+tHB
         mRd7wK0bEWQ8TFiSp1RYq25Gb5FexLs+Yov1HdvJCFueVpmO07yDRfiGTPxR4TuX9M6w
         vCBA==
X-Gm-Message-State: AAQBX9dEuu/w5qzZllcRBSUcZUeLn08XX5whdkmamrNXxYiKm5rMoh/d
	ZhIBlnoawBy6vRV17TeofR0=
X-Google-Smtp-Source: AKy350bz5YnNlQahgd6VXOTs26Uhu2FUvH9WVqbCQND0Gop8QRbR/cXdIQACyHoPPOUtbLiBje74GQ==
X-Received: by 2002:a17:906:4a8b:b0:944:43e:7983 with SMTP id x11-20020a1709064a8b00b00944043e7983mr3280252eju.67.1680704274221;
        Wed, 05 Apr 2023 07:17:54 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:53 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] locking/x86: Define arch_try_cmpxchg_local
Date: Wed,  5 Apr 2023 16:17:09 +0200
Message-Id: <20230405141710.3551-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define target specific arch_try_cmpxchg_local. This
definition overrides the generic arch_try_cmpxchg_local
fallback definition and enables target-specific
implementation of try_cmpxchg_local.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index 94fbe6ae7431..540573f515b7 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,9 +221,15 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __try_cmpxchg_local(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
+
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_try_cmpxchg_local(ptr, pold, new)				\
+	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
-- 
2.39.2

