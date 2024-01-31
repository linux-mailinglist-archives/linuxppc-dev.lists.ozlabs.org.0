Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A3844393
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:01:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tsbPVoxP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6GS6bMrz3dKS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 03:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tsbPVoxP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6Ff0hcKz3cXR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 03:00:37 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so57917255e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716834; x=1707321634; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=tsbPVoxPzPSN81+BkjlMsIeKAs39B5+CFidMi24kr6DwpJE9XZ2tA3FhWyRVcJ8aAV
         Bffa57aX6KSOSr5J1FKx+LzQg7qbqufYID8SMdqJLSAv/tQB2AFPJPGGDB7py/fqM6XT
         Q6TWqnvhUgH+cgwhr+optWI51toeD4f+tTr/wzBy/WsSW5TiiE8ig10kGxyu4KYnjdw+
         pgLQOhtZsIdQhCvI/yBWLHlJAx7LtxLMkUYTZ63FOBo2XgsaoAMiDHSnFV6n/c+jmnk8
         xg606D9kLd99JsQPZhZMC7Tg1/Hrr2wGNVL5q1/gx+/MXYVaJwHWjNjxSGu/7+eAl8Db
         IZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716834; x=1707321634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=fV4lEDHhxmG0xAxz5WecEm7YcD9iBefWD/XHOAbGxHfDRwuvQ3PG9DzPS5nS66LkP7
         U4Z5fxdpgr56rqCN8qpzh6YoON0Tc0kCzi4/Wd80OWRR/FhXLWUQJzUOfjDm6QUO3v2d
         ip8U+5CFbqSMECw+WWW8IIm5crEwJZw4tPGFajfVQTZK0mhpQhjzwe0IbONKvXxSPRFW
         3N+htPXQayngYDwGmZi+2KcpHXNMS7abH+/+UfN/CMgHLg4QaPP19HBuU7NYbkRfj9SR
         A5kVnHv9BJfimW3TUbBin+kG+OyJi0X6KWZslnNhXFfqwzmbEXjxzF3P3mdDXNaI62WB
         fS7A==
X-Gm-Message-State: AOJu0YyYQ5uHvPssvF7uq2Y5IxDRC6oLnxuIJj4+A2Mz6iRSwcUF9rOj
	IzGiai21O+t+Iryspkn9ByVXD1NUq2rEgQL7/SzIpdRCJeMuaiZak8xhaoRIrR0=
X-Google-Smtp-Source: AGHT+IFOSxR0VWlTtt7aglVFKjETqM8YWHF0sImDLgGpk3Msu3yazxT2zwUbsrkmDtaiclYuoSVVQQ==
X-Received: by 2002:a5d:5917:0:b0:33b:d2b:58f3 with SMTP id v23-20020a5d5917000000b0033b0d2b58f3mr558876wrd.19.1706716834000;
        Wed, 31 Jan 2024 08:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUn1b13ZNRzCy283eTAlYXQTLMwRwVlajpW6U17NkyZK4wk2yBhhQ7T7nAGYIIbO3fJ1ARDkhMYCymd0vjQMM0mrJ0m/2m5lqBZyglATKjW6Zzxk/B6IJxznkuZmxZ1TJ3cH/Jp7BwBza6guGnEdasuQE0GewfiE3ubxHmLjvIs78DGDJSzfU/27VEF5pveogS4Vow/bhAbdFMdW/IYDGaAnF3nYumVGAKKCQ9nOgSKC2eBOC9xOLx9JnZoKZ9Ho2yCI5z7MSseFIDdPa/XkBHE54iCbRdQndKCDPy8bxiyotgwxiZcx3+SuuiPofERe0MckS2S/6E/kyrL0HaRaM6pU0woqZankCuKbNH8VnYSPLkzkZXNl1AoJEPO2fnXvrc8+TnmO3oeiqwbluhwV/1QlsQj8h5rpppgqTJEQ3xcqtL5sWlt6z665n7oC4bUikHUEWzai7vZXm1fcPUkYFOER3XwNdulkf/usUZHT/OjBrDM0lxJa6CFYX9RdHrjmrlArydX8NPIXD5OMrv4c+E2pFpdAAT5fFO4s3946JLh8K6iNGoyV/fVL/yo3WohQ0Ry8fKH1EPmF4vZRA5gJKtC5ux/QZPWhUJlSKGm0HRLl5zV1RXt+xleNrI19UU+2m9Tgg+hmovoV0hevg==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d59c8000000b0033af2a91b47sm7494000wry.70.2024.01.31.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:00:33 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH RFC/RFT v2 1/4] riscv: Add ISA extension parsing for Svvptc
Date: Wed, 31 Jan 2024 16:59:26 +0100
Message-Id: <20240131155929.169961-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to parse the Svvptc string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..2e15192135fb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SVVPTC		74
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..4a8f14bfa0f2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -307,6 +307,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2

