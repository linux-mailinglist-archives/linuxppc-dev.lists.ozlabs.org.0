Return-Path: <linuxppc-dev+bounces-8114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F2A9F5E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 18:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmTXl1jZNz30D3;
	Tue, 29 Apr 2025 02:33:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745858023;
	cv=none; b=NPTr4kpjtdlO8f93NXSaiMFveeI8T2f9YU8dtuhDe8GXPqVIAhfJAQJapdfkO3SU5WE5locitwmQJ4mqF2/z1kwRPUXFB/gTYmPPYXdI37AStg/RIa1ShXiXShSbR858q2mpHQjZPj06efCT+njpP6nqAEmGPy+mxDKuuOpm/6nCGT32VxiXSJMLgVRi0skfipVfa0NB2rHNCPqcZfageIIVd9A/zlRhjZ+AkLS8p0FmDipzQAMdKPJPWQ3C6+TaKNwCSyJiwnbu7ifygo+oF9q43Nk3x6IOHAPiL6ldJuVQ/clPMfkY8d1Rrty2cYr2IL9LhcPu3wTGmfAWOi4ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745858023; c=relaxed/relaxed;
	bh=dCwC7sfq7+j/ssCKdn+vY5S0lEol4/TKCxELNg7QkCc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mwQYrkXiWp2ZAOtb1E/gp8TAw7s0zkLiXoJ2TfCgty3/dLe1y8ucDEayG/sJ6IIVMKUhDKpgBkUEfBV1UKQ9f0R2apUU58/8OY8A6po5yGClj8CtArOhfYng+qBFZGLFdgxguZ+wKxqyuqgM3pxYYSosa2u7CivZstXQtLaJkFDK3YL8fGnN4OSpZubGvpPFpl1OLuJ2tuL3PGDsbiYr4Un3igb43nwb8WXabN+iwvIw9Wh0c6ZF0IvS4StYbAqE9aEiwlRRbgWlxkn7dShEJBHdTLJIT8dggHgXcoYDu/drsQb9BSWZjSTR4QPVlMYKuyP9QsJaSEJxaOP+tbPATw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kqfLBTi8; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kqfLBTi8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmTXk2yN9z30CB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 02:33:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA08C4A7F5;
	Mon, 28 Apr 2025 16:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2F4C4CEE4;
	Mon, 28 Apr 2025 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745858019;
	bh=06W3RhuaA1KCx8LHfdM+UJUaup6l9lKuGtmqokMizFU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kqfLBTi8CDSPQFwMZsj6zXiXb8eoh7O7CtMgYdImfa4kq/ErFjPYrZKkhIWL8yPbh
	 Slv5cpgPwlA/OgIfSKXF1WaehbpLwJ08iMkv6FphvQlMd5+qCUwe0slQK8+u7hjgWi
	 JdEiuNfaSBxfAFLY31gWXlBTWNMDl76MnhMr+j4xalpnWmPQin/YIOScykm52vt7TX
	 81MgYv8b3I8Z8pppES+NyyoVqwPtiWs39pFyOT0pS7fUVtyxYGKu8CJnp19r1Ku09W
	 FQh9PfDy8GTGAC7lDFyg04lsXacNWzQmY67ofLhEdA50B6GXaw5xAMY9HevQblZeCQ
	 TIQ8k4YkSOlHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE3F3822D43;
	Mon, 28 Apr 2025 16:34:19 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
References: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-3
X-PR-Tracked-Commit-Id: e3f506b78d921e48a00d005bea5c45ec36a99240
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f15d97df5afae16f40ecef942031235d1c6ba14f
Message-Id: <174585805854.971006.13862543469827952448.pr-tracker-bot@kernel.org>
Date: Mon, 28 Apr 2025 16:34:18 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ailiop@suse.com, donettom@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, naveen@kernel.org, ritesh.list@gmail.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

The pull request you sent on Mon, 28 Apr 2025 09:24:19 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f15d97df5afae16f40ecef942031235d1c6ba14f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

