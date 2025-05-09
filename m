Return-Path: <linuxppc-dev+bounces-8461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52455AB0DE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 10:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv2vM5JGhz2ySm;
	Fri,  9 May 2025 18:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746781055;
	cv=none; b=dO/RD1rkvfo1a8rERMAiA8KmIxk/u7bMtDd1siAKEiB6izn/QEBQ1LOjNGhT6qacZXEWatPwEIM0NhMjC89YneRCBw+Z38fOUnka7Vvhkz5ETWHqDv4Ers6lDvub6f8uXgrlBFW0EPw9CSAf5H5AsCmwgX14Bo1fpMTFyZJI/jH1V/fuWfl9Xl3XNaa2Pfn2CO3F7eqSoze9ENd5W2T12NeyjzpxLGmRHnFhKc01n7D5yBjLc2ZJtSfudLGZVqE/WeprH21bFfEIqetAeGIke4xr3FkHECuQtkqN1UvxKr0NYTC5sL8OC8N74tAwZxkPOyVQp8sWpBXGrxJzqxfS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746781055; c=relaxed/relaxed;
	bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OwSH6AVbtNsWmRaF2vOC+qjrxIEeK1zQ9OU7ZI/JLBB/eqBTu/ItGeJ5q5gCPufx7iSxfB2WQC9E+zpBSvIhR3iE1pr3zAvMpVq5xVNAKSHkZTi6MsU3TuD4MPBF9waGBoKm1C8W2RfH8OOoRjh1wyQNoTQE2RebIiQk3KoT4FPWJCJO7FV8PX4CumErpIQKESUMR4uvF5Qi81CiXGHkg6+PlArZiSMkLP+eFTN3YnudosmdlwNV3uGiWAmR+OO+hFnz66HZuI+m2An58QMQVS/T/ug6bFF3OtAeyjPrGig62a5hywNkA4USYn90R8m2tYqqrF9buOCVv9KlNkQshg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrilwuXK; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgnXZfT5; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TrilwuXK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LgnXZfT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv2vL2kdXz2ySf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 18:57:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
	b=TrilwuXKv7jOuUGaxANxd+ndeM+VIVL+9PuN8LqgZRxg5eaknkpOZG6lPGL/nDkPtcMC3v
	cFnzxNWUDCR5VygyL5qjqy/ti+WddVk9JOmZLxNSq+UWCUiPxDZXqC4OxlsOczsSBylNtP
	X4rcG9YW22f9HDLD3nXX9TP8pTrGgHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
	b=LgnXZfT5gJKMQ6q8nPDE51DxK5SIM/Pgl8EsuggIbNKvEUezzQeJktzFwihKzFli4gR6cR
	9YpYMOW/Jylp775CDqm7XgUzMGy/FWoPn/yqCaWBmdRE9IqBbbl07sFCntCBpRiZox4EMo
	cJ4xs6qwOXBx7k9rXEpWC3arqCegZZo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-XFgELvDROgSivytkisQtWw-1; Fri, 09 May 2025 04:57:25 -0400
X-MC-Unique: XFgELvDROgSivytkisQtWw-1
X-Mimecast-MFC-AGG-ID: XFgELvDROgSivytkisQtWw_1746781044
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb94dbd01fso225974166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 01:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781044; x=1747385844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
        b=sxfx3LmHzhUpEBAux3unlOlGfSxQsdM1p6e7Tc7RNGN87PGoLxAaLUOxU0eOrYSkU7
         D9h9mvAGUZbDrLA2gUd6dXl4sfJGbcN/23WYoIwvK8sxDrSpoxaE07iuBrum0niA9LYG
         79Arvag58Tt9WA0Ht1VbGPMJcyHQRbWoS0zla+R1meO7Gp5Xd8eUNmU+n/nubaoQeMso
         LztneikcLD7uQYaAQ0V4IDES3RmGxq/l+hz/0RGMKtQFYalG3mJrNVAXGY8BeM4uLy1x
         NQxB3MAQDJOAyJkzg5RHqvUxdTAXW64l43Le/pas4WsyRg/k0ee8u+CHqoubIReKElco
         3Isw==
X-Forwarded-Encrypted: i=1; AJvYcCVP1Ij3fkAj4qdJyeKdUqrTzuXk/HypU0RWacRg5XzkQr9r2PYkL4IBHRlA4f64xrCi8MG3pWhfZEpkD+Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRbwXydBYvpQMdop4nSw4Ua5C3YSpMUPJmSwNd4NPZmdmHVTVG
	TnewnkfKX378/BmQZhy4EnyP/vzPA2cKeEZbHOP9UcthtpU7g+U8+tqQd60fNd4dEgkGqOirI8+
	zpF/srHcV6IIImV+bod2XxARs614MQ4tjlir7t9YfpSPPk/kggFJlh29+0zjrDB4=
X-Gm-Gg: ASbGncs1HmUf8b9i2AG+jJFWJHzCjFgML8zzo5ePZAw89f631wnIybH3KcpDR96AfyO
	3HFGrlT8Vo7BhF0arH97D+1bJ4TtlKrjkx6GIpImIqAJfjEL/bgG2TpqmCBQA0WgNiSpwpqhgGk
	mUQyPjaW+ltQHyGm/cUgGbtHn/tN6hu0N99nXFuM+28rD1z6UtA10OOVir5yhDyddO7fh/QVnM9
	iUNayMwa8I68wFCn+isirbDjBy/W1gQ1FORn2au7qQ8vlWhDlnIuKOIs+/eYahxjAdm8WLYYvBn
	xCk35UgiBpx5ATtnXcN55nhlhg==
X-Received: by 2002:a17:906:6a22:b0:ad1:8d47:f5a1 with SMTP id a640c23a62f3a-ad2187d9ff9mr242886466b.0.1746781043738;
        Fri, 09 May 2025 01:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHDBevO7YDl8KglZ476gaG4KxHzTLxc7mg7e0L2pUNIVoWmz4WZr1HNz4n0w09X6zYeiH0HQ==
X-Received: by 2002:a17:906:6a22:b0:ad1:8d47:f5a1 with SMTP id a640c23a62f3a-ad2187d9ff9mr242882866b.0.1746781042944;
        Fri, 09 May 2025 01:57:22 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc4f240sm1085791a12.33.2025.05.09.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:22 -0700 (PDT)
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
Subject: [PATCH v4 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Fri,  9 May 2025 10:57:09 +0200
Message-ID: <20250509085713.76851-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Tm2Wg1uORqT8Ocg83S9wJDXR91EwKm3pYZlovGKezNw_1746781044
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
- v3 -> v4
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
  tpm: add buf_size parameter in the .send callback
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


