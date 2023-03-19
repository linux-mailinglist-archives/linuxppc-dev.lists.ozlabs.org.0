Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1A6C02D8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 16:38:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfhqH2MHGz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 02:38:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dc84lPTU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dc84lPTU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dc84lPTU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dc84lPTU;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfhpL2760z307t
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 02:38:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679240275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XIPLHs3kS1RfXeK+ON9SElHE9AkUNrNvAKZY1Ht/Lw=;
	b=dc84lPTUfaZjERp6D8ZDygAEx4gnfPJFlGoqqKH3pVJCF8kBdNWWU5wmvZmmK2NMWSahLO
	OyMpl6QH/+JagM77l03i/NwABDsDv42UGdFEm6ew1hoJjEkv00Sner2eNH14VtIkNyHvrz
	Zrq4BuBja7vCHLBBlmeX3HXA92YSIMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679240275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XIPLHs3kS1RfXeK+ON9SElHE9AkUNrNvAKZY1Ht/Lw=;
	b=dc84lPTUfaZjERp6D8ZDygAEx4gnfPJFlGoqqKH3pVJCF8kBdNWWU5wmvZmmK2NMWSahLO
	OyMpl6QH/+JagM77l03i/NwABDsDv42UGdFEm6ew1hoJjEkv00Sner2eNH14VtIkNyHvrz
	Zrq4BuBja7vCHLBBlmeX3HXA92YSIMs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Zll0k1XUOk-ba72i4f2w0g-1; Sun, 19 Mar 2023 11:37:53 -0400
X-MC-Unique: Zll0k1XUOk-ba72i4f2w0g-1
Received: by mail-qt1-f199.google.com with SMTP id i2-20020ac84882000000b003d6fee1d438so5441523qtq.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679240273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XIPLHs3kS1RfXeK+ON9SElHE9AkUNrNvAKZY1Ht/Lw=;
        b=W11iSlyrTTsqDibYP9DIjqCqe+48ZWSEOfQMfv8uXvPVVpnLQfwaphUw6yLvyfzdCP
         VlkrRZo9Zsyp4dbLCi8ETLQbtVfDVbdRZAwu/3yJbB2oHHfub74Fz1M+7hrF25cGWGyu
         kOSrMkxjeTqlHrGNp5VQN253VAMcMFaAXlXfafTqXOPoAAz5FcvjNG/MUoFgVR9igGWJ
         RenTzLHYPT5vtUnTkjAyWZQ3foYH/9JArRcnzRol4Wn6B+h/vWAQ0ZI5wZGVKu2VOmlj
         CFPZkb+ybunMaROfuXdn9j9hRrntIzD++pvBk6YdOliALbSmLP7j1q52rVweGSQqr+/J
         6Hbw==
X-Gm-Message-State: AO0yUKX32UCdJVfncdL5uvPBr15GcLkCIeMdbamwQ7whFq000sd1K7dF
	fGp49Xf/SfIVBxInaSB/SigADiqpkIiTtcdfw8/bL0HX4+0bGDufgwWuRhvxfLdvzSxkquOuvr+
	swZ5wh7Wazl3nPogAxiCypy/8jw==
X-Received: by 2002:a05:622a:34d:b0:3d0:7bdf:42c4 with SMTP id r13-20020a05622a034d00b003d07bdf42c4mr21989113qtw.59.1679240273167;
        Sun, 19 Mar 2023 08:37:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set/BlpAZdEhiIGBHLKI8KfO5y+gSjhpmxCIlxlV78XjP/E7ZdJLDSyE0FY32cU8FWAt7rGqAbQ==
X-Received: by 2002:a05:622a:34d:b0:3d0:7bdf:42c4 with SMTP id r13-20020a05622a034d00b003d07bdf42c4mr21989096qtw.59.1679240272931;
        Sun, 19 Mar 2023 08:37:52 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o188-20020a375ac5000000b007460093cccdsm5625801qkb.25.2023.03.19.08.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:37:52 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Subject: [PATCH] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Sun, 19 Mar 2023 11:37:49 -0400
Message-Id: <20230319153749.1705822-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang with W=1 reports
drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
  'qe_ic_from_irq' [-Werror,-Wunused-function]
static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
                            ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/fsl/qe/qe_ic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index bbae3d39c7be..c0b4f865fba9 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -232,11 +232,6 @@ static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
 	iowrite32be(value, base + (reg >> 2));
 }
 
-static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
-{
-	return irq_get_chip_data(virq);
-}
-
 static inline struct qe_ic *qe_ic_from_irq_data(struct irq_data *d)
 {
 	return irq_data_get_irq_chip_data(d);
-- 
2.27.0

