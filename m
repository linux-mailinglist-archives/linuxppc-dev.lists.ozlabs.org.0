Return-Path: <linuxppc-dev+bounces-10515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B5B18625
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 19:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btsf273H7z2xRs;
	Sat,  2 Aug 2025 03:00:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754067642;
	cv=none; b=LH8tIAiPYEkoCYssf3t0w0pkDPqztQ0njslE4a47t2nyjQrRx83SV8PEUNtAa+1/knl3DZWl/HsZyvNXWPow6l6yE032kPywhwfJbZgq6y7iAZ74DIiFvRBbWwQV2lvunGpTZ0Wf34Oxxf6h4ME49hmrPGL3Dqc4e6Q+/TXqgD7rjzI7EyhqPK18W1nKISBgEMfnMPL1aRWnoxjeMRAQXTIOhrEjmZHcLh6hiRy5gdkinnQxw5/DBCwKPnVTk/eUne6RIqRCwkDb+qq9tW/POiO7qCRSj8ansEJ5LqQzb9CiMTySBZfHUp7CPxusWunWQFp/W9tm+zMmwwF9h+mCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754067642; c=relaxed/relaxed;
	bh=LfCYUUeNzqTP+LwSzZh8YLP72/OXU9Xwsponm3y55nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBi3UbnJhLtGdfaGOwIrDAcBbjNaCWCkB40D0ZTbeDQ3yZieBvRCS77xlcs0FdCCyIR4SCSQbUy0SIJf+BkAADHipT1qSwgO9A7DFvEvDm8nMIyAxg13mGxtc46SzjaAQdjNh3MqMVqlIzaaMTlByIk07IEdYXIcpdOpORXd789goheuJ/1oSntGFtSCLYhYGx9dw8TvaHzvKBICYNJjGiWwod5WPKqteE8GNe9XorAtVK/sjif9KTtMYv7kjB+YxUZvKlDo0rkydQwlWgKfTDcojeco9cd8OG5AW2qEuOikWAghkAYgPGIU7WGNdJB3vLvgHNqQOervrnxmuP8lbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.43; helo=mail-ej1-f43.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.43; helo=mail-ej1-f43.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btsf14Kx4z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 03:00:40 +1000 (AEST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af913d9d2a1so374813766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 10:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754067637; x=1754672437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfCYUUeNzqTP+LwSzZh8YLP72/OXU9Xwsponm3y55nE=;
        b=rQp0LiXK3LwblxP3PobYOw/nQKzsJvqfNhwFHEWNlAbhtIw78yuLuFzucjdsj9EpBF
         OLQPhLW2b3QV/G4UQ6arCWsjgQf8jWv8r+dz3xBau3YrK4qc8r8lGtuVtBQRMmTACyZV
         veKlfuju+/9bZP35hQ5XeerPTCWW+PsWaN+H4zrp0GsB2f9oDxgeh9WwHEag84vriru4
         wnM4nBt2u2eT//sa29niLqw3ng5jKNKkHWn24x4rTvLyN65GXeMPYX4EApuPtnYOqGbu
         NM55YH9SUW9OfXm+pmQqbS6i9wkL+MSDY8Id0Wpp/LVeKoZ8vzaun2mm9VrlpFClljvR
         wGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWaZrLmwK4NwZjZAbX75m8+xeqaSzaEgMHmBxTmxY3DsyARND5rxIoY1bo701Atg24f5w+3m/+7fc3jY54=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqiKYYiSO6xqPljYMnQ3llI+Om3OunfiR3H5gOMA9KZ/5Ge9Uh
	XEuSET3TkRiEk+BKUnxNtxs2Ax/RSq05cKy4oyV8pfVd3JSO59NaEOLp
X-Gm-Gg: ASbGncst2CQzOYQroYXyKCN32KvWCG9rW9996wjBHxdIeFe5irfobrLZKbbaubDJrGU
	ywh7u+TFo/WS/wiMbqBpP9F3MQN7aqZ1YydA7/eZLNIuBQW7tnjThKY1of5QVYsJcsKk0NFM6aJ
	eBRfN6QcSE4BOtonCSlSlDTJyA8XjTDE5BKjyW2qJ1PD4jkZDx+fZMncDEgHbWTslW6w4/wNbyf
	5Fwb4QggEVghU34evVrSMbeGsFcWQf/iJ/EuXsNZoBIunA8Fgf2/yEwBfi6mYG6YrvQ4Hwu5q9K
	w0JPJTDCyHMGgqEP4EalpyNeVPx+nUc92SXj+Ha+jkuhNeRK89GaXgtLkmEDOrh1RAmX9vWS7wl
	UA7KujWr0aaTExg==
X-Google-Smtp-Source: AGHT+IGpq60CKY3QvKTsc9HB8eSUqXk3f/gsXwEntEJaK1GEY6vGj3gABeOiP8jIzbPXR/Pw3PU1uA==
X-Received: by 2002:a17:907:7fa3:b0:af9:2bb9:ea36 with SMTP id a640c23a62f3a-af93ffbe3c3mr59933566b.7.1754067637034;
        Fri, 01 Aug 2025 10:00:37 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91b36e91dsm295781466b.69.2025.08.01.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:00:36 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:00:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com
Subject: Re: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <buhwuankenpnvmio6jeoxverixoyfpn2eh62ix7vzxw7xvlxcv@rpibcrufr2yg>
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
 <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
 <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
 <0c045f1b-44d0-430c-9e8a-58b65dd84453@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c045f1b-44d0-430c-9e8a-58b65dd84453@intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

hello Dave,

On Fri, Aug 01, 2025 at 09:24:43AM -0700, Dave Hansen wrote:
> On 8/1/25 08:13, Breno Leitao wrote:
> > On Fri, Aug 01, 2025 at 07:52:17AM -0700, Dave Hansen wrote:
> >> On 8/1/25 05:31, Breno Leitao wrote:
> >>> Introduce a generic infrastructure for tracking recoverable hardware
> >>> errors (HW errors that are visible to the OS but does not cause a panic)
> >>> and record them for vmcore consumption.
> >> ...
> >>
> >> Are there patches for the consumer side of this, too? Or do humans
> >> looking at crash dumps have to know what to go digging for?
> >>
> >> In either case, don't we need documentation for this new ABI?
> > 
> > I have considered this, but the documentation for vmcoreinfo
> > (admin-guide/kdump/vmcoreinfo.rst) solely documents what is explicitly
> > exposed by vmcore, which differs from the nature of these counters.
> > 
> > Where would be a good place to document it?
> 
> I'm not picky. But you also didn't quite answer the question I was asking.
> 
> Is this new data for humans or machines to read?

I would say that the main consumer for this are post-mortem tools that
collect information of the vmcore and do diagnostic and correlation.
This is a common tooling for cloud providers, AFAIK.

In my work environment, there is a script that runs `drgn` on every
vmcore to capture information that would help operator to address the
problem. The information that this patch is proposing adds another field
that would help to potentially correlate crashes with recoverable error.

> >> Does "MCE" mean anything outside of x86?
> > 
> > AFAIK this is a MCE concept.
> 
> I'm not really sure what that response means.
> 
> There are two problems here. First is that HWERR_RECOV_MCE is defined in
> arch-generic code, but it may never get used by anything other than x86
> when CONFIG_X86_MCE.
> 
> That also completely wastes space in your data structure when
> HWERR_RECOV_MCE=n. Not a huge deal as-is, but it's still a bit sloppy
> and wasteful.

Would a solution like this look better?

	enum hwerr_error_type {
		HWERR_RECOV_CPU,
		HWERR_RECOV_MEMORY,
		HWERR_RECOV_PCI,
		HWERR_RECOV_CXL,
		HWERR_RECOV_OTHERS,
	#ifdef CONFIG_X86_MCE
		HWERR_RECOV_MCE,
	#endif
		HWERR_RECOV_MAX,
	};

Or, would you prefer to have HWERR_RECOV_ARCH and keep it always there?

> >> I'd also love to hear more about _actual_ users of this. Surely, someone
> >> hit a real world problem and thought this would be a nifty solution. Who
> >> was that? What problem did they hit? How does this help them?
> > 
> > Yes, this has been extensively discussed in the very first version of
> > the patch. Borislav raised the same question, which was discussed in the
> > following link:
> > 
> > https://lore.kernel.org/all/20250715125327.GGaHZPRz9QLNNO-7q8@fat_crate.local/
> 
> When someone raises a concern, we usually try to alleviate the concern
> in a way that is self-contained in the next posting. A cover letter with
> a full explanation would be one place to put the reasoning, for example.
> 
> But expecting future reviewers to plod through all the old threads isn't
> really feasible.

Sorry. I tried to improve the documentation and wrote the following
message to the commit message, which was clearly not enough.

	This helps fleet operators quickly triage whether a crash may be
	influenced by hardware recoverable errors (which executes a uncommon
	code path in the kernel), especially when recoverable errors occurred
	shortly before a panic, such as the bug fixed by
	commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them
	when destroying the pool")

For next commit I will add a cover-letter, with the summary of the
details of that discussion.

Thanks for the review and suggestions,
--breno


