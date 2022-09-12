Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175025B5D0E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 17:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR9Ns6LYzz3chc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 01:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jrQtweWg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=leobras.c@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jrQtweWg;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR9Lt69VVz3bkx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:22:13 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id h8so8944440wrf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=O8G6dPX3Y+xOXwYbrMKuwoBIXB9JjS8djjszRlHc9C4=;
        b=jrQtweWgR9yIjX8oAAat+A6oMGWvw2MKGOLbXW1hag3gl1UfkIDpZbFy0RkezHpMC9
         7hMqKiHaDgdc/CvL8V/2ApSdiUJyuic62kXcPbezFB6mVAfYJKDBw+5o06139k4BjES2
         by6WoZP0p5auUsWDaCRNIvk7CsUNch4W/RTEPEL+LpLxBSNgYaiNWLIbOBAUF7AS3RX1
         ohUF/tQvSeCnU6xraFh816r3JfdoNm1KgQYPDLj3HaTULcz2Xy1jtJkeqta6KLVmC94y
         JBeyieOzHzmCE5cVc3iQrcGLeTZzWpPvMYhwfrnG89U9RdtDtiXd24PnF58drV5Ohyu8
         yMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=O8G6dPX3Y+xOXwYbrMKuwoBIXB9JjS8djjszRlHc9C4=;
        b=smk7my1okmKi0qte/0y2osJQLJWoNtHaY0CR1bO1HrI9T3G0W07n89rUUiTShfoOjs
         yj38xx+/4aPHWiVUTd3O1Vkzk89hW2hlkJoTRb3EBzA0/Nqv8XG3/1iU5Soi23ilX2j8
         RyP3oHCI/Rqr1S/bPqltSpAjEoLD/Gpl1K0VdTFnPDCM5fI2Qzg8t5es6BEcIPcTDVEH
         5mwr0VvVaxyP/t9VD0BMKa1J6kqZQDMOWFZpOga/Ol9+IawRTOakGKoKvgpmV/KajG3v
         6pAiQwfN233Sti1+QxOOWjV4lnJkvdEo5esXAfA7XcHJ2qm7vd673BGCVA6rsBkep9I6
         isfA==
X-Gm-Message-State: ACgBeo142vFFIgZiKRrzVo06KMBfFzA41XHUrI28P5RgvImlXdB6HzRB
	xt7o9xMcEBv6cmj9Ci0wBGU=
X-Google-Smtp-Source: AA6agR7kpCmsjqzpauqT/6uA/d7ctIsy6G8Fthr1mZvV281BNKbyCmlfxS1AFcL9eMmzt4xOCpDC3w==
X-Received: by 2002:a5d:5848:0:b0:228:47af:caf3 with SMTP id i8-20020a5d5848000000b0022847afcaf3mr16404945wrf.336.1662996129761;
        Mon, 12 Sep 2022 08:22:09 -0700 (PDT)
Received: from [10.119.19.98] ([89.101.193.68])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c150500b003a60f0f34b7sm9626121wmg.40.2022.09.12.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 08:22:09 -0700 (PDT)
Message-ID: <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Mon, 12 Sep 2022 12:22:03 -0300
In-Reply-To: <871qskve2f.fsf@linux.ibm.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
	 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
	 <871qskve2f.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
