Return-Path: <linuxppc-dev+bounces-14724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF03CB5F72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 14:01:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRt564Wj0z2xQr;
	Fri, 12 Dec 2025 00:01:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765458090;
	cv=none; b=nobuYY5bKKJ2dXLbd3adDWavbmQtThDyXzpM4qObDkGlZaq65kiAQn7DdCt2TkSHaN3Lwp6Zrai7ylEp1WpgQqonpdBJRWDQrf3iMSEaYDlImGYLP4rVHy2FqRiec+rYV9v4PP6W2Lhb7bVZMLey5Stets+3oGqhP4aM53/ImC4fU5++9kF7Ijy2DHzgxFHh8KDpojIFEvifvRKUk28MrBEyMfgtvqOpO02l2SF+OAGVLDPEBhSr34FPxsAwGpdQeuDaO1dWBLbUDR3plfJuDX4IZyVmc4sK4Jlo1qAXuQbLy4YXOLcRBwMSalceXcPGqOwF5OR4xPg5kPeCTHsLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765458090; c=relaxed/relaxed;
	bh=dDAsvYkgSFLdL6xLRP+bc26z9IdaiXQyqHMp+JNzIOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e05sBK7zOhS/luiAr7tFN4xAYOzXYqwPgV8cT1JwWEo0+CNWuHhHB+4N7CwgqP4g23TKTBNQYxnl3NSRoWEkkjdUsAGFJ3WGL+2x2OxpIVQXxUHcX056WqTxEZ889W7o2gaWyNQxh/Iil+tCzn7dMPU6q3cKy/RbLnUgfvrQ3Bv825tsmHuT+WjgmjZ9n/t2bU4wkDiW6YGyPyfQs9KcgYKtj4xEZVIIwE5gFs0CFQ3dNmMu0TIUlKxlCmBJNOTFz9d2sXSmxhvYaHUSKOx6ZGURNX0JsDFNEUclNZJOwecEmaVCLwkQEh/MaojrAXrhRGMuG+lsSDnHXsTgdD4fIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ldsKs4jf; dkim-atps=neutral; spf=pass (client-ip=209.85.214.169; helo=mail-pl1-f169.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ldsKs4jf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.169; helo=mail-pl1-f169.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRt551Y5Xz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 00:01:28 +1100 (AEDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29808a9a96aso578505ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 05:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765458026; x=1766062826; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDAsvYkgSFLdL6xLRP+bc26z9IdaiXQyqHMp+JNzIOs=;
        b=ldsKs4jfQpNxWgUdOjmaToOn/gPaUBxqAXKP9ofGUz66Tl2B4Wj5bOXqyn22hV+uYq
         /ZQLxlfGF+2WzGhEkYDyE/aPI+TLikdy99of8ywtCYNT3f4Wwhjxqb9gtopWK7GGtOoX
         ou4jX07ilWSqsCCSucX+SuXbAKsOhpP8vtkXyQLp+4LxsbdC4zGvJmCkr03OvSQk6Bso
         f4T3Hw3OfOu0H+190tUE241hsPAgZl7QMgqgPe75EMGjiuaYoP7NyD3hNy9VZLxVkSak
         VGJ9jVYOPECISaiIurSXdDbAk0zF/wnY5EWuY72CVENyPsjMox723OQvBoKSyoKeyuVS
         8V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458026; x=1766062826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDAsvYkgSFLdL6xLRP+bc26z9IdaiXQyqHMp+JNzIOs=;
        b=H80mn7zgU0XegKtkwgistl9Gux6R84r3RBCIys+tskVb0Ma4dw9ERZ+yyrRvE2+5c5
         TDU66KhZbLIcSqqsVbCVFGv6Vm6nrJ1wWk1UvyVCeVplahWrk+FJ7Tp0pwxfDPycNLA0
         tZcHWw7CbJ2qCQCiY40c7NZAAe7K23TCrdTnFKTuIARFfNcp6JIEQPpma+dGrC39Sbad
         XrbWIMIQ52lbOW4aN4Rr9POgp5z82TEh77FW8B7Ez4Fll7oCAkE4Fu7vaoDPZb00MROk
         xj9xIhb/0k4WZiFOJI8HRY+XQBMFVIUnAbsJ6iODE7HZKDjaHnv/dnaVojMmccvvJkNc
         sF7w==
X-Forwarded-Encrypted: i=1; AJvYcCW7gwh28ahB7OSnxG+4BzC2WVpbNSAWevspj8mz1u8coHMm0hZOWNp+4X5xkr+IFedkJh8A+H69BdsMr1w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywh6F06lgd6BszPOZNHL4MMHA6loUAMw83jqfl5nHOAwWLJzsph
	NbandL9SxJB8aH2p6HkFSbsFeFLefk73qHviKFVNfVwSvw2zTOizBP+e
X-Gm-Gg: AY/fxX56ThD0h0nLl7SJwvxQT7oEm16hdG18YToiXf/Z5T2V+5y9uDGHzx5vbrcyQ5e
	FKttJeVRLiPFtH3tTMBZpUdkjZBkT3b24fWF+HGfcY9qYauKhThIEtngDnlTIHKgoCUyYhNG5Y5
	bWrd8qnikQkJGWZQyVusarDjjcjdk12QE7jxHk4hMtbd6nB+bcZeKcnC1IOrjVNeepvKjkLTiT7
	N0s03gMVJHt2+TX1/j6kwzijLFRe6oEIygb2UBHkPboZpUrDM+AElLXWnF+7ejxS+VO04pw+X51
	zjFSHGS2NsflpZIsdYX1WsL9WG7A2sHc25lTTJA0AqwC8JmpHEdZlNoUe/t+vFyIVnBlOFrco82
	ak51tMdwqWoCedUJjgbPnqdIfPsy/FAWge3KpKojNYH0IiAk7XAFRxblaSfZ0Zc+DNMf1SaZHk3
	UXaQmUxEPleDyxwNrEIZbSOeA=
X-Google-Smtp-Source: AGHT+IHCGc+wX/qEdHGCPxqGaidrGfAk9+GRE4Z80gqvvl1W8SoOFEaqzM4r/56TCEwbdRiTPyGRAg==
X-Received: by 2002:a17:902:ef0b:b0:298:33c9:eda2 with SMTP id d9443c01a7336-29ec2484b8cmr62794805ad.33.1765458025622;
        Thu, 11 Dec 2025 05:00:25 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29ee9d5116dsm24766855ad.45.2025.12.11.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:00:24 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Trent Piepho <tpiepho@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>,
	Andy Fleming <afleming@freescale.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/85xx: Fix device node leaks
Date: Thu, 11 Dec 2025 17:00:10 +0400
Message-Id: <20251211130012.2404862-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add missing of_node_put() calls for device-tree nodes returned by
of_find_node_by_type() and of_get_cpu_node() to avoid leaking DT
node references.

Found via static analysis and code review.

Fixes: d5b26db2cfcf ("powerpc/85xx: Add support for SMP initialization")
Fixes: 563fdd4a0af5 ("powerpc/85xx: Update smp support to handle doorbells and non-mpic init")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/85xx/smp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 32fa5fb557c0..cc5bf097c26f 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -199,6 +199,7 @@ static int smp_85xx_start_cpu(int cpu)
 	cpu_rel_addr = of_get_property(np, "cpu-release-addr", NULL);
 	if (!cpu_rel_addr) {
 		pr_err("No cpu-release-addr for cpu %d\n", cpu);
+		of_node_put(np);
 		return -ENOENT;
 	}
 
@@ -217,6 +218,8 @@ static int smp_85xx_start_cpu(int cpu)
 	else
 		spin_table = phys_to_virt(*cpu_rel_addr);
 
+	of_node_put(np);
+
 	local_irq_save(flags);
 	hard_irq_disable();
 
@@ -485,6 +488,7 @@ void __init mpc85xx_smp_init(void)
 		smp_85xx_ops.probe = smp_mpic_probe;
 		smp_85xx_ops.setup_cpu = smp_85xx_setup_cpu;
 		smp_85xx_ops.message_pass = smp_mpic_message_pass;
+		of_node_put(np);
 	} else
 		smp_85xx_ops.setup_cpu = NULL;
 
-- 
2.25.1


