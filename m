Return-Path: <linuxppc-dev+bounces-6934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3108A5DF05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 15:33:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCY5J4JVsz3bwX;
	Thu, 13 Mar 2025 01:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::831"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741789988;
	cv=none; b=mYL6GF0f/wG/1nzPt4OXY/zfnA9wVM8Ep2vd3+esnDYPm5MZnStCQ0a9RP3xAiTc8MiFA14Nbu+IJg97+j3e9zM1IwswroBfSS2WxL9DwO1Fs53y0cmVf6VmlzxytPeUpM0Rp5FTUR5MXGqO8NozLeM5pogCsAnOOP9C6wZtoeGyKwpNgjbQp/kD3RmSDi9aA6OuoeJEN1r0wJhRq4XssGdfxKo2I+4Qn0PwM6Ad7gHk6Y9AinDlj4vqMO40pPz9OysD70l7I4fOgzFn+nf/iGeJeyvm1lT3yaroUspodh7h1OSXmJqKxJoajUSuv7TMON+bcjoQi8kmOchmLZpxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741789988; c=relaxed/relaxed;
	bh=BxLGV/gTabQc22y8Dfo+hpafOImuUut6Nenup2mQyaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0HPBoY0UDJcrFaaFQRG47N1CQkd8BeeNS1EgvcjRe1ippXifdY5ppTYwnNi/dtBXrdVknIHlAlO0vKYYetQywecR2OVamfL5BApxoPRrzC/kD4mU/Rkh+/M+TEke5TtGPCBcrKNrAXQtu8cTqdAk92xT0Bswc9HB6Ua25TGHKa33219dYRJq0Pv4dePAdNvquDwtvkZums2vQ8VY8Q/90V7ZmI+TxmKrg2K5eFwPMPdhQFOzWe3NCsqH49wTczYkz4UowtP1g0Ae831yC//ckMcDjerjPLNlBnfDBSvojAXu17/Kkms4Jc+KiGF19+h0vdXfMBVpQGz/6BqVs7gLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VkqIII8U; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VkqIII8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCY5H5KyDz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 01:33:07 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47698757053so29431871cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741789985; x=1742394785; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxLGV/gTabQc22y8Dfo+hpafOImuUut6Nenup2mQyaY=;
        b=VkqIII8UK1H7aXC3DXqmdGZn1h+Z5M8bMfxHJKB6eLUBtUeBPXspvvpEsRsuzZIMwM
         q3JKZrk/BwSW3eSnTXjSgihSSFdcN+OPbdorwnwb4XdNX8GWj1MphG+d+9T2K0kHwSWB
         kEJCldmPGiXsN7DgSn6b7VfaXriTI3av8VSlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789985; x=1742394785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxLGV/gTabQc22y8Dfo+hpafOImuUut6Nenup2mQyaY=;
        b=FqFLol+VgzZHp9wzEOU2DQvHwRbEnbJiquGVaLaWNbEAFqajuLqipGlguiRiXulbt2
         e9YHPtJoQ4sAn9aXdAJR7db6oZA2vHRz1uWqDz+w5jo2Gj8woLtr/Gwrejf0+Bz+vFXk
         3KEe4R+Zo79gPGIW/9JDapUFgMN9auMsjMr+2xVGcG3WR2P6HZ8CfTDI6Vq9Ibvq2UNs
         4ZiKNrZq0wJ189pCIuZkO0U/hQUO7XwFsA2vyDM9geJ1HZZdXSJWudf2awzgl+xu4k8Q
         Fzoz9pCVd+aVW+TYR+00svPuH9AyHZibxNSESnMLHZuFwjUBJ35sjCIueshDkL5YY/Iy
         Vnsw==
X-Forwarded-Encrypted: i=1; AJvYcCXvR1l0cLhGmDCWQbIBgq2nY00hypq0aZrQwBXbn5yKa2uoJncWoemO4b4BVHFL5QuyITP5RU0/k/vDjr0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2OcyrPqdFxB3ZZ4/aDTLmOYCByXZpkLMkNbhud/bycoD/bDsN
	qnAvdQLbzVqv0/5KlzTuvLIPiTmO6aZ8UoNj6ztZal0apJ11ybsYfavH4DJdHJnbo7cyXoCx4OM
	9BA==
