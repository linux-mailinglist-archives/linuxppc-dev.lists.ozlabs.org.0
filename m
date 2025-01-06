Return-Path: <linuxppc-dev+bounces-4702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969FA02596
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 13:33:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRYVd6rwHz305C;
	Mon,  6 Jan 2025 23:32:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736166777;
	cv=none; b=gg5nw0nfv1MQxPDAxUqKGPcBlzrAIFWEAA/VVihEleE9/Osg/dx4BCnxs1XCOBm1marWMyv89XxtNKSENL6G6gFMchEhmc4EyVW+c4Jasf1/LZjqha8xVBKaZqRWOI8z/YSD7DhP+S6JDRSEMtCSCUcpvJhc4Jq2a2QoT357Mw8nCAsHqIh5vaptPGDs2FC5EcmPRU0jFO+9n/JcJFWZobKfaNVSSFiLkt7Re46ySkEZbkVJNdLFBepKsJwGxb89tf2nnyHBelcuRF8lWE3Gum0wuhOH3bYh4LIAkWhgpmKZ6yAiyCc4kZje025E9e8WWZ3dddOdFGfBhpnjRFFdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736166777; c=relaxed/relaxed;
	bh=upfVGfLdPJdNaeuDsPkyFwn4zCRADMKLakWk6z1AaQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U/A+k9U1ADqk0WvpoAJ+t8+CxYVOBpNZ2lxTc15dN1MBBKvpumtTcqEm5w2IVTMpbi8L9k3wlisPGzCVgPRSvaY1StYY3nGumyXM5mV+xkUoxbbmrJ0tPNE+VwbmZKVemULV6yJ5Ma0iT9lHZst+tLVAXzQvx4Y0G4kG8VAqVN+PF/nRCKh5k76XPecOG/ScA19Kdc7UvKF297d9MnPLbYy6IIw7GoZvRGnuue1BTM4CnjGvyN4fMIpR+NLIy/h7bgRtewKj0Bdlm1OgFPRGF8flZFopjXt7etl6Ksij135GER+FIxumwOhwh/Avn0yyXywN6uuiPrW7jSKas/00UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQAoEfwv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQAoEfwv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRYVb4Zx6z2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 23:32:54 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3863494591bso7365063f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 04:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166765; x=1736771565; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upfVGfLdPJdNaeuDsPkyFwn4zCRADMKLakWk6z1AaQA=;
        b=FQAoEfwvInvxNX+73XO6kOLGfxp0sURND5FWZJSpaWu6yiE+z4HMAX/KWbbNgszdZO
         ZNnkH7HuMzcibUa/s21tGza9QOhTa674Zdj2M7YjeMwFUKniY8ww8qStFeOu7VKt3NtP
         MFuqXlmmHDYNHbLezrB6N04KuNwqkvEU50X4lMApTG9QQz3gbiG/tP6f3Rcvhb/xLqf9
         Ae7CbZyIyJRB7LuTJSwGTTFa5FUBD6zx05GO/xZrQFpTVDiJGoNkOBhMZepNpHTleqRK
         I9uY/FdvePlOubwkV/vR7PBhH7GMjw16x0Q6JlBLZ0FXMMtSZENEWIvS9zs7KK7xFRZC
         1Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166765; x=1736771565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upfVGfLdPJdNaeuDsPkyFwn4zCRADMKLakWk6z1AaQA=;
        b=a7DbXreXyn4aP1qD6wponc0K/WUIdnIi5Jwhj7w5/3l8qhuxWLPyHPUnL71swTbuBR
         8u0DkRNS/Cr4UJGZRbHG5056NjVHihxs5P4j24mlWrThAugvtBfjD/gYBDdpGpZ+uSnh
         l5QkVlhh18cOVOqy6J+MXDlJhYHO+BO6mA1i5OR0fHHQYOKZOw1oUANfjmS2NW2z544N
         HICdZKcs2hMuEtlQHv031so6efYwaiiIuHfQo6pJNaAv3Ac5NfNDmG7N3JOHzjMNvSVH
         S9/WUdKmwbo3CxkFNOeUtbk++3GnkTjeQirTKUlFPi/+b04mzyC385dJBO6tcQC1+Fse
         HU1g==
X-Forwarded-Encrypted: i=1; AJvYcCUZqUER59WZLD9lzLqtf8SI74zd1k2dJuyaTW65D1lu0KvmzvuVGVtGWjW8EXsw+4oq2ob0SbmWwdh+iLE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx19OjumMRBszakjenBbovf/ELhpPNzmBScbX1SQB0e8jdrn8Ft
	4k55bVTCqaLs93fL2HClNwpyTaf8+AcEUYbNBT+4F2qxFNXG74kr
X-Gm-Gg: ASbGncuNwBod2B5qub1+mkLUpP3YjzgbXf57f7wp7VYPwwFRTFVS/OqXs4LNs47Advj
	ME84Lq9zDtz2pb+LE93SJXkYPHGOnBjj/2W39NsaerQ0RaT8rqc/+/qUZjrUVMWGGOGrBRX3+pV
	BeQUjfeFtcyuir8CfJZLUYuKfymCVt8YgSDhbuPecDCYV1iDbs+FeB3xio8Qq6pQJoah1sA7IGp
	qbnZ8ebIT+uAsaFzaHj5/B85jViNdiDp/EDMBm+8ru5Vyqa5GtgkkiPkg==
X-Google-Smtp-Source: AGHT+IFHDaK8skA6aFPDNzRbr0ISejolPp/E6ljeVU6QwJwHkWCd6iUzRzsqc3YI9IdZHqatO+xzVg==
X-Received: by 2002:a05:6000:4b06:b0:385:f465:12f8 with SMTP id ffacd0b85a97d-38a223ffb02mr45640499f8f.47.1736166762987;
        Mon, 06 Jan 2025 04:32:42 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2afsm613683365e9.35.2025.01.06.04.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:32:42 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] powerpc/pseries/vas: Fix typo "mmaping" -> "mmapping"
Date: Mon,  6 Jan 2025 12:32:40 +0000
Message-ID: <20250106123241.161225-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There is a typo in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 0b6365d85d11..b50d3deada56 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -490,7 +490,7 @@ static void vas_mmap_close(struct vm_area_struct *vma)
 	 * address. So it has to be the same VMA that is getting freed.
 	 */
 	if (WARN_ON(txwin->task_ref.vma != vma)) {
-		pr_err("Invalid paste address mmaping\n");
+		pr_err("Invalid paste address mmapping\n");
 		return;
 	}
 
-- 
2.45.2


