Return-Path: <linuxppc-dev+bounces-9584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F7AE1B79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 15:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNyTc0ztWz2yFK;
	Fri, 20 Jun 2025 23:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750424916;
	cv=none; b=K8R0Ww0495gGFoEaGBoAXNf1PdKzAKqlZJhNwv0kV+WDiimc94fnuY+7P4Yh1VSlXlRggiQyZmMsSyP0PXVadPVOH3etZLE8FQQPMoPSKewx4TfrHDDOc2bSd+LhoIh8dUz1vElLkiDlNXTm2hNSBBvqvxfr1LJtqNA32jXrfoOTAoe/edaUhAlyV90MQZhCzeqxz5/VvBqzmzw6J3b1/mNe7aQQOLM4mzt7EMscnPAmU87rXeBESEdaklOmpXeSAZ6zJCip0/rjlwLsXsIuZJqxpiMKNeOmQGZVxm8rN5p/9Vi3IIxY+J29gB2ZH5o8Q/MR57BTzPNpQLz7xhg/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750424916; c=relaxed/relaxed;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PV459xErGI3KLRrZBUdvVf0Aj0WGw+jVJM9ZHO4K+DMrTmGLxH8WalBrSkh1Rlq/2mTJs8AwYn48pDg050xXZIvI7ym1rDNwehShMc1jJIoCmOdUHYiZB/VKAXZDg/seJjB0wIrzQ2N6GJr8Bv2m8z3QiTcjitbQiiR8FNxtOy0LZeerwVNNxJPYtovFVI3Lo4RVcIF9m1WIBTHH7csk1wqrJtCzGqrDDtJW+J4kXo30aNNvi7MYV5YrJdfu1gQku62LsmvEtSzNFdsm0RVCzlA72UOe3yVPJ51rI03rghTnvYzgnhRTvpFA5SaIVTymXrA2SQAs3SSZS5WV1RFBiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Acxdv75k; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YabQfA7U; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Acxdv75k;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YabQfA7U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNyTZ0Z7Cz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 23:08:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
	b=Acxdv75kA9nf1SSzZTpbq+w2lfXvWnJvWneOLecdXZtWaIVasuZq2NOjV0he2MoV0cVUjB
	Q13wgCogFIf61XxH66zIBuYLsBsefFoJUmRkoixvuGzL0dczmQtrexaNOxxgapTISE9nL1
	8jYbY0RSjsnkzCxWf83nHTSbpl7cUx8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
	b=YabQfA7UfDp5o4/iO9AN8wMEHhfuW99PHVioJMDX6k1HosofGMWmn5cl7dC21NMIJGGeeG
	9uX/ktaS+ROZlx+yej+FbRUoqGmAyjTEj+qpQ3K2T1qdejj3zxrFJe41694lZRDVDVbtr3
	DC56VWBBQbTgdMVlIiIu3pkoVccLJWY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-FNMAvGLdOkSs0iRpnK2HuQ-1; Fri, 20 Jun 2025 09:08:25 -0400
X-MC-Unique: FNMAvGLdOkSs0iRpnK2HuQ-1
X-Mimecast-MFC-AGG-ID: FNMAvGLdOkSs0iRpnK2HuQ_1750424904
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1177335f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 06:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424904; x=1751029704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
        b=CtdlenDMWoq1ZJ3nRjqMh6POrpb6wtrhkou26epSF8kMJ2LaRhVTNeF270sFXMRvfC
         Q9oak1n47+UhE1fNn7ofePiyMRe5/RzfRFEqmfaUnt8q26Qb5bWqZWfj5aob0Zgp48cG
         9rAdlYpnT75+rCkaAK3mJ1TJYKJTCaiVpK7DyfS99xSATSmHjGsER2ECVUQ0PwQKpFcZ
         p+KSC0vr9V9I7+K1LZ9Km/xsu9zrlWCT2ETDmylB46pYCrTHbezgYNHXdlh+c97rJMzJ
         /6g3+7NC7EEhyGCCLA7iELOLlX7+9RIzbeLmI8Qm5aOLj10fsv3YrOcBbl9eTWbYDRVo
         M4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVp+Kzhqsk9QmTsVm1oWIZ5mhW3zfQmj7LxFo3oPQ+yK4jPbmFbWnZY14KleMhsVnUU3Gqt7ZAeyMGPC3g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp1mjJlM8kaW3NbEeSUmL0NIhZaho4nRzef9MynsGW3g24KKGr
	2+5BQDea/FTW/r+dhSVZB5fBlqQ33a1AoYR+7WV+nttle1Z6CrlC+zbCkyBq8fDQ6XI1y6zbmIt
	6T+F5wcMuKJ32rLVZ5XFAjVuio1/I2YPF+brEgtMh7UFbVO8E3/GBR9tvaaDArp9sKrQ=
X-Gm-Gg: ASbGncuqhHqDxH+tZudR2i6Eav4pNARrUIE9CzWzYieSIjJqXAcBNE1YRrblQg54qT9
	2y9rP6yVrdb79ab3SckG3iRzLe3se8t0wHWmGkfRY5U585iSOKNCyTvO61PpF634vNzf6ko2Dx1
	sdJVtT19PW4bBiNdHig9SFhtLgrxawoW6IllGlcGKl7tOii1enms9VNDXb2SOG6Wwyr393aO+gk
	00sA+nujp9RQKJXjFzKuizcQU7cAtHHGX3vrclpwlMldsziRV9/QIscR1q6WI3yzqqmlj/GPCaq
	JBVBxzeGe/07/unxEcDzZk3uyvcuVy/D/BA=
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963673f8f.17.1750424903391;
        Fri, 20 Jun 2025 06:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQvIvRiOMOwY6vcPGATBD4+Ygw2boYIIBCDTjikBg4YIpBv3nF1VGt1H//5h9pdOChc4ssw==
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963604f8f.17.1750424902439;
        Fri, 20 Jun 2025 06:08:22 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm2059296f8f.39.2025.06.20.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:21 -0700 (PDT)
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
Subject: [PATCH v6 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Fri, 20 Jun 2025 15:08:06 +0200
Message-ID: <20250620130810.99069-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: zu1h5dWSe9R5-xNEAsjWJ6FLlIvQ0MssqVkigzCvhAA_1750424904
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The content of this version is the same of v5, but rebased on current
linux-tpmdd/next (`git range-diff` on v5 is empty) after the merge
window since tpm-svsm patches were merged with another tree, so we
agreed on postpone this series, see
  https://lore.kernel.org/linux-integrity/aDCb-wkHGoLQ-IGg@kernel.org/

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

Thanks,
Stefano

Changelog
- v5 -> v6
  - rebased on linux-tpmdd/next - commit e271ed52b344 ("Merge tag
    'pm-6.16-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")
- v4 -> v5: https://lore.kernel.org/linux-integrity/20250514134630.137621-1-sgarzare@redhat.com/
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


