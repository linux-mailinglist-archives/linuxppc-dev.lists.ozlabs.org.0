Return-Path: <linuxppc-dev+bounces-7654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC4A885FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 16:57:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbr4P00X7z3bkL;
	Tue, 15 Apr 2025 00:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744642660;
	cv=none; b=btAc3s09ZpQm6ZAzyKFTLAicBcRFHerv7THC6TAAaTv9Ml/+13ac9QrcOAkpjY7de4VcTDygMQ4uZcgFMccBRTK1A2EjnPMnHRB+280GL3uIb0pWbMhVDpoLZp8eF8k1D/yPtqG9L7yS/nbuNPMhKB5jM3YexaGci/GupVWVeJEQwHf3jBYvxWroaMBxugSyav5dQHVTC19e0YAg0fJU+ot3Ab83FgagAZ1NWVh3zta0fX+5oEVB7Wk+/DQLtvfSZ1n8xQCpynhIWZqxSL1V5RdbhSulQBR7tNTmWaMykkT4oVw60OaRaREMuet37CgsTZrp7sZhu6x0ofPE7aCceg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744642660; c=relaxed/relaxed;
	bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=TRFXL/PjjRMlBIYp3xD60zeN67uyLHJ8vyyL5gX62aVJCvf9qV6yF7xvp82Cqzdfi3iuwxCBOH74bIA1vu8TfnUAc97eQ//yvrjkfHqrIvXDbX1m3NnPM4fiKj2O9Inoeu3yWwZBTOpmAphBqIy9zTh7hKsEZiGkAJhptWPjzeh2fk8vyxxWXB9mVYKToP8+GDCSWj1In51XjCwKEPu+Gph69Oxb1B8pKPYq5H0GJI9s0fW0KdyHnn/tKJmIIhLEHXKycgcd4eIe4jvQBaV5Q+/rUZmja4IG5DuA/qBlb7qEzHNmUINOjBkE0bO6rj7EQs+kOSA3vprI+EGJbrgo8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMS+keVB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DUYWgTlK; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMS+keVB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DUYWgTlK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbr4N10rsz3bcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 00:57:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
	b=MMS+keVBJU7Io1/5WapHgJYQ9uVl/io+zwsIpwq+LkfImvtJPstgKIgDRuSYCYuKl0dQ1h
	Pnho96cIWjGBzBqs7LBCy2dJNzVeoKpn79sD4mkcErVWpfRtPkRYr0rvslFumyNYOQi4S1
	/eZobbYtLzGJxdElU9zcMwJVQKFNI3k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
	b=DUYWgTlK52A95Ffk5FsmZkKCPQl/q5fYcnGf8k7yebeWTLcdl5G11zKThcwzFr9FX47OnH
	XKBBmCASwkVnwglC9gkH2oLyh6pK/re4MEoK1UG5aoXzotkKn2yOc+Nz77p7GLy7DLvo6O
	cBopuBcc4xEVf+GRhAG7NmyjlLSdEWs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-khq9ocrUP2KcO0f5eRigyw-1; Mon, 14 Apr 2025 10:57:34 -0400
X-MC-Unique: khq9ocrUP2KcO0f5eRigyw-1
X-Mimecast-MFC-AGG-ID: khq9ocrUP2KcO0f5eRigyw_1744642654
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913f97d115so2206849f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 07:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642653; x=1745247453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sa1KMzPVUbpw2KNCiE/Fawx4j9zSiPJcyY6hcGjqFI=;
        b=MSogMyEnsxEPv9vcpeOrzzpFwvNlYzj+iw/xIDYlQY8MHOUn3eBZ6REBmbxIt7u+Tm
         rd51ClEGTd2xP6WMoHyDKHDcmKBZ2QV2aRiKC+6VF2E3hQ7CefAdUBY4miGreaIC9JGq
         BIBVY7TdbaNNO91I5PdkBWAyjejPvBQmUHyVoNJ9W6PnUmuHkK4eabo8dviBMAjEbXEs
         CcBcG+5HiRgMaurUQ4rFc7CW6De4SIdECrsIfb/52jcwkuVBU6IJaP6OT74UvFdhjTCG
         y0Hyt97WkFd8Lv8voRaHB3cnOjkuhOJ1+GhlLOkkdYCuc2SsVt5jWK9NEs03P1DTetzS
         52ug==
