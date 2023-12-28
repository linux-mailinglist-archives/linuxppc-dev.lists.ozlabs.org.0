Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D081F6D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 11:19:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B8C15diL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T14H81NY7z3dKw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 21:19:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B8C15diL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ghanshyam1898@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T14Cp5j01z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 21:16:06 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d45f182fa2so19770055ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 02:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703758564; x=1704363364; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNHLMctTGdj0vJuWMi2GfIyN84VKiMYcb1/R8itcyWI=;
        b=B8C15diL0QhDV1DnVLez8g1JSsuH4DOzbhHYublmwjr0tKRVgSTbJbV9LX1oBCWBnJ
         qmtmjsDmH+thibRZzeIsucjDEGi38fc6jlw53u+gsnVagl3FPKlSazMep8ZGJj03vlvE
         037JdpvWcR/xQdSUgBAXelV8pDDCp1OpJoF/DMgdgSWTkzZQw+w8+G/q0yNyG/8G0YGH
         3AO24MXqjKVw3xfvPwW7vmuThW7XsiqGhxtLi7aipL8wLNWXcBeLCVxos963QbV/0wRd
         VWB/Ya13DKN8NFTYWV7+eIwfUp2NgAdteosLylgSzGYfpCI9YyEpgwOSmaN0yZqlrIf2
         NsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703758564; x=1704363364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNHLMctTGdj0vJuWMi2GfIyN84VKiMYcb1/R8itcyWI=;
        b=p+g1ygxH9mxpSC5lpHTNUaTsb9qVD590HvpyJvhuyIko2MBzBEngxcpQlKqZqaC/8l
         ftAKw1qaUHTKPaRpQNnH2HhRT22cZapDPorOjjn1XGa6TAfrduXTqp6cjyj68FnGZARr
         eOGgP8dJ+Moc6jwt1M8mBVm8twne74YzLsVfQ3/8VwSMIIWGlmfAz3OFfhUOVwumSmC3
         z4Wn5+dvWWaqc704zvaUY0Xxinp+1+shBhRUnwPEgX/p+/5WZYhFHQwDI0gdvLUJLFRb
         Pui5raqja6d1X8xFwYq7G+t8Uj7LcUWyC2iRWcF+zTQhYgOtO7mw72+I5zmZGmnRNVIY
         Dlig==
X-Gm-Message-State: AOJu0YxeP8RWr5L6UF3xDixnoaLYQXkjvmqaAr9vbTr5bBQq3qMM27Ok
	VZ0yCvU3Duuf62cksGzYk3A=
X-Google-Smtp-Source: AGHT+IFFydiaNrDle8dam8zUjk8eRbhdaFZzJtMA7YLsdjFqtf7QVNzOdLODSR1iC6M6pgtIzCX80Q==
X-Received: by 2002:a17:902:d4c9:b0:1d4:4eb6:865 with SMTP id o9-20020a170902d4c900b001d44eb60865mr7318803plg.2.1703758564314;
        Thu, 28 Dec 2023 02:16:04 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.78])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b001d3b7c5776asm13597207plb.160.2023.12.28.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 02:16:04 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v2 3/3] powerpc/eeh: Add the units of size param in the description
Date: Thu, 28 Dec 2023 15:45:20 +0530
Message-Id: <b306ad66489517f5c99694c3f1bc11f6bedf2757.1703756365.git.ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1703756365.git.ghanshyam1898@gmail.com>
References: <cover.1703756365.git.ghanshyam1898@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the units of the size param in eeh_set_pe_aux_size function
description.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V2:
Added the units of size param in the function description

V1:
This change was suggested in V1.

 arch/powerpc/kernel/eeh_pe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 77d05740977a..2038454ce864 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -25,7 +25,7 @@ static LIST_HEAD(eeh_phb_pe);
 
 /**
  * eeh_set_pe_aux_size - Set PE auxiliary data size
- * @size: PE auxiliary data size
+ * @size: PE auxiliary data size in bytes
  *
  * Set PE auxiliary data size.
  */
-- 
2.25.1

