Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960495BDB00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 05:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWnkG47T4z3c2v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 13:55:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kvw9GHHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kvw9GHHy;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWnjh2W1Nz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 13:54:32 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id s206so1299106pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=iRqGVpJfZnOCizRupG33AtA0KKxYvPEqC5LY7aKX0LY=;
        b=Kvw9GHHy/1ZrQ0+dQmVqchqF+kOkGzyFBmV2ScUOrXMRFkKReOFJKAF0oCEXePRMqW
         XTf0XJQIVeyvVoevIljPJEDl/XXFHSqw9ccQXIXHvJyYmYLtzYPl+MXjK6f52SQFlNIG
         Wknq6+RW09ugx62Jw8I5pIJruqtnv81FLqst96GVVHusurEEazNnGKy/wOtIVUDOhVYf
         +uqgQj+Ca0JppjZTwheGBIn9tmOqUCgfjmqV8stAgpwOCtV4UkHbSsQNANAjXp0iVOjX
         LD3Yq9RcpgWT/mmFjSaIQ0Vr1XzG5L2JrSS2Qrgyp3yqOZXeIT7vhsuO5Lu66+czNcqr
         Lmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=iRqGVpJfZnOCizRupG33AtA0KKxYvPEqC5LY7aKX0LY=;
        b=JE5/im0qovZ5YHxuP2A6iquw/tg8QBoSP42ogyrqqUyiAgdTw7BfRQIxOq1PkmfJ6b
         24R9DrC7ibBq9mxvd4d6qUqGJsXK5WZG7sJtX02sGu0P5hCCXjY4P+J26cMDV/fL9S5T
         DXvTsRRJ7zb4V4f6vZ8MoFdUsQ2wllHYBLE1xndi9ryh9xCKNBAPiyPzZ1FVydjo42D0
         3iUxrg25TayZNPtj2pGHaQhRr7um4x21xFMmNhvQctv7+tjTmeg6gRgzseLJApe3leRz
         Abgu1kWhnGBoIs1Pp10UdbbvlcBKYDs2KJLk4TzTS9wGCRZfZxi3/4IXoHle9cR+i7AA
         hJ9g==
X-Gm-Message-State: ACrzQf3G+lLHDLpv+6XXfnJftd9blauMxERlpJc3Y5LNgQ6yN3UR8bMb
	JjTpFBtHq8tngLpKE4CLVwM=
X-Google-Smtp-Source: AMsMyM7LnotsYswGSNAYzyKV0jecFOsszXCtpIGrSY0xH3D4AZ8n8387VlDKzbY+egFaU8Pw7OpVPQ==
X-Received: by 2002:a63:82c1:0:b0:439:f2d1:a508 with SMTP id w184-20020a6382c1000000b00439f2d1a508mr10269593pgd.155.1663646069037;
        Mon, 19 Sep 2022 20:54:29 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id t25-20020a62d159000000b0053ae018a91esm227202pfl.173.2022.09.19.20.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 20:54:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 13:54:23 +1000
Message-Id: <CN0XB6PRTPP7.W10Z5R1QNLZC@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, =?utf-8?q?Leonardo_Br=C3=A1s?=
 <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
X-Mailer: aerc 0.11.0
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo> <87h717t24d.fsf@linux.ibm.com>
 <87illjqxpn.fsf@linux.ibm.com>
In-Reply-To: <87illjqxpn.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 19, 2022 at 11:51 PM AEST, Nathan Lynch wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
> > "Nicholas Piggin" <npiggin@gmail.com> writes:
> >> On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
> >>> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
> >>> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> >>> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
> >>> > > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> >>> > > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
> >>> > > > > > At the time this was submitted by Leonardo, I confirmed -- =
or thought
> >>> > > > > > I had confirmed -- with PowerVM partition firmware developm=
ent that
> >>> > > > > > the following RTAS functions:
> >>> > > > > >=20
> >>> > > > > > - ibm,get-xive
> >>> > > > > > - ibm,int-off
> >>> > > > > > - ibm,int-on
> >>> > > > > > - ibm,set-xive
> >>> > > > > >=20
> >>> > > > > > were safe to call on multiple CPUs simultaneously, not only=
 with
