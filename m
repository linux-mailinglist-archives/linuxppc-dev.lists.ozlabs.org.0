Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29225222EFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 01:28:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B79S43LjrzDr0p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 09:28:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BxY54KCj; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B79Q32qh3zDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 09:27:07 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id t11so4422555pfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=emv834qbGgi893dX/IaKrVeomPzEVS0ZG+EyN4ke6Jw=;
 b=BxY54KCj4kiARNkK+N4vp/W9OTuudktsuJd+WODxPAeDB4oFxO4DQsQB4GI6IM8Gas
 UJN/mRtbMfMb7XYESBrFdSYxHm0/dz5lI2i/IvV6zif0bXiZCQ+gabEvMQ/IDQfQisVf
 qes+jiODle+UMzXIbB4xMZ9XK1erPvZaombyKjkf2dPCBjxm1hRdpabhchByUJPhDzib
 1F8S+2UX/dzkcedaYb5el1Xm3NMrNgCIzlZ/QU0AfZ6HYI73UBsnFviQsYS1R4bLJyiY
 ZznnhHQxDV5gPYJtSWQnGIgTy8kG8Ine/794rLiZ9vTmkP2RhhiHUWsR4lNJs0KKqWp4
 Ibpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=emv834qbGgi893dX/IaKrVeomPzEVS0ZG+EyN4ke6Jw=;
 b=JMAbgryBWv1GexJ5hMGju22aBQhN2eNicy7AsmnhQs1TLDx0W+x8d99SLRokuQyAJ7
 1UOP9+n3aDBaemupcT9n+h5BqFaqcMh4nIUW6YsmTIClsXCa0nggOWWOZPmvYvAuh211
 1stkVZhpV5/Cj6J6CKJwe7B+nK9/em6H5l2Ciyw06v5ruI8hAMIYWV/pzisVv3L/J5qz
 UvyZyTTFXJdiiBw63D+zH+TeV7G5rG79Ld8ujg6nM8DTE6n6a8V/pjsO4UBcaMwI6Gft
 PedO3W3z5VkOLiMuXXTuGq9pYQ1sqaEkqcbPEdaI7jgeZxhie/I3fJBqn5Gd9qq2RTUp
 r81g==
X-Gm-Message-State: AOAM533oR1Bd9w63Hfw4stoPAl0gBfOaqN1ZK/0mIcFsU+zI1+HLYBl6
 UvE8MlRst+RrmFmW9G+d59g=
X-Google-Smtp-Source: ABdhPJzsas/W/l7YZ8rsW53AbEGEaqr8R3Pt+kUjAsFkMcalVEs2KKHzvH8Zn5PQ137qjCJoqRQ5XQ==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr6477752pgk.334.1594942023742; 
 Thu, 16 Jul 2020 16:27:03 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 4sm5684665pgk.68.2020.07.16.16.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 16:27:03 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:26:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: peterz@infradead.org
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
In-Reply-To: <20200716110038.GA119549@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1594906688.ikv6r4gznx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from peterz@infradead.org's message of July 16, 2020 9:00 pm:
> On Thu, Jul 16, 2020 at 08:03:36PM +1000, Nicholas Piggin wrote:
>> Excerpts from Peter Zijlstra's message of July 16, 2020 6:50 pm:
>> > On Wed, Jul 15, 2020 at 10:18:20PM -0700, Andy Lutomirski wrote:
>> >> > On Jul 15, 2020, at 9:15 PM, Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>=20
>> >> But I=E2=80=99m wondering if all this deferred sync stuff is wrong. I=
n the
>> >> brave new world of io_uring and such, perhaps kernel access matter
>> >> too.  Heck, even:
>> >=20
>> > IIRC the membarrier SYNC_CORE use-case is about user-space
>> > self-modifying code.
>> >=20
>> > Userspace re-uses a text address and needs to SYNC_CORE before it can =
be
>> > sure the old text is forgotten. Nothing the kernel does matters there.
>> >=20
>> > I suppose the manpage could be more clear there.
>>=20
>> True, but memory ordering of kernel stores from kernel threads for
>> regular mem barrier is the concern here.
>>=20
>> Does io_uring update completion queue from kernel thread or interrupt,
>> for example? If it does, then membarrier will not order such stores
>> with user memory accesses.
>=20
> So we're talking about regular membarrier() then? Not the SYNC_CORE
> variant per-se.

Well, both but Andy in this case was wondering about kernel writes
vs user.

>=20
> Even there, I'll argue we don't care, but perhaps Mathieu has a
> different opinion. All we care about is that all other threads (or CPUs
> for GLOBAL) observe an smp_mb() before it returns.
>=20
> Any serialization against whatever those other threads/CPUs are running
> at the instant of the syscall is external to the syscall, we make no
> gauarantees about that. That is, we can fundamentally not say what
> another CPU is executing concurrently. Nor should we want to.
>=20
> So if you feel that your membarrier() ought to serialize against remote
> execution, you need to arrange a quiecent state on the remote side
> yourself.
>=20
> Now, normally membarrier() is used to implement userspace RCU like
> things, and there all that matters is that the remote CPUs observe the
> beginngin of the new grace-period, ie counter flip, and we observe their
> read-side critical sections, or smething like that, it's been a while
> since I looked at all that.
>=20
> It's always been the case that concurrent syscalls could change user
> memory, io_uring doesn't change that, it just makes it even less well
> defined when that would happen. If you want to serialize against that,
> you need to arrange that externally.

membarrier does replace barrier instructions on remote CPUs, which do
order accesses performed by the kernel on the user address space. So
membarrier should too I guess.

Normal process context accesses like read(2) will do so because they
don't get filtered out from IPIs, but kernel threads using the mm may
not.

Thanks,
Nick
