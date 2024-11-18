Return-Path: <linuxppc-dev+bounces-3397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 207EC9D09F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 08:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsJRz6CcJz2yRF;
	Mon, 18 Nov 2024 18:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731913247;
	cv=none; b=LXxDTS9MnQZWn5TaRGdMzJ3K1NoR5vcM5hwTJRACrJdYyO9Foe/9m+K+JpP6ffDU76B8lkMAuOw586UiSiRsLf9mp6xBSDi1FtEAZhgX9AimyGnyqthHwsMFXW9hxYS85v7Wt4X+d+txMrlABBzy1QfTe8CM+GNWaah8oHSzHFVyuF643VaFzoyIduOhJ92we1TlOXl+Yzd6HyLzzCgEyyGMuWBHo4RDj0a1hCDXncBeaQ+1V1H2mFy/ihWYCYIXLrEr7uIh3J/OTFPbt/4HS6WP1MVTy8ELsoPhf5xONngK8w2EDdLJbwi/QgAOU104bPUTZrThRf0Yi5QvAMl+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731913247; c=relaxed/relaxed;
	bh=oF5pOKmdQCV/D0pgaED0/XtFmy0l+sX6C2AEp8x+rhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5dBESJVcoArwQrpX2/LAX0B3huupzIvUIvZabANe4sficdwgslLSVbYTS3jqxhiSQpIbYbEH54agi+dK4f045aM6XrP7lDYfxFW1YpP/8hbRM9u/6nuXh1Qz7yZ3Hgcf+e2gIyeEpaRoV+PJVWNfPDlwZnqfU/g+Ls/N37Pn74ADD3DD1mYg5YJt0mGRnwfx1qaXVVSwM8eTxoeHyFPhCvsa42I6PqxrpP6J9HTkw/oqLR9SQEBCW81IyXx7C/+48JaVKeUqVRgeWl5ihOWz5GWkTE414hgh/LFuOrmAf1dIGjccXsYnynaR5R4QDOotOaNb5E/DbbA1L6QmQsLyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hd/QvC5e; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F+Gm6KFJ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hd/QvC5e;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F+Gm6KFJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsJRv3FTWz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 18:00:43 +1100 (AEDT)
Date: Mon, 18 Nov 2024 08:00:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731913237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oF5pOKmdQCV/D0pgaED0/XtFmy0l+sX6C2AEp8x+rhs=;
	b=hd/QvC5ePU2BoRKlRKMSF8eNQXPXPIp+AMyx0AqzS55fg+MZkdgI63wew749KsiJ9HQxJs
	/4zIWiIBFoN3U68jTfyYVVAavvWZsc6YV5ZT5i3pLpRhEuleX7g3JfYwjzKekgriIDEeRF
	TSlwZ3lnbIZLnAIdJmN46xU/kdG2923xLnf/R6WqL98g73OvxnFb7AX5RcuMnN0aR0O1ud
	LSSjzMMsBiRBvfSEB3pk6C/xIA5CLmtI6mR2Nb0k/PStsUzr344a+zPxPOrBwl+AyFCMIW
	QBar7txXUXXY3v7wyk9fbiyCliEvuegYxrXLoKl70VXZFRq+eGUaY2uQydT0mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731913237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oF5pOKmdQCV/D0pgaED0/XtFmy0l+sX6C2AEp8x+rhs=;
	b=F+Gm6KFJNo6WSUjy3CL9r0U73w9wGA03l4ySeoI1nM4Rh5+c2P5zuGwktkiDDWgkQ6mdy4
	Ih9bpFaZAjb4GiBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
Message-ID: <20241118075902-8b0cf2ea-d772-4c05-9b5d-14aba194e649@linutronix.de>
References: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
 <173184539749.890800.8297350541963703609.b4-ty@ellerman.id.au>
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
In-Reply-To: <173184539749.890800.8297350541963703609.b4-ty@ellerman.id.au>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

On Sun, Nov 17, 2024 at 11:09:57PM +1100, Michael Ellerman wrote:
> On Wed, 13 Nov 2024 09:06:58 +0100, Thomas Weißschuh wrote:
> > These offsets are not used anymore, delete them.
> > 
> > 
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc/vdso: Remove unused clockmode asm offsets
>       https://git.kernel.org/powerpc/c/d7a82238cb8c77d4ed8cc97cd556c5f3e64bc749

Thanks!

Is there any chance to get this merged as part of topic/vdso?
My vdso rework patches for the 6.14 cycle rely on these removals.


Thomas

