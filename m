Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8396459F91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyzx64hgwz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:53:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=obnR3EvC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=obnR3EvC; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzvy4hTkz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:46 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id n8so16607215plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8V1scHTGZcm2Dn3vb3tzVwF9hzvzB4+HDzAd0pKgKw=;
 b=obnR3EvCadYJ/aVWk54yh7ghrptDJilaMQrUpTRxVPuVt2Cu5DQ7DK+GX3SPx5aFk4
 NeLRDPkyzGOzcNmaZr+aRd9D0ycOtHQ1bWArJT6aWdkONgNSjiUNcHg/6sS0kpHzcnRi
 QEPnTtJza1UvMT51j5aH/Ju60d+LJY3fmoxx6Zr6Ub3E15xE9Hyt1zHEt6w26dSFJwBn
 MKAAMopNfZi3BdbXYRKOMxbZK7YbtYXlUvhmJ84jjVweeFSkvLyMvIVFs42y9jy/EYEu
 Ldy+1UfuD7/TSviB6heWv9Y1KSMjPu+f/JOYrQEkwMAjcJD3gY88pLnNsmgHsNjfxtQz
 MZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8V1scHTGZcm2Dn3vb3tzVwF9hzvzB4+HDzAd0pKgKw=;
 b=NQzr7V55ry9lv5y8nNb9nSKMTUfVTVPXWsy4aB6+sSfHPODMKA6ooxzkggPtXsStYH
 8P4NtcG4PBGo8UZ+JR+6ZnSBvvK8ICSxEgNGZP0t3pjcTsxjGs8hdDusKnBP+13F2hQB
 ji7Jjaf7cmDfdZk7yRiFfXlavHCJTAJ05I3cC2qMe0SEEIqs3OgnsYfR41D1vXK2joJx
 nGjE5TDgItPTuq3DtlXG0S9mCslpVJQQOQ+MIeMkBDDaGLz9Q208HZOiseAf7SpNjIa5
 DXSOfqw74lgqWqkDCRyZ7cRgr+ec+JG7oR6esofHVfszBp7/L3XSsDNLSWxn5zv43lc+
 Wl9A==
X-Gm-Message-State: AOAM5316Sp2hZnzsz8dbNqmeVVXzFID2BVX1X7y82wqh5vJWxlCQUbtD
 yHz63h1+mRxfAqGVFOXXMZEE6x8Ef036rA==
X-Google-Smtp-Source: ABdhPJw+D48e7ZyIFZEIEv2QDyfOMB1UdXc0ez7QmKfNGTyMqe2G53YAB4AAO2fslmshN1I+5EbhoQ==
X-Received: by 2002:a17:90a:4212:: with SMTP id
 o18mr1285293pjg.154.1637661164112; 
 Tue, 23 Nov 2021 01:52:44 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/53] powerpc/64s: Remove WORT SPR from POWER9/10 (take 2)
Date: Tue, 23 Nov 2021 19:51:39 +1000
Message-Id: <20211123095231.1036501-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes a missed remnant of the WORT SPR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/idle.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e3ffdc8e8567..86e787502e42 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -589,7 +589,6 @@ struct p9_sprs {
 	u64 purr;
 	u64 spurr;
 	u64 dscr;
-	u64 wort;
 	u64 ciabr;
 
 	u64 mmcra;
-- 
2.23.0