> Hi Leonardo,
>=20
> (restoring the list to the cc, hope that's ok)
>=20

Sure, thanks for doing that.=C2=A0
I probably had some mail composer issue here.

> Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
> > > At the time this was submitted by Leonardo, I confirmed -- or thought
> > > I had confirmed -- with PowerVM partition firmware development that
> > > the following RTAS functions:
> > >=20
> > > - ibm,get-xive
> > > - ibm,int-off
> > > - ibm,int-on
> > > - ibm,set-xive
> > >=20
> > > were safe to call on multiple CPUs simultaneously, not only with
> > > respect to themselves as indicated by PAPR, but with arbitrary other
> > > RTAS calls:
> > >=20
> > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com/
> > >=20
> > > Recent discussion with firmware development makes it clear that this
> > > is not true, and that the code in commit b664db8e3f97 ("powerpc/rtas:
> > > Implement reentrant rtas call") is unsafe, likely explaining several
> > > strange bugs we've seen in internal testing involving DLPAR and
> > > LPM. These scenarios use ibm,configure-connector, whose internal stat=
e
> > > can be corrupted by the concurrent use of the "reentrant" functions,
> > > leading to symptoms like endless busy statuses from RTAS.
> >=20
> > Oh, does not it means PowerVM is not compliant to the PAPR specs?
>=20
> No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
> Implement reentrant rtas call") change is incorrect. The "reentrant"
> property described in the spec applies only to the individual RTAS
> functions. The OS can invoke (for example) ibm,set-xive on multiple CPUs
> simultaneously, but it must adhere to the more general requirement to
> serialize with other RTAS functions.
>=20

I see. Thanks for explaining that part!
I agree: reentrant calls that way don't look as useful on Linux than I
previously thought.

OTOH, I think that instead of reverting the change, we could make use of th=
e
correct information and fix the current implementation. (This could help wh=
en we
do the same rtas call in multiple cpus)

I have an idea of a patch to fix this.=20
Do you think it would be ok if I sent that, to prospect being an alternativ=
e to
this reversion?


> I don't claim that this is a useful property, at least not for
> Linux. Maybe other OSes are better able to exploit it.
>=20
> I apologize for my role in the confusion here. When reviewing the
> original change, I talked to firmware development about the reentrant
> property and how we wanted to use it. I've since reviewed that
> conversation and concluded that I didn't communicate clearly, and that I
> interpreted their responses too eagerly.

No problem. Thanks for even talking to firmware people during original chan=
ge!


>=20
> In the future, when we (pseries Linux developers at IBM) want to go
> beyond the language of the spec, we probably should initiate an
> architecture change to make the PAPR eventually align with our
> implementation choices.

Yeah, it makes sense.

>=20
> > I mentioned this in the original Commit, and it's still true to the las=
t LoPAR:
> >=20
> > ###
> > For "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".
> >=20
> > On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
> > items 2 and 3 say:
> >=20
> > 2 - For the PowerPC External Interrupt option: The * call must be
> > reentrant to the number of processors on the platform.
> > 3 - For the PowerPC External Interrupt option: The * argument call
> > buffer for each simultaneous call must be physically unique.
> >=20
> > ###=20
> >=20
> > Other than that, IIRC, this change was used to avoid issues that were h=
appening
> > on kdump/kexec:=C2=A0
> > If another thread was holding the rtas lock, kdump/kexec would get stuc=
k waiting
> > for the lock forever and never finish the process, often causing a bug
> > reproduction's kdump to not get collected.=20
> >=20
> > Is there any other fix for the above bug?=C2=A0
>=20
> Not that I'm aware of, but if this is a common failure mode for kdump,
> then perhaps rtas_call() or related code should be made to ignore the
> lock in the crash path, as a more general mitigation.

It was the first idea at the time (bust the rtas lock), but I thought it co=
uld
raise some issues. Reentrant rtas calls seemed like a better solution at th=
e
time.

>=20
> Then again, maybe it's not that urgent? Only XICS mode guests are
> potentially affected. Do we even have this problem with
> firmware-assisted dumps on PowerVM?

It's been a lot of time, I don't recall all the details on that.

>=20
> > Or is that a bug which is acceptable to have back, compared to the new
> > one?
>=20
> It was not acceptable to regress existing functions (DLPAR, LPM) in
> exchange for making the crash path more robust. Reverting the change is
> the correct tradeoff, unfortunately.

I was talking about the kdump bug being acceptable, which by the previous
comment it is, or can be solved in other ways (busting rtas lock, as previo=
usly
mentioned).

Thanks Nathan!

Best regars,=20
Leo
