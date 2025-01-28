Return-Path: <linuxppc-dev+bounces-5642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F8A20EE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:47:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB5Y2HP9z2xgX;
	Wed, 29 Jan 2025 03:46:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738082817;
	cv=none; b=CtQXziXLglJ44AkeFvMKfZuO3X4S34p5aaEm3G4JxOTO4EJf4UPaN4gqr+ZhW+JwDZFJGTlRPnzHCpZKug4iOZTQ1PqmyrAFa9vdJFuVPOchfhUzlvvh2vcymsg5bH4mefBpuABqUzbfM08SrsclPCAJ9FXN59qqSaJDnjsuBIJ+Ecfs0OBrcmuenvwfyoxZtOcK/RZIYsPLT6EYCI+HN0A+oGwxJk4IR7rH22ecMw3ERrtF0whBizmQzxVaWLycWcGPZOPgeRoAGgKWawtVZf7fGG6x2Xbp1sTVBkM783DvEnhiNcOAUZuABfgSw/2cpikvQ8SjDQ7voXPrDhmy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738082817; c=relaxed/relaxed;
	bh=Y7I3FQn+a3IeKpvoyXVLY346phLoqlukuEhizyoucyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QQCxkb8gfoI+TkFKxLkXuPUUcgSlxzkjcZur98LZbSk4S2QtuQ3j3MB2NWbcpGUQleAqv29G0ayYm9iO3DKRCT0G5twTnRpCRkSzyv/MDlvg0lW+7vXvtBMBJpU3+gteCtuhFaQaYGo8yelzZAriGA2+pp8AjxyvroMZxkH5a7tn6+oyOluPh+pEzYHm0kR2V08/yoRrz00p1rAKO0pfE3a/aLC7y//bfrIdWv2WKPQc104oIrX8DaEVfyOPRzVRud0879ipbeXdC077n/msJDvjISNPaELN/8MuW3GhMHCjnVCdsblujjki77fInu3OFpe6XGD5g+fVl0qlJz3OKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zmp3d5fT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zmp3d5fT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB5X168Cz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:46:55 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so10578621276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082812; x=1738687612; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7I3FQn+a3IeKpvoyXVLY346phLoqlukuEhizyoucyY=;
        b=Zmp3d5fTkvIyParHG7IeQ1Xf5pxaPSG5ydxknzowyDlSx0gQiRnS98hXfoo2Tvp9tX
         Gdr/G+p0oAvdDq6zBAQqp5b+NvKZpTpbtBh86sG/MqFPkeR5dNPhxXMM7MzPtCZ/NBat
         7cVRZg7M61AWqMsqkBDXH3naK5KN7fD8A4mVnBjs6dm+qqdulzqb20QqVEszz41ezzLk
         KGuiq08X7yxOm9/yyTsVVczkrvLwUf6IrKWjvBGeMGAAyruV4WNnUfRN7Ilu5rWj0cAY
         VcdWSk1iN0REZK/cozL+bfSNw3agplh8obDFsOMlvcer7XZpALgC5Xe0n2Lnf2RA3ZEg
         m7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082812; x=1738687612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7I3FQn+a3IeKpvoyXVLY346phLoqlukuEhizyoucyY=;
        b=NuHZcdwbhcNQuedV8NbD5bHQ+DLwtNuHFrZJYExbjFMDohHVvreWTgQjSEyHnvrbRy
         r1Ta5+vbnzPUf3kxyDFghvznew/+Pw0tl6zFx6xAwLe8zIMM8R0DzE1B8LW0FxYs/whF
         MLG0mzVGflekNlf1c/yeTbeEs5E38dqFCZ82xa2s+AfQRjBKHxSrEqZLINNxqt1bgBuo
         ivCfk6Z6E+2M1ZI6+noeG07eFXOH0C5++ER0CROZpBcn/+J4jGGWc7g2Y+K3LrtfGL2k
         zyRyzOpfrS2SgLS7RtsVfO1W5Mp+CLNevldTOaNv/TNkwXM0miQKeavVhe7SyCoo7o84
         M0xw==
