Return-Path: <linuxppc-dev+bounces-8572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04274AB6D1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 15:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyF4m4MS5z2yrb;
	Wed, 14 May 2025 23:46:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747230408;
	cv=none; b=mdpuSfOnqVa/9PAE+ShB3enPddN6LUVBI+rzOxa09IbSuaJXzuNIIIpKWcuVtSG8VbJNSWHkiuxmXYF2Ah20pgrUjiQVvL5BT2nh562TaUTePN4ne8IlNTBxXDhh/y4V2F0lnsmDE8PxI3Pq5kT1iIRotpVVfSDs1stP4aCq6fgQYRYp2ij24KWbYnV6EXtwO1AfnEGFSMxiBD8GLiTESZIPjYvuHJ2RzUzyKSY/Cz+xZpqo7q5AGnBnmKkxS/jfc9ZjpXbF8JJFLYe9t+bdkrpJWa+mwYn+UpuSjoraFmEnGvbkxDFIA1xUT5uXL0p7b3IIp66ZM+5Eim2EhSBvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747230408; c=relaxed/relaxed;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=afuboLXPZx1EBW96Iaqc1oqTJsumDMZTp2Kmnr4TydkSEIYM7c8jMJrck18dSIIz5aiKXc/U98ruoAh85v5QDbcff+0ZGUyBMrzI5VDi60nzGRU3YpRrEHiJAxA4wsKev5lL7FRo6L6oBrl45MVh25UkaFf9CO94VkEF2AYz1hP7fovsbm1U01eeQ89h6ENAy44ZRT4CcfLViP8FKoAIyaWPc0egwMQablflqMM6VjsV03zQR/GKKmJrVMq78bPJWzYM8nJz/+MhqexC99mktXKbNg87ao0uIk4F5qY2ZmKMtlKp7SFEfP5vbD06az3Ka4iBp8l66pxNflyRjGu3/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EZgJjIIT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EZgJjIIT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EZgJjIIT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EZgJjIIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyF4l2cNcz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 23:46:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
	b=EZgJjIITqAXgypEmC0qhZETRIOUn+e0UVJOERIYAv0Px57CrB8N3E7zukxJqvLSViPsMmq
	WT9yC+k8F/3tegrItsTp2GvBKs90R+AsetO+YIoqSyq19XMdH1wrVZtBd7KiJ5JHI/94l4
	gW1yTddFZnehr47BNg+TQGMgDpnGFxw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
	b=EZgJjIITqAXgypEmC0qhZETRIOUn+e0UVJOERIYAv0Px57CrB8N3E7zukxJqvLSViPsMmq
	WT9yC+k8F/3tegrItsTp2GvBKs90R+AsetO+YIoqSyq19XMdH1wrVZtBd7KiJ5JHI/94l4
	gW1yTddFZnehr47BNg+TQGMgDpnGFxw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-G2FJa0V4OdKvog-2_6t64Q-1; Wed, 14 May 2025 09:46:39 -0400
X-MC-Unique: G2FJa0V4OdKvog-2_6t64Q-1
X-Mimecast-MFC-AGG-ID: G2FJa0V4OdKvog-2_6t64Q_1747230398
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so30776585e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230398; x=1747835198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
        b=XRIxCxUhv/qVCDnjUHKIxfb0J4ByUWXuUHcr3zz6te+5GrjqsAsxJONfQJT4FA6zuu
         jdPdvTQWrUEvSNHBdeG9n+/jxJPXl+76TBc9AAY9kSaXTkGE/Alvd7XXMn0/S6MagL3D
         jOKst7u3+fS77bA/E+GRvBtmJDTprdyj63jSD0bPEpVbUNphPHIA1GFnAbKHV9PbBtT5
         x66YGGYRfO6kIs3Pt0At88aeCX/tND8Hnmzp1eKx4txgDe5F7jQ8AFx7o26Sp2mjCKbT
         im0q7jXKi2uly8YxPcwwaNt4fEcA9jhV2WnryM7wj0wZDNL71Jc+lCbR7UJrQ4LBSULp
         nzAA==
