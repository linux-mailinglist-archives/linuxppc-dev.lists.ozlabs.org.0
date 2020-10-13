Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781128CBFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 12:51:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9XQs48LHzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 21:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NC8/NuxJ; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9XP13tXRzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 21:49:39 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id c2so20300344qkf.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5yIOA7zSjyrX4Zs7s/5Bx6EkRK+TbV8s3nkbgBG6Fvo=;
 b=NC8/NuxJy67mC+3rEmmrb8EZ/mvlbwIQkiCNQgPnpZRn3raZq6Vn6xfJ+ckHWgn1M1
 QI8VJzOvs9lTbpT6j5KdNWBEbVGuLFGubJYqjc9a77hu+nchRW9qOFgfTH6GLeGEZQub
 adBGZbZf1HGEhPjW2McyQf6cz338U3/ge27uacoLNG0871VXKO0yFRTxLA4N9wrDFJvI
 4dDThvH6XY+tbKFprSaWxtwBJDLQ9Wf6+x0sP8afGuaF36Y9UK7rYyfUVhYpUXDPPUs9
 KIEbyWRJ3SAOYa+l4d1ct5tDV1+sbI8MzQJ4DSEuZddvV1Sbs1f0DAQGRc+89E3kkpqL
 K1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yIOA7zSjyrX4Zs7s/5Bx6EkRK+TbV8s3nkbgBG6Fvo=;
 b=qHl+1NODEkpJ/p6rY+6SFyo1+jCks1ZXkfhvl/94dpLYgVetYOOOcd3O5T8BZ3kMZ9
 GAoXgDoppNvtgaJ0zGD8BtVY6AAVGgyYtnogVNEZ6AN7VOcn34rLMeya+8d1T+Y+a7I6
 T3S1CRmsZ4OlI75KP/JhB7adBKYqJ77N8pB5WIB3wlFQUoAJsHsgKR63cUhBRhmC1IKN
 7C504eVhNV6NOBs/4HkEvSwIrKU4kCAdgbZsEHwSmwmhmeypIsB1jV9dw7YDTch2AoPt
 wsjOk/cYv8cAp1janYC1RwvwQ1pGv2eXUjdbnGwoGGTPaInoLAIFQj483R1ZHcGAB715
 6N2A==
X-Gm-Message-State: AOAM5325f4ircoloWcf2Jr9HrFo4ZwYp8G012IJZBFmvyOYi8CljVH9X
 gQkVijiiLVfnHOEpGLAGvfn1xZxnW8s463f2lVo=
X-Google-Smtp-Source: ABdhPJwPArjX1/GNiWi7DgVkMB7AMSGfJphdxv8GAO9L+oqwA47B1TRWy3HHHsK69qtyzYJr7RiSbchJ1miUu/bHKfg=
X-Received: by 2002:a05:620a:657:: with SMTP id
 a23mr13835127qka.121.1602586176472; 
 Tue, 13 Oct 2020 03:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
 <20201012190037.GB17643@Asurada-Nvidia>
 <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
In-Reply-To: <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 13 Oct 2020 18:49:25 +0800
Message-ID: <CAA+D8AOCR+Hvq9K=LjbaPW0jJB+00nFORahErWyJJJr0LVUq4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
To: Daniel Baluta <daniel.baluta@gmail.com>
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

On Tue, Oct 13, 2020 at 6:42 PM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 12:29 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Hi Shengjiu,
> >
> > On Mon, Oct 12, 2020 at 04:49:42PM +0800, Shengjiu Wang wrote:
> > > Add 88200Hz and 176400Hz sample rates support for TX.
> > > Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> >
> > Probably should put your own Signed-off at the bottom?
>
> Hi Shengjiu,
>
> Also please keep the original author of the patch. You can change that
> using git commit --amend --author="Viorel Suman <viorel.suman@nxp.com>".

Actually I combined my commit with viorel suman's commit to one commit,
not only viorel suman's.


>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