X-Forwarded-Encrypted: i=1; AJvYcCWPKEXTQg7r1Y3vp/JTUSRLxtM+N+yHaC/bVFql8643DJyebKK/9j84evbHlnle0ypu6Kh/HOdOTQXWH5g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0GUDNsBEkpJdFOevb3+82xF8aA931yf2v8YTzzjgRnFatZr1I
	SRsMjAwBL5oKa48NuMaJXtNEKtg08dgoNT8mbHMmkVv8SmTnHY5u
X-Gm-Gg: ASbGncv0CmpqDNhzCX8Cop77wC+YHr+9lwWXlDoZiaE61T+O3JIHXY/wB8SiO+n6qqj
	ggNdV2NxDYDGei/sbpAA/g24J74PHWp9b1w/2W6eql0o0EDTBlHXXS6pyPHZJkm0bi5BaPgpxtt
	zw1NaLml6Oe9e3x6WUQ150Go35t9gtoCxbMJ/imhf5sMrc6BQ8TLcoh8QV/ZYF4gkaYws3Vck2M
	CSITZEOvb20sCsymKA4y4paDNM44ghDJ2hm2UvzSQzk1XmBczDPmwNbbr1SurcC7R2ph07gWNTg
	vFSBsCkbsr+YIIskqYzm6VWc0Axjnak7mZHgQQQxH+/+ta2l1xM=
X-Google-Smtp-Source: AGHT+IFvmgf54bypeg06iXMG7R6vW3zKyn1725RIYJUIjUALciExdJNbHjTn7B/5gtx7qirVGTp6aA==
X-Received: by 2002:a05:6902:70c:b0:e58:5a:7694 with SMTP id 3f1490d57ef6-e58005a7945mr26770575276.20.1738082811957;
        Tue, 28 Jan 2025 08:46:51 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e583b7697c9sm2098812276.16.2025.01.28.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:46:51 -0800 (PST)
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
Subject: [PATCH v2 00/13] cpumask: cleanup cpumask_next_wrap() implementation and usage
Date: Tue, 28 Jan 2025 11:46:29 -0500
Message-ID: <20250128164646.4009-1-yury.norov@gmail.com>
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

v1: https://lore.kernel.org/netdev/20241228184949.31582-1-yury.norov@gmail.com/T/
v2:
 - rebase on top of today's origin/master;
 - drop #v1-10: not needed since v6.14 @ Sagi Grinberg;
 - #2, #3: fix picking next unused CPU @ Nick Child;
 - fix typos, cleanup comments @ Bjorn Helgaas, Alexander Gordeev;
 - CC Christoph Hellwig for the whole series.

Yury Norov (13):
  objpool: rework objpool_pop()
  virtio_net: simplify virtnet_set_affinity()
  ibmvnic: simplify ibmvnic_set_queue_affinity()
  powerpc/xmon: simplify xmon_batch_next_cpu()
  cpumask: deprecate cpumask_next_wrap()
  cpumask: re-introduce cpumask_next{,_and}_wrap()
  cpumask: use cpumask_next_wrap() where appropriate
  padata: switch padata_find_next() to using cpumask_next_wrap()
  s390: switch stop_machine_yield() to using cpumask_next_wrap()
  scsi: lpfc: switch lpfc_irq_rebalance() to using cpumask_next_wrap()
  scsi: lpfc: rework lpfc_next_{online,present}_cpu()
  PCI: hv: Switch hv_compose_multi_msi_req_get_cpu() to using
    cpumask_next_wrap()
  cpumask: drop cpumask_next_wrap_old()

 arch/powerpc/xmon/xmon.c            |  6 +--
 arch/s390/kernel/processor.c        |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c  | 18 +++++---
 drivers/net/virtio_net.c            | 12 ++---
 drivers/pci/controller/pci-hyperv.c |  3 +-
 drivers/scsi/lpfc/lpfc.h            | 23 +++-------
 drivers/scsi/lpfc/lpfc_init.c       |  2 +-
 include/linux/cpumask.h             | 69 ++++++++++++++++++++---------
 include/linux/objpool.h             |  7 ++-
 kernel/padata.c                     |  2 +-
 lib/cpumask.c                       | 37 +---------------
 11 files changed, 81 insertions(+), 100 deletions(-)

-- 
2.43.0


