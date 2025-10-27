Return-Path: <linuxppc-dev+bounces-13339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA3C0ED06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 16:09:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwH3h5WG4z2yjy;
	Tue, 28 Oct 2025 02:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761577776;
	cv=none; b=ZmmPzyoP8hIgrAXjCrD5HBBLPTOX4JF371hlsG/v5TPjXQpId3/ejVjkZ5Nv+RvRFmbWRLuK6Oqp2hZ/IxqZJpWIxVdCUGYeQ3KjDRvYG5MXw2AMWefAcjPamShFyEKGZU/843D5uDCMZeBGbmCSZewzLGGE8IucGAN8hGyTRcp2qqyrudmbd39Zet4IFty/B1usT4PJrlfXCSKGEywFxq74T54rf1YhHI8jwEOUBJhchJKVj2mhu4ATPtqpnwJdC5XRENdwEUPlGRfCqXiz8rQbQ0sp/tR0wmDW5mVJRedSq2TRlirZrzAnaquBEL1xa7brukpfTf7JeaZvJ8EvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761577776; c=relaxed/relaxed;
	bh=du5oJpRBhJlPxSiwoBeavUKOwQ5aDhNDZOqlYr8mmsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PpocMWtHzWlfvIw83AhnPkeGMu//LeHxINk9AVRdH3n5XOFJH+Fpvrhew59KitJq9LcJPblaY2TEf/bM5EjHLqQP35oxQSyv5HHkW8WnXMcPdZ039OhidbRu938CcLgtBxZt8L2fh85QeCE0hcWfDnH8d7sQ2087v4FFOHuBTp+BQQNjtEjuy5T2NRg31nyy+x55fXQikJe/KqCr5XLRNuhAlMXx5pHuYMAPD6s9amQzrqRSYrH64FTnFRzp2D6eEhNDvGX5eMZwwynv3s97p1FftaISzRjYu1sphmrcLniyVZK4Ud/mSKpEkocMCl2i/YBd9DKrVDE5L1KxEGzRlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6dbMj4C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6dbMj4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwH3g2YYwz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 02:09:34 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7a28226dd13so3551623b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761577771; x=1762182571; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=du5oJpRBhJlPxSiwoBeavUKOwQ5aDhNDZOqlYr8mmsc=;
        b=L6dbMj4CPu4NYbuaIAa+npIuSZ0SkjMbtO0ehaWSrnem4s4rmPkM4O1Y+kQwqORYt2
         bP+CZDaFThSEvOCq+bXVem7jo1klc652h/vWUmPRfBpx5J9ueNvP+4mCjZFnEAG8YPxP
         /U9XUKCqnvivLN/p0XvHXit2PMpSwDky+kbeh5nE/US/CRDrQIDVkyX2Jyynrg6xbL6F
         dVRxywLnn6McUp/oYp9SJx46oHTwEEfEPIVIvxQIYmadq3KOGFfJyjVm7pdmypktTQmx
         Cx53xBVmGkfGiy3HMZJqil71tF5A/TTsHhlNe6CJALi/YpFS57Zj791FwIO2DRX2N1/3
         7gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577771; x=1762182571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du5oJpRBhJlPxSiwoBeavUKOwQ5aDhNDZOqlYr8mmsc=;
        b=tvYxnANgOVf1MWh9jcd5XdSitAsz8ZQjVasTojJTirvHnW4+kj4SoCYXCN6ADuxCtf
         B/l5vl5hciE1YxYEX+d/RZl1CYwtuKn40YHkTgGkvoAXYwULNDwv3ksa+2FFL9Z9kx72
         yz/Yu8pvlrM2QPu3gbSjPYS83Dp5yDPEozPT9dkJOyisl5kITq0WHj3Ozz/RGNryzbru
         dX3+wBxVe4FtF2Yl5mb8uE+1fkXElJq6k5ev/WSF03X9y9EsxX93nIS8g5HtGEgcleXp
         BA3nW4n6NU/LZ1AYZqKR6RR6L5bVdHIHTsIg6Nb2TWHIuf6T5G844pEuxPHO1zwOrF+7
         +k4A==
