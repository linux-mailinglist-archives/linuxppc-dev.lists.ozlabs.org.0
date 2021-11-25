Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9645DD66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 16:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0MDy5b78z307B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ojx4WGbQ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HRI929DP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ojx4WGbQ; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HRI929DP; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0MDH0N8rz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:26:38 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 760611FD34;
 Thu, 25 Nov 2021 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637853995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCGDB6O/n27Br3GLxBmL5+Kul4WN9TqiH5pKcKbeahQ=;
 b=ojx4WGbQzQWaJf5UkHXPDGaI3WzgMNuZNHIwrIOFLZMSPEhBClhoEADVjT7JBWaLfRL/R1
 KV0IpJirWW9vpJsECN+og21E+wKYVW3P1Wka1JI228zETnSuAUJsMbKmFg9Tu7mSyrYlUo
 QgZ1nY9U6d7fvA8Cgof2xN7jF9HvX10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637853995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCGDB6O/n27Br3GLxBmL5+Kul4WN9TqiH5pKcKbeahQ=;
 b=HRI929DPWKDdkuqd7JET1dvYlu86GQ3MuaJQoZh+FFOgQJgwJWxZW9WdeRC129jxS5SptD
 rNCsdOniI6r9xqCw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7CF3CA3B81;
 Thu, 25 Nov 2021 15:26:34 +0000 (UTC)
Date: Thu, 25 Nov 2021 16:26:33 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] powerpc: watchdog fixes
Message-ID: <20211125152633.GV34414@kunlun.suse.cz>
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <163783300386.1228879.11827829331246737742.b4-ty@ellerman.id.au>
 <0f848698-91b1-6881-b584-8134ceecc696@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f848698-91b1-6881-b584-8134ceecc696@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Nov 25, 2021 at 04:11:03PM +0100, Laurent Dufour wrote:
> On 25/11/2021, 10:36:43, Michael Ellerman wrote:
> > On Wed, 10 Nov 2021 12:50:52 +1000, Nicholas Piggin wrote:
> >> These are some watchdog fixes and improvements, in particular a
> >> deadlock between the wd_smp_lock and console lock when the watchdog
> >> fires, found by Laurent.
> >>
> >> Thanks,
> >> Nick
> >>
> >> [...]
> > 
> > Applied to powerpc/next.
> > 
> > [1/4] powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
> >       https://git.kernel.org/powerpc/c/5dad4ba68a2483fc80d70b9dc90bbe16e1f27263
> > [2/4] powerpc/watchdog: tighten non-atomic read-modify-write access
> >       https://git.kernel.org/powerpc/c/858c93c31504ac1507084493d7eafbe7e2302dc2
> > [3/4] powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_nmi_ipi
> >       https://git.kernel.org/powerpc/c/76521c4b0291ad25723638ade5a0ff4d5f659771
> > [4/4] powerpc/watchdog: read TB close to where it is used
> >       https://git.kernel.org/powerpc/c/1f01bf90765fa5f88fbae452c131c1edf5cda7ba
> > 
> > cheers
> > 
> 
> Hi Michael,
> 
> This series has been superseded by this series (v4)
> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=272865
> 
> Do you plan to apply that v4?

It has been fixed up in

https://lore.kernel.org/linuxppc-dev/20211125103346.1188958-1-npiggin@gmail.com/

Thanks

Michal
