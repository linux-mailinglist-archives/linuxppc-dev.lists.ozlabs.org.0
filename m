Return-Path: <linuxppc-dev+bounces-4505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84F9FDBE6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 19:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLBHt2VR3z2xKN;
	Sun, 29 Dec 2024 05:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735411802;
	cv=none; b=mengCjGi2wyTgUzQAWuIVZ6Y35pqAwZD5pjCYSwiSoZ4OzGD91tlyzwKLa5lCzNr6MOWaeA+ntkdfGG1UNWebIlnMdnD8MKx2dFIlj7Gmo7wu5+Gu/hOwCQJcqYUt1hcsD5DnnUfJUDMc4Dbj3Vk+TsnIqGW5ceRsbDI6lIKYgJv/B0IS9xuQ+5ZoOZcAVzHvqZiv5HNesTmjXzAVCJIJ0FkkewnH70WEhuQAn+5+Spg+9eaDqaseYaOs34J8lmM8dhAf3PZ5GzNXaV13GGzagy5B8GBcowoplgLBTJAvUppnWBtYq326LFXsa9VibGGGgjDc3dVFsk1rZOtsFghVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735411802; c=relaxed/relaxed;
	bh=nmPTlVzrMWsZV/0UuabLUVbV1EH4j//h4cVfthapkOk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=od9xbw0TsAwXunYCH86wLnBwz65cW6M19SYzM22tGRuCDkw3gJ3vHmuQfg5nlsf93M6hCJlnNUR//PI9ygzFXkvKTl2MeNnHPGy6/iabBDZgDybQ1O81PbQkHxBDQxfSjT214VJ83eub/OTSl6CL5uzkLGP+xDBApj70rMFaD3qpmVgTN/91pqVsEXL6neJbUOYVr8uuxQ7BS4zyYR/x3bSrGHEERgs7uDqYn9Pay5t6Ae76uwFqjl6s9nv3OdZYFBHrF0DgUUJEfYIgaR/wxm0/QLGrSjEbVOL8VVcFqGHxacrtygflDp8qsSoF4Cp+lT8vyX6tlv/my6+nNjkimQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YQ+1CsJH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YQ+1CsJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLBHr51lDz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 05:49:59 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e396c98af22so4237429276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411794; x=1736016594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmPTlVzrMWsZV/0UuabLUVbV1EH4j//h4cVfthapkOk=;
        b=YQ+1CsJHZf8gCbpWeVrdGfa7eWMbNY+eGF3HGY9YmVZ7XBRhm1rqv5ZKZHD4QfX5lb
         kUwdZwRpdHUaRlyX9p71KpwufKnpNV0b+YpjwwkANdwkL6gYjn6W2b8EIohH0gg4Bnqk
         tPr+PO3YgJt889jzEwcqx61jXORpXMotWHt0pgr5rIAykm0GMDhL5RBo/uV0eCbGo2nS
         ysaQgcaQ2CUg94dVg3xzKjah4m0E4oQNqPm4K7sBor8q+0NHw+nS9dAuogUt7vZzZc4A
         Dh1yor5kpnBPCXm6tcOwl4ujFcZtBUv8mWJGRsIej4njy0/BT7FH+f3Aag3JbOOM28b2
         OdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411794; x=1736016594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmPTlVzrMWsZV/0UuabLUVbV1EH4j//h4cVfthapkOk=;
        b=OSz9B9LzLVqviX9M96XojV7OUGCyUo8jZWxvvF9pFlIDFjVpD7IrLwsc4lSn+2/3Jy
         S3GTMSFx47hqqKA+D3HPQTeflh5nXrg4rislyBiZuKydgul4pzA7T1E/GydGz67XsOhN
         uERbKXIr+prqwJf1J67wOco4id3vE1pEvVfzUyPSDu11emrslY64NoCOeOrwxCa209fc
         TSs1nyFYfM8EExOC1emoOrHXs74kxZjNaOay+eQcp3lYDqEmE01l9taYbAduufR2CLy+
         nkfTrHm+AON1p3fd+NVhyAODWSAr3TppRZUMLUPkzAuZ0OjSFlRTWTB+Jnuiewl/3sBs
         LRNA==
X-Forwarded-Encrypted: i=1; AJvYcCVb/lhbV+KiL1v5U+OwE0Q9KgfmIjhNh/AIGLSldEe5FOnDKqFyK/p7pv0J4p1i4OintolJOjggXtK0f0Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx64W5KN/Eryj5Cbw5i+q8SxQML1xyGWCrFGFdxxcX87NAWFND2
	+fZ7G9ofEt696rY0BD9QpZCGOvxbFpmPoBWv7JviLoJ9G8Qod92u
