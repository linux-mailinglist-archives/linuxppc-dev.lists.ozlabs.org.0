Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257135923C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 04:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjMw2rHDz301J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 12:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dbL+4SuF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dbL+4SuF; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjMR2YJ9z2yZ4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 12:51:46 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id h3so1215519qve.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=Ti/qpIJK0JqvHL8TU/tnfoeQ9Y9IJU2p+9Y0hgWyYLA=;
 b=dbL+4SuFGgzny/mPnRzaZ4dtQnvbr2GIofq9+J0p7ghVS5THzn0NrGyLRIsCM7ufDJ
 ntYXe6wRo1Qo7BO5TUGo3Swq5JspriqnLFEbKz4EPWmhmvrnLS7Hytszw8i7A2Wo+YFZ
 t43Iw1Qkun5eJ+ACmxXy3CoEA1Vr5ZjFXmMmFJGEM6BXfQWh3Uj23AOvh2iBmNItNO6s
 npsCM/CANpewDB/Ck5yama6lTO8stoQpz4bsbc3gVOoOJ6X8ToRVbsQO6HHt4ewimNDY
 NfRZpUtbPViUzQKO8bfhJDXM46PorufDiOlolfFB806LIh4XzXsDaw3/jRXedTS8hCrM
 uUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ti/qpIJK0JqvHL8TU/tnfoeQ9Y9IJU2p+9Y0hgWyYLA=;
 b=o4SQsgXHD7/3cazlGXBLObo1+Ja5ue37bQYK+RX2YsR59FFzQcgyEbvIalkM5VIE9I
 oNHVmTw8IKOcnk0XwoVDHxRDIWxQk4Z3AlogBv9+sx/joxmLngkrEVLWh+KrcT/6VSlH
 xKh+aEzwikQeaFBU5qyQ2dcBINcup2Ck41tYKSRs5DMffylQS4oKFLpymvReGriLDETM
 QGmGIxhGz5yU+73mNTUdzinZDdsTCj3xMOeNodLQyaYheqCuffZxjc7HrmrAK9HeDYEj
 XGHKTRbU+ONXDavtRylNLpU/5/2/NX/n3CkxcTQHp0c56IyCL98exSTcLonr1Hvm4kno
 5NSQ==
X-Gm-Message-State: AOAM531AFsaw09ls6/5Mo+Lq9TNehMEAmM3ROFjkhqMKqLV0sagi6gj2
 cwnX1+w2UVgykq60O9wNLveOlSDGDMk=
X-Google-Smtp-Source: ABdhPJzTi39fAOMh7hkNEfyra0UzEUiu3Dt6zJYz5i979zxCQHEcKh6pILhSu5DdXRy7mGBRLE9K0w==
X-Received: by 2002:a0c:e84e:: with SMTP id l14mr12178774qvo.39.1617936702818; 
 Thu, 08 Apr 2021 19:51:42 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id 26sm214093qtd.73.2021.04.08.19.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 19:51:42 -0700 (PDT)
Message-ID: <e5c924479839815c025de29d650d82419b18c0dc.camel@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups on
 memory hotplug
From: Leonardo Bras <leobras.c@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 08 Apr 2021 23:51:36 -0300
In-Reply-To: <YFhNd42RvobCV8tF@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-3-leobras.c@gmail.com>
 <YFhNd42RvobCV8tF@yekko.fritz.box>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Dan Williams <dan.j.williams@intel.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello David, thanks for the feedback!

On Mon, 2021-03-22 at 18:55 +1100, David Gibson wrote:
> > +void hash_memory_batch_expand_prepare(unsigned long newsize)
> > +{
> > +	/*
> > +	 * Resizing-up HPT should never fail, but there are some cases system starts with higher
> > +	 * SHIFT than required, and we go through the funny case of resizing HPT down while
> > +	 * adding memory
> > +	 */
> > +
> > +	while (resize_hpt_for_hotplug(newsize, false) == -ENOSPC) {
> > +		newsize *= 2;
> > +		pr_warn("Hash collision while resizing HPT\n");
> 
> This unbounded increase in newsize makes me nervous - we should be
> bounded by the current size of the HPT at least.  In practice we
> should be fine, since the resize should always succeed by the time we
> reach our current HPT size, but that's far from obvious from this
> point in the code.

Sure, I will add bounds in v2.

> 
> And... you're doubling newsize which is a value which might not be a
> power of 2.  I'm wondering if there's an edge case where this could
> actually cause us to skip the current size and erroneously resize to
> one bigger than we have currently.

I also though that at the start, but it seems quite reliable.
Before using this value, htab_shift_for_mem_size() will always round it
to next power of 2. 
Ex.
Any value between 0b0101 and 0b1000 will be rounded to 0b1000 for shift
calculation. If we multiply it by 2 (same as << 1), we have that
anything between 0b01010 and 0b10000 will be rounded to 0b10000. 

This works just fine as long as we are multiplying. 
Division may have the behavior you expect, as 0b0101 >> 1 would become
0b010 and skip a shift.
	
> > +void memory_batch_expand_prepare(unsigned long newsize)
> 
> This wrapper doesn't seem useful.

Yeah, it does little, but I can't just jump into hash_* functions
directly from hotplug-memory.c, without even knowing if it's using hash
pagetables. (in case the suggestion would be test for disable_radix
inside hash_memory_batch*)

> 
> > +{
> > +	if (!radix_enabled())
> > +		hash_memory_batch_expand_prepare(newsize);
> > +}
> >  #endif /* CONFIG_MEMORY_HOTPLUG */
> >  
> > 
> > +	memory_batch_expand_prepare(memblock_phys_mem_size() +
> > +				     drmem_info->n_lmbs * drmem_lmb_size());
> 
> This doesn't look right.  memory_add_by_index() is adding a *single*
> LMB, I think using drmem_info->n_lmbs here means you're counting this
> as adding again as much memory as you already have hotplugged.

Yeah, my mistake. This makes sense.
I will change it to something like 
memblock_phys_mem_size() + drmem_lmb_size()

> > 
> > +	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add * drmem_lmb_size());
> > +
> >  	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> >  		if (lmb->flags & DRCONF_MEM_ASSIGNED)
> >  			continue;
> 
> I don't see memory_batch_expand_prepare() suppressing any existing HPT
> resizes.  Won't this just resize to the right size for the full add,
> then resize several times again as we perform the add?  Or.. I guess
> that will be suppressed by patch 1/3. 

Correct.

>  That's seems kinda fragile, though.

What do you mean by fragile here?
What would you suggest doing different?

Best regards,
Leonardo Bras

