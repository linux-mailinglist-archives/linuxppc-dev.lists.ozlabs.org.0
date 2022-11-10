Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F97624191
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7KbM3Y57z3f4M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:38:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zex9WNEO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zex9WNEO;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7KZT1XMKz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:37:36 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id v17so1214802plo.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptuQEcbUd1kimoJ8Ii/nErDji+/dPIh2G6q00Uby0+Y=;
        b=Zex9WNEOhndK99ayS6tLmCSHtCn+BxPz+9sF0tR+W03t7Az3943uXJLXfnY4OerVBi
         Wgrv0DavieRoUoX3hZcz4PXM//VsUqzJtPEkcv4y5xAJOmFzW4opHOThPJnIwT6qfnm9
         1f/owvZTdruaUDR+e+853W12vSt8HdwIpoyAq0k4FQp6Siv1BBZ0lRMBLhPi/Mz3nILe
         S+VJhVj0RPVk1RUozcPX2cSmgC12Zah1XwKoMlnfckoBgJ+ZV0KGoe6AaNr6un8P+vuf
         dcb7xOuI/xe2Bz8VHK9XxQSLs55LDjmkDYlfgMpu6AvRKNly/2guhLHcUpJc1W6MlK69
         sg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptuQEcbUd1kimoJ8Ii/nErDji+/dPIh2G6q00Uby0+Y=;
        b=xFgUxtMhkdluJ0nynw7Lk3q8Ajq7i8DDHGjRTMGC8zczV7FbsrMpTWHgREOZ9yX9FV
         kz3BOM+WfDZYc3iiAWt6bBHgGG/LjKKn1c+UvK2ceEqD4IWcSCCpFo+FgznMOzHBaEzz
         XKSd+WL6Ksp4HRN7pTGKhfZQta4+1MCTCaxsdb13ZesTJ3J6rMmjZ5A3BtVQXo/Iuphc
         q0VCLuonSD158/y9oZTJ3ZM+jcbE+PYSvQHSZHnUEJCp49WGp3+1jKtromBssCCIQEo9
         ZlGZq+YJe44mDXUtDFeA7115MSE4+jMVSSRJ1hV0GiN3tmUXaIGHgTAd5eYvKsPK7TrD
         eTaw==
X-Gm-Message-State: ACrzQf2kn2s+QZjJjJKq7K/USQmWqYZQ/VkCBfnev+z1KyXNIgkuBnk3
	fcRWjSORp0UeRKrTBb3bLAlCEENOGK4=
X-Google-Smtp-Source: AMsMyM6sYYB06EvEGyImPuOuvgBpdmVsMQAIpuV8DCGNs/mbCTxUVIl3X+RnLKTQh1G8SVG87/xhyw==
X-Received: by 2002:a17:902:ee8b:b0:186:a226:7207 with SMTP id a11-20020a170902ee8b00b00186a2267207mr62870128pld.49.1668080255329;
        Thu, 10 Nov 2022 03:37:35 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090a8c9700b0020b7de675a4sm2874995pjo.41.2022.11.10.03.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:37:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:37:30 +1000
Message-Id: <CO8L3KBJI158.2DZLTZAUMMA4G@bobo>
Subject: Re: [PATCH 15/17] powerpc/qspinlock: reduce remote node steal spins
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-17-npiggin@gmail.com>
 <aee900bb3870e8daea96ae5b4aab7ef7e9e1baf4.camel@gmail.com>
In-Reply-To: <aee900bb3870e8daea96ae5b4aab7ef7e9e1baf4.camel@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 10, 2022 at 10:43 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> [resend as utf-8, not utf-7]
> > Allow for a reduction in the number of times a CPU from a different
> > node than the owner can attempt to steal the lock before queueing.
> > This could bias the transfer behaviour of the lock across the
> > machine and reduce NUMA crossings.
> > ---
> >  arch/powerpc/lib/qspinlock.c | 34 +++++++++++++++++++++++++++++++---
> >  1 file changed, 31 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.=
c
> > index d4594c701f7d..24f68bd71e2b 100644
> > --- a/arch/powerpc/lib/qspinlock.c
> > +++ b/arch/powerpc/lib/qspinlock.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/export.h>
> >  #include <linux/percpu.h>
> >  #include <linux/smp.h>
> > +#include <linux/topology.h>
> >  #include <asm/qspinlock.h>
> >  #include <asm/paravirt.h>
> > =20
> > @@ -24,6 +25,7 @@ struct qnodes {
> > =20
> >  /* Tuning parameters */
> >  static int STEAL_SPINS __read_mostly =3D (1<<5);
> > +static int REMOTE_STEAL_SPINS __read_mostly =3D (1<<2);
> >  #if _Q_SPIN_TRY_LOCK_STEAL =3D=3D 1
> >  static const bool MAYBE_STEALERS =3D true;
> >  #else
> > @@ -39,9 +41,13 @@ static bool pv_prod_head __read_mostly =3D false;
> > =20
> >  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
> > =20
> > -static __always_inline int get_steal_spins(bool paravirt)
> > +static __always_inline int get_steal_spins(bool paravirt, bool remote)
> >  {
> > -	return STEAL_SPINS;
> > +	if (remote) {
> > +		return REMOTE_STEAL_SPINS;
> > +	} else {
> > +		return STEAL_SPINS;
> > +	}
> >  }
> > =20
> >  static __always_inline int get_head_spins(bool paravirt)
> > @@ -380,8 +386,13 @@ static __always_inline bool try_to_steal_lock(stru=
ct qspinlock *lock, bool parav
> > =20
> >  		iters++;
> > =20
> > -		if (iters >=3D get_steal_spins(paravirt))
> > +		if (iters >=3D get_steal_spins(paravirt, false))
> >  			break;
> > +		if (iters >=3D get_steal_spins(paravirt, true)) {
>
> There's no indication of what true and false mean here which is hard to r=
ead.
> To me it feels like two separate functions would be more clear.

Good point. I reworked this a bit.

>
>
> > +			int cpu =3D get_owner_cpu(val);
> > +			if (numa_node_id() !=3D cpu_to_node(cpu))
>
> What about using node_distance() instead?

We don't really need the distance, just whether or not it's the same or
not. I think distance not only has to look up the nodes, but then has to
look up a matrix to get a number.

Thanks,
Nick
