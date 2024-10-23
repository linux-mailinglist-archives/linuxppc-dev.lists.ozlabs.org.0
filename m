Return-Path: <linuxppc-dev+bounces-2509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27C9ACC7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWjh2QJyz2yvy;
	Thu, 24 Oct 2024 01:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729693976;
	cv=none; b=MIbLFx3KbFOh81FqrlhormT/YVmvpB6/aMCdGnWWHQh4JjXmZKtK+ED6Yb9tNhahEONK9N0xhCrebn8uTKco2U22sG1R/8f8ZBWA/QyTrTzCRpoZoj9GTqdNvDWeyZgX3YRL3MONY+MTwgGM/Tn8TuhfSfry9RVdB+1itH4PNSR6nkYh93uLloFyu3aGxFC6uTZEvuR9Vw5EnAdMrbwQBp7nESKjCRpiU8LX/uYwq6p3vQ2xgo43SepLwlPiq+yMLnGScEd1PLnmTBTJmCPh4q+Cv3kQKzKpPycHmXh+0n1jT8/W7bRXCoQv96jN0KqDCsn4iuop5SpiqeL2j/qHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729693976; c=relaxed/relaxed;
	bh=/vNDGmVSykuoXpKdU5vptxDPeVgLBU6nXN581vIfIUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrVXuah57FpINvVy99vH0N3VlpwRx7+WQAljD60NsLgpFo6lXHufS3NeWkzk1UGul+GVrJteKVDK1cceKKwcAb6vlbnZTpvuDfKnjymLELelpbQqxV2EZ8/dyv4iASBOUEUYEGQarCrlfsQbmGQaR95Ji9FBJJmSgAFOyw2ph0WP6zyOIEEl1to/EQ0ImhiH27AWq4VGjXira2lRZRIlpuuUgyane1Mfs1shkKrd6KNdKp/1FuwjK56wvk6f41AfDja8uQxIIOWQ3+23TWON3UCvzWmSGQKt4/PQRjeiEcrfvnuCKikgT0qkTGRAyWmvoRiCSJd5zbi++/26Dif1Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7MN7GM0; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7MN7GM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWjg3m3xz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:32:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2852A5C3FC8;
	Wed, 23 Oct 2024 14:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872E7C4CEE4;
	Wed, 23 Oct 2024 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693973;
	bh=01iJzfdSH5shmcZHj4nicWztDj8kW1x4F7WtvsSjWJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7MN7GM0ITXYJ6hGuX3ei4MHvLbhU5m8ykNgx7Nth/DYLYVt/zNh/mGIKc3PIwCF/
	 HoREnQRs2kivX0eLX6yWtyCOu4JGsfo84LEbduH7dWbdETBUtgoUt+NVR2icRXyigh
	 r4VFo3V9FH+KtlX7BecxFRdiioFwG3THlQU+WWM54Lz2c71xJIgL2Ab1kPkR7lcUZM
	 5vstDvKEjbHn6CgXd38YjhAm6lSVi/3SKtavDAUueKKRAGRhRpKcRC9CX8fjZP5bmF
	 Rl7Ye1B93BbdpRsaDL09kilE3kG1jr6TOQ/99H66z+/jik6S/BPDYVOoqV9jcbjSzZ
	 ewNfEX70Je4xw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.15 10/10] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:32:31 -0400
Message-ID: <20241023143235.2982363-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143235.2982363-1-sashal@kernel.org>
References: <20241023143235.2982363-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.169
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit cf8989d20d64ad702a6210c11a0347ebf3852aa7 ]

In opal_event_init() if request_irq() fails name is not freed, leading
to a memory leak. The code only runs at boot time, there's no way for a
user to trigger it, so there's no security impact.

Fix the leak by freeing name in the error path.

Reported-by: 2639161967 <2639161967@qq.com>
Closes: https://lore.kernel.org/linuxppc-dev/87wmjp3wig.fsf@mail.lhotse
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://patch.msgid.link/20240920093520.67997-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/opal-irqchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index 391f505352007..e9849d70aee4a 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -282,6 +282,7 @@ int __init opal_event_init(void)
 				 name, NULL);
 		if (rc) {
 			pr_warn("Error %d requesting OPAL irq %d\n", rc, (int)r->start);
+			kfree(name);
 			continue;
 		}
 	}
-- 
2.43.0


