Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C9DC9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 09:06:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44swgf6dkJzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swcg11kSzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:04:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="g2SwCdon"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44swcf5VwZz8t9Z
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:04:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44swcf59kNz9sCJ; Mon, 29 Apr 2019 17:04:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="g2SwCdon"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44swcf2y21z9s6w
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Apr 2019 17:04:02 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CB9E2053B;
 Mon, 29 Apr 2019 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556521439;
 bh=qrDMuZuX1wxLmzGaTUP/jakCb0ach5fUyGbQ7MM+gc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2SwCdonv4sBwoaRV9G5h5/VYEIdu1JH66qG29TL/dVWpc5On8fkEVWhVMDI8n9AJ
 u2rgivwzLW4an0/yc+6apvluiyNAzZ6zisXjLY+2FoloS7rvm39zSwZB1diBIqYDYM
 9xcUQ+oOKKTWjLTFRxyg4+bBbEaqXRmUyU2C4n1s=
Date: Mon, 29 Apr 2019 09:03:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH stable v4.4 00/52] powerpc spectre backports for 4.4
Message-ID: <20190429070357.GA3167@kroah.com>
References: <20190421142037.21881-1-mpe@ellerman.id.au>
 <20190421163421.GA8449@kroah.com>
 <87o94qac1z.fsf@concordia.ellerman.id.au>
 <87a7g99viy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7g99viy.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: npiggin@gmail.com, diana.craciun@nxp.com, linuxppc-dev@ozlabs.org,
 stable@vger.kernel.org, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 04:26:45PM +1000, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Greg KH <gregkh@linuxfoundation.org> writes:
> >> On Mon, Apr 22, 2019 at 12:19:45AM +1000, Michael Ellerman wrote:
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>> 
> >>> Hi Greg/Sasha,
> >>> 
> >>> Please queue up these powerpc patches for 4.4 if you have no objections.
> >>
> >> why?  Do you, or someone else, really care about spectre issues in 4.4?
> >> Who is using ppc for 4.4 becides a specific enterprise distro (and they
> >> don't seem to be pulling in my stable updates anyway...)?
> >
> > Someone asked for it, but TBH I can't remember who it was. I can chase
> > it up if you like.
> 
> Yeah it was a request from one of the distros. They plan to take it once
> it lands in 4.4 stable.

Ok, thanks for confirming, I'll work on this this afternoon.

greg k-h
