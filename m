Return-Path: <linuxppc-dev+bounces-10815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F252FB21291
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 18:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c10z06h1jz3d8n;
	Tue, 12 Aug 2025 02:51:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754931100;
	cv=none; b=edBN0URmVqm8EdTwHj15WOf1clqcTZ6ZQhvYyIh9SS6GQLwybYLpETx6nsgygwCqqhRDF8hQZAe91XZcSn8U84xzMvwIuF8MVCSMtvbXNkSHFJYwI/Rjjk0PzG9MWChA8GKnXFmq2X0w6bfdk4062LYrWWKFx8NQbcOAzeqPUD3z91c7nG+rwPX9Ml+YNORcWci+taeqgyxkOD9I27LiFZKlo4GUFiori3vaLitfH+6mjMlvSooJ8ExnG8Vne2srNpyYyZcpZdgwJCyUVtxvA0o6aI5fJC86ZFg/9XdCgcTb00UxzY0Fp4GCdJt3b2iB/dJTq9BRLvJI4iQyt5Pj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754931100; c=relaxed/relaxed;
	bh=LERbV0S38RbJIKVdlX/fCrWEtk21kg3d1o9P6dPP59Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=FL+KPqSqId7NTQ2Ib1vxo5Zad+8+wspcRQH999lz1OZPBQUj/8ZfhLBq8Iq4owP6nX8qIICmMgiXTGN7gD810TuE45pwAiKGeKMjLcew91OG7r5OUfCsqFCw+UafJmZjVz9a3Yfe1hgUZtWNbej0rr0NpXYgi9bxjtKXgZR4EnNIln+KCLxDVFyqieKP4bwPTLYc+3YNYbq9fijALLuCuuIqt9cR2ZlEbgo+v94UT6T2puCoVLqznRcXhXkySHPKfbbkFYTbxMSBBeYSkkV2o9qb80Dxjq8ziWcQ4t2V0CSsbwzFPQ4gfOwgnWCazTDGu/SfI74F5coaGstfmaiGgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TirO8jTP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TirO8jTP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c10yz3rMDz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 02:51:39 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso4172597b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931094; x=1755535894; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LERbV0S38RbJIKVdlX/fCrWEtk21kg3d1o9P6dPP59Q=;
        b=TirO8jTPKUqjy83LGgOFRrKjXDHLci+w1jJ+gGRx0T1aLe3IhNibrAEVdX3PxbNKLg
         Lq+5R9ylmnoowKA/k2p9gF0PFOPmssYuzBj+xcWZ1pNTg43D2xnUaY4ihtPbKC6quyzS
         OLHNTJwNgDZxFZfVblqZG+HlXqk9lruq688CUlqb2dXcbXYfNEtOEqp4LrHnEIcESXL2
         pgcXwKRy8kNy/8F+XJ0Qu3YACImw8/StwSD/UVw37SXk0Bu1A2Jbpoh1wRu3G+FXwMP2
         R3pgROFxyB/CYR+/7hvgPgnU5k5FirULvop+vYudgoR5NjgoOks6y14CMPRXv/tkUnuP
         wS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931094; x=1755535894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LERbV0S38RbJIKVdlX/fCrWEtk21kg3d1o9P6dPP59Q=;
        b=G0bCQhmaqMTJdt8qkGls2kFe6CAF9DdkxKIzI4YGhymnGx3AM+AsfQ08dzG3lEC2Ld
         RL7OLx3WO8P5DGKqLDEzuIQBtk6S6Cb0JzG+N0GXy+L1msqOLayqlsX6VqckzhH2XJzP
         5uaU1xVcuQAaV9Mzy0y9IG2KO0f/PK91YghVlzjkrlvMjbfsGAkR31nu3FRKCdWkSxrt
         WBwqafMz4WQ1XduBJn6spmjSa+KTD3FkRJWIVTWaTsTnjB2LwPxaAh1JYi3jMmbDchYW
         p+FD9W/JpEDs4XLv2DO7tIYTQQb6bfxEI4JTk6c0gcN7y84ExzQsDJZMCPk/fm0ZDf6e
         rGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUZmyKh9aJq4E8EwuZLo16joGi+dRcYnC/3oMzsSnTj/wRWw599ExZLLBMTM8N3nZ+4FI+bIRobvTgdsYM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyfy0No5VkDIlmzV4V2l7aSV7bFU9DqjP2CqCID7uDi+ocvwsXf
	/MkawvIzpVcyzNKjwCc6mUHIwrplIafPwR+YSds184S+5l3eAurO1p6veZE1qQ==
X-Gm-Gg: ASbGncufoG2VFdLrrph/lPsiew790/sONZCmunPCJQzbTKp+cT1Hib9z/JTnp1oNS5q
	7640gCgP2oJ+TjA7q2wSK1FsaH8839VTKtQCDSgzdA5kGeqxaZLAG/W/OupxDRBpB/YnDJjyVkm
	Ei0xkA+ZRJmVYhBeQNwlue4HgAQHCKlCdnfK9Yy10DUANvy1nDdPZFmkChSlR3v/tM4l8o3Suzo
	7wOa8VcxwjWLXvOVR1TpUD2wD7RJK0eR9t95+ntG02jh/vZLSFMjBikikyutrfygvRkhR6TFzJ7
	lsolCbwmml3aCO61s1f8BWqqGfjWs9p8gg0hdTfBvVGlEkXPgEzsmVoufX0QXlXIVlr5l8YBxEs
	TILlX6od+zocbIv/KX6OxSA==
X-Google-Smtp-Source: AGHT+IHdxDU1+GsAONPyuYx2xGLExrkYYSwAJYQG9U47O5KfVxLBq4NaK2X4lcJNVXSJvnN26C4h3g==
X-Received: by 2002:a05:6a00:3c86:b0:76c:503:180d with SMTP id d2e1a72fcca58-76c4606bd5dmr20521364b3a.8.1754931093831;
        Mon, 11 Aug 2025 09:51:33 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c46a05464sm8661470b3a.96.2025.08.11.09.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:51:33 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] powerpc: pci-ioda: Rework pnv_ioda_pick_m64_pe()
Date: Mon, 11 Aug 2025 12:51:26 -0400
Message-ID: <20250811165130.37552-1-yury.norov@gmail.com>
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

Use cleanup functionality and better bitmap API in the function

v1: https://lore.kernel.org/all/20250720010552.427903-1-yury.norov@gmail.com/
v2: 
 - add patch v2#1 that switches the function to bitmap_alloc() and
   clenup engine (Jiri);

Yury Norov (NVIDIA) (2):
  powerpc: pci-ioda: use bitmap_alloc() in pnv_ioda_pick_m64_pe()
  powerpc: pci-ioda: Optimize pnv_ioda_pick_m64_pe()

 arch/powerpc/platforms/powernv/pci-ioda.c | 27 +++++++----------------
 1 file changed, 8 insertions(+), 19 deletions(-)

-- 
2.43.0


