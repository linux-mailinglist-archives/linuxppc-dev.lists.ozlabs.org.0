Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 599824C6C74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6fmk43MXz3bth
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:28:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=RT/IL34Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=E7ShsxTd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codewreck.org (client-ip=2001:41d0:1:7a93::1;
 helo=nautica.notk.org; envelope-from=asmadeus@codewreck.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256
 header.s=2 header.b=RT/IL34Z; 
 dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org
 header.a=rsa-sha256 header.s=2 header.b=E7ShsxTd; 
 dkim-atps=neutral
X-Greylist: delayed 511 seconds by postgrey-1.36 at boromir;
 Mon, 28 Feb 2022 22:31:16 AEDT
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6dVr65HVz3bXy;
 Mon, 28 Feb 2022 22:31:16 +1100 (AEDT)
Received: by nautica.notk.org (Postfix, from userid 108)
 id 244AEC029; Mon, 28 Feb 2022 12:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1646047355; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RT/IL34ZMb4wE13ecGpP0cPYfvUALLBHI3h+Nwqjk6un5A9pkdgT4k1/FqMlC2j9j
 5rXnbfX9CeRpV2BF45XH/gyMBAIlLBsJthcQL9g53J0izMt9+z9BAyzbfmHq+6LfSX
 iY61zvlTrG45WH2waKu+VWh33WBy571UkxI0mCXre32lMHSogGum3oUpiCiQjYBFm0
 UrVmOxcDfy2+XRbr8yw+xW4xvsCb62na1mVOfycyKoB6ejlKrB2T4jQrMTugRWsRaP
 9QmdpahZrSpqJLY1nBe2woUd/0EuRh0B46d3WvFe6/e41bNLFb+98ZtIxTmDiQp/ER
 KjOOwgzjanHhA==
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
 autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id 6162EC009;
 Mon, 28 Feb 2022 12:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1646047353; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7ShsxTdVoGEbpDYFF27HXnsiskOzo+90fWYK/YK/pcgewcio/aI2ukKBbk8Ggf8c
 PSXNNRohBAnroHDgJmzD26WOCBS51v3CgaeWJoVRlz3gzi1Wk2c722FgVeG9ZC8Gq1
 VxeMBZJsJJ2s49Z0zkRuzCFT0FdEMmJ4Jlg8so5xUNkI1Pmhr9T77hNpqbhc5MUSIm
 Vf9CZqLUP+U5LMthWxqmxcIfa+qcI6C/HHTtBGWVbD6UPJLDQeI2MK30nqaJN3mP3G
 MxeZ4iTWnejwYcukxHfaPz9ZlYf9Zxp1r7k3O+mRBYZR8EPZsNImCl3hToWu78+1r5
 3QpJ5t/64l3TQ==
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id 8186bc45;
 Mon, 28 Feb 2022 11:22:16 +0000 (UTC)
Date: Mon, 28 Feb 2022 20:22:01 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
Message-ID: <YhywWTEIY7UnCYtL@codewreck.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
X-Mailman-Approved-At: Mon, 28 Feb 2022 23:23:25 +1100
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a bit more work (and a lot more noise), but I'd prefer if
this were split into as many patches as there are components.

I'm not going to review the parts of the patches that don't concern me,
and if something turns out to be a problem later one (it shouldn't but
one never knows) it'll be much easier to revert or put the blame on an
individual smaller commit than on this...

With that being said, ultimately I don't care that much and will leave
that to people who do :)

Jakob Koschel wrote on Mon, Feb 28, 2022 at 12:08:22PM +0100:
>  net/9p/trans_xen.c                            | 11 +++--

This 9p change looks good to me.

Reviewed-by: Dominique Martinet <asmadeus@codewreck.org> # 9p

-- 
Dominique
