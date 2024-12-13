Return-Path: <linuxppc-dev+bounces-4073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B569F0254
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 02:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8X7w6JZ9z30g5;
	Fri, 13 Dec 2024 12:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734053980;
	cv=none; b=O4Cyud1TybZmzwl8opf7gOBENvZ8QygJebQPp3rJ6UMYRFj87mN/2N3/U1Lltr/S1WAMqBr0vYqaM3DJCZhP1tDLxyWWZCuWx9mTjRPB4iFKzlzSW8kLLNe7EZmJA5hdUMKV0873TcXt4f0Xwv+zWdsr1Bkx319v7GeoKN/UfWT5V3kf7k4dNTQ8OVTSdo25U1b/0H+dlej1uG53lH26TIXvM99IJAkwWeqWzzQBl3aCdXq1SjGwTpSFb6nCOVDcNptgBFRLvM57GOKYEIiLDWIfuhzgFpnHdFXo3Z0MO+z3OYOnemasfUqQ6Z6+bbcvktAoSNOcYicRzXqiq/t39w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734053980; c=relaxed/relaxed;
	bh=XDf95d9Uka+UIYv5wGQ9WydOISmAvXQAo6tglVHRDi0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EsvbFz9APwzAWsZkHg9/TantjVv7yPFfFMr9rgjjfwgi559HRmmmG8cXrSmO39i7xNLCnrRoQZKaO6+JqWXU+u8zfhqNdojikxSQzCZOGg38DcHN0AKBtsGM1BjXgnwUiv6XoLtEuq3dHDP10USNmbV/N1KHv6BUiCNVgdTepvarOx6hU04TrSvjfjsqBP4wKOBQQcmiJoAb37gJnIVxpsh0TAL7/9nRoK/ITTl81iozYVX5vPvZtILzc5Ym83G2Uw8qTxpdkLao224ZISoehjAMknFGVEutzLL28i9XC2KczkKDGTtHPL+WHeLXGgxLNKuue2diS0NLn93LiwHO6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NOajGzF7; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NOajGzF7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8X7v6J01z2yhM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 12:39:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50A5DA40E72;
	Fri, 13 Dec 2024 01:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA84DC4CECE;
	Fri, 13 Dec 2024 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734053976;
	bh=z6KasiqXW9OocT/gPdXD8wxFCgxz3hJU5rxa3NS7ujM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NOajGzF7Oghi2j823OVBOAGjMfDE2y8sqhBtABteyi+xNwCVBGrHLGBc4kP8k/ZzS
	 nGpVqOiOxYmCXtpYVq8CDh3d/Emvq9T/1xFLC/6g4wNbedpjpYuIv/cuTxF0CeV0MY
	 ibJbSfQIh1u6+D2zMIFRD+W8TWrIVtCfqGegBRio=
Date: Thu, 12 Dec 2024 17:39:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Kalesh Singh <kaleshsingh@google.com>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
 david@redhat.com, minchan@kernel.org, jyescas@google.com,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
 leitao@debian.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, kernel-team@android.com,
 android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 06/16] mm: csky: Introduce
 arch_mmap_hint()
Message-Id: <20241212173934.4dc429716acd4c71a76e15c2@linux-foundation.org>
In-Reply-To: <vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
	<20241211232754.1583023-7-kaleshsingh@google.com>
	<vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 12 Dec 2024 16:40:10 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> > Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
> > This is a preparatory patch, no functional change is introduced.
> 
> This also looks like it has changed the validation order and potentially
> introduced functional changes?
> 
> All these stem from the same cloned code (sparc32 iirc), but were not
> updated when the cloned code was updated.  This is why I am against
> arch_* code.  We should find a better way to unify the code so that
> there is nothing different.  You seem to have gotten some of the shared
> code together, but some still exists.
> 
> In the addresses, there are upper and lower limits, and sometimes
> "colours".  Could we not just define the upper/lower limits in each arch
> and if colour is used?  Maybe this is complicated with 32/64 handled
> both in the 64 bit code.
> 
> Is there any plan to unite this code further?
> 
> We have had errors for many years in cloned but not updated code.  I
> really wish there was more information in the cover letter on what is
> going on here.  I'd like to try and reduce the arch_ code to, basically
> nothing.
> 
> I was also disappointed that I wasn't Cc'ed because I've spent a lot of
> time in this code and this area.  I am probably the last one to crawl
> through and change any of this.

Thanks, I removed this version of this series from mm-unstable.

