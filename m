Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A53C3C1A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 14:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GN58T3cpLz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 22:01:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LkEkzqdL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=dwaipayanray1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LkEkzqdL; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GN0tX1HFqz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 18:48:50 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id f5so14814955pgv.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmBVNF3cEBAMpjIOzV2ide26sZ9VrHqywYMernlO7hs=;
 b=LkEkzqdLvypYuo/eqLIYSlLgNFVDbNLJpcjYRypiK9Ph7GStF0gf+bi1Fo5j1H4bbk
 ab6uSKGdSXkj0hYBtv4PKd+KkQy3LNTFX+WYIbgQlGCNxtpDtxzVezMA7VvKTcAu2AE9
 X/lJKjvIMiS5fHwM4NoDlytoTFToyG7TsaduEJ9UTgW3d4VYLVFGdmx/fHulF5uqRZjj
 RB/PX3OSJNLatH7lMR1x9X3FeMzovf8hxk6sLejA5dFQfiiBHsQc09gcVDZK6mW87MVC
 iinFXc61szICO0Kib9fz+j5O1m3Il+wm3+2jXGyX/9AyeIOXZbU0N+RMqEDHEAGIhZev
 uzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmBVNF3cEBAMpjIOzV2ide26sZ9VrHqywYMernlO7hs=;
 b=NrR3EtIoLj0Xbg3mDTXp7LWlJnAGrVbAZuPKSOEbCKpn0YyJQBclWseqwUS6ga3q6z
 CWrhrwR0DV6G+MNAXIuR63aiv9l4ta4mzLk11kueghDkmT0qOWcKQIuZS/bqje1tA7iy
 U2LPQWLkWlk6X/b9QzipzZcWjlYYU1AXFBWut3ukmX4pfW59Uw3A3j4ZIhaYcJuWbvBa
 UYxlkN2tCWmWrd4rYtX5MOpN06sRaetmIhQ7q8FetBzh2Lj8INnxaB+Jhyd8OBCwIkaH
 GVCPbp4nOLV8aVWjpaxZz6/ZyS/hwFEAWACHaTvaWWn2azqfGETzqmsAStpQTBdCR59M
 XN2w==
X-Gm-Message-State: AOAM530OxxXnIJrUrwY4iCUjzp2YPBHhA/0nf3xitI+/ICIHGMpZYgeI
 f3AItz3BB28hnpe9gGvNOqk=
X-Google-Smtp-Source: ABdhPJyvwqx3QOCEdzsxNk78mGBi5hTyzOowe2ourrWyab/rUaYP+DuL5+++J63nX9SFsbscrp0BGw==
X-Received: by 2002:a63:5802:: with SMTP id m2mr33046720pgb.171.1625993327511; 
 Sun, 11 Jul 2021 01:48:47 -0700 (PDT)
Received: from localhost.localdomain ([49.37.51.242])
 by smtp.gmail.com with ESMTPSA id y5sm927018pfn.87.2021.07.11.01.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 01:48:47 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] arch:powerpc:platforms:powernv: cleanup __FUNCTION__ usage
Date: Sun, 11 Jul 2021 14:18:37 +0530
Message-Id: <20210711084837.95577-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jul 2021 22:00:25 +1000
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
Cc: lukas.bulwahn@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__FUNCTION__ exists only for backwards compatibility reasons
with old gcc versions. Replace it with __func__.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-imc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 7824cc364bc4..5bafbf34e820 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -211,7 +211,7 @@ static void disable_core_pmu_counters(void)
 					    get_hard_smp_processor_id(cpu));
 		if (rc)
 			pr_err("%s: Failed to stop Core (cpu = %d)\n",
-				__FUNCTION__, cpu);
+				__func__, cpu);
 	}
 	put_online_cpus();
 }
-- 
2.28.0

