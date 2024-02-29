Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F986C452
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:56:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P0U4EVWq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllSg4xtBz3bnt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:56:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P0U4EVWq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TllRx5816z3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:55:40 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so6471a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709196937; x=1709801737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBB3ZRtHtlRaOVjaKAvj1TeBqt93SACeJpqho7/F2vs=;
        b=P0U4EVWqeeECWu62rQF8kkd46jgv5okMCfD0XcUELQivp6mgqjh/tdVdM9KBArIXpL
         N+CEJswUvkDHeb6v610vuRfLY3F/wbQOGKmVzCGKer1mhDgNzRqWwYVvnsn3ralXJXVm
         eNeZOANTnJk91GwYe56DqrFqEcRIkVMeVTAjng0Z3Uwpq7Sfq47cI7SXOxP0SSmLwzgd
         QMYuyS76l6nJyfKUrDvAFnL9dK+prDxvHUA75f8Ill/7qJFOxR6E8+ESR3wIhRmo3sFC
         QmI7UsQ6kxwzkZ+GXB2ZAT6vP1gdOPNwgiXjw+f7APYYdlKf+bB6wZVyx6Ur2cLc2vmA
         nFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709196937; x=1709801737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBB3ZRtHtlRaOVjaKAvj1TeBqt93SACeJpqho7/F2vs=;
        b=Ae3aXYd+aojiUw/g/8rK/8EHYhymSRqY/+b9LqrobzIdptBX3QGewyZJ9jvB1at+nL
         pZTF/oUbwsOPssxuQHNu04xgA9/gE0c8Y23q2w88rvqbm8A4i0w3ptcy+aSVK3tVvg9E
         sdV/VNWSjNKc1l5iGBbYiaMZs/1oDSfuD4TKnM6cH+N5yamIkp4yLx4xg21ahDzY5a52
         KW9J0F5Ijdu7Lm8c1DB4KVNo5JEre1tRxPFfj7nOM2DSY3hY+t/3D/4m5rg5Cqo12m8i
         1M36/iLF2DqE2j+fQK5Bc/PIQrKTgYHu6tplhr4kTkQx+EPbiuvpFmgKfkbdCWly0bS8
         CrgA==
X-Forwarded-Encrypted: i=1; AJvYcCWJorLxyGW0Q+ce7fYlQJiOgsYLXA3uqTWZs1H26y4KrClReQ1IMPRvFQIIWNMy5uyKP57G6vGrLRTtztmqhYY4ZaHCYVBWRPkIqpW2SA==
X-Gm-Message-State: AOJu0YwrNLOqN/clVe2kU4WxT588nBiujkeHrVcmjH1gFIr7EGYW38KN
	QEdGPbaJz8eCOhzX/wDHlkXjV4rYzO62q9cmYq5NtZxMaxaoeOXTOpiM8nzEbWLIVOi98SkT3Vd
	HghObx6hdT+QD5o9UJcY5xu+Y1OQ0vw1RE0vy
X-Google-Smtp-Source: AGHT+IGynF+a6/344UeE1w8xJSD5fMiW6denW7bKWrVT2N4O3XLJEnj8jcArzi200u9QX3eURd05eVbMTlwTlbDE+8c=
X-Received: by 2002:a05:6402:2227:b0:561:a93:49af with SMTP id
 cr7-20020a056402222700b005610a9349afmr51902edb.7.1709196937172; Thu, 29 Feb
 2024 00:55:37 -0800 (PST)
MIME-Version: 1.0
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev> <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
 <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com>
