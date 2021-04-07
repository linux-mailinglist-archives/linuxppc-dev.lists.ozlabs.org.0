Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE2356828
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 11:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFfR24M8Pz3bnf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 19:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IlI3gz6r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IlI3gz6r; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFfQZ5HJrz300C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 19:35:49 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id f29so10145310pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZVfKBalueTSgx5OM8QhCg5tppz9Kqf0PHs1cKuDosxY=;
 b=IlI3gz6rmZE1g6Lr92QfSvO1jp0oUCgzsUDPV0c4ta5CPrtBiHImp5Q3bjTVMh1Rlq
 AIAilsI7WBQgT41uReuS2IOgd6BPXvnxJTl2DpnjrD21J/KRHaHY+AfDEnNMGe2S3c5r
 pXZRlUXVskQ8xTcncDLhulAgSiLfc64W9mrRPabsH4cg5FBzqs+hsEn5UiKqP7vUZbsz
 5JHgTwxe0B9oXVNf88sE0r4dWjr12Xvn7uMOmEww3HcFXHfvzSLtUez/uRtIstKLlVD9
 DwCxOZoWpAqfAQ/Xg05paUMd4E6+DPWc43f/1Pct7JPk8XziuTWOHUuQchw88gC4gwHc
 Segg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZVfKBalueTSgx5OM8QhCg5tppz9Kqf0PHs1cKuDosxY=;
 b=dnSDNzVqQ2MkLWyzuH7thP82aWic3vQREkPAz4MpqFNK+XppgO96816z9whvadxCa0
 HdEKOoOHxCycMkOXQJZHF6UJWJAYtHooL+Zwfsw+19JtWdm5HotNc76HvHWqn+LuHDUF
 CJHqLA3AjlXfle8jcZfom0byoWq6srcqxct/tAFkh7yF9/jdZ/3v6sBqnxcfa2apD8Qm
 gAatckLXk3r04IArN6u/hzIYFUDAi4BOy1/hSrQ0w1oJIjARuvQzE4AEeBUIJwH9ADTR
 gpCGF9KO+/cG/nuK7KJ69CAj/iyl707a2SRRMqETbGX0dHxGhQBxu5LyF2Y+uCJ1mUZp
 flFA==
X-Gm-Message-State: AOAM532Gb00c/UDfz8S/fQxZMxO2fHOY5OG+Wca6ZB4wf9MgGOQTogvP
 /gQwvZ0NcHE8re7wh7YmM1JJ/EcVhB0=
X-Google-Smtp-Source: ABdhPJxBWevds9psSxRVML0ZYqbSkhf4IYBWg75auTJad2dREclOYkr/V28gnKKaT4t9MnCpmhdyNQ==
X-Received: by 2002:a63:f715:: with SMTP id x21mr2401572pgh.399.1617788146335; 
 Wed, 07 Apr 2021 02:35:46 -0700 (PDT)
Received: from localhost ([1.132.144.230])
 by smtp.gmail.com with ESMTPSA id q17sm23336341pfq.171.2021.04.07.02.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 02:35:45 -0700 (PDT)
Date: Wed, 07 Apr 2021 19:35:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 38/48] KVM: PPC: Book3S HV: Remove support for
 dependent threads mode on P9
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-39-npiggin@gmail.com>
 <YG1WcjXTbGtsqHgY@thinks.paulus.ozlabs.org>
 <1617779718.vvrcxrnvnp.astroid@bobo.none>
In-Reply-To: <1617779718.vvrcxrnvnp.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1617787999.rtpf8vvh36.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 7, 2021 5:44 pm:
> Excerpts from Paul Mackerras's message of April 7, 2021 4:51 pm:
>> On Mon, Apr 05, 2021 at 11:19:38AM +1000, Nicholas Piggin wrote:
>>> Radix guest support will be removed from the P7/8 path, so disallow
>>> dependent threads mode on P9.
>>=20
>> Dependent threads mode on P9 was added in order to support the mode
>> where for security reasons you want to restrict the vcpus that run on
>> a core to all be from the same VM, without requiring all guests to run
>> single-threaded.  This was (at least at one stage) thought to be a
>> useful mode for users that are worried about side-channel data leaks.
>=20
> Right.
>=20
>>=20
>> Now it's possible that that mode is not practically useful for some
>> reason, or that no-one actually wants it, but its removal should be
>> discussed.  Also, the fact that we are losing that mode should be
>> explicit in the commit message.
>=20
> Let's discuss. Did / does anyone really use it or ask for it that you
> know of? What do other archs do? Compared with using standard options
> that would achive this kind of security (disable SMT, I guess?) how
> much is this worth keeping?
>=20
> It was pretty simple to support when the P8 dependent theads code had
> to support P9 anyway. After this series, now all that code is only for
> that one feature, so it would be pretty nice to be able to remove it.
> How do we reach a point where you'd be okay to remove this and tell=20
> people to just turn off SMT?

Assuming we do decide to remove it, how's about something like this for=20
a changelog. Does a bit more justice to the feature and its removal.

Thanks,
Nick

    Dependent-threads mode is the normal KVM mode for pre-POWER9 SMT
    processors, where all threads in a core (or subcore) would run the same
    partition at the same time, or they would run the host.
   =20
    This design was mandated by MMU state that is shared between threads in
    a processor, so the synchronisation point is in hypervisor real-mode
    that has essentially no shared state, so it's safe for multiple threads
    to gather and switch to the correct mode.
   =20
    It is implemented by having the host unplug all secondary threads and
    always run in SMT1 mode, and host QEMU threads essentially represent
    virtual cores that wake these secondary threads out of unplug when the
    ioctl is called to run the guest. This happens via a side-path that is
    mostly invisible to the rest of the Linux host and the secondary thread=
s
    still appear to be unplugged.
   =20
    POWER9 / ISA v3.0 has a more flexible MMU design that is independent
    per-thread and allows a much simpler KVM implementation. Before the new
    "P9 fast path" was added that began to take advantage of this, POWER9
    support was implemented in the existing path which has support to run
    in the dependent threads mode. So it was not much work to add support t=
o
    run POWER9 in this dependent threads mode.
   =20
    The mode is not required by the POWER9 MMU (although "mixed-mode" hash =
/
    radix MMU limitations of early processors were worked around using this
    mode). But it is one way to run SMT guests without running different
    guests or guest and host on different threads of the same core, so it
    could avoid or reduce some SMT attack surfaces without turning off SMT
    entirely.
   =20
    This security feature has some real, if indeterminate, value. However
    the old path is lagging in features (nested HV), and with this series
    the new P9 path adds remaining missing features (radix prefetch bug
    and hash support, in later patches), so POWER9 dependent threads mode
    support would be the only remaining reason to keep that code in and kee=
p
    supporting POWER9/POWER10 in the old path. So here we make the call to
    drop this feature.
   =20
    Remove dependent threads mode support for POWER9 and above processors.
    Systems can still achieve this security by disabling SMT entirely, but
    that would generally come at a larger performance cost for guests.

