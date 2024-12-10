Return-Path: <linuxppc-dev+bounces-3933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FFD9EBC9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 23:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CR45QbMz300V;
	Wed, 11 Dec 2024 09:03:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733868192;
	cv=none; b=UZjm6N19JBB+DOjZjBVCRJdVvsFv1m3n9WmnjeT7C80sA7w6j+4FWGLev5QFzyFaa/DbNXzmeyzhSHR+ZeUbP7ZKWng2nO03MggS6UhXjbahu6hgZ04Bf0xYL2UrANTEtUFS0ey7w697p97dFG3oEtzV1WIQwgUYeJM4M5/U1EF6kXR2s/EYpV8OjAU/VNy4O31Q0D7rHplRGIt2RxMhouXsOperpv4bRAnscBHSCj+jK5jSAbk8+o7N0bWa8t7yvlnopGePJ9TwD12Kmk9xhkkL8pHbndF+juyR7JUyqCTx5DSaJb6AnwXG3adNKzOSaEIpfp6Q7OTRyPS+jfyXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733868192; c=relaxed/relaxed;
	bh=3tkOAM1zqG9JeFOtral7Lfs9u46U15/2RBF6sWmMcg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7cbYJ+QeeXXLTNB6TL2TCnE4UmjGghT6Brd8aBYR0ISkZuQ3sfaBIfCI11DiUsa8q6ZJsRs6S58RnS94w1w04Vfyl8rPC2G8ZCoULI1ZiUKzqwjGjHNp/WOpU40Z5Fiwgfr09xa38Zpo+sdx4CyOXiH954jA9NP5OoC0aBC8oZVotSemaJlwkn8IwIILIIlGFyiTvDBb1h+DMrFfE0CRrkdglNGG9Xk9ozizWjrN1oabFALgScpuYCXOgdd31uG6NnqGt0TwQhcNgPw8Uf6z3jI+FLwpmoNkmCUbxApRU41La9U0WaY2YmpkxbxHttuhvoJxgcwk+qRAqsu74jcCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Q4SOEP0Y; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Q4SOEP0Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CR06jFMz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 09:03:08 +1100 (AEDT)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5C8092047227;
	Tue, 10 Dec 2024 14:02:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5C8092047227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733868156;
	bh=3tkOAM1zqG9JeFOtral7Lfs9u46U15/2RBF6sWmMcg4=;
	h=From:Subject:Date:To:Cc:From;
	b=Q4SOEP0Y7h5zO78UBiHUhYnGicCTwnpmdGyeJ2NXra3aSgp4pliiNVajI48sltiC5
	 krxOdne8IbeYxRwBBWcjRMbkm4dRwXWKZALmzr8Eqfc6Ado8XqXrVleqMCFQbV/jTu
	 DEly4DyEWnbV/UU33Q7NVotbdGyJFxTE5SxdsOl8=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v3 00/19] Converge on using secs_to_jiffies()
Date: Tue, 10 Dec 2024 22:02:31 +0000
Message-Id: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHe6WGcC/42NwQ6CMBAFf4X0bAlbQFJP/ofxAO1W1ijVFhoM4
 d8tGONFE49vkjczMY+O0LNdMjGHgTzZLo58kzDV1t0JOem4mchEAQCCK9sFdJF7VJ73lp/JmGj
 gWkoNGWwbDcDi/ebQ0LiqD8fXdngfYqH/wJZ8b91jzQdY6LtU/i4F4BkHWdda5YUsoNlfqBvG9
 ErKWW9Nnyp7ZYs+iH+VIiolgGmqUpZYye/KeZ6fTjplmTIBAAA=
X-Change-ID: 20241112-converge-secs-to-jiffies-d99d1016bd11
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a series that follows up on my previous series to introduce
secs_to_jiffies() and convert a few initial users.[1] In the review for
that series, Anna-Maria requested converting other users with
Coccinelle. [2] This is part 1 that converts users of msecs_to_jiffies()
that use the multiply pattern of either of:
- msecs_to_jiffies(N*1000), or
- msecs_to_jiffies(N*MSEC_PER_SEC)

where N is a constant, to avoid the multiplication.

The entire conversion is made with Coccinelle in the script added in
patch 2. Some changes suggested by Coccinelle have been deferred to
later parts that will address other possible variant patterns.

CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

[1] https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-0-9ba123facf88@linux.microsoft.com/
[2] https://lore.kernel.org/all/8734kngfni.fsf@somnus/

