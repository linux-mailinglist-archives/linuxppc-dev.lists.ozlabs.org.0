Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851716DB760
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtZqs2MX4z3chb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LfFAt7rJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LfFAt7rJ;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZq259BRz3fTN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:49:50 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3e673b5f558so514221cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680911388; x=1683503388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjTxx7icMTYukspTJWOyXAdc8KUgw2cKmRcRpT5B70=;
        b=LfFAt7rJUt1pUj98t+F2Quk+iZHTggmA6ET02STj58xiL96wfom24Bhd5OmXVYsW9r
         i99ls8sk7qvxcW0e1zkLKqFhmDpkZ0BboRA2FbvRREmlEw1c72OMdwWyBYdPznan12x3
         evBfPx9CvCBr2kyG+W7G5UebTVPHerxyHia8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911388; x=1683503388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqjTxx7icMTYukspTJWOyXAdc8KUgw2cKmRcRpT5B70=;
        b=AdIdu2cw3Qt1CbgGut2tDp3O6jY8vFF43SdPtET4A1iAviiJ5u29ALNqfzO0WybeTR
         dyak+fsueFHpPFW7DJVvg+dhWOHgkErAD9eRFgEyPh4IzcnmeXMj+138zmW8DplGPCUZ
         /+lDmXuzX4z3HAXro6Cd0e102BESLlEKluT0lph5wGZ9Ht7W9UsTCz7Mm9FyhpfN7Pxg
         1BES+SBHZKcYtq4FMr9IT14rmNq+81niNR8EWAER57zNhJ7pOZKirsBbexXWKdsznU6P
         yD+fh4W63cfTiaUhq4ZGWXloRhU+I8u/CL8zbdFoJ7It3HSOJXuo+c7fVn7RG3awNw4e
         ygkw==
X-Gm-Message-State: AAQBX9foT9RHXWHxDmoKqUmyV1WFX5WtImR2+1wmwmUxR/+Gw8nLMgG5
	vhnqphQMANfG1eLvt1fY3yrXaeEEcLFazP2INFAyTg==
X-Google-Smtp-Source: AKy350YqUSXVlmbwDJr3UQsJTE8KS7rADBSmXy0bQ5nLTgrofx1yY7eU48cqTzdgtXifug4KW09JduqdhsqfhvTfN6I=
X-Received: by 2002:ac8:5f93:0:b0:3bf:d313:77dd with SMTP id
 j19-20020ac85f93000000b003bfd31377ddmr152060qta.14.1680911388085; Fri, 07 Apr
 2023 16:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas>
In-Reply-To: <20230407194645.GA3814486@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 7 Apr 2023 16:49:37 -0700
Message-ID: <CANEJEGu6YMfPPbWsRCZ4tsLAo9mKUbijnd1VEKvbsk4Xe4VXhg@mail.gmail.com>
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

[reposting in plain text mode]

On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > > >
> > > > There are many instances where correctable errors tend to inundate
> > > > the message buffer. We observe such instances during thunderbolt PC=
Ie
> > > > tunneling.
> > ...
>
> > > >               if (info->severity =3D=3D AER_CORRECTABLE)
> > > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg=
,
> > > > -                             info->first_error =3D=3D i ? " (First=
)" : "");
> > > > +                     pci_info_ratelimited(dev, "   [%2d] %-22s%s\n=
", i, errmsg,
> > > > +                                          info->first_error =3D=3D=
 i ? " (First)" : "");
> > >
> > > I don't think this is going to reliably work the way we want.  We hav=
e
> > > a bunch of pci_info_ratelimited() calls, and each caller has its own
> > > ratelimit_state data.  Unless we call pci_info_ratelimited() exactly
> > > the same number of times for each error, the ratelimit counters will
> > > get out of sync and we'll end up printing fragments from error A mixe=
d
> > > with fragments from error B.
> >
> > Ok - what I'm reading between the lines here is the output should be
> > emitted in one step, not multiple pci_info_ratelimited() calls. if the
> > code built an output string (using sprintnf()), and then called
> > pci_info_ratelimited() exactly once at the bottom, would that be
> > sufficient?
> >
> > > I think we need to explicitly manage the ratelimiting ourselves,
> > > similar to print_hmi_event_info() or print_extlog_rcd().  Then we can
> > > have a *single* ratelimit_state, and we can check it once to determin=
e
> > > whether to log this correctable error.
> >
> > Is the rate limiting per call location or per device? From above, I
> > understood rate limiting is "per call location".  If the code only
> > has one call location, it should achieve the same goal, right?
>
> Rate-limiting is per call location, so yes, if we only have one call
> location, that would solve it.  It would also have the nice property
> that all the output would be atomic so it wouldn't get mixed with
> other stuff, and it might encourage us to be a little less wordy in
> the output.

+1 to all of those reasons. Especially reducing the number of lines output.

I'm going to be out for the next week. If someone else (Rajat
Kendalwal maybe?) wants to rework this to use one call location it
should be fairly straight forward. If not, I'll tackle this when I'm
back (in 2 weeks essentially).

>
> But I don't think we need output in a single step; we just need a
> single instance of ratelimit_state (or one for CPER path and another
> for native AER path), and that can control all the output for a single
> error.  E.g., print_hmi_event_info() looks like this:
>
>   static void print_hmi_event_info(...)
>   {
>     static DEFINE_RATELIMIT_STATE(rs, ...);
>
>     if (__ratelimit(&rs)) {
>       printk("%s%s Hypervisor Maintenance interrupt ...");
>       printk("%s Error detail: %s\n", ...);
>       printk("%s      HMER: %016llx\n", ...);
>     }
>   }
>
> I think it's nice that the struct ratelimit_state is explicit and
> there's no danger of breaking it when adding another printk later.

True. But a single call to a "well documented" API is my preference
(assuming this is my choice).

> It *could* be per pci_dev, too, but I suspect it's not worth spending
> 40ish bytes per device for the ratelimit data.

Good - I don't think we need to make this per device - I had assumed
it was but also currently don't see a need for this.

cheers,
grant
