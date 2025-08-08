Return-Path: <linuxppc-dev+bounces-10756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DEB1E8DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 15:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz44r192sz2xHp;
	Fri,  8 Aug 2025 23:05:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754658300;
	cv=none; b=P+/cqDS6XvulgKgMCHKKFsVSZzBJLjCnT/lcI2TG3C9GoDj3TJ/8xbdKb3KkPDGz2iKCSkTULTMf8j/5kXFmxGz0iTrfRh19oGBj2NIKhVLXWkGCSCzQjAdnndZ3pubrvzSKxMKDH4oNbdcdkkD94jsrJiRBKw0oZIL7tGNZhNQLad1sX7CnhStaS3kjuplbco1Hx7l7Im7cmzW20/8+UyflY3Duw1fnbEi/FLCHibN6tZ15b2vLUNKxbBZA8U9rH5a4aD89RixGD0es01g44z4BznG1t2ILJ7KFEXPcTBDTZW512psNb6ysoykFvkdnaKpgv4883w4CP7Nq/T3FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754658300; c=relaxed/relaxed;
	bh=MZbNINpDtNwPAODLw/p25kVPu0hlXgpqeNAl0WAMF5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/t0/QuzCUzjL/b485pzG0RecChjhSQ6Wt+a0H0oPfrvunmWEgtzKiyvYBRc1xmF+cniIx9EiNJ7zeystefX1jd2p7EatwYrNCCvO5p9eDY1JSHgWJo5BVyp3t+efpEzOBdoMvFrEHOzeiYx7zMrPweCGjK0GbM4gkd2InC8LfTEAlEqHFM5Ck3QLi5O/E2Cu6hb53i5DAZVjCOMsycxhOjM4QnDT4KvEH98x+O2DPOmLRh33fdV1jIlKHzA1O7WaFEMvUyCOsyETKD0wxzxsqzQzB/p/ILw9Y0N7sLQuOBIhaKyCCSiKilJUtdpl5Q2cgtsY6pi6AXMK7wluFUXIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FMCNmfrK; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FMCNmfrK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz44l5Mm1z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 23:04:54 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-30b7eba97f5so839632fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Aug 2025 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754658289; x=1755263089; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZbNINpDtNwPAODLw/p25kVPu0hlXgpqeNAl0WAMF5Y=;
        b=FMCNmfrK3MF8o6rmUZ4YJ/cKDaXkDrhCHaD+nSrp0OjtIJ1j4FagRputOgra4DMT4n
         Af14NI6v0rpJMXOJe8PYI+L/zYXHm+7FjoX+t6AKML9t/bxNsZWc7pVGgRMspvcBj9vB
         dtQkTvVrf/gWeHre5wXkd+ZYAtFY1MC6zG+09cSvyj+HyMyNUIS9IUG6AwXHZE+Q8QMd
         uJcnL4OdA+jpm3rTRm+udcimyW5+YiHvNpS84b1tjYS6VgzaWKYrDihC8mPv333OaOb7
         j2pZR0uCBuOZ7nsXPuvqSLuxTcLF/jql8uCOIqkKxMa3DOdryX0qTs/4tfDSy1/lMzu/
         F9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754658289; x=1755263089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZbNINpDtNwPAODLw/p25kVPu0hlXgpqeNAl0WAMF5Y=;
        b=XWS0whC7rdzPTTkNG6DT+6RSzbcp/60vh4w4SrrEsfw79+IQEk5z7H2NFKX/ncl4oB
         PlZUL0KLhooTGmG5v7cFaA0u6/z6dGA1QPgYcncSC+kohW6raoEPRU/ASGNeZwSG2OIc
         M1vlvtlWykvJ09khfz+TBapOoQoYbs66W0V5P96jqCnx+lBWnGojE6mKIv93R0vSE+dL
         s8YYBpZoONt0g+FTdQlJmsXk1wW+hIlHzaB8PkG5dWftUXZ7O1++LaN1h3LWnLr7xhaG
         z/8YxYYsgsP0uFQ5IevKWApwPiU8uC43rPY/159u5PmYxi4v+UVO7fuD7E6j+Rn4ToCZ
         MFUw==
X-Forwarded-Encrypted: i=1; AJvYcCW8kW1ajPiLNbOiBlAjqjzKQ5tcrONY2062kgoyCh81Pk9IPjjh2Ish/rO+aRPwnwf39WeCUYHL4BklmXI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxwyK4qx/9Ncx8mwkrvMHlKXZ+Lm/tGfVA44i0y6A/Y5Of2xnYF
	QHMSLMbL7Aii62UqAguklxx0/Va4bQ9XoK1vOjOC3ipw68K0/1aoFBYQkbNFEk/RjwE3jDje4T0
	o0YPAJ05SQHWD1dSoM5SSLPA6LidwWgCHkDSV
