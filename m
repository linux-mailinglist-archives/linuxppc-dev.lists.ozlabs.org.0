Return-Path: <linuxppc-dev+bounces-14147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F8C569A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 10:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6ZlR3DNlz2yvk;
	Thu, 13 Nov 2025 20:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763026275;
	cv=none; b=cqiS/ewfXhEpPO/CcNPa+hZgUklfoLPyFszo5H4/3X71V9iNF9g1E+6uVSe8MgGrXCvmZsoPigVw5VSkqSlP9nEPXfQKUeVFWKNI/tS3Oa4rvt1Di0/1yvqyf1xRfE+ntK8oeREACvmvdNdjfzUScwYQIAEUkzJQr79Yi0ZQ3fGESVOyMNz5Q8o8XF340ktYK1VBh/Eqrhwgem8z/g0w87ssxBHt/btrOc9HLsXl7LiA2JGjriURLQthAXQJvvPSc8SyseBYDCkMKDnb+dNgHIFiaaDMUMSFlifnI9j3etKqfKifS+ug99KLvefHSgows3Ib2znjH6JbaxwSbBvJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763026275; c=relaxed/relaxed;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6oKXxrDUTzkXovnlbaWDT7Ub81oDiN4eyi45sC8ebfXl9fRv744UizH5PiXUIiRQ+iVDlu5yiOdG9EylpAddl2nk5vdN1JuoaHwd3DOu+8mkC7uKQq+6fr9h8vOyhc2BEh66WbBOCb8OGMrNjfY/vh2Y3av8OVtuiYoJrRSxJwGSeyLW1QVeZaf1GtCsIc86eWg+IEryJv2rr6DZXVLaVgUDw3JLejHQ6oOzSv2CbI/k7KtBXX/AFDlQEv7Dqu+D+W1V7PvllIxXthNwdr/1CZb+pKPDSlI9s3MnAhKLYQafaCxRcbPK07RbrcRHCEOkmD74KdQSbsLENV3xzPo8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ygwUYp2F; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+qRXOq4J; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ygwUYp2F;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+qRXOq4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d6ZlQ50Ghz2yvX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 20:31:14 +1100 (AEDT)
Date: Thu, 13 Nov 2025 10:31:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=ygwUYp2FepRzD3HjKdKbHo13iKPe5fGwe/j9Ys6zZiMvxAWN1OBuAhyCiELOtD2RGYJltU
	8VX7MMGJ5DjE9n6DrWYVAuNwfdZvsbH1aHRwEYX3teYkFw5AJBO35bW4WpF5Tk5kFHUWrL
	gLNEY+Wc1BUOIms3gsYJ/wOrqfpecWcaeu7T+cTr/m0bQLMtttloE8h10mHvi2/tYzORRN
	G/jTKrO/gkksvgHb4CvJQr0H0W8vsKeIQ0e8rgMNvSrLaU6xLfa0eBk4Zd3xD9o+7GQDNd
	mfHowgXQeM41cjXmGj3ubXSd3BExQ+zjAH7KBXzuEcjBpvptyc3CwuDZVPJ21A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=+qRXOq4Jk2slHhdA1iSs+PP5mTSlOHMcDybHXlytmmFNwk4bSfci9b5O8vXXVZ+OjYzTkf
	EiwvRX9YrR/EFeCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRToC77bNUy2sKAK@derry.ads.avm.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Weiﬂschuh wrote:
> > The current logic to inherit -m32/-m64 from the kernel build only works
> > for a few architectures. It does not handle byte order differences,
> > architectures using different compiler flags or different kinds of ABIs.
> > 
> > Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> > the flags used for userprogs.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Changes in v2:
> > - Rebase and drop already applied patch
> > - Disable CC_CAN_LINK if the test program generates warnings
> > - Move to architecture-specific logic
> > - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de
> > 
> > ---
> > Thomas Weiﬂschuh (10):
> >       kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
> >       init: deduplicate cc-can-link.sh invocations
> >       kbuild: allow architectures to override CC_CAN_LINK
> >       riscv: Implement custom CC_CAN_LINK
> >       s390: Implement custom CC_CAN_LINK
> >       powerpc: Implement custom CC_CAN_LINK
> >       MIPS: Implement custom CC_CAN_LINK
> >       x86/Kconfig: Implement custom CC_CAN_LINK
> >       sparc: Implement custom CC_CAN_LINK
> >       kbuild: simplify CC_CAN_LINK
> > 
> >  Makefile                |  8 ++++++--
> >  arch/mips/Kconfig       | 15 +++++++++++++++
> >  arch/powerpc/Kconfig    | 15 +++++++++++++++
> >  arch/riscv/Kconfig      | 11 +++++++++++
> >  arch/s390/Kconfig       | 11 +++++++++++
> >  arch/sparc/Kconfig      | 11 +++++++++++
> >  arch/x86/Kconfig        | 11 +++++++++++
> >  init/Kconfig            |  7 +++++--
> >  scripts/Kconfig.include |  3 +++
> >  scripts/cc-can-link.sh  |  2 +-
> >  10 files changed, 89 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> > change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> > 
> > Best regards,
> > -- 
> > Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 
> 
> Thanks for the patch set and all the work behind!  I found only one
> issue in patch 3, the rest looks good to me as they are.
> 
> I haven't reviewed the compiler flags for the archs, but from the formal
> point of view they look good to me, too.
> 
> How shall we proceed with here?  I think, easiest would be if we get
> appropriate acks from the architecture maintainers, so we could take
> this via kbuild.

That would surely be the best option. Unfortunately quite frequently it is hard
to get architecture maintainer's feedback on a cross-architecture series.

> Other opinions?

It would also work to only take the first three patches through the kbuild tree
and push the other ones through the architecture trees.

I don't really have a clear preference.


Thomas

