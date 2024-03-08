Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97704875E0D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:51:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=heDxVs4J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=heDxVs4J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrcJm2zZlz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 17:51:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=heDxVs4J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=heDxVs4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrcJ129y6z3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 17:50:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709880635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epRg3dGewUcblPePlS+KzZdY/GgoToAmRabId8Bpp4I=;
	b=heDxVs4JuJWDoEnTziGBu+wOhirVIly0obbjgcHGDLl/w0Ujbc/n9faMMLhkFuGUgGitDi
	ckYwO4zwgUjdIoTTDaLCNHl/u6NC7d0ptkUi4Icx1EuVocmpWuCYsdZru5rTEqKhMRYDTD
	zZ9VNu4nQBrHTnuq+GvA3bD9uZOLatA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709880635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epRg3dGewUcblPePlS+KzZdY/GgoToAmRabId8Bpp4I=;
	b=heDxVs4JuJWDoEnTziGBu+wOhirVIly0obbjgcHGDLl/w0Ujbc/n9faMMLhkFuGUgGitDi
	ckYwO4zwgUjdIoTTDaLCNHl/u6NC7d0ptkUi4Icx1EuVocmpWuCYsdZru5rTEqKhMRYDTD
	zZ9VNu4nQBrHTnuq+GvA3bD9uZOLatA=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-lZhfF6BbM6SYIQQm6ega3w-1; Fri, 08 Mar 2024 01:50:31 -0500
X-MC-Unique: lZhfF6BbM6SYIQQm6ega3w-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-21e4604101bso607478fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 22:50:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709880631; x=1710485431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epRg3dGewUcblPePlS+KzZdY/GgoToAmRabId8Bpp4I=;
        b=gaMIfuAceQzFCJb/Mk60KYXrecvF6/gW4elPwZNCZ6qwvGmivkJ876kBvgfFsVlYoY
         LD21D4TxdEgTZ000hxjq6uGm3BgQa+mpkpnJo4IbD78QX21go9GiOJG8XtZZyvDb1tsj
         aSPBQXjN25UOpVT6S0AkrGE9bBbpJqh3JzTY2u0pQP9LrZDS2Z6Gn8z0rParjZzsWxbA
         D6/mL9pU6sAYHr+PmYAZhnllVXvLu+JVYeOaFt2BVZ6aT6P0kYEu9XAxVxsUAc2aJTQQ
         a8zWIFz/ddonIWkTHatI4iZAblfzJ20WpFsOdypr+uZ6pXHJ8Kl3C0fMSP+br8/YXhnB
         A9zg==
X-Forwarded-Encrypted: i=1; AJvYcCVLuWMb+PF64peVgvWipPlb7A/+d+HOVs8c+rYKbooUShF4/hGKfuQV7K0yOLpepa6MH08uswdy62xur0KLvgA1fET+WTTI6Q+CnL4y0A==
X-Gm-Message-State: AOJu0YwpYUszqp7bYOuRBnXhn54S7w6N6lDnBT6gZd5qf9FrieZk4wpW
	ctIuQHVUu2e/zzc9GXWekT+PeI2LZDO6i8HdS6OmQwcLwxb0xqcmDuSb8QBQSn+Bl47jCKK5DqU
	T+sste1zQC453zKekYrZyDGgVFu/2+EtdLQ/wAFb9qL/2hZ3Yq3M1MHngmKPEPm0=
X-Received: by 2002:a05:6870:911f:b0:221:9798:22ce with SMTP id o31-20020a056870911f00b00221979822cemr1235674oae.5.1709880630969;
        Thu, 07 Mar 2024 22:50:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5WJ4Hs7BOa4+cQmkVKBMn/KDqWDXIuEQmCh9SbFC/cz4o3SLGxNN1BrH2AJEolH8ck0I8Eg==
X-Received: by 2002:a05:6870:911f:b0:221:9798:22ce with SMTP id o31-20020a056870911f00b00221979822cemr1235655oae.5.1709880630429;
        Thu, 07 Mar 2024 22:50:30 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id r37-20020a632065000000b005dcc075d5edsm13621982pgm.60.2024.03.07.22.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 22:50:30 -0800 (PST)
Date: Fri, 8 Mar 2024 14:50:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH RFC 01/13] mm/hmm: Process pud swap entry without
 pud_huge()
Message-ID: <Zeq1LNValPosuWgw@x1n>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-2-peterx@redhat.com>
 <20240307181233.GD9179@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240307181233.GD9179@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linux-arm-kernel@lists.infradead.org, Alistair Popple <apopple@nvidia.com>, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 07, 2024 at 02:12:33PM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 06, 2024 at 06:41:35PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Swap pud entries do not always return true for pud_huge() for all archs.
> > x86 and sparc (so far) allow it, but all the rest do not accept a swap
> > entry to be reported as pud_huge().  So it's not safe to check swap entries
> > within pud_huge().  Check swap entries before pud_huge(), so it should be
> > always safe.
> > 
> > This is the only place in the kernel that (IMHO, wrongly) relies on
> > pud_huge() to return true on pud swap entries.  The plan is to cleanup
> > pXd_huge() to only report non-swap mappings for all archs.
> > 
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  mm/hmm.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> > @@ -424,7 +424,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
> >  	walk->action = ACTION_CONTINUE;
> >  
> >  	pud = READ_ONCE(*pudp);
> > -	if (pud_none(pud)) {
> > +	if (pud_none(pud) || !pud_present(pud)) {
> 
> Isn't this a tautology? pud_none always implies !present() ?

Hmm yes I think so, afact, it should be "all=none+swap+present". I still
remember I missed that once previously, it's not always obvious when
preparing such patches. :( I'll simplify this and also on patch 3.

Thanks,

-- 
Peter Xu