X-Gm-Gg: ASbGncti1eGnXnuDsRghwk9dNTN7s7mE3jkUn4sOv2h05dt1oJX+dl4NSj8wzz+Ns6t
	YImrq+43GzOQSl+v5tPB370mzEWFBbFvxeb2hDwcVmlLJc3scwuhRhvqdfojB+gTG40ymXzeN61
	esHhzoyaRLl6l14262ssfRpH4K6quvzZ4m0YBISCYsGo2nkkPkdZONJIQ084ISbu68rDMa9ZDKW
	p2md2U=
X-Google-Smtp-Source: AGHT+IFlSvcxbL5GPPyPwmiE/DsA4FgAwXz1H3jaR/ZIQGjKmn+Ihg0nha5JLpTZM0CwWNa5eQTwI/sGz45V76qqNk8=
X-Received: by 2002:a17:902:d503:b0:240:58a7:892f with SMTP id
 d9443c01a7336-242c202c051mr19191455ad.5.1754657803805; Fri, 08 Aug 2025
 05:56:43 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org> <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
In-Reply-To: <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Aug 2025 08:56:31 -0400
X-Gm-Features: Ac12FXwadau3sWLYns3mQnQjQQDJTmPDYbqhGMIZFHY0vTvoSi_qG5LusvZotvk
Message-ID: <CADnq5_PMu0tqCaGccdL2JDZuHqSb2Q2mgo12Cba-pDAL9bAmBw@mail.gmail.com>
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Mario Limonciello <superm1@kernel.org>, mad skateman <madskateman@gmail.com>, 
	ville.syrjala@linux.intel.com, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>, amd-gfx@lists.freedesktop.org, 
	Alexander Deucher <Alexander.Deucher@amd.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, bhelgaas@google.com, 
	benato.denis96@gmail.com, Yijun_Shen@dell.com, 
	David Perry <David.Perry@amd.com>, rafael@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 8, 2025 at 7:48=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
>
>
> > On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> w=
rote:
> >
> > =EF=BB=BF
> >
> >> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
> >> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@a=
md.com> wrote:
> >> Does applying
> >> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6=
fdca04009e0
> >> help?
> >> - - -
> >> Hello Mario,
> >> Thanks a lot for your patch.
> >> I tested it today but unfortunately it doesn=E2=80=99t solve the issue=
 with the Radeon framebuffer.
> >> I have created two kernels with and without the drm-next-2025-07-30 up=
dates [1] because of the issue with the Radeon graphics framebuffer device =
#15. [2]
> >> Download and further information: https://github.com/chzigotzky/kernel=
s/releases/tag/v6.17.0-alpha5
> >> I have tested both kernels this week and I can definitely confirm, tha=
t the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> >> The Radeon graphics framebuffer doesn't work with the kernel with the =
drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer wor=
ks.
> >> I bisected yesterday. [2]
> >> There are some other user reports:
> >> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p60=
606
> >> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p60=
595
> >> They use other Radeon graphics chips.
> >> @All
> >> Please check the drm-next-2025-07-30 updates [1]
> >> Thanks,
> >> Christian
> >> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3D260f6f4fda93c8485c8037865c941b42b9cba5d2
> >> [2] https://github.com/chzigotzky/kernels/issues/15
> >
> > I think there is a mistake in your bisect, which I notice from looking =
at your other user reports.
> >
> > The original commit you identified in your bisect and thus CC'ed me cam=
e in 6.16-rc1.
> >
> > =E2=9D=AF git describe --contains 4d4c10f763d7808fbade28d83d237411603bc=
a05
> > v6.16-rc1~50^2~19^2
> >
> > There absolutely was a regression for that was raised, but this was fix=
ed in 6.16-rc3.
> >
> > =E2=9D=AF git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca0400=
9e0
> > v6.16-rc3~13^2~1
> >
> > Users in your forums posts talk about 6.16 final working fine.  So I th=
ink that when you bisected you ran into multiple confounding issues and rep=
licated in a similar fashion.  You should check every single bisect step to=
 see if 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's appli=
ed but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step=
 you should apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
> >
> > Hopefully that will get you down to the real cause.
>
> Thanks for the hint. Unfortunately I don=E2=80=99t have more time for fig=
uring out the issue.

Does this patch help?
https://patchwork.kernel.org/project/dri-devel/patch/20250805175752.690504-=
4-imre.deak@intel.com/

Alex

>
> Two facts:
>
> - The Radeon driver can no longer be used.
> The Radeon driver is broken for us.
>
> - The issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>
> I cannot provide any more due to time constraints.
>
> I've already spent time that I didn't actually have.
>
> Thanks for your help.
>
> Christian
>
>

