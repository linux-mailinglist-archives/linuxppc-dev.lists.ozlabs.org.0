Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC616AB264
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDhx2Z7dz3fZL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cNd8YqsF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cNd8YqsF;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXx3JRDz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:05 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id j11so11264307edq.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25TOpB6uAuDptlCHYXnw8K0sBZK8F7O48wtvqw46Fco=;
        b=cNd8YqsFIPxe+JP9zRF39U9LVtgmwfXjcFbHH84MFejyyz+WXmA51xlzYADH9AC01W
         lEszc02CudZI42k7pYdy16Vf4WI6WjE1DZx56EjyaZpyY7FvA1+pVY1RSyjgr+NlrGpr
         yFwug2e2C37vzQDmuS5CJX+8dF3kzqMWXP62SO1BV9+XSfgAJAzZ1JEkQPQMUXgK2qm4
         0hyBNzM1O3Kv/jPXAGYRtlnLBj1s1v9YygYUST1D+zx9Ey2ipnETSfTUq5UPh138ocjy
         r6cJKI1TIKvZxYHHrTVVuJQaSsFt81JXXkjl01KWi2F25uQE45bvL71Q902loyxf7ehM
         /C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25TOpB6uAuDptlCHYXnw8K0sBZK8F7O48wtvqw46Fco=;
        b=5KOZsvZ3yAVS084BHjPgtdbTk0a3+8X4AReDScrLMUPz3EzKijbiwWEnOjIxY7JBPY
         B5KEwX7EtbFDm3g7Gw1Hwkf/HQJ7AhOllS+E+Jl0eXLT73jwgPftiXOl9FvXeXYVPRsk
         uCNtkjGDqK2e4UZ8Yncn1ecWp6bE3cDJ9Vizv7OSxKUEAwGzOYIDoPdf5otvSprQn0DN
         qNlQGFqzXTEJlEmSeamvgt06XTTgMhtISBolhZYfELKq7LhPh0za6r0rWwwlkgB/owLD
         NaHNHp/8p5czUohDcwkKBowsZQnVw83geiua3f8tjTqLz744GBMhf0vhxj7LC6Jvj5wD
         kuwQ==
X-Gm-Message-State: AO0yUKWNrWQcIq6BxofEWzTYc1zATP+0AoNnGNVd8PzqPaiHNjqawJg/
	43ASpC5xQsx4sx/6SvOohUE=
X-Google-Smtp-Source: AK7set9H+42xPHqyPW7jGUPzVIpjv1MvOVftLDcjvJIUsaEDkzaQZ+a/sQDSm0+Tof/iIVl2G2SuVg==
X-Received: by 2002:a17:906:f18a:b0:887:8f6:c1d7 with SMTP id gs10-20020a170906f18a00b0088708f6c1d7mr8937367ejb.38.1678049822541;
        Sun, 05 Mar 2023 12:57:02 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:02 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 06/10] locking/powerpc: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:24 +0100
Message-Id: <20230305205628.27385-7-ubizjak@gmail.com>
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
Cc: Uros Bizjak <ubizjak@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement target specific support for local_try_cmpxchg.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/powerpc/include/asm/local.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index bc4bd19b7fc2..45492fb5bf22 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	return t;
 }
 
+static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
+{
+	long o = *po, r;
+
+	r = local_cmpxchg(l, o, n);
+	if (unlikely(r != o))
+		*po = r;
+
+	return likely(r == o);
+}
+
 static __inline__ long local_xchg(local_t *l, long n)
 {
 	long t;
-- 
2.39.2

