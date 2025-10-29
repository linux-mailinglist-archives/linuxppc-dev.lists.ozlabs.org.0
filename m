Return-Path: <linuxppc-dev+bounces-13517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94EC1B8EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVz21kkmz3c5y;
	Thu, 30 Oct 2025 02:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761750590;
	cv=none; b=m4fx//jTiVzBYarLj9lmqrDNF7HbsnvFXPZJO9bcSX8g+xHWY9Ge8L6rIrJdPOZw5qpzSsMDCZ5oClXGdIUiLBFKQsqKfHoYD3u8Tdk3Nizx/1TDqiXcnxMgI0NIistL/D1AoppqsoAwVfJxDgaPQfHatkRNbXeGVwz/JNST+jrQJa6Pf6mVr3CSmZaVmJZaXu+ExOe5dAkIkRXi9FGw0nQWNOnHA0F2KrC1YW/ss/ZtL5QFpeldV0f+rVhljkDY1YJ0Q16BxmBQpfy5OhkCx1ghYJssyV/sm6gU0CNT7qcJar3otjZQyZv6/kxmPPSC37+BnDyMITBK5rVIOsu1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761750590; c=relaxed/relaxed;
	bh=XcXGox7y0cwRE4CfkiPlGOADuJhkEFKXu0gn9JmTNNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRMSh5WzrrosrtiTpSLtj/QtG2PpqCivBZXBsJtpNBUiAmVlvpX8kokkRN4oWqQeW8SSLn2KBNqUyopbCMtzCK+4zAb+56FH64IW1eVIdB+RJk7z5i1ydvDPZDK6r/YNnWVRv5ODt2/do7RUAeHb97o1qNwTrVBGMx6G4k2EfR3t57moPc+5uo/PQUKRMdIiyxLL0SdmRr1n/Ib8LsG028ZUntuERd+xeQCo8pjgDONvfRSixxLo+J9nmOvIgrrln3wnRWxZ+QSJ3E8eFpWv7+bj+h/+sfow0E2jadByysUMTT+Fv8H9l7Y6JykTnWCLOXMLh9BkMVetjzogJN6YHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qswo8ImW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qswo8ImW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVz12dTBz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:09:49 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b4539dddd99so449849966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750586; x=1762355386; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcXGox7y0cwRE4CfkiPlGOADuJhkEFKXu0gn9JmTNNs=;
        b=Qswo8ImW3ox0O/g6yQD8I5WP8v6uxmk1NAODsjKeAOAyHR1s0ifVRL9msAV30qO5FC
         UHA5BIcXNeKRaulE8ID56iAP5ZD2IdwR9l6nbuGD6IeZGao2dbUbY0o/hwm/T2MSLWde
         n38+g7OydiwlFOz+cMfbJhy/P4ADMl7/V9EMT6zxe6DFvTJbrMGSlHUzE0AIGqlHD0mM
         43gR8CClrwJ2rmcjzbvjHd2PBNeAJbdwXbsBtAVLWqcR/HUS+pCYbSk65keTs/SAhL5i
         dlQHhVaP3sRjL2eSuFj57yi9ksncoe19m2Oh/tdCDtG80rOXigQsd0ltuJcnLswUNF/W
         pJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750586; x=1762355386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcXGox7y0cwRE4CfkiPlGOADuJhkEFKXu0gn9JmTNNs=;
        b=iEAL6y9JySQ0RUJTHnGpkYjeHhKsVSP3aKSQPRXxqG7qFtuCd3FCzzyw5pLBFVobcv
         6nUMxXMVpMOWPpGSP7Nc9vqX3enR8ImPY7NtD/Co+u3AohXn8ML/7YfCidRUz8d6cKfj
         /TCzTCQHjp+9ZtWRztzdS1/Nz95fViYsxsDiOdtK9jQfZlUMuF/qXQWGchTVCk5aO7qW
         YjhagP3Yi45M4lIcadffBZlY+e9L7oHumtidcYloL36kJVaXJQcpozt6tIlXdlXW/U+f
         BP5SmjKpn0Ws132SpyfP2Xs+lvObiGr6HcHyEt2sNaJy99voh4p5hb8JLjW9ZuxgpFAf
         gs2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLgv6OM35xp6K9VIEpzXwmYTG3qWJGXzLoTrxQGimWEj0EIkUcGGOD2qaV0B5GOwD0cALtyE21dYUaVC8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZyrLCqXD9IjY9/6adYmzNgdbqS3PgCCZ4trY5HlhwgyRNIDvN
	PpPBhe2wDmi728gkaI7XjngI7g9CtWcWwSFdCeQw1C653EV5kETzPrU/
X-Gm-Gg: ASbGnctZ+v64jtZ3vAOE4xFIngYjtsx3zKK3LIyxsUDvz2Lqkd0gmiJ4n3AMs4zkIj7
	UjlvEEto4sUY9ctU/rVpafL/sWpKBN7v9H5J4iSzUiQcbxUgpxfxZb/XVFHzHItct7GTnuniYKa
	phKx7epRpIjoy0NXOUpejpSOTFlgzNM/KH1W7MouLGe82AAcogzAVb495VxoW0cvqk2PWBNpZbb
	nCLPZMf9rlbDkuc+9eCHMI1zvA1JudwA7elaD0rCtn++GL+eUZNvRH0E82nRS5/l9ojBGupTV1R
	/agXyx/rNoaaJnSfxuZ2QBAJICvYmlnYURXa9YJb6rEOtvm41XO7nZW3TvRL4M4eOAem5B68fw6
	MyAWrp3w8QL/NQDzllhPCyNaE+zICPh6teeohBHaIItPbHxsnktZnKfugHIQftCai+okX0R1ufE
	wSjkKEhd3Da9tA8s2+5z1qSC//1WwAwUycLJz1hrsJTMA6zxZDE4o6hPZ6us2EPpWaWx/c
X-Google-Smtp-Source: AGHT+IGeN80yBTVwepT0UtoR4GDMugcmaClP0NFTb2hJM8RsJgkOD/qnRyovr1c6oRvOZ1VOicsCSw==
X-Received: by 2002:a17:906:6a15:b0:b41:873d:e220 with SMTP id a640c23a62f3a-b703d5577f8mr331767566b.50.1761750585572;
        Wed, 29 Oct 2025 08:09:45 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d8548ed8fsm1467639466b.73.2025.10.29.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:09:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arch/powerpc: Add missing linux/of.h include
Date: Wed, 29 Oct 2025 16:09:39 +0100
Message-ID: <20251029150940.2523328-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029150940.2523328-1-thierry.reding@gmail.com>
References: <20251029150940.2523328-1-thierry.reding@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Add the linux/of.h include to make available the standard device tree
functions used by this file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/powerpc/platforms/powermac/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
index 79741370c40c..9afb64723649 100644
--- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -14,6 +14,7 @@
 #include <linux/pmu.h>
 #include <linux/atomic.h>
 #include <linux/export.h>
+#include <linux/of.h>
 #include <asm/backlight.h>
 
 #define OLD_BACKLIGHT_MAX 15
-- 
2.51.0


