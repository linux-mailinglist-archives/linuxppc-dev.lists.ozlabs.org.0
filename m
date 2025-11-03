Return-Path: <linuxppc-dev+bounces-13695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA4C2C757
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 15:47:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0ZDX4jgcz304H;
	Tue,  4 Nov 2025 01:47:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762181228;
	cv=none; b=CHWu7Qm45jweuu3moTXHKeTgUQ5UgcrKonJDTcQpj51gv0anVb8APaxbu1ud/ESNAgO5Jsgsnf22FfnuhIjN4vKDGJkPIcuq+/JRbMP9vA8MwGsZfm4xOyzv9L9mS6pBTV17fcmHpA/zjyhTXQfxKrsV2dYKIk1nlmQo7MmATojD8ICZkeD6C9lP1558SU3Bg1D8JAcYjDzEFNY/fmLl56wzOLDPi313zpcH1v7Zm1PSZoiplx53Y2wA9soULZIeoHCCaoew6l+2u5HlLtQCOx9Dw/iA72gdzwhATdr6wmnlYT+vOrwE3ovL2PyuvEMFD359riLpYVriCbrUqa3Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762181228; c=relaxed/relaxed;
	bh=iI95N45xUlZVhTMjnyMu5qguS//l74sBdQ6FwuCHQXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiLBiWiTDApCAInqY+S73uIX7HgWckXBLjshlfcIlvdl/Qzizr5+c/kRDxFb5FCWT7RMuXCc3tnhhnmCkjfiu198SSo3q6FL90rYmsORjgNJdqtLewkfZ8q473X7QKsUYW7ogQoRtBYyPQ9V3VYfuHvRV0gEv5CmR8+joHhddrOricZaL20XU5CSSZAf+kiU+ZqlwSAop+2d0xLPdqDMZycDLAc3+ODYCfFhTuLHX4YNgmI6DQ9FobfJ9D5cV6MHaA1CjNuXk95AudI9uaD1iX/HaTb6iL9kbBW59wSmsRIwYVvoEhqKBei6HAwFgdlMrpoLTzRVNOflX02Y/JjE0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0ZDN1980z2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 01:46:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iI95N45xUlZVhTMjnyMu5qguS//l74sBdQ6FwuCHQXw=; b=tcpIk2F7iJsy2Cok39kpG4TNpm
	lKGFJAP9fR4texKlFgtntVEWzbhlmiENIrTA4l+0JifVpJqLmNZfyAXXzOs8FaCh5TGjX0XUTzarD
	8Bot3EmkXkU73yUEzFf/8auMdO142JWOdp6VgE+ueiT+l21xWODyM9U7fixMQ/Zt1hFAeXAgJGlvM
	yc7JRFC4M5dUyOMS2EHvc/py/A352QKchG1ymiHG1p+aVeuaAEdBB7aRZ8j+BXdpJvRIJwtRaNrR/
	ekhG7PmxVehxdQ8KrpsBgKsQGg3mU3AAzOvUzl92pYuLNuhkTO5useVCbiw5bU+POSPXTGYVwLK21
	AblPip2A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvpC-00000009AtY-0Qhs;
	Mon, 03 Nov 2025 14:46:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 40487300220; Mon, 03 Nov 2025 15:46:26 +0100 (CET)
Date: Mon, 3 Nov 2025 15:46:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	David Laight <david.laight.linux@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
Message-ID: <20251103144626.GX4068168@noisy.programming.kicks-ass.net>
References: <20251027083700.573016505@linutronix.de>
 <20251029102331.GG988547@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029102331.GG988547@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 11:23:32AM +0100, Peter Zijlstra wrote:
> On Mon, Oct 27, 2025 at 09:43:40AM +0100, Thomas Gleixner wrote:
> > Thomas Gleixner (12):
> >       ARM: uaccess: Implement missing __get_user_asm_dword()
> >       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
> >       x86/uaccess: Use unsafe wrappers for ASM GOTO
> >       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
> >       riscv/uaccess: Use unsafe wrappers for ASM GOTO
> >       s390/uaccess: Use unsafe wrappers for ASM GOTO
> >       uaccess: Provide scoped user access regions
> >       uaccess: Provide put/get_user_inline()
> >       futex: Convert to get/put_user_inline()
> >       x86/futex: Convert to scoped user access
> >       select: Convert to scoped user access
> 
> Applied to tip/core/rseq along with the first set of rseq patches. The
> core-scoped-uaccess tag should denote just this series.

Due to various build fail, I've re-created the whole branch, including
the tag. Sorry about that.

