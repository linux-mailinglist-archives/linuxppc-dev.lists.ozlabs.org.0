Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A029881F6D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 11:17:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDc+dKS2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T14FL3MtMz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 21:17:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDc+dKS2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ghanshyam1898@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T14Cd0F4jz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 21:15:56 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d422c9f894so35743235ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 02:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703758552; x=1704363352; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn4PjDhWbiUDcREinT7MxzjPPyipkYfgnBTzXRdwj/Q=;
        b=gDc+dKS2hjjBX4cv6iE9zOceNpgTB4e6vQ/WJv264N94sGHDsCs+pgFX26/Bak120V
         1tpoJ0c6cNJPImBVUCpjvy2umL6qlJ4ylOtJBDkrG/Gb4fuwVitjTXRwEo++dms9ogNf
         ZZdAY7rdMY2NenqwO8P6MxtyiIGI66uELz0Qp+rgG8HBUIkG7L7Zvj8g6Z+xO5qUbrr6
         XlV6ZRI5vcf8UMxPFltViIVdaeFr6a2OQRr6OGHEQad9q+DUDJECQISBj7I8eP4vo3Fv
         I+zMAYE9lDPKrTBIyAAUf7EgjQYTOonMUXv/2eFrWgSAlLUXvF1XM9ZCuUS39YOEktqD
         KmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703758552; x=1704363352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn4PjDhWbiUDcREinT7MxzjPPyipkYfgnBTzXRdwj/Q=;
        b=YtSzahMKOpgHcmwdrnFnSHxwKBCG4ZAlY9Iq9C7BGI6zBhrj3U/I00iiIDzsg1x0QV
         xWpNmb1IuFMKvetcWhfnfhWa/jK1BRpB9/ASogYOGqo27RrE6IF1qhG8CoNW3o4m0gyy
         LTECjh+zTG6lOudgsjWrmcLorxAoJvETbIqfBDt+YDIJS4ZEZOrsBB7I1VzCigf5NOrw
         xY65/I1+5lFi3F5+W8+hNG+IjRB7zajlw8eNALAC3/wAiepKCz/v8jAo41szS9eo0elc
         JVgDfnh/+UEzeK2E97Uub+3vJvM3WcRrXYXbXrI/wwJGVCyYc6T4i0kfQLnJznyuY1zK
         BAqw==
X-Gm-Message-State: AOJu0Yy85WxvCsXjE9l23qXz+79vJ7jaT2AABbbowCJbWaAWFYcn2b6p
	lX+7Tq02yAuCjSZynCHxkmk=
X-Google-Smtp-Source: AGHT+IEuC3VurKyKElPnBjdSeN0Q9VJ3a/JroMigD54+KoAUJG0qOWfTl+Z743BSSq/AttUhmE5KVg==
X-Received: by 2002:a17:902:b097:b0:1d3:fb6e:f392 with SMTP id p23-20020a170902b09700b001d3fb6ef392mr10000934plr.14.1703758551718;
        Thu, 28 Dec 2023 02:15:51 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.78])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b001d3b7c5776asm13597207plb.160.2023.12.28.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 02:15:51 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v2 1/3] powerpc/eeh: Fix spelling of the word "auxillary"
Date: Thu, 28 Dec 2023 15:45:18 +0530
Message-Id: <2ab034609285b21c309cd8ab26c937c846d37ee7.1703756365.git.ghanshyam1898@gmail.com>
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

Fixed spelling of the word "auxillary" in
arch/powerpc/kernel/eeh_pe.c and
arch/powerpc/include/asm/eeh.h

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V2:
Updated commit message and description

V1:
Fixed spelling mistake in the word "auxillary"

 arch/powerpc/include/asm/eeh.h | 2 +-
 arch/powerpc/kernel/eeh_pe.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 514dd056c2c8..91a9fd53254f 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -82,7 +82,7 @@ struct eeh_pe {
 	int false_positives;		/* Times of reported #ff's	*/
 	atomic_t pass_dev_cnt;		/* Count of passed through devs	*/
 	struct eeh_pe *parent;		/* Parent PE			*/
-	void *data;			/* PE auxillary data		*/
+	void *data;			/* PE auxiliary data		*/
 	struct list_head child_list;	/* List of PEs below this PE	*/
 	struct list_head child;		/* Memb. child_list/eeh_phb_pe	*/
 	struct list_head edevs;		/* List of eeh_dev in this PE	*/
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

