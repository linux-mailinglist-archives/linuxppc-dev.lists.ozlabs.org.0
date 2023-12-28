Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D881F6D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 11:18:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l7USSctc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T14GG2FH2z3d9T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 21:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l7USSctc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ghanshyam1898@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T14Ch24c5z3brC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 21:16:00 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d2e6e14865so28073305ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703758559; x=1704363359; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEz3o6aITRq1rBmggln0tNpatmDHNuiUsikJCYQq8LQ=;
        b=l7USSctc7NNcNMWujrx6cS6FzH78ep35ShfChugTiouUlvzMy3iPik/TD7NfAqZ9BV
         zTStT0+85ik+ZNT3kQUBzgvTxzSWe9Ox1NGYoCRkCorgyo5I5Z5lfyzUw8dwXSsy3xYW
         lXez8PgQai3ShuI18dQ0Nh2teTRPw5ZuyXs7R/UQuvBeIyyGntyh+r9q99JPrRw/dyE8
         siZkLv01HfgUm+imJVz6ParDyI2CAtp4637BC8lMgwglkMO+5IkRYBTRffHpqSFE4vLN
         QuzN/0JFbRU9Pyv0FTca7mueeluc24p97nXnxql+bgthStUmM8k8wTsmjPmHg5BEZnwL
         X1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703758559; x=1704363359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEz3o6aITRq1rBmggln0tNpatmDHNuiUsikJCYQq8LQ=;
        b=EQxy3LJJRfBX2SdS9/5XecEOfUF2VojC0Omqpe8T7j6/BEW15VnK4IknEFmKQ9xZ07
         wgzmffCItybJD6JRymR67A8TByQvODXTQy1tT9DEk3ZZsyNIJIbXrvAKR4SKyqi8IIit
         sPRedTKDAmjh9l9z95hBwgoV34VkKu5VvqAe1ef5Mzd9GhFZD9ZfKKs3xAIllxWmzhyH
         lYUbR93dMSEhDlrY/x/p2whKMEPCOGp8iGmT6zwxLOif1iLMHFbk7mGpcEHO5txvGeKJ
         gQRY8ak5pSnXZrv9Ll/VbJqi3Fm3KKHK9V5X+w9Hz/jLRQtYjD67mLm20A0tk6GPabw9
         mS/w==
X-Gm-Message-State: AOJu0Yxfn8rQuIavjVmiEfPhs075b0QyKYlvl36QJ/bLZy5govMe747T
	TbPrNRoI7Q4RWyIY3cCNzfI=
X-Google-Smtp-Source: AGHT+IGJ5Q93ZrW9nkQ3Vsaq4mnG4QWNm/1oefuGUzFbOO/j6dF28mKGUrfDWVezpelQyVTGtBSCRQ==
X-Received: by 2002:a17:902:d355:b0:1d4:419c:3c79 with SMTP id l21-20020a170902d35500b001d4419c3c79mr3170961plk.82.1703758558606;
        Thu, 28 Dec 2023 02:15:58 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.78])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b001d3b7c5776asm13597207plb.160.2023.12.28.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 02:15:58 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v2 2/3] powerpc/eeh: Add full stop to fix a grammatical error
Date: Thu, 28 Dec 2023 15:45:19 +0530
Message-Id: <5cac0f67a54c21ddadf5f2f844bf85544efecbdb.1703756365.git.ghanshyam1898@gmail.com>
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

Add a full stop at the end of one of the sentences to fix the
grammatical error.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V2:
Added full stop to fix a grammatical error

V1:
This change was suggested in V1.

 arch/powerpc/kernel/eeh_pe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 8e0c1a8b8641..77d05740977a 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -27,7 +27,7 @@ static LIST_HEAD(eeh_phb_pe);
  * eeh_set_pe_aux_size - Set PE auxiliary data size
  * @size: PE auxiliary data size
  *
- * Set PE auxiliary data size
+ * Set PE auxiliary data size.
  */
 void eeh_set_pe_aux_size(int size)
 {
-- 
2.25.1

