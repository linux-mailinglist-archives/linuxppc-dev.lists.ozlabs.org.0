Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3A623E4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7GJk52TPz3cN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 20:10:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CkeYNOkQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CkeYNOkQ;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7GHr1ZKpz3cGT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 20:09:43 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id b21so935118plc.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th716AlhBtv1vd/pg6EU8DKDo2P8bB50/C4NQfAjNro=;
        b=CkeYNOkQhHUtVbO7Oxl6fzU5AGC/14ZDOAxjvj+5nxKodWO2Pfa5ynDlr9nre/Ma0U
         OqCePAK0zhQ0t+Hw2uZCBMqiwbUTSJwMjzaRyCNmiTzo6o1gu5Prr8a8Ho/MQn2NFHr+
         kjnr2EBpCIJTUZp4HPoFuocRyc192n9FI2SgrhKrH2w+eDoTIrg5TG7wNKG/OOA+U+u8
         g91T8BMUEbCgFAv4Abmbuf3twjrD+vohUVM3sOcPy3w9n9EUFd5pYUWKrUs7zmdCM50W
         M5T3W56WyJOuHFq78tzoJ9yjyQUP35N9beCmOEvZVkirmM3IGD15rmPPSM/jvJ4aY8V9
         rnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Th716AlhBtv1vd/pg6EU8DKDo2P8bB50/C4NQfAjNro=;
        b=FLhMEWgWaLJE+VvoRmbnPmLIFWsLXsoXIfMykxnf4/y6tigXwz1iOX+jfJhnBbQpLa
         BCH28c2JYf4Zo2fP+a0/VsqJZs47dHVG2aPihULvMB53VIs15DXbqD8vXVHXU++otoet
         Jo+ebZtVsSq3LUcUdvH0heq8TbrAWDohP4avuD3me5gBlcUY/NISfHz9WIrqoyClYnBQ
         /+4qgfdMijqUVWAc+FFxb/3igbytFxrvn1RozwQeUmppJnQmSp9Q3RnGdp2YSheN0o88
         do17b49Brxef3Ko3Aqn6DaA9f1AD2rPFD6fdHyn5Sr2HMwDaN968s2XcAqA27hN6c44m
         4F2w==
X-Gm-Message-State: ACrzQf0ABlrUddfl+ap6+FyKj/cd49Qve7Kk8mgRnBjnYoHPVy1vOgTL
	It4M4SSYidjetdCWkYMzS5o=
X-Google-Smtp-Source: AMsMyM6JH/hkXk7iimhAR7ZCso9qFAtGYBiz1j0v6FK4HPfmy6UBrH17EKfG+4hJ2LLIeHNNPS08gg==
X-Received: by 2002:a17:90a:2b42:b0:213:82b3:212b with SMTP id y2-20020a17090a2b4200b0021382b3212bmr66418237pjc.106.1668071379185;
        Thu, 10 Nov 2022 01:09:39 -0800 (PST)
Received: from localhost (61-68-184-43.tpgi.com.au. [61.68.184.43])
        by smtp.gmail.com with ESMTPSA id i36-20020a635864000000b00464aa9ea6fasm8674013pgm.20.2022.11.10.01.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 01:09:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Nov 2022 19:09:34 +1000
Message-Id: <CO8HYAI0B7DD.2F7V302G1EIBO@bobo>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-2-npiggin@gmail.com>
 <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
In-Reply-To: <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
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

On Thu Nov 10, 2022 at 10:35 AM AEST, Jordan Niethe wrote:
> On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
> <snip>
> > -#define queued_spin_lock queued_spin_lock
> > =20
> > -static inline void queued_spin_unlock(struct qspinlock *lock)
> > +static __always_inline int queued_spin_trylock(struct qspinlock *lock)
> >  {
> > -	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
> > -		smp_store_release(&lock->locked, 0);
> > -	else
> > -		__pv_queued_spin_unlock(lock);
> > +	if (atomic_cmpxchg_acquire(&lock->val, 0, 1) =3D=3D 0)
> > +		return 1;
> > +	return 0;
>
> optional style nit: return (atomic_cmpxchg_acquire(&lock->val, 0, 1) =3D=
=3D 0);
>
> [resend as utf-8, not utf-7]

Thanks for the thorough review, apologies again it took me so long to
get back to.

I'm not completely sold on this. I guess it's already side-effects in a
control flow statement though... Maybe I will change it, not sure.

Thanks,
Nick
