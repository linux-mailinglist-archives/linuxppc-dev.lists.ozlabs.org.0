Return-Path: <linuxppc-dev+bounces-16353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIv6C5/seWkF1AEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:01:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE119FDF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:01:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1K8p2VgXz2xlK;
	Wed, 28 Jan 2026 22:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769598106;
	cv=none; b=e0dbZ9wf3sjvy/cn3Hq0ilYba64E5lF442p8fIjEeIEfbkU3Af7A0TehtzDw/oJMBf9tM9/ks+F/EV4jmMtpb1hjEbMvWwYN1n916pxXNzMGX6p3xnCrRhACmerl0mv8ILb3JLutTANKzPf5s9/C5l/vbPRl+zL8aIPzNhoDBLYSiLNhUasnloNJjoRDbB7KGtO0mU+jAKsFjpq/Np2Aw7EpJkgjHn1c1Z4+RKpMgyv++lXFNYKJvpdZgFx5yCO7w72dvnYf/tTLfdiRMqtX2ErpxwsW7fuqARg7zr8C3lmOLPCAO0dA+FYGZUYF7cMfaGLpD5vfSoi1N7ZPoQ5HBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769598106; c=relaxed/relaxed;
	bh=YgY+VD1JPRIDshJVjlRkrGjJN6ik2chDgUKnN7ZWi98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TP06C6uQt+Y5H6Fjf26obBk5ndXXMQf/SZR40oAUD7KyjMnT4IvacbxBNs+u+qXav0/+7fbBW8V2bt8QoonY/62fLTZXQipbl+0bKDv5kHn9DzFfLg8xUTo7v1CXsrNRgJxy38oW6OyjYENri1NNSQDMbGFdBo+QZYsGPANGpwdJjX4w/7z2RW5rzCj3L8I3MG9h+DoAgvPvocV4RmHCZnnvvrChFC3VXg/ZG5ca+NhRxpabhto5fmUP0Gya24ZT3evjxZaUsCnbLHOdDvW29iFnGJH9xKVfpwOmP377XMkcWCGurNN7UxMAx2hW8xAu528IUR2pqJFjw8xjSY897Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nU96+Ytt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nU96+Ytt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1K8n4cLGz2xMY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 22:01:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EB126001A;
	Wed, 28 Jan 2026 11:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE88EC4CEF1;
	Wed, 28 Jan 2026 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598103;
	bh=Evsupp5FNJNP5BJNiK4ytm0+NzTNTkn2FDzFf2nf0vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nU96+Ytt+ws2tZy7+KxRNVw3X6ma/ZHPFb/GoBAVnFO3hzbWXAhddEUZLa/xcGPUJ
	 wmXuVAvL2U+xRcF+9HMsZnJS1wxUkQDWg+YYTrnYGNzpr/0v6uFN00piaNa6jaGGB3
	 v4IxiJVetEcjSCWfzlCxx00FJCxBrwX527IRf2p33xBztV3ii8+9ddAZGl2eg0u6RE
	 vj98QEskBtxXppCcORfYrKmuBoNB7BKW1WgmysuikAxe+YDIQfeozDqd+jO3XmT457
	 CzLnoGqa1+oEpn1dwPwyUPulT++RFOK4v3Upx/OoxVrtSjrBPsXoYouJ+kK8iWkMvX
	 wH4DEylcBcedA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: qiang.zhao@nxp.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove
Date: Wed, 28 Jan 2026 12:01:31 +0100
Message-ID: <176959784390.2069162.369898481051336357.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260119055715.889001-1-nichen@iscas.ac.cn>
References: <20260119055715.889001-1-nichen@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=chleroy@kernel.org; h=from:subject:message-id; bh=K9TS4tuJrDcMF5FTNg6KgLVB8p+qHIx8ZqaAHWUIO10=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRWvumxj483P6ueMo35k8g/4/OP/NWV1R48sr71USYvK /oMg9K6jlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjCRw4sZGaZcWl9c/Yj/5Lrf i9J+hS7J3sxXwmnlPHlN8kdP84f9YesY/krVrf7DJmjZPHvb5qmK/+9t3c17pmLrYcPGpBR+hqO zjBkB
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:nichen@iscas.ac.cn,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16353-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EDE119FDF1
X-Rspamd-Action: no action


On Mon, 19 Jan 2026 13:57:15 +0800, Chen Ni wrote:
> The driver currently sets the handler data and the chained handler in
> two separate steps. This creates a theoretical race window where an
> interrupt could fire after the handler is set but before the data is
> assigned, leading to a NULL pointer dereference.
> 
> Replace the two calls with irq_set_chained_handler_and_data() to set
> both the handler and its data atomically under the irq_desc->lock.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

