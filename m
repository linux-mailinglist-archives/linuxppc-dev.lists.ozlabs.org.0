Return-Path: <linuxppc-dev+bounces-15243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D70CF291F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 10:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl7bR2NMVz2yCL;
	Mon, 05 Jan 2026 20:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767603731;
	cv=none; b=ClQu1O/y7NxxaAxUIsg2lXlSlpoIgoqRbDIAJNCPfBnS8Eoqfw5NtISZbFTkFRQQnvx09OxYvZszpwr8VnEYC/Ikel7gfHBr5sat0LKGZ7Fgr5DcuvPxRs0x1C82BZyH6LVmx/tz7B3TPm3qJRMggfP65uSwBOp+e7vcq9JiJXfK6MfDlIVsjhXrFqmNoWcc/jgmXocaCc9YkaL2qrmo4HrIKbOhXiu5eGR9I3sPA4jOLoGA3E5NDwJgah3KLHaF/xnbTf0u3SORDh2Lig0Yfo4XvbqyICS4PGoPI7pfZd0HARiBD3VauEFVSTNJ3CztcKHLSEtr3kq6ciDWteAvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767603731; c=relaxed/relaxed;
	bh=1xqAYl2B4aY9Ee04vMRQoTyj2YoBp7o8KZy6mLHngL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9lJ/sScpM6YqVqnR64Rii1P56y8C1i5KDLUJGEVOjYphzCvan9K8be2sxkLcq9X1kncDwq78EcG6vq/gSUYaQDNV7tYOhtIUhuPkRsS0ZWoDobo52PlXyZcfeQ3+6/XY0dLgKHnaJx/pNv0lJcFor/f8NKpWhDglZrmdzs1/44i0imB1kOgbpduiP8rX4+2o5OvQZGgH9U+aZTcSfscTEcw3AokSLdbYfEuInGL4WUNzopA6TfPhuuNY4s+cv2sgz1F0+RMAUzdgitWcWod+FxDgYAUGudDAViFjR35eA3scV7ZUKj9JP9E8UVs9dR1mq/O58hzNObNZDJ4GdsfAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MJFznaVj; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tRF4KPRt; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MJFznaVj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tRF4KPRt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl7bP5dZnz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 20:02:09 +1100 (AEDT)
Date: Mon, 5 Jan 2026 10:01:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767603689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xqAYl2B4aY9Ee04vMRQoTyj2YoBp7o8KZy6mLHngL0=;
	b=MJFznaVjOOgyZqcyVh9q+pNxqtOQ7hZadS+W2UHvJwt1fALHgQzBJR+6IvcnLioGSZcJ5c
	GEA8Rj9yAEa7gHc8Mi0T6hpS758bmODb/xmptD4EdikDiG8oOy1+3rw4VuSemVgoXrwHAq
	euZJJYpITQqwkaHcTa44rv98/hTblf0U+qNUBZ+1Xlh3bcYlS3WeCVykmH5dNuTZuQtVRC
	xA4jni7SRMESRKaJE2uZ959fVeHlw2fQS1DbIQCNO+qxrF09we9LXUqUuvqXqbc27JZuis
	dxtXiT43Hh76mlBYlbmhrFmCEHS5gLUNJKpYCk4Sd+ZamyVFwADz3usavJ2cHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767603689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1xqAYl2B4aY9Ee04vMRQoTyj2YoBp7o8KZy6mLHngL0=;
	b=tRF4KPRtffhWF/TcM6vhTJTKNqprGSqRYdCclX8UVm3usjqCTn91+lKrqzTp4i5PVln1kF
	D+2fN2n5g0EhITAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Segher Boessenkool <segher@kernel.crashing.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <20260105095007-f78459cc-248a-4926-940b-bc41e58251f5@linutronix.de>
References: <20251230-cc-can-link-powerpc-v1-1-82298df6e3bf@linutronix.de>
 <f51557ff-412b-46e4-b968-78b4e4d9872d@kernel.org>
 <aVkico3Uno03-rkz@gate>
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
In-Reply-To: <aVkico3Uno03-rkz@gate>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Jan 03, 2026 at 08:06:42AM -0600, Segher Boessenkool wrote:
> On Sat, Jan 03, 2026 at 11:39:12AM +0100, Christophe Leroy (CS GROUP) wrote:
> > Le 30/12/2025 à 08:06, Thomas Weißschuh a écrit :
> > > The generic CC_CAN_LINK detection does not handle different byte orders.
> > > This may lead to userprogs which are not actually runnable on the target
> > > kernel.
> > 
> > Isn't the kernel supposed to handle any userland endianess ? Macro
> > SET_ENDIAN() is there for that as far as I understand.

To be honest I have no idea how switching endianess in the middle of an
application is supposed to work with C applications. Suddenly all of the
UAPI needs different a different byte order, for which I see no support
in the kernel.

A big-endian kernel still does not seem to load a little-endian userspace
executable and instead fails with ENOEXEC. This is the issue I am trying
to address.

> Yes, the kernel does not get much data out of data structures in memory
> in the first place :-)

Except for all of the UAPI :-/

> > And if you want to be complete, I think you should also check whether the
> > ELF ABI is v1 or v2.
> 
> ELFv2 is version 1 of ELF, as wel as version 1 of its particular ABI.
> It is just a cutesy name.  The thing now called "ELFv1" was called
> "PowerOpen", or simply "PowerPC 64-bit ELF", or one of a hundred other
> names :-)
> 
> All of the ABIs we use with PowerPC (in trunk, anyway) work with either
> endianness (well, you need a userland built for it of course, and maybe
> AIX and/or Darwin have not actually been designed to work with wrong-
> endian as well).
> 
> But powerpc-{elf,linux} and powerpcle-{elf,linux} work equivalently
> well, and so do both BE and LE versions of ELFv2 (yes, BE of that exists
> just as well, and some distros even ship it!)

> powerpc64-linux and powerpc64le-linux use different ABIs though (BE
> ELFv1 and LE ELFv2, resp.)

But these are all toolchain considerations, which are fine.
I am trying to make sure that userprogs are actually *runnable* on the
kernel they are being built together with.


Thomas

