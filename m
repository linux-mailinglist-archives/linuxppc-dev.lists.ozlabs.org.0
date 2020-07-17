Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C64222FFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 02:28:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7Bmh24PPzDql6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=networkplumber.org (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=stephen@networkplumber.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=networkplumber.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=networkplumber-org.20150623.gappssmtp.com
 header.i=@networkplumber-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=wxlthbCa; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Bkp2967zDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 10:26:37 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id gc15so3487983pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sY8+N85oqkl2t0ja+54Zp0Xu2QVORP94+Xr24xEEU4k=;
 b=wxlthbCasQvJMAzzt74cXg+fGlX+A5EDVO8hNpyWhuulTaIov8ldMi2MzeY54uE2lI
 7hO0RZ1tdAUrpLlnT4W8EIbByvkJVQiOZkkIMJuSZ345UbavpNLrAojO75cswZGj3oEI
 c+qlONHjPMN4vV+UAObzAarAmMz4/eGw8+p2EmLH4Osj0AeuaGIZ7DGyb1sUT/mlnGdI
 6YMv6hz21d6rMtP3b/rCIzlOBL7Ve+gnJhcwEEXbqtp6cG/0+F13xFTWbCR7+Kzbv9/D
 29q0xhLXlhlHf3Pda5ISyh2gGAbDlaw7+7MZoYLz/oEpTWdYQkbN/3Bz8SPOeXQiaRbB
 PMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sY8+N85oqkl2t0ja+54Zp0Xu2QVORP94+Xr24xEEU4k=;
 b=sd5oKQHibnbzE8Y2s0g/j3Pn0vH6adOTDQQXTXJA5xM2wUWynm+ipTdFxwYs8GmjZa
 9uIUp+iCXZVWasRXZFeYNRF+a8oA0os0Opge67ANevR+7SOgXBYvq7MWHo8zoUU55ij1
 atFeYoKoDJsKpzY07big1Ud80ZLwyNXhUE9wy/48WMw4Av21ArLt1svQAmD7YWXBLhQb
 0MOZxFMGMQf3DdOtLsoD0Hetr9HCjBhl7kkWX652dOyJSnpB4YkDZI94eFhVn8Uoro4X
 3V3nPax1UmykicH3aMAnRr1KzvZP1cBkcckE16BF5EISgF9Ua/LoF9wHdaNW0E9ewc+J
 0DKw==
X-Gm-Message-State: AOAM530rul6gP1zzVrBJbJatmPEbZfgy8YgQ9JzswUSep6Ti4SvmG4CR
 IntEXloRKrCIsMhtlvtG2LVZEg==
X-Google-Smtp-Source: ABdhPJyTmJ7UsZU8Bie9LXJI9JcadsfdH/ShOoZo0ZAIxEB/8gk1EMV/kPb6XU9fT2XX9PV+78eG/g==
X-Received: by 2002:a17:90a:3689:: with SMTP id
 t9mr7338441pjb.28.1594945594288; 
 Thu, 16 Jul 2020 17:26:34 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
 by smtp.gmail.com with ESMTPSA id s6sm5796856pfd.20.2020.07.16.17.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 17:26:33 -0700 (PDT)
Date: Thu, 16 Jul 2020 17:26:25 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] ibmvnic: Increase driver logging
Message-ID: <20200716172625.2e14a268@hermes.lan>
In-Reply-To: <20200716132200.37934905@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <1594857115-22380-1-git-send-email-tlfalcon@linux.ibm.com>
 <20200715170632.11f0bf19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20200715.182956.490791427431304861.davem@davemloft.net>
 <9c9d6e46-240b-8513-08e4-e1c7556cb3c8@linux.ibm.com>
 <20200716160736.GI32107@kitsune.suse.cz>
 <20200716132200.37934905@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
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
Cc: netdev@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 drt@linux.ibm.com, Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jul 2020 13:22:00 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 16 Jul 2020 18:07:37 +0200 Michal Such=C3=A1nek wrote:
> > On Thu, Jul 16, 2020 at 10:59:58AM -0500, Thomas Falcon wrote: =20
> > > On 7/15/20 8:29 PM, David Miller wrote:   =20
> > > > From: Jakub Kicinski <kuba@kernel.org>
> > > > Date: Wed, 15 Jul 2020 17:06:32 -0700
> > > >    =20
> > > > > On Wed, 15 Jul 2020 18:51:55 -0500 Thomas Falcon wrote:   =20
> > > > > >   	free_netdev(netdev);
> > > > > >   	dev_set_drvdata(&dev->dev, NULL);
> > > > > > +	netdev_info(netdev, "VNIC client device has been successfully=
 removed.\n");   =20
> > > > > A step too far, perhaps.
> > > > >=20
> > > > > In general this patch looks a little questionable IMHO, this amou=
nt of
> > > > > logging output is not commonly seen in drivers. All the the info
> > > > > messages are just static text, not even carrying any extra inform=
ation.
> > > > > In an era of ftrace, and bpftrace, do we really need this?   =20
> > > > Agreed, this is too much.  This is debugging, and thus suitable for=
 tracing
> > > > facilities, at best.   =20
> > >=20
> > > Thanks for your feedback. I see now that I was overly aggressive with=
 this
> > > patch to be sure, but it would help with narrowing down problems at a=
 first
> > > glance, should they arise. The driver in its current state logs very =
little
> > > of what is it doing without the use of additional debugging or tracing
> > > facilities. Would it be worth it to pursue a less aggressive version =
or
> > > would that be dead on arrival? What are acceptable driver operations =
to log
> > > at this level?   =20
>=20
> Sadly it's much more of an art than hard science. Most networking
> drivers will print identifying information when they probe the device
> and then only about major config changes or when link comes up or goes
> down. And obviously when anything unexpected, like an error happens,
> that's key.
>=20
> You seem to be adding start / end information for each driver init /
> deinit stage. I'd say try to focus on the actual errors you're trying
> to catch.
>=20
> > Also would it be advisable to add the messages as pr_dbg to be enabled =
on demand? =20
>=20
> I personally have had a pretty poor experience with pr_debug() because
> CONFIG_DYNAMIC_DEBUG is not always enabled. Since you're just printing
> static text there shouldn't be much difference between pr_debug and
> ftrace and/or bpftrace, honestly.
>=20
> Again, slightly hard to advise not knowing what you're trying to catch.

Linux drivers in general are far too noisy.
In production it is not uncommon to set kernel to suppress all info message=
s.
