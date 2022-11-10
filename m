Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DD6241B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Klh3XPSz3cKr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 22:45:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BhZBMCNK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BhZBMCNK;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Kkk1HsJz3bl0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 22:44:44 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id q1so1545098pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBhckXz+h9OBHhnBMwSrkBUbhsCBEZmxISvv8y1a1D0=;
        b=BhZBMCNKJnBY9JuZXO9mfIMq05dj/3CsYdWbDWvAIbv8Tw+faXuobM7cK3AVJhGIKT
         rOlKYndquHks3vcZqpYmLM13mN+kxOS/uMIHARrGo+4FxYEfPTgJJJ9LgnKRZOwr1plS
         0/QEn0k1DHh3dh+9n1md8715spPBBOWpeKBEpcinUfa2pvV9GkjdLla2QR1Gm8lAkIHy
         rzVvd126ZdmrTxwSIZnDurSY0H/8vSbAx8bnwkRpkvmv3wDueNROcze3DdAvoRPmkOH/
         sX0DSRU8lJiR9qwBhd61JDs0bX/0FTDdmzxb8cR7poO+7i1jwlDpwWMdo1NNB/BBfWBH
         sL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBhckXz+h9OBHhnBMwSrkBUbhsCBEZmxISvv8y1a1D0=;
        b=PLM/pKjMp0Ii1Db4HNv/Kqqai4F0iCaSsiMcQRqwkN6jqP8LnzKEN7OQLpv7z5+5No
         rANdOUQYjVWSFJWXy5w/I26MjXPu5Ly8fcQcBjuwl59EzVDOpyUAjDEZHuoMocp5splp
         rBEgY4SL58rqlOlKZ/Q+KwbbnV+avA0X6SQ+5kRah/wckvLGRMw8ff/TAB5ZGFyeUc7h
         EpvyAOpkSVQup3kWkP3QvnzR9/NHvSIdvzVCQqAiWdf2QPFWQxaYRzRtPE6YgpPllsmC
         NaAx6xt+0byyAnbRQMIrearWupUWj+i9pw4NPRWx6tFlovf8508zup33HNUBehn35wJX
         qGHA==
X-Gm-Message-State: ACrzQf26pAJoETi9VFkWyd9fL2byx6LZ5s01aVuXXa+tmaAOmCozppoP
	at6rCKaHVV0n5Mw9d8cFrUSbxe1j+Po=
X-Google-Smtp-Source: AMsMyM4RSQivPnYkg3PF8id2qlQ/0LGF5bhcCE3xnLLoGnTL5C8tU/j9SlwfbqWKgGcnBOeXb4fIng==
X-Received: by 2002:a63:1f13:0:b0:455:80ce:6d36 with SMTP id f19-20020a631f13000000b0045580ce6d36mr56079453pgf.111.1668080681578;
        Thu, 10 Nov 2022 03:44:41 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902da8c00b00186b04776b0sm11138286plx.118.2022.11.10.03.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 03:44:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 21:44:36 +1000
Message-Id: <CO8L8ZXS5CHC.3D85PVW7QF4BW@bobo>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Jordan Niethe"
 <jniethe5@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-2-npiggin@gmail.com>
 <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
 <ba2122e0-69a9-aa85-9bef-b0bfc5d44b65@csgroup.eu>
In-Reply-To: <ba2122e0-69a9-aa85-9bef-b0bfc5d44b65@csgroup.eu>
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

On Thu Nov 10, 2022 at 4:37 PM AEST, Christophe Leroy wrote:
>
>
> Le 10/11/2022 =C3=A0 01:35, Jordan Niethe a =C3=A9crit=C2=A0:
> > On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> > <snip>
> >> -#define queued_spin_lock queued_spin_lock
> >>  =20
> >> -static inline void queued_spin_unlock(struct qspinlock *lock)
> >> +static __always_inline int queued_spin_trylock(struct qspinlock *lock=
)
> >>   {
> >> -	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor()=
)
> >> -		smp_store_release(&lock->locked, 0);
> >> -	else
> >> -		__pv_queued_spin_unlock(lock);
> >> +	if (atomic_cmpxchg_acquire(&lock->val, 0, 1) =3D=3D 0)
> >> +		return 1;
> >> +	return 0;
> >=20
> > optional style nit: return (atomic_cmpxchg_acquire(&lock->val, 0, 1) =
=3D=3D 0);
>
> No parenthesis.
> No =3D=3D 0
>
> Should be :
>
> 	return !atomic_cmpxchg_acquire(&lock->val, 0, 1);

In this case I prefer the =3D=3D 0 because we're testing against the 0 old
parameter being passed in. This is the recognisable cmpxchg pattern.

The other style of cmpxchg returns true if it succeeded, so it's less
clear we're not using that version if using !.

Thanks,
Nick
