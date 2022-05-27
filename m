Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9DD535721
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 02:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8QlG151pz3bx3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 10:33:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHo3LrnI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tHo3LrnI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8QkY4Mpnz2yJF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 10:32:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AA4D61D2B;
	Fri, 27 May 2022 00:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 970CAC385A9;
	Fri, 27 May 2022 00:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653611569;
	bh=EJ+M0UolvZcc5eCQAgbviCxSXBshGpflKucWZ7mnGQo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tHo3LrnI51gUIj/ZnfKNKaFaNtt0PdZ5Fe3c16jpOyAlouTJfPNwrhsg+ap52uevN
	 d2xTlqYYM/sxFABChVLYEyRRy2bNElZ7GMVeedGsBo4uwp+WCV48mGHDmuGsIapUD4
	 UJkjTdmDWsGsJyZck+IBl6tjr3Q7iByptjIjUf1/YL5To7FiSBmJoLnGfSjLzhplK2
	 IlP1mklaWfR4i4boxw+YOvyamklaE8u6HnRnUEBNfC/CDLxAUEoZFysCzI9iqCUwzw
	 ddip7kmvhE3bZP0CHgBk39ji6KDePoNGULCSh3/rnITh+ZZn7nNezEUAnXelgER76p
	 QGXYQg7VV0ybg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81278F0394B;
	Fri, 27 May 2022 00:32:49 +0000 (UTC)
Subject: Re: [GIT PULL] Modules fixes for v5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Yo6kboq8M8nUwy45@bombadil.infradead.org>
References: <Yo6kboq8M8nUwy45@bombadil.infradead.org>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <Yo6kboq8M8nUwy45@bombadil.infradead.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-5.19-rc1
X-PR-Tracked-Commit-Id: 7390b94a3c2d93272d6da4945b81a9cf78055b7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef98f9cfe20d8ca063365d46d4ab2b85eeeb324f
Message-Id: <165361156952.27205.7644773907998918342.pr-tracker-bot@kernel.org>
Date: Fri, 27 May 2022 00:32:49 +0000
To: Luis Chamberlain <mcgrof@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, patches@lists.linux.dev, Matthew Wilcox <willy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Song Liu <song@kernel.org>, mcgrof@kernel.org, Aaron Tomlin <atomlin@redhat.com>, Keith Busch <kbusch@kernel.org>, live-patching@vger.kernel.org, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Wed, 25 May 2022 14:49:34 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/ tags/modules-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef98f9cfe20d8ca063365d46d4ab2b85eeeb324f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