X-Gm-Gg: ASbGncvb6gzamazIy7tM7FpphVj1rImdhaBhRuCZUOPQTC1PzzuDSZd4W4gfMo3ASjL
	765zPT2U+O2YvZ1mfZGgvVJ6iWsO/dpKehtBHfYxcn8mjBJLC1IaaOaaYAqnoLfxveiIWj+blU6
	KbbXs4XHQHXOuhkk/2PoCKgw7v9WSaFIwazIv2B6UgxFPcSRHwa+bT+Jv6fJkwTZlw3EJkjsbU7
	xag4WyUtufhrczKAxQArajlQvjAa0FOWA3byckTlGdeA+U8Du3P9LsmyDYhwGhwRcaCtQG5Rxat
	VjkPPBGjflesotOy
X-Google-Smtp-Source: AGHT+IEkJJFH0m3oTNAbR0yAINMZTww0cO+zE7+Lf9uNhKvuTxiLtpcDAvH2RV2/PHCyo+AVfgp8KA==
X-Received: by 2002:a05:6902:18c1:b0:e39:8b94:16e6 with SMTP id 3f1490d57ef6-e538c3a2eb7mr19599866276.39.1735411794393;
        Sat, 28 Dec 2024 10:49:54 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cbedbe7sm5061343276.4.2024.12.28.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:49:53 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>,
	Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: [PATCH 00/14] cpumask: cleanup cpumask_next_wrap() implementation and usage
Date: Sat, 28 Dec 2024 10:49:32 -0800
Message-ID: <20241228184949.31582-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cpumask_next_wrap() is overly complicated, comparing to it's generic
version find_next_bit_wrap(), not mentioning it duplicates the above.
It roots to the times when the function was used in the implementation
of for_each_cpu_wrap() iterator. The function has 2 additional parameters
that were used to catch loop termination condition for the iterator.
(Although, only one is needed.)

Since 4fe49b3b97c262 ("lib/bitmap: introduce for_each_set_bit_wrap()
macro"), for_each_cpu_wrap() is wired to corresponding generic
wrapping bitmap iterator, and additional complexity of
cpumask_next_wrap() is not needed anymore.

All existing users call cpumask_next_wrap() in a manner that makes
it possible to turn it to a straight and simple alias to
find_next_bit_wrap().

This series replaces historical 4-parameter cpumask_next_wrap() with a
thin 2-parameter wrapper around find_next_bit_wrap().

Where it's possible to use for_each_cpu_wrap() iterator, the code is
switched to use it because it's always preferable to use iterators over
open loops.

This series touches various scattered subsystems and To-list for the
whole series is quite a long. To minimize noise, I send cover-letter and
key patches #5 and 6 to every person involved. All other patches are sent
individually to those pointed by scripts/get_maintainers.pl.

I'd like to move the series with my bitmap-for-next branch as a whole.

Yury Norov (14):
  objpool: rework objpool_pop()
  virtio_net: simplify virtnet_set_affinity()
  ibmvnic: simplify ibmvnic_set_queue_affinity()
  powerpc/xmon: simplify xmon_batch_next_cpu()
  cpumask: deprecate cpumask_next_wrap()
  cpumask: re-introduce cpumask_next_wrap()
  cpumask: use cpumask_next_wrap() where appropriate
  padata: switch padata_find_next() to using cpumask_next_wrap()
  s390: switch stop_machine_yield() to using cpumask_next_wrap()
  nvme-tcp: switch nvme_tcp_set_queue_io_cpu() to using
    cpumask_next_wrap()
  scsi: lpfc: switch lpfc_irq_rebalance() to using cpumask_next_wrap()
  scsi: lpfc: rework lpfc_next_{online,present}_cpu()
  PCI: hv: switch hv_compose_multi_msi_req_get_cpu() to using
    cpumask_next_wrap()
  cpumask: drop cpumask_next_wrap_old()

 arch/powerpc/xmon/xmon.c            |  6 +---
 arch/s390/kernel/processor.c        |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c  | 17 +++++-----
 drivers/net/virtio_net.c            | 12 +++++---
 drivers/nvme/host/tcp.c             |  2 +-
 drivers/pci/controller/pci-hyperv.c |  3 +-
 drivers/scsi/lpfc/lpfc.h            | 23 +++-----------
 drivers/scsi/lpfc/lpfc_init.c       |  2 +-
 include/linux/cpumask.h             | 48 ++++++++++++++++-------------
 include/linux/objpool.h             |  7 ++---
 kernel/padata.c                     |  2 +-
 lib/cpumask.c                       | 37 ++--------------------
 12 files changed, 60 insertions(+), 101 deletions(-)

-- 
2.43.0


