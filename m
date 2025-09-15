Return-Path: <linuxppc-dev+bounces-12248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04BB58262
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:45:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQW9h6Dqwz3f17;
	Tue, 16 Sep 2025 02:45:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757945941;
	cv=none; b=FkAInee0NRVfzBpEXI35g3gNLLWXBb5H5BCWwWK2nn9zij/Xxj0K6Riq70/dOTFRIv5/81VFwNzDA8Fx24AnUUT1DkMr16GGAuUvulLTFvmkrM4k8gbd+jn2cBt+rPHU6ML/LQfmzOcNNeT1pbRrWmuc9BkkaI8obh8wcXLo5bh3qRR8muWvjY0WNEu9LULiUHoZkaAJHXFZfTsrxrQB16YEGw75gPhhEVJ0Dy9o49gm6Fds39ax0aJ8va4L4Wh4+N7nqc4DyRzBfK1jZzadiLpGGxkHuQmrMRcvqXxTxff5t5oPGIGWA3qP/o4nODyB6COpkak1C3pTXWu7RF1G/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757945941; c=relaxed/relaxed;
	bh=ZpbkITrua1vhJUKN7WiR48HkRmbVKO0hyDxhB8JjHlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n8ViDQumT90hp/lsHZ1lqWkGEPnMJWZQSfXHGzlrlqG4KThfKO/cHA91ddHPqEcFH6NuAASFObmm/dudDqDgMZR9TMthskKWcVm5hOLcgkTis4x04g7qwtjDN8P8pm3B8k1M4+sz64uGfP04qiGf1bwXKarKBmkLRD8aTriX9R9A7/iGZErX1p50lU7pGsbyH4TITwKNKJWTehtdfRNXoTTKDe6Pyeiv/K3lSQlM43lxTZVWO14Iegug9kVXTeAAaD24CNcA18acepAufqGVHcOVqUU25HMA4LCTAyu5jKMI2mjXrMzsTXuq1fKXcBgsU5aH9a51dbXfLIDmHvTNLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WDydSg6V; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WDydSg6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQRwh3MvGz3dWn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:18:59 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2412544f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757945936; x=1758550736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpbkITrua1vhJUKN7WiR48HkRmbVKO0hyDxhB8JjHlQ=;
        b=WDydSg6VhHZCTR32Rxd9QB4hGtZIWigaHY2r03JcmuzW8Zih2+HPaiw2DAR+vkcrpB
         oytUAjYy6kff5Uw/UigAySbnXNAuvE3usDqSOS495FDbRMphNHb+XONrDtU5vKhiNGKy
         zZvgnFfw33TXjCY+Q8flOKXGqz1AsKl9bMpYw7Lu7/jKdHExcqAczoc0yobM6uhdnAUw
         d8tetuTxt/6nPXaF/TzNsGz3YD02kqKABpUSFPuIRWAUmY6Q5krJ/rW8445MwyDSnn1H
         UDyg4XPMvzyXmBkhDXV0uJl5JcW3a5K/wQAICbsCdoJuUsA1JSemfiVofAwZ+sVTrkez
         avyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945936; x=1758550736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpbkITrua1vhJUKN7WiR48HkRmbVKO0hyDxhB8JjHlQ=;
        b=fdDt963aRglFPSctWGcTCNhwOFDOAx19075iFizfbXc/A+v9a1aZfHWiraKIfuyFFD
         ULO4GyORxRgoC9u3eJz4k/WxzcXnCHHvTdG1QqIDwBx/F8pi5uJ9XZRVEb9aHs8cqekU
         obPQYeosSs9GS7cLcAF9frBLT/w07b4t6i1QB21gCNDRtDcgGRWEO+LnDQ1+dreSvHNF
         vWC4+obO5Lwwi5PXJohTyBJ+u15KUM1Un54GiZ6vT1flVrYIs+UX0Z54u5B+RCFTqO7j
         mCJvuM47T1He0r/k73C7eihO2Co4tLUMP5mie6KuKtHkMW3NpHGACrhjqr7QviPLR3eQ
         V1Tg==
X-Gm-Message-State: AOJu0YyILu8SI1dnvDyQVpUCOwGGB2NaNVB8WBmatYOt2KfqI2r9FcpU
	oPB+E9/Php0zRpfqeTr/btQZnHAcl4Gm6vekzQzlwtDjTxm4sxqBnNaD/lQSYYii
X-Gm-Gg: ASbGnctpiigd9M3WOsoo+xaz+P0A2zZxaSfPGDn9opokNMc2WjvDS696Jtj2HkO1CgO
	fnujhvjnlplxC9lS6Ney8BkExTgqgKOOxYgrffO7RcO0G2RLttXuTCkqleTaQe8Y/Q1+o34EWQl
	cRhjCJx4XEsbZnbsXqWafHPpQnIigjPWBY17inK1e4/X+IDMbmVDEnqbSvqy+8vjZA6JY/8I4Sd
	Xuu0hyHXelijJu8lkp6usfeHLn6mbPX3HZ3M3sRA/q/lWDTPZ9T5T1yvNDgYslAE803HLn4jbzT
	zQCN0/c4f3nKK0Tvz3e+aMy/gXq+T8I/RhVN35qgbrywXLbMTEp8+ZceMX7ptlxMrmVsoZ2m5Pl
	klFwM4gUxlWTSZCXfC8S/gDGXwmgoCcAd4sActeBvQDw=
X-Google-Smtp-Source: AGHT+IHYmgT2onMqBufUPZRupmR3CnSUVb0/r+MRCOJUXUaouM7O2XSBxIvDmBdJHyG24thxg2NLpQ==
X-Received: by 2002:a5d:588f:0:b0:3eb:9447:b986 with SMTP id ffacd0b85a97d-3eb9447bb89mr1990966f8f.6.1757945935851;
        Mon, 15 Sep 2025 07:18:55 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037b9ebbsm191083595e9.11.2025.09.15.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:18:55 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	mikisabate@gmail.com
Subject: [PATCH] powerpc: kgdb: Remove OUTBUFMAX constant
Date: Mon, 15 Sep 2025 16:18:08 +0200
Message-ID: <20250915141808.146695-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This constant was introduced in commit 17ce452f7ea3 ("kgdb, powerpc:
arch specific powerpc kgdb support"), but it is no longer used anywhere
in the source tree.

Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>
---
 arch/powerpc/include/asm/kgdb.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/kgdb.h
index 715c18b75334..4c0afde87e97 100644
--- a/arch/powerpc/include/asm/kgdb.h
+++ b/arch/powerpc/include/asm/kgdb.h
@@ -25,7 +25,6 @@
 
 #define BREAK_INSTR_SIZE	4
 #define BUFMAX			((NUMREGBYTES * 2) + 512)
-#define OUTBUFMAX		((NUMREGBYTES * 2) + 512)
 
 #define BREAK_INSTR		0x7d821008	/* twge r2, r2 */
 
-- 
2.51.0


