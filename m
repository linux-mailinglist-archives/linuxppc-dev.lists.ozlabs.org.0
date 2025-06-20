Return-Path: <linuxppc-dev+bounces-9588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6CAE1B82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 15:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNyV76mxYz30Sy;
	Fri, 20 Jun 2025 23:09:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750424943;
	cv=none; b=GJNtWH+vmq7niAT+o2w04D+EMDiSs6QdQJYw+sG+3h3dHmELBibQAtxDCTKxmGM2qpfNz/PESWtklfbB7irLvMAjaiN4a6CSv55WagEXmZAdO8L13Vaal7sz7fbJDKL1ii1tGP9e6EZb/BIQd0p0nBfCsrV7R0aTTwr66jLq34id3L5qls8+xuoE7EQk/uszfqEWUwNlC+xaYkpUHD2VWsuNMOmsGjU3YKSkdKkz5QZci5N6c/eirAhfZvo8xjNGMbPNGLZmb3QCh+/4OFf5tMcVTPCyrzAGAPxNoMESEfRNMGBQD7pG09ywF8xeALNLow1PsPz7KzlzqsLo5GFGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750424943; c=relaxed/relaxed;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=axvSB6MEjtgWfiA7NPnfcY0RurCuV7IG6yIs64JO7X4jKRXeakKhlwg5HLcW52WYAuL+xJbx/YT8UwZNE7qaaD9n2OlEalElWPReZfex1n0LZPnVCx1uScIQ+9X4iKDqLbrX3KFlYXz5wJMAAa+LqRPto8AkzRhM+dto32OukDVrGONClM5hwGLpEgT9TUjolFYaw7Q/cFgfbUmTGHFOFo+igVph+S/G2hoKEPA4oWZ4xdqkjZWpAVHKrzIygO0Jmblfmu4TkfuMJldjc5TR18wE6X+cdqaxtU8azI1QeQpGyPya2SL0ts8xbOEdyU4DaQh/IXAM3WFWb4/ZMUwNlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSumVEy3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSumVEy3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSumVEy3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSumVEy3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNyV70wjDz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 23:09:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=GSumVEy35j/nx5sNCyYNdVpIXXXvFb1F/wkUhT7iqK8dPALCeA4s21zUOF34bzdr5cdaw7
	TVOmZDbh7RDoSKIfjS0mqn4AkOyRhvPtsTdLtF2wgkNrARDd3FmTBu3rD7KmEgnBfAVCmL
	igZHUAN596DJKJFZTgOwrYHtuxtkcMI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=GSumVEy35j/nx5sNCyYNdVpIXXXvFb1F/wkUhT7iqK8dPALCeA4s21zUOF34bzdr5cdaw7
	TVOmZDbh7RDoSKIfjS0mqn4AkOyRhvPtsTdLtF2wgkNrARDd3FmTBu3rD7KmEgnBfAVCmL
	igZHUAN596DJKJFZTgOwrYHtuxtkcMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-fKyUe9wRNR-H5raqlzC-Qw-1; Fri, 20 Jun 2025 09:08:58 -0400
X-MC-Unique: fKyUe9wRNR-H5raqlzC-Qw-1
X-Mimecast-MFC-AGG-ID: fKyUe9wRNR-H5raqlzC-Qw_1750424938
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1057762f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424937; x=1751029737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=pRRQqhs9kIWRgEJ+cKtTrsYcrqChLQHrvRSYOvFqkfGjQij9GIWhPPFHmakZspJEdA
         95chsnVm5i09zqTXx/cLNF7rxqU3y9U7s90hI9OX6u62OIppLJMPHP4/Zkk3Ohx+/ONN
         sB1Rx2gh2AIyBVHAqeCywr6XpxGYl/8CwEx7dUGxK050PmqLYC3plLxRxx4v4+wvJHW8
         qJEVqhOUo/sgfXE0z/7HVb1Vx3dut5nza726INDhTg6y40D2J9VDulOIRDdY7f29/qLZ
         4Mq7KP9a65fn3lnwUfQl/8FZ5EhuFrTdRQCYrjXfGIBXNEartKMZxzrIdjbR/394ixZp
         aOBg==
X-Forwarded-Encrypted: i=1; AJvYcCX1GxZaVYOis6DqRzfh8KTNg6LU5mlkgSX9AU4DFM0hGqbX7c/Fxape2bN1ZCQmit7mfgOmSF2IKVm7zA0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEa9iWZ3viIkEVSRXpmerfw9coZVPM46hbe3Q6l8wHiariWSZi
	SFgYulKN1iWFPpLIkjV6mCY6zikUyYi6CjW62NJQWI6Xjg+A0NGI/r1WGOZ21ZLbc1gkN6pJvfa
	yu2kOnizEWIA71RE55H2tBdF93HwX7eH/d8jN1uBGHzp32v5UEpuuSRLLbk4BASc59M8=
X-Gm-Gg: ASbGnct2KZff/Icz4imVtvhO0unPt1Sl+IJ2tddEJc7OVAAJyMcfYPW9QZ+1X/oe1F/
	F6d4IoK1UKDVe9DgKQDs+/FBOshKwNBOMmvHW+minW3IWxUewnMLdr+EweruFyKU3BceuEuwHvY
	PgYu908e42uAGBvEAMdLOSxTyVuDfacPEOLKOS9GiS88nwXdHOXj0CUCXaTa8owUcNzEwsof04a
	R1Ez+APBpiNUYKOMmlQvcaIZR2vb96kG/Ad4mbXAgsX6gE0H1r6Rnn4hrErMmD8pffJLyAYV3QZ
	eu2YXH46MWhxpeI6Cg+XPhtdG/+Z9wX0kkw=
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522848f8f.34.1750424937540;
        Fri, 20 Jun 2025 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErCfEU/IVq7uI6YOAV42Q6eu/6bPqI5NWLxqRlPFpxO3LmsQRBOu3Tts8nxYdGgHaYTR596A==
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522807f8f.34.1750424936821;
        Fri, 20 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm2026391f8f.29.2025.06.20.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:55 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri, 20 Jun 2025 15:08:10 +0200
Message-ID: <20250620130810.99069-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130810.99069-1-sgarzare@redhat.com>
References: <20250620130810.99069-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: C7LdZKAw_hq2uWJ51oduFgGFeWNbe2VmRP6dN-gEZMY_1750424938
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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


