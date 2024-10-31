Return-Path: <linuxppc-dev+bounces-2740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBF9B727E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 03:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf7Cz5Nf0z2yD6;
	Thu, 31 Oct 2024 13:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d61"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730334235;
	cv=none; b=Cc7nODIxLedCwex6O+7UhiPqBL+pRnKtNgpbF23R8wwN7sTMYfDyesuKZ1/7wTZiu+HnzV7k6FNFoLjNnJ81Jwon1PIVVNPUxvHY0ixeebEHCmdDKXs0nFK9nepttPGTnixHv80+JzZa2ZLJ/hoVkgqUadeQ4Y3MhtFWCBweM//AzkwYmng6677ICfuAe9f7VIuXnb6C4Ue13C53mhkOGSxZ7ZJHfVL/gb6nugFW0xvnqDA3ITSfScxOIcy/rFpXDQJbbbAmKWCdYKB3/ZufNmAw58f2CLCKhobKWGKHz6xIlV01pkqWeWSu8KcmZnuB/SAzTLtgP00xaHIX+dWkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730334235; c=relaxed/relaxed;
	bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjNpPahzeDiAs3ORTxX+1WnwLTeI+ZWBRnroTXI/dvli28hu9XVL9tTGIVeMvRiNolU0YSxDpJm+CS1rTJMU2uP0RowW0c8pfcnlfKBo7im9Ib7aSAlJPRgbnMi/JW7UeRE92vC18QKf6bOv23KxjWQO/4H6E67j6QPMyYkRpMOXUz4snOIRxuD7iNYD5l6Y4CXj1sGLXatGtZatBv3wefNieP8ay5EIU9vlJT9YVDvXu7I+juxvLZvWaKzDbDf2MIfDdRGrOf2YJCIVtik9iF4EbGD4Yl/qtIHZbs5uA+CGKNazJeWb1C0iVOk1v7KtSftOgj1ViIPJgJPCIi4UUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EBUfZB/Q; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::d61; helo=mail-io1-xd61.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EBUfZB/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::d61; helo=mail-io1-xd61.google.com; envelope-from=csander@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd61.google.com (mail-io1-xd61.google.com [IPv6:2607:f8b0:4864:20::d61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf4VK2Hw9z2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 11:23:51 +1100 (AEDT)
Received: by mail-io1-xd61.google.com with SMTP id ca18e2360f4ac-83ab1e78952so658639f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 17:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1730334224; x=1730939024; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=;
        b=EBUfZB/QR6UN9WUweXzlAxmFZRokGIGMX7XlB/NyTI8Pjvd0Cf8XifOTzZ87TnxmxB
         6pSzbs5buT4Pjvrf4b7ImGtrN/9T3GSomoGtCGfn788lVkz1/jduzRfXgiOHXldu94BN
         0jMcqo2cwsFUkFz8HbY/W0rHzEQ+nDCIPFx5Wy2iLzpzV3pNFiIR5CKyg4EuqhkDHPYy
         xbnmVcRvVDv5ayL6f7uSHCMD86QeVRZ/rgCf6QvMttJxHRsH7Ha6STGOlCjr0uFBkCDi
         k/V1IO52RKSA4Q1yvGAFs6jdZtzRVlTArvXlGEaNymSTzO6EL/+mb6TUZsv3xTP21jAi
         WvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730334224; x=1730939024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tf88+MjxuRscGCJUWSV+JgU09beZteKvue7KtOwrEjg=;
        b=wfrw4+57O2/xtj5Va0/9pFTsmN0OcAxpx66BM3kSG0d8uKgkFgmi5MCH7Nc6J+LpmA
         FeD2xJo8s/47Xt0i5jCN446Z5rkcsK2D3/3CXbWNXlXKQPWZAF5VJfriyxfnz9n93j5B
         ZK6Ql/3XygPNEWhbzAWL0mjn584jFG2ejtrOK0Tq8+FrnrnWOPlLcVzzIi4LzCHksr0V
         JbYreiF2nxRA87HSepmqCK3LAIW8gaIBWsFHJTZSlqee3L4x4g9G2fsEG21RRoNoKJPM
         wDDmY8/jnx1G6Id0ejYRt6ZoUW7Igc40WoChEG+Kl2zmGKc8shwU3xz4vxQ+8zNxdKtG
         bIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdC8tNov3zNXni6SU6K2a+QG1lqQKSMsl/IZAoMmkZFra4gWwAE6GhYO69TOTTNTC2BAUtqcPrBCGm2dY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMok4DDsxKGb/MALRbopaWuFkMQX5VkqJWruuOiwNrftlq7kQl
	aPOSyxBAqln9PTlkOJpNKdbkSNcH496hKFaHxmTIGnGxJIbfUfSP52pfNVBJebKWjCWrDuk3mwD
	wGE//N9LuS+0SxEuxf4ibGqusqfEM0qkmyq8UcSmAOLZov8fe
X-Google-Smtp-Source: AGHT+IFctfwfFkMLSXWKissVysXhbwAhZuukj/l7GUQRUQP8VHt+M3bWpakPEOY0QFlU+31rWrfy/nfQ3PTS
X-Received: by 2002:a92:ca47:0:b0:3a0:a1ab:7ce6 with SMTP id e9e14a558f8ab-3a4ed26cc3amr47563395ab.1.1730334224191;
        Wed, 30 Oct 2024 17:23:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3a6a99c9259sm108935ab.46.2024.10.30.17.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 17:23:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DC5C734039C;
	Wed, 30 Oct 2024 18:23:42 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D5083E40A10; Wed, 30 Oct 2024 18:23:42 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Louis Peens <louis.peens@corigine.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: [resend PATCH 1/2] dim: make dim_calc_stats() inputs const pointers
Date: Wed, 30 Oct 2024 18:23:25 -0600
Message-ID: <20241031002326.3426181-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
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
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make the start and end arguments to dim_calc_stats() const pointers
to clarify that the function does not modify their values.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/dim.h | 3 ++-
 lib/dim/dim.c       | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/dim.h b/include/linux/dim.h
index 1b581ff25a15..84579a50ae7f 100644
--- a/include/linux/dim.h
+++ b/include/linux/dim.h
@@ -349,11 +349,12 @@ void dim_park_tired(struct dim *dim);
  *
  * Calculate the delta between two samples (in data rates).
  * Takes into consideration counter wrap-around.
  * Returned boolean indicates whether curr_stats are reliable.
  */
-bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
+bool dim_calc_stats(const struct dim_sample *start,
+		    const struct dim_sample *end,
 		    struct dim_stats *curr_stats);
 
 /**
  *	dim_update_sample - set a sample's fields with given values
  *	@event_ctr: number of events to set
diff --git a/lib/dim/dim.c b/lib/dim/dim.c
index 83b65ac74d73..97c3d084ebf0 100644
--- a/lib/dim/dim.c
+++ b/lib/dim/dim.c
@@ -52,11 +52,12 @@ void dim_park_tired(struct dim *dim)
 	dim->steps_left   = 0;
 	dim->tune_state   = DIM_PARKING_TIRED;
 }
 EXPORT_SYMBOL(dim_park_tired);
 
-bool dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
+bool dim_calc_stats(const struct dim_sample *start,
+		    const struct dim_sample *end,
 		    struct dim_stats *curr_stats)
 {
 	/* u32 holds up to 71 minutes, should be enough */
 	u32 delta_us = ktime_us_delta(end->time, start->time);
 	u32 npkts = BIT_GAP(BITS_PER_TYPE(u32), end->pkt_ctr, start->pkt_ctr);
-- 
2.45.2


