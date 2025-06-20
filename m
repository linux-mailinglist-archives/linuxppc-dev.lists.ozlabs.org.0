Return-Path: <linuxppc-dev+bounces-9578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F548AE1550
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 09:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqYB6LFfz30RJ;
	Fri, 20 Jun 2025 17:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750406174;
	cv=none; b=lM54XcT7hcSBV5+/iMMs2S1UU67WSl7xvhIbzIzxUkAYxOdY3Z0KUSPvX0qOuLGUKNp2wRZ2bVyatigKVUsq63LgKaULN2SJqjVgU7gNMy3PGQWboolCV2OjDtuR5O2IfYgaO6aiPbFejiDWCQDgdDVKHgJbyM2fbVb9FiLBIrtJYLtxUdtUNzfgp8DeaIWeL/e9V04woxLY+hLACGiL3PPdOcugN6nT53T6XKxLp6QduJo5IuVjlg9VBAsnwT6CBwqXMgZ93yWelLsweDivWZKn9OCHfBNqhgCUpj4D3nUnG6kiiJjy/VsN+Qh/ti1OuhFE+sPKG7whWpRbqYBDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750406174; c=relaxed/relaxed;
	bh=TvY87dOFEDSl5uZTK8KSbQcIdJ58gT9kw8uM9F5GHbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrPz8mGHhw9SuQ3gnVp9yfPG4edvh8kL+gl3WC4dicAe1+K8LV8ENqcv+3kW8eIHfFN7F1eK8/a6+yl4lhksAqZIsHnchK0HrBFbmn3d5u2ytHr3SvYgt4HfhwgpYwp6xoO0NAp0bNldWpBSdy6anAWDzmZP6KfquvyQ3P5jb+qX6jye5ckA+WmNUpe5dtS47Hu8lTu739P6DkvzxT3bkFcASeZdoxBZ6PuUWFQJ2KwIfMdyC0BExSsW2TJtznsNQ1OsoOCZzzZDurRj1n+BQMJSlvjwyF4QaZ8WlXqMDTjGE0j4uHjmyAXdZ7DhO+sauu+Fe8PirAiVZg/1A8pc4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k6UurrR3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k6UurrR3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNqY91xP7z30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 17:56:12 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450ddb35583so2281805e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 00:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750406169; x=1751010969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvY87dOFEDSl5uZTK8KSbQcIdJ58gT9kw8uM9F5GHbk=;
        b=k6UurrR3G0ejDq68E72YiL1kRZ2RuqpT7jroBwGylR2K++fXrFENWZ8JN0EXcq6G7G
         UxSm9Snw0jONBKwu/oNo+kFR9tuZ6o8srhKgpHHblVIwgmN0jAxLqLQseN/hb7anil9P
         BwpLl4ajLuwAbwU+d1fN7H5WKZXXU39k/pXno4ZMEZSqJwCUPZxqE2UOnXWmIUToMGTE
         xvmzshrPaN8vCMZoZr/w/KH841bpahlXccg8UmWflSoVrjaGvVdndFcpOq+lmMQANbAf
         qf04sBdbGJ2dcSWjkWB6xHFWJk6l2Rlf1cMDi5Er/sRH0aGsBlqNR0FKVuuWDRugS+Q6
         3tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406169; x=1751010969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvY87dOFEDSl5uZTK8KSbQcIdJ58gT9kw8uM9F5GHbk=;
        b=Tv9bwMoT98aLE43FID6+pCx/TGR2PRHRdbTABFqVo6/cH/pkOti6EKaIqTl8GZEpUq
         tuB0ZLEQJ6zz+DAkjZ0qlHyrUAwyZpvU4LXJkb6fmWD06pvxwAfKkHyu24CZK49wIoxZ
         y+o4/6MqFF8lWHzSG2XkYeBOMYD158ksr+8enc0myAXDv+aNDUmx8p2pfvPop8JCcLst
         jZxvDG6B/+klh5JtCF6ue6BXtLCBcqaoMg7dXoCYk4SSF9mtLY12ekCRxcBa38czh9Vr
         amJw3JvO++obZmTpY5rLA2jj0L4M2j3zTC9ttpXIgZbBcLIjAwVSzMOp/DI7HpLsaxyN
         m8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU9OFyEXi6r6TMiqyKJTFkMwdK5q7QirhHh1dKXYagyMXM1E1XhVM1cMb1xoZbN1koZC0WFzBp5FMnviiM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzqe8h/QcnjK30UwgOW4DLaL4ptsTym240w2oolgzrCo8oCO27i
	/eU8Cz//YWOTzuDyC9rPNCAuJwh9QlYuSNI8Fsbe1YtotxQHUFBB0MVU
X-Gm-Gg: ASbGncvqL9/eMb3TdTI3ZyDAJ7KCHm1u3u2/qgyt9FocOhx7WP7jAfqEdf+2ltbRxAA
	n1FDsMXJRl4Iix98u9daTgebemOQ+EPeqIxwPBGwiZFbul6082nWxzAyhqleOdS6pAVANx94YoE
	JzmQvATdeXk0DUhDgKFqSwSGdnN6HZL5uvoMdRdJNwDL6yOYip4k3ebwz2ho5ldvUuGxLbwQojm
	57M+6ShYbfUxKZKeVbwd0b0yRDTQ07jdA7dT+H/Owat21lFw5lFkDsrC+q7m9H4OPvPDDvk+E/N
	t+lK/NNGQkvdMM74xFLQbFPZX2abqRrgmcT6MQ1plT2MWONDj1rkfQh9E+9B6ZsbeUSARUEOtDA
	/BKK9CsCNFt1mMPJSjtI=
X-Google-Smtp-Source: AGHT+IHYS7jIIxnZIERmDkugdwivLbicxS7Nxqbv3Ggs0pGVY2hWqBpMywyYJbdSBt8oaWkIcL7YNg==
X-Received: by 2002:a05:6000:2890:b0:3a6:d2ca:df15 with SMTP id ffacd0b85a97d-3a6d2cafb34mr347317f8f.11.1750406169025;
        Fri, 20 Jun 2025 00:56:09 -0700 (PDT)
Received: from thomas-precision3591.. ([2a0d:e487:44f:8ec9:e0c0:3bc5:bbdf:e81])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm50814715e9.35.2025.06.20.00.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:56:08 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
Date: Fri, 20 Jun 2025 09:55:55 +0200
Message-ID: <20250620075602.12575-1-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The DMA map functions can fail and should be tested for errors.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/include/asm/floppy.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..34abf8bea2cc 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -144,9 +144,12 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 		bus_addr = 0;
 	}
 
-	if (!bus_addr)	/* need to map it */
+	if (!bus_addr) {	/* need to map it */
 		bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
 					  dir);
+		if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr))
+			return -ENOMEM;
+	}
 
 	/* remember this one as prev */
 	prev_addr = addr;
-- 
2.43.0


