Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE28500FF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 01:10:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=ZPpCzVbg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrhH0scDz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 11:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=ZPpCzVbg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWrd65hx5z3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 11:07:22 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e09cf9a210so484853b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 16:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707523641; x=1708128441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gK8p55xLirSUiR9q0E6ZCWh0WNCH7QbqUfIi685HA9U=;
        b=pswMHQFgzNnI/Nm3R0D1qPwaGwY9IY0weQ9FiwopG5kdoHgEYs81dqYGjOTHnd1bE5
         U9ICEXlndvGQKpPCOD2jCOFvOCINSdXLNgKEUYSFK+S0RvsErwItBLcPFWGddhH9FLLd
         RFD2fxYQuozytv8AOcWhWCrxVfsLuoE0oyeL0kVMyLszMrDRxAgnYTZR9CnMAAcpCXk8
         rDrDWsHpqIiEVQnIedSEkEldMi+d7gGoXnEQqeaDk/AFJr26so3c6YG0brVmtP4LAUsN
         xJJTtA7NbwEgBTReZaC0ieqY25MljWrkJfuGXZUC64yirI+/hW4f4zB/umt7oTHaaGC9
         3XoA==
X-Gm-Message-State: AOJu0YzZor/y5QJKn14+acWpOPP92P+q0Kie79MYB6dUF5K6VI0o9+fk
	jl7KyltsHyvutGk8IVKCJb2vEYFtrGtI4iYvmy2JeuKzDiUMgMTp
X-Google-Smtp-Source: AGHT+IHlqpZ453+HYvKc7vTrYs9euHZKY1I2GewR4Z0mRWnxSbHz6Fi0SyDivhnecXA2mqvFXzAVWw==
X-Received: by 2002:a05:6a21:150c:b0:19c:9418:c396 with SMTP id nq12-20020a056a21150c00b0019c9418c396mr961326pzb.31.1707523640772;
        Fri, 09 Feb 2024 16:07:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT2cTs43LdujFWL6c11U73A539Zg6VkGsvBctFbXDLZzfwJdCYU3Hiv9HalRFxOOXcSoi94nmmGdZb2A1Wj8QvDM5Yvy0zB8Ah4ao0deJbAmtdu61d/PXq9918SqX9OcXrOBa9euAx0BqFrXbrI/v9pV1HN5HjB4N/LaAayBHu6ETnJBt8B+ncFWBiaoxlQNkL9Z4nKwDnA3sFiT8Bu764diZkRffyRjUZdNZ19hM3odfct+oNbAgWW06hM2O6/DLcyU3O7e2VbrcwEbbK
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id a21-20020a056a000c9500b006e04d2be954sm1122559pfv.187.2024.02.09.16.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:07:20 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707523639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gK8p55xLirSUiR9q0E6ZCWh0WNCH7QbqUfIi685HA9U=;
	b=ZPpCzVbgGPtTuUzaBJWtuREqazdtp3QIB9vxKhmlqz4zTeFjuVnWAA8MgdhxEIvPwkWA8M
	yxM1kSS3sQQRiH6ccmFGlJAbT4idxl9R37VbEP7QjwHLBdW16k9EJNpf4Lsds9+omnPUoE
	6ZQJdC5stkRuKIZIetmetYKVxMrUO1QzyCVdHaOoLWOfULIgCU4CLKYIoidRUu99XX92/A
	cthvOW83u6jNZ3hY6jiWvzoLV2IpDB0+5JCcA4yy/4G49QcOHDauRb6GJ+4EEIMUMp5mvL
	RL8qUK1qm6+1NxmNVyT3GxDwTQeZ0Fnsa5SUJZCCWdI10NX/ho67hQUELW/yOw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Fri, 09 Feb 2024 21:07:18 -0300
Subject: [PATCH 3/4] powerpc: mpic: make mpic_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-bus_cleanup-powerpc2-v1-3-79a56dcaebb1@marliere.net>
References: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
In-Reply-To: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=C8aIrz+YvO9fxNUkdAMJJ6XdrDgygMKYTt1snLgv0Dc=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxr5Qw58cZ0qxku2hEjuwHGuU1ag5fHQtMwTpT
 OS3oV8gY0KJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZca+UAAKCRDJC4p8Y4ZY
 pqw4D/4ygjnvtA1sA5sgpgxrx9xkcv8vPXJEwYvNRCRDsx+zbW/PVVLWFKDlzh3Ft3xVEC7AOvE
 xjLSCd4Osep+KglDuHCMP3yDmrJQV9Res5X//TvtRO6FRpjO7H51NWYya4MspHcwC9W0ikFJAKj
 J2e0co9QS+rjoX1KFzLjEGA6WiIX8agt9zLCinLvRAprxwlLloEbtEUQKQpOFCpTXT11iS2tT9Q
 bx5V2Av0QdnLRwZ78cR13QOS0UG/53T4qnoblYQdJS3Fqsv0Ksy2dpWVy6aq7QAgGEAkHX9N/uK
 dWcEf7NFL/PElZs99AMBJfPZpkovEbCfuWZ2Rh7tUXQ41Xhrz9Rir/lqF5/1hPFUYLkkas8B9fn
 WinMANMuPVf2/DwNCFh5WwHWtHsLQtkMT0UFTwcp8EMyFSxs0y3mNNUyUtWNWl3YFNCSbi3cHwu
 x98xuIk7Dm0GzjV0oW/4pFF24hpGlwzgUwapa4VG6BAVP7lr5ssy5tklIv5Zc/7CyzkPCqRykvT
 HIY6SaSe4wNr83HTcbnw83IKa+241seYhpgt63kCyDfxGGkYFb4AMHfH6TPE74rOS3IazoTW0Sp
 DE4f25LDyeAnddhowKzBUo/4o0eGczEpbsRU+9uV62s/PuOiHkL0W5QKNK0H3NfPUtVH3HSO2jp
 4GgA0aRoAv0QiVQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the driver core can properly handle constant struct bus_type,
move the mpic_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/include/asm/mpic.h | 2 +-
 arch/powerpc/sysdev/mpic.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mpic.h b/arch/powerpc/include/asm/mpic.h
index 58353c5bd3fb..0c03a98986cd 100644
--- a/arch/powerpc/include/asm/mpic.h
+++ b/arch/powerpc/include/asm/mpic.h
@@ -336,7 +336,7 @@ struct mpic
 #endif
 };
 
-extern struct bus_type mpic_subsys;
+extern const struct bus_type mpic_subsys;
 
 /*
  * MPIC flags (passed to mpic_alloc)
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index dabbdd356664..d94cf36b0f65 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -49,7 +49,7 @@
 #define DBG(fmt...)
 #endif
 
-struct bus_type mpic_subsys = {
+const struct bus_type mpic_subsys = {
 	.name = "mpic",
 	.dev_name = "mpic",
 };

-- 
2.43.0

