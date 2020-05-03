Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 352061C2E04
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 18:47:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FX2z6SlgzDqkg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 02:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=i+8l0oCz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FX136CLzzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 02:45:43 +1000 (AEST)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7537E206CD;
 Sun,  3 May 2020 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588524341;
 bh=7PClR6UZXHPQPfYuJ166N35yzuxIOy+NZ3sB+Vh7Rfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i+8l0oCzFsTY1t3+uPU3nkzTtCkiU/MxjHqLUXA3N70W/8bJuSaFu9F3d/hA/J0vU
 6khe+X8qiipaQtVRrkunI3BcQWvx+1VCPM2W33U8gzGBGXMSMunL1/VOOpVpLjxNx0
 QX8e96H4ItbI2a55lOhhle/oE/YXyGHkAtU/1XqU=
Date: Sun, 3 May 2020 09:45:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 0/7] sha1 library cleanup
Message-ID: <20200503164539.GA938@sol.localdomain>
References: <20200502182427.104383-1-ebiggers@kernel.org>
 <CAHmME9oPqWfTwTtawM-29Lqck-N-kYo4nGr1-4hCW975DhB0Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9oPqWfTwTtawM-29Lqck-N-kYo4nGr1-4hCW975DhB0Uw@mail.gmail.com>
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
Cc: linux-s390@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, mptcp@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 02, 2020 at 03:05:46PM -0600, Jason A. Donenfeld wrote:
> Thanks for this series. I like the general idea. I think it might make
> sense, though, to separate things out into sha1.h and sha256.h. That
> will be nice preparation work for when we eventually move obsolete
> primitives into some <crypto/dangerous/> subdirectory.

That's basically what I suggested in the cover letter:

"As future work, we should split sha.h into sha1.h and sha2.h and try to
remove the remaining uses of SHA-1.  For example, the remaining use in
drivers/char/random.c is probably one that can be gotten rid of."

("sha2.h" rather than "sha256.h", since it would include SHA-512 too.
Also, we already have sha3.h, so having sha{1,2,3}.h would be logical.)

But there are 108 files that include <crypto/sha.h>, all of which would need to
be updated, which risks merge conflicts.  So this series seemed like a good
stopping point to get these initial changes in for 5.8.  Then in the next
release we can split up sha.h (and debate whether sha1.h should really be
"<crypto/dangerous/sha1.h>" or whatever).

There are 3 files where I added an include of sha.h, where we could go directly
to sha1.h if we did it now.  But that's not much compared to the 108 files.

- Eric
