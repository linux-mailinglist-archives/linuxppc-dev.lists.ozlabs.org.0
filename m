Return-Path: <linuxppc-dev+bounces-7650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B0A885F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 16:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbr3z69Tgz2ygD;
	Tue, 15 Apr 2025 00:57:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744642639;
	cv=none; b=R1AQs2c83zvXE2TQNyafhg/I5D+3n0SuAAxLneWQaUwAvPHZCkEDp2uVL9pptjkM3IzPQx0A6nuc9tXDRVwbCoxMNXXoVdbU1d0J+/i6N4k0vpOqrySWFJkRuXSKZ8DLcogaYSdKiW66fibWo6vbijCa4jZ1WEHJ571GOR+HdbFM9dwaTIm9SRwNJisg4SFuiErdCJ2dctGZLqGKLyPQYKLuDyZt5j+CbG6ccc90gXKZb2HKiPu49qrT7rQmpdlfs0cQ6Ju8O65+0lXNEd6FfcNt5H3JPGyTtdi6bEp+EemrAkbvzk1sxvyQIYed392s2gkZsdInvkCjMcBh6olgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744642639; c=relaxed/relaxed;
	bh=+d+A9xPnDumItxIsvftLFslaA2BjML5aFFEu1+C33ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AjPeqxfJifGdHhw39gGDvZFkzwBYE6bQmwsQuOYGqROnFVX0uMi5H+nMHzy/Z73F3bOPcnoJVfcNnXFX32dc5kJDurc4yBoyAZ40nnftduuBokAZRqmM1GAmTsipchr+elr9ZPfEF62bJJupnserifcSgftdrkM3YcEKWkVGUS8vXHmWKjnzR3R6YuaQio3YtHOcVtanWDP/PnewYBjbRmFQtORmn5rPgoZ+JL64LEEFVOmOIFYyMCqk8o8XXDLL6OF4/oLwn2GiElblBFLLqYkWq7NLM3XE02+9dRENCZjk9RHb/AvAJveg8/+SpYW5tDdCeQxxIAA2OjMFk8d9BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4YbErEJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4YbErEJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4YbErEJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z4YbErEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbr3x2LHnz2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 00:57:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+d+A9xPnDumItxIsvftLFslaA2BjML5aFFEu1+C33ys=;
	b=Z4YbErEJIz/+Oy8FQYqt8aeorVSvBtCtPs9YzVAA/oC9UHiRxrsXeqh9tdfNY8JQqmuR0Z
	Jj81wrWO5LkWmK1SQMOnjgYCvACr9w5w0/m9038kWSddVFaWV/LfcDYAMKCRvIU+bT2q4z
	rGF+p+AtOMcaPW4Knoty/+YV4q1a080=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+d+A9xPnDumItxIsvftLFslaA2BjML5aFFEu1+C33ys=;
	b=Z4YbErEJIz/+Oy8FQYqt8aeorVSvBtCtPs9YzVAA/oC9UHiRxrsXeqh9tdfNY8JQqmuR0Z
	Jj81wrWO5LkWmK1SQMOnjgYCvACr9w5w0/m9038kWSddVFaWV/LfcDYAMKCRvIU+bT2q4z
	rGF+p+AtOMcaPW4Knoty/+YV4q1a080=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-TesUSofOPwq6j1NMQzrS4w-1; Mon, 14 Apr 2025 10:57:09 -0400
X-MC-Unique: TesUSofOPwq6j1NMQzrS4w-1
X-Mimecast-MFC-AGG-ID: TesUSofOPwq6j1NMQzrS4w_1744642628
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43efa869b19so31222845e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 07:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642625; x=1745247425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+d+A9xPnDumItxIsvftLFslaA2BjML5aFFEu1+C33ys=;
        b=WnFt8eXPqwVuOFW6kEC12rkgwx25uuexhfgyj5tRj3UCVwcqn9uDcW/mY1LRXo3YcQ
         dgbdqSUv26QWSr9M3LKMuzg2mlCLeyXtytvCFo4C/9qQVmDzkey7Zfd4ER+/s8nbkGg9
         uVmkQE+KljOKFC0xdFTOPRGaikN1kmdFsyvtIxA7ejKNitCtszCpFclFr/IZNQ59Pqr6
         9AOqOJQnjAgDEb8WmpApeyTnJ5RXAoPzIDJ3c3GZCBQKqWVBZkuWmuTBNGAPw/RNDiql
         iXSVz7g1k5O2fvJMtLbjtsdOhMm7t9k2xfvAurxwUJxVKj5xJVtEOm9vAbdRkeA0eVj7
         NyNg==
X-Forwarded-Encrypted: i=1; AJvYcCXqI/QsWQD0wmLmrZVevsltw3qB1ZVRPPbQZ3EzWQrJKj1hbZXqH5Z8MRavk0XT4HeZo6CFoXs3d8pvGys=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlPMS8Ve8P0y/9yjkP9Jlg2LZA3B64rlm+D9zAz1hyUlNgeaC5
	La0W9hVRwD5epV65kLa88Iy6kbStsZMiolFexMUA6gePHqyigql1vZ2QLe8BDh+qkZoy4kH5aZH
	RFRHi+lX0R1om0xmw9vePZ3szA4S13U9m8hZUlLHP2jkonIfn/pJ4DdDZvUlqmdY=
X-Gm-Gg: ASbGnctMGp395OotAye2LNKLq3m02KLjcCtXY7rF/sYOfQOCwTlsEpxGDhsn31cZxJp
	mdSae0If1KpNTzd9XGdevk0sG9Wt93YJz3dnGQCDRUxpfJAE0d49upUhQAvbViI9YyT7lPD9SA4
	S1s+Ccr/ZA+FylqY/x18s+B/S3SaWrwLupC1CxEZeE9QVm9/blj4KcxtTp5+4U9PyONj0pMoSIb
	o+zty4yPv7nbx2Qz42W7fLeih5CbvTM4J1xISv1b5wYbrZFwidniuroXo684qdy6CZs+hERKbKy
	uNaCS/eYCbkH5v/DBTCqE2rG
X-Received: by 2002:a05:600c:22c2:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43f3b03d509mr76635625e9.33.1744642624626;
        Mon, 14 Apr 2025 07:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaMkdcYSAUJ2eyx63ipsqKDXLAd1LJ5VmsOdP0SJV5zp9fL6D9z1Z041hYuBmQxQtg7J3QHg==
