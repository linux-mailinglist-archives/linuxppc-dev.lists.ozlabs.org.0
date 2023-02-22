Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884769ED14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 03:52:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM10N3tNlz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:52:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c1xI3XHK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c1xI3XHK;
	dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM0yR02Tcz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 13:50:37 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id h6-20020a9d7986000000b0068bd8c1e836so1212867otm.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 18:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McQi89uTbN7DF8jJyCgZeVyYtI7bAf8jLzdMMiV8l3U=;
        b=c1xI3XHKGohwQIKFk42Xysj7ExmK5WzvEV05vtimmkIeaaEzd0hMCiE/obU2RZT0Or
         fVE+TI0pYtvIqwYTWtdw5ca8EW5qdCJ6dKI7otBYNiOkOtim/vyLA7ze80BY+4MUGWcW
         m6oHEPFivR5zv3hS/2h/tRHTZkQmHJWIZRhgKNA4+bMY9KDfsJahZg3unsQVNu83BTPj
         f8Lvvcovbx9rMNFB0CQeDZL/BlRlG/FlIm/U/35kCMA5h66CV/KPyaYt7OZh9iv8agF/
         2PfXk0lI+8H1GyUEh0sPj4eeOJO7gOCDTKMC00oKioeclPwHhOGAKHoY+T25MW5kELTr
         HGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McQi89uTbN7DF8jJyCgZeVyYtI7bAf8jLzdMMiV8l3U=;
        b=CtP0ta1pzQNIMgUjR50tC36AaHoaHI3go7nZCbGkqr5D2+pGicixnSjwUCiFre9RBw
         DdlyM/Bht/272HJMMT9SZA3LDCg+GhhARcxZ3QfsXB3+InYkc1ophQ4PR4vj2NUhwetl
         mfwaUljI0Y/6EgLdFZ2baPdkgQrfIDs8iT1VDK8UqMEL73rNBsgAVOh0nJkVJdUxcPsB
         BDDhRoIk//sihJ25/BzzQmU1/7IRGDtlTokwo/e1Puj8X/ukpeDOEiY4Vt9i/PELjA9R
         SmmZvS7sFwKavYB59cW2Ih6rBJLletaZX+nAxFNx7N2xyrEnhXG6/IgLaUFkMRSPFAfA
         TGbA==
X-Gm-Message-State: AO0yUKXMplY98f7Ws3txTF/nRVa89RXhWeUJmmxCCkZFcMovZmRwzbyu
	X1LgiqWwmlmaqrJHNLwyERFWsekNknk=
X-Google-Smtp-Source: AK7set+ZgpgMCsnbEoZOPq/ABD4/QpKNx4uG/xScyv0xZvSeje/L+YyfRFjn6mXEkahnuvnyBw4Uog==
X-Received: by 2002:a9d:60c1:0:b0:68d:53d5:f7d2 with SMTP id b1-20020a9d60c1000000b0068d53d5f7d2mr7853269otk.31.1677034234476;
        Tue, 21 Feb 2023 18:50:34 -0800 (PST)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id 90-20020a9d06e3000000b0068abc8e786fsm333298otx.10.2023.02.21.18.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 18:50:34 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc: use node_has_cpus() instead of nr_cpus_node()
Date: Tue, 21 Feb 2023 18:50:29 -0800
Message-Id: <20230222025029.453834-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222025029.453834-1-yury.norov@gmail.com>
References: <20230222025029.453834-1-yury.norov@gmail.com>
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
Cc: Valentin Schneider <vschneid@redhat.com>, Yury Norov <yury.norov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Barry Song <baohua@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use node_has_cpus() as more efficient alternative to nr_cpus_node()
where possible.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/platforms/cell/spu_priv1_mmio.c | 2 +-
 arch/powerpc/platforms/cell/spufs/sched.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spu_priv1_mmio.c b/arch/powerpc/platforms/cell/spu_priv1_mmio.c
index d150e3987304..55b5024b256b 100644
--- a/arch/powerpc/platforms/cell/spu_priv1_mmio.c
+++ b/arch/powerpc/platforms/cell/spu_priv1_mmio.c
@@ -64,7 +64,7 @@ static void cpu_affinity_set(struct spu *spu, int cpu)
 	u64 target;
 	u64 route;
 
-	if (nr_cpus_node(spu->node)) {
+	if (node_has_cpus(spu->node)) {
 		const struct cpumask *spumask = cpumask_of_node(spu->node),
 			*cpumask = cpumask_of_node(cpu_to_node(cpu));
 
diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index 99bd027a7f7c..9d29cc2c6bcb 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -154,7 +154,7 @@ void spu_update_sched_info(struct spu_context *ctx)
 
 static int __node_allowed(struct spu_context *ctx, int node)
 {
-	if (nr_cpus_node(node)) {
+	if (node_has_cpus(node)) {
 		const struct cpumask *mask = cpumask_of_node(node);
 
 		if (cpumask_intersects(mask, &ctx->cpus_allowed))
-- 
2.34.1

