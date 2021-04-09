Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFEF359309
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 05:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkFR24kjz3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 13:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=n0r36yzy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n0r36yzy; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkF051Plz301s
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 13:31:14 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id c6so3243127qtc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 20:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=6UuQfMQF3OUZ83yBXGwyDB/n7MYxlPyfj5Q62eMYOas=;
 b=n0r36yzy05cjaLySQ0nj0iZxl6wD3E4lQ6XjHXdBIqrfwkHyxefdW5OcIoLS2tZ0YI
 LuyoNJdit33LPL5CN0O8ValmYVvyaO8c1H+Pa32tCe2s8yw9vN7yKw9fTj6NWR0XXldQ
 V5tKvHEeVR2d9dLU2jf46yC3lTz7U8cNQodrDZ9+2IL3eouiIzbagu1a+kD4XLmG/fmB
 DqZaLi9IfpC9FkwNMHXzDryhD/kETBKmfmFHIDhpcxd2c7fQv0HhQxpeoAOZ0W3Pjals
 WS1UMVcOaWeFwSQjoWOQd6jesuDkXUHFz+exC2VxfQg+NpLMLeAuhdeXWeH7grZAbrdL
 yDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6UuQfMQF3OUZ83yBXGwyDB/n7MYxlPyfj5Q62eMYOas=;
 b=sAg3LFBsTeMTsulsWn9/ORl9sufHZ4i3Vd+03OOHJrIQlwVWbeLPUE96x16bETdE+x
 jjA59YfJmZ23X1YY37lEbNCN+b2IsrMLWNZn9W76RLSs9EGurWQZwjzgFV8Gulx7FeCd
 iK1SNp8Ixy0Cka/yEiT8f2sfYqzvi3v3B0spuMdT1JI/nwJnXMr8Xo9BoCBWbWjRfoDz
 wxoceN/2a9yJqZ9ERYKpN2BJJL8g2hH0oItVKCYSXcaDFl5zzUWchCZqDiL+Nsx6nC9U
 2EcIiRq90sI21OXEi3WDAoYFs2moKG42/AmOfs+gaj+HkhIc5N80/iSzw63vhm8tKWFP
 gcsA==
X-Gm-Message-State: AOAM533m7ywNrLo0AA8ncq7ka88ztuvMxaWHDYCSxkjJKrvcOQ9j6fV6
 GoijLbBzwWwIIAvDSKNXfYI=
X-Google-Smtp-Source: ABdhPJxDnbslzKC7wrVB97E/nbUaKtOowt3QwqLALE//+XDB8gZptK7ggVkaiwxtYZrZlzhpsciICw==
X-Received: by 2002:ac8:6f2e:: with SMTP id i14mr10652056qtv.277.1617939070848; 
 Thu, 08 Apr 2021 20:31:10 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id g11sm953629qkk.5.2021.04.08.20.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 20:31:10 -0700 (PDT)
Message-ID: <418f044aab385389681529b0b6057e75825b0e5f.camel@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs on
 memory hotunplug
From: Leonardo Bras <leobras.c@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 09 Apr 2021 00:31:03 -0300
In-Reply-To: <YFksMw8Hw/mC48yb@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-4-leobras.c@gmail.com>
 <YFksMw8Hw/mC48yb@yekko.fritz.box>
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

Hello David, thanks for commenting.

On Tue, 2021-03-23 at 10:45 +1100, David Gibson wrote:
> > @@ -805,6 +808,10 @@ static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
> >  	if (shrinking) {
> > 
> > +		/* When batch removing entries, only resizes HPT at the end. */
> > +		if (atomic_read_acquire(&hpt_resize_disable))
> > +			return 0;
> > +
> 
> I'm not quite convinced by this locking.  Couldn't hpt_resize_disable
> be set after this point, but while you're still inside
> resize_hpt_for_hotplug()?  Probably better to use an explicit mutex
> (and mutex_trylock()) to make the critical sections clearer.

Sure, I can do that for v2.

> Except... do we even need the fancy mechanics to suppress the resizes
> in one place to do them elswhere.  Couldn't we just replace the
> existing resize calls with the batched ones?

How do you think of having batched resizes-down in HPT? 
Other than the current approach, I could only think of a way that would
touch a lot of generic code, and/or duplicate some functions, as
dlpar_add_lmb() does a lot of other stuff.

> > +void hash_memory_batch_shrink_end(void)
> > +{
> > +	unsigned long newsize;
> > +
> > +	/* Re-enables HPT resize-down after hot-unplug */
> > +	atomic_set_release(&hpt_resize_disable, 0);
> > +
> > +	newsize = memblock_phys_mem_size();
> > +	/* Resize to smallest SHIFT possible */
> > +	while (resize_hpt_for_hotplug(newsize, true) == -ENOSPC) {
> > +		newsize *= 2;
> 
> As noted earlier, doing this without an explicit cap on the new hpt
> size (of the existing size) this makes me nervous. 
> 

I can add a stop in v2.

>  Less so, but doing
> the calculations on memory size, rather than explictly on HPT size /
> HPT order also seems kinda clunky.

Agree, but at this point, it would seem kind of a waste to find the
shift from newsize, then calculate (1 << shift) for each retry of
resize_hpt_for_hotplug() only to point that we are retrying the order
value.

But sure, if you think it looks better, I can change that. 

> > +void memory_batch_shrink_begin(void)
> > +{
> > +	if (!radix_enabled())
> > +		hash_memory_batch_shrink_begin();
> > +}
> > +
> > +void memory_batch_shrink_end(void)
> > +{
> > +	if (!radix_enabled())
> > +		hash_memory_batch_shrink_end();
> > +}
> 
> Again, these wrappers don't seem particularly useful to me.

Options would be add 'if (!radix_enabled())' to hotplug-memory.c
functions or to hash* functions, which look kind of wrong.

> > +	memory_batch_shrink_end();
> 
> remove_by_index only removes a single LMB, so there's no real point to
> batching here.

Sure, will be fixed for v2.

> > @@ -700,6 +712,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
> >  	if (lmbs_added != lmbs_to_add) {
> >  		pr_err("Memory hot-add failed, removing any added LMBs\n");
> > 
> > +		memory_batch_shrink_begin();
> 
> 
> The effect of these on the memory grow path is far from clear.
> 

On hotplug, HPT is resized-up before adding LMBs.
On hotunplug, HPT is resized-down after removing LMBs.
And each one has it's own mechanism to batch HPT resizes...

I can't understand exactly how using it on hotplug fail path can be any
different than using it on hotunplug.
> 

Can you please help me understanding this?

Best regards,
Leonardo Bras

