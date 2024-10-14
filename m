Return-Path: <linuxppc-dev+bounces-2209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0299C856
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 13:13:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRvjG3NV0z3bmL;
	Mon, 14 Oct 2024 22:13:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728904386;
	cv=none; b=RTf8DrrrIPNFCZO9ov/LW7Xfm6g0m4AtSnuoLifAOtg8jQO92wqeye/tH6o+9TyF2BF82eUMvCIYxKrgVoMDcbA2OcwCRsyVc1gqve0zTHEXi9eyeo3ohKkC7tDu7S/Z4fqZrtAYMBj8d42CslOBp49+qMeqbf6gwiVNOhN+b4+v+yVCFp2c+5IbUb84AaLnklLjTTtubBcHrrXf14m0oAETxYxa+q7iwFweUrWIqaGXNlEv+syfI1ndTrryVzp78MXkk9PJH6C7A0nAgX0HJZzW5CNoZjdKC1I3PmE4KZKcNvqN/sWJ9WZAFgshjjbCfIUutB4+b2xIbCd3m9J5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728904386; c=relaxed/relaxed;
	bh=pyWWGO9IqDJuzplwZ6APmoKIp+Saxr/76c2YKidVFAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2c4J2OjM7xNvw2pcmDqN3r3ySzyue9zwQSv5FgsjtvLJjtyxPCcKnaXze48NgOWjW9rZYuK4iothU30ewC//9A077T8tcit3yTY7RJIGm/tCUWB9Fah3tEgELhjODbtfr0eD5PSeCfwvKmyefWKcXNkxDaB70DRcTfp/GAmK8W+bTUQslSnEb9irJUbANaIfa6R8Ed9LeODj1F4wFdffsfzU67SwLE40g412/GBE1d01pWVbclzMA8fmzHQ0bV5YaKCGjTVNnqYTcoVUSVUZV8ODDcHoAVtqQMAdhiTDP2uNJpxvLleugenYkby5xvSVS2goKmNqBo3/ceO6AXqLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=AN1mUp0t; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=AN1mUp0t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRvjD268Qz3blN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 22:13:02 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso3650728a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728904376; x=1729509176; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pyWWGO9IqDJuzplwZ6APmoKIp+Saxr/76c2YKidVFAA=;
        b=AN1mUp0t+fYWx1/XMHRZJVVswUuDd4pinxtyKchCFeIbEdtQ2rdTpb+Xu0q3fMXiO3
         Hd9T2q55cBWBK0A3gHBlf0mGSWSQl3vRWZUu5mUNKZCpl4BHbBiKmp5ixUsk9lDI5OyQ
         9jIaAEcm8uXVhkMAwTP5EXpEOA99OzjhAOI0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904376; x=1729509176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyWWGO9IqDJuzplwZ6APmoKIp+Saxr/76c2YKidVFAA=;
        b=PS8wFTT//QrlxjSZzjGPmrE1G+VyzZrIq2mKDcnK3Fxc/n33bXNG3cHFuEZLrS7Q32
         q3o8cJN3m2efqhkZVZ0mIMI5mWSlUJaoMjxH921+RGr6j7+dV6Y2tQLF50T/PurT283g
         fWBRvbJpilyMYzmAe4po+15FseBloE/I3PDuMERQfUSQQ+Ykby/663EEPJ7wXsNy7o2P
         y4rYOmbDOZTvXxohsDy0GSoNM0Sn9oOMmKXiQEkWPL2vl+xfHfiMlOSLkBvogVv8tD1C
         sHjxbiGeqa+M6Bl/t0erxDeYKHQOI8zC7j9eeFJCIRwvH+rQqmaCSb7Fq3UH4wBkowbU
         GQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHVt247c59RGP8SV6X0kcN5b+wANWPM0y6sHjNjO7YIzbsUXOXr4VYdmDLM15HyhAu/ooCV5HdI2fJSbM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBhJp8BmEFqA0ghDGn2AUfudbOcICZ+J9E/scmbaBI2XD2fUZc
	qIM9SOfLZZyLAh2jU6wiIPXAUir47W1MTk1iTglbMFABbUC1FQw33zQQYVAET3o=
