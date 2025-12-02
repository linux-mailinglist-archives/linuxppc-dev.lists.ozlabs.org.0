Return-Path: <linuxppc-dev+bounces-14571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239AAC9C9FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 19:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLTjc0s7Pz3c4f;
	Wed, 03 Dec 2025 05:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764699955;
	cv=none; b=brrhxiOmhqn8fjZwdVCemJvi8Ub8f7oiwfCuZahjMOLz/rtFkzw7J6qsM2FuuGBpTgqiyRVJdR04yY3HZsLkAgRemJE6KskqgHOC4TGHSD6o65hkdbAETb7T5x+o2okWuii7sNHiNvVKpw6qXlGou5fmp8csEdJtBi4ahf0sTh1v8TzdxEvkNOFAV7XcQXLCzqBgbi+KkgUQbE+v/ex7yIHeAkttKJRrRWXL+j6QpGO3fTvQCMlRekI94eAOm3BBrJ+zwC7SrdSGhl61cxrZbnGKYSCSpKCs1eMCsMleHBj5OqjsGNmzlq4frb3ASJIKJMUeFIkyEUOV5G8caYzQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764699955; c=relaxed/relaxed;
	bh=1WhmLuNrSLKLImHsXxsAmHbQmK8L1LoXgHaCKxGCmek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl6ukP+AUmUckrKQiy7JPqQy21LL95GhXaMWvN5gGN98t77TjLq9Q0VUYL/js9KdsPXHup2RViFuqbyYxRKgdcbfbcRX1jO31Uud6AMSlwUCyR4gRTzPBO6SdK8W56dW76L6cQIvm/ZfAiPHlpEI39mUHyAJw1GxZAH+216Wa3vitmwn5hZx/y+Q3Kr7diO+Y9ZGHKutGUesZ4tgheBrKRB32p/JXc+iZHQjVPv2e22hRFs87UlqQvmOWbuxe/TRsyuJkzATqIrcWxbyPyEPn4Wl+h/VPkCpzzGeIOR7HgPgPKkgnDkgksuzamIRPWhdA8//HAbq20OdH0AF/t8E4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZmRJE8jR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZmRJE8jR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLTjb2rNPz3c3y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 05:25:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45E9460153;
	Tue,  2 Dec 2025 18:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F05AC4CEF1;
	Tue,  2 Dec 2025 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764699953;
	bh=tErWca9Q7isjXmTy262NuXlQP0VexxOyxDjhcnR+lwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmRJE8jRwY19cCut5hG+d27xk+lx6yTa6JO8QOWGDG4XEpiV3ghB6ljvt/1dXp1UU
	 34AG0kD/P7Mav55YGAxaJpT7giJeoeh5ZPeASISpCCFJPQ/VRtUcyXRvG7RZnku4AX
	 4vyjOYZXNa75lLoWXd8vw4cjN37kDNeuTMlNmZwS8FLjVD3MMmH25YGJxK1XcAtOEp
	 OvAsfLCY1EYkxhlGHhtzyQL45xGMM2W43eZd7fXrs5gEgzbOOdfM1hL7079jfFS812
	 qHtau5kFptjfb4/5xfFwGDwTvS5YqETw5I1mpSuWQg3hRL7XaEqr1E43yV02++OCcO
	 9oI2lDqBA9kyA==
Date: Tue, 2 Dec 2025 10:25:50 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Jan Stancek <jstancek@redhat.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
Message-ID: <4f5kcqpijenbsqognglpgkafuk3ok4gpj7wlrilzfrgwulntlk@iwnjypms6zvl>
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
 <z4go2m2c7ufulwjk7vkcpv2oyfo2jwpxzieiuuetegnv7sjrsj@gbjwkp2dpdyd>
 <qtnjbiz2wq35mmisa2dljpvslnmc3wmygxsq5usmiml223ry3r@eze7qwlrgx5p>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <qtnjbiz2wq35mmisa2dljpvslnmc3wmygxsq5usmiml223ry3r@eze7qwlrgx5p>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 20, 2025 at 12:15:58PM -0800, Josh Poimboeuf wrote:
> On Wed, Nov 12, 2025 at 02:56:05PM -0800, Josh Poimboeuf wrote:
> > On Tue, Sep 23, 2025 at 05:32:16PM +0200, Jan Stancek wrote:
> > > We've been observing rare non-deterministic kconfig failures during
> > > olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> > > disabled and with it number of other config options that depend on it.
> > > 
> > > The reason is that gcc-check-fpatchable-function-entry.sh can fail
> > > if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> > > there is still someone writing on other side of pipe. `pipefail`
> > > propagates that error up to kconfig.
> > 
> > Ping?  This fixes a nasty build bug, any objections to merging?
> 
> Ping?

Madhavan, Michael,

Ping?

-- 
Josh

