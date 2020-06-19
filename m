Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247F2001EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 08:22:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p7yQ5hw5zDqV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p7wP5T8wzDrNB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 16:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MgSsavce; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49p7wL5jVwz9sRk;
 Fri, 19 Jun 2020 16:20:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592547653;
 bh=EKAlwH7KMWYrcFWL23SicxqJVWA6PUXsyMOdTXnR/PY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MgSsavcewAYAsBdDFbtoBeCs4pwI8Pw44ofaqZsWzbBvq/8XIIX5HBYIj1OGZ1RBH
 SBR3aXYv3KyrTy7uZZA6Ur26SBqzW3f7GzJbauWhV9BiSvkNmgcZwl45966TlljNL0
 0nC02luelmCpLqXFfsCx2pS9OC+R6l8V+mpwjFC5NjZuUC84niSlpcfs65KBIo7uW4
 0a5huAuSz3bWTfax5WFGP6PRj+NVuer2xaCuJpOiGu5FbQmcmIXXAcEr+86kSl8LY3
 K0TG3L7/8QwVal78sg2tT7Pb2WSUFxZN19KK+34iL6sa2mMOupHRyg6ziGP1+vzjs0
 fHbErT7mhl2zA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>,
 Tony Luck <tony.luck@intel.com>, Helge Deller <deller@gmx.de>
Subject: Re: rename probe_kernel_* and probe_user_*
In-Reply-To: <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
References: <20200617073755.8068-1-hch@lst.de>
 <CAHk-=wjpnu=882iD9ck9Ywt6R1LYX_Hv-oS7dBMsWZwDRGZ5jA@mail.gmail.com>
Date: Fri, 19 Jun 2020 16:21:18 +1000
Message-ID: <87lfkjd19d.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> [ Explicitly added architecture lists and developers to the cc to make
> this more visible ]
>
> On Wed, Jun 17, 2020 at 12:38 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> Andrew and I decided to drop the patches implementing your suggested
>> rename of the probe_kernel_* and probe_user_* helpers from -mm as there
>> were way to many conflicts.  After -rc1 might be a good time for this as
>> all the conflicts are resolved now.
>
> So I've merged this renaming now, together with my changes to make
> 'get_kernel_nofault()' look and act a lot more like 'get_user()'.
>
> It just felt wrong (and potentially dangerous) to me to have a
> 'get_kernel_nofault()' naming that implied semantics that we're all
> familiar with from 'get_user()', but acting very differently.
>
> But part of the fixups I made for the type checking are for
> architectures where I didn't even compile-test the end result. I
> looked at every case individually, and the patch looks sane, but I
> could have screwed something up.
>
> Basically, 'get_kernel_nofault()' doesn't do the same automagic type
> munging from the pointer to the target that 'get_user()' does, but at
> least now it checks that the types are superficially compatible.
> There should be build failures if they aren't, but I hopefully fixed
> everything up properly for all architectures.
>
> This email is partly to ask people to double-check, but partly just as
> a heads-up so that _if_ I screwed something up, you'll have the
> background and it won't take you by surprise.

The powerpc changes look right, compile cleanly and seem to work
correctly.

cheers
