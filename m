Return-Path: <linuxppc-dev+bounces-17047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDLgLohUnGmSEAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:22:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44878176B91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:22:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKM2q2fbQz2yFc;
	Tue, 24 Feb 2026 00:22:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771852931;
	cv=none; b=g3tEpvQGIApLs9bLwS6GUTB7xpDrfMFVmyVtKUD4G/uKuv/oakO/b/jghPtWAFaW517vK99jNoO3eRqIA6FZqaZYUKqHxd1XzzI/brQJjcGa7sO3Dt6V3QdbWwagARFtBooKka+R1iCakK4pQ0yZqGlGYyAzWlXnNP+R1VcFVK+lRby/tNdGTU3aaoDKVUs8+/v2CBPgi4meMw8m0BTKZCTtcDJFFQE+WTcupY925x9elYWCAA8suro6UspmhlhP+51rrWD4lhnhQ1nDWmlPV15YahPFcz3mRk8achA73PQOkX4LOHwr3sr/IEqFfYN1bzcElBWKHO7dXarvkB3xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771852931; c=relaxed/relaxed;
	bh=QxAiPQ90sKW6aL3KnZyK4oppjKCxM+Dil6BD5eXCMx0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgOVXyZYFP32bvLnHEd4HJf0QZzsZPD/CU71GYerjVGEAWj2UsRjeOr1bUHqyze9u1BTvTWqgafrii+MOTmxvsb11S2MHlvRwgwUo+5iwZigXYMYJgllKXe4UETvx2Ipx3j77WHnQ6clR32FGdz81x6YzVCd77Z/wjHWUUv8EYDhgeK5fG6F6jN7XrpKTIapTw57woNY25t0o6SCEunkYhg/TJnkScJ0CQLMccPgXIhZOG+wPtFCJf6AgslO7PQfQLHaZyKEN3UWoHclHtpqP1G0LC66EpKtXRQM3WNvh5hBky4/U6ZS+IP1Wmkqf2VsjjOFMMaxn3r/+WnkW/JIAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UKz7JMpQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UKz7JMpQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKM2p3s2Lz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:22:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B035600C4;
	Mon, 23 Feb 2026 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF2FC116C6;
	Mon, 23 Feb 2026 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771852927;
	bh=0xqAjsdAyUww3zwKx2IiJygAQ+DOOzG6ciGTfm1z0/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UKz7JMpQ+lSYrMPnAErO0JweEk+B06HjO2lFeezx21yxPTRsBLi8VRjA1I8QlVRsT
	 K0HgKIUDHbGJWznB4Nwl7ksP8IeZYD0mUmj5ztH97UNbr8nkVB1YY/yTqiO1z88qWt
	 9DwJ9N8ZJtkNG13gnqaS3uiqD7RPMzYckIN2c6IU6XMDQ9UjLb3c65y0UhI+DGElqK
	 HrUoxD27dJdrLVFl6JjinT9GKQQWQMnlH0sygWmDUodi9nkq71mBXfPYCTYwE5e4d5
	 rqQszzzRmPLfpvYxKjG4N/C2p5/Ka1c004nJZHPmMtzXQ5sL658M0AW2mtv1EzvuEG
	 MrKR2sXsgsm5g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuVsz-0000000Czk8-2qPj;
	Mon, 23 Feb 2026 13:22:05 +0000
Date: Mon, 23 Feb 2026 13:22:05 +0000
Message-ID: <86o6lfa936.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
In-Reply-To: <87pl5vvchx.ffs@tglx>
References: <20260218135203.2267907-1-maz@kernel.org>
	<20260218135203.2267907-4-maz@kernel.org>
	<87seasv11z.ffs@tglx>
	<86qzqbal69.wl-maz@kernel.org>
	<87pl5vvchx.ffs@tglx>
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
X-SA-Exim-Rcpt-To: tglx@kernel.org, ioana.ciornei@nxp.com, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17047-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 44878176B91
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 13:02:50 +0000,
Thomas Gleixner <tglx@kernel.org> wrote:
> 
> On Mon, Feb 23 2026 at 09:01, Marc Zyngier wrote:
> > On Sun, 22 Feb 2026 22:57:44 +0000,
> > Thomas Gleixner <tglx@kernel.org> wrote:
> >> This rejects as you are building against an unmerged change (I assume
> >> it's Lorenzos GIC5 stuff). I can fix it up when applying.
> >
> > That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
> > that this is still doing the right thing after the ACPI crap fest, and
> > repost the result.
> 
> Ah. The other way round :)
> 
> My resolution is simple and it looks about right. Please note the
> cosmetic changes I did on the way :)

Yup, looks good to me. And yes, moving the include up is the right
thing to do.

I have another small change in my current stack that also drops
DOMAIN_BUS_FSL_MC_MSI from include/linux/irqdomain_defs.h. Could be
folded into patch #5.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

