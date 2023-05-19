Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67E709DF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDK94Dpdz3fnC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A4Ce0mbu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A4Ce0mbu;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDBx0FHkz3fGL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:20:56 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-25355609a04so2457259a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516855; x=1687108855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=;
        b=A4Ce0mbuBc+hTbiZP49wHojvRrnbiIA8FPLkaarvKJXT1bV5KlwOIUViar61CbX4qM
         xnKJrMF/2lsNyHtA607IBj6w8gOrCueK1n3T28DggYwgn3WWzNlnj/yUC1gqbWjZ/eif
         4QU9hrt72WwEMojhcB6YxiHPFG2/iARvBWVoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516855; x=1687108855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7nsegKilU8iY/CeHEQ2XMVIjaNVdBVM5JDOxat9ACo=;
        b=Rf2e9roxcLpAG0KS+zx4mjL22h5BukhUxIgk97nnbqgSknwQKdONipn1e2qx8uAw62
         bZGerSjjT2WC+LFT3X9UIG8TE3rRmdncC6+gb1nhLxmVnfrmEBeddk3V76Pna+1xnUOH
         G28LLIGDmM4gANL1dljV8W64775yMlRdLZne7N5BCDniY9OeVVgM7EnIoV1tIC3BDMmd
         OSiZMkrPwBHS/hNEDHV/UzD4DfgPY9JvkXHx/AovnK7P6+UtyVc/iqdDRjd4BojkQK+F
         RTQxDvep7efATLvXoR8OoxeogV9+ZEV7bu+ZpIL68/ao94rIPTBxt2sShPaEvmzCeBow
         O86A==
X-Gm-Message-State: AC+VfDwr2qfaJrS4e3FgGwYyOE6kB4oSky+ZCWTxNPK1Y0wD69+AXtFC
	XRY+RPk/5uybYoNv1tHTgbLp1g==
X-Google-Smtp-Source: ACHHUZ78KuQvgskyCDTAlOMExtVERg2yOkymJq8jyThLWiYxqXpls34rasoUDDbhLlKOIhF5z6rP+Q==
X-Received: by 2002:a17:90a:8541:b0:250:d2d8:c179 with SMTP id a1-20020a17090a854100b00250d2d8c179mr2837454pjw.29.1684516854855;
        Fri, 19 May 2023 10:20:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:20:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 06/18] watchdog/hardlockup: Add comments to touch_nmi_watchdog()
Date: Fri, 19 May 2023 10:18:30 -0700
Message-ID: <20230519101840.v5.6.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozla
 bs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for the buddy hardlockup detector, add comments to
touch_nmi_watchdog() to make it obvious that it touches the configured
hardlockup detector regardless of whether it's backed by an NMI. Also
note that arch_touch_nmi_watchdog() may not be architecture-specific.

Ideally, we'd like to rename these functions but that is a fairly
disruptive change touching a lot of drivers. After discussion [1] the
plan is to defer this until a good time.

[1] https://lore.kernel.org/r/ZFy0TX1tfhlH8gxj@alley

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- No longer rename touch_nmi_watchdog(), just add comments.

Changes in v4:
- ("Rename touch_nmi_watchdog() to ...") new for v4.

 include/linux/nmi.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 454fe99c4874..fafab128f37e 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -125,15 +125,30 @@ void watchdog_nmi_disable(unsigned int cpu);
 void lockup_detector_reconfigure(void);
 
 /**
- * touch_nmi_watchdog - restart NMI watchdog timeout.
+ * touch_nmi_watchdog - manually pet the hardlockup watchdog.
  *
- * If the architecture supports the NMI watchdog, touch_nmi_watchdog()
- * may be used to reset the timeout - for code which intentionally
- * disables interrupts for a long time. This call is stateless.
+ * If we support detecting hardlockups, touch_nmi_watchdog() may be
+ * used to pet the watchdog (reset the timeout) - for code which
+ * intentionally disables interrupts for a long time. This call is stateless.
+ *
+ * Though this function has "nmi" in the name, the hardlockup watchdog might
+ * not be backed by NMIs. This function will likely be renamed to
+ * touch_hardlockup_watchdog() in the future.
  */
 static inline void touch_nmi_watchdog(void)
 {
+	/*
+	 * Pass on to the hardlockup detector selected via CONFIG_. Note that
+	 * the hardlockup detector may not be arch-specific nor using NMIs
+	 * and the arch_touch_nmi_watchdog() function will likely be renamed
+	 * in the future.
+	 */
 	arch_touch_nmi_watchdog();
+
+	/*
+	 * Touching the hardlock detector implcitily pets the
+	 * softlockup detector too
+	 */
 	touch_softlockup_watchdog();
 }
 
-- 
2.40.1.698.g37aff9b760-goog

