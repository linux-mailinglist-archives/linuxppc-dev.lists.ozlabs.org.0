Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FE441F7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 18:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjgPg2Y23z2ywm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 04:43:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JLgNFWOy;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RyfWIzCB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JLgNFWOy; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RyfWIzCB; 
 dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at boromir;
 Tue, 02 Nov 2021 04:43:13 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjgNx5pZRz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 04:43:13 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D96DD1FD6F;
 Mon,  1 Nov 2021 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635788162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3egb8Tn3hseoFHFGSeI77MtXHmQdw6ZfWwaFfXGbas=;
 b=JLgNFWOyXLVvjwu+DpgdJ/N3n42n6to1Byh6BKfLjBT+eATUILAxjcXMmaE0+dpbfyVlY+
 wZ5tnPteScsxKLe6zhFtZGVDUJKU+6OCM00PtbkKLr69BMKEnZumUMFCZ1HFAIt+VzvfdO
 So4/z4olyYQE+UOSvcSpmpLKMqlqRmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635788162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3egb8Tn3hseoFHFGSeI77MtXHmQdw6ZfWwaFfXGbas=;
 b=RyfWIzCBF5XLkKdCHS91dH8jWyX6KuYxXNjWz5IYlzsLaGVIV3W6EaJe7epCUUrGjHvDgm
 KSQBa2SBhnDmcbDg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id BCB2AA3B81;
 Mon,  1 Nov 2021 17:36:02 +0000 (UTC)
Date: Mon, 1 Nov 2021 18:36:01 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Message-ID: <20211101173601.GM11195@kunlun.suse.cz>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
 <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
 <8123f71a-3db3-0a5d-c1b0-59dce2df154c@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8123f71a-3db3-0a5d-c1b0-59dce2df154c@physik.fu-berlin.de>
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Oct 28, 2021 at 04:15:19PM +0200, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> On 10/28/21 16:05, John Paul Adrian Glaubitz wrote:
> > The following packages were being built at the same time:
> > 
> > - guest 1: virtuoso-opensource and openturns
> > - guest 2: llvm-toolchain-13
> > 
> > I really did a lot of testing today with no issues and just after I sent my report
> > to oss-security that the machine seems to be stable again, the issue showed up :(.
> 
> Do you know whether IPMI features any sort of monitoring for capturing the output
> of the serial console non-interactively? This way I would be able to capture the
> crash besides what I have seen above.

I am pretty sure you can run something like

script ipmitool

to capture output indefinitely, and the same inside screen on a remote
machine.

Thanks

Michal
