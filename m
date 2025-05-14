Return-Path: <linuxppc-dev+bounces-8576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10FAB6D26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 15:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyF5F6YcFz2ywC;
	Wed, 14 May 2025 23:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747230433;
	cv=none; b=bLabZzlg+ipSw146210R47D0LE8mgxllPd24kM8xHGQLHI9uSOQLfmEHiw5NHDDrVVsZ3kH/TFbPG5jYTrDFXfwzfWMngQsPad2Fu57aMfotgN2qZ2Vu0DmmUUSFIDTUDjZ91vP1TsUkHSpWryOWc8ci1gn6lGNRjYZ8S9bGxrZ07HZu8XFmcx03zy7FyhRDdpco2fic6CLksirUkwkHAoRLSzsMutrNdG/RyrXbzI0HHedbNFFDLfeN+u3L2BqkCol1r3FKLjQ5xRtK/fSoFiw5iLU3LhuiDvCzcv0QNth2K0cXanadToVsc3O28EFCYo4pZPso9ZJsZVzqY3FuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747230433; c=relaxed/relaxed;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=L5mq6lhbVSzgWHRyGR4WmK5cgvpQe9iw1SSfQc4TyF+s+as4AB7oI/ju7NcnjXy1Y4ZHrHXpzv4JvNdw47EqstrfpBpOSjbKrWv2CrhfbVogoS+dzYuAqvX/UGrPfLAnpMZGgjxzq0pI/BCASGuIo/Dsf+3WpTN5v8rsIuSRxJtAmEzjiIPR2Mr9cm64VAjV1auaNN4ewQFQWOcV7o4p9afzzD8+vv3Cxup3wAOyyuCG0yNbErBM+tfHGpeyVNXxVVDWruJZlY1QO58LoTEN0wymN6LMyL6+cc3SeugxtD6RDMssnk3/6rCLjyiHP8goalRfEFZm1cEg9bRzpUktYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjRdcHRW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKx13H1s; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjRdcHRW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKx13H1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyF5D717hz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 23:47:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=LjRdcHRWO3O0OlbTRawcTxlDDRoZ1gtQswRbROyQGA5pCG+Qm7S6RN8s65IXy1mBOJkU5L
	26iZhymJ8hlvQIZV9IRgBl7g8AsQzPnXKyUW9oX1b6mf+FzTJ8i3+1ElcgLJ/JB9lBynMu
	984khp6Y0Qm4+gCBwh2nBtsIRhdPfkk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=IKx13H1sCVKeYa1w+Ufh0pma692i1314FYJdYPzrunVbCg3raECIqmf5w4PZuc73k1X2GZ
	RCWo7me3xnWAZrlz1c/HQLjT8CVPivwMXCNmg7EBb4TtZivFXkQwt3MtROv9pSfH1t6ecQ
	FtODlBhCgJ6V9kQrghBgJ/XgJkspinw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-SWjp7kN0OZilfrdJGQgGmw-1; Wed, 14 May 2025 09:47:08 -0400
X-MC-Unique: SWjp7kN0OZilfrdJGQgGmw-1
X-Mimecast-MFC-AGG-ID: SWjp7kN0OZilfrdJGQgGmw_1747230428
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so5185775e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230427; x=1747835227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=qdah3JXb6bqMTi/L5e/8av59PqSIuxNPyffy70OI9PJg93KGttLMlMT2Bkp+4GeDKL
         yYmzviDCBm4XjFSefQ7/vtCBVGkUklvlb0vFN7KWONtfMwy7dxdasYi6OhriLnJjbhoL
         V2a5Q+Eb/kiK0D7KhVaE9qs0/gvR+FM7eN70AEhrVRgGZi6SzNBFx+YJCgO+3Q8Q9aUX
         IAUQh+YEUwDJeRHH4fnrPD4TAe7bkPW9FgQewN7+Ypi4QwixB5np6OAKbE1trYGxaNm5
         VmJOQAuk2sG2k9h3Pc3jU8+2KiCO4QKv+NVeYiAQlakcOfhHKAORo5Orh5ugK3bWaO7w
         9RTg==
X-Gm-Message-State: AOJu0YwBGEEWKlF3slL3tf3vTNC62HXAY07eIH4qlBxA9J7CLIKcl9Kc
	pwIkhfdnOhf7xW8hpd3TYvBUduh1juoh0btCLUomRdtbU692pSQfUrFz69eNbIvhBaF0P+mQOfU
	QiR4PMjRhlLzLkkEBWLaDXopV7iT60T368sSfS757BQ/gpT0ZMQ7NUGEPQ8VaqqQ=
X-Gm-Gg: ASbGncthnnimK08KateXHumrsF1m7liPTlI0+pFIH9C4mdhZuw0g87h82fgna0WElkQ
	IOFH5MLWrXRATsltLmmqx26yicPLLI0ZUkUnljvXJ+vYy5/yGhWsahj84996OPhwt9F/gIHFL1C
	27taF2jWNjKlFiFfNt9pS5WB/JZNenl9iZWdtUBhgfKHxlrE/Q+1lmK8KFggMJyIfw4sujjXJCb
	yNfamF4LnLc0pRQa7rszGmGqwml9Dc6FBG/oCmo0HPD7q6dT8PHwssaLJ7aRi6maWkqRts4wjfb
	zlQry1mQSiJzUPYDogA=
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926285e9.2.1747230427578;
        Wed, 14 May 2025 06:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcNilqw5pw/zInUa+0ub8X2j9IE5W786j2MgQiDjsofCPC9ebkToa0QhXEfe/ocJNSBGqaA==
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926015e9.2.1747230426999;
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380615sm30931135e9.16.2025.05.14.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Wed, 14 May 2025 15:46:30 +0200
Message-ID: <20250514134630.137621-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134630.137621-1-sgarzare@redhat.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ADxa0bbBRyu6UKwzvM1f9Qar0xBaPFKm9vLT3Gbi3Rc_1747230428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
->send() already fills the provided buffer with a response, and ->recv()
is not implemented.

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- changed order and parameter names to match tpm_try_transmit() [Jarkko]
v4:
- reworked commit description [Jarkko]
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index 0847cbf450b4..f5ba0f64850b 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -26,37 +26,31 @@ struct tpm_svsm_priv {
 };
 
 static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-			 size_t len)
+			 size_t cmd_len)
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
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
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