X-Gm-Gg: ASbGncuyhyz8W3+IFsYgEVcnES8SHoFSbnO1XpaBepelN5D8RrtiKyuvKa8Yn6+DrNx
	y+uz3S+g7KX+u31Av/UzzsXyeAYllf/agDxTkltmKaUQHM5tRslytfZx6bxr8HRVEkY2plRk96P
	6OQ+bcU6OTUUHOL70ihIxNypC2CxkzustWT9EhwY4N1YqrF0s0X/cbzjSFPbCC99yjtPiKNPxOM
	WwBSEU35DME/POWWfI3O/sTvPQQk0bcsW0rJEgGEtV8iaAisLRkQ29mVTyqfRz+kwBsZYpuSPGz
	LqMDlBVODhic7XvfbuEIo6v/x63Y0WO731IzglkgRlLF/15XoWGgAZYKcgUhCUtPSFhVETo05S5
	XjmVk2L80RDg4
X-Google-Smtp-Source: AGHT+IEDgrYyBJo7QbLkextRxOHgQn5vZuKEqFq3+vYsrv5zuczYdpFoP8usPITJ6jDaiWreR+Swpg==
X-Received: by 2002:a05:622a:10:b0:476:98d6:141d with SMTP id d75a77b69052e-47698d65f55mr118063531cf.32.1741789985174;
        Wed, 12 Mar 2025 07:33:05 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476770a0145sm52264421cf.37.2025.03.12.07.33.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 07:33:04 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769e30af66so249301cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 07:33:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNoZFoVT5kZDQY2Zos4VxEqK3TMAN9m7TcUFC8+sSJUbQ4D+W4U53nrsQVL6eAWhCMXFzE6dt0DEpxiCE=@lists.ozlabs.org
X-Received: by 2002:ac8:7d8a:0:b0:474:b44f:bb88 with SMTP id
 d75a77b69052e-476adf0e170mr3551051cf.27.1741789983956; Wed, 12 Mar 2025
 07:33:03 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250311-dead_site-v1-1-7ab3cea374f2@chromium.org> <b3df5e8178107b2a133126e1daf111d10f1b0333.camel@linux.ibm.com>
In-Reply-To: <b3df5e8178107b2a133126e1daf111d10f1b0333.camel@linux.ibm.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 12 Mar 2025 07:32:52 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxoO0QX=r6ECcVHBToR7jaqAz3HD6ZaOf-Z3nP2RuYFdw@mail.gmail.com>
X-Gm-Features: AQ5f1JqjD2DWXGYq02-0yYL-x2rBYXh6GczZW-B2jC0-D-TCZJLFB5aqywzcsmw
Message-ID: <CAMfZQbxoO0QX=r6ECcVHBToR7jaqAz3HD6ZaOf-Z3nP2RuYFdw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: ocxl.rst: Update consortium site
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, Frederic Barrat <fbarrat@linux.ibm.com>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 9:20=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.com=
> wrote:
>
> On Tue, 2025-03-11 at 11:24 -0700, Fritz Koenig wrote:
> > Old site no longer associated with consortium.
>
> Thanks for catching this!
>
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> > After mergers the OpenCAPI Consortium does not seem to exist.
> > The github page is the only seemingly relevant site, but it
> > has not been updated in 4 years.
> > ---
> >  Documentation/userspace-api/accelerators/ocxl.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/accelerators/ocxl.rst
> > b/Documentation/userspace-api/accelerators/ocxl.rst
> > index db7570d5e50d..5fc86ead39f4 100644
> > --- a/Documentation/userspace-api/accelerators/ocxl.rst
> > +++ b/Documentation/userspace-api/accelerators/ocxl.rst
> > @@ -3,8 +3,8 @@ OpenCAPI (Open Coherent Accelerator Processor
> > Interface)
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  OpenCAPI is an interface between processors and accelerators. It
> > aims
> > -at being low-latency and high-bandwidth. The specification is
> > -developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
> > +at being low-latency and high-bandwidth. The specification is
> > developed
> > +by the `OpenCAPI Consortium
> > <https://opencapi.github.io/oc-accel-doc/>`_.
>
> This link is to the OC-Accel framework documentation, which isn't the
> core set of OpenCAPI specifications. Those specs are now hosted by CXL,
> post-merger.
>
> I think I'd update this to say:
>
> The specification was developed by the OpenCAPI Consortium, and is now
> available from the `Compute Express Link Consortium
> <https://computeexpresslink.org/resource/opencapi-specification-archive/>=
_.
>
Thanks for the feedback, V2 posted.

-Fritz

> Thanks,
> Andrew
>
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited

