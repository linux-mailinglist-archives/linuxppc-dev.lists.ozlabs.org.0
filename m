Return-Path: <linuxppc-dev+bounces-10512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCEB184B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 17:13:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btqGR66yqz2yfL;
	Sat,  2 Aug 2025 01:13:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754061215;
	cv=none; b=X9zxEcyTbb0i2IEr/K+ax99i+Gtly701KXEtp6KrdnnFI0sR38VF77bI28Ua6YC4lI96iQP2hYoNr/QMlvefHyARCbVK+6ldKJPwY2GJaQsZ0lzIHs/O6KrVv0v0BAnjGuSX40xwQQTZPr7uykJ67h90wIRhzRTI8t84mTIOBfNvpSYYXoU7aUt92VG9BUErAlpsa2nhWSg9wp13SoY4sXo9dXjfAiK6QSkeQhVzUYxkfOMNaOnmYTbesUvISvQ0BNQajoN9QwzzovTfLkGvwtEcvaeWxtgondPaTaRySeEpiA20IwvIr+FatLTJowMMb1PLP5nL6l/fwM4OWYRVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754061215; c=relaxed/relaxed;
	bh=pLvAFPQ8DYraj8LtMTWkc3DYDv2AWsFej7nsT5sUEtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6Ep3HIk3rSFjCIBGke81G5ym6+gs/J666tvi836GUTVWBewZWBppUP6mgZx2kdRMAwfWNut4OclK9zqeFFEuTOBWhe9YzoLEu4YDhf3rSj+LS3fa+Rj9hLAOdetNJt6LcRGTeECIaVmy89ocrVVRPwBjvU4+6lXzCRlPLcox64h4Yc50yrVVCYHftgK3tosSJrnWH0aiTMoCF7XtV0EWShexd9aUGQr2tOiWX1ZivlwH7EyREzuNncG+0UAFddbSKsWqdGNnAdWOVsd9+YJ6xEX+vSmLOiKlv8+uoJXZoM1+9wbRaHb946mVm2uC3dK0MZ3smGcSqiArEuEoHnvjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.44; helo=mail-ej1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btqGQ2PMrz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 01:13:33 +1000 (AEST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so325743266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 08:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754061210; x=1754666010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLvAFPQ8DYraj8LtMTWkc3DYDv2AWsFej7nsT5sUEtI=;
        b=nQWNzBcFqMexkiJ2oJvZGyCTc41+wLBd+ZF7eX9vpgH4w6w6c/Bo4MDwU8LaA4aoUn
         ecAEmpMx/PEKTiusheZH4Xaxs+BnM28hy4sBKdvjeVEG5+zaoeGxxX4nGEoCUACFU+FU
         MINkC6D22mO1v523IUEo1+681h+ObXTAZbVuvP7K7W6zLJSsqtPuuXnpr3u7a2nbfFjv
         WYSdY3nqFrJgf/wfnbTg46M9nThEMRMmP6+tEZeA2sYIaJzIoKRF3zT/GgcVcdfDrTcm
         enzOUqkPFxJbjy/7mUzsxk34J9z+R6W4hc7A1+n1aUp6DYgi2RWRggNF5AMV1IjOW+x9
         2byA==
X-Forwarded-Encrypted: i=1; AJvYcCVRt0QfUkmxlC2B3IDi3oH/6Wa0nBqRYk9+4DXIWxelLuvbJ3h2nAgTlunEizhxa2he+jN9rsf5+oXkApI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcYDTyOMzN0MunEwTTODZs+j2xGToGu/ANZM+uLEG2P6tJIew/
	H29DggifnagwhgI5kAs+JM+hwVUwV3aENGiLQqHwXkA/tcILHXl+BH8J
X-Gm-Gg: ASbGncuJQXnJOri+jF5EkfasRRHN73YG9QufkwUjdi/ahcDlYbVtrdG0ITVnTm1POzB
	E6mszLIJoBseb4wi9Yt+IdadytbXIW9T9cvfIu/N8kd9rudwRt/e8hm/Png+GMvVWZJwtuazIZn
	G890rurOy7RnwXvKkkESP445hCio9alne6ihBVTneCSvjfZ+/QWOqxW3kOrZViyvZUOGZn4rwdz
	qk5Att+yEbFTVGyOI0tDyknsWl9cnLV/Db0UFRs0mZV1GrHu+JaQVgUbf0oDY5tKOOT+fTEY765
	Zx8CxEiMd9/3ddFqmMu0oDE4HD0Y9txgH7x9uwgBxa5R5QJn6BjnbRBWRh3Y/5WfcETne6zwuvY
	lEklpZtxG9RdDgA==
X-Google-Smtp-Source: AGHT+IHxwNCV+mxtZBzz5cvZjpfuoqtgwb9V8VUnUiYcYZ36deiu6WNQjZZGI0DAGbFT+RybIxFgAA==
X-Received: by 2002:a17:907:9706:b0:ae3:cd73:efde with SMTP id a640c23a62f3a-af9401b0c5emr13383466b.44.1754061210083;
        Fri, 01 Aug 2025 08:13:30 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a24062esm303137466b.126.2025.08.01.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:13:29 -0700 (PDT)
Date: Fri, 1 Aug 2025 08:13:26 -0700
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
Message-ID: <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
 <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
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
In-Reply-To: <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Dave,

On Fri, Aug 01, 2025 at 07:52:17AM -0700, Dave Hansen wrote:
> On 8/1/25 05:31, Breno Leitao wrote:
> > Introduce a generic infrastructure for tracking recoverable hardware
> > errors (HW errors that are visible to the OS but does not cause a panic)
> > and record them for vmcore consumption.
> ...
> 
> Are there patches for the consumer side of this, too? Or do humans
> looking at crash dumps have to know what to go digging for?
> 
> In either case, don't we need documentation for this new ABI?

I have considered this, but the documentation for vmcoreinfo
(admin-guide/kdump/vmcoreinfo.rst) solely documents what is explicitly
exposed by vmcore, which differs from the nature of these counters.

Where would be a good place to document it?

> > @@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
> >  	}
> >  
> >  out:
> > +	/* Given it didn't panic, mark it as recoverable */
> > +	hwerr_log_error_type(HWERR_RECOV_MCE);
> > +
> 
> Does "MCE" mean anything outside of x86?

AFAIK this is a MCE concept.

> I wonder if this would be better left as "HWERR_RECOV_ARCH" or something.

Sure. I can update it to be more generic.

> > +void hwerr_log_error_type(enum hwerr_error_type src)
> > +{
> > +	if (src < 0 || src >= HWERR_RECOV_MAX)
> > +		return;
> > +
> > +	/* No need to atomics/locks given the precision is not important */
> 
> Sure, but it's not even more lines of code to do:
> 
> 	atomic_inc(&hwerr_data[src].count);
> 	WRITE_ONCE(hwerr_data[src].timestamp, ktime_get_real_seconds());
> 
> So why not?

Sure, we can do that, I will update it also.

> > +	hwerr_data[src].count++;
> > +	hwerr_data[src].timestamp = ktime_get_real_seconds();
> > +}
> > +EXPORT_SYMBOL_GPL(hwerr_log_error_type);
> 
> I'd also love to hear more about _actual_ users of this. Surely, someone
> hit a real world problem and thought this would be a nifty solution. Who
> was that? What problem did they hit? How does this help them?

Yes, this has been extensively discussed in the very first version of
the patch. Borislav raised the same question, which was discussed in the
following link:

https://lore.kernel.org/all/20250715125327.GGaHZPRz9QLNNO-7q8@fat_crate.local/

Thanks for the review,
--breno