---
Changes in v3:
- Rebase on next-20241210
- Fix typo'ed timeout in net/netfilter/nf_conntrack_proto_sctp.c (Stephen Rothwell)
- Use Coccinelle operation modes for Coccinelle script (Markus Elfring)
- Remove redundant comments in arch/arm/mach-pxa/sharpsl_pm.c
  (Christophe Leroy)
- Remove excess line breaks (Heiko Carstens, Christophe Leroy)
- Add more detail into the commit messages throughout (Christophe Leroy)
- Pick up Reviewed-by Thomas Hellström for drm/xe
- Drop drm/etnaviv patch already queued into etnaviv/next
- Replace call to [m]secs_to_jiffies(0) with just 0 for livepatch (Dan
  Carpenter, Christophe Leroy)
- Split out nfp patch to send to net-next (Christophe Leroy)
- Pick up Acked-by from Jeff Johnson for ath11k
- Link to v2: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com
Changes in v2:
- Exclude already accepted patch adding secs_to_jiffies() https://git.kernel.org/tip/b35108a51cf7bab58d7eace1267d7965978bcdb8
- Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com

---
Easwar Hariharan (19):
      netfilter: conntrack: Cleanup timeout definitions
      coccinelle: misc: Add secs_to_jiffies script
      arm: pxa: Convert timeouts to use secs_to_jiffies()
      s390: kernel: Convert timeouts to use secs_to_jiffies()
      powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
      mm: kmemleak: Convert timeouts to secs_to_jiffies()
      accel/habanalabs: Convert timeouts to secs_to_jiffies()
      drm/xe: Convert timeout to secs_to_jiffies()
      scsi: lpfc: Convert timeouts to secs_to_jiffies()
      scsi: arcmsr: Convert timeouts to secs_to_jiffies()
      scsi: pm8001: Convert timeouts to secs_to_jiffies()
      xen/blkback: Convert timeouts to secs_to_jiffies()
      gve: Convert timeouts to secs_to_jiffies()
      wifi: ath11k: Convert timeouts to secs_to_jiffies()
      Bluetooth: MGMT: Convert timeouts to secs_to_jiffies()
      staging: vc04_services: Convert timeouts to secs_to_jiffies()
      ceph: Convert timeouts to secs_to_jiffies()
      livepatch: Convert timeouts to secs_to_jiffies()
      ALSA: line6: Convert timeouts to secs_to_jiffies()

 arch/arm/mach-pxa/sharpsl_pm.c                     |  8 ++++----
 arch/powerpc/platforms/pseries/papr_scm.c          |  2 +-
 arch/s390/kernel/lgr.c                             |  2 +-
 arch/s390/kernel/time.c                            |  4 ++--
 arch/s390/kernel/topology.c                        |  2 +-
 drivers/accel/habanalabs/common/device.c           |  2 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |  3 +--
 drivers/block/xen-blkback/blkback.c                |  2 +-
 drivers/gpu/drm/xe/xe_device.c                     |  2 +-
 drivers/net/ethernet/google/gve/gve_tx_dqo.c       |  6 ++----
 drivers/net/wireless/ath/ath11k/debugfs.c          |  2 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                      | 18 +++++++++---------
 drivers/scsi/lpfc/lpfc_nportdisc.c                 |  8 ++++----
 drivers/scsi/lpfc/lpfc_nvme.c                      |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                       |  4 ++--
 drivers/scsi/lpfc/lpfc_vmid.c                      |  2 +-
 drivers/scsi/pm8001/pm8001_init.c                  |  2 +-
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c    |  2 +-
 fs/ceph/quota.c                                    |  2 +-
 mm/kmemleak.c                                      |  4 ++--
 net/bluetooth/mgmt.c                               |  2 +-
 net/netfilter/nf_conntrack_proto_sctp.c            | 21 ++++++++-------------
 samples/livepatch/livepatch-callbacks-busymod.c    |  3 +--
 samples/livepatch/livepatch-shadow-fix1.c          |  3 +--
 samples/livepatch/livepatch-shadow-mod.c           | 15 +++++----------
 scripts/coccinelle/misc/secs_to_jiffies.cocci      | 22 ++++++++++++++++++++++
 sound/usb/line6/toneport.c                         |  2 +-
 28 files changed, 78 insertions(+), 71 deletions(-)
---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241112-converge-secs-to-jiffies-d99d1016bd11

Best regards,
-- 
Easwar Hariharan <eahariha@linux.microsoft.com>