In-Reply-To: <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 29 Feb 2024 09:55:22 +0100
Message-ID: <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: venkat88@linux.vnet.ibm.com, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, kuba@kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 9:04=E2=80=AFAM Tasmiya Nalatwad
<tasmiya@linux.vnet.ibm.com> wrote:
>
> Greetings,
>
> I have tried the patch provided below. Moving struct to file
> "net/core/rtnetlink.c" is not resolving the problem. Please find the
> below traces.
>
> --- Traces ---
>
> In file included from ./include/linux/rbtree.h:24,
>                   from ./include/linux/mm_types.h:11,
>                   from ./include/linux/mmzone.h:22,
>                   from ./include/linux/gfp.h:7,
>                   from ./include/linux/umh.h:4,
>                   from ./include/linux/kmod.h:9,
>                   from ./include/linux/module.h:17,
>                   from net/core/rtnetlink.c:17:
> net/core/rtnetlink.c: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>    typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
>           ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> =E2=80=98__rcu_dereference_check=E2=80=99
>    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> =E2=80=98rcu_dereference_check=E2=80=99
>    rcu_dereference_check(p, lockdep_rtnl_is_held())
>    ^~~~~~~~~~~~~~~~~~~~~
> net/core/rtnetlink.c:1059:15: note: in expansion of macro
> =E2=80=98rcu_dereference_rtnl=E2=80=99
>          return rcu_dereference_rtnl(dev->dpll_pin);
>                 ^~~~~~~~~~~~~~~~~~~~
>    CC      crypto/algboss.o
> net/core/rtnetlink.c:1063:1: error: control reaches end of non-void
> function [-Werror=3Dreturn-type]
>   }
>   ^
>    CC      crypto/authenc.o
>    CC      crypto/authencesn.o
>    CC      crypto/af_alg.o
>    CC      crypto/algif_hash.o
>    CC      crypto/algif_skcipher.o
>    CC      crypto/algif_rng.o
>    CC      crypto/algif_aead.o
>    AR      arch/powerpc/kernel/built-in.a
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:243: net/core/rtnetlink.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>    CC      lib/kobject_uevent.o
>    AR      drivers/net/mdio/built-in.a
>    AR      net/802/built-in.a
>    AR      drivers/connector/built-in.a
>    CC      lib/vsprintf.o
>    AR      ipc/built-in.a
>    AR      net/nsh/built-in.a
>    CC      lib/dynamic_debug.o
> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>                   from ./include/linux/compiler.h:251,
>                   from ./include/linux/instrumented.h:10,
>                   from ./include/linux/uaccess.h:6,
>                   from net/core/dev.c:71:
> net/core/dev.c: In function =E2=80=98netdev_dpll_pin_assign=E2=80=99:
> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
> incomplete type =E2=80=98struct dpll_pin=E2=80=99
>   #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>                                      ^~~~
> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
> =E2=80=98__WRITE_ONCE=E2=80=99
>    *(volatile typeof(x) *)&(x) =3D (val);    \
>                                   ^~~
> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro
> =E2=80=98WRITE_ONCE=E2=80=99
>    WRITE_ONCE(*p, v);      \
>    ^~~~~~~~~~
> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
> =E2=80=98__smp_store_release=E2=80=99
>   #define smp_store_release(p, v) do { kcsan_release();
> __smp_store_release(p, v); } while (0)
> ^~~~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:3: note: in expansion of macro
> =E2=80=98smp_store_release=E2=80=99
>     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>     ^~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:25: note: in expansion of macro
> =E2=80=98RCU_INITIALIZER=E2=80=99
>     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>                           ^~~~~~~~~~~~~~~
> net/core/dev.c:9081:2: note: in expansion of macro =E2=80=98rcu_assign_po=
inter=E2=80=99
>    rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>    ^~~~~~~~~~~~~~~~~~
>
> On 2/28/24 20:13, Eric Dumazet wrote:
> > On Wed, Feb 28, 2024 at 3:07=E2=80=AFPM Vadim Fedorenko
> > <vadim.fedorenko@linux.dev> wrote:
> >> On 28/02/2024 11:09, Tasmiya Nalatwad wrote:
> >>> Greetings,
> >>>
> >>> [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
> >>>
> >>> Reverting below commit fixes the issue
> >>>
> >>> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
> >>>       dpll: rely on rcu for netdev_dpll_pin()
> >>>
> >>> --- Traces ---
> >>>
> >>> ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99=
:
> >>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> >>> incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >>>     typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >>>            ^
> >>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> >>> =E2=80=98__rcu_dereference_check=E2=80=99
> >>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >>>     ^~~~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_check=E2=80=99
> >>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
> >>>     ^~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/dpll.h:175:9: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_rtnl=E2=80=99
> >>>     return rcu_dereference_rtnl(dev->dpll_pin);
> >>>            ^~~~~~~~~~~~~~~~~~~~
> >>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] E=
rror 1
> >>> make[4]: *** Waiting for unfinished jobs....
> >>>     AR      net/mpls/built-in.a
> >>>     AR      net/l3mdev/built-in.a
> >>> In file included from ./include/linux/rbtree.h:24,
> >>>                    from ./include/linux/mm_types.h:11,
> >>>                    from ./include/linux/mmzone.h:22,
> >>>                    from ./include/linux/gfp.h:7,
> >>>                    from ./include/linux/umh.h:4,
> >>>                    from ./include/linux/kmod.h:9,
> >>>                    from ./include/linux/module.h:17,
> >>>                    from drivers/dpll/dpll_netlink.c:9:
> >>> ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99=
:
> >>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> >>> incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >>>     typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >>>            ^
> >>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> >>> =E2=80=98__rcu_dereference_check=E2=80=99
> >>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >>>     ^~~~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_check=E2=80=99
> >>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
> >>>     ^~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/dpll.h:175:9: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_rtnl=E2=80=99
> >>>     return rcu_dereference_rtnl(dev->dpll_pin);
> >>>            ^~~~~~~~~~~~~~~~~~~~
> >>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o=
]
> >>> Error 1
> >>> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
> >>> make[3]: *** Waiting for unfinished jobs....
> >>> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1=
,
> >>>                    from ./include/linux/compiler.h:251,
> >>>                    from ./include/linux/instrumented.h:10,
> >>>                    from ./include/linux/uaccess.h:6,
> >>>                    from net/core/dev.c:71:
> >>> net/core/dev.c: In function =E2=80=98netdev_dpll_pin_assign=E2=80=99:
> >>> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
> >>> incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >>>    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
> >>>                                       ^~~~
> >>> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
> >>> =E2=80=98__WRITE_ONCE=E2=80=99
> >>>     *(volatile typeof(x) *)&(x) =3D (val);    \
> >>>                                    ^~~
> >>> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macr=
o
> >>> =E2=80=98WRITE_ONCE=E2=80=99
> >>>     WRITE_ONCE(*p, v);      \
> >>>     ^~~~~~~~~~
> >>> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
> >>> =E2=80=98__smp_store_release=E2=80=99
> >>>    #define smp_store_release(p, v) do { kcsan_release();
> >>> __smp_store_release(p, v); } while (0)
> >>> ^~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/rcupdate.h:503:3: note: in expansion of macro
> >>> =E2=80=98smp_store_release=E2=80=99
> >>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
> >>>      ^~~~~~~~~~~~~~~~~
> >>> ./include/linux/rcupdate.h:503:25: note: in expansion of macro
> >>> =E2=80=98RCU_INITIALIZER=E2=80=99
> >>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
> >>>                            ^~~~~~~~~~~~~~~
> >>> net/core/dev.c:9081:2: note: in expansion of macro =E2=80=98rcu_assig=
n_pointer=E2=80=99
> >>>     rcu_assign_pointer(dev->dpll_pin, dpll_pin);
> >>>     ^~~~~~~~~~~~~~~~~~
> >>> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
> >>> make[4]: *** Waiting for unfinished jobs....
> >>>     AR      drivers/net/ethernet/built-in.a
> >>>     AR      drivers/net/built-in.a
> >>>     AR      net/dcb/built-in.a
> >>>     AR      net/netlabel/built-in.a
> >>>     AR      net/strparser/built-in.a
> >>>     AR      net/handshake/built-in.a
> >>>     GEN     lib/test_fortify.log
> >>>     AR      net/8021q/built-in.a
> >>>     AR      net/nsh/built-in.a
> >>>     AR      net/unix/built-in.a
> >>>     CC      lib/string.o
> >>>     AR      net/packet/built-in.a
> >>>     AR      net/switchdev/built-in.a
> >>>     AR      lib/lib.a
> >>>     AR      net/mptcp/built-in.a
> >>>     AR      net/devlink/built-in.a
> >>> In file included from ./include/linux/rbtree.h:24,
> >>>                    from ./include/linux/mm_types.h:11,
> >>>                    from ./include/linux/mmzone.h:22,
> >>>                    from ./include/linux/gfp.h:7,
> >>>                    from ./include/linux/umh.h:4,
> >>>                    from ./include/linux/kmod.h:9,
> >>>                    from ./include/linux/module.h:17,
> >>>                    from net/core/rtnetlink.c:17:
> >>> ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99=
:
> >>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> >>> incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >>>     typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >>>            ^
> >>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> >>> =E2=80=98__rcu_dereference_check=E2=80=99
> >>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >>>     ^~~~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_check=E2=80=99
> >>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
> >>>     ^~~~~~~~~~~~~~~~~~~~~
> >>> ./include/linux/dpll.h:175:9: note: in expansion of macro
> >>> =E2=80=98rcu_dereference_rtnl=E2=80=99
> >>>     return rcu_dereference_rtnl(dev->dpll_pin);
> >>>            ^~~~~~~~~~~~~~~~~~~~
> >>> In file included from net/core/rtnetlink.c:60:
> >>> ./include/linux/dpll.h:179:1: error: control reaches end of non-void
> >>> function [-Werror=3Dreturn-type]
> >>>    }
> >>>
> >> Hi, Eric!
> >>
> >> Looks like we have to move struct dpll_pin definition to
> >> include/linux/dpll.h to have this fixed, right?
> >>
> > No idea what is wrong. Is it powerpc specific ? Some compiler version ?
> >
> > netdev_dpll_pin() could be moved to net/core/rtnetlink.c, this is the o=
nly user.

OK, it seems netdev_dpll_pin() has to be moved in a place the
structure is known,
because rcu_dereference() needs to know its size.

I do not see other solution than this, otherwise we have to add more
pollution to include/linux/netdevice.h

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index a9c973b92294bb110cf3cd336485972127b01b58..40797ea80bc6273cae6b7773d0a=
3e47459a72150
100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2469,7 +2469,7 @@ struct net_device {
        struct devlink_port     *devlink_port;

 #if IS_ENABLED(CONFIG_DPLL)
-       struct dpll_pin __rcu   *dpll_pin;
+       void __rcu *dpll_pin;
 #endif
 #if IS_ENABLED(CONFIG_PAGE_POOL)
        /** @page_pools: page pools created for this netdevice */
