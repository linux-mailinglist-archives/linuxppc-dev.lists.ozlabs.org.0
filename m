Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE45F9740
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 05:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm4gZ4p7hz3dsF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 14:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JiFdjcQk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JiFdjcQk;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm4fc5Wscz2xvJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 14:49:27 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id x6so9277120pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Oct 2022 20:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5uwdgwryFHFJzjWiH++bUzGyJn8a2qBYOFkqPQdUjA=;
        b=JiFdjcQkZ722P7s3iZCsJihWdE0H8Hb1Xp9mToLMy6UTMLVa1tCTeAPRwv7fmvPIq+
         8rvkFwCUxFcrDK+3fTfvaFaZAMEyltqjrDVz/PytWUer59eQV1Yyqgh50XgVXauL7Vog
         oGJr3dns0VUrublr5DdF0JtWb3Ga6TwT8XaZFY25dQ9QbyH1CVyrfzOBtJ3dDtFi+6bM
         4FaBnTDKc+z1tQ7omh/CnHGX6k/xaRAexHIyAFJH6zA+2/22JywqrL2DD4ZlGMSFimKp
         eCkRhSDSC5gVtOsYw2u/w2UPJ3VttbeIgjRY1oFln+qveMnci4poe3khwXzntilyOBUx
         hiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5uwdgwryFHFJzjWiH++bUzGyJn8a2qBYOFkqPQdUjA=;
        b=kW+pMCQuh3+KqjFGdgV/3ZYDdsiwd/SWqlBbIG51/CplXRaBtOLPvoSSBgjMrk1OHN
         gJVTYZFdcnFRQYPkPb07fhZg3DtuKbE5w/WnwxOQcqBbWUW49zM+6p2HqQJPZ4z5KbTE
         4RKxoyeOvigGtUfUFPKfwmun6d6yDCBNu7rXufs2upYuyXV74D7gUSNNH5BnO++Pe5Gh
         n5OHwYfw5dWxPY75t7sj6MXiCvJoZ1maA/zwaWIGQiyYgjUAxc6G+unOfU09sxY07OBE
         1dHJJIbOyKnzLEIT2iGjjZ1Xn0UZxRyxg1z63tXYjT8PXsl1Qb+dgDicKkRw6xla9YWr
         7Gug==
X-Gm-Message-State: ACrzQf0vZN6uI66V7NON8RsCYqv5en9+nXIvRlzkQthG+AcCRhkCwH4y
	/iTQCsrXNidt0IVxtbpx3ek=
X-Google-Smtp-Source: AMsMyM7lHoI8Gy9V6tXanpM85kqRN40SxwDXKwUvcHAfUndnPhZXWSUKGr0roRcIdSUSsDrQ3lEemQ==
X-Received: by 2002:a17:902:7084:b0:181:5304:fef4 with SMTP id z4-20020a170902708400b001815304fef4mr8742887plk.57.1665373764964;
        Sun, 09 Oct 2022 20:49:24 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b001788ccecbf5sm5468419plf.31.2022.10.09.20.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 20:49:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Oct 2022 13:49:18 +1000
Message-Id: <CNHXQ6R5IEHG.1D2WH96LGUA1I@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Zhouyi Zhou" <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are
 offline
X-Mailer: aerc 0.11.0
References: <20220927014823.11439-1-zhouzhouyi@gmail.com>
 <CN6WCMKCWHOG.LT2QV3910UJ2@bobo>
 <CAABZP2wYcNXkTo=tgX-ARziwgD2rng+-wCZ-qfQ6M30+vmLEug@mail.gmail.com>
 <CN7OZ6TMLLFS.2HER50Q3SO480@bobo>
 <CAABZP2xu5w9Ec8LmTUrF31KhY3HCcBjQYSk4xo14bdB9mxOz+A@mail.gmail.com>
In-Reply-To: <CAABZP2xu5w9Ec8LmTUrF31KhY3HCcBjQYSk4xo14bdB9mxOz+A@mail.gmail.com>
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
Cc: atrajeev@linux.vnet.ibm.com, paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 29, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> On Wed, Sep 28, 2022 at 10:51 AM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
> >
> > On Wed Sep 28, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > Thank Nick for reviewing my patch
> > >
> > > On Tue, Sep 27, 2022 at 12:25 PM Nicholas Piggin <npiggin@gmail.com> =
wrote:
> > > >
> > > > On Tue Sep 27, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > > > This is second version of my fix to PPC's  "WARNING: suspicious R=
CU usage",
> > > > > I improved my fix under Paul E. McKenney's guidance:
> > > > > Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzho=
uyi@gmail.com/T/
> > > > >
> > > > > During the cpu offlining, the sub functions of xive_teardown_cpu =
will
> > > > > call __lock_acquire when CONFIG_LOCKDEP=3Dy. The latter function =
will
> > > > > travel RCU protected list, so "WARNING: suspicious RCU usage" wil=
l be
> > > > > triggered.
> > > > >
> > > > > Avoid lockdep when we are offline.
> > > >
> > > > I don't see how this is safe. If RCU is no longer watching the CPU =
then
> > > > the memory it is accessing here could be concurrently freed. I thin=
k the
> > > > warning is valid.
> > > Agree
> > > >
> > > > powerpc's problem is that cpuhp_report_idle_dead() is called before
> > > > arch_cpu_idle_dead(), so it must not rely on any RCU protection the=
re.
> > > > I would say xive cleanup just needs to be done earlier. I wonder wh=
y it
> > > > is not done in __cpu_disable or thereabouts, that's where the inter=
rupt
> > > > controller is supposed to be stopped.
> > > Yes, I learn flowing events sequence from kgdb debugging
> > > __cpu_disable -> pseries_cpu_disable -> set_cpu_online(cpu, false)  =
=3D
> > > leads to =3D>  do_idle: if (cpu_is_offline(cpu) -> arch_cpu_idle_dead
> > > so xive cleanup should be done in pseries_cpu_disable.
> >
> > It's a good catch and a reasonable approach to the problem.
> Thank Nick for your encouragement ;-)
> >
> > > But as a beginner, I afraid that I am incompetent to do above
> > > sophisticated work without error although I am very like to,
> > > Could any expert do this for us?
> >
> > This will be difficult for anybody, it's tricky code. I'm not an
> > expert at it.
> >
> > It looks like the interrupt controller disable split has been there
> > since long before xive. I would try just move them together than see
> > if that works.
> Yes, I use "git blame" (I learned "git blame" from Paul E. McKenny ;-)
> ) to see the same.
> and anticipate your great works!

I was thinking you could try it and see if it works and what you find.
If you are interested and have time to look into it?

Thanks,
Nick
