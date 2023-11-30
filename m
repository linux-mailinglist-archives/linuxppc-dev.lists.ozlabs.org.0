Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB057FF785
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:57:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ep5mfn6/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh2SH5FwCz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 03:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ep5mfn6/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh2RP5lNgz3cCv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 03:57:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FA6C61E45;
	Thu, 30 Nov 2023 16:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C48C433C9;
	Thu, 30 Nov 2023 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701363418;
	bh=jNTamNThZ0rAs2o+KORaTzGsMmcQ2kdIW/zV+pisW9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ep5mfn6/d/046KNhMrPxYSVs2b/H1SbZQJJM57P3hzC8hmlHC+aL7jEbzQHe/bzLV
	 ZDl9UEr14ekcpfCJk6RDza5apPq9i/1g5VSUREK4wQ/5Ib8LBFZY5NsHmgDKwcsJd5
	 raSV/4nqny+fZeQRHQXL35saZ9wB+AO2cAuRD2YA=
Date: Thu, 30 Nov 2023 08:56:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Message-Id: <20231130085657.6f7f500cc17b663747e4ee76@linux-foundation.org>
In-Reply-To: <ZUNXxp9AIkjQkP9s@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
	<ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv>
	<b71034f4-5cdc-44e0-b72f-1a8ffae0593e@app.fastmail.com>
	<ZUNXxp9AIkjQkP9s@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, eric_devolder@yahoo.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Nov 2023 16:03:18 +0800 Baoquan He <bhe@redhat.com> wrote:

> > > CONFIG_KEXEC_FILE, but still get purgatory code built in which is
> > > totally useless.
> > >
> > > Not sure if I think too much over this.
> > 
> > I see your point here, and I would suggest changing the
> > CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY symbol to just indicate
> > the availability of the purgatory code for the arch, rather
> > than actually controlling the code itself. I already mentioned
> > this for s390, but riscv would need the same thing on top.
> > 
> > I think the change below should address your concern.
> 
> Since no new comment, do you mind spinning v2 to wrap all these up?

This patchset remains in mm-hotfixes-unstable from the previous -rc
cycle.  Eric, do you have any comments?  Arnd, do you plan on a v2?  If
not, should I merge v1?  If so, should I now add cc:stable?
