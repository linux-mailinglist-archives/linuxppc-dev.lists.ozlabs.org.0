Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E505611A5FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 09:40:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xr3J6tYzzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xr0Z5fz3zDql2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 19:37:50 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id p17so1664641wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 00:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RT9pTTqiwT2L0hZKyzfnOGnReyBEaT0I8SJou9/ZWtA=;
 b=PU/7Zl0g0g3zNJs7EYQvMPQXLxYjyKZpbvOTFDve+kj+KkfVHjoBmCXoyVCCwzTtdX
 yTBJduVHn4adYlPjXl7vLjtan6SRHM3ww3j33D7Q5mQ+o7BEdKiwmwTWK1pi+0LH00Sa
 HVAdKwbIXaoZUMierE1cRT73QlmxPIS5aRMe05lFC6Gk02P/1CeApDPIm1qgofFTx2Vy
 Jr/e5Hb0jU+Kx9fVRLatM4GGFDDlTB+2ed2Dx1hN/vU6w8gkCuAptO2sTj1CWsuVK3Y6
 2MWqZPwb6XkJ30g50nKvzdUhExz3UPSDheWNdqmvupO1SQs4D+NwAy2DS4yYhBdv2MpF
 adrg==
X-Gm-Message-State: APjAAAWIcMlOmZMfM2WyPglEz6ax6pI0pQao8TUNWdjNi+kX2bgkpFvq
 HFViRNEgB9iHBF8Bf9Oc1Z4=
X-Google-Smtp-Source: APXvYqw61QRsYL0Lq+p6xXB8wylpboyl1Ts6lCVX0L7iemSth1vHmOlbDD2iTtXwvmvWkyZL3xVJiQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2029460wmg.95.1576053467280; 
 Wed, 11 Dec 2019 00:37:47 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id f1sm1406269wrp.93.2019.12.11.00.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 00:37:46 -0800 (PST)
Date: Wed, 11 Dec 2019 09:37:45 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 5/6] mm, memory_hotplug: Provide argument for the
 pgprot_t in arch_add_memory()
Message-ID: <20191211083745.GA14655@dhcp22.suse.cz>
References: <20191209191346.5197-1-logang@deltatee.com>
 <20191209191346.5197-6-logang@deltatee.com>
 <ce50d9da-c60e-05a1-a86b-3bb3629de502@redhat.com>
 <f34a4c52-cc95-15ed-8a72-c05ab4fd6d33@deltatee.com>
 <CAPcyv4hpXCZxV5p7WaeGgE7ceujBBa5NOz9Z8fepDHOt6zHO2A@mail.gmail.com>
 <20191210100432.GC10404@dhcp22.suse.cz>
 <6da2b279-6a6d-d89c-a34c-962ed021d91d@redhat.com>
 <20191210103452.GF10404@dhcp22.suse.cz>
 <a9d6cfe8-39fb-accf-acdc-7cce5578bf2f@redhat.com>
 <297b7cc0-c5bc-a4c6-83eb-afc008395234@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <297b7cc0-c5bc-a4c6-83eb-afc008395234@deltatee.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-ia64@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux-sh <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 10-12-19 16:52:31, Logan Gunthorpe wrote:
[...]
> In my opinion, having a coder and reviewer see PAGE_KERNEL and ask if
> that makes sense is a benefit. Having it hidden because we don't want
> people to think about it is worse, harder to understand and results in
> bugs that are more difficult to spot.

My experience would disagree here. We have several examples in the MM
where an overly complex and versatile APIs led to suble bugs, a lot of
copy&pasting and cargo cult programing (just look at the page allocator
as a shiny example - e.g. gfp_flags). So I am always trying to be
carefull here.

> Though, we may be overthinking this: arch_add_memory() is a low level
> non-exported API that's currently used in exactly two places.

This is a fair argument. Most users are and should be using
add_memory().

> I don't
> think there's going to be many, if any, valid new use cases coming up
> for it in the future. That's more what memremap_pages() is for.

OK, fair enough. If this is indeed the simplest way forward then I will
not stand in the way.
-- 
Michal Hocko
SUSE Labs