X-Received: by 2002:a05:600c:22c2:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43f3b03d509mr76635325e9.33.1744642623752;
        Mon, 14 Apr 2025 07:57:03 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdb5sm11107056f8f.21.2025.04.14.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:02 -0700 (PDT)
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
Subject: [PATCH v3 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Mon, 14 Apr 2025 16:56:49 +0200
Message-ID: <20250414145653.239081-1-sgarzare@redhat.com>
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
X-Mimecast-MFC-PROC-ID: GYaJuugul3EMuRAzsMkWjf_TKjsxqOP3hw6T_2PmOMY_1744642628
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

This series is based on "[PATCH v7 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], which is currently merged in the tip tree and available
in linux-next.

I removed Jens' T-b and Sumit R-b from RFC/v1 since we changed the code a
bit, so I kindly ask if you can test/review again.

Thanks,
Stefano

Changelog
- v2 -> v3
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


base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
prerequisite-patch-id: 48e29a19ad56eeee84beae4a63cc85cd08c0a075
prerequisite-patch-id: 8cc92e82296974db968184fc247f18aead4d8c77
prerequisite-patch-id: 03acc3a4047045daceb4f032d9cff10c220391b2
prerequisite-patch-id: 64d178b0e0c89881ee1e60943094582c5e535339
prerequisite-patch-id: cfd160caa2f6d50a00f3b935130a0a4015c28ac4
prerequisite-patch-id: a68192b2a4717e4aad79a8e412a29c43c0571846
prerequisite-patch-id: 92a4d0a94dd2a96f044424b9f4877e841e81fc7b
prerequisite-patch-id: bb1307f45abcd254c4bb36a51b81ecd6cf706818
prerequisite-patch-id: 74ff289b0f0cf2c3f0fd03cdfd337f0a4534cdad
prerequisite-patch-id: 631a0d7fd62602f5f5713c091c1c3a6bddf82ce6
prerequisite-patch-id: 1afe03bbc505e41951f43175f314c2f1854bc512
prerequisite-patch-id: 536e7f089e1985b7cb0a71566a96127118e9a2be
prerequisite-patch-id: 27ac7f4f06598ef95935dc95df6f72ae889fdfae
prerequisite-patch-id: 2804cc4627b1438c1791b752134955e3fb72396a
prerequisite-patch-id: 5600c1965a81df254fd1756e78edb3c83d5191ce
prerequisite-patch-id: e4d10e0cbe152d54e3b50b3f1704e9842954b32a
prerequisite-patch-id: 9bf54ed16661805c3d5951521a9f9e2b9da9c1ba
prerequisite-patch-id: dcb38a0374449f62a57bfc8bd49a0d54141eadc4
prerequisite-patch-id: 388af3d19621bc4f1955075778a1f5c38e444c35
prerequisite-patch-id: 40478b79e3127b22060a063e840641179c556276
prerequisite-patch-id: ea8fa50df7d89f35dcbe2e8873416a0b77160359
prerequisite-patch-id: 4dcb4355ded1cd0bf473767d64b68ac966810e3e
prerequisite-patch-id: 3f9129ccca19d3e84f7928a485ccf9ee3849f114
prerequisite-patch-id: d253995fd059370b0eac953537bfcd19b237226c
prerequisite-patch-id: 07f3cf6d59401f7c350e19edac328fe0e9e21f73
prerequisite-patch-id: 20fcde90519a72618fa95afa57c18e4a78380074
prerequisite-patch-id: e2fcaca653b4f7bcff0ebefd9af087dd094c31c6
prerequisite-patch-id: cd24191e4391ca405ee89d47e1cc229122e4cd51
prerequisite-patch-id: 3acdc0bfddd361abe8f3cbc86d37516bcd294be2
prerequisite-patch-id: 5012ecf28aefe0884d813df1e3195285558b6c39
prerequisite-patch-id: fa9042017aa035b23a0ae69afb2f1c2592099e25
prerequisite-patch-id: 4e10e85d5aa158adfb14cfdb040c1d7d57ba0076
prerequisite-patch-id: 25caedb74b234f939ee69996fb06cc36d1f30b0a
prerequisite-patch-id: 6f5a109f59222f20174ee4ad665507f5d0830002
prerequisite-patch-id: d2c4773fb7a8a59787af07491edb3b715ec4487c
prerequisite-patch-id: ba6b09ab442829306f65d2422bfd71c7e1cff911
prerequisite-patch-id: b0dc02fbd6f01cd09e1323fdab5a0bd4462c7878
prerequisite-patch-id: 781ddbd1e24c23c4a08fba9c0ca419abbe96ddfd
prerequisite-patch-id: 9c9b2285fc9de8297b1a25a2aa28e9f4d958a0cc
prerequisite-patch-id: 8879bfa65ee3aa21fbd763460aeefb4ea6fa09df
prerequisite-patch-id: 95012f60f454e56a2879677246cc223ff2ab815a
prerequisite-patch-id: ff497d4d7da9c0b215287f91b91df93263db2ed3
prerequisite-patch-id: cefbc82441e708af78adb32163efcf6f0ec52cd2
prerequisite-patch-id: a14777a52216fd3eec4c029c3b604a1d9ec43ad5
prerequisite-patch-id: 77bdc01cc64455bda48a1c474ddfb085297e63a6
prerequisite-patch-id: 8c359855548cd677dfdaa6ceea082765d4eb9598
prerequisite-patch-id: 95c849b9e9a6df687059b428d5a0dca3b990cb3d
prerequisite-patch-id: a57bb2b80806efba023b24c06b8ca4f91f6c5856
prerequisite-patch-id: 1324eaccf65aaa93d1dad4987d3b0d08c3b34b3d
prerequisite-patch-id: b95f1eabced68c9f9dc31057ba7a340376826051
prerequisite-patch-id: 7bbfe6d460e3a1d69687861aef50d831ec547fe1
prerequisite-patch-id: 768f0668074cd7d8bc253a3b0e0616817c6c4ad0
prerequisite-patch-id: 71e0cfc36bec0c450fd5e18c6ca07bc05b18378f
prerequisite-patch-id: 9874848e32c7b62b4618238a2ee27a349a1153a8
prerequisite-patch-id: 05422fa3a7d13ed68ae0497e4d664eff7d379f2f
prerequisite-patch-id: feef599a334a8ec5d07881bb1adb98bf4f38d17b
prerequisite-patch-id: 1ad5db552a21cccc599904e3df46475e50a31434
prerequisite-patch-id: 075d63481dd91c197674e6ca535f23278cf92dec
prerequisite-patch-id: 4349e6733f439bd81f5a32a09dba2b0b41cc50f9
prerequisite-patch-id: fb3046b159bcbed5d71c43923f78db89e2c431c8
prerequisite-patch-id: c18bfc620b30ad48945fc090320c9ea2d5dab10c
prerequisite-patch-id: 251a9738bf4c27ace0a0a87ea9d6cebafbf21bd5
prerequisite-patch-id: b575f184bcb958ab9ce65018378695e01ffdf7a4
prerequisite-patch-id: d321be8d389eea659fdd9c2afa5c81e866410600
prerequisite-patch-id: f77d14934775b03cc39662072166df9fd21cec42
prerequisite-patch-id: 3629ec24f511677fcd69c4a9d32ca379340c526e
prerequisite-patch-id: ea1d192805a07e3d06776f250e6ea1b54fa6562c
prerequisite-patch-id: 8f9d32ea38a6a9049406e58ccb07800c3ccacc24
prerequisite-patch-id: 2314324a88809d18e6a6ccfb5d1d373bbf619b2b
prerequisite-patch-id: 16bc9ec7b85486fd6fb57664cc66f9bc69c9bf6c
prerequisite-patch-id: 114beaa3f58937eebe29c5ef821e6c46e73fe5b2
prerequisite-patch-id: 44e6d0a0436168b0c2b03165dd7fc22fa3cc61b3
prerequisite-patch-id: d5c0463986914dfda45a0549a6a0efb1a960c7e3
prerequisite-patch-id: 361754faf2cdd3f9d1fb1eba2a663c6081d0d555
prerequisite-patch-id: dc0a69bd83ab52a313b46dfac825b877c88188f7
prerequisite-patch-id: 1f4b853c238c61b4636e03b8364d6032374b1bde
prerequisite-patch-id: 6eca2e0760cbb4cf1897b58128a9b3914862068f
prerequisite-patch-id: 00f594312ba1bbc0ea1ac9837af7ac45a85a9621
prerequisite-patch-id: 540c557266289736f0cec6a1aa7effff098bfa83
prerequisite-patch-id: d7a97dd68d39172a783fd634136e3d1c44c8380f
prerequisite-patch-id: 2595cc79a2059560cf8fba607518cc58355ef56c
prerequisite-patch-id: 4906c6abe74de698584c409186b284d4a3663d2a
prerequisite-patch-id: 8c0784078e3f200507881d86b134a62a7b14a1b9
prerequisite-patch-id: 1563f725026210d863cfed118bcbaf1d0c1a5ad9
prerequisite-patch-id: fc42c00244b46c14e36ddc6dff276d1fe0edab69
prerequisite-patch-id: abeb9524aa4b8883b47234814072bb80ae51a62d
prerequisite-patch-id: 1f411cf8e17a2f2581c1a6dddbeb5aca862f45c3
prerequisite-patch-id: 6a481d297a61e552f56bd3827c48a06d706b89ee
prerequisite-patch-id: 8c6014821a4d5141fcc44fbd572da259dee7ea00
prerequisite-patch-id: 8131db356486b05d7554f4ec03f1b86561ffe7a5
prerequisite-patch-id: 5cdd298ca3acd181b45a1c8327b84a122d0e7d13
prerequisite-patch-id: cae1f540f53e0c77dc405b50c19aad159bb0af2c
prerequisite-patch-id: a48183bffa68397fdf52418efb5832790305dc21
prerequisite-patch-id: 065516b74c78a554aa59b9e6ae2685d282421c57
prerequisite-patch-id: 6b91a684e67e62c958b619f0262e382835208288
prerequisite-patch-id: fa246e51e416b19410b9c4c68af60898bd3d63aa
prerequisite-patch-id: a61ae434885934085d1d75ceb1b2b24aa50bb589
prerequisite-patch-id: d23aac5c7ab5fd9c54cb89acf0a198809e5c2803
prerequisite-patch-id: 3bfd0d5753f321afd4c1cd39edddbce8916129bb
prerequisite-patch-id: eaed8adbe854bfc11c65c3163659b763373ea593
prerequisite-patch-id: fdab3496f6e492c5c5397f15aebf82ddd85494e4
prerequisite-patch-id: dba83871a7eeb73a4e3520d5f21d7bc4c0f9ef7f
prerequisite-patch-id: ac02e354caf2c8669c2abfcde2f0ce1d13f31183
prerequisite-patch-id: f4e13fc7219c4bfb3d64705e010874f51d29435c
prerequisite-patch-id: 57013bac19aa043706e4e38a7bc2eccbfb6a4e6c
prerequisite-patch-id: 6586463072db976e5eba81cb52ba71daef167974
prerequisite-patch-id: 961b282ee65f62440658d1f898a265be1125a276
prerequisite-patch-id: 7980a075e4fbe2e1ab8ce74c60e67cb2c16e8971
prerequisite-patch-id: af6dd57e0791f92e27f82476e4c3b05a85a28e14
prerequisite-patch-id: 8956ad86b3465acf7ae71e36a0b4718bf8fecf7d
prerequisite-patch-id: bc123820935e78551a54a4922128e91f051602c0
prerequisite-patch-id: ae91461b101820f67a69c73949654b546633c961
prerequisite-patch-id: 0db76d6cb07634758c5789df460f87649331f265
prerequisite-patch-id: e1ffd7e7d04d812e78e625e76298e965ca72ea5b
prerequisite-patch-id: b9e019d49ce67dc1df48f9c857bdf933a1236090
prerequisite-patch-id: 6131f44c8ef42c63f7a319b3911fb612f3da394a
prerequisite-patch-id: 5f4214c57e87d5365b8fb84cf900d30f36c2c653
prerequisite-patch-id: d8f7264ba1abe0110eb5aa910f6d4ebed4d635db
prerequisite-patch-id: 601a6e4ac470b7696738d8dc8520f1992ababb02
prerequisite-patch-id: 160e60971bfba949fa4735f67eaa37c92d55251b
prerequisite-patch-id: b73d5c6ef4ec14e5e703b402d407f257cf6bd8a3
prerequisite-patch-id: 8998e533bb53fe1bc5c7a6c254bd9f30325c6333
prerequisite-patch-id: 43f9f0b7eed6c2ae5841e3143b3545c5105ee956
prerequisite-patch-id: 522cc3c82ff43ab788fe9f390dc098d0a7f4240f
prerequisite-patch-id: b5cc957e14e2fe6023a7c439e3f51be369c3c84e
prerequisite-patch-id: 9d53c4c18d3e01e900baacd93546e9c8e8c79855
prerequisite-patch-id: 887574436c33a7445894fe2d4d05f562cf2c347e
prerequisite-patch-id: 010b4ed8bfe3e0494a5fdee01d65e4e0a0df94b8
prerequisite-patch-id: eadafbd8531ad002547f992956e1514e0af9b273
prerequisite-patch-id: 619c64fc2224fc9eab1e6a2a31e9c73c8df9d908
prerequisite-patch-id: 66b17036ab105473fa3aeaa89e0a77eb5b7fb7fe
prerequisite-patch-id: d8f769988c8624abcd7771d04e7390768d24c51f
prerequisite-patch-id: 3cb01292f97adccce056c4b85e80f3bae8ac6a99
prerequisite-patch-id: 0e2fbd17711304af596a03d93d448596d863b719
prerequisite-patch-id: c2d51b8b6b3434794a2ec573a6a9b23206be39a9
prerequisite-patch-id: 25cdc229e8ee7006b09eff5dc18a47e5cd031f4a
prerequisite-patch-id: 3e5f728017e1fcdb6a573169cbdcaa25ab281527
prerequisite-patch-id: be0eb183cbbf737f0e72cbeb8737b86dcd49d2d6
prerequisite-patch-id: 4a7c63eadc44907ea456fdee73661d677764fead
prerequisite-patch-id: 6c85378f3caa21b7266568788d134df701711465
prerequisite-patch-id: f3d5ed96d72ee08d904f634f9caa8947e776ff8b
prerequisite-patch-id: c1bd41cf20a169f8eb75faa213334d2a311ec5f8
prerequisite-patch-id: 1e668be9d24829c08dcaecbd2d117792ed576107
prerequisite-patch-id: d9697818dca5ea92d49ba562d86537d6e1add887
prerequisite-patch-id: 8e1aa5bd7d621dfd2954c4fcd0dd79bfc8f88806
prerequisite-patch-id: e6f3413725f0fa62f27de0e19a31073b2194af49
prerequisite-patch-id: d57d0dabc217f8321cf9821fdd321e9f9aa60de6
prerequisite-patch-id: 1862528cc68b6820e345e042afde5b0243fdeff7
prerequisite-patch-id: fdcb4f92d73776bf0c5d139676668db264a259ff
prerequisite-patch-id: 285fb2223a69674cd9098c39ea9cf029a84195b7
prerequisite-patch-id: 33ac18dc21d7d54956e0dcf969799f1bb2ed7a29
prerequisite-patch-id: c5bbb8bd47014c10f674b35ec09025cbf2f287cc
prerequisite-patch-id: d0a1a20bec52ca17c74f1964bc23fa25836b6bb3
prerequisite-patch-id: 512e226b56aa40fac9256cbbe463e673596f6c88
prerequisite-patch-id: 3af2842b52f3c54ce15068db49d21a3adacfe207
prerequisite-patch-id: 898687355630427415420b2507fcbc2163ab357a
prerequisite-patch-id: 3f49ab37d92361ccb1b0ef2ddbf5750b72ab8d00
prerequisite-patch-id: 00f2029e3dd35c356b4ee63edffad520359e32aa
prerequisite-patch-id: 19b718d369e2d3ded9e405a9fc852e3c95a3360b
prerequisite-patch-id: 0303de945e042463c731f288bdb8172dd89355ef
prerequisite-patch-id: 2e8e20e56848af14a1eff79957fed4a53d4f7a09
prerequisite-patch-id: 5cfda6926bb4a3cba0bd5e30cf82bc4c0dfd7a31
prerequisite-patch-id: 346a05753783dbba457f5c2b4e61661a82459047
prerequisite-patch-id: c873f5b87e13e7a69d68e02b51e8a0dfff762c28
prerequisite-patch-id: 01b4a368ad468a9dd52e7b2e0af61f214e5f5cbc
prerequisite-patch-id: 51969e2046f4ec71d3ef554d4f5889854bf1cc0b
prerequisite-patch-id: 1346315200253aae2440966f1ec42bb8c03ad0c5
prerequisite-patch-id: f3e968bd7be8f41c4b73bb4f507bb68d61d52a9f
prerequisite-patch-id: 7fb737a68760a2408c4a7b82a3fc4a583c991919
prerequisite-patch-id: 65a3961090f400266aa8df94b42c0394c6004146
prerequisite-patch-id: 9a03c34458120b8af892a70512f3217e35afcfb0
prerequisite-patch-id: e501a6ab73f3e431931781be0f28faec9000468f
prerequisite-patch-id: eef05b382b94e0bc621fe8fe37fc07e5f8b7e2c8
prerequisite-patch-id: 8e9468626f42ad8a05202d6953a43776b917752b
prerequisite-patch-id: 1bcc56181c67b63cec0795b77b507e41f40aaff0
prerequisite-patch-id: 675f6affe206b14cf09c930a9b972fcf762d6a03
prerequisite-patch-id: 314a91aefe6aa3defd13663e42c98ab90a6914ce
prerequisite-patch-id: c2024660f9023ee38b6e57617e290db6eaa870c7
prerequisite-patch-id: 11919c65ccd3e703030654b8edf803ef11a75ff6
prerequisite-patch-id: ac693c157367b875ab5fdc11008763130eaadc37
prerequisite-patch-id: a20cf2fb61b95df30d80a75f9945ef26834bfd37
prerequisite-patch-id: 5aadb531cc6b7324ff8dd1ed13fcbfb3092d6994
prerequisite-patch-id: 5ff55adb96b0ca8cbab464b62038f4d16f3443d8
prerequisite-patch-id: d9450757d89620cc359cf0cdbedc20b464e9811f
prerequisite-patch-id: 6c7e1b6ad8f9a67a6a8ef73f009589569ccf88f8
prerequisite-patch-id: 5d775f5cb2ddc482a968840df91efd12de9e3b11
prerequisite-patch-id: 1597090f8fcd82476653130af8ec85aa825aeedd
prerequisite-patch-id: 822a1e3517fd7b728d27c3784145ae90f0f21f49
prerequisite-patch-id: 205d30221c41bff81de112e7a97e753ec9f647df
prerequisite-patch-id: 3757888ca797f476837e825db2d179cb69f9f3df
prerequisite-patch-id: 6a2e19bc42d2f393b678e422d5661a3b74bd0b3e
prerequisite-patch-id: 3aeabcd78ba76c49303724079301a1b744c409d9
prerequisite-patch-id: 0facb1efa72bfb597ac20db6149002047a217dbe
prerequisite-patch-id: 4e183096af3f4c3494c04169c287d4f9342f2ba8
prerequisite-patch-id: 1a668b91cbc0fe59a89d048346ee65f3fb15dac6
prerequisite-patch-id: f7d0931eacf1a60363fcc675a664976da4d71906
prerequisite-patch-id: 3ab0082bf18916fa14996a5207156cd102f1daf5
prerequisite-patch-id: b8ff90f417b9aa8475fc92f47501eb2133ac87a5
prerequisite-patch-id: 1583474130679efd0eaba39dcd56496bf3cd812a
prerequisite-patch-id: 46677c83acddbe40541b4eed290709b3e732f6c4
prerequisite-patch-id: c94d6a4791b78f7b758b9059410fe27784ee63be
prerequisite-patch-id: 5d41e4642ebab81752e16d08ced7b7a0f8a19e44
prerequisite-patch-id: 1d63b0d1155ae004f41c6d1beb3bfcc8c15c6cc0
prerequisite-patch-id: cf2dc16031f0f85209f4bd3d3ee77567b2bfaae0
prerequisite-patch-id: 7e1d3e3c78891c80da4970ecda856aea3f2919b3
prerequisite-patch-id: 0c08f90fa55139f9219dc41ae75eecdbb62ca366
prerequisite-patch-id: bdb3192263a48876c1ba496264a345738183051a
prerequisite-patch-id: d2820f490c629c8edbeb5c8ed9060be3c5f94dcd
prerequisite-patch-id: bc49d640fb5c716a175bffef4132b50b2fbde99d
prerequisite-patch-id: 42a21c69e88e590c88ffb53934f713f4ea86ded5
prerequisite-patch-id: 76409f0eccb0c2249d0ca75aad54ae7509ef03b0
prerequisite-patch-id: 4f855c2aa2f802b7a522230335d1cdc999b6e730
prerequisite-patch-id: fe17c6461ad7c2f588bb2750740cf17b19190a12
prerequisite-patch-id: cc06e11c5ac986c88cc0d84e768c3f959f3c01ec
prerequisite-patch-id: f4c6d5a8c1cc5f18e795b2783daee5c267a25772
prerequisite-patch-id: 534414d0feb25fa0b310389740e77d2d96c4a3e9
prerequisite-patch-id: c2c6f40bde51265845c60a8d9b8b1332cbccd24a
prerequisite-patch-id: 078971844a2f3a8b42f8592f6c45619c8f961967
prerequisite-patch-id: cb8af1376a91b025d0bb092d937a5a6396884d68
prerequisite-patch-id: 9413cfd09e33442b5476775a091178459fd10bff
prerequisite-patch-id: 7226a09ca99057d11edb161f2345fe376f628a49
prerequisite-patch-id: 580ffe4cae97e45a44aa3b93763993bf10d00c8d
prerequisite-patch-id: 9f6a7d1cf83dd89f5a9798e3f81354278344e044
prerequisite-patch-id: dd88ab04a3087f12a4a27a6e430c0899bdb160d8
prerequisite-patch-id: 2aeeb855d56e412b1c162cda25cda5af79b5f4db
prerequisite-patch-id: f0ead197130eb492e14e58db819350fbb0241a23
prerequisite-patch-id: 51580ebb5a15d611290fc4b6726aa2a492ccde86
prerequisite-patch-id: c16c8c49117e02ad34559e0afd0d6cb813a64544
prerequisite-patch-id: d029e5655f4e720508224e4f51573036ab134555
prerequisite-patch-id: 77fcef77642efb73a908d9bdc4f332254bfa3440
prerequisite-patch-id: 9662a06170f6f5e08e8f989134b66b162346bf6a
prerequisite-patch-id: 1bb6d0636cca8f15fcd37846a15d0d99fddaac2a
prerequisite-patch-id: 6546552dd5ee6bea532a37fe634631b103f9c241
prerequisite-patch-id: d1985ec3a0eaccf69f0d7df9dace8bf9783610c6
prerequisite-patch-id: 4e204f14b3f87660e82b1b7ab19f264869e31168
prerequisite-patch-id: d711bbac94521c3e21b82049fc7cb4693c36ccbd
prerequisite-patch-id: f27d3f873512f5b5b14101561cd473b22341f32e
prerequisite-patch-id: 43ec28665264a4fc46a53c9fdca184d4b484bfe2
prerequisite-patch-id: 8106eec33a9d46acbf4e875d44370c71a34aca29
prerequisite-patch-id: fa1a46701e7853503ff663d430bf389582e736d9
prerequisite-patch-id: a9c38a3b24a27c5dc1a2b682be3ed54e848192a2
prerequisite-patch-id: 0724d2d4d4be7026fbf6df69bf02d7e836834537
prerequisite-patch-id: cdc538039b6309458e357220fc56264be7028ef1
prerequisite-patch-id: 64cb53561069d81152778cd08bf8418efa50cb3e
prerequisite-patch-id: 433d54020a469c215e532224e20680683cb9bec0
prerequisite-patch-id: 835ff420f4c435b76ecaddea0bfe6d806f8dade6
prerequisite-patch-id: 31ae992b3beb76aedcb54c608e245786c3fe788e
prerequisite-patch-id: 06845dfc3bff6259d999b50ae5bc215078f66022
prerequisite-patch-id: 4e188ecd16e65cba310f9530daca66e6d5a4f04f
prerequisite-patch-id: 6d411a87a7486db5ebf830fa2daad3e834d7f9b7
prerequisite-patch-id: bb78caa08c17e22059a522debcaa787801484c90
prerequisite-patch-id: 555fc5514018c0f95d682c30fb42d7e4cd4ceecc
prerequisite-patch-id: a2851439082c7c7314b16a1ed1b48ea79b8a9a46
prerequisite-patch-id: 9ae203d016a1f74fa8222d35bd800b47e6984c13
prerequisite-patch-id: 31c314a1f51e3422ab9a679a9648dd3795df6303
prerequisite-patch-id: cc44599d60f040c160d99c73bef64c522a907f81
prerequisite-patch-id: f89fd74a4977f8c7cf25dde33b3b8b2ca2651535
prerequisite-patch-id: b7485526ae037a5c94e1697e4415c608f7eb1083
prerequisite-patch-id: 04a37ef8acdde0b9d6b9649d82d51cd077cd90b6
prerequisite-patch-id: 3a3939674fe69e152a494cd4263e4dcf45a2d07f
prerequisite-patch-id: aea6274fc93e0fc64c4c8268ea7fc359345de054
prerequisite-patch-id: d0b92b9a3909819a12e5c5bc5c02f3df96703521
prerequisite-patch-id: 84febccd687b24d80e3a95c9bb8acb39a53a1b9b
prerequisite-patch-id: 37788424b315d9268258043bc230d87711294d8c
prerequisite-patch-id: ac5b638fb99599e5c789692e4d76aa8817243c73
prerequisite-patch-id: 043a3c36407f35911ba3833ca0f4f75e17e3c3fd
prerequisite-patch-id: 781c16849a8b92765c6559cc7da91afe19760ba1
prerequisite-patch-id: b268fb07c34975b3cc7820fff09cd004b6ef873e
prerequisite-patch-id: 5d394c1f567bb655968db8f50d1c8c28e07046c8
prerequisite-patch-id: 0662665f117a1079c6f818cc33e5f43ef8f6171a
prerequisite-patch-id: 025446c9647b1e411155ccc0c69594c28f2b655a
prerequisite-patch-id: 2a9bba6799b1d90341e501a985a0fb35a65ee49c
prerequisite-patch-id: dba32b041963b4df4525bf8892d79e4c67ddce43
prerequisite-patch-id: fcd93a2a24c157211af53f4869114ac3557529a6
prerequisite-patch-id: 814c4e8d37b9f6eb8f1df0d5b5d12f93fecf10a4
prerequisite-patch-id: 580eec01ced9bd1b303bd1cee90c82caec49875f
prerequisite-patch-id: 7b29900c973a31c06d6d4bad131597ff105d67ff
prerequisite-patch-id: 2258f190fa8da719c3826fd4feb7881b9c51122e
prerequisite-patch-id: 19585fa8f3c76b07f8e6f991082ae4112c2f0fa0
prerequisite-patch-id: 19c6a8068c8872d024919755c235a97972e40767
prerequisite-patch-id: f19027cfaf6d87af8d4db71f78763aa73ee43a7b
prerequisite-patch-id: 7ff648b883dfbe96989b8560ff1628865f09ecb3
prerequisite-patch-id: fe3eb6e00299a9fe8a5052ca4623a8c4fe9efd7c
prerequisite-patch-id: 1aca6ecc30fa71003e12674ebbe53f949821ad03
prerequisite-patch-id: d7cd48e68290eeefa31cac49aadcea2a21b18b00
prerequisite-patch-id: cc6708dffcd2c79ed9dba330ce0e68bb39e4dd4c
prerequisite-patch-id: 20faecde7b6d1ef75e00cb8b9f832c8778318490
prerequisite-patch-id: b937c18f6a83d51a99227ee9ebbbaefbf3825942
prerequisite-patch-id: 987be7cff81d3355185c6066a48ef681bcdb3fef
prerequisite-patch-id: af9d3bdc5b455a4084e8648d835cc09262adc242
prerequisite-patch-id: e7c40e017557e114c2d040880161335eb1f81dcf
prerequisite-patch-id: fe7608cbf9d4971978471af71faddfab7c9b2bad
prerequisite-patch-id: 4327e274e96dd75fcadcaa5261d72f9436bcb86a
prerequisite-patch-id: 09a6db88a5c669765c2c3008b7788a4298c0a223
prerequisite-patch-id: de68d43005afece9d8af8dca848556ca3d48f7d8
prerequisite-patch-id: 68ef61527731d36e16ccf03c35a53ce824f8a73a
prerequisite-patch-id: 6e665c602a815f36d508a3c57665aaaee41b419f
prerequisite-patch-id: e7e1c9040ca1780798960497e326053d41a3d7e7
prerequisite-patch-id: 9c66d39b8da7b0471486441497104e3b06744b85
prerequisite-patch-id: 25f5d9b683d30a096c11af6a014cab601556f51e
prerequisite-patch-id: d95d4985c59c920da330d133e6c106279e919753
prerequisite-patch-id: e625063ca2fde2ba7d8a665b30a98c1f30adf8a2
prerequisite-patch-id: ec3cd10eb8adf13521d7a2a9f20b78550198c5a4
prerequisite-patch-id: 13026df45f69906b6e7a5a9e8853f28d764ef468
prerequisite-patch-id: d70b9fdb87f439c826054643d291d488af43f893
prerequisite-patch-id: 95b308b38a56a313807f191cccd859f4d75930a4
prerequisite-patch-id: 04db2dc5f277a500e36f169019cf7c4a6f44748f
prerequisite-patch-id: 7d501909cb55a3d55d975088dc926811aa68a74a
prerequisite-patch-id: ef7fa3a2b201b17bcaf32a6f15b77b88b427cfb6
prerequisite-patch-id: d1a5fe0f9c1048e03782abd4d192b44947874f63
prerequisite-patch-id: 00ee8825db16ddf0eec5dd86c4bce715d295cb1b
prerequisite-patch-id: b33d1b84e598c5f2044027e6efcfd0a3771c541a
prerequisite-patch-id: 32a608d0e7fde771246ff1f0ef9f43a18265a357
prerequisite-patch-id: 52a5d167580f701f9c1bcffae498b9c6fab0a865
prerequisite-patch-id: e0f63229d2f85c448cf9a82eda66cf026fbf1af3
prerequisite-patch-id: 6e799fae8bc16550bf731f457a71478826d02d5b
prerequisite-patch-id: de4538bc7146958b232c8c9ed9d19c4e1fffe1cd
prerequisite-patch-id: bdb8773624821540f3b8356a2a4e791cbcdac292
prerequisite-patch-id: 59821b06cfcb7df8a6fc3f93c7cf54d87bb340bc
prerequisite-patch-id: db38eb3b6d1f12f1bd57317aa036b5abfd106fef
prerequisite-patch-id: 5cdd4a4dea3e81f118e69cc64b6f786ecc567387
prerequisite-patch-id: 2de452a0b50a742fba2019e975297c4163c7832d
prerequisite-patch-id: d0b341309b3b36ac3ed872906dc0bf340205c321
prerequisite-patch-id: a9bc0409eea4d5f0f057e0093f6cbea2234da738
prerequisite-patch-id: 5624b3080bc0cfa8233f2dddba91985f9a8c22ee
prerequisite-patch-id: 9991855ef8386f57b46934f23b97bbefa0b51fa4
prerequisite-patch-id: faf2bb05d9c23812e1a826c89c86b0d08736cb11
prerequisite-patch-id: 8f5fcc16227f98340f7ef8ac2cd3f9e508982d8c
prerequisite-patch-id: 04b0aaffe497dd5e29c291c9441fe514246cab9a
prerequisite-patch-id: 2e835c5e10f786353d69d59574d06ba300c491ba
prerequisite-patch-id: 77f379883b4cbbc857508dbbc58a014cec9457f5
prerequisite-patch-id: 2349691f19ba8c1a1e16e17a82c0a9bd770a664b
prerequisite-patch-id: 7cefa3e3b9d52ee33c9ea9688124b335707bd0bf
prerequisite-patch-id: dc659754f66aa70e4a3894356aa923c81aa1f4d1
prerequisite-patch-id: 10cdeaee6770fbf7e268f6b0422066af6ee1493e
prerequisite-patch-id: ef57312e28e5b6c3504f59c3e14577e76349c3c1
prerequisite-patch-id: f0e04b8a0a876deb4d4c2c5570fa48a06acc0b1f
prerequisite-patch-id: 4ad8a4a46841b4fc89ceccc961387829de248701
prerequisite-patch-id: 392abde168d41dadfd34e0b684d72fdf84f861a2
prerequisite-patch-id: 894036d479eb2bb49e8ef8872b88317322f57b50
prerequisite-patch-id: 653541ecadf879c56db15e6519a75a090a892de7
prerequisite-patch-id: 1f1bffc20a089ed65b19b4de5badeaf02a62a848
prerequisite-patch-id: 0c1b8e73b88d001a7ebf828d9cf05d052b9ce3e5
prerequisite-patch-id: 15397acfc8f7c7d388db86088fcaee0f06b810d8
prerequisite-patch-id: c53c91a6c4b630eabb934148bf7371a2127aec3f
prerequisite-patch-id: 6daee6638cada5a4a1be7459c0bdc0c42a107260
prerequisite-patch-id: a7078825493c895eab55b3d8844c9f64f0bd8e31
prerequisite-patch-id: 354566c5682d0516eeaa53b1ea1f38c9b60648b8
prerequisite-patch-id: 8880acfdab85002436577e13dea78d22b4f4d8c9
prerequisite-patch-id: 5245352604de6d251b76f198a27cf3a78a9f36bd
prerequisite-patch-id: 5232524e9e718b101b00438c7c7e1743dd0b63d6
prerequisite-patch-id: 3e39e82ff59dcf913a25075eb021c5a01fabfc25
prerequisite-patch-id: f367705794360e8c4cbba8b73fdc8c1de8ca93b1
prerequisite-patch-id: 553bb56d945454281feeaebe0ce3b91a4e4a479c
prerequisite-patch-id: 5f31d1193904d4736d317133ff1ced4016fe8c61
prerequisite-patch-id: f503c333a1cdf5185498aa6a62dae1b722eb9458
prerequisite-patch-id: b9ea55cc36da257ea2fdc3e51c28451e9f64503c
prerequisite-patch-id: 5ed6b12659bd930c7b693450686511a7b7a3412b
prerequisite-patch-id: 2aad86042bdcd31b9bf209788f6da050406fc743
prerequisite-patch-id: 93ec8ced501b754bff2725f75f64ab81c46a33d8
prerequisite-patch-id: 7e1505533bcb781ef5e272a187192471b3b0dfe5
prerequisite-patch-id: e80a11923b3462953535f4658541268dd74bed89
prerequisite-patch-id: f3e360bb120bbd8ac04b738658149e7255c84bbe
prerequisite-patch-id: 26fb9e5e72f5c3dc4bcc7c0208debcdfb98b6484
prerequisite-patch-id: 2b92ad025fac70054f5d81a31d3f80f17d4bb681
prerequisite-patch-id: 8b6b32b9f5fff07df8f28395b97793887999b0b4
prerequisite-patch-id: 5d930baaa78d7a7b2979e3d32ff2606565fcd406
prerequisite-patch-id: 5f31d1193904d4736d317133ff1ced4016fe8c61
prerequisite-patch-id: 076a4cdbacf46e7eef8ac4e10b49c2b5ec41c108
prerequisite-patch-id: 6be6465188024860a28e274a4b57bd7dd4ba6882
prerequisite-patch-id: c98d7f99792d83e05241c787d2427f9082e875d4
prerequisite-patch-id: 7ca2c74901ed979967bca22a395a8b620130f299
prerequisite-patch-id: f86c7da9cd2b55de79882cec726e5a13aafcffd6
prerequisite-patch-id: a64b75cdea553ee7d84f9d6fe14f265d4b1ab284
prerequisite-patch-id: 3be77661d48f6d7d60daaeffd059759fce8e9db0
prerequisite-patch-id: 3ca79ccc6878ca2834188f5d749d8426afe5ded2
prerequisite-patch-id: ffbf5a4fef5d712edf3941c5bd8c0f5953c262bd
prerequisite-patch-id: dc5bc545f78f7e66f7a0cfe40c8f1914d38570f0
prerequisite-patch-id: 2455c57bff20ba1505a759ab843c9643246dcfb3
prerequisite-patch-id: 6cdd442208a6102a16a411eac70293301d64d01a
prerequisite-patch-id: a5c249ec5d1b2148222f38c14fd94ab7c639547b
prerequisite-patch-id: 2f475f7089a4a1a277763a7ef4d213960330a8d1
prerequisite-patch-id: 9c382915a710abfc605d72a1e0f62eed6a418540
prerequisite-patch-id: 0d0d55718a2a8ab6242b25b36d1c1f15f29aa395
prerequisite-patch-id: b408a7d94e5cd81c44285f49446c88af193ae436
prerequisite-patch-id: 158bb04d8fe59020b8fcbce26055e7b534a75bdd
prerequisite-patch-id: 56b4cf6b126269ac5f5a14de66a671b14112ad35
prerequisite-patch-id: 28a0c8e2e1ea94844d44c7b92e3efb131ea5a177
prerequisite-patch-id: 05c21db7de5575fe872f75d08b71e3e25a3430a6
prerequisite-patch-id: 917c3aefe45eea3c3d98a0c1ed809d71d0a9c659
prerequisite-patch-id: 13d8363a3f7127fe3bbd026cb633f574f28c29f9
prerequisite-patch-id: a5b3a7f9e48204c4b457ac4072a628d9399b6d90
prerequisite-patch-id: bf6962047e0042b12f273eec51429f9bd54c8085
prerequisite-patch-id: 09d3a8d57020daa99323bab5358898c88a2d0230
prerequisite-patch-id: 25736dec3f108f4ad7f25be3bc987a726bdf5b94
prerequisite-patch-id: 5e427d87d2a3df573ac61f78125b9dc9c2fd11ce
prerequisite-patch-id: 5fbe7fa0b92d78679a040d01a34e6db3a4e98ade
prerequisite-patch-id: 546e9704f889c1908092fc08fa39da73ac7a5834
prerequisite-patch-id: d1dc5494e12a0575c6ace6148b6962a13db9edf1
prerequisite-patch-id: d6c08ecb9ff923b15cafb3f3fbd37b19d9354345
prerequisite-patch-id: bdc0fe6a226f4f0c6cbc977fba5f90590cd9674c
prerequisite-patch-id: 1c5d1581d5f02f86060b3ce7e5c93c95803ed7bb
prerequisite-patch-id: 60037029061dfb0ef952b7051a0eccc9e8d6fb60
prerequisite-patch-id: b0948f6fb5c5117e22a7c9dfc74bf80d49c25986
prerequisite-patch-id: d40f2b9034116a2eb42aaeff8eb6aa4bfdb55cec
prerequisite-patch-id: 9c34c8aa6e10c01c369e7b9f559f9118ab753513
prerequisite-patch-id: a3bfcd27739dfe55b0b08bfab56e7d3b70c950a6
prerequisite-patch-id: 2978c5d65aca3f569ce7afc65f9b5fad2d2a47f5
prerequisite-patch-id: c94f66d628616777bcc9db14cb953545c8ef2625
prerequisite-patch-id: 44360f96808c51281f140cf2965ceff84f57e8e8
prerequisite-patch-id: efd61a2b80d42c00209506298a197550f024e7bb
prerequisite-patch-id: c2f9651b9c6049a6f44b9066a8f1ad2f67a0958f
prerequisite-patch-id: 952ec63bb9d0c7a79f87d9e47386eb87e2a0075c
prerequisite-patch-id: 6e4d765fc9f3ca7bd204b9b461f64adcafb815c0
prerequisite-patch-id: bf32190799d208ecee6e241204278ebd5835270e
prerequisite-patch-id: bb305aaedfe8c51a577a4995259b03dbc918e22f
prerequisite-patch-id: eb1229d4197f039b92d70be16d5a64d8eb4a628b
prerequisite-patch-id: d251227642e83b006e24f5286b010b0fd1979e9c
prerequisite-patch-id: 3b1de138d67a597efbeb89e7ae1e7724c22df9d8
prerequisite-patch-id: c122b363cb5948018617661228e6cdee3dc3d07f
prerequisite-patch-id: df351deaa27ea8ede8046616a58a8449e8210843
prerequisite-patch-id: 8240c72ecb37d1aa79d583b492255624b36e88bd
prerequisite-patch-id: c73ac68a98701c078867049f8e5d68ba7f309a6b
prerequisite-patch-id: 31bfa6eb7a3684460f0ee5e839b639fecaa2b82f
prerequisite-patch-id: 7262b54cbbaa1c3df0204ae47ff8c11dc953d0b6
prerequisite-patch-id: 5473dfb75cbfd7b16aaf82c992181e9bbda2140e
prerequisite-patch-id: 9827945e4c6db407d9a5891d1a02212c0a59ed6d
prerequisite-patch-id: d15c7d8ab4ef11ab2836ed5154db9481c5a81599
prerequisite-patch-id: ab44cee747e7413fbe16c34fd64b8c32bfc476f1
prerequisite-patch-id: 397c74b3dddc4f0ae2bac96fa16532b182d373eb
prerequisite-patch-id: 10401cd0faa9ed6779165eda4bf46324b10529bb
prerequisite-patch-id: 9f6a340d89e3cd3c13aea44e5f3f621ceea48ac5
prerequisite-patch-id: a3ffceb236f7075a59be1d89943ba3dba59ce56a
prerequisite-patch-id: 9c4ed3060d3946fcba68db920d6cff3c1d65862b
prerequisite-patch-id: acd4ef3af55bd9a12122a508445a123759de0b31
prerequisite-patch-id: cd931c3d32a51b0e8f53bb4fba308dffdb9bc20a
prerequisite-patch-id: e4eb45f3ad5540653c42a3423b80b82a3ce66e25
prerequisite-patch-id: 93d5970f28e627e4ed05c68b1197e882c348e6c1
prerequisite-patch-id: 3939a46ed4aeaf63ac9064185f477301a198a21f
prerequisite-patch-id: 2581e3ca40b4746107aceb16c090b7e87f5f7e70
prerequisite-patch-id: 39a5ebeedfaede83de43faca36f33a9e5fa64595
prerequisite-patch-id: d78d233b014b1f94d83cf4e8f153fbb215b4b12e
prerequisite-patch-id: 8d255943da837695aa32eb7bee6131af3daa59b6
prerequisite-patch-id: 5c49148f7788ae1fdd69aa6769e1d497211140e7
prerequisite-patch-id: 9655efb3d5b5600ba09496fb43981b8f53975f67
prerequisite-patch-id: 02a8cce4fc3df03206fecafcfbbd9d9e8392bd6d
prerequisite-patch-id: 7380cd21079e97fef6ae698a091adfd340d53960
prerequisite-patch-id: 884926fbdf3af232237294ed0e77db1f32d3c491
prerequisite-patch-id: 328096fd087d41bb10013b65bc672ba8f8f9a974
prerequisite-patch-id: 92fe6316fcd2dbd11d1c58d926a1e3096f3bbd84
prerequisite-patch-id: b801c9fb879e8e08a97d45125f85274860803663
prerequisite-patch-id: 5c77e5c47924e8e4194e49c59b3229d05696ef7b
prerequisite-patch-id: d3a511abdfc96d93a1b70e7527b499b057c7328d
prerequisite-patch-id: ea7578cc92b33c35b3c02d5f5c14ad8da056b1b0
prerequisite-patch-id: 1acf66f003d669b38047b4d66ea573d053bec727
prerequisite-patch-id: 0d586ffb362de2b3f2a03e2d652fdcf5a9107632
prerequisite-patch-id: 1baf60f3366d97467b927f68deabbddbbf627789
prerequisite-patch-id: 355db461423b7e200da6149c65975d381e070841
prerequisite-patch-id: 049cab95db6d28fb0bb463e88704e50d30f90785
prerequisite-patch-id: 67a8625298c28b042375b020e59dc4de7d058789
prerequisite-patch-id: 11d4e3a1342d1939948efe6c17dc47394921ac7c
prerequisite-patch-id: 67526aac46cebe9a2e5f9ad2091f5ac1b28a232a
prerequisite-patch-id: 47ecd4cb6a950413e9e20548cb5f624606b698f1
prerequisite-patch-id: f618e81c5c372c384a04980c9fbb72f68299f10f
prerequisite-patch-id: 90aada7de1404e0e2e38dcc6d7e11d4debdcf55c
prerequisite-patch-id: cff5b552285225491d9e4cce0438d1c59659be44
prerequisite-patch-id: 80030bca0ffd1061f5303db19c18e7936524678e
prerequisite-patch-id: cbbbb4fcb3bf5f0755dd527dca998d41862ab667
prerequisite-patch-id: 83c4d7d0d3f94e3efe19df6b9317f61fbd806482
prerequisite-patch-id: d6a1841ac44d1f43ee8f955f1b1a0baba0b89abe
prerequisite-patch-id: b17abb285937ead53503582e119ea1cd28fea06e
prerequisite-patch-id: 6b5e81a25b56a30fdf7bc7d35232128c477aa423
prerequisite-patch-id: 5452725ba76db6468bd536b694a2273c396a9339
prerequisite-patch-id: 91b6e70d9f76c1cf55c344b4cce7b56edb27b112
prerequisite-patch-id: 6f02933ad7b0a5b2ba2e36402733da6bad191f86
prerequisite-patch-id: d42e7f5da96f8134285119082460af8081ff419e
prerequisite-patch-id: fc094e96551d6d51b683ffe642b697f0d88fb592
prerequisite-patch-id: 376207b260b296d017eb5c6f4d62a744c1e739b4
prerequisite-patch-id: 3f9e41f986732aeef89649b40cb3cc9f393fbe38
prerequisite-patch-id: 4f05a2c91ef7c7a2d5b97e607ea948221c2483b3
prerequisite-patch-id: 740c290baab3f62eefebacbc3794929782f9f98d
prerequisite-patch-id: c4372a3a7b2e567ce62afd799988e7fd7c1191a4
prerequisite-patch-id: 7acfb86bc817cb08f9546ac9987ad6970410f84f
prerequisite-patch-id: e6d64316b74d23023cc44b5f821b547b281d9b80
prerequisite-patch-id: b0c0109c2d616e7966cae6279eade7ee1f8ca1b0
prerequisite-patch-id: ff811833e2d71a2d16e2b9ff36b793f41aca92f1
prerequisite-patch-id: 735b2926c76be4f424b5673e6a205a7cf3df02ca
prerequisite-patch-id: a9647ae43c59a0a6e4d5303e7eb7374b7ca0bc11
prerequisite-patch-id: 102515869a1abe93c316879a7fda3db2ea1c8322
prerequisite-patch-id: b0f2bf04101c0f363aaed7f9899760e4aaa93073
prerequisite-patch-id: c46fb926702b64edfb78540304f5bc8f087b76f9
prerequisite-patch-id: 558c555b03addfaef19547edf996ca910fff1779
prerequisite-patch-id: 673100e93b6179bdbe92aaa112636772bc4c5ef7
prerequisite-patch-id: 704121882b6dd3cd9c3ea0e88d5df7b2a39022fb
prerequisite-patch-id: 32adb30a0381a15bf3b6d2faf6c72d8ef725abd5
prerequisite-patch-id: 9a2b8b7e5a699682cc6da9a48605a6c936ecad02
prerequisite-patch-id: 4aefbc9bf3db9b43bb32228ed6370214c452401c
prerequisite-patch-id: 884249efab7e876c89fae807b9b3c6680edf90e8
prerequisite-patch-id: 9137e3b5203f3c54b74f08dbdd13a7f2bdb563ce
prerequisite-patch-id: 20d54ade387728f6b91d91e3ef8343bc2bdf1e8d
prerequisite-patch-id: 043d4ef279876772e8483562c52ea1e0133a214c
prerequisite-patch-id: 2c6ffa80dc53f394e7db28efcb9003e51795a742
prerequisite-patch-id: ce2b9e56d09513737c7710a8864e2fbfd46e2b4e
prerequisite-patch-id: 68a49e5e2d5640f4dc0e8f8467600d472668461e
prerequisite-patch-id: 2a3bcf6953eacf189c2ccbff435750fcc892d0a9
prerequisite-patch-id: 2a4b0a0f637c121913d6d394e34bd87c0dac0f03
prerequisite-patch-id: 441370ad239673bcc8db035a3540217771fd88a2
prerequisite-patch-id: dd3cee09cd064cf5baf92b71679088ec86791fee
prerequisite-patch-id: 1b5e5d71fda57fb2f69fa49086a1124ad6a7b5ae
prerequisite-patch-id: a2e5da0d60b1601a6c07f1d8d2fda48878d017e3
prerequisite-patch-id: 9905c99e0924ed10e683ef6c147e8f61a35ac66d
prerequisite-patch-id: 14bb58173d6f7e2e7fec6a52b89694e9a3646103
prerequisite-patch-id: 3c7a7554cffe3d2bceed3f0ac84859c6c1b0d32c
prerequisite-patch-id: f811c88f361e84f3a0cedc0ee5d9ce8358f8fa4b
prerequisite-patch-id: 8dfe670f2915a9178f0db41b5045dd9c0939d059
prerequisite-patch-id: 9a818d4a0231d8235498798374eeb8c0db700655
prerequisite-patch-id: 206f34812daa744e42e18c57c1fcfe55552463cf
prerequisite-patch-id: 0fd38dc3ba170bd1b4bb9ae61e9394026c0310f5
prerequisite-patch-id: a2baca11e0ec1a6b8d6b8456c11fb04cc15b1f52
prerequisite-patch-id: 8f152810a27805843756e14ccc54548df2f23972
prerequisite-patch-id: cd0ca51312a62908695d57dffece1aa31155df02
prerequisite-patch-id: 2c552119b37a644b090dbb0f2e892241fdb75c62
prerequisite-patch-id: f42b59e379dcf0515adcf5e12912a40a93178090
prerequisite-patch-id: 57291c3bdfe0446a40e2b2805d742f9f81a9cd76
prerequisite-patch-id: 15ccc498ae312ca54d03fe0735ada8d605f1001c
prerequisite-patch-id: 864b527790d68cb157360cec27e4601faba0a77e
prerequisite-patch-id: d2bedfa57e4f05b8eacc053be278ebf8e5cda8ea
prerequisite-patch-id: d0f366f27347f0d498bde37e923f7184d56b751f
prerequisite-patch-id: 6417cefee95169baf679ab71d147608578af9bf5
prerequisite-patch-id: a913094c1e024ed129d88f26f181dd745f22e2dd
prerequisite-patch-id: 9283d26e77fdc24efc1a27f11e8aaaf35acc06f7
prerequisite-patch-id: a03473bb2ba0773f853b8e4c6ac082c80a2a62c2
prerequisite-patch-id: be038ac363771570ad77003289ed167d9d5077a1
prerequisite-patch-id: 3dcbad90861f6861fd00b7dea39999bdde7f1248
prerequisite-patch-id: 2a8d4ebe8fdd57731c48b2e73938d962340ab668
prerequisite-patch-id: 6791aecc585a73385c725a1a0e7143468ced5d3a
prerequisite-patch-id: 7c363fdf83a8af5c4a1ed80ee837d65a25e40973
prerequisite-patch-id: 03fdcf06ba5b76eb13653aa674df2250f8d49638
prerequisite-patch-id: 9240ae46d2503035ed3f4cbc1367683eece362af
prerequisite-patch-id: e25a357c163e513e5010e60c0e4560f1ec04613b
prerequisite-patch-id: a72b98a2e11039a3d6076149465205b21e28bb69
prerequisite-patch-id: 1257995408cec53d75ebdfccabfa5bf6f2ea335b
prerequisite-patch-id: 705dfe3c9162322cbe1ea943eb829426657c315b
prerequisite-patch-id: 25adcda1065e111217bc01d1f625d0e7cc221d0b
prerequisite-patch-id: 65ca952a97371fbe689dfd27371dbb2f83f9409c
prerequisite-patch-id: 8736f76952a0168a31c87826cd25a553078441fd
prerequisite-patch-id: c8885464108b46f6b9a7c0fe098cf80b0a93921d
prerequisite-patch-id: 3c928745bb8c13a8c26a4983f3efe736cc29464b
prerequisite-patch-id: 3f82224b719969af06af0238723eb09b401a6dec
prerequisite-patch-id: 92761fdeb75a5d3874e9f027716afaeda58b896c
prerequisite-patch-id: 00b4087fa0740541f9464f69a426cf1eb1cc19fc
prerequisite-patch-id: 0fa74b0220f647ec1668e3e4149af44b9a72079e
prerequisite-patch-id: ae12b5095bece9427483c65c392c8148ca8101d9
prerequisite-patch-id: b900d91a808b9f5ee1d3a69c2703c773f3ba3d09
prerequisite-patch-id: 3a706a92358f71e6880793db79f295b384608eae
prerequisite-patch-id: 089c23781bc69362715ab1c70a4548f6a92dfc66
prerequisite-patch-id: 40830bd6d3581f172efa88e14b06d10df5276ce8
prerequisite-patch-id: 0d34cba5d532420375b3b19b8c7749b771f4a16d
prerequisite-patch-id: b7089ce228506cd6becd28ca7175a8b38a0ae9f8
prerequisite-patch-id: 6e4daecdd04a6d783b09e410d8e36a89ccc51ca5
prerequisite-patch-id: 960787b8e958721e2a0afe12946aaf0e80840a6e
prerequisite-patch-id: 36b8cc6e37b197879ea08d29fa63024c79cb7b10
prerequisite-patch-id: 8e7e70b00131025c36b8aeff71ea4d43334f6edd
prerequisite-patch-id: e611363c15f5bc31850cc43585b2a6ecd58075c9
prerequisite-patch-id: 84c88a9fddf9f5015a318c7537ad4d7f4012e691
prerequisite-patch-id: bf914fe35c82b7a75b01c1bd19dd25fdb6ea2407
prerequisite-patch-id: eb5836aca404328bba51dd85abeadf07674e5c2c
prerequisite-patch-id: 7e9e67adcba81042e7fb9de2d42211004ef83f20
prerequisite-patch-id: 61bafa5d7c0c831362c0356804919baf2168aa60
prerequisite-patch-id: 773cc11e9dde346eb146d78ee33c881384fde94b
prerequisite-patch-id: 1b2924abbb9ded3a6e6bebe085f9fb0fda88ab73
prerequisite-patch-id: 27165c916ba1953637ee1d5746b8c1220394a685
prerequisite-patch-id: d58f1d823d59e540ebec8652d504a065ec76c370
prerequisite-patch-id: 080f590b772a69162c3c182e03b1e00483e7e446
prerequisite-patch-id: 2559e41b8237c5ab7d9ec0e7bca6c3c3829460fc
prerequisite-patch-id: a483cdb9886dcc54ef71529f5ee16c6e21faf2c8
prerequisite-patch-id: 8f5d681e211ad1a52d603bc2af202a6eb19babc0
prerequisite-patch-id: 6c27597fca262f7021b22586ffe9958fc44bee57
prerequisite-patch-id: 25872628f7d7b65307450ef011acfe83348157e9
prerequisite-patch-id: 626a8744a4f51c8cf35a47bdcb22a6087683b674
prerequisite-patch-id: b79ea48494bf456d1ac333c43476a58483f8a7bc
prerequisite-patch-id: 01f2f229092b18c24d4e7c6d8efb4df238b02700
prerequisite-patch-id: 8392962ca99c135bc15ad50012a1dd5f14da491e
prerequisite-patch-id: d10e5ba697dbd748f72f3a3bc28653558221b55a
prerequisite-patch-id: e671d61da9fc845060bfefa4f03a35ebb6b13ac9
prerequisite-patch-id: 06950ae70158b996adb02078f80682aca072eb16
prerequisite-patch-id: 27e6c23d774f51cb8fce9b3e8b5c61c2c43b2416
prerequisite-patch-id: 4cb3097f49b6f5220bef1e06a07947a6c7c15acd
prerequisite-patch-id: c45d39c658a536e4afb3086b7006d5173a690d6c
prerequisite-patch-id: 68b217e0e6e7abe029b98733b0786913ffa6ad6c
prerequisite-patch-id: 056397b59ee54e5a09200cfa96b535b5d5adc520
-- 
2.49.0


