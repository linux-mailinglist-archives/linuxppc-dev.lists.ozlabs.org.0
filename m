Return-Path: <linuxppc-dev+bounces-8475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59182AB175F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 16:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvBFZ6LvMz3blv;
	Sat, 10 May 2025 00:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746800930;
	cv=none; b=mHo8Gt4KluI7NEXydsgHdXwgcRLAeCTdAhlA25dWAVE0uxNgWM4iJytzYWAqp3w9oXT9B0LFln77uyf3MSrAH4Qk+6nxll10Lw6N0YRjE/da5jC1I30nUv4rvlMWKChn3XgCSXsPJWYE+UeDg0sdjcxP+iuJnno5PlnWmhs5u4qTr48Q877by52pjorsGhtvQ7wDjP5G9CXIwdm7BNSAWZfVzB0hLcRYEbwhEzhAlVx4VR/yQSd9qixZlE8hJKnp9s80PsLN3QsFmo4OdEl+0E+v9P+dhvJTBz+xqiMxPYveXRkjM/w+e5IIg56eyuZk85K8ZoohT9CVkZ0Gh6DgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746800930; c=relaxed/relaxed;
	bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=By5e/8b6p28hXcJhhDDpamVXpwivmeuUHDVUNOCb1IijJ75ZyMOzSpOJHV7FV11lvKoVEvJ9TIY+ub4ytWcHvC8qPcuJSkDIEasiwl4WRdQi3PAsplNgvYamtNjqqi1MxMFePakjTKEuMgFWPgqbWyIb/DtDZV73U0WkazAz1HZ8ot5r5lMvctqgBUd+dmQi962GXHp5oB4H2bafvGQlTLYl8f8zAi9iKvo3bVg/u5dtrfZ1oBbmS2FlEnohV+6JD1ULWlnpRms8KcxiUra8vtEFM7hlmjPBZbmnU0yM3Pbg2F4LDDMAXwsYmlO+5zbX7rPbdLF7GMSwIkMvUKQ6zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxxyFapS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxxyFapS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvBFY2Fjrz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 00:28:47 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso2167035e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746800924; x=1747405724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=BxxyFapS3GentPSXRezPvqMck37b1QABwoiw+GV5cmziiD+1S9cnpwszXUQyjvOq19
         p+uDO1Udo4eYwsm+E2DeQ9a1iU5BPB+4j1GpGHvTDfKKOGg27IwwaiwYFTrCv5SjrUXu
         Y1mwUY5gp9YyorJmr9azgmzbO5RBuahUY2tqOJPGRn21zh6vE0eYAc2WMTCEaAMzRFSx
         mNloUrdqfZkCqGr8WpGbsIVL+lfr6oE33ZZDBbqBp1coGmim1pqY34ydR0CFTbIXiKGM
         Kjs7WtMInYc0bckkyqPNInrTreJfE2obnoh+Fwy1wuAtO5Jd8z8O/D1paOcXpR6YWW4l
         ByEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800924; x=1747405724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=uvlfj0RhvfJuGwiBxswuEfOseW1M860iLguFnlTDZkcroKL4NstsFQSvZf1et0C7qy
         ZIrBQggcSyMyN4xesCutyWa31xzScAhZyY7SXAvr1FTxJR/5DMf7RxwlH3lntoaAMTfg
         h6HVDkBDxm9SIkbbCaMtREpwNWmgsB4EZo1y9GZBa4pqJ+S3XGoTDb1V43g1ZVHR0aaA
         xXv5DYBe+9m6cjVAlrfDWMVCggkNOe2/wmXOH1MIXe19Woqlw76F43f92VNnbEUMpUCM
         Q8a+tYcyks4WALfp9W6jD3BrSWh8XRViC/1BJKLb7bUO1FecXas+JPa2l/mwBsb1U+zS
         LHNw==
X-Forwarded-Encrypted: i=1; AJvYcCU9t8zex3w1+CDIhTWIjSRJ2dvapINSTnut+FlOvntsMnJU+crwsFHOM7Qd2jOB+Dh8Q1t4slZmGEeyTHU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUq2/FA+xjZTlpgkmlzSXZ/WGifnceRBANd8zI+4cai2ccM8uq
	MrAHTxNTyXmcdx1PuVb195K6Z3Urjd3atkNnmo7ei0AQJGgP8yzVPlKnZc+YO7M=
