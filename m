Return-Path: <linuxppc-dev+bounces-8370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBAAAD5C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZslMX6Npvz2yD5;
	Wed,  7 May 2025 16:14:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746598440;
	cv=none; b=HttCSxjcLwYiA0nGaBC1jxwGau3X8vnXYOMYGSBZWKEwiFJuqjjaups1p9gwpDpnikzLd0ke/uQzU99thmwL2wPGBfjHp9G/PtgfYwu44lpF1cAGUoN9srVgkrF/Wg898rRwgcn6qWX2LtTaLeXl8ljKd5v9F/iuXZL3MtpBe2Oc26HfTa6xs/znKf8va5FL5Azse9a/oRXdJLFjn4aUZ+BjcL6DM421ngmOg4LRkg1IbInlMSQmIc65aY9WQaL/hdt6Xkm7prwD2KlsJz3z3hCkUE4KaPhnbQAd0WZvUAU8IJmiO+OR3L4uXkjhLYwQJnvHi6asm/1mmpmw4rUzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746598440; c=relaxed/relaxed;
	bh=6vm+0Lb5O0nFfHF45Rxd0EU26SBQ9dTBWQWsUCmh1So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2U7FJ+XhP8ZPofLg0egSSFbJ0BSRW5hY2P2P8uF0BTUuGw1HM5+3PL5E6S6FEJ4B4N2llVIw/TYOghFBIE/tBBBuoKTYEDlffnqUPWctJlrg4FgRCvl0muxoiErgZ2pW/G3v06bELGLzS/xGNixm5EeINVaYGJ5rNkDzvqTjtCtPe7ySMRpEj3PtFU9kHmCvvsP1j5kkHi7Yec8w/o2V14qrdW4kw9esLcGMViH7oSFEBMAn/6/rMfThsLRvYrXbIbW2X979vSbL5LTUDeEIjdWBit1nXjSyxLnT4McQcSrRxP/eVn3lOgQ/dRocRYpLIXbPkFfUv91i9r+83Ag0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jRAGWkLx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jRAGWkLx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZslMW5B8qz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:13:59 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-30a93d80a80so1181761a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598437; x=1747203237; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vm+0Lb5O0nFfHF45Rxd0EU26SBQ9dTBWQWsUCmh1So=;
        b=jRAGWkLxC/l4+iknfpemVaxqF+2GGY0Bf/bBW4ykj7oliympaO4cCzappd46ekOtG9
         ByrTBEM6K9FUHQidwqZ5kR+IXT0yIyVmAiv7Zv3O3k7uHsRo/zsWUH/7TBO7GTifg0Wm
         awROEevXNx/KV8XVVMdPfaEyM+iSW2EMLzV5yBW7n57PbbTZi4Iz/RDIDfFN9F3UvQug
         WxzuRlFyOfI9eZnNz/x6m/VEMve5Phg+5KXmFctJtcgUXAsEmZG4NPwtHnNUsbm5KDZB
         aG1gecPiAXmCoPs31U7wlrZy29D3QjRuityIWxoCiuvMUapsuJIv2Nd9qeaZZkx5YH9R
         U60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598437; x=1747203237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vm+0Lb5O0nFfHF45Rxd0EU26SBQ9dTBWQWsUCmh1So=;
        b=VD2RgUTnXB7jN+F6ia8fu9bLEwdv3omP8xKz+A3ovEd9cr75hdTPSO1ups/twMAwVz
         XEiBuiypIQxoKtMar+BwrH7nUR88y/nrNsBfUKKtyYDiQclwygjtEaxenmUI2lF04/f3
         XSDAashWwN05yDow7Bv18gIC2B0JwHoSJ4uTIiRi8R80YQUA9M0MyLmIXjfFciP/d/xB
         VN0xidEnttFVHxblTLPEizDyRI0HaBNknV/fIw6bpnyQNLRAp7RvUHJHWWZecwTXAFI3
         tP6A5S0LUSWSnnMnMITgGeeP9PXaRRTQ60P7EQ+fCeLZ+N3PFJfmy2lF3y4UEjpKMr8p
         5tKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWObfP2GR0Rqv+fW33BbqLVepBMrT+qIixY7MUXoG+eITQuQPmBPgbMmVhWuZ35LivsOJV2ktLiAno6lo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YycqXRtbOL6OemYhMcPX1ttDgs5I32pFYq0WfjmdRRIR7C3KQtI
	b0wGqIzjXj/CdzSEoNXKWvcXZmmvi6MvVXjbrWIv5l9lTQO44pDb
X-Gm-Gg: ASbGncukegtPMUZlGXVH8CsIO8iBeyyq/2HdfcETra0234RYTBQHe2IHWYSirLtQEIu
	/n3v/axA1dz7rWHtnMNQ+5t+M0b4uNjdpWhoSb2XNI7NLMDWHSQbAO/PIZpWk3UhvaL2bmVoxGq
	+JJhS8DdrF8EOb1AJc7PTeRzwKKhlY2ledlxCEqTmKt+gqSQMHh+dutXcZ07RBxcEE7b6larhc4
	UxGIfOn+U/eOSDndVRCivqk+ljKQkGRDIWMdidfZ2p8Ey5a7RfG0jZQhFR03Mk84Q8EG7hnLuBv
	zpTw8543biJh1wIt4HhJ3F+XOBgvLE90INGfcQs1
X-Google-Smtp-Source: AGHT+IHieGl0XKScok6vqvy/w/N8xUPc60HTW65R1OFneHoR2yn38l0NW+LUejGODqY9FuJITKOr0w==
X-Received: by 2002:a17:90b:3908:b0:30a:29be:8fe1 with SMTP id 98e67ed59e1d1-30aac19d3c9mr3558333a91.9.1746598437436;
        Tue, 06 May 2025 23:13:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a81015002sm2201345a91.0.2025.05.06.23.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:13:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BA9D0427A6BB; Wed, 07 May 2025 13:13:51 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH 1/3] Documentation: ioctl-number: Fix linuxppc-dev mailto link
Date: Wed,  7 May 2025 13:13:01 +0700
Message-ID: <20250507061302.25219-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507061302.25219-2-bagasdotme@gmail.com>
References: <20250507061302.25219-2-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=bagasdotme@gmail.com; h=from:subject; bh=pM9FqZnVNazjsTy87XiYOeCdoktvmor3drEddnsJK5s=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlSP9h7RLe7uX/fZnCDQ2nSg0Bj7h3zHv76JK72nWerD 5fQzP49HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjI7I+MDPfbnPj21x/65mLM 9Mba81BbyrT9GzyiP3yeUaGjK+8YrcTwh3vhnK+T79epT1h3KLhpVcCVHjGdjP+dHrc/RbEH6F9 tYQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Spell out full Linux PPC mailing list address like other subsystem
mailing lists listed in the table.

Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index fee5c473150177..b613235ca18767 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -363,15 +363,15 @@ Code  Seq#    Include File                                           Comments
 0xB1  00-1F                                                          PPPoX
                                                                      <mailto:mostrows@styx.uwaterloo.ca>
 0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


