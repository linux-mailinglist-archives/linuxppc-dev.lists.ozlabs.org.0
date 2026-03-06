Return-Path: <linuxppc-dev+bounces-17854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNOLOapNq2lZcAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:56:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39257228228
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 22:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSKxd0PS9z2yFd;
	Sat, 07 Mar 2026 08:56:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772834212;
	cv=none; b=TeU7NIBcob8L1HdHjE+18bKjan8aU2VTZWz/zYATZ+RfUQx/i4B0KwmiF85cskI6PT8GU8uVDi86qB6iBluH5DajId8wXqktHPKE0G90b8Nu6HfsXh0VHF3IDRET+7GAZc2V5+hkdpW1MjN1Mexk4vbiEp3vdGesXBlNT0iReLaQGrKFu7TbE+YqCuHaZmz4vqO4pJSIpJWFoVgQ4qrBvYYbn6ofFjZYD17VKXQYmc3La77UrStqnSzElTRRvQOzfd3QA+0gnale7BpWV8luZiLleaxqfBgKyxW57mXYnyM0xMJ6CmBCSKke+lxnaFwxsERRMqW2wDwGE9j5GNzMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772834212; c=relaxed/relaxed;
	bh=EgqSeZ/zdFnchH9G2eRK1aSBQ9j84hqWx9N1k4o3+JU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NVJF+/Yq3GP9TyDfm6JPxpwHSOUPAZUc/CZR4+EdunLfQjatJUKlVcQSpoweJ7VHHBOE1aoA+TyMoVJ5cG8hY7Eo2F+nHg3fg8obrIxu/uvtccNCBJs7F+TT6+CduoR4/gISeoF/MPMrxUgtKZzo5y8LdPvODRJc+AS7gpXNigj5iDNxmmjfXMbiLtgJzGu+iBlGvN0OkwtVyEKALvOfJ6K3HvQ9FoMZB5J5K/g9UoWcsD5bP8Fm8zv+qBuo06gLi/vSdfG2dgHKRfeS6vgYGPEMEyDcCovNs5T6olF2WYz3kI6bmlL35ww4FpYjKpb2aQZ6qZ5YgnPq1cBUtGy0Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pynADD+N; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pynADD+N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSKxc30FLz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 08:56:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4531042A04;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1894BC4CEF7;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772834209;
	bh=ZKUAk3Py0MLvTnII3IjzjaZ48QiVaitPzY9QDZiF778=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pynADD+NMFEUI2F2rTrU4x0Jw3AfEjEFPOCrqTf81cJ+TGibwfYrLx+wxguHkHyWI
	 gSkJP4A5ai7BrOmmDHT5LhmBiOAbMvEdHxTEWnCeM0w9Q0YGwdgwP2TCaxF8fxRFO3
	 3UKJnYBmBmFFSFBJpbeBYUHpsY/ls7UvRXyekuccbiz2Q7lldcvq3Z7hbOWXjIK17A
	 v6SzbQzndHCRNKqZoSG7KGnrefbLsxQ1pcK3zOOr6lTUQKOBZh2D9ApT6w4HDS7Ym3
	 ZzwDTcYX90qaHdUYvs2xGdc2GjhRQWxsNScUsgw0UoYuQDq+wreMU79QDti+DzBbiS
	 4rqxtBR9Z3o6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D1173808200;
	Fri,  6 Mar 2026 21:56:49 +0000 (UTC)
Subject: Re: [GIT PULL] PCI fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260306212338.GA241358@bhelgaas>
References: <20260306212338.GA241358@bhelgaas>
X-PR-Tracked-List-Id: <sparclinux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260306212338.GA241358@bhelgaas>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v7.0-fixes-3
X-PR-Tracked-Commit-Id: 9f2c7349b2810c671badfc1adc804f711a83e420
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 325a118c12045239076b7ea9e66391dd6f56f72e
Message-Id: <177283420819.65918.18439522893056731414.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 21:56:48 +0000
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Nilay Shroff <nilay@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Nam Cao <namcao@linutronix.de>, Vivian Wang <wangruikang@iscas.ac.cn>, Madhavan Srinivasan <maddy@linux.ibm.com>, Han Gao <gaohan@iscas.ac.cn>, Nathaniel Roach <nroach44@nroach44.id.au>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@linux.intel.com>, Joyce Ooi <joyce.ooi@intel.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Queue-Id: 39257228228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17854-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:torvalds@linux-foundation.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lorenzo.pieralisi@arm.com,m:kwilczynski@kernel.org,m:mani@kernel.org,m:nilay@linux.ibm.com,m:venkat88@linux.ibm.com,m:namcao@linutronix.de,m:wangruikang@iscas.ac.cn,m:maddy@linux.ibm.com,m:gaohan@iscas.ac.cn,m:nroach44@nroach44.id.au,m:davem@davemloft.net,m:andreas@gaisler.com,m:sparclinux@vger.kernel.org,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:dave.hansen@linux.intel.com,m:joyce.ooi@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Fri, 6 Mar 2026 15:23:38 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v7.0-fixes-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/325a118c12045239076b7ea9e66391dd6f56f72e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

