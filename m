Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4948C935
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 18:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYvTW3dg8z3bW9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 04:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dR9/pPQ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=dR9/pPQ3; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYvSr37V7z2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 04:19:54 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id q25so12791862edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=65QBkl5auowwKruiCd5ekhebx9aA5QGzBldNP4dKx3o=;
 b=dR9/pPQ3umiUBcOlQtP4NkG7UVl+VgSiD6Gj4ESG3BI5Rd7eU3PraGGHCWjtGvJoJ4
 kWur2vjIEaqWlFGcRkft+wiCc3zVto+ZCKuCJcJVfVrlmU3v1Q8N3QxyRGY0HFiFKokK
 rncMBQNjJs29Bp4qYGukrpNEgf1BoZIYNZVYdThJ2vbve7yQPf5RZXm9G8wXtg83mOqf
 SzED2QYbQYhQowA9le+O2WzhI2joFFcqNVh0VnMuPZTBusvIHA4szTzmuLcTbnnLrYew
 ONN7nPhum87e3WIZ9Jac30F2kq0Lu+/K0Z0qSTHRZGVjyjZzODhzhKRoEeFYOQ0LbAvN
 90zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=65QBkl5auowwKruiCd5ekhebx9aA5QGzBldNP4dKx3o=;
 b=R53I09bfunur8vnraSRh+wZ04rz9wrmUzsVS2YZKQTv7lvyphq5v0U6N0uu2AnS+G7
 4MDid5SRTZXDB1AD/DdCved/Ee5r2QxO7FVSob6zjB6rL5J98ZKtzAF0LbJoSHXBhKZM
 xZWsosghGuRJZrrTJHsgbyWjqJgP44bhgX+IuMgBHymwh8zJkykUWW4AyeEqRR6E6a8p
 XeA+3vMFGv5Xfx05RIXPanIYJ25dtk+5x2pOYH1UdquXM6AOhnjUc3Ji3aTCBQCkX+/c
 IcTFfZkMe1XQ6UZVJJcczir89Q4J9wR3P3QdjiF7Xexj4EvmowPqrudjft78axsjT+F9
 PO4A==
X-Gm-Message-State: AOAM531TKCzixSOmWR2rFWON4Etrn48XoEtafTSxLvLhTEm9fMmjbWi8
 Cc/1a42fEY6sao8u1PkUaC77bB6x91x80iwL1TcF
X-Google-Smtp-Source: ABdhPJwGYiCNrfdiEoAyumDRSQUhGOk5sh0PJ0caxAP6QVabEe2bblxKkriHKYt2iErce9Oc+wD+9RhZ2X3N1F2eWts=
X-Received: by 2002:a17:907:1b0d:: with SMTP id
 mp13mr552754ejc.29.1642007987184; 
 Wed, 12 Jan 2022 09:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
 <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
 <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu>
 <102e59ba-fcf0-dd85-9338-75b7ce5fbd83@kaod.org>
 <5f83d1fe-4e6e-1d08-b0c2-aec8ee852065@csgroup.eu>
 <CAHC9VhTcV6jn4z7uGXZb=RZ5k7W4KW1vnoAUMHN6Zhkxsw1Xpg@mail.gmail.com>
 <23e9c126-d167-254f-2f4b-391e9f01396c@csgroup.eu>
In-Reply-To: <23e9c126-d167-254f-2f4b-391e9f01396c@csgroup.eu>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 12 Jan 2022 12:19:36 -0500
Message-ID: <CAHC9VhTHZ-Brr4OrQJ3VLS_zXx1fcAMZ-32sz2=GonmWOgfbDg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17, 2021 at 9:11 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 17/12/2021 =C3=A0 00:04, Paul Moore a =C3=A9crit :
> > On Thu, Dec 16, 2021 at 4:08 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Thanks C=C3=A9dric, I've now been able to install debian PPC32 port of=
 DEBIAN
> >> 11 on QEMU and run the tests.
> >>
> >> I followed instructions in file README.md provided in the test suite.
> >> I also modified tests/Makefile to force MODE :=3D 32
> >>
> >> I've got a lot of failures, am I missing some options in the kernel or
> >> something ?
> >>
> >> Running as   user    root
> >>           with context root:::
> >>           on   system
> >
> > While SELinux is not required for audit, I don't think I've ever run
> > it on system without SELinux.  In theory the audit-testsuite shouldn't
> > rely on SELinux being present (other than the SELinux specific tests
> > of course), but I'm not confident enough to say that the test suite
> > will run without problem without SELinux.
> >
> > If it isn't too difficult, I would suggest enabling SELinux in your
> > kernel build and ensuring the necessary userspace, policy, etc. is
> > installed.  You don't need to worry about getting it all running
> > correctly; the audit-testsuite should pass with SELinux in permissive
> > mode.
> >
> > If you're still seeing all these failures after trying that let us know=
.
> >
>
> Still the same it seems:
>
> Running as   user    root
>          with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c10=
23
>          on   system
>
> # Test 3 got: "256" (backlog_wait_time_actual_reset/test at line 151)
> #   Expected: "0"
> #  backlog_wait_time_actual_reset/test line 151 is: ok( $result, 0 );
>   # Was an event found?

My apologies, this thread was lost in the end-of-year holidays.

At this point, and with that many failures, I think you'll need to
spend some time debugging the test failures to see what is wrong.  I
don't have a PPC32 system/VM and I don't have the time right now to
build up a PPC32 test environment.

--=20
paul moore
www.paul-moore.com
