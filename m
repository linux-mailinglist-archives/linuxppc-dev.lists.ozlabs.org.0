Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3C7EFF57
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 12:46:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=SuU30flu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FLA3zNdd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXX6j4tTvz3dLM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 22:46:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=SuU30flu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FLA3zNdd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 522 seconds by postgrey-1.37 at boromir; Sat, 18 Nov 2023 22:45:47 AEDT
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXX5l5ChYz3btp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 22:45:47 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id F40B02B001EC;
	Sat, 18 Nov 2023 06:36:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 18 Nov 2023 06:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700307416; x=1700314616; bh=Zr
	/fWLNv0kQk17CJyVu6sxw75RSfVWR6vntD48RKtB4=; b=SuU30flu847g5XcV0f
	FCQZFqm3Cdo7HbjwSBgbZC8Ee2oQreEHsvnKXcTzEamHIQUm3Sru5Nhhsy7xtTzt
	zni0ZEL0FrSMXJYQ7/g/DYSR3XDdAmsXeP1ZYQMrI4qASl1KWI6qbGLOT9m650EP
	odvcvAAVH+wAk+CeVY2PHqr7hnOCxHm4Lc4qEn58KK92Rq0GA5byA50gYnpdEwg0
	sZpHq82Tau12tqPEH4Vg9E9P7SRM3k4WN3xKnfVQBeOraHeGgCKEhr2as6kpl37E
	gpNQh1f1UtaArUoCpRMjMk8AKUNQAyUdMrMyG7hghPUVv90Bgy/7uYXflFnB/6m+
	KwtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700307416; x=1700314616; bh=Zr/fWLNv0kQk1
	7CJyVu6sxw75RSfVWR6vntD48RKtB4=; b=FLA3zNddW4gd6JJNZkKHZpGU2ZSoE
	x1ROSDleHA8aDXPIRG7MqlrSQHO4EXldW0XNoPnLOwASmCHom0scuPp3GgKJwbG5
	+WKLSANtEOiyWlyDR9IjWbmaviCatb4aLCbjCh3Cv00FCgR0sWVTM0FItdVW48OR
	ftxX5U/P0w1Rbfm5VQfgJ+TyZvDjgCZYzUTMXGGsJ9kpWChIP7K94inv1dEmFIP7
	R9oD+pzExldpFURss+edLIyuNonCFiGqBjlWAgWfhGXiPPTZODgqhQy35/SkO/up
	3rFxWPAGnxNzZyEz1MLFn+34jn4e14lRU6qpX1xbBPlEnsMHC4WdawNwg==
X-ME-Sender: <xms:16FYZWuZIDpHfOkvAD_KH-e2R3pSVwkw5J0L_SQVjIo0QiD_BvuYnA>
    <xme:16FYZbeQUYpWT_Za8B4p4ULvkTT9WuQ7z5kvm6Na-y6iuXfqwgHKyM_JUwtUa_mMs
    GQU8fctNpL_Tg>
X-ME-Received: <xmr:16FYZRxg0z5SY4tqWiAMusVhwT5QK9EpDSTPUe6J53y19-23OoLg6FIMi4kwOpufSVQmUbhoLI-H72LVlfdN91U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegvddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:16FYZROADM9Jn_nZdgWR40lCRIpOjGuyx1Uan1VQyWHMYFBfOngXUQ>
    <xmx:16FYZW9eKyuPuNLkZxKJCypALHE7vu2nb89r4p1pDgYva3yhXhu0iQ>
    <xmx:16FYZZWLiSkjYs21pyLLqREi3-lzjdUYDNuOb-H-SmcCXiYdFF4J7g>
    <xmx:2KFYZaSlbbiay2VfXzsxGgumnqDZjs0TKeU-we1jv0sIFgt8gd4UvPbgomQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Nov 2023 06:36:55 -0500 (EST)
Date: Sat, 18 Nov 2023 06:36:49 -0500
From: Greg KH <greg@kroah.com>
To: Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 2/5] modules: Refactor + kdoc elf_validity_cached_copy
Message-ID: <2023111818-agent-verdict-99a5@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <20231118025748.2778044-3-mmaurer@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118025748.2778044-3-mmaurer@google.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 18, 2023 at 02:54:43AM +0000, Matthew Maurer wrote:
> Functionality is almost identical, just structured for better
> documentation and readability. Changes:
> 
> * Section names are checked for *all* non-SHT_NULL sections, not just
>   SHF_ALLOC sections. We have code that accesses section names of
>   non-SHF_ALLOC sections (see find_any_sec for example)
> * The section name check occurs *before* strcmping on section names.
>   Previously, it was possible to use an out-of-bounds offset to strcmp
>   against ".modinfo" or ".gnu.linkonce.this_module"
> * strtab is checked for NUL lead+termination and nonzero size
> * The symbol table is swept to ensure offsets are inbounds of strtab
> 
> While some of these oversights would normally be worrying, all of the
> potentially unverified accesses occur after signature check, and only in
> response to a user who can load a kernel module.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/internal.h |   7 +-
>  kernel/module/main.c     | 585 +++++++++++++++++++++++++++++----------
>  2 files changed, 444 insertions(+), 148 deletions(-)

Again, this needs to be broken into much smaller pieces before we can
even review it.  Would you want to review this?

thanks,

greg "think of the reviewers" k-h
