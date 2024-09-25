Return-Path: <linuxppc-dev+bounces-1589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21AB986637
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 20:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDQ8w2f0vz2yMk;
	Thu, 26 Sep 2024 04:23:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727288624;
	cv=none; b=Kxw3y4zC3d4qvIlXhW1RtAvlThRYw9jAlI3R6q9jYtOTk5u4mCxr7bfkB+LTkavARk2NKfzwLLtdUbGiizovatIxm135+HyIlQxoRJMzmDKN/dLXO2b85fhcFPmHn9/5yfJCJqzc+mlw3igbtSECIPJq7xI4Y8FlHg6kMJ9vL0QRQpVlwbnX8Jly776eBuQCR3Ld5Z+IzqecaiQfMatz+oElGzHUD0TZ1vnmQz7NOVqgJ/ay+i1VThxePXpVMYLaRj4c5a75lQ+mjc0pB22hkiqS2LfUAOGCa1KmOOHjZ3Tj/Qaz3gkkjhlasr6DpzehnYRJNjWVtQ7XtL+IcZc65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727288624; c=relaxed/relaxed;
	bh=OJJuYIPUxqrw2TndbO80bRs4eMnG66mj2w70VaRNU18=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gLhjDPgAxPKoOD6p2CweaEMlRUUOLEw7bvzfuNUG6ECtUd7m9WCRDALjsKBaYptdQBUMECkw7x0/q6waG2BRj+CV4gaYNcPH0Bx8TlwW3qnRe70f4IqiEzXRR6lvTIthFB9T6ILlLZGFnG6OagXGy1Gt2c8eGz15ej+tssR/LvCUgdpdG4gdkZtUs5xf5fAAs3HemNQ75mrRC9q6+Kyf0cfwJxKDKOcoUTKNbgW4QD/0BCqcb4nTcfDH6uhOCpPR1mZSEBuYWK5yJImzB9WWB38j/MQtPFl9DpD/aqFI6mlZHM2VhsmRA4If5DAtEfFf8ZoOrzy809XxCejP9i6xeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IvEWHW4k; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IvEWHW4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDQ8v6tvbz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 04:23:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9896A445B6;
	Wed, 25 Sep 2024 18:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1D3C4CEC3;
	Wed, 25 Sep 2024 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727288617;
	bh=4yC3BGD2UG7DeOQV7XaJ2jf2pgDJZgO+NZf9LaD78GU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IvEWHW4kQahvID7vQ0Ka6Jq4ts7DG/dtSbPsDoCs6qjkbA9tLjXRfnqracsttz98m
	 o4cmTer6s8/6lnWK1jG6qN6mYfJLXCo2sWv5H2YfnENOQv8jh/Fd2EssE9slF0UpIf
	 nwNutaDMAJtnGTnAnMhZmnD6Xn3+R/kbky/SvlPXn+4lWyZ482pGfnhd6/PVezMelW
	 wO3Dc0Ge5AZFhqgjm/medKRCfGf6qocc1T/QBLtU601W6rnPm7ge7lhmCBzF+bw+Ec
	 JCRungXdWHW9kEN5c1cpHJPfsKKVYqUrnW39PbY8ri56MqkROLHfpT7yERLN1O3/Ea
	 gQluUq62BOl1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341473809A8F;
	Wed, 25 Sep 2024 18:23:41 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.12-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y13g10wf.fsf@mail.lhotse>
References: <87y13g10wf.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87y13g10wf.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-2
X-PR-Tracked-Commit-Id: 3af2e2f68cc6baf0a11f662d30b0bf981f77bfea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ffc45808373e32112500756d6f02fe56c42f371
Message-Id: <172728861970.682824.16261305010107069086.pr-tracker-bot@kernel.org>
Date: Wed, 25 Sep 2024 18:23:39 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nnmlinux@linux.ibm.com
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

The pull request you sent on Wed, 25 Sep 2024 20:30:08 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ffc45808373e32112500756d6f02fe56c42f371

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

