Return-Path: <linuxppc-dev+bounces-8465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E99AB0DED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv2vn1Tf8z3bh0;
	Fri,  9 May 2025 18:57:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746781077;
	cv=none; b=gFigo61iNdGNW7prfVVSqZsM4kolzLVmep2z2D3sSLxw+gzpmx6ccxTJ2NckS2FOZGveX8xLiWQH0mAEEfzdy/yDd8dBV9j21mhwKEW0qvRpn3C7AapYV3c1kBgxuVCRkEUUWx8NzvGGGGRhSQJpEjhgb0IQY3rho4qx27yom0u19eAS5af0H8fz7VRUFMo34i9Yt8RY11vBc4G0Y2P5qDdAIGB/nP/PM4zK6PzPCsEvTjBGu65+aeDFGWHuViL+aAw6Kzhc/QTgsHP8JyDSjxcQURYwmXs0nuXPx90DZiusdZLFwLtm2F18eLVjsrF6fRvJyjryCLKYVcORS6rvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746781077; c=relaxed/relaxed;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=HRgJgBG1bdcUA1PEB0X6cmOt1th4ZcjpJcFge7HeQf4AAY163vjdMNPFPppYjkqjjD/6vNeYKmyX/l8+Ikz2Bm+/hFAb2p4N70KrrnquYxip5KVzIFbo8i6Q/DCyvaTRQz35JlbfqOYYbfqYIDpL/qtOTsgrdFlic14jr854pUF4IcCNR6M953K1KgxjFK7rGJy2WpXlpkIe/nPrWj5qzoLzDoQjz47itnQqjrznr3T5DblTMCuL4W0IFSIFprgUX6qhVxv0MAGwNCXb1E4/rZAOX2327TMdvJ2JnDfcWMHrNicztGw/Wft1wy5r+1D1uEUPha58gVvYY/ky/EpNOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlxOQgP7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlxOQgP7; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlxOQgP7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlxOQgP7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv2vm2XKnz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:57:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
	b=BlxOQgP7BecC9Vo6jjtAcaUAdlG0aUR3MkjV6MrOTSrb3XLH2fsbu8SlPlZ67x73w2+7l9
	FHHD7oh+RNUwtuo1Wo7307Nz1xpuBjEshFcSTuLYgUTdQkOpL59K3U93+W648fgnv1v3X5
	FGJPMebTVg50TjMWqAJPEDDrVGy3gy0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
	b=BlxOQgP7BecC9Vo6jjtAcaUAdlG0aUR3MkjV6MrOTSrb3XLH2fsbu8SlPlZ67x73w2+7l9
	FHHD7oh+RNUwtuo1Wo7307Nz1xpuBjEshFcSTuLYgUTdQkOpL59K3U93+W648fgnv1v3X5
	FGJPMebTVg50TjMWqAJPEDDrVGy3gy0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-gwCuudxZNUikY4OVunAvqw-1; Fri, 09 May 2025 04:57:51 -0400
X-MC-Unique: gwCuudxZNUikY4OVunAvqw-1
X-Mimecast-MFC-AGG-ID: gwCuudxZNUikY4OVunAvqw_1746781070
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad2200eb1d0so35133366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 01:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781070; x=1747385870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
        b=R/vb55dSeRU2TvLA3a44okCbUVTGx68T3lO2IGvyxW7GaG9Ucv1/2L1yxmJM8ozeMK
         rjdbYqL9sBLn/K0yChv5wQtaiDtiC3vGdyNxSohTi0WKqvOCdRTr83rsRekqSF60Z3s5
         SBRfU3BPAbrP4qqbuiqBy1708yrOCjO32bTaC1Sb5dxpncGQiUsaGQ3XA08BBeO8zpPr
         kOiluDzElE4RttHU+B9XkYmhY86ZvBtyGY+DsyaBrbATxWC8KLVkZ8ZlfiQmAhsD8xIm
         Cfe8W9/IOaanrwn0nvhG361vAGupVilP/+RdOgtSTM2nTVUOQWzbftbn7y8iwYY7WtXm
         J0QA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/6OzWdqy2slDq9h5kiLOxjXn1blpVfdgU4DgO42UOT9Y1ZYQIfs+F6hfntMDHN0jImHV6xzWyWdqaL8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbLp6F9Ge4BGxuE81qUCLF5IAa7pMyA4AHyy53SdsqA7pqIN1c
	F+hW5bE+mm3bw2MyZKvL0IAZDbAzbpVRwbDBjOetlg0ZT8/f6EVeGb3M8OEbcoVziBVocvVGzlp
	K4mo3iCq6wa+5IicExjv0AWG0icV2ANQYFAU5mlrGXURjzspn8XDcvTdwpqhrxxQ=
X-Gm-Gg: ASbGnctXgl9uBfLg+fK+0z/J0xs/8ryBebwinRWR08mccuhfA0FPngyWw4KJ0+Li0GH
	pc44HArXiJWSrfK8KdHuQW+pQcnOyrMewNIyfmZl5b0rmXaBW6p938qNq6M4QzrBGEsQOAUnlIf
	991l6PQWKmdVLZI/pamZHBQcwuFlipuo9y+6FsYintzjAebt8CvXSs2vmLrtz6Ngrq4u5XSHvq/
	v/18aY9RqLcqGtLAqRzc24QvkS34k2WmPvszhSDXQix3OTBmGq07Zcvau3P3zJm5yH2zdxPvX3j
	k618wfMJldowmSEZKtppuARi7w==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208672066b.37.1746781070376;
        Fri, 09 May 2025 01:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/6oRhoG7o/lfsJVdPERf6/D/JJirfP83vdMoj15DtJopabMpuCr2u+MViV0A2cvILTEMug==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208668366b.37.1746781069774;
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219348781sm119504566b.61.2025.05.09.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri,  9 May 2025 10:57:13 +0200
Message-ID: <20250509085713.76851-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509085713.76851-1-sgarzare@redhat.com>
References: <20250509085713.76851-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4HK7sIYnuHU0s2qq8T6hgsp8SlH-wFmVDCBIABFHOaA_1746781070
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
v4:
- reworked commit description [Jarkko]
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


