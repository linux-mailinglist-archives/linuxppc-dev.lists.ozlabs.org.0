Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1351BDB2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 13:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv9pW1N5vz3c90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 21:05:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o+hvXakt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv9nt6yXnz2y7K
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 21:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o+hvXakt; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kv9ns6ZkQz4x7Y;
 Thu,  5 May 2022 21:04:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651748690;
 bh=wpq71xW68NewGZlAJT/Mbe5vMSkm9s//K8e12ge0EYI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o+hvXaktSQYQNY6d4vmVftc5smUDpiHsCf4l46fYHB9D49gKHnDgKA7utxYttTEiE
 EtUizr6u1/768tK1D3sNzvorNgMPOl3TCDFIWn490jz22di/QrSu1JDi5F6DYoXB7p
 wsqM3d21+ckUsTg8yOJ6dvgJRSF3pprG9gdOYckctiIjOrKu7B1b0lZqYL9KqAOrZz
 fAJib2sHtE0sGlHib2pkz+dTQM9V4r8vupBCaD7VL0Uqdtm7++8mRKE7m6s223EkSj
 duRqXfjwrOjV7PGzdm5P17vEnHvKZFv+NBcwl0qmlN9vocynPwrvyU8hfy/B8okXsh
 7mBlTpEO/Pr+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
In-Reply-To: <YnKDaTVDoqgFeQHz@smile.fi.intel.com>
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
 <Yk2PE7+oEEtGri95@smile.fi.intel.com>
 <CACRpkdbqfNiWQG6ayqMXACby4xkW0pY6JhdYE-x+pWkSxJU5TQ@mail.gmail.com>
 <87fsm7fkbt.fsf@mpe.ellerman.id.au> <YnKDaTVDoqgFeQHz@smile.fi.intel.com>
Date: Thu, 05 May 2022 21:04:46 +1000
Message-ID: <87wnf0tf3l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> On Thu, Apr 21, 2022 at 08:42:30AM +1000, Michael Ellerman wrote:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>> > On Wed, Apr 6, 2022 at 3:02 PM Andy Shevchenko
>> > <andriy.shevchenko@linux.intel.com> wrote:
>> >> On Mon, Mar 28, 2022 at 03:16:08PM +0200, Linus Walleij wrote:
>> >> > On Wed, Mar 23, 2022 at 6:43 PM Andy Shevchenko
>> >> > <andriy.shevchenko@linux.intel.com> wrote:
>> >> >
>> >> > > Let GPIO library to assign of_node from the parent device.
>> >> > > This allows to move GPIO library and drivers to use fwnode
>> >> > > APIs instead of being stuck with OF-only interfaces.
>> >> > >
>> >> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> >> >
>> >> > That's a nice patch.
>> >> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> >>
>> >> Thanks!
>> >>
>> >> Can we have this applied now?
>> >
>> > I think Michael Ellerman could help with this?
>> >
>> > Michael?
>> 
>> Yep, I'll pick it up when I start putting things into next.
>> 
>> That's usually the week after rc2, but I had a break for Easter.
>
> Any new on this? I haven't seen it yet in Linux Next.

It's in today's next (next-20220505).

cheers
