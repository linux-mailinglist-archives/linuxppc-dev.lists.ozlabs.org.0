Return-Path: <linuxppc-dev+bounces-17241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COzCDAkYoGmzfgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 10:53:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F041A3C91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 10:53:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM6GF48sKz2yFc;
	Thu, 26 Feb 2026 20:53:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772099589;
	cv=none; b=IOLfw8aE0JYxiVIunbsBj/zXtYbL7PM8QlEloJydVQorb4NYLEFXljw/KsU5fkkB5Y+I+a5hOTC+LW6T81Xz9tfok644UHevh3LH5UAiyepn/Qsv/xgRatlJa4PkI1czRky52I8x6NDBaXSOg5l85hEbdIUIcaJLsU1rIo3CIJsk8zrtA0yTtFqiUbevJEiKbcsv4+1MzvszIJAEMY+k8F4Psuz1KqG/GT0uaEA40+zkHKC56+YyzSEacVYBb1+NtN+22w9+Qdm9oOIpp5JNdpjwhkxGevQATMv/wTzZjSjjPn5CVU7J4e29JcSTkjFuIeh/NHliGEaoziCl4vaxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772099589; c=relaxed/relaxed;
	bh=x2hmAPdeq+yK4yox6gFwVhrtvKKbGXLa4UpDk8msuzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ThrxyBRJftETdoVaxh5GbMDBMKZtC0P2n7F7zMtVeleJF4/dFl9dXezFz6gStTJCjE3uT0VcItmHukdG5ix9WSRS7/FKVPy+KkF8h9PJ8cqMlygUueHLxRfF6mgglZ0ENWiI4n8S4Hne5oPBEXSRBTMouTSurw2WooEr4quAlwbEyQM47TZEkcYN7teLEHsHx0PrC7kc9EPL3Gkjfahw5zYYUSFzZL/sR9QttRg8bi2ota7xDXqsLFQ64y0ExlbhwLGOShV0I3T07efz+q6Zel/20l61qJs7v+u3MLtXaF2N4XvtKwCT1zOE71LIE1D6JGqzTFcyYQTsafz8m9F5TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKAl6+a6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKAl6+a6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM6GD5XMhz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 20:53:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E82D643DD9;
	Thu, 26 Feb 2026 09:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27A3C19422;
	Thu, 26 Feb 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772099586;
	bh=gOp0kpfXl5Pk7tntCuMPl5ytXJG2Ia6XHeykt8grkxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKAl6+a63YoKhP045GVfWx0jHVFXhW9LZJwtaG1W4eWc1goGV4M4TfPBoQAA6izqI
	 6WdQBpAv54eP1ND0tIBHQHI+GWfxGafuqN75FJ/POxBvVk+QceuIEnnd85M3egf5o3
	 pCeDonuhpqPi3Q5JsPNW71YAQT68YxFW1abLbggLEb7X7tezojU4W02K9iE8iBv9cy
	 VgBvu/TU6bNIYRIbEQ5QLvlwgl65/0WF9vYEMym0EF+pNunedprXYz4G1AGpCnrD0q
	 9yWeaUPqehQ2DxyUkSk0kvZgsTFG5PoBx2dLGHDyLcNtEmzEKx81wVi4YZWkCj0xCb
	 xFPIqy5iBsk7Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
Date: Thu, 26 Feb 2026 10:50:43 +0100
Message-ID: <177209938125.547814.7154250802402503122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=chleroy@kernel.org; h=from:subject:message-id; bh=boh47sxvFmCUdmRIsSFUJwcMqqWdfzkyZGUbgxkJCNk=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQuEC/5yeVfffBG5F+JDwyhtnLatdJqQmdfN6+451Eof /MXj+2NjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjAR5/0Mf7iP1Brdbp1lf/vd nH39+VdOHVs059/V8+df+0xw/dNbcmo9w/+s9i2MK73M59yteOu92Urq9mWZG9n5jhaLrF209+1 vSuIHAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17241-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:maz@kernel.org,m:chleroy@kernel.org,m:sascha.bischoff@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 41F041A3C91
X-Rspamd-Action: no action


On Tue, 24 Feb 2026 10:09:30 +0000, Marc Zyngier wrote:
> This is the second drop of this cleanup series for the fsl-mc MSI
> infrastructure, initially posted at [1].
> 
> * From v1 [1]:
> 
>   - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token
> 
> [...]

Applied, thanks!

[1/6] fsl-mc: Remove MSI domain propagation to sub-devices
      commit: 1fb7392ee3408494d4d62c09a8c3e5f5934caba7
[2/6] fsl-mc: Add minimal infrastructure to use platform MSI
      commit: 0c9f522f2d41c7e055a602a0d2c41dc7af01010b
[3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
      commit: cf3179b4e53f527aba9f0c6c3b921619c8adf761
[4/6] fsl-mc: Switch over to per-device platform MSI
      commit: 4a958e47c246fa3fb8954f4303e0da15ab3d026d
[5/6] fsl-mc: Remove legacy MSI implementation
      commit: 14b1cbcc6cec0b02298f4adf717646cd943b7ef6
[6/6] platform-msi: Remove stale comment
      commit: f0a2eac6a597268034fd40d92c1469182438b53d

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