X-Google-Smtp-Source: AGHT+IGULdpL1E77sDV3WzjxZyawITl1nfKJf8IO8uqa4Lzp9B1LvJSjq0nUUsPubXRiyeHvEPr4aA==
X-Received: by 2002:a17:906:dc93:b0:a99:f977:70c2 with SMTP id a640c23a62f3a-a99f97771f5mr502820066b.48.1728904375598;
        Mon, 14 Oct 2024 04:12:55 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f217a7bbsm298093566b.114.2024.10.14.04.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 04:12:55 -0700 (PDT)
Message-ID: <1dfa6677-169c-42bd-ac28-2f5d340ef335@citrix.com>
Date: Mon, 14 Oct 2024 12:12:52 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14/10/2024 7:50 am, Linus Torvalds wrote:
> On Sun, 13 Oct 2024 at 20:54, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>> If I understand correctly, LAM bits are for the benefit of SW and are
>> ignored by HW?

That is what is written in the ISE today.

But, I'll note that on ARM, MTE (Memory Tagging Extensions) use the same
bits that BTI (Top Byte Ignore) made available to software.

>>> So maybe the "what is the actual cycle latency of detecting the
>>> faulting instruction" really is the core question here.

I'm afraid I will have to defer that to AMD.  I have not experimented
personally.


>> I think I remember reading that STAC/CLAC can't necessarily be relied on
>> as a speculation barrier, depending on microarchitectural details.

STAC and CLAC are not LFENCEes.

They happen to be on implementations where AC is not a renamed flag
(i.e. can't be updated speculatively), but both vendors want the
flexibility in the future.

Therefore, it is my recollection that the vendors agreed that STAC/CLAC
would prevent memory accesses from occurring under the wrong AC,
although I can't actually find this written down anywhere.

I think we need to chase some architects until a statement or two fall out.


>> It
>> might be safest to assume we can't rely on that.  Masking is relatively
>> cheap anyway.
> The WHOLE BUG is all about "microarchitectural details".
>
> So arguing that STAC is a microarchitectural detail and not
> architecturally guaranteed isn't an argument.
>
> Because architecturally, this but simply does not exist, and so some
> architectural definition simply doesn't matter.
>
> So all that matters is whether the broken microarchitectures that used
> the wrong bit for testing also have a STAC that basically hides the
> bug.
>
> Christ. The hardware should have used a bit that is *MEANINGFUL*,
> namely bit #63, not some random meaningless bit that just happens to
> be one of the bits that is then checked for canonicality.
>
> And it's so annoying, because from a *hardware* perspective, bit #63
> vs bit #48 is completely irrelevant. It's literally just a wire choice
>
> But from an architectural perspective, bit #63 is not only the
> *actual* bit that is the real difference  ("kernel is at the top of
> the address space") but for software, bit #48 is fundamentally harder
> to test.
>
> IOW, it's completely the wrong effing bit to test.
>
> Honestly, the Intel meltdown thing I at least understood *why* it happened.
>
> This AMD "use meaningless bit #48" bug just strikes me as active malice.

I think this is unfair.

This was an implementation decision taken probably around the millennium
(given lead times to get the K8 out in 2003).

There is a reason why - given they're architecturally equivalent - the
inside bit is more useful than the outside bit.  Some AMD CPUs really
only have 48 bits of storage for pointers, and it really does simplify
circuitry.

Furthermore, since when have software concerns (one bit being harder to
test than others) ever factored into hardware design.  It's sad but true.


From further up the email chain:

> It sure was never talked about in kernel circles.

Quite possibly not.  At the time the Linux accessors were safe, so where
ought it to have been discussed?

It's not appropriate for an encrypted list, nor security@.  AMD did
deliver it to software vendors via their normal mechanism.

~Andrew