X-Gm-Gg: ASbGncvnSkOtefD7tM9wes2YPxu6Oyuh6v1RKAymWX75np19ZLUQZ9ohTCyK2l+oa5v
	1HlVgY7KqVZ7lyuWrgeDfkyuOQQIO74tjBa7ty85DMzUDWDNFlNHYShEfbQ+Ycf8w4UUHlOLZIS
	Vl9BBE4d4E/Y5HpH90ZhG0QUBERq95Qkq5Ycs639OeFOZTIp6Z5OjOjMSjYde7+wuJgqds2gwaS
	oR20CFoB/ZOZyW4jHnQnPHbAr1jHa+bk0E/0V5cgGjKoov6rj8luFLQdvh1ec4B1AFHqI876fyc
	qL84J7udpTS5AudT1+K0oSkjUh5aHCfoZOcev9LkOCrnGeETQQ==
X-Google-Smtp-Source: AGHT+IEKYVR9f4KNy2kwsH3spQ+bStFwlfaO9+nceNqCzdyx5f265pzrXCR2cXu644nD++9/3pxs5A==
X-Received: by 2002:a05:600c:1c8f:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-442d6d18d31mr10683505e9.1.1746800923692;
        Fri, 09 May 2025 07:28:43 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm31255865e9.37.2025.05.09.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:28:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Fri,  9 May 2025 16:28:35 +0200
Message-ID: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20230320125202.1721775-1-trix@redhat.com>
References: <20230320125202.1721775-1-trix@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=fiZTHDyBdOc6qfmbBDJJ1y69SYbch4R9Dh77RsKvT8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhETObKRcExebKUkbIaGQ4dCmp1cl7Z+eKzDU
 2FxOq4jCDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4REwAKCRDBN2bmhouD
 12MFD/wKZlS5qkHWc9CUedyRVM+E7ub1Lod6PaAbk/31coox5iWvBj94XuurnOuKMUXmcfwl7rF
 +zIRQNJFPjPjkwOpJRjTwPg9vWktDjbBwQN5R64ChJnZt8N3aG2g6LGgFE/0YCOfJFzUVg8ZBFt
 62ZO1fWQod3iFD1Zu3PcjmwYvTaf+VjfI3VGUZvNHJaaHLA9OQjxzJ3ntJdV26Nf1yHtEYPWV7/
 FMHZjDxKHK0YbtTSDXeNg490LGK+pTCreHLrmjbYMkw6dz+RlV69hHcqkKzY9cZm/9wZeOs2okZ
 eG7gn/v7oAxxTESLh3rXiggeQ2P33lfAL9XVQz4dnqd+7QERPpUx64aDciyg2L42a2UQea0qA46
 W3XbvX2k9qDz1FM2bo6UNGsIi3SO/6eVgQT/4pP3+EPQcpLXjeIXWFABGWub4gabk4sNNyhzkiX
 XZ2hdozSp+Qf4G1PgSPe8YGgegbvavAT06TMWaZvmBCcIKj8W8u+ozmC6+8KVJAdNs2L8Hq1fOe
 akJTeH9uzGd7Ycd0pjjUh87ndgOeTHaIuDpoVNjEa7Mv7i6pyj8SkcOMi7I8ZyzOzxhPWKh1EIg
 qKU5+wwCNXNv2I9wmnTh6z29IndiEPrwcJQe+IGqjf917f6nKyC1AAWkPXU/nAhTXKZGgHiMUNe D03zhhwT7Or58DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>   'qe_ic_from_irq' [-Werror,-Wunused-function]
> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>                             ^
> The use of this function was removed with
> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
> 
> [...]


Commit from 2021:
https://lore.kernel.org/all/1619002613-18216-1-git-send-email-jiapeng.chong@linux.alibaba.com/

did not apply, but this applies.

I am annoying hitting this warning on every W=1 build, so:

Applied, thanks!

[1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
      https://git.kernel.org/krzk/linux-dt/c/d47f1233374597c348696c3da2142cc92a36fc90

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