X-Gm-Message-State: AOJu0Yx+C+NgeFZVSz0RqdDgT6gMc1KCJO4vL/4MtVF0XCgM+ZU6Uz9y
	7Vz1cdLL1/PQinnyqMjtN9zjBr/HhW3OkFGF52/OAGtPe3CDirPm3dwVTKllt+7e7/yrQTDcwnz
	Zr8obshu2XaySxpnElooYQcS5vR9SKROXIGEsW8EA7vGaFVFPfUOi+iUC5+mAZK0=
X-Gm-Gg: ASbGncudSY5ZhBmFG4hGqjpSvWOKJScAQSpJ7TXgfJ5BSGDJLsOIejGID7jHePYp2Tt
	QxV8qnCToDEQaeDIVMng5V3eKPbuK5q0ZDm5xT9K/eb3ZmNT7hdw64ddk82Ak+0lXd+53g9lGCw
	RiYIi34aMsbkNt8UM+FVGvhmwO0jzfjMwQeTuk3PNiBPii8htLGTFrGRfCVFQ35L7xz33H4n6pD
	TU51EX9fBDn6ed+vqYficoi1VXSQeuOMI/XCO0mqBOFnlMq/sbJTFn1tZe8+/36V9hoAkE+XomO
	pcBrFE4heznFAdtcb4s=
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437705e9.26.1747230397913;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9vh+bpQG79sp/6DI8di3RxLNOV35Az0tewqTY/ffxwzq3/IqQ2Ik1HsPTwPjASd5o1gbLA==
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437185e9.26.1747230397293;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm32993785e9.22.2025.05.14.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:35 -0700 (PDT)
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
Subject: [PATCH v5 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Wed, 14 May 2025 15:46:26 +0200
Message-ID: <20250514134630.137621-1-sgarzare@redhat.com>
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
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGe2MdAMZsyP4xF-dJFN8t00rHESzZutkHyFdLxwCmA_1747230398
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

This series is based on "[PATCH v7 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], which is currently merged in the tip tree and available
in linux-next.

Thanks,
Stefano

Changelog
- v4 -> v5
  - changed order and parameter names to match tpm_try_transmit() [Jarkko]
  - rebased on next-20250514
- v3 -> v4: https://lore.kernel.org/linux-integrity/20250509085713.76851-1-sgarzare@redhat.com/
  - reworked commit descriptions [Jarkko]
  - added Jarkko's R-b on patch 2
  - added Sumit's R-b on patch 3
  - rebased on next-20250508
- v2 -> v3: https://lore.kernel.org/linux-integrity/20250414145653.239081-1-sgarzare@redhat.com/
  - fixed comment style [Jarkko]
  - renamend `out_send_sync` label to `out_sync` [Jarkko]
- v1 -> v2: https://lore.kernel.org/linux-integrity/20250408083208.43512-1-sgarzare@redhat.com/
  - changed title since we removed send_recv() op
  - implemented TPM_CHIP_FLAG_SYNC idea [Jarkko]
  - removed Jens' T-b
- RFC -> v1: https://lore.kernel.org/linux-integrity/20250320152433.144083-1-sgarzare@redhat.com/
  - added Jens' T-b on ftpm driver
  - removed last patch since [2] is not yet merged and will require a new version
- RFC: https://lore.kernel.org/linux-integrity/20250311100130.42169-1-sgarzare@redhat.com/

[1] https://lore.kernel.org/linux-integrity/Z8sfiDEhsG6RATiQ@kernel.org/
[2] https://lore.kernel.org/linux-integrity/20250410135118.133240-1-sgarzare@redhat.com/

Stefano Garzarella (4):
  tpm: add bufsiz parameter in the .send callback
  tpm: support devices with synchronous send()
  tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
  tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC

 drivers/char/tpm/tpm_ftpm_tee.h      |  4 --
 include/linux/tpm.h                  |  4 +-
 drivers/char/tpm/st33zp24/st33zp24.c |  2 +-
 drivers/char/tpm/tpm-interface.c     | 22 ++++++++--
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
 18 files changed, 83 insertions(+), 85 deletions(-)

-- 
2.49.0


