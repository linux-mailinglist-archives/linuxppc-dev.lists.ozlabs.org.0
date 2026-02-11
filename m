Return-Path: <linuxppc-dev+bounces-16796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBLxM+wYjGnegQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 06:51:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2712180D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 06:51:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9ncT3bgwz2xlk;
	Wed, 11 Feb 2026 16:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770789097;
	cv=none; b=EVjT3ChFlvyaA4XUifa2QzuZuqrPnWx4dUryREnzgm1dmMI+36rnHrHhmRHYvaUhiR6LVWUpZvTqOynCR3rtNKQhzryAdlPFHo0rUwZW653cXG6vu8rqgVYswFIf5RrXoH0prOd1tde6fWQuLplk6Bz/ovUGK1AI9C3jDxCs6qi9sva46jM1pzt5Pk8979NR6NwCl/tHf6QP3Q5s4r7GRzTOWoRn0lx+FHZ9X6Ek2trA5qogwUohOWNKijcjkC6/xiHdD+I9zHGERB+IgvvdLGzmZRczxSvO8DT5byr0W/5X+GoyGGK/57YDr5KibcYwjLUIqa99jI/12HyDlibMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770789097; c=relaxed/relaxed;
	bh=gaAHFSnBhRmiYL+IbKW0/BL1Pu+XIAxPhTaTmslwnLU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Agu6m/9mMN/zBX+RHxWr4vZaYtLbCpBCFxfaviBmqNabgkidvRfkztEhNiJvYEV0sKJejlPUQ0eHYlopD5K5q9ux7QgKCCb8vEB4sGk44x2qRkRVCj0NIWz6Vf/8bODHEttLjFoIozaZ1kJ9OOJL9HHk8rTXskkyu3DnSaSFSIFznjgc17a7Qq9rehDiRNSwiFd8Em6pUbHeDQl0srmUJROVV37q14jJ1aRDEZYEKAq0Wx4ora80KyCzyzIZ9Qlf8eC70jG4Dk0KIZDA0bNreYnh4WCvFeTaNFOyzykavpWGaSFhontYP1Q0L0Hq+jHBe2sIHOBvPPhmEsL/9wwamA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dg6yJJBT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dg6yJJBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9ncS6VR3z2xSb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 16:51:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4EBE43BD4;
	Wed, 11 Feb 2026 05:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA73C4CEF7;
	Wed, 11 Feb 2026 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770789093;
	bh=JN2Eq5W4y2MvKsgpKcoyfVwDU16mfF32ZMl9h/sEyZs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dg6yJJBT+impmnxR50BkRjSQv7CTNSrOAFv9YoLgpP0+9LCQzg5s4OVx919d+pnk4
	 CbGUVKgBxs2G6MldJoGIyORNX88H0pYlhXurxhWPhvUtP4F3Lgg0sGkcjIVnd2ao4G
	 2Zg0/tND1l4U37RZ3oaQwT3ZjtRlF0tBGpSzImt60COGir4oIarIeVrNma3/cvDRxS
	 7oy9F7gNNwrmHU13EP8w8Ja2DtLCGSLaZEidIWWdd9RW7ziEq9WYjztv3eSzcT+SEr
	 EpfAvkDf8+jEDh/WRQ0sq3fV2KELb6rILX05k7Q+F7mybhORxg95pJWfB9ID9LbVXg
	 4/t4HCT188sxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2418380AA50;
	Wed, 11 Feb 2026 05:51:29 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-7.0-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <bc20cf24-03ec-4bf8-ba5e-94dc3cc5c1de@linux.ibm.com>
References: <bc20cf24-03ec-4bf8-ba5e-94dc3cc5c1de@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <bc20cf24-03ec-4bf8-ba5e-94dc3cc5c1de@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.0-1
X-PR-Tracked-Commit-Id: e2071f9ce42b6985a40feaf98d2f5f7ce0fca006
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 192c0159402e6bfbe13de6f8379546943297783d
Message-Id: <177078908833.32382.7670456544164432360.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:51:28 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, adubey@linux.ibm.com, christophe.leroy@csgroup.eu, gbatra@linux.ibm.com, hbathini@linux.ibm.com, lgs201920130244@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mikisabate@gmail.com, mpe@ellerman.id.au, namcao@linutronix.de, naveen@kernel.org, nayna@linux.ibm.com, nilay@linux.ibm.com, nnmlinux@linux.ibm.com, npiggin@gmail.com, skb99@linux.ibm.com, ssrish@linux.ibm.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:torvalds@linux-foundation.org,m:adubey@linux.ibm.com,m:christophe.leroy@csgroup.eu,m:gbatra@linux.ibm.com,m:hbathini@linux.ibm.com,m:lgs201920130244@gmail.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mikisabate@gmail.com,m:mpe@ellerman.id.au,m:namcao@linutronix.de,m:naveen@kernel.org,m:nayna@linux.ibm.com,m:nilay@linux.ibm.com,m:nnmlinux@linux.ibm.com,m:npiggin@gmail.com,m:skb99@linux.ibm.com,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16796-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.ibm.com,csgroup.eu,gmail.com,vger.kernel.org,lists.ozlabs.org,ellerman.id.au,linutronix.de,kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: ECA2712180D
X-Rspamd-Action: no action

The pull request you sent on Wed, 11 Feb 2026 08:27:00 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/192c0159402e6bfbe13de6f8379546943297783d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

