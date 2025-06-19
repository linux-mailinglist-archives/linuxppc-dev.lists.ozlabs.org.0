Return-Path: <linuxppc-dev+bounces-9546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3CAE0317
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 13:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNHsj6nNHz2yPS;
	Thu, 19 Jun 2025 21:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750331321;
	cv=none; b=RR++jv7rkMQZsbO6ufdViLSrRoYoKyaDrQ7vUyfNaqn6g3wNBnZF6TK+L6vLwRlFgpjac8NGVzOniZpT1a02rc76ZmMHSCt4RiiTAJctD7ThOqJaRdCB/AFlTcy9V8KYFI1+Yl0/T4GY0Q7WbF8zFrEObvNaS3EvALkiVkiRd/NxORciYiQiEOfP5cawe2oQ8IZ2trDnKYWsvrKHT6WKrCUO6c1ctw9bnl0a4nUU130t4NJNTdE9W16k1pW2SEkOZLcIyvnDJ5FS0aP9I2qfmIc58aXjAhGOq64lfxBebskchVIi24ML6l/YYQhxJ9Uah3UGqRBYVdMiIU6OSN3rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750331321; c=relaxed/relaxed;
	bh=2sptUv90Fu1RCOT+t0bqupqhRJHg17pYUxs/MMMHORw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWceTqohUAHWjmb3T1JyhOyGGYZ3sHMTQ7NjT+UYuvXpEKmeLS+McnJt4zJLuD9pZE+WvbCS67t2FFnLmfBMU784gsV1bz+AHQbUxE3wQAsF3kxYs5t2bP93Xtqpb1WLi8qE+8q2R438gq4NDymSFOyo4jBBy3kLZp9+JKDYXZ8qdQjmzVJVr5qkF3Fw6dSMmc27fM35jSsMSkuteTTuMo7p+E7ZvJljZfS9IeEUzAHFOuOnZ4LYpcmQb4wZRQdKAHJvdFjTob9C/UXfRS+tLRzM6fM9ciXn0Nk4L9BGxx0O2//Koa634zjWbczTrphV+bxVh7tkDAn6u941DRa51A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GlGI0UQB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GlGI0UQB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNHsc2s7Fz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 21:08:35 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45359b5265cso103485e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750331311; x=1750936111; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sptUv90Fu1RCOT+t0bqupqhRJHg17pYUxs/MMMHORw=;
        b=GlGI0UQBFnX+D0bOuUo9dWB3MTSTzdIu+Nvi0QN70k+kzUZKJizs6Ffb9DK5NpK3qt
         rtVHg7ib947WYY4FurzV+AvnTnsOeXpC7auqc07BvaxWCJlmCe3AyzgaZEgDqXb4loaF
         Ds2jyQL+lGnDYdO9fNhI7Q6mLngsQ3fffDcx8XnhmzyVCBv8K4FOAARq426K/t4QH3LI
         9NxhJ+1LrM/S7KTJYeLElx9Q5h+Vr4bh6YtBhIqiu+zkIH9hgApP6BvnBDntdci/MkNF
         TWnU8eRDr9c9xugklDHrr5CKWYghySUtJzVMDKKBGWFUiFneOXhCcZsIvx5ruJxH4Kqe
         QPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331311; x=1750936111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sptUv90Fu1RCOT+t0bqupqhRJHg17pYUxs/MMMHORw=;
        b=pcs45ZNvTNGzPpa3WrxkoCGeRGs/GL1s8t9xX3UPoJviAVo0iRufv9+mKCzCwO2cWB
         zDfvrKQJqB+Z9GpQ98uFK7eBX8PiyDbP3oJWUZ+AYREZFGhVv0VNmuseRouXjKH+Ir06
         +3QG4NSnUB6WCF9hoc1X329mF6Ds4nHW3TRe4KMauwOPBihIijLmdwSktv/jkL2qclmI
         wbHc39bYu5/T4VGb8tBIHv7V0UcHYuvAI8YOxegp8U+lNv6jQqd1VxAC7MtitU+AVgo9
         /uKrApaEFa4zF6HvjvEFRJHYmuZL4TGBaBJ4f0yufKP5bYNKYRFmVZowMNj/MQttxvOK
         EptA==
X-Forwarded-Encrypted: i=1; AJvYcCW96OgcVAvhyMj5SA52RNhMTSb5YZLMvTCyq8LSFb7/Pgk5FaxGd6iLSn9EVkYM1dUi2KCD8WpWyzrYQ/0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMa/gC00V9yU+8RVTTeD60f3r572RMYTv90m9U7J3aSi6tLhW7
	DAtdlYdSDsQOOFTs5pohJCmYedhUbunhMauuSxLzRVcBsfiQQA5cFhLh
X-Gm-Gg: ASbGncsAYPm91r/Woh7F1rGTFFnQaA7oK3Wnlr4VlD1iwzAGE04IKDLHaxU6WnpOAGy
	GrIvB4lrnoPTqI+eUk0opZLNmA05JY1BTsoUM+MDqOSZ4yCDGW6KLnGiO3M/cUwtLweEYVyQKhZ
	YYpi89LoGA958AmcNkAh/B0TAxT+Uzvc+Qnr6D+ydYwJDm1bzMsmSSg1ItWexDT9MsITnPcRmKC
	hWicaji4sXkRTree+DTgJWra4s2styzrPBJebdG92+dBngxZ+A3UnwFWpSvUmqXoV2MdvpXYK22
	RTPW0L1amtsyNgYbb34Hbp0h27DvsOskzZh/KkaO+/Fb4xVs1wWW91fCOnP3Cm4GQzHJ7kaNb64
	1Sx0MmYBZ73vh8E1sxuqcyhvuJWK3bh9SZl++RwX6tsvLn2tSnkjdMf4rKrryYivee2lX29tRdt
	g=
X-Google-Smtp-Source: AGHT+IFa3VBVxPg1Sr4kO5htGYyd7iXmGzGqvNCGVsKWJR4wOuN+nsTIJI3I7p+624zgqmo0+17lYA==
X-Received: by 2002:a05:600c:1c19:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-45352413330mr40213085e9.6.1750331310811;
        Thu, 19 Jun 2025 04:08:30 -0700 (PDT)
Received: from thomas-precision3591.home (2a01cb00014ec3008c7e3874bfd786a1.ipv6.abo.wanadoo.fr. [2a01:cb00:14e:c300:8c7e:3874:bfd7:86a1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a1bsm25528605e9.33.2025.06.19.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:08:30 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: floppy: Add missing checks after DMA map
Date: Thu, 19 Jun 2025 13:07:33 +0200
Message-ID: <20250619110739.323202-2-fourier.thomas@gmail.com>
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
 arch/powerpc/include/asm/floppy.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..df8ce2ae636d 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -144,9 +144,14 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 		bus_addr = 0;
 	}
 
-	if (!bus_addr)	/* need to map it */
+	if (!bus_addr) {	/* need to map it */
 		bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
 					  dir);
+		if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr)) {
+			bus_addr = 0;
+			return -ENOMEM;
+		}
+	}
 
 	/* remember this one as prev */
 	prev_addr = addr;
-- 
2.43.0


