Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AE23BB53
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 15:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLbZB4nznzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 23:43:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QIG11b15; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLbSS6WdWzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 23:38:48 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id v6so26943670iow.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8pQogsmCIAZvVimH94LRvFqNAeOlNz9O81dYU3u96NY=;
 b=QIG11b15hT9CJ9l2UACKUQFVysM+7ajdoARviWitGZs/3vlRCJIy8hXe+uNYYR6iZC
 tcyClzn4AfK3V7vdQIwOI69/YMZ8lJAlM6JlKZ3++0jYgPr0rlBN/kSlJin98ZOzxnFp
 yw1LdMu7P6cel84RDYh6KxHku+9xuNdpsZuggxcFngPoYd17+XIg7KjaQj14G0gJQElv
 zjuJLru9WtFSJ9jyhzsp4+ovfM3Q+GUa5WMsdjTdIkuxVIu4HaVMDAMljwnlfTjlhIrB
 vx4XilsveOGvcaS7K6HmEWAu0kR6jkWtdvIwjjhLB2G6QdmbLvN4lSJoQNkHFc2tsZBI
 9lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8pQogsmCIAZvVimH94LRvFqNAeOlNz9O81dYU3u96NY=;
 b=rx/qdPTbVnZZOSuKNgO2rm0E8f4lEp1dNsnbD8tu9lvJJ+hPSTIzxYb+FSf6tq11uP
 lxJBowMyrUvCA2AOJ3aB6bQ+Nq5ePLHw6JQmZe3fHIdHhi0PtXrUcRJh/sIZdEXdy61E
 QkJjCzhCMxF//OV9tnAVBR3OzDOk2SOqZqQUyFu2524Dk09fzZpk/umrgNtp4XwzCDED
 RSLqApRkryf0xJ7JAuDfCsfa8loOs/9E0QgtsEyWWY0I3t1jPJBq0Rpoqw0JXof4JNOG
 Kt68c9Jm0deuN7cBdhz18odaSvISF2odxD8JD9+G9y7rlCG5YSEtyPtKDIPYpOsvc5/A
 trtA==
X-Gm-Message-State: AOAM531J0LUpoIK1pWW+QYzUxCZnxBbxqQQHB/7FN2mmvuY9TfDN/Tv2
 MJe7S0TsrV4iEQbwVrIR7MVF7t2NI5SO5ln7mg==
X-Google-Smtp-Source: ABdhPJw2qj1N6GxQcmnazrtjG23bmTDyoTY8gfwWvUH4mZpwALFo8k/u9E+pWhrHsu6SLZHnJpOJh/YvaEuQesr/pNw=
X-Received: by 2002:a05:6638:bd1:: with SMTP id
 g17mr5890178jad.132.1596548324253; 
 Tue, 04 Aug 2020 06:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
 <1596116005-27511-2-git-send-email-kernelfans@gmail.com>
 <951e4406-1172-09a3-a8db-6f0a92aea2ed@linux.ibm.com>
In-Reply-To: <951e4406-1172-09a3-a8db-6f0a92aea2ed@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Tue, 4 Aug 2020 21:38:33 +0800
Message-ID: <CAFgQCTs-A9=AEbU=x9OA6UyBd0wf20arLVtWKshu3oTo=BjGww@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: Laurent Dufour <ldufour@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 12:29 AM Laurent Dufour <ldufour@linux.ibm.com> wrote:
>
[...]
> >       lmb_set_nid(lmb);
> >       lmb->flags |= DRCONF_MEM_ASSIGNED;
> > +     if (dt_update) {
> > +             ret = drmem_update_dt();
> > +             if (ret)
> > +                     pr_warn("%s fail to update dt, but continue\n", __func__);
> > +     }
> >
> >       block_sz = memory_block_size_bytes();
>
> In the case the call to __add_memory is failing, the flag DRCONF_MEM_ASSIGNED
> should be cleared as I mentioned in your previous patch. In addition to this,
Yes.
> the DT should be updated, or the caller should manage that but that will be hard
> since it doesn't know where the error happened in this function.
Yeah, it is hard to manage it by caller, so just updating dt  is a
easier method.
>
> >
> > @@ -625,7 +653,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >               invalidate_lmb_associativity_index(lmb);
> >               lmb_clear_nid(lmb);
> >               lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> > -
> > +             if (dt_update) {
> > +                     ret = drmem_update_dt();
> > +                     if (ret)
> > +                             pr_warn("%s fail to update dt during rollback, but continue\n", __func__);
> > +             }
> >               __remove_memory(nid, base_addr, block_sz);
> >       }
> >
> > @@ -638,6 +670,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
> >       int lmbs_available = 0;
> >       int lmbs_added = 0;
> >       int rc;
> > +     bool dt_update = false;
> >
> >       pr_info("Attempting to hot-add %d LMB(s)\n", lmbs_to_add);
> >
> > @@ -664,7 +697,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
> >               if (rc)
> >                       continue;
> >
> > -             rc = dlpar_add_lmb(lmb);
> > +             rc = dlpar_add_lmb(lmb, dt_update);
> >               if (rc) {
> >                       dlpar_release_drc(lmb->drc_index);
> >                       continue;
> > @@ -678,16 +711,23 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
> >               lmbs_added++;
> >               if (lmbs_added == lmbs_to_add)
> >                       break;
> > +             else if (lmbs_added == lmbs_to_add - 1)
> > +                     dt_update = true;
>
> In the case the number of LMB to add is 1, dt_update is never set to true, and
> the device tree is never updated. You need to set dt_update to true earlier in
> the loop block.
Oh, I will fix it in V5
>
> >       }
> >
> >       if (lmbs_added != lmbs_to_add) {
> > +             bool rollback_dt_update = false;
> > +
> >               pr_err("Memory hot-add failed, removing any added LMBs\n");
> >
> >               for_each_drmem_lmb(lmb) {
> >                       if (!drmem_lmb_reserved(lmb))
> >                               continue;
> >
> > -                     rc = dlpar_remove_lmb(lmb);
> > +                     if (--lmbs_added == 0 && dt_update)
> > +                             rollback_dt_update = true;
>
> That test may have to be review to deal with error during the last LMB addition,
> the DT may have been updated before __add_memory() is failing in
> dlpar_add_lmb(). In that case, lmbs_added == 0 and that branch is not covered.
> That's not an issue if dlpar_add_lmb() is handling that case (see my comment above).
I will fix it in next version.

Thanks for your review.

Regards,
Pingfan
