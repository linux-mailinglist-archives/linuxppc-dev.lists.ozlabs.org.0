Return-Path: <linuxppc-dev+bounces-13516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF22C1B8E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:09:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVyz5T9hz3bfV;
	Thu, 30 Oct 2025 02:09:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761750587;
	cv=none; b=WmVPwz09HaWcZFNEnoSB0/ZVxCXR3ANt26xhD+a0V7tkT89S6mPemWLqqYBz3/bPwuQADUca9+YfSLss6Ej/9ZN7q/GPSLTMES0AsZf+tOKYwkdkm5S2dSHB45dSCyAOkVuYHUVWU4HKBSR0WmjPLvwisjRwoLtGAmJXhETXTWNjR99s+MAPzvg1FM9/B/DjcuKfsjSjPDotfbgySSaawgGNcMSI4GX0UELvza0qY3RoP6u0yIc5FaYrurEQy4XXnBATcgMpBmFNkapqJe5DIIMxl6A6pmaD0+NIM2HkNGA9UP0OiZx38xuzyK5m63dDJfV4H+cktvAB3aeGYKYNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761750587; c=relaxed/relaxed;
	bh=TDVcuv1mfeIpSK3q83K0a2QfXRJdbHArp+wCNkw9rZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehzTUGLHNCLpxP0vWia4h6ipQ9+mly5s4cIBniYZtWf40KSGlXvAsoUqfFaWtuTQPe+E/nMSMMRW47LnRbaD9JKRDdmrBpppp1/3r4hpowrudDSjPPJcq8jc6+7rZxBIxMihO1e4mKmc2e0VD3luxDZU2lofBT8HadYu8ui+azUo41T+BZo+Rm7G6d/Nb0oKQQtuydbRC8xvzTPYuaI0UKHUDNbTDFe436S5L2EzgGUGPNW8ROAZnlYC96o1k2GWBBGhT9OjNyCZSQkrnBQiAEBds+fuHRpoF1xp0z7e9qofse7BTiQHPuKR7YZKQ990Luuarbzdx2Ow4CvIh4C3Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QmMC5/2r; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QmMC5/2r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVyy51rKz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:09:46 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-421851bcb25so4525046f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750583; x=1762355383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDVcuv1mfeIpSK3q83K0a2QfXRJdbHArp+wCNkw9rZI=;
        b=QmMC5/2rFtQMX1nwLJYLbwgsivWgwCCT3bcPtklDH4jC+fWbAAE5vJExfHValtSLmd
         Ht2xiRZx9sHtKwX/uQvvO2/2Wgt7T1r+tdfJrsWiWAvLIkBIy6ZJgBNS1FphCq6pPb4P
         im13G2ZEYIhmPrfd6wxxNuOkWM1nvGvchoKo2ON2SgvErTKOKlEDgW+Za8w/LEt+WK9y
         +mx/QnmdrPONaJ7ZIUeXulbUWlDwnaLAp2BZLWti3rF52+BZqPCUK/VSbNl55UgKpPHB
         1dlzjTz4kV27X67gA4Uq4p61RppQDPvUF6KPoT90NWDKNgeRujb8N7Lmcll9DS6+N/9d
         L2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750583; x=1762355383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDVcuv1mfeIpSK3q83K0a2QfXRJdbHArp+wCNkw9rZI=;
        b=JMDkD0bvnxH2nGFqzMNNS/NwuEzGbgS22P2jmxFz8HWvDzazDD5FcRoDotSa/8tAY+
         00sHR6Uxdty3mmFYd84dw7NCYGCYAXi0liJ2KfJSjOm49thKZOXb5+dupdAC4UmoVNdn
         zrOyi3OyFIbZKZ9d3odmL/KQZ/J0o3OfDadmpB9MOeb7Xraao85SQDOxXRIB8DVCWcB6
         gunTOSbA1CfXY9nKsuF6Jt5je8bNnZbpq5aTI/f/YTgcWI3xYdUjO1s4ZIFo3CYKCdVa
         WosJDj9yysnm1EUVUKacK8jdlGl2JwyU0uOZq8jxfn1gPpd+DGvzEem9F5tOGDAUImTT
         L7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUVmr7C2p+B0v1LsKRLqJ/7t0fuC9glNTe39CNqglz7bZ5FYMFH55PRnmNOj9lQCftC+9L9nj6KbxaTOLk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVdDIufwVL6DCA3iFfyxzsY+2P3y1b6UttN7Dn+qSz1qxSfZju
	Aj81SXpUFBEPq9xqcu+QlEQXHAT+TgeRUUY6E9Wg++dDynzhtMGQsYCw
X-Gm-Gg: ASbGnctJGFNqOsi9a1feviE6KWUgMHF5vXuHfT9ZFAh6kiTTHSGJk36hrqM7G5Mm0E5
	cjcIjadmxMj8yc3fmz0EmKrqnIClba1qNprGEbFU6jP/lxCdhu0oK9g3vhuIyWM2RKh10tUtzFh
	BEVvSZZzUcTxjSMCWLIiQrjU83CQa7pZ6Lk0NTEsb9mDIoxGJweSkkBPT0Ch3J7Qj+yj9qI39xN
	Ai2Sd3ncRAFC+DwPGhS4qRLo+KgjSsQ1S5MACqngJVS2KEe7boO+2S7zLMFk6jP1TDfETY4JiKa
	fIrBUzAgXdzE3cejb27mbuOHFroGVw26T4+Acpq/Uy+pPgkiJHTpdkOobEDIs9zl6dVYWTYR0or
	TeYIFkixrKkqz+KCF70j6K47k1uysehaR1bOakSMgat3dlrV9VlOPGyORl1PrCOgDIoRLYI8diM
	D8hhoWV6QzwvSeS5SHwDX3VvFoQbDCCqdTLa2DJAnAVg2PFo168Q6xFeoJBI2VyIVSydVo
X-Google-Smtp-Source: AGHT+IFr5lXTMPj28TgIXEQnhqGrZvFG8wCr+BEM+nWtQqin9EbEnz1MWXEHn3P+VkAb6rw3PLOvqA==
X-Received: by 2002:a05:6000:4712:b0:3ee:109a:3a83 with SMTP id ffacd0b85a97d-429aefbe00dmr2910419f8f.29.1761750582940;
        Wed, 29 Oct 2025 08:09:42 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e3c878fsm54565375e9.17.2025.10.29.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:09:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arch/powerpc: Add missing includes
Date: Wed, 29 Oct 2025 16:09:38 +0100
Message-ID: <20251029150940.2523328-1-thierry.reding@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Hi,

I've recently been doing a few test builds for some of the more exotic
platforms out there for a patch series that I'm working on and ran into
some issues that seem to have been caused by the framebuffer include
rework. I see that Thomas did address some of those already, but it
looks like I've been running with slightly different configurations or
something that caused these additional ones to come up.

Given that theese seem to have been broken for more than a year and it's
not exactly clear which commit it caused, I didn't bother adding a Fixes
line, but still wanted to send these out in case we want to keep these
platforms building.

Thierry

Thierry Reding (2):
  arch/powerpc: Add missing linux/of.h include
  macintosh/via-pmu-backlight: Include uapi/linux/fb.h

 arch/powerpc/platforms/powermac/backlight.c | 1 +
 drivers/macintosh/via-pmu-backlight.c       | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0


