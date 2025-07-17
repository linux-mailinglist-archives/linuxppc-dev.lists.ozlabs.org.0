Return-Path: <linuxppc-dev+bounces-10287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8884B08AB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlk36KBz3bsL;
	Thu, 17 Jul 2025 20:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748386;
	cv=none; b=ExdWQEn/c56HC7pHRpzjlRn8uuHE4mRhIvxc/K8lgTBE7tZFLL/Mk1DjYAs6GWu5dFDd0yuP3KTpLd1ZN6vorUp+qf7IxV2wiwh8sdVpiKtGFCy0AuDfhOTNBtLJm4b23jaElnTF1CF1seSuetz4RRDjyQHG855nHA0Qjh82niGmYTOX8Elzf1u4FCG58QPDHKMDYd5wl7v7bdlu6XJKnbwycOQEOuoJSLf0CdBiwtZS3Dj6Ga4Uv3rC1JUaO9VDCJEOUfld8m9XI4JJ8ewEPaICZYo2kXi0sFsyGX3r5bPSVRR2gp7Hcn5vyja6NZRb2HaXm5xKWo3Ct+H2AhwL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748386; c=relaxed/relaxed;
	bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkpcnR/5EkLJq2JPlGcnxAKe004JtGwEVlfzEZmaF2eDyPptJTgKqCAu2bNlVDMOtC66aJ9ziUn27DARrV/5CqGJSRCEicPYW6J5prO2d/fM6t1lfobd7Coma5dVKMx/powqlLGdLZPLRIdvKgwOpin8YfKdDwqGwptTuK1DhCnAsbXV/Ac/wFMZ4C3AQcvzZOEP4V5oo4sGYJ2VXHEK1wpYJbUjwME7K7F14sDpP0pgNqb74LTf+dbhWPxApzf66jAsdl345XFCI0Z6rCdXAMqoH/t2cr3WV4JVOWHLZ050kfc4F/tU64YLLwvGtjmgk7dEr9niG5qQVB0FZe+JWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h1UES5/T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h1UES5/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlj4DfMz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:33:05 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b45edf2303so700822f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748383; x=1753353183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=h1UES5/Tm0iLtyAltMFLnu6saVAMlnuwG99D2/tJZ0IU/aSd0lE5Xgvt7yUS+ZKKZ3
         U6LzB/nsr+vEygILthd7vGakTYoy3REIV1ElS9/qn51Javfm++GNfpSi5loYfJobNNk3
         apNkvivxP0d5Ca+i/E97ooaxCzlifI6q/KSq1Vc48zcPv42y/EWeLmI4vIvwHZTiegEt
         uYB9USHhkJyesxUoPu7Jj1VbZjr6G8PvqUIv+annhP1Q6Gv6cqTbnyQSgMpLr9oBzFeM
         zY43TSb5gLCODYFHWKwrh4rUbAdDiU3Sb+JYO37z7BHXXj8tpjHByHJDLYYtSVy9b3wY
         fwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748383; x=1753353183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=blHqoYI/PKVjoG/zV6SmB0rB133nofGgJ25OhWL5i0S6WioVKWd5Mcj2BDwrB9c+ca
         xQPCc6Nrp48WL/6xFSx6540c9B4U9A0SDxQ9r8HYf4QlO/7oOC/m70dDjbW6ow2BxSSz
         vemcc3KbYwEYpse4Cz+HcKxXgMhdf7zdpcTGk4I3TyA+TFUrGXcToa/v4w9tovh6QsM3
         QOsGoom0wdYe+CmhnXhWitOUcUFldzsnP0ZCqvrc2gWrj2rPzXhe6oCrSYmpz0IRlUtn
         LWdVJ4Imbp6Eg4CwuAAZp5DdhQZqBPA92uqy1EIvJnRhm8idg7vtB04q+UhtjPc1+9Z4
         2WcA==
X-Forwarded-Encrypted: i=1; AJvYcCW+GLtZ8H6ywQLoYKexrbFi1cMCcISvujo/0iJ1bbp+U4f+JEa8LV1PBkGTpnK/cuvLa9PAx6Ugtr5q4fI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOGY0F3rpdT/e8g/Dy3S8M8SSK2pZN7mLy5RckHjTpBXkGcs0H
	i0J8vkLUt8XfObRiddh6ppt4IVQKltXzjyQPhOK8R0ExXkwavQNIZj3U
X-Gm-Gg: ASbGnct1EOKQNkWxh7NwqMjD6QjeDGake1iwBJ3bpTw/jkxPbY9s4zK+J+hdpVzH//J
	1yFgI800oPw/wJMQUgBEXx1zkEFqilO3aP9S2xsaIvwrvVf+EpUdsS3+NRBIJoRudZEifvyKowq
	twcl5Z7SKzfdWmRT5wVD6CsGhPl3pr1l16fZoThxgfJDpr52s/FMOFhSm2kUgQQ/2lbyD3xbsGB
	LSUEh24+ADqCVbjemkZ1xNsSl5zpB5QoltVapNs3T7ESleatAy63BX/U/XiQ5YKX3fQ1R+Pj7RG
	ratoWdSAfxes3LAjEJ4VPVkuLk+ER+zBPoOuRWQa/XXboVZ6jeKT3wHN4FyBK5T6vPGc9HLAdoG
	VBiZ9Vea1F99rz7fHtVKsyMVX/bqpGSnsNfuTajxsXuDUVbHIaBOr4F92vqP5dHoXRdpwXE4ANY
	VJcV8ZAw6NBFTnUd/tLC0las3E
X-Google-Smtp-Source: AGHT+IEqfCFpIQcuogdtVlks+s7mtGT9PHZg7lN5UDyP9j1DEHEgnDRrYCSmStX9iLPaLpOJf76oyg==
X-Received: by 2002:a05:6000:1ac9:b0:3b6:d7c:f4ce with SMTP id ffacd0b85a97d-3b60dd88801mr5936545f8f.54.1752748382518;
        Thu, 17 Jul 2025 03:33:02 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b612db7060sm2629613f8f.52.2025.07.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:33:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Thu, 17 Jul 2025 12:32:41 +0200
Message-ID: <20250717103241.2806798-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 455e55cbd2cc..a5c179636a69 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3143,6 +3143,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
 	u32 status, mask;
 	unsigned int i;
 
@@ -3156,6 +3157,8 @@ static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 
 static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.50.0


