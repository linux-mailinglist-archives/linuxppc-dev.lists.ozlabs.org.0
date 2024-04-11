Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B88A19C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:19:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpH3VVU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpH3VVU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFlJr2yD8z3wDV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:19:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpH3VVU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpH3VVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFlDM54cHz3vkX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:15:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712852142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZmlfwQwEwqX8N6AuyRgtrgEEEIO7a43RiQoCYN1PMM=;
	b=ISpH3VVUbcrbPvxbJI0k5w9kiSbUFQibRu6ac3nrfCKLDMHiuCyb9ZFTU5WfnxGSxP3mMc
	fXG2lI2eIqzyMwAe8bBYbnIQml9Zc0JrX9ei8WnMIwUfh6xHOdVQlRzUK/xQ1IDEmMjFh4
	pW45RLXPK3m6mzag7XTlhO0W02cyjBE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712852142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZmlfwQwEwqX8N6AuyRgtrgEEEIO7a43RiQoCYN1PMM=;
	b=ISpH3VVUbcrbPvxbJI0k5w9kiSbUFQibRu6ac3nrfCKLDMHiuCyb9ZFTU5WfnxGSxP3mMc
	fXG2lI2eIqzyMwAe8bBYbnIQml9Zc0JrX9ei8WnMIwUfh6xHOdVQlRzUK/xQ1IDEmMjFh4
	pW45RLXPK3m6mzag7XTlhO0W02cyjBE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-VdYSjX84MRCJq_Qu2HTTRg-1; Thu, 11 Apr 2024 12:15:40 -0400
X-MC-Unique: VdYSjX84MRCJq_Qu2HTTRg-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6ea19a84c22so10644a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 09:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712852140; x=1713456940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZmlfwQwEwqX8N6AuyRgtrgEEEIO7a43RiQoCYN1PMM=;
        b=H3RXlV/D3z03hI8wXEy3x0gPUcl8+Zw1TkYY8LQiKBWLcLCIhS8TH8YfOJTTrX/eij
         GNbaXondEcxJw589c535DxXf3KQYF+DMMWEvrwfi4bTb7+t6cWhp7jzOnxdgdP7BBxeO
         LLbJMLN/enUGJm4pD9wJvcugJHmt+IqrwYF/VSfXhNihPyYyi+u7rAE/drEkRFFDYLqx
         08T+Fg7E9DvTWmtmriqMiu7T4ixdks7wxzOFMJRKxyi1ORKjeJXw204pm/p/llPLBFRa
         hC84sZQM0ciJX8/UvwnuVg/8y0QjRIyRyfn1lF0pXYpd8RYInC/k45CofeUkEXpnL0JH
         sg7g==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZnwxttYP+6aU5VHDzvru3tVKQFPmVW45zBQ6Kw+vl01Mvj9OJrR/vyyKuUn3qG/K5xOWg+ZBcMMR2+tqrYC9iqMfNzsIAOHySaeBSw==
X-Gm-Message-State: AOJu0YyTSNyBcRfLide5JkAUa8K2a+/un+lJmLmTG4Nr0uyrdVNt1K7D
	nYXIfZS3D+hmhvCEqxIzFmP9lc2n88EgiN32Y5H9EfWsnvuIB434oNbY+NUJHWX9cwacVPrUrs5
	MEkzj9IUH+drDDcmMjEj4n3Ba19Id6t/2rtFsyfUVN4PaI/juXEgIRpKBCes+aps=
X-Received: by 2002:a05:6870:7183:b0:222:81cc:ac9c with SMTP id d3-20020a056870718300b0022281ccac9cmr6146574oah.5.1712852139654;
        Thu, 11 Apr 2024 09:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHX6QtF5SydubwLrtRDzMOYoSKh757kSXH1BgbFRQt1iTYEViuMR5roQkhSWQN8EQKuvV3vQ==
X-Received: by 2002:a05:6870:7183:b0:222:81cc:ac9c with SMTP id d3-20020a056870718300b0022281ccac9cmr6146547oah.5.1712852139258;
        Thu, 11 Apr 2024 09:15:39 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id bi36-20020a05620a31a400b0078d677e72f3sm1195367qkb.118.2024.04.11.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 09:15:38 -0700 (PDT)
Date: Thu, 11 Apr 2024 12:15:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Message-ID: <ZhgMqF7SNaISrYMJ@x1n>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240325163840.GF6245@nvidia.com>
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
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 01:38:40PM -0300, Jason Gunthorpe wrote:
> On Mon, Mar 25, 2024 at 03:55:53PM +0100, Christophe Leroy wrote:
> > This series reimplements hugepages with hugepd on powerpc 8xx.
> > 
> > Unlike most architectures, powerpc 8xx HW requires a two-level
> > pagetable topology for all page sizes. So a leaf PMD-contig approach
> > is not feasible as such.
> > 
> > Possible sizes are 4k, 16k, 512k and 8M.
> > 
> > First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> > must point to a single entry level-2 page table. Until now that was
> > done using hugepd. This series changes it to use standard page tables
> > where the entry is replicated 1024 times on each of the two pagetables
> > refered by the two associated PMD entries for that 8M page.
> > 
> > At the moment it has to look into each helper to know if the
> > hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> > a lower size. I hope this can me handled by core-mm in the future.
> > 
> > There are probably several ways to implement stuff, so feedback is
> > very welcome.
> 
> I thought it looks pretty good!

I second it.

I saw the discussions in patch 1.  Christophe, I suppose you're exploring
the big hammer over hugepd, and perhaps went already with the 32bit pmd
solution for nohash/32bit challenge you mentioned?

I'm trying to position my next step; it seems like at least I should not
adding any more hugepd code, then should I go with ARCH_HAS_HUGEPD checks,
or you're going to have an RFC soon then I can base on top?

Thanks,

-- 
Peter Xu

