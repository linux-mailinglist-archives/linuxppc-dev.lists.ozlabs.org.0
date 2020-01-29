Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C714C550
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 05:44:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486rVZ5LyTzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 15:44:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sY39muKi; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486rSb1ppPzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 15:42:36 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id m7so1192327pjs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 20:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=objSJ7qYjiucawwO/72vSs8HHfl24Xxd0g2+DeAEfbM=;
 b=sY39muKiBpkbK+UI1+43I4M0e3VafV/e18/4+iBBBGN6PhIcaB8WFx3McmtTFmZIne
 GkeIrynyQRQiqGTmMFoVU/g+CGfXLNiesBN9sbif9lDJjNZVgqjomPxXiDJOaB0dU0Zg
 tJo72ZAs8Abqi2lKXq5ZI+zbg2JHf2NwiwU5OxjizMQM83/cpQoL8fMz+I3fS7biZWTB
 p3HzHONLY6WQiltwbP/8HqwOzy/KQSfFvvQnpCBLk2Sxn4ge1dQ5DFqmCf1E/tNUJqR2
 VR7ZqJVKwXeGw717jwwWE6BhxbDOFcWzCz+BJrGGdeBVU2Ch4NuPFuog1KZV0XivBfkr
 0hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=objSJ7qYjiucawwO/72vSs8HHfl24Xxd0g2+DeAEfbM=;
 b=gk2IYcwEJdnO/e4/bLwR9D3fqEyjuKLrjDUmc8giw8bMQTpdEl49Pl+84vWniAiqsQ
 ZcMo8b8i5/zdDRftkDvMKZbuqYvDx0w7gaa6cIrzd0r5Okvo6yxrg2EPfjFVuS1EwI1D
 XjuT/PrejpAGhKXwZuVQPdLVr01fvpplYVes1Cj9D4BXHgQgdCBVvg17n0zL63sb6EHm
 G14rvUYSdUFqHWJFMSP7To6lw6Aq5fsP3so5Rex7vL8D1w3ep4RrwGbAp5n8AyXsqvYj
 XeNNmamumGKuRuDdgloGTZNXuFoG9GYkI0EYqu8rVtbuxcMqpD8H4M3VcYIdJ7YEkfnl
 FEAw==
X-Gm-Message-State: APjAAAVaeQCAdqj2H3DGM+B3yEqEHIGu1Ez77xfOmEL8wYDi6pn2GT2a
 ULQN8J+qMOdlnp2fNjpwc0I=
X-Google-Smtp-Source: APXvYqyf9D51URLHm6pzFBhLdMdoveI/4ZlOmkkUVuM65eqzvQIyergOr75E6/78uQsKzUuOSY4qgQ==
X-Received: by 2002:a17:90a:6545:: with SMTP id
 f5mr9173345pjs.42.1580272953256; 
 Tue, 28 Jan 2020 20:42:33 -0800 (PST)
Received: from localhost (203-219-188-70.tpgi.com.au. [203.219.188.70])
 by smtp.gmail.com with ESMTPSA id p5sm664953pgs.28.2020.01.28.20.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 20:42:32 -0800 (PST)
Date: Wed, 29 Jan 2020 14:41:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
To: Florian Weimer <fweimer@redhat.com>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <87sgjzbmk1.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87sgjzbmk1.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1580271319.kvmwnv0a4v.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Florian Weimer's on January 29, 2020 1:58 am:
> * Nicholas Piggin:
>=20
>> That gets the LR save/restore right when we're also using r0.
>=20
> Yes, I agree it looks good.  Nice.
>=20
>>> But the kernel uses the -errno convention internally, so I think it
>>> would make sense to pass this to userspace and not convert back and
>>> forth.  This would align with what most of the architectures do, and
>>> also avoids the GCC oddity.
>>
>> Yes I would be interested in opinions for this option. It seems like
>> matching other architectures is a good idea. Maybe there are some
>> reasons not to.
>=20
> If there were a POWER-specific system call that uses all result bits and
> doesn't have room for the 4096 error states (or an error number that's
> outside that range), that would be a blocker.  I can't find such a
> system call wrapped in the glibc sources.

Nothing apparent in the kernel sources either.

> musl's inline syscalls always
> convert the errno state to -errno, so it's not possible to use such a
> system call there.
>=20
>>>> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>>>>   calls if there was interest in developing an ABI for 32-bit programs=
.
>>>>   Marginal benefit in avoiding compat syscall selection.
>>>=20
>>> We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
>>> provide an ELFv1 port for this given that it's POWER9-specific.
>>
>> Okay. There's no reason not to enable this for BE, at least for the
>> kernel it's no additional work so it probably remains enabled (unless
>> there is something really good we could do with the ABI if we exclude
>> ELFv1 but I don't see anything).
>>
>> But if glibc only builds for ELFv2 support that's probably reasonable.
>=20
> To be clear, we still support ELFv1 for POWER, but given that this
> feature is POWER9 and later, I expect the number of users benefiting
> from 32-bit support (or ELFv1 and thus big-endian support) to be quite
> small.
>=20
> Especially if we go the conditional branch route, I would restrict this
> to ELFv2 in glibc, at least for default builds.
>=20
>>> From the glibc perspective, the major question is how we handle run-tim=
e
>>> selection of the system call instruction sequence.  On i386, we use a
>>> function pointer in the TCB to call an instruction sequence in the vDSO=
.
>>> That's problematic from a security perspective.  I expect that on
>>> POWER9, using a pointer in read-only memory would be equally
>>> non-attractive due to a similar lack of PC-relative addressing.  We
>>> could use the HWCAP bit in the TCB, but that would add another (easy to
>>> predict) conditional branch to every system call.
>>
>> I would have to defer to glibc devs on this. Conditional branch
>> should be acceptable I think, scv improves speed as much as several
>> mispredicted branches (about 90 cycles).
>=20
> But we'd have to pay for that branch (and likely the LR clobber) on
> legacy POWER, and that's something to consider, too.

We would that's true.

> Is there an additional performance hit if a process uses both the old
> and new system call sequence?

No state or logic required to switch between them or run them
concurrently. Just the  extra instruction footprint.

Thanks,
Nick

=