X-Forwarded-Encrypted: i=1; AJvYcCVnzEgACB/DbgU2IhwlJiQ1SrFBoANQPWZRhm+d3wJnJnvd+b3lhNmdA81ZNf78UstBDs7mdA0FwhjF6gs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyti5GwUI2agcZUFcJMG0V/EmPdVnlCxlFVaqVbqLhn7Hp30aOW
	ezBUqCrTcYo0yM+JZOYjjZRGtvnndQR/FVpdess2NfbYd1xOGFcPD0BnzYUjsKIeYr41blpPG/j
	Pr7dofRzHi95CN/cPf9AMvslEXmk1UlVHWUvMTOkTYuVT7YOqNW+ex2tnCrIbUWQ=
X-Gm-Gg: ASbGncsUK9AvzwT5cN6SA4QR9YRSG4NB9P/46YoMrxEdOPYvdwxlg0DNfvVtpv2Uqab
	+vr8i1Z57+tj7BaJu3F3J6ZYhMUMRwqrdHrJOYmj8zaeYp3RFOJLb3cDe+FuWf8m3ZZObUKVSNC
	Dd67jDjkej2CN9wIVhIi4BTJMDKUH8rPcFnG/S2+jU3ImIi0Bdhsi6LHrQCBSKb5+pLfnQfMB8m
	CUSzl7MDpnBp9+cB3M60YSgA0yz79u0ba/ouyPHOf8nodwwFMz0edR7erJbi4YupW6RbZhK8Hoq
	Gje+Y9Ekl785DZuLv7tjJD1G
X-Received: by 2002:a5d:5f56:0:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39e6e48846dmr9576050f8f.9.1744642653507;
        Mon, 14 Apr 2025 07:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUePoA8CXCKRWtYvnKKIInk/j0CbqjuJ2mLiXYjmccJQ4ZcE+fLBnmyZcdyCqfwL3pNjKyHg==
X-Received: by 2002:a5d:5f56:0:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39e6e48846dmr9576006f8f.9.1744642652841;
        Mon, 14 Apr 2025 07:57:32 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cdfdsm11483858f8f.61.2025.04.14.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:32 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Mon, 14 Apr 2025 16:56:53 +0200
Message-ID: <20250414145653.239081-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DbskE_I3SUDtu-nnuzeWiasNj-pPXBwnFr1HGK-sotI_1744642654
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
return responses in the same buffer used for commands. This way we
don't need to implement recv() op.

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index d3ca5615b6f7..db1983072345 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,38 +25,32 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 			 size_t buf_size)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
 
-	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
 	if (ret)
 		return ret;
 
 	/*
 	 * The SVSM call uses the same buffer for the command and for the
-	 * response, so after this call, the buffer will contain the response
-	 * that can be used by .recv() op.
+	 * response, so after this call, the buffer will contain the response.
+	 *
+	 * Note: we have to use an internal buffer because the device in SVSM
+	 * expects the svsm_vtpm header + data to be physically contiguous.
 	 */
-	return snp_svsm_vtpm_send_command(priv->buffer);
-}
-
-static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
-{
-	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	ret = snp_svsm_vtpm_send_command(priv->buffer);
+	if (ret)
+		return ret;
 
-	/*
-	 * The internal buffer contains the response after we send the command
-	 * to SVSM.
-	 */
-	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
 }
 
 static struct tpm_class_ops tpm_chip_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = tpm_svsm_recv,
 	.send = tpm_svsm_send,
 };
 
@@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0


