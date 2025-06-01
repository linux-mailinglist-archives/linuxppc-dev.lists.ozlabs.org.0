Return-Path: <linuxppc-dev+bounces-9053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F6AC9E48
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Jun 2025 11:59:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9CBP6HYXz2yGQ;
	Sun,  1 Jun 2025 19:59:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:67c:2050:0:465::101"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748771981;
	cv=none; b=gxLLhKaD4zepPSITak2fHO1gadJc5Y2FlrcnbCcr9T7RWGJm/NLdgTTCkOlBPt+VsE0jEAnjJWjRH1JHMPcLOCXsZ3Hk4nhNLULKGq1UfwXY75nF2I3dZNN/bZ4KFA35xcHHCyUo3yOAoeoQuMd0yx2OkkR3Q4x5yw4qKLLdL9vxjiUFTxwbHVjScvdJ6VIi1mUYrK7sFVagW0PuzLKjf1JhA7FpfirovyuzgWX7f4c4k7WzXwDh1gw8AGGokyeNWnQYXksap4NtFsI/a9+4s1IWjQvOk3PUKyAINHxHXYbsEi/G0EwJkogDO//te7JfEmohHFVIX0CjvOdyfStqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748771981; c=relaxed/relaxed;
	bh=EoQTHup2d+EyM8C1iJX6ayBPRlXmhbkkz5IGdIJDd/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIPFx1UOup0R8tltHlLwcYpXntQP6UhTM2z4IKWpeDmuu4U6/+yWLa+LTx0fkt62WFA6xShPI9V1dKkFdwulzHZS9QTuFL3w7YnTohR42DwKNyjB95QE7KZYRCP9UuxvvByOnebnIVl7tXKn43PrMko+ob+JoL/QcVNIld6dyaVIbXMq70OWzJAKiOIQesIGjmsDTxT8Bu0AW2nYpSbs5VwGUAU2Ht8D0QmaPlKKAMdeLZxz8XEbsoRCQvutBLLKHF+eCDhTWxQgSdals72Jm19KqvL5pFYBTFbEN+tn5tevT9E/tpYlcB7meiG86ZDkHjoUay0Vu1PjWQz9U7eONQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UY+oJeXp; dkim-atps=neutral; spf=pass (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UY+oJeXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9CBM1DhGz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Jun 2025 19:59:36 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b9CB65mx2z9smq;
	Sun,  1 Jun 2025 11:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748771966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoQTHup2d+EyM8C1iJX6ayBPRlXmhbkkz5IGdIJDd/4=;
	b=UY+oJeXp7weMaKTAr54StxjxHYHzCn2UfTRAJJkITYxxKgV0aJAC7keV3njPcGu9SX//4M
	3yGH0NkvPcLJyWlom/sS1E3040yc/ktb8rZRUvjpTb5g88v4I73WelBxuF3k8lc3/iVcy9
	Qzu+EMiRvzhNxCDrF8pU7rOR4JJfWghfjro3NmSVErxKcGhk0RLSIFe3VLiankaKexMhyW
	mU8DT8o8AWAH/dSEADVy9dn9I0zrSXTiZsPVKPP4uZij2i2N5fAtEtzQwPuoNuFzcDCkTU
	lyK7hAjxI88jPIH2yXlcjM5ZPUZ+xiT2QxPJU/ZbJSqJcavu8sidfhWpDhGxfw==
Date: Sun, 1 Jun 2025 11:59:23 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at
 arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <20250601115923.713c9683@yea>
In-Reply-To: <aDfsemssEVATfP80@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
	<aDV8iWe2nWX9JuvV@linux.ibm.com>
	<20250527204728.63d538f8@yea>
	<aDfsemssEVATfP80@linux.ibm.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 50cfc82d11ae51dfaa4
X-MBO-RS-META: 5r3erum6cuuiiid7su7azspoexbnz7ky
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 29 May 2025 10:41:22 +0530
Srikar Dronamraju <srikar@linux.ibm.com> wrote:

> * Erhard Furtner <erhard_f@mailbox.org> [2025-05-27 20:47:28]:
> 
> > On Tue, 27 May 2025 14:19:13 +0530
> > Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> >   
> > > > Getting these from time to time when I run the machine for longer periods building:
> > > > 
> > > > [...]
> > > > ------------[ cut here ]------------
> > > > WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0    
> > > 
> > > Its a warning with says that the task's userspace MSR register has
> > > VSX set but not the VEC or FP.
> > > 
> > > Were you building the kernel or were you building something else.
> > > Can you paste the command you attempted?  
> > 
> > I was doing an 'emerge -e @world' in Gentoo Linux and probably building a kernel in another shell. Noticed it only in the logs on the next day so I can't tell exactly which command triggered the issue.
> > 
> > But I will pay closer attention from now on.
> >   
> > > If this is happening with only the recent kernel and working with a previous
> > > kernel, do you happen to know the previous kernel version.
> > > In which case, is there a possibility of doing a git bisect?  
> > 
> > I think I have not seen this in v6.13, certainly not in v6.12.
> >   
> 
> I did go through the git log from v6.12 till v6.15-rc7 and I dont see any
> direct changes that could affect VSX VEC or FP changes in kernel.
> 
> On a side note, Was there any significant userspace updates like library,
> compiler updates from when you saw it working to now?

Looks like these warnings easily happen when I build stuff with GCC 15, currently on my Gentoo Linux musl ppc partition. No kernel builds, just emerging regular Gentoo ebuilds.

I'll sort out whether I see this on GCC 14 too and/or glibc partitions too. I'll report back when I know a bit more and maybe found a good starting point for a bisect.

Regards,
Erhard

