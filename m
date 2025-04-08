Return-Path: <linuxppc-dev+bounces-7518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5DA7F7E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 10:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWzpb3n95z2yrW;
	Tue,  8 Apr 2025 18:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744101143;
	cv=none; b=GMVZ62YO1guwKBr2n+e3gYd8gvV6wjyYEeqnixV1itrS2VmGrJ8iljuzzyjdlbcu1/2s7oCgYwIOM7JT8a3BabSpICgm9rJ51lGqz8zouLGJV8jkMvzspneu5VxGcVPXgpzlzeMMAO+j2X+kgv608APfCndrixqLSC+HmUXwSwlRopznEYDhKIDxATl/4VsBT8hymQ13yn4h9ZpBWBGSA2wiTPYdiocxLpKlqAvhbVBzGKmFe6FdYG2hIXUV9EE+rfV638rVfNY24OOoaX4apEHTym8287z2dhgWKkQJOaHlkW+gVGXU05xw7Uz0G9EPv6ddl64CmeJbCcp3V8Vagw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744101143; c=relaxed/relaxed;
	bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3j6AAkTmryy5TkI2fPN0tw5cd3Phl6fRt9t5b11wpggYaSs8711cQ1p/TVwxeece0g4bfCKGBSDaSnEHSN015rmJceu73G4rRzigEj2tu90D5sMFfcKssfLtif3hWU6P5sHKXYpbndGdNU0Me2bXjlCHjpjiK5vZY5HaGn3AIqeq232QK4hzVJwh/xbmtaA9Jv67qiYkGpae33E/Mr+Y8dHiOwtXJy/OCqWGugL58TK72/1Hmcq7O1eG/QcFBnG4dbD8ENDujqxFGHLYoJX6HPjx2M0Yd5Nsp2Ahx4wvPXpkmxsqGC9WW2NgQ9Yrl8ImZt/FuAs9DMLhvbjtARhow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WKXtyMia; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bgW6tqvj; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WKXtyMia;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bgW6tqvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWzpZ34R6z2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 18:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
	b=WKXtyMiai5K4vzbls3grfRFXwTBB7mtcbplya3DX81QMLNZ8PCHrbbiYl0JuZlJ8P8PfF1
	sG/a7dsac9tYnouEi2t2uSaR8VmOt9tDAU/+C/TjTDx3kEvn5b5OOZA947s47du1cyTnXD
	kzKbOzpEMPdidWc0unSI3+FZIUYT7Co=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
	b=bgW6tqvjPhmTi3FmBGagktukNVeFi/sJ8n4a2/2cUjnIc05FTmxwVcDfEnf7WmBGNuOITg
	xqwjdXEK67r1RdPKrrf0kqD+IhdvqcvhiGYLjMLtGMeM1yv5F2qYomQiYE7xgavoqePQNX
	dNyF9L4uYk8zSZ3BVCztqXVBGxP55Gc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-Rw9ZbPvXPqya_rRlLy3lYA-1; Tue, 08 Apr 2025 04:32:13 -0400
X-MC-Unique: Rw9ZbPvXPqya_rRlLy3lYA-1
X-Mimecast-MFC-AGG-ID: Rw9ZbPvXPqya_rRlLy3lYA_1744101132
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso66374825e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 01:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101132; x=1744705932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
        b=PAV7KUC/RTWKmMLOLdnVQ8u7VEvLFmnFyMb7XQgYdjkpxpsJLQ3Vk8J2/uShqkc6SR
         kFAebLTr0mzEyd46229Vk/CZErXQWX91qy8O9aKY9FfMXbsgNXC42BoOtxwDLHtgqrUr
         Ih7BfMxtHhqx5Bm3KgQpP61gcJJfLbiLzWvVFn70gbmZXtT7D0e1d+PQpuDnlTlhaMvY
         6TppPu3g/ToW4lxleJftzMPSh6NnkvUwVthPRVMlUzlBNWr5Vjlmq1Gz5LCELuosX1NG
         O9cQHDKNGBHNqgqdmuRtjTx6JVtoOvAgD6QD0ykP3bkh2x7KNXGXlSeNxJMpXPPbC3kB
         0HgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtulj+2IGxeBJZ00rgZbhy8x0U87JysuT+EWBp6AgSW7FVss1UKjbg/kJobhbJImIhTVhx65WYcosbuW0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0GsGL6uNjma/UA/Q/kDzyImZECQw0PLPeUikmVNIncsjREiZa
	ZpaGpi41x1A4nh4YlpTfq+ZYnqdNSJiOVlC0BeymaxMRYcmCkNg4HV6pgKeSePIA3s8CNgv2Yz/
	8toViZ6ecXswHKKpQLrbrGVcEz+4pqBKkUUJx4+kNKpI9cYl6ezuoeNVe6WaIQ1o=
