Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836D86B220
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 15:44:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=18hyBJTA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlHF21RpVz3vXY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 01:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=18hyBJTA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlHDH6QPCz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 01:43:59 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so11039a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709131432; x=1709736232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnoSRTW8AtUZs4ugNgPMn80qRikhZMN33csdiHtI1dI=;
        b=18hyBJTAt3dOg6doBIyXcYkfgopQaWFTDbYI+VWs0UCX+Gm0460P5rfN6LrARtmNe5
         RThXl2D3MXYUTs9cuJYbUpZhP7Kyz+QUw45QVBAi0O8E8pvQIlvmUx7nix6MOJZQLChm
         CWKQsGH6n51uzLIcKJ/5hwig8W1BHesNFkVTKgP9DPiWvVsm901DAsL94IFti+stFjkC
         8dwq5WcgadghiPTGf47fJBwtqx6ASvytce5aXq6LRt0gq92ZEe8XR1Vn++W3YtRvfYXk
         2638Noe5FH3hPP8jcWA1MN8y9KOFS/fD4rhujfyTVbpfrbjF2joPjg5lQ9/qcfXkVGoW
         1uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709131432; x=1709736232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnoSRTW8AtUZs4ugNgPMn80qRikhZMN33csdiHtI1dI=;
        b=KlvUzp823sMs3SD6XIgVvu2xjaDxYUGG1qqqLjcLlNEOlGTDogmMsKQpvtQ4Qy2O19
         i/C82bdmz+tbI5gYqKsLjk9UR/LhMJUPmrvlDI3v5yykJKzYHGyx+3v280r0tEl8N6BJ
         G5696XdABYukeWV9815b4uw53NK3BQC6K7+jXQR63LBJpndyEjq+CGsD5i6sRG1xjT6K
         bxDhqMnyZL9Dtlsy9FnKDSURV5orqyqE6sjNM5+GC3EjJ3k6IC5fAC1wG1MVsV0ChWmO
         pTS15EGvqaccBay2b2mu4MlSWFLCM9CECFo1BMO0J1znItK/pMfExC71NkoDkHvC9TJ7
         xrAg==
X-Forwarded-Encrypted: i=1; AJvYcCXsEY10uFLKahcrHn+ZQ+SX44+zoJPLIo/3ya37UBWYvDFJQ025Re+TD0toIdNjFqAGE9ql9+1hq71zlfsZtS10QRag68w+hF6VvYga7A==
X-Gm-Message-State: AOJu0YxEIauAZxoz//RMngn0BTYsIr8+az3tZk1nLbzb/5HhRwt3+Gbg
	uunJ5hyweNrdxmw5HwGkKKh0dfsLCPeq1iVWKDUq9WbMOtRGkGG6hPufVR8Z2mRLcZQggwxHTY4
	DKlFZOH37hG2ufky6JzRkALhzmNNq8nJ4oc6+
X-Google-Smtp-Source: AGHT+IEES/VV7npD6iBN4dtbgkaBntnQ1IsMemUX1X8dIdkUpTDG9nT+8rgEDFrJe+qGv5AL0cBHzUd6KSTdSg2+5/0=
X-Received: by 2002:a50:9349:0:b0:565:4f70:6ed with SMTP id
 n9-20020a509349000000b005654f7006edmr42234eda.6.1709131431840; Wed, 28 Feb
 2024 06:43:51 -0800 (PST)
