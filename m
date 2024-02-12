Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD7851E69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:07:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=QytN18AT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYb8n5l3Gz3vdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=QytN18AT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYb5f68Gcz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:04:38 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so100677a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 12:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707768276; x=1708373076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXWSV+y18LZ5HLeeHfMaArrF2sqw5eZ12bKConVfkds=;
        b=n6MsQsJ1sMbRrHwbFknLxR3nkQbJ8DdLSpsWWUddevXcYJE14C0DYkbvTOIxMfCXWf
         qTuusitIgNmy32j9hWah4/AXtzEcnXvMW/BjKNeDhYSVaVQ3kT79YZoMMPvCUr02yQX3
         YFGw6HL0Fb08RRzDBYtzO/5EAWvZ9ed5JI5Sgl97314VuxUlxDYvnJmrNM1Wilmd7csQ
         WNqPlGIcXYhEHbSO2W2U1+XVsw4cuDIaII1qS8FC3cSuJfzYykMt7kcY5IDqR9dQo6qM
         lrEu7yTACqOu49Vf0VZVhqnjpRmmhEbeqq+Xxlgr+wl2AcXSPqfOKbhfeZvSgsAQRNac
         +unA==
X-Gm-Message-State: AOJu0Yy8Fq0lWH9ruHIj7TsEP0D1B/kwYn106DrHSFsrLHy63iTT5/iy
	ZuI9QND5+AOSauOoYWk6y9GlsqMkXflLOKhvhhaj9OjUu1JghpgI
X-Google-Smtp-Source: AGHT+IGMrjwNl1612w0C9k06Puy+10fyLLKUAUNnYXIv9184Riy86C1Og1UKfJZoYAUrTM+Lkplx8w==
X-Received: by 2002:a17:903:230b:b0:1d9:40f3:ada8 with SMTP id d11-20020a170903230b00b001d940f3ada8mr8856086plh.3.1707768275779;
        Mon, 12 Feb 2024 12:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDHjxpA0uU3XGvuzhI5SZIquSVLx1zmfFKybGvheSex+hPZy/JzWjZ7CTiIwYLPLehe0po1yJVJC+qBzUb596l742Nkw3KRlh3qazWfWfyUohTv9MGhO+dbyCHa6MnzupDF6nm3JvKh8Ci7crYGe3QSBM9XUHC0Ni5r37pSz/LNHUA3EQt803b9wkUQIPqiPvg1Gul5BTtJgS/Gk4Ub1tbfT/py/ThCrx4v5Z+2eQY1nWr4mA8taDd8P1h6mHV+AkpU960x3GjVIntAmC1
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id ld16-20020a170902fad000b001d70c6d40f3sm704783plb.237.2024.02.12.12.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:04:35 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707768274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXWSV+y18LZ5HLeeHfMaArrF2sqw5eZ12bKConVfkds=;
	b=QytN18ATL8fKnUEP2ncuOPGuiXEIsGGbkVZ6wJhrjBcmLZmNTLs/hIJyiHTWkr2hyZt81s
	5pmTK4iknYS51FMajxkKa9HQcswI1uO6at9zJuVR5N0bJdVftvWgO7WGc7qn/sLtcz8YlC
	TNtn0/iQBImF0B25aCCBWx+X1mWYvGkw3qWmK1wqvnfVigcPUaXdi/1Dmx/9BO+Yz8Q3l4
	Y6nRPb7hLuw7QM6ufoFBTuvf/mKGotBW07erL1H3JFiQeJJrPrGGAvAfVxnHrUvYn5qjg4
	GU7VoCVqIAdhsppoD9KXGJe1gB8mog4q3L/WD2HAgAZ/R1LjhWZa0PRJM+AAew==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 12 Feb 2024 17:05:01 -0300
Subject: [PATCH v2 3/5] powerpc: mpic: make mpic_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-bus_cleanup-powerpc2-v2-3-8441b3f77827@marliere.net>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=0dAO+EHiuSLBj8m4VZ3xVszabZA/PMRk3GFVh4R9llo=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlynnutnni9XUVE9ggMNrQa0bFx3O0p8SdcpMnT
 bc4vf6TJT2JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcp57gAKCRDJC4p8Y4ZY
 pjVVD/4nYBGZn22+WZU78auZCxMYQWDaHW9MiL8IaAxdjcjFLzfkLKAjb5ss+BIQ7Mqu11gKx+K
 VXEWgxDmIbpAuJpsxSlljamuz00Mjf0+Dx6tP5CyVBLesDUyE0DgAYa+5fGQpLj3QpDhZsMuWz8
 LyRMpA7WcmmOf8p0hGvx4V4qq7qa2KFWitkKeIwaOdNVI6syzYPkvNhjkR1Wci9jjHk7Kde4cfo
 zos7RaoLqbd0DgIc1CPIKOeOtF2xQdCMcn91M7vKvXLgzsDfrJ9x2SjeHHOKMRTkaCjwq8nzPyi
 mbfv7xaccaEFdhjzOSB/FLCf5SNgHyHOiESuhqOdjj66yvtw+5YZfBOyrfpculJ2lOO5H9mzlib
 l1MGtq0uOA8WMrVi71TYlX2NutQBmqoWCaZHknJigYm6zMrtk8LOc/v7rPBiy5o3oO6XF4lhO/d
 IqHkqluyASaq+luXDw1jqu+Fl69wepx6Hv2UDSi3CXohCaz7BUwdqs6Y6AkMS+a0Sa2Llr1cvex
 ypVfDu6UKs09/okvR2aFne7wcvtEQXpWxLkueA6PFSzpxyJLcgXr6WHPf/2xGZMATf/p+eCxeU1
 GdmUtxO0L2sPy7cHh/6f0KnRFGVg4a7cHWOSp++wKy3vmODpIydvixJrk4y4OqGrWriPzFG3Kr1
 VkRPilS+S4Yn7Ww==
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

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the mpic_subsys variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

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

