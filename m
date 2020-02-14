Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFAF15FA35
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 00:07:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K8Cm3kS6zDqlw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 10:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JMTUKbWT; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K89l61cJzDqfP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 10:05:25 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id 66so10717816otd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 15:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFbGjBAZ9jJ0epeJ8+efVvoWM9zaa3+GyCDFwE2/leM=;
 b=JMTUKbWTyneQpCu5P7I6UY4sjbtgcldSXd8L6n24Ux/t41POpIteMsP3aa4eebSYZl
 puBtNSopjm55AOT7X1FSnUU4whwN+YFgMC9PCjzgxdcA5tNBbmDW1XPp4uYbNM75J1Gl
 +6wP4N0b//tq9VMwWxGNNCKfxpvP9+eiqoIGuiMRRza2HJaZEeQ4isuHO7iYlwmw6zR8
 5NJfOBLW0bd+vnwxwOKAMtiZ0HDb91pCHTz9sqX+VJBKT0Q9aEnm1QgJy5aGqk71HIuF
 LJwai3h5GTbqhdXGkMACukn4Zknw283nV1VHgNb/33G68/BRUNMw2ertvirUBT8Kng3e
 li5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFbGjBAZ9jJ0epeJ8+efVvoWM9zaa3+GyCDFwE2/leM=;
 b=OmdkVDQWu7z7Df0XXu2dHmss1BbvOfqMzvlp1gJC6tlzkpTvmWS8RpS6E5mP+eoSCS
 1n0c9CdfGBYUMHyKrak1rqmhXQSiHOwrVTpTdNF9EqySt2Xo/ywFHAOwbuNx0PtKp2Pr
 bKEwE1MmVceyRHNNa/e/TYyGvPBviUznqy0JpOStqLIiM4/EAJNgdeYD/EjMXNMkoCYb
 jMz1NhtDi/I7PFkQ509vrqqUU6RfQjWwmQvPLpGGk5WmJS/SsYsKAYyndZ3Qp07nKH7g
 1I8vjeEWaAhK2zLozBkByP4mPlLgPDyyt4gNhQzbF8LgkxS5JNvsl8UHamavl20CuTdg
 WwFA==
X-Gm-Message-State: APjAAAUbaK61jjV/+myYNzD7f6/X5XCZ2EUybsvsaLwIAow33a4eO535
 u4skQrwWEokPGujfukTvq0AcvXPBX3OXzlo1BSMQ9Bms
X-Google-Smtp-Source: APXvYqyiTvPjMMOcsUvKfqz6iMQdR7SXgorFNb7wdpVGvSunO+Nl0vivaI37jSYP7UU4tRj9jLKbuUD42j/eENCmZ7c=
X-Received: by 2002:a9d:7852:: with SMTP id c18mr3938798otm.247.1581721522180; 
 Fri, 14 Feb 2020 15:05:22 -0800 (PST)
MIME-Version: 1.0
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490379.3343782.10305190793306743949.stgit@dwillia2-desk3.amr.corp.intel.com>
 <x498sl677cf.fsf@segfault.boston.devel.redhat.com>
 <CAPcyv4i8xNEsdX=8c2+ehf24U2AFcc-sKmAPS9UoVvm8z0aRng@mail.gmail.com>
 <x49k14odgwz.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49k14odgwz.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 14 Feb 2020 15:05:09 -0800
Message-ID: <CAPcyv4hc2ZOyymas1svXYQFa49tziC2ZkVLfgKVV64bu4gTTEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm/memremap_pages: Introduce
 memremap_compat_align()
To: Jeff Moyer <jmoyer@redhat.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 14, 2020 at 12:59 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Thu, Feb 13, 2020 at 8:58 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> >> I have just a couple of questions.
> >>
> >> First, can you please add a comment above the generic implementation of
> >> memremap_compat_align describing its purpose, and why a platform might
> >> want to override it?
> >
> > Sure, how about:
> >
> > /*
> >  * The memremap() and memremap_pages() interfaces are alternately used
> >  * to map persistent memory namespaces. These interfaces place different
> >  * constraints on the alignment and size of the mapping (namespace).
> >  * memremap() can map individual PAGE_SIZE pages. memremap_pages() can
> >  * only map subsections (2MB), and at least one architecture (PowerPC)
> >  * the minimum mapping granularity of memremap_pages() is 16MB.
> >  *
> >  * The role of memremap_compat_align() is to communicate the minimum
> >  * arch supported alignment of a namespace such that it can freely
> >  * switch modes without violating the arch constraint. Namely, do not
> >  * allow a namespace to be PAGE_SIZE aligned since that namespace may be
> >  * reconfigured into a mode that requires SUBSECTION_SIZE alignment.
> >  */
>
> Well, if we modify the x86 variant to be PAGE_SIZE, I think that text
> won't work.  How about:

...but I'm not looking to change it to PAGE_SIZE, I'm going to fix the
alignment check to skip if the namespace has "inner" alignment
padding, i.e. "start_pad" and/or "end_trunc" are non-zero.
