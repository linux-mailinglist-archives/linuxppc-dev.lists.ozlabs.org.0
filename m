Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206D3AA7B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 01:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G523Y6R7Pz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:49:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tLLlTT5Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tLLlTT5Q; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G523667NJz306h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 09:49:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FCFF613AE;
 Wed, 16 Jun 2021 23:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623887359;
 bh=qIUOjJaXnnZDIyqjA+8Rc1PjQR2ZFeNFFdkcFco2deg=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=tLLlTT5QYvEBvhHyFgtlIUon6gCPPxmjtFckUGTgYydeAEqnZDsIDRjwwA4edaT4i
 SxjOwyOiiypMhRc5geGG5OgstPcC5Zydag4FyTShAXeUicNHyag/uwd+Bf8addiz00
 r8/1njn1ijQGDlnV6k+rfHTFwz46KsHf/SjGCMx9fE58OFAK//3XD6VMtAMLWQzk6n
 Ev9xVT4vvdAIgmQ8AxLgsQmZwVDU9W6/It1AubbzeAKkkNmTvi/EmCaGXdyXb5HH2s
 XJk7RGwQv/SyH4TP+iKmDKoEdgMvZtMBHTC+hzuUNyU6fbMwMEk2cicq8FRa861MWQ
 vOcPKj4sc0mRw==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailauth.nyi.internal (Postfix) with ESMTP id 1C2F927C0054;
 Wed, 16 Jun 2021 19:49:17 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Wed, 16 Jun 2021 19:49:17 -0400
X-ME-Sender: <xms:-43KYMT-reRhfjGOEiOYa0siZLD5nPSMwXb5XAXrIzuBgmJn_Lzx0w>
 <xme:-43KYJytn81R7UbdVQ_MBSHv16rZDbnzVKgiVCJ00uWlhY74t4HZ3YZxnQr7rExSl
 r_mFnGwqWE2X5oRZr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeftddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpeegjefghfdtledvfeegfeelvedtgfevkeeugfekffdvveeffeetieeh
 ueetveekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
 ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
 drlhhuthhordhush
X-ME-Proxy: <xmx:-43KYJ1rJ06ztsbb7LNVgG-Ou4TtbewZ_Lw8_W1VMe9HOXvzhUaTlg>
 <xmx:-43KYABMF1Fj1SxQBreR9VA8nipQ2KejlybnFH6ga4H3DfNAwU1V2Q>
 <xmx:-43KYFggd8F-Ds-SNxPsKn0g8C8Zdt6fgayaCE8JAb4A3F2_KXAlRQ>
 <xmx:_Y3KYIRLxOL_9cNXbvbAfaI64mDknaeEtM_-YMQ--gKc0MP8oki061lS0M_Qjr7O>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8540951C0060; Wed, 16 Jun 2021 19:49:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-526-gf020ecf851-fm-20210616.001-gf020ecf8
Mime-Version: 1.0
Message-Id: <57dae79c-fff8-411f-a375-1aa8a1cd10ac@www.fastmail.com>
In-Reply-To: <1e248763-9372-6e4e-5dea-cda999000aeb@kernel.org>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <1623818343.eko1v01gvr.astroid@bobo.none>
 <1e248763-9372-6e4e-5dea-cda999000aeb@kernel.org>
Date: Wed, 16 Jun 2021 16:48:54 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Nicholas Piggin" <npiggin@gmail.com>,
 "the arch/x86 maintainers" <x86@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_8/8]_membarrier:_Rewrite_sync=5Fcore=5Fbefore=5Fuse?=
 =?UTF-8?Q?rmode()_and_improve_documentation?=
Content-Type: text/plain
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
Cc: Will Deacon <will@kernel.org>, linux-mm@kvack.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021, at 11:52 AM, Andy Lutomirski wrote:
> On 6/15/21 9:45 PM, Nicholas Piggin wrote:
> > Excerpts from Andy Lutomirski's message of June 16, 2021 1:21 pm:
> >> The old sync_core_before_usermode() comments suggested that a non-icache-syncing
> >> return-to-usermode instruction is x86-specific and that all other
> >> architectures automatically notice cross-modified code on return to
> >> userspace.
> 
> >> +/*
> >> + * XXX: can a powerpc person put an appropriate comment here?
> >> + */
> >> +static inline void membarrier_sync_core_before_usermode(void)
> >> +{
> >> +}
> >> +
> >> +#endif /* _ASM_POWERPC_SYNC_CORE_H */
> > 
> > powerpc's can just go in asm/membarrier.h
> 
> $ ls arch/powerpc/include/asm/membarrier.h
> ls: cannot access 'arch/powerpc/include/asm/membarrier.h': No such file
> or directory

Which is because I deleted it.  Duh.  I'll clean this up.

> 
> 
> > 
> > /*
> >  * The RFI family of instructions are context synchronising, and
> >  * that is how we return to userspace, so nothing is required here.
> >  */
> 
> Thanks!
> 
