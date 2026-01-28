Return-Path: <linuxppc-dev+bounces-16354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DkoLTDteWkF1AEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:04:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7599FE63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 12:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1KCc6JPJz2xlK;
	Wed, 28 Jan 2026 22:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769598252;
	cv=none; b=G5IWi7aKdG9qIKC6C2GTftwZ2XOyjajEnt3aQzpHDNfHK4+yccCwJbUiZYUlYeqIeD1P+cGNux5lhAwai9YmslENVWTDO1Mu1Y5W1+Vja5Dpr6V3L3ojkCzOo6XBQ46nqRo6Smaz/mU+oP9Tl8DVIUNXZglIvriJlb1SnDI69RyUP/4T719D360yLfzuw/GHG1igrUvdxkCG1VG0LbvAj/Eu6Nu02yyrzF8kcybXuNvF8WJkF170LRQhT0NIImPS3lXaQkZgPi9AogV9lkpwk55h5XAV8sQVMHjA8Oz6z857yFmidLCjxsZdBRGqW7jqvI423JEb37QWUB3npyDSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769598252; c=relaxed/relaxed;
	bh=s7LeXVP7XAGNaq3kzCC9n1xMAwM3zSZ7L4N8NPlKf2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmKPVaDHuTrAVmfBwkIQfDT4Tnler0ZUo9o/1aXticItvlvR/HfqejmFbkBmGfGJ7TIUOdflk+sltti/05Oo3TIMS6Dk8y/yaIq7PjNApXQp5gb/XabTSMnrSV2lhwcTwe5O9E8gBe+jq1DnmtpRVl/bdjiIRn7iR9/zMNQ3FfkcLBjcvecxm8MqWGwMu87YfCeviWri01qSUpm3nGJygww4LLaYKgqf4zPeUKPKEvLe/xDkJ8haOzlhx3JC6ZYWFYfoGLJOf8eKb4jWqVYQ1Zb8ohZvCQ5t/sRSBCuAJ75y8Mgcb0vSWF/rN76dU1uFJg41B+FEh7sQzYzodkzERw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RkUk405v; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RkUk405v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1KCc1gTrz2xMY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 22:04:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E2956001A;
	Wed, 28 Jan 2026 11:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31454C4CEF1;
	Wed, 28 Jan 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598249;
	bh=g+DcgaV9vvajzIjNngoxQZBjOrt714zE+t0gjBetTQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RkUk405vHf2xBFoT/TUH5O1r0/VcIUy5lvckzSbRkQ5wmvNzLw/9bCxUsbVn5BDJ/
	 Ig8Sn6SwqT1wR9/FijXtQBpZzQBdx3uvq1AVBeNL82EKaRAgBJOdBQM5CzTtVn7K2J
	 yCx6nZRUxqj7+rRAcRI2G2sGn2CWpIRHa9G+tPl+XAgdYUB4a2ceZgpqimGHPJ5ReV
	 JkzAKWhToYM4q4C0ZC7+quoWk+yi7oSYEueF/zs+yYkFESlUYLEUtA07bxBCFCtxIo
	 EKSjgSTMELRCCrbRpiaxrPo1bBsnSmyz5/U6BThs2WP6WLiH0OEsiQ+Vl+wyYLUEPo
	 pqBJTTXh7Ffbw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed, 28 Jan 2026 12:04:04 +0100
Message-ID: <176959816683.2069840.8945134159377635375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=chleroy@kernel.org; h=from:subject:message-id; bh=XGgvbaf5H9k+ateqB29Q3mR73UZredPzMwVmw4XGytU=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRWvlU5F3urWPzNmlPsYTkWh2/ovPF+vkpiKi+zdejEI 0HS8w2cOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEvn5mZHh2d1bp5UnpBq4B LW6rlqz6VfdIquXBrdC5H1Yv1HZRv3SCkeFNa9Svrk2rHq0suegcUaAu9VfmfYDsKpfszhwJ4/x 3+TwA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16354-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9E7599FE63
X-Rspamd-Action: no action


On Wed, 07 Jan 2026 17:59:09 +0100, Christophe Leroy (CS GROUP) wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it so that those IRQs can then
> be linked to the related GPIOs.
> 
> [...]

Applied, thanks!

[1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
[2/2] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

