Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8D421229
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 16:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP4n6jtHz3cCV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 01:59:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eLRgQpd+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eLRgQpd+; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP206mV4z2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:56:56 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id u7so14687589pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9T+qcVAlFFlB10kuasOnszrDVVK/LnVoJkYSKC3UmMk=;
 b=eLRgQpd+svMnwJGEC43o3U21dAPWohONgLaguM1I36JbJOF7uoW6gf8Zy6u+RSvmfj
 gVZNGf0RXpSR8j9CXn9Ft6Ad2odYUPAsfJAWP8ECf5RtvjkaQhPZsLWu4RglMglO3565
 e5SUXsCCEEhHAbwjH3HzTAfIHgvn2H8B+gvCiD0ABefInb/dgV/g2xvLtvT4dSuWT0kn
 g97qNqjrSpRwrcEwob7NhzU8/vJznF1oOlSW2pv4JyL6B6TnU/DdmS/oK6fOgnhmJZo2
 usMagHvtlc1DPjaDidxTfqJlzAYAjw2VcBz1cZiNETiEYe2c1+a2qt25mB3yYtRpE5uu
 34lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9T+qcVAlFFlB10kuasOnszrDVVK/LnVoJkYSKC3UmMk=;
 b=btbsn1nAPRmdA4Fk5+bAx6clenezHfp3w979C9/ovTbZgj/BHpIfna1h7ZBPXL+bvV
 hAgk7ZOW3APoOM9kDbJBDHIsgmiSt/CYqVgwbbNDz1Nz9POTRK7ym71aCKU8Vgn66X7k
 6LQGNjyJH2rQbRF9yO4nfhxZr6AxrWbBvZ5uH7jspnq2bvzd6BKPd7tMKaV27KyH7/IL
 AX2MQP5fNODyNKTziEmBaml5n/pe2V4QFCm8ann39dv+OZpqecu9UXyHfFqvvhcAgGuY
 fv4gmML25gDb8hWsRvshEGq5PTCClmyclZEdySz55KnQ520UaTHk/6rPppnDbuVdjYVp
 +csg==
X-Gm-Message-State: AOAM5312hpJ2XA7T/TRLjO57SsOuHrbXR/DXd8dBNMukCaQbKZOXUhG1
 K5xc9lAESTnFxfjo9nTwocnEuylf+eg=
X-Google-Smtp-Source: ABdhPJxzwe68jScKYuh6howFcP3AqKTdbFfNPfiQB27ERmCgC8jH9ADOBfWC4JssWQO17ylV26JlGQ==
X-Received: by 2002:a05:6a00:16d4:b0:44c:22c4:eb88 with SMTP id
 l20-20020a056a0016d400b0044c22c4eb88mr15562384pfc.75.1633359414383; 
 Mon, 04 Oct 2021 07:56:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/64: warn if local irqs are enabled in NMI or
 hardirq context
Date: Tue,  5 Oct 2021 00:56:40 +1000
Message-Id: <20211004145642.1331214-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This can help catch bugs such as the one fixed by the previous change
to prevent _exception() from enabling irqs.

ppc32 could have a similar warning but it has no good config option to
debug this stuff (the test may be overkill to add for production
kernels).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..c4f1d6b7d992 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -229,6 +229,9 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		return;
 	}
 
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(in_nmi() || in_hardirq());
+
 	/*
 	 * After the stb, interrupts are unmasked and there are no interrupts
 	 * pending replay. The restart sequence makes this atomic with
@@ -321,6 +324,9 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	if (mask)
 		return;
 
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(in_nmi() || in_hardirq());
+
 	/*
 	 * From this point onward, we can take interrupts, preempt,
 	 * etc... unless we got hard-disabled. We check if an event
-- 
2.23.0

