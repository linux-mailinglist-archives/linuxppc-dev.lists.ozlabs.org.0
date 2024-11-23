Return-Path: <linuxppc-dev+bounces-3524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B89D6AE4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 19:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xwgxr406Gz2y64;
	Sun, 24 Nov 2024 05:49:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732387792;
	cv=none; b=OYO4KJNLYYpp9aMoRYwpy40IA4eUAMLZ4Mzd7aGX5zNHWDqrjtExbAWyi7T1l4vlc1cXo+OebbUd276VRSQMNYzs19EKPJzU62ncASalS3w0y1Igs9zeT+sI1/FaerDpZZvuDjnEki1v202wm6ojtRK8QQb0W8SGjinFs7jbG015aqPJkOq6k1tJZLaElZ+Q1f/qa52b4pZi2ZCNPfekrcHYaXfhWInhpvEaoOFkTCjDfkESTtnAhVDBKO8HKUcG9JUCvy0gzSibpNCgQyqRF7mGT+IDZi7roo61zjm9kHHvCFxlbxbsd3L9efgH9WM9YPNYiC38GEdcypZm+8Le1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732387792; c=relaxed/relaxed;
	bh=d4POj18OyYA08G7nqkh3D+3FOMMO3obnPJjLZsUWBWo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fKHbAFHw7+MRaONtnWOClVL3LgVxC1bmjrSsUpcVHnIvEANEVU0Mn9DsFL+36yDfdcbJdYlIkG+R+hRjZwhxmbmOIswtQ702otUCL5vEJfpF2E7LGLPGPcNvxLj+WmJ3fHp2Sz5IQRj/Ncg+P813dbfpPp1iq86jxc40eNCycmCpHg2oRbD+5zn/qW7Cv2/+FIFDYTaSKWUJw6AYg+jVizkazh1gPJB4GZOvpGDpv1CETnnrk+MPfEMLejSTLIYtjc44+HF9I33wdyGCIN2u+0wkJQWKQWmbID+4gmLTC/kt6ztB/ym+2x/3WDuSgNi72wIM8bs/22AKaG5JPPeDRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E5wzDxcm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E5wzDxcm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xwgxp4Glyz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2024 05:49:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1B07A403F2;
	Sat, 23 Nov 2024 18:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDE4C4CECD;
	Sat, 23 Nov 2024 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732387785;
	bh=4M9H/lWvGEnMetofR10BZ82QIv+evwKdYTWiMw/LMVs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E5wzDxcm8W4UTH2kyAoGdmkwN5TwJEMTOS+aO9B0fVdUS6tYtjTkRWR5UJ/LiF8y9
	 yr35FGuBG21qW1qORlC5ZIBtSjR63YguZGiJ2RAiNCZZAgoVWpGTrVSb7cUdb+v3oK
	 nAqvrSZgL10MU5+/7U5ODjcawvpDgDVsfH2C2qbCOGNTMAxenhmqfe7JEVlALl0+oB
	 /HiyAFfbgCoBX0vww++vT6jqdawSVdobQSiSELz2FdhKgQeI/Q/4ythqLer0sxIHOC
	 wEzXyVLWFrahHQn5PZ3O0fQ29k9otKpb9sbB9RD+JUXBEKsW+vZANLlqPSf24y9xk0
	 mDVgHL5uorRgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345843809A06;
	Sat, 23 Nov 2024 18:49:59 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.13-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87frnih59i.fsf@mpe.ellerman.id.au>
References: <87frnih59i.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87frnih59i.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-1
X-PR-Tracked-Commit-Id: 3c592ce7991cdf03bc7d139d790ce58c82c5903b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42d9e8b7ccddee75989283cf7477305cfe3776ff
Message-Id: <173238779776.3055463.14144677345357809416.pr-tracker-bot@kernel.org>
Date: Sat, 23 Nov 2024 18:49:57 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 00107082@163.com, Julia.Lawall@inria.fr, amachhiw@linux.ibm.com, arnd@arndb.de, bp@alien8.de, christophe.leroy@csgroup.eu, costa.shul@redhat.com, david.hunter.linux@gmail.com, elfring@users.sourceforge.net, gautam@linux.ibm.com, geert+renesas@glider.be, geoff@infradead.org, hbathini@linux.ibm.com, horms@kernel.org, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lukas.bulwahn@redhat.com, maddy@linux.ibm.com, masahiroy@kernel.org, mchauras@linux.ibm.com, mhiramat@kernel.org, msuchanek@suse.de, nathan@kernel.org, naveen@kernel.org, paulmck@kernel.org, paulo.miguel.almeida.rodenas@gmail.com, ritesh.list@gmail.com, robh@kernel.org, shenlichuan@vivo.com, sourabhjain@linux.ibm.com, thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, vbabka@suse.cz, viresh.kumar@linaro.org, zhangjiao2@cmss.chinamobile.com, zhangzekun11@huawei.com, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.lero
 y@csgroup.eu>, Naveen N Rao <naveen@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The pull request you sent on Sat, 23 Nov 2024 16:46:01 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42d9e8b7ccddee75989283cf7477305cfe3776ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

