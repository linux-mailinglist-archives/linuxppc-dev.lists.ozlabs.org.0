Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763178F3B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 21:55:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rPB36fpt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcBj06Z8Gz3c26
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 05:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rPB36fpt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcBh85WCxz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 05:54:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C7A962129;
	Thu, 31 Aug 2023 19:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7EC0C433C7;
	Thu, 31 Aug 2023 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693511669;
	bh=4xBwQYrDYvELTUVIq5HoKyekNXLiRMNL1WiKGCIHSGE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rPB36fpt8aXiurhkM9PYEXHy+mON8p24DqHQ3HoO+zGOLNZtLX9v3tuvUUqk9XYfW
	 H7NwzRTGzmDlKUHFX6S9bMDtHVn9XP2notR++pRw9OOiVN3csEEMSc71Thw+GtblCi
	 n9HIrmiP5syeoV14aNdncQcBN6ekqOMTz0wfhVVUKwpuRhx+REzkYupEC2fttYws7U
	 1nm2vbJ2MWU4ayRjNbU57Z9ld/CCBjWHyynV1CjzYA12KRYgZ+GerlNgycnxySXMCz
	 52GHe7VnpoqzAJSOKcKK5ZQH3WwLUT1lJHcGibgSWe5VB7mGEoiSJRFQLoZp95M6eN
	 b8Vb5Bmakj8tA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3380C595D2;
	Thu, 31 Aug 2023 19:54:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o7in1iz3.fsf@mail.lhotse>
References: <87o7in1iz3.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o7in1iz3.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-1
X-PR-Tracked-Commit-Id: 85a616416e9e01db0bfa92f26457e92642e2236b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ad0a4c2343d3981e92df2b39fa262be62a9091a
Message-Id: <169351166885.26416.7613414703938254596.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 19:54:28 +0000
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
Cc: linus.walleij@linaro.org, ruscur@russell.cc, linux-kernel@vger.kernel.org, zhangjialin11@huawei.com, bgray@linux.ibm.com, windhl@126.com, osandov@fb.com, tanyuan@tinylab.org, robh@kernel.org, zhengzengkai@huawei.com, aneesh.kumar@linux.ibm.com, masahiroy@kernel.org, wangxiongfeng2@huawei.com, joel@jms.id.au, u.kleine-koenig@pengutronix.de, msuchanek@suse.de, mirimmad17@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, kjain@linux.ibm.com, naveen@kernel.org, npiggin@gmail.com, ruanjinjie@huawei.com, bhelgaas@google.com, ldufour@linux.ibm.com, hbathini@linux.ibm.com, twoerner@gmail.com, Linus Torvalds <torvalds@linux-foundation.org>, rdunlap@infradead.org, ndesaulniers@google.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, krzysztof.kozlowski@linaro.org, justinstitt@google.com, fbarrat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, gautam@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 31 Aug 2023 22:42:24 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ad0a4c2343d3981e92df2b39fa262be62a9091a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
