Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FED6A4C73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 21:43:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQXXN1NDVz3cHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 07:43:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.44; helo=mail-pj1-f44.google.com; envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQXWn3fcZz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 07:43:16 +1100 (AEDT)
Received: by mail-pj1-f44.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6899696pjg.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 12:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677530592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC/aE2GBFP7wp6rf8fEfdlxGVt1o08UMnIKX0eniCVs=;
        b=BzjzIU3vSFc83tR9Uz8RVJLnazzvjWw/OJxLkceSQNgjEBJqTz2/oaGvo5nvrTUg74
         4PkDeUr72avfzmCUYiVuwcHXhWJ6Z7GDh+kBD5VEY/qf9uwSfE1/6ePyYYtEKTh+fdz5
         3oIJjbtoMEZPAUvlmz1QgtKZWGJsQrb9jV7Y3+lOSQfBWWsVdw/Db7TFr/0AKQ+lsFyh
         6m4LgnHtkbq2Mp8SktirZi3HUIHIjsHFAuyNhnMIke6eMk/UsNSALYgUoRZipf1+rW4D
         RBMFeFQUnOYiyZamyTKd66LSVXWo/4Ty7GdtkV0QTT6YJlrFsFXvO0fO+UIT5VPcyhKX
         k6uQ==
X-Gm-Message-State: AO0yUKW9uGH/sUFiOYwSJl2x8JxKHS5qEBeO4LpIcAOX7Vs86Ts44Fnz
	rkmDFUC3LDgVS6AZO+LpcUYbnqxks/F1bg==
X-Google-Smtp-Source: AK7set/nzPBzwfDY8SrBPkd4oyBMkjFNQ7tL3hHS79vm6Tf8OWvtHdY0LTn0xhObZKcSihvEkLw5XQ==
X-Received: by 2002:a17:903:2447:b0:19c:c9da:a62e with SMTP id l7-20020a170903244700b0019cc9daa62emr187912pls.54.1677530592016;
        Mon, 27 Feb 2023 12:43:12 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b0019602274208sm5006098plb.186.2023.02.27.12.43.11
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:43:11 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so7497606pjq.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 12:43:11 -0800 (PST)
X-Received: by 2002:a17:903:2644:b0:19a:fdca:e3f1 with SMTP id
 je4-20020a170903264400b0019afdcae3f1mr102810plb.3.1677530590900; Mon, 27 Feb
 2023 12:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com> <381dca28-726d-4118-81e1-9a9da4e87425@app.fastmail.com>
In-Reply-To: <381dca28-726d-4118-81e1-9a9da4e87425@app.fastmail.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 27 Feb 2023 14:42:58 -0600
X-Gmail-Original-Message-ID: <CADRPPNRvDMoN3c5XMAuvGFqZikcF9TktPWv9Nz7XjNG97U=8xQ@mail.gmail.com>
Message-ID: <CADRPPNRvDMoN3c5XMAuvGFqZikcF9TktPWv9Nz7XjNG97U=8xQ@mail.gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 25, 2023 at 4:51=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Sat, Feb 25, 2023, at 17:50, Paul Gortmaker wrote:
> > [RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On
> > 24/02/2023 (Fri 21:16) Leo Li wrote:
> >
> > Thanks for confirming with your marketing team that they "do not
> > recommend any new design with these SoCs" -- it also confirms the
> > information I read on the web pages for the platforms.
> >
> > As those of us immersed in this world all know from the 101 basics of
> > Product Life Cycle lessons, it doesn't matter if it is a phone or a
> > set-top-box/PVR or whatever else kind of non-PC consumer device --
> > kernel uprevs never happen in that product space.
> >
> > So with the best interests of the mainline kernel in mind, I think we
> > are good to proceed with this for summer 2023.  And of course as I've
> > said many times before - the kernel is in git, so really you can't
> > delete anything anyway - it remains in history forever.
>
> Thanks for working on this, this is a good step towards removing
> the known unused code. One aspect I'd add from doing similar cleanups
> on arm32 is that I would prioritize removing evaluation platforms
> for SoCs that have no other supported boards, and then
> garbage-collecting the device drivers that become unused.
>
> I'm not sure where the RDB boards fit in that, in particular if
> an unmodified kernel would work on a machine that is derived from
> the reference platform, or if it really only works on the machine
> itself. On most arm platforms, we moved to having only per-soc
> "compatible" strings, but on Freescale ppc32 it appears that
> the kernel always matches a board specific string and requires
> patches in order to support anything else.

The RDB boards normally don't include the complex configuration
mechanisms as used on the MDS platforms to support different
configurations at the same time.  They were designed to mimic a real
product and should be much more likely to work unmodified or with some
minor tweaks.

Regards,
Leo
