Return-Path: <linuxppc-dev+bounces-1134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B76A96FB84
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 20:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0llm016xz2ynn;
	Sat,  7 Sep 2024 04:55:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725648899;
	cv=none; b=QTWx77eAXem21UMhhDApAOu9PVArwFR8lhYoQz2lSRlCV8tSgALITo9aJXO5WH17qqEY1YIcGc+F5Kruli6S4wEx2ZGQBFElpOiTrSrK12Cg8R/05NvNh1tlSl4BHMQ16soaNSrYz+B9bG6vhUWfZXqNm7T7yJReOXBCGIkflj6hufxLfxwARY0oOuqu15ZugxCfaEwEF/jXPhIP2oY3asuY2mFGY80O1E1fGoLlb6dm7+plOhvYfGivvZ2LXu4cgkDPNoYZWccvkoJ/Ep/skx4CWy8XPDsDxfcozSJRhErYLRKrrOiPi8mQbLub/gya/HWiDenagb0PYlUqEzaGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725648899; c=relaxed/relaxed;
	bh=Y4fO2uD55CapDb7E2rYz7b7g+1GsC4SXbsHVZgINqmk=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=OurWmVNdNkWM6UBLOP6HqOmNVmfZeQ6B5lEUOA4tyYDvIGH6HtY5g8cbVVEYrqV+9jXqqaNMU9uhYz5iwCoGQlen1fOL4fyDOOSl8ZhkO9M8TQsdDVa749F8WjBqwKE4p5n9b9DPJRdq9Xioy13Lhap3LShsO3SmyXEQM35lRXdW+BsDvnAIEhfBMpN4oxw+DAha3JCE8GGwZrlRDCzwi30wSWHDgJn5Ibwdc9orcytdN9XZJsO8dLtJJii33rCZMYOQ48n9QYSoq4h/5hbSK2VuljAiVHKfAboxDnWRJqzewox8MgF9fCzjCykpv6TfmAelU2zpYJR8HbJ+pdb1SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=efgMiD7z; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=efgMiD7z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0llk15Zcz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 04:54:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFACBA4525C;
	Fri,  6 Sep 2024 18:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821CBC4CEC4;
	Fri,  6 Sep 2024 18:54:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="efgMiD7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725648891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4fO2uD55CapDb7E2rYz7b7g+1GsC4SXbsHVZgINqmk=;
	b=efgMiD7z3gM+I+ScpKY5zOxbUYBqiKjOMk4A9og1wreeDYjHRj6B0THIElQoI+3Jmd58aG
	jbN8OZ+EGjfjZetq0p8s14rZHXsvZmJgF44HLBxsValYTFEqBGWtBGmZ4uFQFdcV3T2XXP
	ob6Ca27ME5rPao2YSrgvcj/qtr5Yf88=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a974a26 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 18:54:51 +0000 (UTC)
Date: Fri, 6 Sep 2024 20:54:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 2/2] Fixup for 3279be36b671 ("powerpc/vdso: Wire up
 getrandom() vDSO implementation on VDSO32")
Message-ID: <ZttP-SU9i6iOyfnG@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>
 <ZtsMpcV7iLYoytdJ@zx2c4.com>
 <795db5f1-c266-4fb3-a51b-c2b3745d334b@csgroup.eu>
 <ZtsVry_LL2jjeLJ3@zx2c4.com>
 <8d0a8d03-95b3-40a8-85cd-5c2e6f92eb6b@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d0a8d03-95b3-40a8-85cd-5c2e6f92eb6b@csgroup.eu>

On Fri, Sep 06, 2024 at 05:14:43PM +0200, Christophe Leroy wrote:
> 
> 
> Le 06/09/2024 à 16:46, Jason A. Donenfeld a écrit :
> > On Fri, Sep 06, 2024 at 04:26:32PM +0200, Christophe Leroy wrote:
> > 
> >> On the long run I wonder if we should try to find a more generic
> >> solution for getrandom instead of requiring each architecture to handle
> >> it. On gettimeofday the selection of the right page is embeded in the
> >> generic part, see for instance :
> >>
> >> static __maybe_unused __kernel_old_time_t
> >> __cvdso_time_data(const struct vdso_data *vd, __kernel_old_time_t *time)
> >> {
> >> 	__kernel_old_time_t t;
> >>
> >> 	if (IS_ENABLED(CONFIG_TIME_NS) &&
> >> 	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
> >> 		vd = __arch_get_timens_vdso_data(vd);
> >>
> >> 	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
> >>
> >> 	if (time)
> >> 		*time = t;
> >>
> >> 	return t;
> >> }
> >>
> >> and powerpc just provides:
> >>
> >> static __always_inline
> >> const struct vdso_data *__arch_get_timens_vdso_data(const struct
> >> vdso_data *vd)
> >> {
> >> 	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
> >> }
> > 
> > It's tempting, but maybe a bit tricky. LoongArch, for example, doesn't
> > have this problem at all, because the layout of their vvars doesn't
> > require it. So the vd->clock_mode access is unnecessary.
> > 
> >> Or another solution could be to put random data in a third page that is
> >> always at the same place regardless of timens ?
> > 
> > Maybe that's the easier way, yea. Potentially wasteful, though.
> > 
> 
> Indeed I just looked at Loongarch and that's exactly what they do: they 
> have a third page after the two pages dedicated to TIME for arch 
> specific data, and they have added getrandom data there.
> 
> The third page is common to every process so it won't waste more than a 
> few bytes. It doesn't worry me even on the older boards that only have 
> 32 Mbytes of RAM.
> 
> So yes, I may have a look at that in the future, what we have at the 
> moment is good enough to move forward.

My x86 code is kind of icky for this:

static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
{
        if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
                return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)&__vdso_data);
        return &__vdso_rng_data;
}

Doing the subtraction like that means that this is more clearly correct.
But it also makes the compiler insert two jumps for the branch, and then
reads the addresses of those variables and such.

If I change it to:

static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
{
        if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
                return (void *)&__vdso_rng_data + (3UL << CONFIG_PAGE_SHIFT);
        return &__vdso_rng_data;
}

Then there's a much nicer single `cmov` with no branching.

But if I want to do that for real, I'll have to figure out what set of
nice compile-time constants I can use. I haven't looked into this yet.

Jason

