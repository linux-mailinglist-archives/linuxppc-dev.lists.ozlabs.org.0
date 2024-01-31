Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA17844398
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 17:02:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZL4znBtU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ6Hb1XLPz3vj7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 03:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZL4znBtU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ6Gq378lz3cX8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 03:01:39 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33afcfc40e2so1235187f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 08:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716895; x=1707321695; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7GGjOTfTMBIIqyaAo6ALuSMS6zgfYAZi7fWs6gtAQ0=;
        b=ZL4znBtU8k4BTAwzqqZDDcFm3NwMm4iRh0rF2UzUXI87ajpQ6y+bWIbIoLYvUeBfbM
         BLqXanVkgO+6OPavtAufvWYDTfUgXD3WTxvIz5GrHyDSTpVT3pMVkjfgQTSMbsI1kC4V
         We5tWIzdFmaekk7/gVSgxFiZ2wrm16RaPQRTs2SGVfCEN2cNHCwdXBue074vDxUwhWZy
         sP65DLNfEyFyMbFOnIVM/SrlJSv8PH4QJ2+YlMtHqwtifthZdhCS/Fv93qSIC77pKw6g
         d8OoJMUBTBi8C+EuIaVFN4hVtvRK/wroMhLw+LYLq07ZOV/eUN0kdbl0UJStFevr4yGy
         U9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716895; x=1707321695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7GGjOTfTMBIIqyaAo6ALuSMS6zgfYAZi7fWs6gtAQ0=;
        b=VxQphm+c7D3OxyAesBmHgVWwrl354NgTtwt/k/evQFM7iNEKT6cHRsIeG2NqSnwcnP
         9mDd1i+7BLp74bjsMmHJuOq4rSSYg1uvLQdB0lCI4TtBvXob9J139+2XMgbq13hFJjpl
         RCJKG7NIhQQe51nbT6pqyFmVtP1C5uQDOrjbHXIwBw0efwjbCRZ36jS06E0vQPheCf0f
         9JCjHXXmnc/s9bVEVKW0WeBEOcF7mah25d/wfANpvxrDGZKW+D8SGzwXj7PpkWjPyXPQ
         +YIPBKuS4nyXvcCcOinoish+t8jICASmzsRsyDWVF0zmY9CiPkxQfiwp5YW24oKESYkb
         s0YQ==
X-Gm-Message-State: AOJu0Yz7ZNx5foNKvqDHd55NOeo6j8LbJFwU9+56bz6CYaCu9cs8PSNK
	yQc31pVXEG6KRKrGby7zxTBPKCRj0U9cHekb4txKUe/OFSxggRhVjipiibNZ3Zc=
X-Google-Smtp-Source: AGHT+IF78D/rn/QqKCF1O6AsFwlI/Sm4elG4q8phM412N9lSIrsSbe1rAE7TOm+63SArxDbMqaKiww==
X-Received: by 2002:adf:e292:0:b0:33a:d2d4:959 with SMTP id v18-20020adfe292000000b0033ad2d40959mr1290673wri.11.1706716895453;
        Wed, 31 Jan 2024 08:01:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUMmlfGb5QJrtWjQ3hwdRXHqr6tBQk0FIxMX0uA5P+4YYcbUZ8kMED0+5zSvPxp9Se7FDafq1n/DY934cDYAzBUsuJC61YJexveBQSJLg7aTm75drBWzhDXDpPnE0l7gnKGYL+NZ08V3zM9OcyZg18MIDPvkaVKY3n553LA+zl3U+PBNVZSqQ4OJFYlAd+XQCVFsqmjAvgAu94sEw9sEJBxzDIGrAwSiwP+rLI1AOEFoHCQko0EZIEwQuqgCuHpX6cP/EEYYWnOvDzGKbvNABXq1TpX3vYsnWd8cF2ONfdDW14WDtXiy37WLvtJt38NeCjgTKUFonqMDLWTEEk037t8rkyOgpIafa1COSx7MktRFXJuHq14e0rmtyCCAh2qsI+eJWk8yrEnwRA062YhoPJHPcwhqxqj4YGj8RGlqwf7fyXJbj6WVuGvHK7yb1D/+NGovyndWxjJOD2rhLLW/XWaX+s9UrHLCyvZef4E7hM2FoJhLzSFkuJKEvG/jCTxRNoVuv8MXActoVinBxYpoKfqtvQbEYibDAr9IFUTB7YggocoqH5QJHoXjU3mTpGGZyZnZP5qvj2lgg1N6C6BHU/XSetdZiGav2/UV2L5p7b7QF4caHnszz4xB08lDGxMWBuhhqpKVsqMtaPPUA==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d5291000000b0033ae4ba8ca0sm11407009wrv.82.2024.01.31.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:01:34 -0800 (PST)
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
Subject: [PATCH RFC/RFT v2 2/4] dt-bindings: riscv: Add Svvptc ISA extension description
Date: Wed, 31 Jan 2024 16:59:27 +0100
Message-Id: <20240131155929.169961-3-alexghiti@rivosinc.com>
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

Add description for the Svvptc ISA extension which was ratified recently.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..59bf14d2c1eb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svvptc
+          description:
+            The standard Svvptc supervisor-level extension for
+            address-translation cache behaviour with respect to invalid entries
+            as ratified in the XXXXXXXX version of the privileged ISA
+            specification.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
-- 
2.39.2

