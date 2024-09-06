Return-Path: <linuxppc-dev+bounces-1136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D2896FCAC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 22:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0nqY0Rr5z2yq4;
	Sat,  7 Sep 2024 06:28:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725654505;
	cv=none; b=Yh7iXmdqo2Dw7L2j8KW7X4oh8L/1Cc0h1ERtlfE1T6QnYmx3IRPOhPMF9pjrrRH6K73X7RSUcVG1AofrGEhUA4BBnOq+7q0ZJ37kG1PG6OXM65KP++EqjICAajRtIJUOmnNj1fJLNc+H0Lou5e6IYaB0PdaQ/DKGFrrj8NPUiCPYbr73kJFF11HZfZTjvU5k5XF8NBUerDhWNeXsDRlLj75l8XBwwKFwsB273G5ttA9JNfTtVKvphbrxG5367+03me3LzTasjL4xQCf6X+cHIz2Z9aJLe8UZ0ZthpGSQgTw5q2jA4iALEF5+8YkfGFPIeuoJgB/CqvXqnyt0PtnjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725654505; c=relaxed/relaxed;
	bh=pwds3VXoOGDUphXZ6Kktp0mmF33MpLA4Zgl2tDkPXyo=;
	h=DKIM-Signature:Subject:From:In-Reply-To:References:Message-Id:
	 Date:To:Cc; b=N6QZCxx+ssKUcVI242SDdwFqPWGIpQeGAriSlUx3L6u4I23Lj2VbzpZPii2MqGHB7Jc4tmIkMOhMjM0kFUql6PGucWLC6nnYWWpJJyNoIt0bj17NlfGgukCZAeIFwpgkmrCqEIdaRwrB6PqfZyjf9HplzJGsY8gHZMnQoDhxtBniiR6ZNY7DE/4PAkIDHk8IVaLP2hXv9JnUGQIkpQc1DpyAMhNtKPR5xnvfPug7CQZ8RUaGGuVm1+KaKT6KJ4ytZWSlxTuYAY08x42yBmNhDRbEYNxB76lQcy7l9fdumRzyjpmUXhRUfu7HO25iLB5gNQetHyQCVAWLeIOryWu61Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiFb6S7u; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiFb6S7u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0nqX5sMpz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 06:28:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 293BA5C4A54;
	Fri,  6 Sep 2024 20:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51445C4CEC4;
	Fri,  6 Sep 2024 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725654502;
	bh=Em/82/sxQZ2ZmxxfBQmS3rxR/qbFW9jvMHw+SAgGsQ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QiFb6S7uT/pHGuLOCZ4rpis9UhTIbgvhbTmokCJO6X2cGbE7lJFNfnlpkjh6/BnZt
	 MSq8AIdWglyquZjSQv925ElXx8ENy1RnQabhxqbof0UUpy2Sysa1boGawT6cc2exLb
	 6GDgxEteXcIl3FVRglQBUbZQLaCJBWFzaZhD8DKezEUlRZ/ZmRUJKqjYPS41QCGa+h
	 qNY0ebEsKafMW8Kg+oYmBhYjMZ84+hYo+Tb4Od5uqeeSLOg474PNMQ3/wdmgIEuWxx
	 iygURoNYZQhlm3XLCDhSh/PhxtFdy0UPVFij3kUsYdokuQlczUo8VBmCxJgHzdJ5e4
	 5pCZpj1kIWYBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 719573806644;
	Fri,  6 Sep 2024 20:28:24 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ttet3rz9.fsf@mail.lhotse>
References: <87ttet3rz9.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ttet3rz9.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-3
X-PR-Tracked-Commit-Id: 734ad0af3609464f8f93e00b6c0de1e112f44559
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a78d7dce1e71231cef671ccf5ab48b31606fe352
Message-Id: <172565450306.2515438.2687222332316048321.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2024 20:28:23 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Fri, 06 Sep 2024 22:07:54 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a78d7dce1e71231cef671ccf5ab48b31606fe352

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

