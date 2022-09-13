Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984E5B783D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 19:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRrMq3Ljwz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 03:40:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WMK777Mf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=leobras.c@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WMK777Mf;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRrM83gkkz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 03:39:46 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso9986480wmr.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=GUL3z4nEbyK3zQ3tq3NpxDrHLqSJI3dZl5UAabL9oVE=;
        b=WMK777MfOi+0u54zSbTbhxMGN55qjb1SYRD7kkRbTK8tSAfQwgmFP7sblYygKt64Ka
         Ep4+9W0AwBQLa+KWuBGquHYVRYuJi2g/ME595Sf3xE36cKUvAIu+VuLPXT3hTMIVY2dM
         FsbgEDbjm98MrLRVHEhT23zVc0nRAhDe7H80dGAioiXmVlHN67Icc87NWikL4nsTS3vK
         iLuuEdL1yWx6vdWofHAnARkfbeIBBN8lWHeJCaBbvJgbFoOWRBkSqOl+gXizjEaFcgIE
         3TITe14voZz4ViMq/sfvmZExGh3PtbHjK9p97p5TQQwm57sS39Z6TAArmnoY/wzx6l+I
         iH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=GUL3z4nEbyK3zQ3tq3NpxDrHLqSJI3dZl5UAabL9oVE=;
        b=nDyQRP5+2W3xsFt+hhsA1cD6pvGn1mRK012yBoe+2Ik2YAoRKggPcxAjNkxRSO3mrT
         9T4IWXe/KjhVrUa2MclH5mAlY2mJuIMqMFfXbsz+zq3ZUZf2QeBfnDgefpcnwqMyPrcd
         ft3NDohcQftR5aT3h/yw4VXwzxGRXosGiEww2nmrYONb3kNzHhmbS6KpgYb/PEQTUmbC
         h9YAHPZiTbBrd0kI/jHm/As2b3G+xWhiasqALP60leiIRukfz4eo7hC9LP/DHMwW8o4F
         3lqDFEWM0FG0y1qsBnzLeGbodmHnq7GqAU+DTgK10GcWga88fOfRLjHDQGkIUQYQuJ0H
         FK2A==
X-Gm-Message-State: ACgBeo06K7hmSS2ldtMmeoZpxsYaGZwI7A5ubAqYIxQnLaAABIToR7la
	Rwp3uzoYeqCn4hN4yWrjvCexuZsWtYs=
X-Google-Smtp-Source: AA6agR48EGC6A8EDc5HcFSSJhiS99ZkhOjHKr01Rs9wmv2OJpRNhI+aE+NJyLGO7+g0ceAKN5LE9UA==
X-Received: by 2002:a1c:7412:0:b0:3b4:7a81:e7e4 with SMTP id p18-20020a1c7412000000b003b47a81e7e4mr289401wmc.15.1663090782324;
        Tue, 13 Sep 2022 10:39:42 -0700 (PDT)
Received: from [172.20.194.45] ([79.140.208.123])
        by smtp.gmail.com with ESMTPSA id q127-20020a1c4385000000b003a5f54e3bbbsm14770787wma.38.2022.09.13.10.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 10:39:41 -0700 (PDT)
Message-ID: <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Tue, 13 Sep 2022 14:39:27 -0300
In-Reply-To: <87y1uotlfa.fsf@linux.ibm.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
	 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
	 <871qskve2f.fsf@linux.ibm.com>
	 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
	 <87y1uotlfa.fsf@linux.ibm.com>
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

On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
> Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
> > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
> > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
> > > > > At the time this was submitted by Leonardo, I confirmed -- or tho=
ught
> > > > > I had confirmed -- with PowerVM partition firmware development th=
at
> > > > > the following RTAS functions:
> > > > >=20
> > > > > - ibm,get-xive
> > > > > - ibm,int-off
> > > > > - ibm,int-on
> > > > > - ibm,set-xive
> > > > >=20
> > > > > were safe to call on multiple CPUs simultaneously, not only with
> > > > > respect to themselves as indicated by PAPR, but with arbitrary ot=
her
> > > > > RTAS calls:
> > > > >=20
> > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com=
/
> > > > >=20
> > > > > Recent discussion with firmware development makes it clear that t=
his
> > > > > is not true, and that the code in commit b664db8e3f97 ("powerpc/r=
tas:
> > > > > Implement reentrant rtas call") is unsafe, likely explaining seve=
ral
> > > > > strange bugs we've seen in internal testing involving DLPAR and
> > > > > LPM. These scenarios use ibm,configure-connector, whose internal =
state
> > > > > can be corrupted by the concurrent use of the "reentrant" functio=
ns,
> > > > > leading to symptoms like endless busy statuses from RTAS.
> > > >=20
> > > > Oh, does not it means PowerVM is not compliant to the PAPR specs?
> > >=20
> > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
> > > Implement reentrant rtas call") change is incorrect. The "reentrant"
> > > property described in the spec applies only to the individual RTAS
> > > functions. The OS can invoke (for example) ibm,set-xive on multiple C=
PUs
> > > simultaneously, but it must adhere to the more general requirement to
> > > serialize with other RTAS functions.
> > >=20
> >=20
> > I see. Thanks for explaining that part!
> > I agree: reentrant calls that way don't look as useful on Linux than I
> > previously thought.
> >=20
> > OTOH, I think that instead of reverting the change, we could make use o=
f the
> > correct information and fix the current implementation. (This could hel=
p when we
> > do the same rtas call in multiple cpus)
>=20
> Hmm I'm happy to be mistaken here, but I doubt we ever really need to do
> that. I'm not seeing the need.
>=20
> > I have an idea of a patch to fix this.=20
> > Do you think it would be ok if I sent that, to prospect being an altern=
ative to
> > this reversion?
>=20
> It is my preference, and I believe it is more common, to revert to the
> well-understood prior state, imperfect as it may be. The revert can be
> backported to -stable and distros while development and review of
> another approach proceeds.

Ok then, as long as you are aware of the kdump bug, I'm good.

FWIW:
Reviewed-by: Leonardo Bras <leobras.c@gmail.com>

