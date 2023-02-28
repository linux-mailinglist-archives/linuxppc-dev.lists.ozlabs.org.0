Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669716A5EA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 19:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR5KM1qdFz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 05:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.44; helo=mail-pj1-f44.google.com; envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR5Jl4Z0Wz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 05:20:37 +1100 (AEDT)
Received: by mail-pj1-f44.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso3797296pjr.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 10:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677608435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guRYAtmT3BDRSrr0ckEgmG8u5FThJCknxGDTt3HEtVc=;
        b=M7NRzWS5KbWeiqlPO/6yIACFcIotIHNxAn9WIaHbEZS97x4wj+E1wkcMmOLMLawtub
         UdA6X1DjH5lXT8lzx9ikQWbpopIELaIWA/RW9XJjT61UmnYdLpOtUjf0VPh5JnOf+DM+
         35gclR2vCGmp3Rt5X0V8yw8owAz2swVWxxUNFPN5KnvfePiwQBhlPihOHSNaRSdhoiso
         kUnX09nFoOPPF8DXXxK9t6CtWjdRqeNWccwHvdn1TDX/JEkw//s2DvJF3IpZ0B2r9iIs
         S9qNCrCiSDoFLXXmFB07B1nWuisrFzq73+vmfjmpmm8FZimGufMwG+0q+Qj3u+iAeVV7
         p45w==
X-Gm-Message-State: AO0yUKVzEfb6Kg44Fw1EMRktYuBL7PmM0aFaJihQCodcoxt6FZMQ9vvJ
	ycLctgK6KulrHreeDsPmK99mU3qyEx5lJw==
X-Google-Smtp-Source: AK7set+mCR9tsjmgX29ZaVCh4UxhZ9weoVDSox+CRU0lWQjhWOQFRGTQu/NhX6sj6H0kbUoAFBp8GA==
X-Received: by 2002:a17:902:b106:b0:199:2ee:6238 with SMTP id q6-20020a170902b10600b0019902ee6238mr3236910plr.16.1677608435117;
        Tue, 28 Feb 2023 10:20:35 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902788600b00199193e5ea1sm6820285pll.61.2023.02.28.10.20.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 10:20:34 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id s18so6240955pgq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 10:20:34 -0800 (PST)
X-Received: by 2002:a63:b513:0:b0:4fc:a80e:e6ec with SMTP id
 y19-20020a63b513000000b004fca80ee6ecmr1143570pge.5.1677608433888; Tue, 28 Feb
 2023 10:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com> <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com> <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
In-Reply-To: <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 28 Feb 2023 12:20:21 -0600
X-Gmail-Original-Message-ID: <CADRPPNRQSUWcOJX-cupWQvu290mMRxejrQTwjna_fibonyU3AA@mail.gmail.com>
Message-ID: <CADRPPNRQSUWcOJX-cupWQvu290mMRxejrQTwjna_fibonyU3AA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 11:52=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Feb 28, 2023, at 11:03, Joakim Tjernlund wrote:
> > On Mon, 2023-02-27 at 14:48 -0600, Li Yang wrote:
> >> > > >
> >> > > > Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> >> > > > MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the k=
ernel.
> >> > > >
> >> > > > There will still exist several e300 Freescale Reference Design S=
ystem (RDS)
> >> > > > boards[5] and mini-ITX boards[6] with support in the kernel.  Wh=
ile these
> >> > > > were more of a COTS "ready to deploy" design more suited to hobb=
yists, it
> >> > > > probably makes sense to consider removing these as well, based o=
n age.
> >> > >
> >> > > These boards are mass market boards that sold in larger amount and=
 are much more likely to still be used.  We would suggest we keep them for =
now.
> >
> > Agreed, the RDS design is still used here.
>
> Can you elaborate what the typical kernel upgrade schedule for
> these boards?
>
> Note that for the debate about dropping the machines from future
> kernels, it does not really matter how many remaining users there
> are or how many boards get sold. The only question is whether
> someone is still planning to provide upgrades to kernels later
> than linux-6.3 in the future.
>
> It sounds like there are commercial requirements for validating
> and distributing kernel upgrades (in addition to hobbyist uses), so
> I would expect that whoever is paying for the upgrades has a clear
> plan for how much longer they are going to do that, or at least
> a some idea of how many of the previous LTS kernels (5.10, 5.15,
> 6.1) ended up actually getting shipped to users.
>
> It may be worth pointing out that the official webpage for
> the MPC8313ERDB board in the example only lists a hilariously
> outdated BSP kernel based on a patched linux-2.6.23 release,
> so maybe the marketing team can change that to point to the
> latest validated LTS kernel instead.

The BSP/SDK releases from NXP do follow a different development
principle from working with upstream directly.  However, we do value
the customers who prefer to work closer with the upstream community
than relying on our BSPs/SDKs deliveries and that's why we pushed our
development team internally to upstream code as much as possible.  And
we will try to help keep them well maintained in the community.

Regards,
Leo
