Return-Path: <linuxppc-dev+bounces-4152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E49F2F2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:29:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd4t010cz2ypV;
	Mon, 16 Dec 2024 22:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348557;
	cv=none; b=MVm+xnTSmpn3cQpdhDLhTn5jrtiPVBg9LuaRs9khXntigIg/iEEa22k53F9E5CQc28WXdOUAbtVKpiyZmOooQmm7zldokU4oY/cfVhSp1pu0QMjiL/SzSQY+G3HdpT6rYPTwjmMECGXL9Z1xaAN0te/0KuH70k+22uBHY+Hg47n2NJUHB9gHVY09zu9Ta5HFxX1xSyT/X561Z2bycYiyvNWSPZ5WBo+nS0ovViJZWoI/EVcwyHytmLyZGEJZxCYa4j0HlR1OizIJ31erLBwg/87Y5YPIejZEFpWfMLV/HRkOZp1PDRe8Oxa5hKN/KscUZTNt8ikRdfGs/areKVrWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348557; c=relaxed/relaxed;
	bh=XyMM03thqe8jZZ0XPtK4zmrq+yCt5nP0mWZzWZIyj6Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UMW/VKgUvUHSfwFwVvgOrs2c/2F0VuC5M/rzRVsLadSfYdAauyrl3iPADSFfbUdygSFafFcj1l3o7p7w8zxe2U3jyf2+kV1OZRK1V42GhkTbJRso3AbA8RanN0tyjp8UeZI8NKzaCLf9HxfdzsA1ecaXC3KEn2KJxBhLV2Lj+x3ki4pyS6GbU1O/jdzkxyqs/7CQIk3Yp1EFoO5F/3yWhhBcizvAWAApj3Thu59BGK2CDrnbDM5YeJ9kv96RXHyLEjIt1ZClUa2xJPie+fB5AAyxpJCch0RMZMXSBiQzbc/JvsV3ZiaDB4qcX3KXJKNrlqCQlciFT5m+9IZaWwmCRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=g9IGOFRM; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=g9IGOFRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd4r6Hbdz2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348552;
	bh=gtDmXeE2W0EUiQ4h0tC3GHJtLGn7JD/9aETwqdeMNXQ=;
	h=From:Subject:Date:To:Cc:From;
	b=g9IGOFRMVXLay8/Tak0jU63vFmPGwWtuBziJZBqBkK0uwb3ywiM1zVd9voFYl9FM4
	 N+8yP0zX3dXu/v1K/NRIwSGE7p/Xcuo4l0o8EoBEhwHXhekOZOu5/YHFJudj/i6YYD
	 QXJ3y9RC/MVcMcm2ZEjMlxnwqEWgYDrmBtXspfRw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 00/11] scsi: Constify 'struct bin_attribute'
Date: Mon, 16 Dec 2024 12:29:07 +0100
Message-Id: <20241216-sysfs-const-bin_attr-scsi-v1-0-f0a5e54b3437@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAAMPYGcC/x3MQQqDMBBG4avIrDtgokXaq5QiJp3R2cSSP0hFv
 Luhy2/x3kGQbAJ6Ngdl2Qy2pgp3ayguU5qF7VNNvvW98+7O2KHguCYUDpbGqZTMiDAO2ncSvA7
 6EKr9N4va7/9+vc/zAg0NRjxrAAAA
X-Change-ID: 20241215-sysfs-const-bin_attr-scsi-bf43eb2f7f9e
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Adam Radford <aradford@gmail.com>, 
 Bradley Grove <linuxdrivers@attotech.com>, 
 Tyrel Datwyler <tyreld@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, Brian King <brking@us.ibm.com>, 
 Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>, 
 GR-QLogic-Storage-Upstream@marvell.com, Nilesh Javali <njavali@marvell.com>, 
 Manish Rangankar <mrangankar@marvell.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348551; l=1753;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gtDmXeE2W0EUiQ4h0tC3GHJtLGn7JD/9aETwqdeMNXQ=;
 b=ywvoFzn+Ww14FCugG9gA5NVdk3LfOJew6DUaHBTWbNMVm7gd/vkQEQAEq9Pq2Ku75KqfixXwI
 UKTwUxs2UglA4bsNZEih9ZLwE55zuxPqeIb90sn5Grbcm8kAHLHyXt3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (11):
      scsi: core: Constify 'struct bin_attribute'
      scsi: 3w-sas: Constify 'struct bin_attribute'
      scsi: arcmsr: Constify 'struct bin_attribute'
      scsi: esas2r: Constify 'struct bin_attribute'
      scsi: ibmvfc: Constify 'struct bin_attribute'
      scsi: lpfc: Constify 'struct bin_attribute'
      scsi: ipr: Constify 'struct bin_attribute'
      scsi: qedf: Constify 'struct bin_attribute'
      scsi: qedi: Constify 'struct bin_attribute'
      scsi: qla2xxx: Constify 'struct bin_attribute'
      scsi: qla4xxx: Constify 'struct bin_attribute'

 drivers/scsi/3w-sas.c             | 12 +++---
 drivers/scsi/arcmsr/arcmsr_attr.c | 12 +++---
 drivers/scsi/esas2r/esas2r.h      | 12 +++---
 drivers/scsi/esas2r/esas2r_main.c | 32 ++++++++--------
 drivers/scsi/ibmvscsi/ibmvfc.c    |  6 +--
 drivers/scsi/ipr.c                | 26 ++++++-------
 drivers/scsi/lpfc/lpfc_attr.c     | 20 +++++-----
 drivers/scsi/qedf/qedf_attr.c     | 10 ++---
 drivers/scsi/qedf/qedf_dbg.h      |  2 +-
 drivers/scsi/qedi/qedi_dbg.h      |  2 +-
 drivers/scsi/qla2xxx/qla_attr.c   | 80 +++++++++++++++++++--------------------
 drivers/scsi/qla4xxx/ql4_attr.c   | 12 +++---
 drivers/scsi/scsi_sysfs.c         | 16 ++++----
 13 files changed, 121 insertions(+), 121 deletions(-)
---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-scsi-bf43eb2f7f9e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


