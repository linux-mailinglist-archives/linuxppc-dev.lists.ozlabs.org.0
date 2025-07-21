Return-Path: <linuxppc-dev+bounces-10340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D65B0C7DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 17:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bm4S60z0fz2yRn;
	Tue, 22 Jul 2025 01:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753112614;
	cv=none; b=ie7NvDv4qtmxDPmcTkIc49JQAVlK7CAEMvaGMhmg+P4x/8O4rwesQjwW7nFdJQZouB8FkvqQ9eLEM4X12gVgwseXCy0uWVTUkkh0rf2YUwH+pLV869Kjl4lc4RIqnHufpoA5eexaPaMIZzOFeGRyZwPP7XDuAvoeJk3ywHUaSznj2T3jmu22+8dUUaPokXyFGvI4N+liCvz5g0gzUqEMtYT7clzXDSb3ljozcoKI9DB/M39OjqfD6NPZEoHxZWC2Bo3/G32Qvyy+TGNPyZWLvsyAqB2eYC3enGLEOqCDsj3uRKMu8M6bNyULIZY8ADXoRjEGTteBxlPg2tUQWwWpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753112614; c=relaxed/relaxed;
	bh=q8EMch7mkTjcU9bPeMD8J/i/5F0EvPo6dc4/iWe3Dl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnuFvTWL9KRZG4A/nIKw8YK470swzHp+Fe2ZwEQ+A/XhBpLOJKbc10Mfk6K+mrwPQYoGOK7llXS92bL7yk/jmCC6CzkatqQH5KryoBnO6KHdG0ShAoS/PYjcmsuNwpSdbvEtY7+41+CGJbkcEfkX5ohQeOfnu3SrH686EHZcubaSXSCpiZPKPxUdW4Cv9Okvi8FVl6bSZShZpPk8E7r7S63SZrUPegz9ttgEwzDqSfQ9pcb5DPePXEtIb0e/cWnB4f0oBgDG4ayxFkygNdRSpVCAhhj4VJb0qlMRweDtyr8sRjwwy2ew/PxbgKEF0YUhYd3aiZ1OQIzs9zJezVsq7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bm4S46Wg6z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 01:43:31 +1000 (AEST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6439967a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 08:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753112608; x=1753717408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8EMch7mkTjcU9bPeMD8J/i/5F0EvPo6dc4/iWe3Dl8=;
        b=SmX1Do8VeSMdO1IBObrNsUm0YEDPdM/Q34V2mtk0kt7drPLa5xqw12tf0KGgb6gg6s
         njROVlh7PMKGvu30qeP+q8AxmYrQkJOi1iP/F0tKOGUq1UZ/GxnhnH+u4JlZPScCx4KV
         Otxv2yLcSrCPna3PxdviBy+pmgx9jh2snkSlZyV9KMt4ku02/b/yFMhIlAfM1oej29F+
         O1xbV4DeSMsZqAE7veXQKeeML3nscn71fuCSuuDE1UtUHYQyKHbRaylU5cWRZ9yC0Lhp
         QvO4hETlqHkrVd8ITRPQi5Ez6X8LxGcH+D/RIN5txeE4dmpVp13lsyM7fx5KsVozbDyY
         RVLg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3WfPHd+KbrBhQFJM3R8AAusJctH2Lxdy+kOOgqxkyRRQoT0U/jXsMh76oqjd7xfj24B3CrcO3OWkOw8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKz5bH/+4PkmHqRt5oSUelg6yH7s6f46FOj7KS14BKE9/l0U9w
	ynk5xFwO7EPUrYhdXxRWQTI5ClVIOEVtBbeG4pQkbs+6uvd2rdiw5CC0
X-Gm-Gg: ASbGncvfmHLzpcuHMviLHTEGWcbBtXr3E9lGuxs51mzjxB486kNCSDmsOllGL63lVr+
	jZFRWaT/k7ZYZUjkeJH7kL9+OXasGQBishcXRlmrSDoDaoLUCbCN1HjeN3JMz3qd2gjZVvfRVxC
	4sR/dFN8a8ZjdT6lZRdkwVGd9EvX75IAYK/Bl0GfW01P4RPVjTAMHvgX4YXOJCne1B+au9iegCx
	BpRhKvU+Kw9RaUI7SD5OK8n5BzLP3H3IvkzOWSyHJQOkmL5AM6QhS2G7Qd1aOKU25RtiUZ783aZ
	nxeUbt0P8AAjgQhSdFnoRALXEItZrmg51uWy48qVX4ba29N/eMw756qprraSieDShybkHITMrpZ
	aHBjf9QnRhZHRU+U8zpfT8ps=
X-Google-Smtp-Source: AGHT+IHiVZajLNzCqasc/a84TFi9Eq0YagQ04C+1iS6aqNPgOjIXzg/tFI2BWhK3viZOkIp11MJmpg==
X-Received: by 2002:a05:6402:13c8:b0:612:b573:f4bb with SMTP id 4fb4d7f45d1cf-612b57401cfmr14728022a12.0.1753112608001;
        Mon, 21 Jul 2025 08:43:28 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f0a0e2sm5675860a12.4.2025.07.21.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 08:43:27 -0700 (PDT)
Date: Mon, 21 Jul 2025 08:43:24 -0700
From: Breno Leitao <leitao@debian.org>
To: Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <crxrexye2nmqebct6eisgkvpc7btrg6ckh5qr7tmhpkdnqys2h@6dpf2j6yhlxq>
References: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
 <20250721135718.GAaH5HPinaKvXjM-1g@renoirsky.local>
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
In-Reply-To: <20250721135718.GAaH5HPinaKvXjM-1g@renoirsky.local>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Borislav,

On Mon, Jul 21, 2025 at 03:57:18PM +0200, Borislav Petkov wrote:
> On Mon, Jul 21, 2025 at 03:13:40AM -0700, Breno Leitao wrote:
> > Introduce a generic infrastructure for tracking recoverable hardware
> > errors (HW errors that did not cause a panic) and record them for vmcore
> > consumption. This aids post-mortem crash analysis tools by preserving
> > a count and timestamp for the last occurrence of such errors.
> > 
> > This patch adds centralized logging for three common sources of
> 
> "Add centralized... "

Ack!

> > recoverable hardware errors:
> > 
> >   - PCIe AER Correctable errors
> >   - x86 Machine Check Exceptions (MCE)
> >   - APEI/CPER GHES corrected or recoverable errors
> > 
> > hwerror_tracking is write-only at kernel runtime, and it is meant to be
> > read from vmcore using tools like crash/drgn. For example, this is how
> > it looks like when opening the crashdump from drgn.
> > 
> > 	>>> prog['hwerror_tracking']
> > 	(struct hwerror_tracking_info [3]){
> > 		{
> > 			.count = (int)844,
> > 			.timestamp = (time64_t)1752852018,
> > 		},
> > 		...
> > 
> 
> I'm still missing the justification why rasdaemon can't be used here.
> You did explain it already in past emails.

Sorry, I will update it.

> > +enum hwerror_tracking_source {
> > +	HWE_RECOV_AER,
> > +	HWE_RECOV_MCE,
> > +	HWE_RECOV_GHES,
> > +	HWE_RECOV_MAX,
> > +};
> 
> Are we confident this separation will serve all cloud dudes?

I am not, but, I've added them to CC list of this patch, so, they are
more than free to chime in.

> > +void hwerror_tracking_log(enum hwerror_tracking_source src)
> 
> A function should have a verb in its name explaining what it does:
> 
> hwerr_log_error_type()
> 
> or so.

Ack!

I will wait a bit more and send an updated version.

Thanks for the review
--breno

