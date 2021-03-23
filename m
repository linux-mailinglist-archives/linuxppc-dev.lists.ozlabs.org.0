Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EC345DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Vhf43Dpz3bnn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 23:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VRHkWMU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VRHkWMU0; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4VhF2MLsz30Dt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 23:15:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4VhD10DCz9sVS;
 Tue, 23 Mar 2021 23:15:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616501756;
 bh=spGbXf0QrYy7DPA4c2eshsAjxpRr4Dknm0qYwUaz3GI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VRHkWMU0BeFytVh4bKTcvTeHEIZGwpmDS+3ffGTTTZhOWTAPnKjFkPpNjKiEGcSdW
 o4SNOYa6WVraNfEP31aSPeKx2mEN2rkJ+x61oKOhrUWMh8rMUrzTSFj2ZKeqmHY6x5
 TKuy71GgAY3doBsusyaxxNwjNGqwS9YaVsK+NBDOF5jUJM3BpGKhhoFbuOmEb2rPDC
 Vt9R1CjBD8cZqzuW2j9QOdxV6fDHSlsAx9FxprmlrQTG35o3NzGfFiST4CTVk2yYgB
 ILfqfSoK01MiFZzMETF9CEAfmfty1c+RofqeoZKq+BcDpk+20m2iEUYvIWl72wcXXd
 jbup58iwQoOqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 0/4] Rust for Linux for ppc64le
In-Reply-To: <CANiq72n-tMww2U+eQ=iHOh5u1JQgjM0b1E3XQ9jpWMfpdQ5+=g@mail.gmail.com>
References: <20210323032624.1039422-1-mpe@ellerman.id.au>
 <CANiq72n-tMww2U+eQ=iHOh5u1JQgjM0b1E3XQ9jpWMfpdQ5+=g@mail.gmail.com>
Date: Tue, 23 Mar 2021 23:15:50 +1100
Message-ID: <87mtuugj61.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> Hi Michael,
>
> On Tue, Mar 23, 2021 at 4:27 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Hi all,
>>
>> Here's a first attempt at getting the kernel Rust support building on powerpc.
>
> Thanks a *lot*! It is great to have more architectures rolling.

No worries.

>> It's powerpc64le only for now, as that's what I can easily test given the
>> distros I have installed. Though powerpc and powerpc64 are also Tier 2 platforms
>
> Even if it is just 64-bit, it is very good to have it!
>
>> so in theory should work. Supporting those would require something more
>> complicated than just pointing rustc at arch/$(ARCH)/rust/target.json.
>
> Yeah, the arch/$(ARCH)/rust/target.json dance is a placeholder -- I
> need to figure out how to do that more cleanly, likely generating them
> on the fly.

Yeah that's a good idea. That way they can be made to exactly match the
kernel configuration.

>> This is based on 832575d934a2 from the Rust-for-Linux tree. Anything newer gives
>> me errors about symbol name lengths. I figured I'd send this anyway, as it seems
>> like those errors are probably not powerpc specific.
>
> Sure, feel free to send things even if they don't work completely.
>
> I will take a look at the symbol name lengths -- I increased that
> limit to 512 and added support for 2-byte lengths in the tables, but
> perhaps something is missing. If I manage to make it work, I can add
> ppc64le to our CI! :-)

It would be nice to be in the CI. I was building natively so I haven't
tried cross compiling yet (which we'll need for CI).

>> Michael Ellerman (4):
>>   rust: Export symbols in initialized data section
>>   rust: Add powerpc64 as a 64-bit target_arch in c_types.rs
>>   powerpc/rust: Add target.json for ppc64le
>>   rust: Enable for ppc64le
>
> Regarding the development process: at least until the RFC we are
> working with the usual GitHub PR workflow (for several reasons: having
> a quick CI setup, getting new Rust developers on-board, having a list
> of "issues", cross-reference with the Rust repo, etc.).
>
> I can take patches from the list, of course, but since we are pre-RFC,
> do you mind if they get rebased etc. through there?

No I don't mind at all. I just sent patches so other ppc folks could see
what I had, and it's kind of the process I'm used to.

I can send a pull request if that's easiest.

cheers
