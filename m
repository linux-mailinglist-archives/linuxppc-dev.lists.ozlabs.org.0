Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60231744126
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:24:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/6BTFen;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt2J022qZz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 03:24:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/6BTFen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qt2H43t8Bz302R
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 03:24:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3B70618FA;
	Fri, 30 Jun 2023 17:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D39DC433C0;
	Fri, 30 Jun 2023 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688145835;
	bh=4KZpDBMjgtsDbjCKv/Gbyt2RHGrPJMISMi8TtypstTw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A/6BTFen1JqA/6VbKwB8ojVdwRRmwPB40u+7GblrxXhQwxZXwXswT6stNKOAipcMX
	 vSrDbY9Vu+1SfuLRNXh9nyK3RSoXOnKBZmmCZbKRxEfGysu43/tB8pwQMAsNnLWBW0
	 EEAq5uyc8KaN19ygmH4CnwMkCRTM0urxjnJgPFhIerLcPUPg7tKS1Gv1jEOTjiWFva
	 rS51hN3PCHl019MRQHDNlJ5Rf2m9IJo5JxS2f/pYJUNg+ZNsjJSblWuLVDTcBDdYWS
	 HnO10dN2MeaUcI/FzyvnOHFyRXkqi20dJBtFuvzrQhOHz6aoR5r/TozLV8621GY8ni
	 xryCE7FRPw1aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07E18C43158;
	Fri, 30 Jun 2023 17:23:55 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <877crlgrdl.fsf@mail.lhotse>
References: <877crlgrdl.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <877crlgrdl.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-1
X-PR-Tracked-Commit-Id: 54a11654de163994e32b24e3aa90ef81f4a3184d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d8b0bd57c2d68eb500f356f0f9228e6183da94ae
Message-Id: <168814583502.9404.7781714394572409298.pr-tracker-bot@kernel.org>
Date: Fri, 30 Jun 2023 17:23:55 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: trix@redhat.com, jcmvbkbc@gmail.com, bgray@linux.ibm.com, adityag@linux.ibm.com, robh@kernel.org, arnd@arndb.de, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, nayna@linux.ibm.com, jarkko@kernel.org, geert@linux-m68k.org, joel@jms.id.au, u.kleine-koenig@pengutronix.de, naveen.n.rao@linux.vnet.ibm.com, colin.i.king@gmail.com, elver@google.com, gbatra@linux.vnet.ibm.com, naveen@kernel.org, npiggin@gmail.com, rmclure@linux.ibm.com, paul.gortmaker@windriver.com, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, tpearson@raptorengineering.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 30 Jun 2023 20:45:58 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d8b0bd57c2d68eb500f356f0f9228e6183da94ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