> >>> > > > > > respect to themselves as indicated by PAPR, but with arbitr=
ary other
> >>> > > > > > RTAS calls:
> >>> > > > > >=20
> >>> > > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.i=
bm.com/
> >>> > > > > >=20
> >>> > > > > > Recent discussion with firmware development makes it clear =
that this
> >>> > > > > > is not true, and that the code in commit b664db8e3f97 ("pow=
erpc/rtas:
> >>> > > > > > Implement reentrant rtas call") is unsafe, likely explainin=
g several
> >>> > > > > > strange bugs we've seen in internal testing involving DLPAR=
 and
> >>> > > > > > LPM. These scenarios use ibm,configure-connector, whose int=
ernal state
> >>> > > > > > can be corrupted by the concurrent use of the "reentrant" f=
unctions,
> >>> > > > > > leading to symptoms like endless busy statuses from RTAS.
> >>> > > > >=20
> >>> > > > > Oh, does not it means PowerVM is not compliant to the PAPR sp=
ecs?
> >>> > > >=20
> >>> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
> >>> > > > Implement reentrant rtas call") change is incorrect. The "reent=
rant"
> >>> > > > property described in the spec applies only to the individual R=
TAS
> >>> > > > functions. The OS can invoke (for example) ibm,set-xive on mult=
iple CPUs
> >>> > > > simultaneously, but it must adhere to the more general requirem=
ent to
> >>> > > > serialize with other RTAS functions.
> >>> > > >=20
> >>> > >=20
> >>> > > I see. Thanks for explaining that part!
> >>> > > I agree: reentrant calls that way don't look as useful on Linux t=
han I
> >>> > > previously thought.
> >>> > >=20
> >>> > > OTOH, I think that instead of reverting the change, we could make=
 use of the
> >>> > > correct information and fix the current implementation. (This cou=
ld help when we
> >>> > > do the same rtas call in multiple cpus)
> >>> >=20
> >>> > Hmm I'm happy to be mistaken here, but I doubt we ever really need =
to do
> >>> > that. I'm not seeing the need.
> >>> >=20
> >>> > > I have an idea of a patch to fix this.=20
> >>> > > Do you think it would be ok if I sent that, to prospect being an =
alternative to
> >>> > > this reversion?
> >>> >=20
> >>> > It is my preference, and I believe it is more common, to revert to =
the
> >>> > well-understood prior state, imperfect as it may be. The revert can=
 be
> >>> > backported to -stable and distros while development and review of
> >>> > another approach proceeds.
> >>>
> >>> Ok then, as long as you are aware of the kdump bug, I'm good.
> >>>
> >>> FWIW:
> >>> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
> >>
> >> A shame. I guess a reader/writer lock would not be much help because
> >> the crash is probably more likely to hit longer running rtas calls?
> >>
> >> Alternative is just cheat and do this...?
>
> [...]
>
> >
> > I wonder - would it be worth making the panic path use a separate
> > "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
> > RTAS at panic time, then leaving rtas.args untouched might make the
> > ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
> > incur on the panic path more likely to succeed.

Yeah I think that's probably not a bad idea. Not sure if you've got the
bandwidth to take on doing the patch but be my guest if you do :)
Otherwise we can file it in github issues.

> Regardless, I request that we proceed with the revert while the crash
> path hardening gets sorted out. If I understand the motivation behind
> commit b664db8e3f97 ("powerpc/rtas: Implement reentrant rtas call"),
> then it looks like it was incomplete anyway? rtas_os_term() still takes
> the lock when calling ibm,os-term.

Yeah agree a simple revert should be done first.

Thanks,
Nick