X-Forwarded-Encrypted: i=1; AJvYcCWX9IVhvoVPPFDjjDpKGtQ5fIO2uPLU+cbDHv0FEoGyjp6c0a8djBNSjMNEH2Vfu8d6Oh67q03surZcYTs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhddKpUapu23gSlBwuPVSszYk97Fy7t26UQGmXOHGDDh7TP19g
	wOj40a1RkwjX3zYvFa6fO44rbZ65psiNIBRjzggGMFCWO1kyr7SDh+aU
X-Gm-Gg: ASbGnct1Pudrp7lmPFTnF9MhjEKHWDRMecA9YGZ531+QJ624shAEHL4tc19KckhKbGF
	jm90bA5lIg9Sum+Ftv/O2xoYe6m4ndkQv7nf6ojK1he4kppJuEdIEeoXb7IusjetnQW7mBIYZXD
	eqpvIdfiKdoh3eHQDRaxm/NqyRysg71J/mpZhLZs2i+BPguVXOj8nJW46nJ6Yc+L3+gQAr1WZk5
	vAw6JR/TPxyfw3eFaAhV6axMA21ga+ShzyeA04rx2UfVi3uvCnTj/nG3fvQOeeHV54x1jXFMeDJ
	hLS7UYNla65TgXwar0ND9/DRRqGl6vhfRA6RpqW70tFgmVCStHgf4bGWDk/OHXWmtRvTBk/EWLg
	uwFBJkqVmuTWSGTVyN0YfQA7W+JW2U239p58bPoWeeHai+Te8rf1ZUqVzYDQAL0N8axGc6xCmaZ
	MUIG4UFOKggcqRDaC55be2TA==
X-Google-Smtp-Source: AGHT+IFScmYX6R3rthmA7m7QRURybKZunKqeR6Hr6fFU6rVxiKPR6zlKhkOB5h4TP+qYA1pWCaz3NA==
X-Received: by 2002:a05:6a00:390b:b0:7a3:455e:3fa5 with SMTP id d2e1a72fcca58-7a441a6b2d6mr397621b3a.0.1761577770926;
        Mon, 27 Oct 2025 08:09:30 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41c70ea64sm6929565b3a.3.2025.10.27.08.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 08:09:29 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Albert Herranz <albert_herranz@yahoo.es>,
	Grant Likely <grant.likely@secretlab.ca>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/flipper-pic: Fix device node reference leak in flipper_pic_init
Date: Mon, 27 Oct 2025 23:09:11 +0800
Message-Id: <20251027150914.59811-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The flipper_pic_init() function calls of_get_parent() which increases
the device node reference count, but fails to call of_node_put() to
balance the reference count.

Add calls to of_node_put() in all paths to fix the leak.

Found via static analysis.

Fixes: 028ee972f032 ("powerpc: gamecube/wii: flipper interrupt controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/embedded6xx/flipper-pic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
index 91a8f0a7086e..cf6f795c8d76 100644
--- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
@@ -135,13 +135,13 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
 	}
 	if (!of_device_is_compatible(pi, "nintendo,flipper-pi")) {
 		pr_err("unexpected parent compatible\n");
-		goto out;
+		goto out_put_node;
 	}
 
 	retval = of_address_to_resource(pi, 0, &res);
 	if (retval) {
 		pr_err("no io memory range found\n");
-		goto out;
+		goto out_put_node;
 	}
 	io_base = ioremap(res.start, resource_size(&res));
 
@@ -154,9 +154,12 @@ static struct irq_domain * __init flipper_pic_init(struct device_node *np)
 					      &flipper_irq_domain_ops, io_base);
 	if (!irq_domain) {
 		pr_err("failed to allocate irq_domain\n");
+		of_node_put(pi);
 		return NULL;
 	}
 
+out_put_node:
+	of_node_put(pi);
 out:
 	return irq_domain;
 }
-- 
2.39.5 (Apple Git-154)


