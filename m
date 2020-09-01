Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B6258C5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 12:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgjT53CS8zDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 20:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZDL+Sj5o; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgjR93Wc6zDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 20:07:01 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id g10so651107otq.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pDrlWYFFkJJmssRq429+R+iuI/x8+DPm+PEwzlRDqBQ=;
 b=ZDL+Sj5oxpSQaoR6SHTUZZvCQ7FGrawiRYTcPP1ISEjV8Nh0SjcZHoAjzrG1DsVkjY
 T5Tu+mYaFHH2GFeUbajP6d4BqB+fIIQZu6bJfRL5EfGJsks7NzlgkMBHX1Jq+Jf3+Sge
 +5AZ8xmnLs45iWiRvRTdu4ePGcd/03w44lK3fLLdI+kcinJIScOq0oXTEqxanPoEML0i
 qi6PD9aKlthYNS8YFTglNlsu7ouvD7XOaP/sbT1RgMViL5oQGjof4DM3LjtqV3/TEh57
 3P9WZHWSk9t+Lk8irPJb/fcHeoVTD0vjwJRL6pXoBrl2pge0s6wRSamce0MqUG9W/k0i
 A5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDrlWYFFkJJmssRq429+R+iuI/x8+DPm+PEwzlRDqBQ=;
 b=NfbTKbaFw9jidvhgh76073vtRxdxjExkuHxRoFSDkeCKP/QFGsCUkqPd0GfrIbVvC/
 gZZK/eAm1qdCzvKV5sk5PHlEQDgOT62qdkWwzVu+5s8KTEAj0pGpXMdgQcJx52mzSLF5
 nGILQqOKuRicobfiCGwIxXJE6Kc7/r2bDI9jhZB01ZqXPzNXbqCr87YR5NHh+JAnF/yc
 B28NrFGduuYmbwSRpGqwhO52NY0MJ2pScuXUgJpxBrmM3q1oYxtdTf5s117YM2SZ5eNR
 CQAlhg+nNkJZjkYLxLBG/QGoH1DbFTvMkBJt+s96BeYJRhjh2YhCOF1QSkw1NOB3KLHR
 foFQ==
X-Gm-Message-State: AOAM532bn/4tVN6LPF3N1vJ4eWmk28EhUhfCiZR8QD1UKJIuNuwZQaLN
 HaXWHeZoyznlBv5NKReVK3JkD4+d5Km116TTOP3WR3z3DRg=
X-Google-Smtp-Source: ABdhPJx4lXxBvlL1JVdxVRRP212exraJg+7ZOk+1qs7Vpy3WfCLZR53D+a2GsBQpTXygcuosjRHnzjW/vlzvjKLf66U=
X-Received: by 2002:a05:6830:2246:: with SMTP id
 t6mr832583otd.264.1598954817468; 
 Tue, 01 Sep 2020 03:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
 <1597675318.4475.11.camel@linux.ibm.com> <202008171227.D3A4F454D8@keescook>
 <1597694252.22390.12.camel@linux.ibm.com>
In-Reply-To: <1597694252.22390.12.camel@linux.ibm.com>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 1 Sep 2020 15:36:46 +0530
Message-ID: <CAOMdWSKmNVQTpJtdEMNHc5SS75WNS7F0duzQi14kg62R4Un8zA@mail.gmail.com>
Subject: Re: [PATCH 0/8] scsi: convert tasklets to use new tasklet_setup()
To: jejb@linux.ibm.com
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
Cc: Kees Cook <keescook@chromium.org>, martin.petersen@oracle.com,
 shivasharan.srikanteshwara@broadcom.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 Allen Pais <allen.cryptic@gmail.com>, target-devel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > > >
> > > > Commit 12cc923f1ccc ("tasklet: Introduce new initialization
> > > > API")' introduced a new tasklet initialization API. This series
> > > > converts all the scsi drivers to use the new tasklet_setup() API
> > >
> > > I've got to say I agree with Jens, this was a silly obfuscation:
> > >
> > > +#define from_tasklet(var, callback_tasklet, tasklet_fieldname) \
> > > +       container_of(callback_tasklet, typeof(*var),
> > > tasklet_fieldname)
> > >
> > > Just use container_of directly since we all understand what it
> > > does.
> >
> > But then the lines get really long, wrapped, etc.
>
> I really don't think that's a problem but if you want to add a new
> generic container_of that does typeof instead of insisting on the type,
> I'd be sort of OK with that ... provided you don't gratuitously alter
> the argument order.
>
> The thing I object to is that this encourages everyone to roll their
> own unnecessary container_of type macros in spite of the fact that it's
> function is wholly generic.  It's fine if you're eliminating one of the
> arguments, or actually making the macro specific to the type, but in
> this case you're not, you're making a completely generic macro where
> the name is the only thing that's specific to this case.
>
> >  This is what the timer_struct conversion did too (added a
> > container_of wrapper), so I think it makes sense here too.
>
> I didn't see that one to object to it ...

Since we could not get the generic API accepted, can I send out V2
which would use container_of()?

Thanks,

-- 
       - Allen