X-Gm-Gg: ASbGncvpwPb9CP0VlcN2DslI45N3hLdb7364jwIDLW18/6NYxUoyZXksVKnLtr4BoZr
	5x6ajIHPwwE+E5kit9P6afNPKPwXe28LiwYREl074f5mhqjrvwYRBfJyD/nr2sPjBIZkGcXiP50
	E5bFEE3y4OpL9NhQjt9zMCmLjP9oUdO6UizjxN+sAr0+a3UCo75WT6wKZsuDwwbdYx0GeOwf9k7
	F7yUOxoSBJt133vBcaG0qR6kWgjV3ri/8nWYe4LBfb2/UWL2WwMaOMAdFfLRYm+O/Pi3+ZDMzs7
	YDxJENip+XbEutzURak5c51coc479ZnAG655n9PtnOverIWrzt8HlpaxBIOU+oqAJg==
X-Received: by 2002:a05:600c:b90:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43ed0d6aba5mr130770515e9.25.1744101132334;
        Tue, 08 Apr 2025 01:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgPkhOboJZ733S4u0DItGfgIvyrdGzL+Nsa1iDulpOSNfq/oW82+ZuG+Ms69bzenXSEUjucg==
X-Received: by 2002:a05:600c:b90:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43ed0d6aba5mr130770015e9.25.1744101131821;
        Tue, 08 Apr 2025 01:32:11 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm14361605f8f.62.2025.04.08.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:10 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Tue,  8 Apr 2025 10:32:04 +0200
Message-ID: <20250408083208.43512-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
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
X-Mimecast-MFC-PROC-ID: xMWx_gq7VHYS-t4_Hf_benN5cNVEJdEiXN_6q7d5lPo_1744101132
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series is a follow-up to the discussion we had about whether or not
to add send_recv() op in tpm_class_ops[1]. Much boilerplate code has
already been removed by Jarkko with commit 980a573621ea ("tpm: Make
chip->{status,cancel,req_canceled} opt"). With this series we try to
avoid also the temporary buffers needed between send() and recv() for
devices that do not support interrupts and provide a single operation
to send the command and receive the response on the same buffer like
tpm_ftpm_tee.

The biggest advantage for this approach is with tpm_ftpm_tee where we
remove the local buffer and extra memory copies. For tpm_svsm it does
not change much since we continue to use the pre-allocated buffer,
to avoid making an allocation for each command.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

This series is based on "[PATCH v6 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], so if we want to apply this series first, we just have to
remove a hunk in the first patch and the whole last patch.

I removed Jens' T-b and Sumit R-b from RFC/v1 since we changed the code a
bit, so I kindly ask if you can test/review again.
I left some questions on patch 1.

Thanks,
Stefano

Changelog
- v1 -> v2
  - changed title since we removed send_recv() op
  - implemented TPM_CHIP_FLAG_SYNC idea [Jarkko]
  - removed Jens' T-b

- RFC -> v1: https://lore.kernel.org/linux-integrity/20250320152433.144083-1-sgarzare@redhat.com/
  - added Jens' T-b on ftpm driver
  - removed last patch since [2] is not yet merged and will require a new version

- RFC: https://lore.kernel.org/linux-integrity/20250311100130.42169-1-sgarzare@redhat.com/

[1] https://lore.kernel.org/linux-integrity/Z8sfiDEhsG6RATiQ@kernel.org/
[2] https://lore.kernel.org/linux-integrity/20250403100943.120738-1-sgarzare@redhat.com/

Stefano Garzarella (4):
  tpm: add buf_size parameter in the .send callback
  tpm: support devices with synchronous send()
  tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
  tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC

 drivers/char/tpm/tpm_ftpm_tee.h      |  4 --
 include/linux/tpm.h                  |  4 +-
 drivers/char/tpm/st33zp24/st33zp24.c |  2 +-
 drivers/char/tpm/tpm-interface.c     | 20 +++++++--
 drivers/char/tpm/tpm_atmel.c         |  3 +-
 drivers/char/tpm/tpm_crb.c           |  2 +-
 drivers/char/tpm/tpm_ftpm_tee.c      | 66 +++++++++-------------------
 drivers/char/tpm/tpm_i2c_atmel.c     |  3 +-
 drivers/char/tpm/tpm_i2c_infineon.c  |  3 +-
 drivers/char/tpm/tpm_i2c_nuvoton.c   |  3 +-
 drivers/char/tpm/tpm_ibmvtpm.c       |  6 ++-
 drivers/char/tpm/tpm_infineon.c      |  3 +-
 drivers/char/tpm/tpm_nsc.c           |  3 +-
 drivers/char/tpm/tpm_svsm.c          | 28 +++++-------
 drivers/char/tpm/tpm_tis_core.c      |  3 +-
 drivers/char/tpm/tpm_tis_i2c_cr50.c  |  6 ++-
 drivers/char/tpm/tpm_vtpm_proxy.c    |  4 +-
 drivers/char/tpm/xen-tpmfront.c      |  3 +-
 18 files changed, 81 insertions(+), 85 deletions(-)


base-commit: 92d2673cb03c16e47d7308dedad6ff3bc3d117ca
-- 
2.49.0


