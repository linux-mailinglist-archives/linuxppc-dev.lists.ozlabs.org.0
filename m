Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7A246555
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:27:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVWxF5SK2zDqRC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NYaF30VK; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSXW3fJczDqST
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:54:28 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id r4so7172969pls.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bnxXioh0yiQPsqDGs/WZdNyR4Y3nWYKtRgZSCeqOcrI=;
 b=NYaF30VKVufBHJunHpkSU90tB2On6qnirFVgvJbSy7BWgd5aHOmWhSNBusUaftjnzF
 IipaRvhNq/zWrI5KO0/2RSyvHozU28KuvPD+9TBIC9XXndXQkk+eE1bklOXbLGGsh0k3
 X40M2APBFkjc+hTd7qumcLuP7LNbWLM6Pzm7fUdYliDR6j2ThyvyhdPEB69vaWzmnHMu
 Ww6ExG+c5u10qzr8aepJlYsLL7p8O4Wg+9maVodhR5rFuTgnl36RWHqxjiejnsDvSpsh
 ArHH0BIStZoxkcd2Qyqr0qxUW0I3bhfY6IWcvZjJk6jjwaacny6Rq9KTn7l7oM8WeO/M
 lywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bnxXioh0yiQPsqDGs/WZdNyR4Y3nWYKtRgZSCeqOcrI=;
 b=LK8iojrLQBCzU+owBD8n9IIIzTYyIAlfwoY/LAacZXGKJZJwGNj/vAzmYljqo+Jpcr
 lgFGcHATaryiz3IyvK0cfeMxVrL2JUDT62CPYRcJrsF23/gEG+SzuRvvOn3ugZ7m6dBt
 C4vvhGAoUtjNlH3wJ5R7EyIXfYBm6q9O44avxqZoVL6q8CnSF3N7aJ/pNlS+6U7Wgh3v
 zBsR08ADDk+s6qKhcKPrAgtJ6g4QxysfpPK9aTgZunZ0Iv5zlOZs1hBOFxH8KW6850tY
 N19H/ViTBdokP3A1GID8aeL7u1gwAw/fueD68rUXVU0LFABMy2k808tA75FgwZs0+/VV
 bGZQ==
X-Gm-Message-State: AOAM531ORmXlBtvN/LvLNu8ScNiV6CpMBJagISLAL0dNUV1Bm/lB9QwO
 VQIYnCfE4m57uRWsqiJncD0=
X-Google-Smtp-Source: ABdhPJwcyGHQv4SvYAxbBC+SLIY12gRvJ0Zhc1zsyNnZoGYYOxMVvqk79RQml5YrTXuVqckLJjf7QA==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id
 j15mr11147246pjz.26.1597654466055; 
 Mon, 17 Aug 2020 01:54:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id x12sm18236990pff.48.2020.08.17.01.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:54:25 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com
Subject: [PATCH 0/8] scsi: convert tasklets to use new tasklet_setup()
Date: Mon, 17 Aug 2020 14:24:01 +0530
Message-Id: <20200817085409.25268-1-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:56 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: keescook@chromium.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 target-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Allen Pais <allen.lkml@gmail.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the scsi drivers to use the new tasklet_setup() API

Allen Pais (8):
  scsi: aic94xx: convert tasklets to use new tasklet_setup() API
  scsi: esas2r: convert tasklets to use new tasklet_setup() API
  scsi: ibmvscsi: convert tasklets to use new tasklet_setup() API
  scsi: isci: convert tasklets to use new tasklet_setup() API
  scsi: megaraid: convert tasklets to use new tasklet_setup() API
  scsi: mvsas: convert tasklets to use new tasklet_setup() API
  scsi: pm8001: convert tasklets to use new tasklet_setup() API
  scsi: pmcraid: convert tasklets to use new tasklet_setup() API

 drivers/scsi/aic94xx/aic94xx_hwi.c          |  9 ++--
 drivers/scsi/esas2r/esas2r.h                |  2 +-
 drivers/scsi/esas2r/esas2r_init.c           |  4 +-
 drivers/scsi/esas2r/esas2r_main.c           |  4 +-
 drivers/scsi/ibmvscsi/ibmvfc.c              |  6 +--
 drivers/scsi/ibmvscsi/ibmvscsi.c            |  8 +--
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c    |  7 ++-
 drivers/scsi/isci/host.c                    |  4 +-
 drivers/scsi/isci/host.h                    |  2 +-
 drivers/scsi/isci/init.c                    |  3 +-
 drivers/scsi/megaraid/megaraid_mbox.c       |  9 ++--
 drivers/scsi/megaraid/megaraid_sas.h        |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c   | 16 +++---
 drivers/scsi/megaraid/megaraid_sas_fusion.c | 14 +++---
 drivers/scsi/mvsas/mv_init.c                |  8 +--
 drivers/scsi/pm8001/pm8001_init.c           | 55 ++++++++++++---------
 drivers/scsi/pm8001/pm8001_sas.h            |  6 ++-
 drivers/scsi/pmcraid.c                      | 29 +++++------
 drivers/scsi/pmcraid.h                      |  9 +++-
 19 files changed, 104 insertions(+), 93 deletions(-)

-- 
2.17.1

