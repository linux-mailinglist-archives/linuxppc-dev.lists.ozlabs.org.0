Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668B57901
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 03:43:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z2j84MWvzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 11:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnhehEgr"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z2gY6yVWzDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 11:41:45 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id u13so1184181iop.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 18:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efMxhCaoMTlDW0kFfgCitjmRWOnfiX0MFxJxozGp1w4=;
 b=gnhehEgr/a8qHHOqmtiQ684TdnZXjAUclCf7RAgdB+KS+z2+VYC77Q8tuSrznqunex
 cgMYtH4I4yDJgiYqUthKgO0P3NWCgvXa6QQ3jwT+0JiH7oM6A4p/cc/mR8HifWdSw+qU
 enuGB7pEdujaseuq6yhDS4wUOoAC89lj7cY5ldqaBFeXbhcCiQNKpmBc388UMYc4hDMp
 F/SRFq8Gu05+jMAdH5pyMRW6CzBXwMKFGR4xDAnYZ+fJfzjMHtTRYGT68PRMWEbhzY6w
 H+ITzvoLvQts+mWWTkpggAMoFe5f1koW/HmUQxai8Rm8ayBRf9QX4rc10sWf6x3TvPf9
 ds8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efMxhCaoMTlDW0kFfgCitjmRWOnfiX0MFxJxozGp1w4=;
 b=mW+DaWhYXFMtmcFcwKQLPGnx7ZHBK76tZV9W0HAj8bhRYAwv68UfTEVzmvkIqTNAop
 aSuwiAJLop+MVOQl7Y7IugI683N36UGSqGa5zOxrfd4SKkc02n1el4lvE4NZuOadV89k
 lDfBPBV8xGrK1aMY/SNjfS7Yq+ZeRALXe1WuVsPg53gASlKWr8evrwfFAi7+d9ME7WZZ
 afkqyoqSkh/gl0PdT2vO3+Cu3aZ+Ggm83iUHXoVYCD1DRiCkCHpsCLoZid6N9y5BjHdz
 Nl7Mu8FK2/o12/tjskWNIC1ewk59tLvd4s58saemxLr/T2mp+Ad5WMCWYz+VidlKOuW5
 B00Q==
X-Gm-Message-State: APjAAAWPTpChQ7MrKzoVq6kk3nATr8iOPaTJDZMgJ0FJG/f++GmMB3Ol
 jhW6T1/DFa8TX5nEqOL9KBPbCWjEwEX0+PtziBs=
X-Google-Smtp-Source: APXvYqzX2htu/NlbhVuu8hoCu9THqieC2DDvz+sGX1xaX14s5HabTk/Q+KrjpCk4cj31dTnjQGrs/FRw2qrOFKYSymc=
X-Received: by 2002:a5d:9047:: with SMTP id v7mr1428230ioq.18.1561599703556;
 Wed, 26 Jun 2019 18:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-4-vaibhav@linux.ibm.com>
 <87k1d8z3jw.fsf@linux.ibm.com>
In-Reply-To: <87k1d8z3jw.fsf@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 27 Jun 2019 11:41:32 +1000
Message-ID: <CAOSf1CEPZcq-hkJCxRnb7nZ8Smib6uDm6J_Lp6ec5sP7+DQDEQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 2:58 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> > *snip*
> > +     /* If phyp says drc memory still bound then force unbound and retry */
> > +     if (rc == -EBUSY) {
> > +             dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
> > +             drc_pmem_unbind(p);
> This should only be caused by kexec right?

We should only ever hit this path if there's an unclean shutdown, so
kdump or fadump. For a normal kexec the previous kernel should have
torn down the binding for us.

> And considering kernel nor
> hypervisor won't change device binding details, can you check switching
> this to H_SCM_QUERY_BLOCK_MEM_BINDING?

I thought about using the QUERY_BLOCK_MEM_BINDING call, but I'm not
sure it's a good idea. It bakes in assumptions about what the
*previous* kernel did with the SCM volume that might not be valid. A
panic while unbinding a region would result in a partially-bound
region which might break the query call. Also, it's possible that we
might have SCM drivers in the future that do something other than just
binding the volume in one contiguous chunk. UNBIND_ALL is robust
against all of these and robustness is what you want out of an error
handling mechanism.

> Will that result in faster boot?

As I said in the comments on v1, do we have any actual numbers on how
long the bind step takes? From memory, you could bind ~32GB in a
single bind h-call before phyp would hit it's time limit of 250us and
return a continue token. Assuming that holds we'll be saving a few
dozen milliseconds at best.

> > +             rc = drc_pmem_bind(p);
> > +     }
> > +
> >       if (rc)
> >               goto err;
> >
>
> I am also not sure about the module reference count here. Should we
> increment the module reference count after a bind so that we can track
> failures in ubind and fail the module unload?

I don't really get what you're concerned about here. The error
handling path calls drc_pmem_unbind() so if there's a bind error we
should never leave probe with memory still bound.

> -aneesh
>
