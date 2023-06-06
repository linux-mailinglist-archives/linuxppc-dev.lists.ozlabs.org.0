Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D57235E1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 05:46:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZxGy29bJz3f6N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 13:46:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=frxgAGfr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=frxgAGfr;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZxG82gnQz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:45:51 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f7024e66adso21765e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686023147; x=1688615147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MODHFUV4L/O4bsTMBgQrkhxsTETNlqjXeaBSjrqN1Uk=;
        b=frxgAGfrDnlTrD42lcQ7EhX80pQETt7hpvj8GDOShd8Qm3LsLOQhXG9GktUcX8+aAN
         FESb+VQ/W9n8KrHbpJ/yssGP8pyUvUeQsV7z7n5BZPAI6DaZ3XBaeGnKrlvJjMPzxL08
         ixdCgE2ARx1DbXxdv89dCRKsmHzSiD8mlk3F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023147; x=1688615147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MODHFUV4L/O4bsTMBgQrkhxsTETNlqjXeaBSjrqN1Uk=;
        b=YYhrOvl7g+/rAHh03dz2TepvvFyamD68Mbnv5rQhYcGPHnj4kSV6nA+fgCUfJRqVqb
         Lxp6Cb/fl0cdbVNI8NgNrQk7IYd3kTBWHVBXqbh8l39GFjqbAl8xQDVv5TW5EjtJJiEl
         d6n26LNHl7hIjhhOd/3FQ2FSdE5CrhdA4/PX9ZIywgRvZCj4BdELAtalS3+PiZoCUtBC
         PAEKVPcnC5vBMVp+PzDgUV8Xt/K2473eQaqxKqmFbqnMzvOoTQrwZZS362DcAzsZTKHD
         Q8Rie8omuLxLi7ZS+ZOWH7xvbvYUyvsMHMzELCQfOlNTSi0t3BKz+y0ep4sKLjNpWRDj
         KfXQ==
X-Gm-Message-State: AC+VfDzHx5IOIj7A1wM18sUVbS5I1Mc9leGlhzGwdOH5up7SKHbplIDt
	3pulo4p3EBgtShqT4HQ3FShE/zNQ5OoSP24Jag6Xog==
X-Google-Smtp-Source: ACHHUZ6cKWdn8RJJ4txWpjrym0MbSBGurkQHLRhoVCkS31iSwlAMf58ngZXL41h0idPTPoMMTPAScMfKOb/zwtTzWTg=
X-Received: by 2002:a05:600c:3b90:b0:3f7:ba55:d038 with SMTP id
 n16-20020a05600c3b9000b003f7ba55d038mr115349wms.6.1686023147021; Mon, 05 Jun
 2023 20:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas> <CANEJEGscz3F-6cZcp7dBVekpxHMNXZWgUW2ic3xd6hm3xWH6ZQ@mail.gmail.com>
In-Reply-To: <CANEJEGscz3F-6cZcp7dBVekpxHMNXZWgUW2ic3xd6hm3xWH6ZQ@mail.gmail.com>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 5 Jun 2023 20:45:34 -0700
Message-ID: <CANEJEGsP2uV2SnHgs6h4Z9V3Fk9jKK4x2PL8g4a33kqvr0WDEg@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Grant Grundler <grundler@chromium.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[plain text only this time...]

On Wed, May 17, 2023 at 11:11=E2=80=AFPM Grant Grundler <grundler@chromium.=
org> wrote:
>
> On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> ...
> > But I don't think we need output in a single step; we just need a
> > single instance of ratelimit_state (or one for CPER path and another
> > for native AER path), and that can control all the output for a single
> > error.  E.g., print_hmi_event_info() looks like this:
> >
> >   static void print_hmi_event_info(...)
> >   {
> >     static DEFINE_RATELIMIT_STATE(rs, ...);
> >
> >     if (__ratelimit(&rs)) {
> >       printk("%s%s Hypervisor Maintenance interrupt ...");
> >       printk("%s Error detail: %s\n", ...);
> >       printk("%s      HMER: %016llx\n", ...);
> >     }
> >   }
> >
> > I think it's nice that the struct ratelimit_state is explicit and
> > there's no danger of breaking it when adding another printk later.
>
> Since the output is spread across at least two functions, I think your
> proposal is a better solution.
>
> I'm not happy with the patch series I sent in my previous reply as an
> attachment. It's only marginally better than the original code.

Despite not being happy about it, after a week of vacation I now think
it would be better to include them as is since they solve the
immediate problems and then solve the above two issues in additional
patches. The two changes I have prepared so far correctly fix the
original issues they intended to fix and don't affect the new issues
we've found.

I'll post a V3 of this series tonight after making sure it at least
compiles and "looks right".

cheers,
grant

>
> I need another day or two to see if I can implement your proposal correct=
ly.
>
> cheers,
> grant
