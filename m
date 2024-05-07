Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309F8BEC27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:02:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=BUPpBvir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYnhd6qdYz3cVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 05:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=BUPpBvir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYngx3b8lz3cNt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 05:01:49 +1000 (AEST)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id BFE4A20B2C82;
	Tue,  7 May 2024 12:01:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFE4A20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715108476;
	bh=VWE6ZXP3AIBJkn4ZrcnxCPzQUxLvW0RGUuO+DHKq/oQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BUPpBvirSU0EX4pKl+Phr89hCZNIv0k0Az22vm7KuGi0USH0e7qWgzZ6Udw0XYCc1
	 f8c0XlYsrfpY1Wu1Ayb0yKlIz14J+IO8Qd/dOrTV+O1rq/zlwl5rywcIUO15zHBLb9
	 uqJP7Ip9O/vzxFMcysGpkWIAo+IBXQpmPcE44qGY=
From: Allen Pais <apais@linux.microsoft.com>
To: netdev@vger.kernel.org
Subject: [PATCH 0/1] Convert tasklets to BH workqueues in ethernet drivers
Date: Tue,  7 May 2024 19:01:10 +0000
Message-Id: <20240507190111.16710-1-apais@linux.microsoft.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, linux@armlinux.org.uk, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, bryan.whitehead@microchip.com, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series focuses on converting the existing implementation of
tasklets to bottom half (BH) workqueues across various Ethernet
drivers under drivers/net/ethernet/*.

Impact:
 The conversion is expected to maintain or improve the performance
of the affected drivers. It also improves the maintainability and
readability of the driver code.

Testing:
 - Conducted standard network throughput and latency benchmarks
   to ensure performance parity or improvement.
 - Ran kernel regression tests to verify that changes do not introduce new issues.

I appreciate your review and feedback on this patch series.
And additional tested would be really helpful.

Allen Pais (1):
  [RFC] ethernet: Convert from tasklet to BH workqueue

 drivers/infiniband/hw/mlx4/cq.c               |  2 +-
 drivers/infiniband/hw/mlx5/cq.c               |  2 +-
 drivers/net/ethernet/alteon/acenic.c          | 26 +++----
 drivers/net/ethernet/alteon/acenic.h          |  7 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h          | 11 +--
 drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
 drivers/net/ethernet/broadcom/cnic.h          |  2 +-
 drivers/net/ethernet/cadence/macb.h           |  3 +-
 drivers/net/ethernet/cadence/macb_main.c      | 10 +--
 .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   | 25 +++----
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
 .../ethernet/cavium/liquidio/octeon_main.h    |  5 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 12 ++--
 drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
 .../ethernet/cavium/thunder/nicvf_queues.c    |  5 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  3 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 41 +++++------
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
 drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
 .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
 drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
 drivers/net/ethernet/jme.c                    | 72 +++++++++----------
 drivers/net/ethernet/jme.h                    |  9 +--
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 drivers/net/ethernet/marvell/skge.c           | 12 ++--
 drivers/net/ethernet/marvell/skge.h           |  3 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 drivers/net/ethernet/mellanox/mlx4/cq.c       | 42 +++++------
 drivers/net/ethernet/mellanox/mlx4/eq.c       | 10 +--
 drivers/net/ethernet/mellanox/mlx4/mlx4.h     | 11 +--
 drivers/net/ethernet/mellanox/mlx5/core/cq.c  | 38 +++++-----
 drivers/net/ethernet/mellanox/mlx5/core/eq.c  | 12 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   | 15 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.h   |  3 +-
 .../net/ethernet/mellanox/mlx5/core/lib/eq.h  | 11 +--
 drivers/net/ethernet/mellanox/mlxsw/pci.c     | 29 ++++----
 drivers/net/ethernet/micrel/ks8842.c          | 29 ++++----
 drivers/net/ethernet/micrel/ksz884x.c         | 37 +++++-----
 drivers/net/ethernet/microchip/lan743x_ptp.c  |  2 +-
 drivers/net/ethernet/natsemi/ns83820.c        | 10 +--
 drivers/net/ethernet/netronome/nfp/nfd3/dp.c  |  7 +-
 .../net/ethernet/netronome/nfp/nfd3/nfd3.h    |  2 +-
 drivers/net/ethernet/netronome/nfp/nfdk/dp.c  |  6 +-
 .../net/ethernet/netronome/nfp/nfdk/nfdk.h    |  3 +-
 drivers/net/ethernet/netronome/nfp/nfp_net.h  |  4 +-
 .../ethernet/netronome/nfp/nfp_net_common.c   | 12 ++--
 .../net/ethernet/netronome/nfp/nfp_net_dp.h   |  4 +-
 drivers/net/ethernet/ni/nixge.c               | 19 ++---
 drivers/net/ethernet/qlogic/qed/qed.h         |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c     |  6 +-
 drivers/net/ethernet/qlogic/qed/qed_int.h     |  4 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    | 20 +++---
 drivers/net/ethernet/sfc/falcon/farch.c       |  4 +-
 drivers/net/ethernet/sfc/falcon/net_driver.h  |  2 +-
 drivers/net/ethernet/sfc/falcon/selftest.c    |  2 +-
 drivers/net/ethernet/sfc/net_driver.h         |  2 +-
 drivers/net/ethernet/sfc/selftest.c           |  2 +-
 drivers/net/ethernet/sfc/siena/farch.c        |  4 +-
 drivers/net/ethernet/sfc/siena/net_driver.h   |  2 +-
 drivers/net/ethernet/sfc/siena/selftest.c     |  2 +-
 drivers/net/ethernet/silan/sc92031.c          | 47 ++++++------
 drivers/net/ethernet/smsc/smc91x.c            | 16 ++---
 drivers/net/ethernet/smsc/smc91x.h            |  3 +-
 include/linux/mlx4/device.h                   |  2 +-
 include/linux/mlx5/cq.h                       |  2 +-
 83 files changed, 501 insertions(+), 473 deletions(-)

-- 
2.17.1

