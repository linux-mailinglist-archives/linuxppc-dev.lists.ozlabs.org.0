Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7528CC1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 13:01:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9Xg86C8bzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 22:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WVOC2aTp; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9XdJ0gPNzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 22:00:19 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id a72so9902210wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9WA80PNkrI5C0OQNWClQ/raYkEl8VgDyVTNL1YpNDBQ=;
 b=WVOC2aTpPMXchRQn3hfbZminS4eshLiFulE0QKi7EhDNBaEJkX+sKXPuhyKYHL5elw
 9xDVhp9goIz4QeQm/DU7mWbkwLD99EQdpdO17AhjEw2FGJFQ7+HudYN2goj7L7PDWqNK
 DrFAj3g9FgdvxqnncZQhYTUIdq0YMfnmedSYCKyvZqaYNEE46JKiAIq/bsUYvHoe71xK
 RbWrf7ZwUWhZe3mqD0eYeM6ZCmpqfmGWg9oCQ2cmp0DCEKt2Ny2JKldng4yOSu+hdFuE
 u2+45lmoGfn5WES58TOmR/71j80KhwPvECg54YrSkAzQ+7lk9xfbAqgAshx+qHuiqE4/
 fSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WA80PNkrI5C0OQNWClQ/raYkEl8VgDyVTNL1YpNDBQ=;
 b=C9GGcxAXT53/7V95/HjRaNRf0ijq1WwEzgOsLRcaci12u0/oBbIUi054pDviWd7TfP
 D0G6pjnq2NJahG/VPGPhTL1uvb4X0bgmPkp/ruOiAOlKABL+WPnh2BvLUsCPA+aD/0PA
 QgYrN8BN+uxXbuZQuFbFKiEQiXgRLPSYvMlVUWkc+awVa5vKdEyp7X0C6UwWUyTncTn1
 15j2JNHHQI+LdBMv7/NBqImSenHD57gJjKz7KgYPKOWVDZrG4EoqVHSZrGiyv0gzD2S3
 PbhCGdaIKInEmaFJJqxdKkzspayaBDOPlh8eWiCF1BTSAL11SjvXUoAXL/TyIZC6CUta
 +OdA==
X-Gm-Message-State: AOAM531qIxNQIAuG+oZQ6VubiVMVb9HRCdk/+MXnzsaFA8zfr+d7HvbV
 3Qj7VkgQncxbLK8fh4wTOtzBS1xgUT1hHf2XKds=
X-Google-Smtp-Source: ABdhPJz2Emc612AGRQCJLTyQrTiQtni6Jj8EdvwE6fdWKKt9ZMRSVNmj7ycQo+5/Z3iP7aLNrwJCaI38aCViU8RMat4=
X-Received: by 2002:a7b:c317:: with SMTP id k23mr14424626wmj.44.1602586815306; 
 Tue, 13 Oct 2020 04:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
 <20201012190037.GB17643@Asurada-Nvidia>
 <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
 <CAA+D8AOCR+Hvq9K=LjbaPW0jJB+00nFORahErWyJJJr0LVUq4g@mail.gmail.com>
In-Reply-To: <CAA+D8AOCR+Hvq9K=LjbaPW0jJB+00nFORahErWyJJJr0LVUq4g@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Oct 2020 14:00:03 +0300
Message-ID: <CAEnQRZBbTBtJDLy9XNAFHa0hcuoU3c66kQVKsQR7MTo40NJF7A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 1:49 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 6:42 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 12:29 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > Hi Shengjiu,
> > >
> > > On Mon, Oct 12, 2020 at 04:49:42PM +0800, Shengjiu Wang wrote:
> > > > Add 88200Hz and 176400Hz sample rates support for TX.
> > > > Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> > >
> > > Probably should put your own Signed-off at the bottom?
> >
> > Hi Shengjiu,
> >
> > Also please keep the original author of the patch. You can change that
> > using git commit --amend --author="Viorel Suman <viorel.suman@nxp.com>".
>
> Actually I combined my commit with viorel suman's commit to one commit,
> not only viorel suman's.

I see. Ok then :)

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
