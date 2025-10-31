Return-Path: <linuxppc-dev+bounces-13623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B66C22D73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 02:07:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyNB15N0Wz2yrZ;
	Fri, 31 Oct 2025 12:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761872841;
	cv=none; b=kHfH30h/7kX6mp27LcjbhiaDU4a6fZK/yIL1ka3Yn2MP4nh2KjgIDtFZrLKUCGgl4HtI7BEELn3/dsq4324qtFCY47zTDOJPoCJUnKeL+C1qzViKMExfl6EIEUJ60bWVvexELXD4XSY5II5YDaEElEhulZMjnTYxlXpCJcxGwlIqRiDh5Zmffl86GR6sQQKxVlFJN4kfVLt9JpQrCaY1W0PLHY8FQAona4Q4kYFCsoFEOFBK2IBGNqFDoREvFSNHQVsOUrGtSPtmpmoWMKy1qxK5p42ChDPBwBVMpVxSq85OVyiZKcPODjQGgGpKmvZ8O+ojm/Rpa2gikOKuuLr4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761872841; c=relaxed/relaxed;
	bh=piiOkQqcxRxG+yiW81myPzUuCfrL8IWiVAXInVeinZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2eOBMeCm7/ivK+4cc9DKpwGAmpdpUJ/hN70ZF0Yk9YTTEN9sttz81Hs8wilrfLf+DggE8Jyk8XFXUkaq7GXrSjWulbttwRItkNi/lu3Eg1unppO/mTVFWDyTxWd7weJTbD/WI1DaYU5mwMrRXKO6Odi1dVKV9XY8ipyFagbxBJtv+uOPb7bZzxTGmTc4ffommd2/SokUhgosmEFRuSTLOqOdoDh9jsBn8sokSRrJi3jrPG91OAfU7mJB5B6yZYRAJbj1mnzpAHsCi5R7AMBLhbaJ9jBewcZUgZwpzv2JuAcoZuhAYOWvGfQedP80PDDnOH/VUiJXrns2JYTmD9Y2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JgHATln6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JgHATln6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyNB057Xxz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 12:07:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50C424470E;
	Fri, 31 Oct 2025 01:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EA8C4CEFD;
	Fri, 31 Oct 2025 01:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761872838;
	bh=5uhKQCEfPz03zSOKTn3bEuX7eCLvIgdhi/QnEgo5NfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgHATln6l7qexu48uM1wqKiMZHQNmXJTGRaDyYIj9PMXE2xf1MloP2WeSSXdsBx18
	 AntBVv4cWagIlOAfR0ShrdyEo2JW08dj57/b+d9u2SQEiGc9ZHl4aw7gStcuUer8vi
	 caJ1ZF1JU+TBStXp3BZuQfXq+8pQ984jTfksWEwkYu/aDJTq/AteRGbPcVURPo1U6q
	 XnHb8UVRS78+j7hjdaZesSoSE22VJFUQ5w/skC+VDN6gl+7Mg7WhFb61yhsVdQm0Hd
	 rOOKas+lRqVm1bMydD/Oo4GPLxUqcOVpreDT0/5pblPGcDgAgtY1eUA5izL6l3vyH5
	 bh922HBBaKr+Q==
Date: Thu, 30 Oct 2025 18:07:15 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Petr Mladek <pmladek@suse.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, joe.lawrence@redhat.com, Naveen N Rao <naveen@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
Message-ID: <kxdu6nbnm6pger627erjqajgpq4bpy6enhyhhgyry73dpzj5v7@54a76wpspao6>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
 <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
 <aPjW3P2AU7L71S-s@pathway.suse.cz>
 <ee9aaeec-23bf-42ac-8a8d-4ba899cfdd13@linux.ibm.com>
 <aPnxlEkV1rL0hWOm@pathway.suse.cz>
 <875b21ae-c30f-4dff-bef2-e41965013416@linux.ibm.com>
 <wxqithrj3vvgbefr7d7afv5vcnuu2ssuzrw6fqtmdjtq3ete3j@pfsgyacqjama>
 <7f461974-7fdd-422f-b4fe-e65af50b0728@linux.ibm.com>
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
In-Reply-To: <7f461974-7fdd-422f-b4fe-e65af50b0728@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 30, 2025 at 06:09:54PM +0530, Hari Bathini wrote:
> On 30/10/25 7:36 am, Josh Poimboeuf wrote:
> > On Wed, Oct 29, 2025 at 11:42:54PM +0530, Hari Bathini wrote:
> > > > I looks like another problem. I would expect that it is in
> > > > the ftrace code, either in the generic or arch-specific part.
> > > Yeah. This is part of arch-specific code that does init of ftrace
> > > out line stubs. The problem seems to be since commit 1ba9f8979426
> > > ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros").
> > > Before this commit, .text.startup section was featured in INIT_TEXT
> > > but now it seems to feature in TEXT. Is this change right/intentional?
> > > If yes, I can post a fix patch in ftrace arch-specific code accordingly.
> > 
> > Ah, I wasn't aware of .text.startup.  Apparently it's used by KASAN,
> > KCSCAN and GCOV for a significant amount of constructor code, which is
> > only called during boot.  So we should try to keep it in .init.text.
> > 
> > Venkat, does this fix it?
> 
> I tried the patch along with
> https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org
> It fixes the problems reported. Thanks!

Thanks!  Patch posted here:

  https://lore.kernel.org/07f74b4e5c43872572b7def30f2eac45f28675d9.1761872421.git.jpoimboe@kernel.org

-- 
Josh

