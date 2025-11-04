Return-Path: <linuxppc-dev+bounces-13769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E1C331EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 23:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1MnV6rkFz2yD5;
	Wed,  5 Nov 2025 08:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762293598;
	cv=none; b=ojvBay3OcuqDZPSeZW5WdT9pjCHzoWn9y6NKj2jpCE4jVXwfTM18sNlAS5fHZ+th+IiaC/2jfi+GK36uPHI16E3JD0Tk/PJesnaqp6eK1W3/3c/8C6VcXJSrsoNL91M2vrZmQIkUovYgEy+fr6rfPVBgisxY2PntuSS9/u9agv5Arp6nP1f5+UvCZC5are0CxSFfJr/IsKqZNNBKiw27ITcYvTDXG+Q5HyWL9hl10LTR4nPC3vGmDJJ56CGgzk94NbaCuJhkc8yw8l10RcPlbQfAF+FrG5PqzaIGWFC/sCA66gTl+KZfThfAI+84NozSPSK7msg+aILkurz94qvp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762293598; c=relaxed/relaxed;
	bh=Xhuttl3JoK8PGtwmxhWuCvI90qbtuGFHePA73jfrIoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYg/EFfSlozKp4jPfDMNJRyci/sVfkHHyA9naHLlLLJNM0BnjzBhuFCFcs6BguZf1YK90+Y67sPHWJo/5yWLXX35ZuJ+1hZH5W+bkLHPl12619FSpESq3Cll46g+nFrlC5rnZSYoaIl4/Udqx+Vvr0e8R94aW74KIkzh3A+CgnXOpaUn8aVgNeXJgmJ0k4tcxYJhDcJ/yR6hqZxkqRk6p/68E7WSa42t16EPwfqtP6VkIUwrO6rlK82axgPvNuZALZcsekglQrR5wJgIcAR0hZVTBaqH+PNRkTILIjobdTMDsozOJgEm/s2n1XdNMjVB4HC/N2jcbRHiA861mCtSBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=XzZ5d6wM; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=XzZ5d6wM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1MnT010gz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 08:59:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Xhuttl3JoK8PGtwmxhWuCvI90qbtuGFHePA73jfrIoQ=; b=XzZ5d6wME4fHE4N1
	s/pW6SKOj9eRqEUvjKVJ2iuRtW8iok2Yptn/cydPOsokbGbjyhRg4nV9+fSWj0nPNNcKQ4Ioyu+Km
	/qAldJlT6hGBQ0D7KuCm48pFAPfPVREWNbSqrYxVSn3/eveIfaqXJd49W5zgxmYC8HXL04ngWuBYk
	QC1hRMcL78CqHW45LW6RCVKpleu2FG4iY7lP5JXIDe7n98hVoYCdabS6Utq5noAdNo/WEupyMX8Fo
	p1oUYPae3/fv68Pkw5ENVRl7ikUtzt1AIpXkXjyuno4Z1t3S/5rgt+sNxues/oeTQYd+fXB1KFFbq
	bjrw/cX1tXTj2BrpCw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1vGP49-000000022Ps-15vT;
	Tue, 04 Nov 2025 21:59:49 +0000
Date: Tue, 4 Nov 2025 21:59:49 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Stan Johnson <userm57@yahoo.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	sam@ravnborg.org, benh@kernel.crashing.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>,
	Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-ID: <aQp3Ve1C-aZ8BhXa@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
 <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
 <aQgJ95Y3pA-8GdbP@gallifrey>
 <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
 <aQo-5T8z2nwtNe2p@gallifrey>
 <3017c67c-87e9-c06f-3146-ee461cd6603f@yahoo.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <3017c67c-87e9-c06f-3146-ee461cd6603f@yahoo.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 21:59:24 up 8 days, 21:35,  2 users,  load average: 0.01, 0.03, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Stan Johnson (userm57@yahoo.com) wrote:
> Please see the attached config file that Finn sent to me along with his
> patch. The relevant line is "CONFIG_BOOTX_TEXT=y"; without that, the kernel
> boots on the Wallstreet.

Thanks - I'll have a play.

Dave

> On 11/4/25 10:59 AM, Dr. David Alan Gilbert wrote:
> > * Finn Thain (fthain@linux-m68k.org) wrote:
> > > 
> > > On Mon, 3 Nov 2025, Dr. David Alan Gilbert wrote:
> > > 
> > > > 
> > > > > Anyway, I imagine that the problem with your patch was that it relies
> > > > > on font data from a different (read only) section, which is
> > > > > unavailable for some reason (MMU not fully configured yet?)
> > > > > 
> > > > > So I've asked Stan to test a patch that simply removes the relevant
> > > > > 'const' keywords. It's not a solution, but might narrow-down the
> > > > > search.
> > > > 
> > > 
> > > Stan tested my patch to remove 'const' from the font_desc and font_data
> > > structs but it did not help. (There goes that theory.)
> > > 
> > > > I wonder if this is a compiler-flag-ism;  I see
> > > > arch/powerpc/kernel/Makefile has a pile of special flags, and for
> > > > btext.o it has a -fPIC (as well as turning off some other flags). I
> > > > wonder if bodging those in lib/fonts/Makefile for
> > > > lib/fonts/font_sun8x16.c fixes it? But... this is data - there's no code
> > > > is there - are any of those flags relevant for data only?
> > > > 
> > > 
> > > I don't know. But I'm sure Stan would be willing to test a patch for you.
> > 
> > Can one of you point me at the config you're testing with so I can
> > try some builds with it.
> > 
> > Dave
> > 
> > > > > 
> > > > > The BootX bootloader doesn't work on New World systems, which is
> > > > > probably why we don't see this regression on anything newer than a
> > > > > Wallstreet.
> > > > > 
> > > > > It's likely that other Old World systems are also affected, if they
> > > > > are using BootX. We don't yet know whether the regression also affects
> > > > > Old World systems using the iQUIK bootloader instead of BootX.
> > > > 
> > > > OK, remember I don't think I've ever tried PPC via MacOS booting, so not
> > > > familiar with it.
> > > > 
> > > 
> > > I will try to set up a MacOS guest in QEMU, to see if the hang can be
> > > reproduced that way.
> > > 


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

