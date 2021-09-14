Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007040AD73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82Xj2HXVz3bjG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:22:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HVq0sP8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HVq0sP8J; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82X70Kxrz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:21:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631622102;
 bh=SGmkhJPGIfCGzEckYi2O+WbmHpSLcYp+HxFHaUuDvuk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HVq0sP8J8jzizJQOnivhASlokwaA8svM2hXDsjMztq3yrz9mFfliD1mxwmYq6P1oy
 5OQAi86EFUQ2s2w5VpKQ+mYhNhsy+7dLmgehyd+ixnkRXL+3jNyzBDLODNS7W4MVmh
 cqTiasrsAdGozGGNtoPpsSlcO8uTh6AtwzoGyYYKVEYea68dOAx3BGEapQ7chzzm1Y
 ZmRYtuQHAAlNx7IXGY50Ks89slzj6cO7xs5sXTio2eskFipkseH8TqYO7eeiNtSVzg
 qepcoFdtz16P3Upu+NIf393xxtfIy7VOLr4xkvBdmRomHTM/Kolh+10miFt7CJEw1t
 FDTbfkwKmyMhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H82X6487zz9sW4;
 Tue, 14 Sep 2021 22:21:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the origin tree
In-Reply-To: <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <20210914120818.4a102b46@canb.auug.org.au>
 <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
Date: Tue, 14 Sep 2021 22:21:41 +1000
Message-ID: <87h7enl54a.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Mon, Sep 13, 2021 at 7:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> That patch works for me - for the ppc64_defconfig build at least.
>
> Yeah, I just tested the allmodconfig case too, although I suspect it's
> essentially the same wrt the boot *.S files, so it probably doesn't
> matter.
>
> I'd like to have Michael or somebody who can actually run some tests
> on the end result ack that patch (or - even better - come up with
> something cleaner) before committing it.
>
> Because yeah, the build failure is annoying and I apologize, but I'd
> rather have the build fail overnight than commit something that builds
> but then is subtle buggy for some reason.
>
> But if I don't get any other comments by the time I'm up again
> tomorrow, I'll just commit it as "fixes the build".

I ended up doing a more minimal version of your change.

I sent it separately, or it's here:

  https://lore.kernel.org/lkml/20210914121723.3756817-1-mpe@ellerman.id.au/


cheers
