Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E8246004
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:28:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRyF6WSCzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M/4vmlNW; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRtG4znDzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:24:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id o5so7774335pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5PXZFWOz2tb3F9fmRx1vDun4xD0bjs7mYvEnyzTCjpQ=;
 b=M/4vmlNWT6Gz+srqGzE/Hgm9csAqwc3+cbN/peKcOXhAxssJyRMgIL9InVoGwrP8cR
 XkTwAtO7sEr6w9WQO5CTKp0EZLfhVJg1hmPV/ONGhK04kcc7dFjCI4yuZzt7wH+yMPvI
 hTTIoYk+WoBAvFvFIkMTuiRGZnoHphTvUMevo4u19SGTOJez/q8XmJ0zQexoY8GVvsfV
 iaAhwMs4O8aTFxkHEG2HzfulWQ21enJjHBGHGj9bxuKr1azYF1iYKxUgCg7I8g13yZIz
 yACbWPBG1dD3c2xapLYUJr/n+SlUBQfRihlqVHfN4O+Cs3+Q+3BiR7ZJ5EhNz+bCWCV6
 xQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5PXZFWOz2tb3F9fmRx1vDun4xD0bjs7mYvEnyzTCjpQ=;
 b=JoQCntg+e/eHr7B+Jj3VYR3faAeox53vxtc5ZoxZoPLl9eLK+8SXYS+D2PNfTUpY/R
 ycRr5TzlzrefNtpemdNDLeXcdCnJxDlETSApNJNWzPx/0PgFVaCoZTxWRdH3ZcKRTOQq
 dtkHjJFfR/yoeZ63gQsU6hL2FwzP8MHjU88Wo9SDF/TuQvGgfEPSEGN63/wTrCI3aJL2
 Muz1OhdYWkVPGisO8DVfsRB+H8s/VqCAuN5DRzMTL6csX/ObHpdaLXUSSJVLLUihT3O6
 lLv1GABEBDpOEVkEubjWrEPKozEmnAMhtgjFnwrkAqX4L5AJ64caxI/1cSRdGJEq69v/
 rk7Q==
X-Gm-Message-State: AOAM5324Wue4KsdKLt1VorNGaVu3Xo7acaKimWuv5Gf2/qnhe/CjLN8o
 LjvyzYf4Qzu3YnRN7DlYgeM=
X-Google-Smtp-Source: ABdhPJyxLtMMUfDCIVstyRxRcFSNlMMYFU2cAWVhiSHZPutOYLsNLsGg0f03p0A0H3087YVwgqvTWA==
X-Received: by 2002:a62:7644:: with SMTP id r65mr10455149pfc.271.1597652689287; 
 Mon, 17 Aug 2020 01:24:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:24:48 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 00/20] ethernet: convert tasklets to use new tasklet_setup()
 API
Date: Mon, 17 Aug 2020 13:54:13 +0530
Message-Id: <20200817082434.21176-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: keescook@chromium.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 oss-drivers@netronome.com, linuxppc-dev@lists.ozlabs.org,
 linux-acenic@sunsite.dk, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the crypto modules to use the new tasklet_setup() API


Allen Pais (20):
  ethernet: alteon: convert tasklets to use new tasklet_setup() API
  ethernet: amd: convert tasklets to use new tasklet_setup() API
  broadcom: cnic: convert tasklets to use new tasklet_setup() API
  ethernet: cadence: convert tasklets to use new tasklet_setup() API
  ethernet: cavium: convert tasklets to use new tasklet_setup() API
  ethernet: chelsio: convert tasklets to use new tasklet_setup() API
  ethernet: dlink: convert tasklets to use new tasklet_setup() API
  ethernet: hinic: convert tasklets to use new tasklet_setup() API
  ethernet: ehea: convert tasklets to use new tasklet_setup() API
  ethernet: ibmvnic: convert tasklets to use new tasklet_setup() API
  ethernet: jme: convert tasklets to use new tasklet_setup() API
  ethernet: marvell: convert tasklets to use new tasklet_setup() API
  ethernet: mellanox: convert tasklets to use new tasklet_setup() API
  ethernet: micrel: convert tasklets to use new tasklet_setup() API
  ethernet: natsemi: convert tasklets to use new tasklet_setup() API
  ethernet: netronome: convert tasklets to use new tasklet_setup() API
  ethernet: ni: convert tasklets to use new tasklet_setup() API
  ethernet: qlogic: convert tasklets to use new tasklet_setup() API
  ethernet: silan: convert tasklets to use new tasklet_setup() API
  ethernet: smsc: convert tasklets to use new tasklet_setup() API

 drivers/net/ethernet/alteon/acenic.c          |  9 +++--
 drivers/net/ethernet/alteon/acenic.h          |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 19 +++++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 11 +++--
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 11 +++--
 drivers/net/ethernet/broadcom/cnic.c          | 18 ++++-----
 drivers/net/ethernet/cadence/macb_main.c      |  7 ++--
 .../net/ethernet/cavium/liquidio/lio_main.c   | 12 +++---
 .../ethernet/cavium/liquidio/octeon_main.h    |  1 +
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  |  8 ++--
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 10 ++---
 .../ethernet/cavium/thunder/nicvf_queues.c    |  4 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  2 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 12 ++++--
 drivers/net/ethernet/chelsio/cxgb3/sge.c      | 14 +++----
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 12 +++---
 drivers/net/ethernet/dlink/sundance.c         | 20 +++++-----
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  |  7 ++--
 drivers/net/ethernet/ibm/ehea/ehea_main.c     |  7 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            |  7 ++--
 drivers/net/ethernet/jme.c                    | 40 ++++++++-----------
 drivers/net/ethernet/marvell/skge.c           |  6 +--
 drivers/net/ethernet/mellanox/mlx4/cq.c       |  4 +-
 drivers/net/ethernet/mellanox/mlx4/eq.c       |  3 +-
 drivers/net/ethernet/mellanox/mlx4/mlx4.h     |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/cq.c  |  4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eq.c  |  3 +-
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   |  7 ++--
 .../net/ethernet/mellanox/mlx5/core/lib/eq.h  |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/pci.c     | 12 +++---
 drivers/net/ethernet/micrel/ks8842.c          | 19 ++++-----
 drivers/net/ethernet/micrel/ksz884x.c         | 14 +++----
 drivers/net/ethernet/natsemi/ns83820.c        |  8 ++--
 .../ethernet/netronome/nfp/nfp_net_common.c   |  7 ++--
 drivers/net/ethernet/ni/nixge.c               |  7 ++--
 drivers/net/ethernet/qlogic/qed/qed.h         |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c     | 27 ++-----------
 drivers/net/ethernet/qlogic/qed/qed_int.h     |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    | 14 +++----
 drivers/net/ethernet/silan/sc92031.c          | 11 ++---
 drivers/net/ethernet/smsc/smc91x.c            | 10 ++---
 41 files changed, 178 insertions(+), 219 deletions(-)

-- 
2.17.1

