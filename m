Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD96AB25B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDcn1R8rz3fR1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJhdq7LV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJhdq7LV;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXs1hLhz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:01 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id da10so30867907edb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dp+002KTo48dpecC7Fg4F0z+wg/mF+qKQ/rqBRLLmU=;
        b=FJhdq7LVPwcBcvn6/riybPaEEFIp0/r+l4uien9VYX13snE+6dd2SRb+yMPMDhYYbM
         3AUs+n1H+CpJ8GDv0U77dUTxE8RjQ1eWXLj+bg/IVt1gChmG7p7sJb2ClN5MKQVBKiHA
         NH0EMDT03tcy/lSh5xX41OU6Nskj9OCGpTzoieRFH24h3GENB49/lgCnuichf7wUhvLm
         YsQlX9dGfnwd59NipJUQH4HuchN0vUmHSZ5pwgrti5UGvSZ3bP144EUY6UqvAOkml+nl
         yVef/gktEHzCBna7fndw2/uQjOF0b5Chrheidug0MCn0y1l15A0pcTSH9l17N70mnuzK
         JNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dp+002KTo48dpecC7Fg4F0z+wg/mF+qKQ/rqBRLLmU=;
        b=YUhhA22J7/E2rpHct0urruy9tx3Ghs94pXiqBbO1lOiAlEzi/hL6/MlLaA+bvWGZGN
         kqN3YLRuf8e0qVxjRayy0KmZ2HYV5eSUs/UuZSRgxO3oBBRJneOh+ZW2kUjdv4UZg8y4
         83DWKdJTywX9dZ2WFglPBXIVVAULbtNqKLRKdat1ZDDjvIuNkjH9OCMkgXjjknTnC7im
         pGwwRkfPjhhAbV8EB13IxA8CnFwfyisltHM4gjdw01VOMLeoyBT25QWySLU//sfUbflb
         nS4QPyIQuVz0x9L7oivlkhYP2J8jJcGo2G7Ph427TmUL3Xq112H0kPewN9anQX5tsRsy
         4y9Q==
X-Gm-Message-State: AO0yUKVwb58vfANd8us25ESx0L07GWTEpuGqHbg3zTVQSmPbkp9cMswP
	Fs/2F76XhhUOoEBCkPom4LE=
X-Google-Smtp-Source: AK7set9JJNLz1ulU/hVH+IH7j0C6i0gQzHulORbRJDsCWP1JV2FwRUAnR4ik5vqV9X6krnih1Xg2WA==
X-Received: by 2002:a17:906:33d1:b0:8b1:7ae8:ba79 with SMTP id w17-20020a17090633d100b008b17ae8ba79mr8537582eja.30.1678049817877;
        Sun, 05 Mar 2023 12:56:57 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:57 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 03/10] locking/alpha: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:21 +0100
Message-Id: <20230305205628.27385-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
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
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Uros Bizjak <ubizjak@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/alpha/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index fab26a1c93d5..7eef027e0dde 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -54,6 +54,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (xchg_local(&((l)->a.counter), (n)))
 
 /**
-- 
2.39.2

