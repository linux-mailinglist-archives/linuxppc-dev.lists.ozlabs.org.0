Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A807D70737F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM5Dy3CsFz3drM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 07:03:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l0Vn+PJf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l0Vn+PJf;
	dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM5D45Bhjz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 07:02:59 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-338458a9304so15965ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684357376; x=1686949376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcYeLGK9CKTywc7ALkojexG3Ujj8hio2Irffds26ng8=;
        b=l0Vn+PJfSyVTO2gHeH3x4fH2JjOQEcj0rIJbOythNeDP8VOHqOEMK1yeOgpSD/YgQa
         24ZpUrWjEzUM4pXro/9E4sUOxgdYWLDCMJNlprEjlntbOk8dUDiqJAImOM/WP7fr+J7h
         ygKzUkbYhDr2QsQzMuthz/735hJm9iFqHkQm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357376; x=1686949376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcYeLGK9CKTywc7ALkojexG3Ujj8hio2Irffds26ng8=;
        b=YO2DjL/X1ATlOWhI8em2n/vt8fM9YOm1LAmrjCpg7nL+mIwiSSz98hdDBOh6/NC485
         BcvfIwvc9rUtJVfrR60rb/YLZ/a9IyFJ5i++b60QLpYmNKvIIMAQkexwpZlptCzmt2bY
         HRMWyR1Vo5gcm3QN1Qiul2jheyEXe4MuhtqytSg3bs4Ee1YwVxehn4x5dXJyayamBgvN
         OKyYOZkHgk6IW9UYagi5ljwNUlPVtLpomvWQ7d4265I+stRRpeOFcUYuIimegqBbA4vP
         9WUFM9X0ZlEMrC/8YTT5uICfk33b+9/rTNlUCklb7W48uksh8m6mtAWbJMrHBhZ8sfgE
         kS+A==
X-Gm-Message-State: AC+VfDyIvkgSc+p3KMGC5RUGsPXv90KdGgmsn7pHft/l9NJI+UZJKevl
	ZocwotT1kmVZ0XohQl2ikXZsdSDPRw+kT+xWZ1ZpbQ==
X-Google-Smtp-Source: ACHHUZ4vFPBYoUxskd6+n2+JnBS0dUlSvPK2Mtatq/nB93/9CwNwWWAutpY/dJgCD8yIQwmHurziU/bYwTQXP8SuS7I=
X-Received: by 2002:a92:c24e:0:b0:331:948c:86f3 with SMTP id
 k14-20020a92c24e000000b00331948c86f3mr19472ilo.19.1684357375830; Wed, 17 May
 2023 14:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGsE6KS484iSLkKV8hx2nNThZGfaaz+u+R-A3X5nRev6Gg@mail.gmail.com>
 <ZGT6sTOtk+WY3aYt@bhelgaas>
In-Reply-To: <ZGT6sTOtk+WY3aYt@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Wed, 17 May 2023 14:02:43 -0700
Message-ID: <CANEJEGv8yxcYmrn4dsc0GCrcMGSFJNoJ=-VUvTjPLCVug+X29w@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 9:03=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Apr 07, 2023 at 04:46:03PM -0700, Grant Grundler wrote:
> > On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > > > On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas <helgaas@kern=
el.org>
> > > wrote:
> > > > > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > > > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > > > > >
> > > > > > There are many instances where correctable errors tend to inund=
ate
> > > > > > the message buffer. We observe such instances during thunderbol=
t PCIe
> > > > > > tunneling.
> > > > ...
> > >
> > > > > >               if (info->severity =3D=3D AER_CORRECTABLE)
> > > > > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, er=
rmsg,
> > > > > > -                             info->first_error =3D=3D i ? " (F=
irst)" :
> > > "");
> > > > > > +                     pci_info_ratelimited(dev, "   [%2d]
> > > %-22s%s\n", i, errmsg,
> > > > > > +                                          info->first_error =
=3D=3D i ?
> > > " (First)" : "");
> > > > >
> > > > > I don't think this is going to reliably work the way we want.  We=
 have
> > > > > a bunch of pci_info_ratelimited() calls, and each caller has its =
own
> > > > > ratelimit_state data.  Unless we call pci_info_ratelimited() exac=
tly
> > > > > the same number of times for each error, the ratelimit counters w=
ill
> > > > > get out of sync and we'll end up printing fragments from error A =
mixed
> > > > > with fragments from error B.
> > > >
> > > > Ok - what I'm reading between the lines here is the output should b=
e
> > > > emitted in one step, not multiple pci_info_ratelimited() calls. if =
the
> > > > code built an output string (using sprintnf()), and then called
> > > > pci_info_ratelimited() exactly once at the bottom, would that be
> > > > sufficient?
> > > >
> > > > > I think we need to explicitly manage the ratelimiting ourselves,
> > > > > similar to print_hmi_event_info() or print_extlog_rcd().  Then we=
 can
> > > > > have a *single* ratelimit_state, and we can check it once to dete=
rmine
> > > > > whether to log this correctable error.
> > > >
> > > > Is the rate limiting per call location or per device? From above, I
> > > > understood rate limiting is "per call location".  If the code only
> > > > has one call location, it should achieve the same goal, right?
> > >
> > > Rate-limiting is per call location, so yes, if we only have one call
> > > location, that would solve it.  It would also have the nice property
> > > that all the output would be atomic so it wouldn't get mixed with
> > > other stuff, and it might encourage us to be a little less wordy in
> > > the output.
> > >
> >
> > +1 to all of those reasons. Especially reducing the number of lines out=
put.
> >
> > I'm going to be out for the next week. If someone else (Rajat Kendalwal
> > maybe?) wants to rework this to use one call location it should be fair=
ly
> > straight forward. If not, I'll tackle this when I'm back (in 2 weeks
> > essentially).
>
> Ping?  Really hoping to merge this for v6.5.

Sorry - I forgot about this... I'll take a shot at it. Should have
something by this evening.

cheers,
grant

>
> Bjorn
