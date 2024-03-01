Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200986E2AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 14:46:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=ZC6s+vYq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmTs41CGHz3vdm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 00:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=ZC6s+vYq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmTrF5wFbz3vX0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 00:45:47 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so3458940a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 05:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709300742; x=1709905542; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tVgbEQ4kyQbtblCUPkOlRv+wZVI/qCCBeziGpPNTTHM=;
        b=ZC6s+vYqdUpRGOt16I3Ke6tIT+bogNbdBNfauA2NWPPgYShcDz27hdUroRWeOXKPrx
         +CcepSqLS09PxNRqj8IoGvyV6B1uJdVyX9cztxXymKvn8BtfmvnWyELryHj2IE+wcJdz
         LszpYmXE7FmfPYbet/m3ZzzJPUjJAnLxg/kbmclc8s7vGIxRSjWQ7aQW/AyukfZ+P1EI
         h+J2DLaatpvG0naCiQHn2Ao7lWtJsEpvQORVBWnAGJK+nMyobKJM5/99WqYzlFlfBTHP
         88wq/scApEe+Cn+F5q8idOvCvxw3rWyM/Nt2fUUh8Figb7X/Ggcw6TNmo6t0PlhEaenm
         1CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709300742; x=1709905542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVgbEQ4kyQbtblCUPkOlRv+wZVI/qCCBeziGpPNTTHM=;
        b=s67+F/1sAMIMkvez2Rv/LrCf/3DqQkHz3Gw71eqSKcHvAAAYV4bkc3DYLWPAzXTMP5
         A/D7VaMFCyT5aUk+2WQWYaHDFhjaZD3799cMJAgC+Mvk1sLyzz60OuAC61K4WBeNzRg+
         imgTMNATorC+I3G4PdxCRAAgrAfHh8UqFTfVqTkUwayTkPtUBlPlmR/31yv4qUAo+Si/
         2KdTz6pT39pZvGjJIadqOzWRki0CVZtYwsjlSzSMHXy32KXDFZm9a0slD7QrOp8sPRan
         B+WRSQlMHU/x31eBbY7f+dK/Ta9KA89aGQu3vjxfpMG3BvROBWw774KtTkBV81bvtTA7
         u5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJDtgo1tDyEwmFNvF9wjB7Na6PGAVcnBFYS07yQ/XuuXyzv96+23ttB78s3jo9P1aOvC4F/Ir2OmnBs/hyFAP32k1vXG0OMha1wnZhFw==
X-Gm-Message-State: AOJu0YzTZ4eoscctkI6d6CCJ5mwq7qmvVAuLZKsW15R5KzB8oy3LbV/X
	9a6lS8fvZcNGR29g7WDZUeggsYfHGSYOCjxRBG35fd6mqVLmXsM3ERl0PLEZr4M=
X-Google-Smtp-Source: AGHT+IEUmgSAurOUDe9d1ZRfnCdJozDY6XtBUZXROZY7Us5XumAjIbS9btAdtfpRWlh4RA5xIiOf/g==
X-Received: by 2002:a17:906:b84e:b0:a43:292c:7c38 with SMTP id ga14-20020a170906b84e00b00a43292c7c38mr1231239ejb.14.1709300742389;
        Fri, 01 Mar 2024 05:45:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lb24-20020a170906add800b00a4131367204sm1704722ejb.80.2024.03.01.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 05:45:42 -0800 (PST)
Date: Fri, 1 Mar 2024 14:45:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
Message-ID: <20240301-65a02dd1ea0bc25377fb248f@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
> On 26/02/2024 11.12, Nicholas Piggin wrote:
> > Add basic testing of various kinds of interrupts, machine check,
> > page fault, illegal, decrementer, trace, syscall, etc.
> > 
> > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > can be incorrectly set to 0.
> 
> Two questions out of curiosity:
> 
> Any chance that this could be fixed easily in QEMU?
> 
> Or is there a way to detect TCG from within the test? (for example, we have
> a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
> tests that are known to fail on TCG there)

If there's nothing better, then it should be possible to check the
QEMU_ACCEL environment variable which will be there with the default
environ.

> 
> > @@ -0,0 +1,415 @@
> > +/*
> > + * Test interrupts
> > + *
> > + * Copyright 2024 Nicholas Piggin, IBM Corp.
> > + *
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
> 
> I know, we're using this line in a lot of source files ... but maybe we
> should do better for new files at least: "LGPL, version 2" is a little bit
> ambiguous: Does it mean the "Library GPL version 2.0" or the "Lesser GPL
> version 2.1"? Maybe you could clarify by additionally providing a SPDX
> identifier here, or by explicitly writing 2.0 or 2.1.

Let's only add SPDX identifiers to new files.

Thanks,
drew
