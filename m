Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4581573B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 05:13:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKO2GDvC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsXkl0Stwz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kKO2GDvC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=ghanshyam1898@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss76y3xbbz3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 22:59:20 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5908a63a83fso430560eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 03:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702641555; x=1703246355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ns8mRhF3ZB8rmGf30ann8sbOyHbBVDczvz9z2SKkRIc=;
        b=kKO2GDvCJZvg3NWOrDyTcYwQaXOjocsmIiAeitRs/SERB+XHfW+216mXwK8eB0FvH4
         gpANDAS0hE6AbXiACs1wjbr3J6rY+Ig6PprcXpf4O2uNrDLbRkyC+6niARwXPOF2iu4x
         iuW5KFlchRu2tA+sd124jES7lCdBVANFsheJ4I8Raghku5fNTlC9YwreENRWkOULKA7h
         BAX1ndJnXRrRW6Yy9CN38c078SN7cKeWg3h+T3DZdSojuH+yfrrRNqA7InfKh2j2gPhN
         3w8l9jol5NYWAsq/EBSVApYGKjEwz/6ml5coBV22gS0m6+eWtHL00XbVZCGiU4dRZzKk
         7WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702641555; x=1703246355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ns8mRhF3ZB8rmGf30ann8sbOyHbBVDczvz9z2SKkRIc=;
        b=uL4b0TsVhPzHztVgFONZ7CAaR9na6PpUh6q+gzULXazXf0jMdehI+7ZsOZJDNWqBet
         gFRiauF1+mnIGiUvca2UstJWtehgE3f43KiZP1MdpzYLL3+TGLfM6naVEsJdjMZLvTgK
         yVcCL7cER2wl8KITa4EpYwDqS1cPVHZcJBGzfq0vjrQV8+a09fsINBmfw72tKT3nPyz3
         K3+aVbuP3apqVHS+k6aj/ttssbvQqNT9G4SE+I8NsAXlAe/QdTi+5OojqjJ/8fz34NrA
         +kjmwOJJvEHDvskb1eIgRiad6bZlZsVcm7CFDbBnp8lRtk1p3Ij+YLoHqNIGUo9OGgjN
         vgaQ==
X-Gm-Message-State: AOJu0YwwLJbl45Idud5wwV+MOIY3CGh99ack8av3RHVIhkf/b7I0mA3k
	eAHlNIDGZWA/oO6NZr4W+pA=
X-Google-Smtp-Source: AGHT+IFjZoDMEaUpN4R5gxsVNnhUAULzvXlGHcIuKhMaszcsmozG8uuTDLX/OvWo0XicCqilwSQlZw==
X-Received: by 2002:a05:6359:594:b0:16d:fc9b:f6b7 with SMTP id ee20-20020a056359059400b0016dfc9bf6b7mr10394679rwb.5.1702641555464;
        Fri, 15 Dec 2023 03:59:15 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:701a:b050:6cb4:5fa2:1942:26e1])
        by smtp.gmail.com with ESMTPSA id f21-20020a056a00239500b006ce57f2a254sm13284675pfc.209.2023.12.15.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 03:59:15 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] arch: powerpc: kernel: fixed some typos
Date: Fri, 15 Dec 2023 17:28:57 +0530
Message-Id: <20231215115857.575697-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 16 Dec 2023 15:12:13 +1100
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

Fixed some typos

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
 arch/powerpc/kernel/eeh_pe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e0ce81279624..8e0c1a8b8641 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -24,10 +24,10 @@ static int eeh_pe_aux_size = 0;
 static LIST_HEAD(eeh_phb_pe);
 
 /**
- * eeh_set_pe_aux_size - Set PE auxillary data size
- * @size: PE auxillary data size
+ * eeh_set_pe_aux_size - Set PE auxiliary data size
+ * @size: PE auxiliary data size
  *
- * Set PE auxillary data size
+ * Set PE auxiliary data size
  */
 void eeh_set_pe_aux_size(int size)
 {
-- 
2.25.1

