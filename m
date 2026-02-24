Return-Path: <linuxppc-dev+bounces-17107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH38Mk57nWmAQAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:19:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75A1853DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKty32m8Pz3cLV;
	Tue, 24 Feb 2026 21:19:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771928395;
	cv=none; b=YVhLAZAqNenwfLnvB4ETMlDYGRntacvEPdhZSNRBpgEx41G2/BJW86gwNWHlOXmdjMLgwuV0/t2J9qdtM3qp9GNf5GqJP3kB9fcaSCZ8tZvAni2CoHU1xqaey2RMXXlREE0+LuejHnZbQHfY60z8QLE13QTKeiyp+73LJwC1ys9VlyM3wL8u6lMjTWTlFrDByXYutV14zHeZOaT1qyHUYzKUOmq1vOY+TjiBknKTGwPfjs7srsvYoas4PQncWdVi1IjvBzne0fDYC6XuwVU4a9TE+99kk+QNDtfj9TU2c0sa8uuE9bODNtJPli6FmZhG8BJNFRUzEGU/3NUCWKYUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771928395; c=relaxed/relaxed;
	bh=5EzL+ErhkAAWQ3kvmzsoscVzRGE4s0aOH9obyVOoulk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihkMhw7Jcj2ZljeBI/BZ7jjm5ltVLCntVo4ym1g1/eQc3RFcsS9inkqN2xkJxInP4mUnJZW5IkzXTmUR4yF+MVMpwWsANUeCdzBGKSwa/H5+51PVQwsc8RkE/B0YDOPEztlQh7Lj72BgSK8oobmAzms4mS4BmatS73ahU13L9zNeyxJRBGBTXuDts/a97r8QhbjLi8r90LJJXvtqJ/UjyDA0kCsPx+ZSHM/KmiH9mOuI09UN/5e/F3C4YZpLVynEzGpNDoOc80urwKKivMoPXFBqR8IlmcKy0fwj8w7XHTr7CTsgOMkoEK8hg65M/7xmdsouQKQY6JVPrBIl4nxQTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rwzDOA93; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rwzDOA93;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKty24FBKz3cLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 21:19:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AA066132D;
	Tue, 24 Feb 2026 10:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098FBC19422;
	Tue, 24 Feb 2026 10:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771928392;
	bh=fIXh4FVUt5VEHxFr0HBf8S2hQ8DjDCocxqimR0QodIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rwzDOA934TyaoEDSurzQdMfNuTutWxevhF52tTtyKATwwWsPwYOngo+IUI8i5wfMx
	 cFsjR4SrD0K5taMJWgNrueqt67wfqGv4uAcl4yAPxDGt8Wb2Fh/Gx4SHHjP4f1t7jf
	 a+aO3hdLgqEkhWWQwAdlBIukb38sRZEltUS4P8zis2ddpUtcOwevElo63PoNB3wJRV
	 DjoBygu4Yes4HjImpBwhQ+iG/yL+z3PpeMqZ0tnOz/YWATtrxp06E/kky98Tv2aMzz
	 jmtfU8BghutsHYbEd0mbpVhusRE+HQhFyvZQ8k3Tw5lLdMYlE/Z+3m1Q18BrP+CM/0
	 xWRc12XvI88gQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupWA-0000000DIo0-0XT2;
	Tue, 24 Feb 2026 10:19:50 +0000
Date: Tue, 24 Feb 2026 10:19:49 +0000
Message-ID: <86ikbma1fe.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
In-Reply-To: <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
	<kukzdg7cym2cwytx3zgbu5ik2cw7c2zq7irwp6q6o4jzupjzla@qgkrv7emus6f>
	<86ms0za8e0.wl-maz@kernel.org>
	<d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: chleroy@kernel.org, ioana.ciornei@nxp.com, tglx@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17107-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: ED75A1853DA
X-Rspamd-Action: no action

Hi Christophe,

On Mon, 23 Feb 2026 13:54:10 +0000,
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> Don't know what is your merge plan. I wanted to push it to soc fsl
> tree but it doesn't apply on top of v7.0-rc1:

Not completely unexpected, as -rc1 wasn't released when I posted this,
hence being based on the latest tag from Linus' tree at the point of
posting (v6.19 in this case).

[...]

> Let me know how you want to proceed.

I've since reposted the series at [1], based on -rc1, and Thomas has
indicated he was OK with you merging it directly -- works for me.

Thanks,

	M.

[1] https://lore.kernel.org/r/20260224100936.3752303-1-maz@kernel.org

-- 
Without deviation from the norm, progress is not possible.

