Return-Path: <linuxppc-dev+bounces-14798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8CBCC1D7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsRs4FDZz2yF1;
	Tue, 16 Dec 2025 20:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=94.100.132.254 arc.chain=hornetsecurity.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765878185;
	cv=pass; b=XVVSmIT94bVfFH7zaPBDk8EEi9o3wX0iBA1PePk4ZrEokpAPJiWysR+kAT1+gJYzhUDdnuPg8kaQ8+8COz39F4m/lId+zHJpsDFmGNlupojFAQ7NS/rbeFJDrUyZYwLPUddTXKYAy6f7Aj1fBr/APXv4C+qTDH6zLP2aYZ6cbbXstHowTK2NH59k8qUJN/0C0oD9QEPoxoYkQpY0lYyIMXqtaDpPY61zuXE6/u85N34CmOKUwwgxi8i9Ur1EC8GjoV3FQJndbbUR2NW+i3iVIL2hYvu4xiOU4thrVI6UujVLsUAgW4pdylCI1YTV8TApluAj1CcALRMPHRsbCe6x2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765878185; c=relaxed/relaxed;
	bh=Pkc/gLz9kLB8qCYf/I6OZ0Fsfo/vuRi3II2eQE+5I88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZ3BsA2EX8ofesPmseSf6EI/ZXBrOFseeOGokYpkiCNFbtCrJwvwGo5AJf27P5oDOYEFcs+TMeQOnAWurXk06m4fPN/g9HZB7WvJ97kOnIOfSm5p2hODj/vQkS3YxbsGtDSkq+yz5HB5o8Yc7uLVsBxJRVieb5af67lWSzR0q6aLcElD2t19pYN/wLgbcecTHdzAUIIjdCgObnNtSQbtvoJ+Y51ZElikR7moX5CJcPZvjKJHvFGxGq8CAQEIZndkVz5mI1km4uR8jrtEginyuXAymCve+g/DhFn0Bfz2PnmfHysok+29Z9WO6l3WVPQEfOFdctcx25o+AasoAHblyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=NhVwV0pG; dkim-atps=neutral; spf=pass (client-ip=94.100.132.254; helo=mx-relay87-hz1.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org) smtp.mailfrom=ew.tq-group.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=hse1 header.b=NhVwV0pG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=94.100.132.254; helo=mx-relay87-hz1.antispameurope.com; envelope-from=prvs=04384a72e4=alexander.stein@ew.tq-group.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 109 seconds by postgrey-1.37 at boromir; Tue, 16 Dec 2025 20:43:04 AEDT
Received: from mx-relay87-hz1.antispameurope.com (mx-relay87-hz1.antispameurope.com [94.100.132.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsRr2smtz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:43:04 +1100 (AEDT)
ARC-Authentication-Results: i=1; mx-gate87-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Pkc/gLz9kLB8qCYf/I6OZ0Fsfo/vuRi3II2eQE+5I88=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765878060;
 b=UkCshZXV4RTiZlDGRylV+HYlqeR25JAtuFdwJmGKn57x7F1RVYdLpG+kViNKt0ErTCK2KKDP
 snKVQ9BDEvShbCIC0Cuzb+BNBcFy1tVlgVHbSYsBmG3vAZLeRGqKiAW4R+UE/4geb7ORG2DMUCB
 4zjmr8/uk2Lbeey/a/KAnVxhe/sUFARlOk9ObWrflF7rm8wHZtOvTI12luKPF8J80Ai6mkCIqHk
 hWfSCeQ7rMdKrpJUhuFBMrOOW+PcggqAa0dGodXkXYiCXv6lWyT7P3bNFxjAGXxm7xEueP7RaLQ
 PF8CM+1m+FxYl1KyTMpwCDuLfDQatzEUV8CYxvyLsVZeQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765878060;
 b=e2byDDgCjyb5iRHtcF1G7mnqkoyYfYG3RUofDVsn51RBlMjs1/sQW1ybY1GwETvEZWu9HlVT
 /qlHoxeXnHPYUPjf/CsLyzzyNKQzkQysts+bLJoampwHfW95y5kWg00dDiloP8TjzVUqqtMsa3i
 3ZyjSE8uslw/HNCr9dzLIIfECBwo7DkVnXq9daN3KfHVsXjfYFbCwGFt0rQ/gPs1aIbm+bvwAqT
 B0YC/NavaEkcUSVeCyTOUbc1KJiXFT0jZb8BvtjRdXkF1unOC94qZzyY/ie0WEhWU1iMGc/2T+c
 2tkoZAfCq6pJaGyIjh13HeeyrRzY96nfaU3sR6310iMdw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay87-hz1.antispameurope.com;
 Tue, 16 Dec 2025 10:41:00 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6A8BA5A0DF1;
	Tue, 16 Dec 2025 10:40:47 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
Date: Tue, 16 Dec 2025 10:40:41 +0100
Message-ID: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linuxppc-dev@lists.ozlabs.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay87-hz1.antispameurope.com with 4dVsPD0WvRz29h7p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security:scantime:1.833
DKIM-Signature: a=rsa-sha256;
 bh=Pkc/gLz9kLB8qCYf/I6OZ0Fsfo/vuRi3II2eQE+5I88=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765878059; v=1;
 b=NhVwV0pGvx79usB0D5HHkzht3GqGx1RnB44xiR8SRJMRBhE07igz+xtW6FqMNawwJ4Y5KQsD
 VvLrDOuMEdwb13O9EEKhnOKFBg7MEqWzSXsS/R82kzJyEVJg2uWsBL/UkUPV0/HCritM807VICF
 IoD1/Ic1X2bxlkw6KHj2YimzUSxjy7SAIdf9QCryuAmz4S/9zhZPXgfAtVKDVECr8wb82sB802w
 dVRw2X62vLb9+dMHUn7TqcEZyZ5JshzvQsy2VYp7IcEZT70t7Qqvo6bHsWuUpUIuuwdXbBt7aE4
 R1ITPBF7LSHJZ1MYN8vjgzs25fWKZxQ12qEhqHlVZcoEA==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

this series fixes the error regarding duplicate debugfs directory creation on
TQMa8MPxL (imx8mp) when easrc is enabled:
  debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'

This is caused because fsl_easrc adds two components which use the device name
as component name. Debugfs directories for each component is created, resulting
on name conflict. Fix this by adding the debugfs_prefix for both component
drivers.

Before:
$ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
30c30000.sai  30c90000.easrc  HiFi-ASRC-FE  dapm  dapm_pop_time
dma:30c30000.sai  tlv320aic32x4.1-0018

After:
$ ls /sys/kernel/debug/asoc/tqm-tlv320aic32/
30c30000.sai  HiFi-ASRC-FE  asrc:30c90000.easrc  dapm  dapm_pop_time
dma:30c30000.sai  easrc:30c90000.easrc  tlv320aic32x4.1-0018

Best regards,
Alexander

Alexander Stein (2):
  ASoC: fsl_easrc: fix duplicate debugfs directory error
  ASoC: fsl_asrc_dma: fix duplicate debugfs directory error

 sound/soc/fsl/fsl_asrc_dma.c | 3 +++
 sound/soc/fsl/fsl_easrc.c    | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.43.0


