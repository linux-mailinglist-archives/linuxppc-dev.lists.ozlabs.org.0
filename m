Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9ED3B0607
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 15:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8SJ93Gv5z3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 23:42:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fs7bozKP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fs7bozKP; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8SHk1wB1z300T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 23:42:08 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id j184so39564085qkd.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33SFdCuliabBuVcZOyxtHisuB0ct9gvnHwG2AsiteTA=;
 b=fs7bozKP/eq4AU8wpw939O4Sxvb4jdn3P3/RZPFZHgzZmRy+pM3xe9zsszcZHcMLxb
 rjH1HYmuUkysi+NXX608mueesunsFPJCQI3YY+Pkwh6ry/zxS0i6O1eMKMoZmr7bwinG
 KAJTIvRTTJ/3cu3AWj0pTae+slqeRYTplEUZs163E6YNhNocBxgoRbXUD9YLze2asauf
 OX/x7TEctxI4rb+103iAA62RB5fzxn1V0PvPQdiANpu02pHkJ0zAw6cjK1kTQw8jOWRz
 GJMg68hd/ukMLSVFhZ0xOkFREy6sbm3yEKlTW+AYg66D2DLDkfDgZkOp2CY6A81KI8rb
 ZfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33SFdCuliabBuVcZOyxtHisuB0ct9gvnHwG2AsiteTA=;
 b=LWOSXBT29JM8yVu+yV0yh6Y4axbNWbmkF0iEcavqKh/kC+PuZdobk6BL5wdprRTzT2
 13OEhYxHlCIwtFZEHlDopaeGxGnNsWmW1KO2RDQc3Qn1GEYnohkGHrCSo6WaJgZb6LmS
 fCCkpq0J7nfzCInwA5XPu9b35H1rAaX/hAdlwV6tTZxTxTCUiDOLeQSeJeZb+EIPj+Fx
 lJi548wRUkKIIlcYhgIg7sUVoqhIWHyDz5roZ6IXDFz17Y25GWlHmw6e/aANWZYHNKG4
 ZcbhmtrBtD4yXgxxBBiYsqlY6c94t/p96o3hflGqjEY0IhOZzkv5otxPvnhn8wm71HVm
 rAzQ==
X-Gm-Message-State: AOAM531CdFA8u3F5ZocMcIUm4l9rISwhZ5rS7eg13QYNsYFVDI/Y826c
 SZu74igbLInqHcDXQPXcjFrXEIZnA6Q=
X-Google-Smtp-Source: ABdhPJxcxujJkYszLYW7MP1GKVa2g67KvfEiYL5NhMg45dSZ0qzJ4bt8QF9JNyQJSce1ya2bsN6z5Q==
X-Received: by 2002:ae9:e8d5:: with SMTP id a204mr2177483qkg.245.1624369325055; 
 Tue, 22 Jun 2021 06:42:05 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id r19sm1644491qtw.59.2021.06.22.06.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:42:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/pseries: skip reserved LMBs in
 dlpar_memory_add_by_count()
Date: Tue, 22 Jun 2021 10:39:21 -0300
Message-Id: <20210622133923.295373-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622133923.295373-1-danielhb413@gmail.com>
References: <20210622133923.295373-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function is counting reserved LMBs as available to be added, but
they aren't. This will cause the function to miscalculate the available
LMBs and can trigger errors later on when executing dlpar_add_lmb().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 36f66556a7c6..28a7fd90232f 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -683,6 +683,9 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 
 	/* Validate that there are enough LMBs to satisfy the request */
 	for_each_drmem_lmb(lmb) {
+		if (lmb->flags & DRCONF_MEM_RESERVED)
+			continue;
+
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			lmbs_available++;
 
-- 
2.31.1