MIME-Version: 1.0
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com> <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
In-Reply-To: <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 Feb 2024 15:43:36 +0100
Message-ID: <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
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
Cc: venkat88@linux.vnet.ibm.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, kuba@kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 28, 2024 at 3:07=E2=80=AFPM Vadim Fedorenko
<vadim.fedorenko@linux.dev> wrote:
>
> On 28/02/2024 11:09, Tasmiya Nalatwad wrote:
> > Greetings,
> >
> > [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
> >
> > Reverting below commit fixes the issue
> >
> > commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
> >      dpll: rely on rcu for netdev_dpll_pin()
> >
> > --- Traces ---
> >
> > ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> > ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> > incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >    typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >           ^
> > ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> > =E2=80=98__rcu_dereference_check=E2=80=99
> >    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >    ^~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> > =E2=80=98rcu_dereference_check=E2=80=99
> >    rcu_dereference_check(p, lockdep_rtnl_is_held())
> >    ^~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/dpll.h:175:9: note: in expansion of macro
> > =E2=80=98rcu_dereference_rtnl=E2=80=99
> >    return rcu_dereference_rtnl(dev->dpll_pin);
> >           ^~~~~~~~~~~~~~~~~~~~
> > make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Err=
or 1
> > make[4]: *** Waiting for unfinished jobs....
> >    AR      net/mpls/built-in.a
> >    AR      net/l3mdev/built-in.a
> > In file included from ./include/linux/rbtree.h:24,
> >                   from ./include/linux/mm_types.h:11,
> >                   from ./include/linux/mmzone.h:22,
> >                   from ./include/linux/gfp.h:7,
> >                   from ./include/linux/umh.h:4,
> >                   from ./include/linux/kmod.h:9,
> >                   from ./include/linux/module.h:17,
> >                   from drivers/dpll/dpll_netlink.c:9:
> > ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> > ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> > incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >    typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >           ^
> > ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> > =E2=80=98__rcu_dereference_check=E2=80=99
> >    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >    ^~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> > =E2=80=98rcu_dereference_check=E2=80=99
> >    rcu_dereference_check(p, lockdep_rtnl_is_held())
> >    ^~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/dpll.h:175:9: note: in expansion of macro
> > =E2=80=98rcu_dereference_rtnl=E2=80=99
> >    return rcu_dereference_rtnl(dev->dpll_pin);
> >           ^~~~~~~~~~~~~~~~~~~~
> > make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o]
> > Error 1
> > make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
> >                   from ./include/linux/compiler.h:251,
> >                   from ./include/linux/instrumented.h:10,
> >                   from ./include/linux/uaccess.h:6,
> >                   from net/core/dev.c:71:
> > net/core/dev.c: In function =E2=80=98netdev_dpll_pin_assign=E2=80=99:
> > ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
> > incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >   #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
> >                                      ^~~~
> > ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
> > =E2=80=98__WRITE_ONCE=E2=80=99
> >    *(volatile typeof(x) *)&(x) =3D (val);    \
> >                                   ^~~
> > ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro
> > =E2=80=98WRITE_ONCE=E2=80=99
> >    WRITE_ONCE(*p, v);      \
> >    ^~~~~~~~~~
> > ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
> > =E2=80=98__smp_store_release=E2=80=99
> >   #define smp_store_release(p, v) do { kcsan_release();
> > __smp_store_release(p, v); } while (0)
> > ^~~~~~~~~~~~~~~~~~~
> > ./include/linux/rcupdate.h:503:3: note: in expansion of macro
> > =E2=80=98smp_store_release=E2=80=99
> >     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
> >     ^~~~~~~~~~~~~~~~~
> > ./include/linux/rcupdate.h:503:25: note: in expansion of macro
> > =E2=80=98RCU_INITIALIZER=E2=80=99
> >     smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
> >                           ^~~~~~~~~~~~~~~
> > net/core/dev.c:9081:2: note: in expansion of macro =E2=80=98rcu_assign_=
pointer=E2=80=99
> >    rcu_assign_pointer(dev->dpll_pin, dpll_pin);
> >    ^~~~~~~~~~~~~~~~~~
> > make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> >    AR      drivers/net/ethernet/built-in.a
> >    AR      drivers/net/built-in.a
> >    AR      net/dcb/built-in.a
> >    AR      net/netlabel/built-in.a
> >    AR      net/strparser/built-in.a
> >    AR      net/handshake/built-in.a
> >    GEN     lib/test_fortify.log
> >    AR      net/8021q/built-in.a
> >    AR      net/nsh/built-in.a
> >    AR      net/unix/built-in.a
> >    CC      lib/string.o
> >    AR      net/packet/built-in.a
> >    AR      net/switchdev/built-in.a
> >    AR      lib/lib.a
> >    AR      net/mptcp/built-in.a
> >    AR      net/devlink/built-in.a
> > In file included from ./include/linux/rbtree.h:24,
> >                   from ./include/linux/mm_types.h:11,
> >                   from ./include/linux/mmzone.h:22,
> >                   from ./include/linux/gfp.h:7,
> >                   from ./include/linux/umh.h:4,
> >                   from ./include/linux/kmod.h:9,
> >                   from ./include/linux/module.h:17,
> >                   from net/core/rtnetlink.c:17:
> > ./include/linux/dpll.h: In function =E2=80=98netdev_dpll_pin=E2=80=99:
> > ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
> > incomplete type =E2=80=98struct dpll_pin=E2=80=99
> >    typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
> >           ^
> > ./include/linux/rcupdate.h:587:2: note: in expansion of macro
> > =E2=80=98__rcu_dereference_check=E2=80=99
> >    __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> >    ^~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
> > =E2=80=98rcu_dereference_check=E2=80=99
> >    rcu_dereference_check(p, lockdep_rtnl_is_held())
> >    ^~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/dpll.h:175:9: note: in expansion of macro
> > =E2=80=98rcu_dereference_rtnl=E2=80=99
> >    return rcu_dereference_rtnl(dev->dpll_pin);
> >           ^~~~~~~~~~~~~~~~~~~~
> > In file included from net/core/rtnetlink.c:60:
> > ./include/linux/dpll.h:179:1: error: control reaches end of non-void
> > function [-Werror=3Dreturn-type]
> >   }
> >
>
> Hi, Eric!
>
> Looks like we have to move struct dpll_pin definition to
> include/linux/dpll.h to have this fixed, right?
>

No idea what is wrong. Is it powerpc specific ? Some compiler version ?

netdev_dpll_pin() could be moved to net/core/rtnetlink.c, this is the only =
user.

diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 4ec2fe9caf5a3f284afd0cfe4fc7c2bf42cbbc60..72d21e710d7f201d2fc57bb3a32=
b4bc0ff2b1749
100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -169,13 +169,4 @@ int dpll_device_change_ntf(struct dpll_device *dpll);

 int dpll_pin_change_ntf(struct dpll_pin *pin);

-static inline struct dpll_pin *netdev_dpll_pin(const struct net_device *de=
v)
-{
-#if IS_ENABLED(CONFIG_DPLL)
-       return rcu_dereference_rtnl(dev->dpll_pin);
-#else
-       return NULL;
-#endif
-}
-
 #endif
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 9c4f427f3a5057b52ec05405e8b15b8ca2246b4b..32dc601fd8ca66dfcd3cb8f38b5=
33314de02d1d2
100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1053,6 +1053,15 @@ static size_t rtnl_devlink_port_size(const
struct net_device *dev)
        return size;
 }

+static struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_DPLL)
+       return rcu_dereference_rtnl(dev->dpll_pin);
+#else
+       return NULL;
+#endif
+}
+
 static size_t rtnl_dpll_pin_size(const struct net_device *dev)
 {
        size_t size =3D nla_total_size(0); /* nest IFLA_DPLL_PIN */
