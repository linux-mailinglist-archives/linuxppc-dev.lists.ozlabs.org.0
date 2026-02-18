Return-Path: <linuxppc-dev+bounces-16928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP/wLhPElWmTUgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:52:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F94156DCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:52:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGHxn4R0qz3bp0;
	Thu, 19 Feb 2026 00:52:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771422733;
	cv=none; b=Isr7A6eHiVipJJj4eo3cSd8DaboVWtODlRqgNgY1RMM+ITamu0QuvNk1kzwId5WE2nbRnKApHrsADlGj7qdwDhVraFfTbEQMqZ2EM3ZHERfZVodIHwF62XRJegMAtThymdDEY6lWhG3pMim7BmDuG8/qtUiANiEW55nwj3gdnwRLgChdL7QDVTNlnSVxR++n2+ReNZEub8+uIcz0N2NSNRg1BnmTmJCBXvQlRKiSiVsPH7s4zQOUs1w/tKpU7LN925B2WgWLQyGOVFhPe0dJq6ERqKaqaSOEER0cH6WgNWXDO0dmEUqB1ST1DxwjGyD8ptGsLe4/GIY4FQunD/qsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771422733; c=relaxed/relaxed;
	bh=T9SH7wamcwVLDL0yzNqtHzIgC32rpc3V7NQFnp2ofOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2RuOQ853chxe7vN+YUxc14iRC21A7RBDbxwbrkjtP+oE/yJ2lz5G0CPU+rQ+3r7mHPlLBgmeOm6OqlkHbHqU6OfFZs6smxrskGVMuMJpm97Uv8ZuEwATgGlipYM3hnxZiwBlVukD5i2Y59WVEtRJTHgUP4+PVdaj1zush2NJ/ZINvnqWbWPBgd8RXTIpSf9YPm8zZnJ8o+c1aYEesR7TEW3hnZF7+IxEOUJL3Wr5ExTAAHogT0Z33jklH7Bdl7fIyoA+hSTXWBFuk0/JMjfAP30rrrlJf6Fjyk8hf76HWGxH3dVN2x21s7Nxkhzj3soNd7g/KLcs1yviVyQmjid4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TJ01R0Mq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TJ01R0Mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGHxl5zLPz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 00:52:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF47E42A14;
	Wed, 18 Feb 2026 13:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91B7C19421;
	Wed, 18 Feb 2026 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422728;
	bh=wW1CjkVGdPCI5nAplOtLFmAfLiASoIoaGCuv9cOD/xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJ01R0Mq4pmoyi/IvFpH/J9+/Z2cR40nBu3E8CfOlHDfE1aARDuwdW/16Jwtz5tk7
	 SIt+tUaTa2x9YN/FcsSRUSlHQBf2F2Q3okf5fEkHHMEpLUwbbqmRz4q9qSXUxYtMdt
	 4IPRHj9mt7k1St7HAsIca6q0kfAEOT6B/yfImeyfq7hOKX3zII7bxAz8TGRmJCO6QK
	 oSic7PZAIjH11i3bhdZr3+5kM+qeayZ8PBQ6k/+BmCO5+vBU6N/Mc38ggZ+66aGmnS
	 anCC196uEzKht5JCjQB9YfpvCDXID9ILoiQe4b3+9rweQB0KPHzAcUL6eqiINqH8Wh
	 cm1/+q2Hg5A7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyI-0000000Bu02-3spy;
	Wed, 18 Feb 2026 13:52:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] fsl-mc: Remove MSI domain propagation to sub-devices
Date: Wed, 18 Feb 2026 13:51:58 +0000
Message-ID: <20260218135203.2267907-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
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
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16928-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 54F94156DCF
X-Rspamd-Action: no action

Only the root device generates MSIs (it is the only one talking to
the ITS), so propagating the domain is pretty pointless. Remove it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e5620..b4a47e6956bf2 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -865,14 +865,12 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 	} else {
 		/*
 		 * A non-DPRC object has to be a child of a DPRC, use the
-		 * parent's ICID and interrupt domain.
+		 * parent's ICID.
 		 */
 		mc_dev->icid = parent_mc_dev->icid;
 		mc_dev->dma_mask = FSL_MC_DEFAULT_DMA_MASK;
 		mc_dev->dev.dma_mask = &mc_dev->dma_mask;
 		mc_dev->dev.coherent_dma_mask = mc_dev->dma_mask;
-		dev_set_msi_domain(&mc_dev->dev,
-				   dev_get_msi_domain(&parent_mc_dev->dev));
 	}
 
 	/*
-- 
2.47.3


