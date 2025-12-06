Return-Path: <linuxppc-dev+bounces-14665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E3CA9B10
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 01:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNTQG6MhXz2xjN;
	Sat, 06 Dec 2025 11:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764980374;
	cv=none; b=mqBOV7NqEaIEoGclLe8FyOeOt/Ee9ZBYuUKQxQYp/xVg1nBW4s2SlsafoxqlXuTfzu1KLKkmHeh1c1GoSAZIIngNpDDfPMAvE2sTOHsDc5NTPKQVwXYoAeCMWpaQUobSfF68N6ZZ4INkt2Us2FPjijaaAMri4/xPqDzmc6W4TFah6Ahy4Vs/a5ERAyl5MzznHFC2GNm3sx8KCZEwktDrwWEQtbtPBYiV7ZQSTw2vrv5cp9W7Xk2DdcznHs6SzFJy8prCRg4N/lY8P62nzkt9jI1ye/XdHfKRYka8LxzyaUT5iqT4jWJOtMdIwCkPY2hYTN7lTm2I3InOOdkjDwIy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764980374; c=relaxed/relaxed;
	bh=rnIyhcRr+cBFBAiT/TGxMhODEzhhl+fqbabM0n+rAoo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BxMt3p6bwQ+La768sUPqqoZ8Gnd05dy6x5RGTg176BFRctVtLMU7U9HLULFBz6//44z1KFVA3go1sIrTAYXl1vdcCe5SO0jRY003Zf9P0TprabK+3Nx57ApJHPJ7ILOOSkJ+ajQE8Fk+omtfN8a++DqP3hRETZlo7uA18UgWPiBiW/asnmgz7NZ5reivOrAaSCyvAZWWIofg0oCSTc1qqHMh1poiwKjnt1kxg1uzBtKIt6sREOlzte8EpIxqQSRsuv1j+S12YHFCXlo+/sF5p/NwW+rUI8VJNqjDF4YgbWAJeANf9vIKtMaEjvjA3rqXKDl9qEWCA2MPVRSBFAgivQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QFGGa8Nf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QFGGa8Nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNTQG0zFCz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 11:19:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2BC560010;
	Sat,  6 Dec 2025 00:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB73C116B1;
	Sat,  6 Dec 2025 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764980371;
	bh=3etdHXSgtNYaEFUmgruCO24HTvt5AYTu0uxT7IBnUcQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QFGGa8NfLjC1InBOhTibkDHpgzIfL1CyCFJJuoSLwER+CI30Z6Ed8kqDqBCysV0Ow
	 ehy3mpRaC13ofFn0ZG4feletaqBePnlDkOnJWCNnh68c4loysX12Xypo/W1ZEMXAxw
	 q0wpFI9fIj4hzKR/voXXAvOwhvfpo0I/avm4Gw+o2fIoRnoa39VjKSCD7EQ0C3fLbc
	 0Vt2S4hBsziFNDwEXtNS51+jaxWEqfTHFU05dehe1ccAHGdACJzgj51W0gDFkKX39B
	 bMkN4dJbRr1eR2j8m8Is4dCPR9GWlezVuBUMxUNC7IdnINovjJWwLfT4wfgrbyhARn
	 KUSUcgcnJgNKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0E6203808200;
	Sat,  6 Dec 2025 00:16:30 +0000 (UTC)
Subject: Re: [git pull][vfs] tree-in-dcache stuff
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251204064706.GJ1712166@ZenIV>
References: <20251204064706.GJ1712166@ZenIV>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <20251204064706.GJ1712166@ZenIV>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git tags/pull-persistency
X-PR-Tracked-Commit-Id: eb028c33451af08bb34f45c6be6967ef1c98cbd1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7cd122b55283d3ceef71a5b723ccaa03a72284b4
Message-Id: <176498018885.1869773.11235050751770031700.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 00:16:28 +0000
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Ian Kent <raven@themaw.net>, Miklos Szeredi <miklos@szeredi.hu>, NeilBrown <neil@brown.name>, Andreas Hindborg <a.hindborg@kernel.org>, linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Casey Schaufler <casey@schaufler-ca.com>, linuxppc-dev@lists.ozlabs.org, John Johansen <john.johansen@canonical.com>, selinux@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, bpf@vger.kernel.org, Chris Mason <clm@meta.com>
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

The pull request you sent on Thu, 4 Dec 2025 06:47:06 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git tags/pull-persistency

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7cd122b55283d3ceef71a5b723ccaa03a72284b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

