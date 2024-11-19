Return-Path: <linuxppc-dev+bounces-3431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14C9D212F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 09:03:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsxnR1RPmz2yG9;
	Tue, 19 Nov 2024 19:03:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732003387;
	cv=none; b=f+U7HomxOMezOYP39s+ZLPGHP02Tbdtwa6pX0u9LVTNfafmEZwi6R4Q5kedVbUh5/WlkmmtFw9De+Dym0mkj1KIW5rRQ4TnCkuAssAghfNESj+nHtSj6XhboGrUw4XUZQjVK92K6bsr5ClhODP1aIe0ZxIAvX9sjlJG55513mESNMFYXyUuVy3Hk2wdCQbCgQei/fBIYaC1ahRRj+IAMyY2hHtxxqxBkMm1UFu3ecXXSGJyTTBhddRrk3476bpNPdVHhJcRbdXGbNQvIRBB4l+Zvo4CkAf0fm8D0mwUiTZhzDdHgQFKloz9qa18ER8pWFgpsD2RlY0lBEay5o8fALA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732003387; c=relaxed/relaxed;
	bh=ZFza8Q5Jtv6OUgZ69cq5R5UQc3mI2n+Xf++TTy5qpZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlpdC+nd1fX0BoS+7OeAnR0uiC7/ydzX8qSArMLM7v7qa2RDPPi3eADOINeifiA0jgnjtpQMl88ghXNqVp0bT+v4YIwuIbUMRgp3E9gWsB0PeosYVzEGxWSM04VxRTM4VcJPWUDdkKovNg8gnhYBhY7wnRX+2lrGRGhar26UczCVPU9m2gyi6kusBu+OClQEdiNbAS4PNcr3s6Cigbg5nXs+ya7ujDSN7+bEkt6qE9RO8Es7I1Jt/v6KIZTEgXkf9beKaJDq9nqlnspkr8Xj7LI+gJmTdbViVYHk8a6Ed3tgciofOswTbL4+NcPkeaLzk6vUc7tOwWlAyEiIXb60uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2uA6OU5w; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8WrfeKuL; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2uA6OU5w;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8WrfeKuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsxnP4Y3Rz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 19:03:05 +1100 (AEDT)
Date: Tue, 19 Nov 2024 09:02:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732003374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFza8Q5Jtv6OUgZ69cq5R5UQc3mI2n+Xf++TTy5qpZU=;
	b=2uA6OU5w4YECX/elRymX1Z604jxUfMor7k64FjQXptp1RRqBDLYmF+d+Hdaa+WgmY5qtG1
	eozzxZJDI0vNLA+jq0SqPTEMqIfSDxHTY84BrDeHa3wpEMj7H8RhBnwmqNQVAjq/B8LZgm
	F7EfeDNWY84U0OdTdq0s/Zy2Bk/ldpKZM1cxco5r9nKKqOO7B2Guutd1rZh+yJk+J+4lX4
	R55OEWjGG/erpX1xSCLwAVGYe4neV9usYzcOfbPHZ3Xf0+ZQGW1Y/113IlP0r/Zg+XaQhj
	1zDEucvCU+QeDIX5XuW9IzF6Ech9e6XbFJXkbf2qTSljTOKy0682KBgO28k2yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732003374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFza8Q5Jtv6OUgZ69cq5R5UQc3mI2n+Xf++TTy5qpZU=;
	b=8WrfeKuLT1ruYKoLNfJ0ea+f7qhGLEzNI6VEfv74xhPaXdNzZ1UeGu+dmbUOffIogAE3Tl
	TerefKx10Qk+ReCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
Message-ID: <20241119090120-5e463ea1-b62e-4dae-ada1-34e5e112bff2@linutronix.de>
References: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
 <173184539749.890800.8297350541963703609.b4-ty@ellerman.id.au>
 <20241118075902-8b0cf2ea-d772-4c05-9b5d-14aba194e649@linutronix.de>
 <877c8zj44h.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877c8zj44h.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 19, 2024 at 02:26:22PM +1100, Michael Ellerman wrote:
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de> writes:
> > Hi Michael,
> >
> > On Sun, Nov 17, 2024 at 11:09:57PM +1100, Michael Ellerman wrote:
> >> On Wed, 13 Nov 2024 09:06:58 +0100, Thomas Weiﬂschuh wrote:
> >> > These offsets are not used anymore, delete them.
> >> > 
> >> > 
> >> 
> >> Applied to powerpc/next.
> >> 
> >> [1/1] powerpc/vdso: Remove unused clockmode asm offsets
> >>       https://git.kernel.org/powerpc/c/d7a82238cb8c77d4ed8cc97cd556c5f3e64bc749
> >
> > Thanks!
> >
> > Is there any chance to get this merged as part of topic/vdso?
>  
> I could apply it there, but I don't think it will be necessary, because
> topic/vdso will be empty vs mainline as soon as I send my pull request
> for v6.13.

Ah, I assumed the generic next branch wouldn't make it into 6.13 this
late in the cycle.

> > My vdso rework patches for the 6.14 cycle rely on these removals.
> 
> Assuming you rebase that series onto v6.13-rc1 or later, this commit
> will be included in that base.

Great, thanks!

> But let me know if I'm misunderstanding something.


Thanks,
Thomas

