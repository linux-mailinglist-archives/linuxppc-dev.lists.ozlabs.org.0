Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92D954B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:58:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFpz43yRzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="pswuKn21"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFJQ1RWdzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:35:17 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 129so2374594pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 19:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ffi2SxRQ+E3PZYurd3qDET06onxGoFR36uGgneUPMUo=;
 b=pswuKn21BEAOTPZmtgFe3mkMBnsnPK68Ayq3xpO84IFIxRmFfZHUpGFGcCitzUSyQt
 /l7cgTHrwqczhd76VaYn+QC9TxpyM/myrhgtU8w0usjJbaXBQl9S0B/ue/98IBDJT+lW
 KtC5dD8knuvVpmuhv+1lzciEBQqnGq9HOR7jCFChvSaTDUNRsVnn8/ogU7bfG5c+Ga9O
 jukN9wd7uy+ahnkfdcR6oXPfTYtsbm7M9lVKp3jut6auVdBAhdZUjoR866aPifel22IH
 SS4VUt/ev2Aqg2cax0eq2ybHlMAfxOeK630J4A7ZS2wJMsjAHCjwcPdp77f65rMaWiA0
 gZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ffi2SxRQ+E3PZYurd3qDET06onxGoFR36uGgneUPMUo=;
 b=j5I4SOw8jxc+ATCid8UGehu0C5sZ4SWROFyKydPxPfVTCWejKzzchlF8z+KjtVnN6A
 3oyBNa+RkOf+zdUJQean8lclALpcnyHLf7m0uxHGdwL0DFI8zuuD5EiRdyX4FcCqetkH
 MdgeMj2lKOHXLJDFA60vUTVjs6O29xFNAcPTDL6HOxqdUD76OZn1gcVz9xkYAHHHIC/z
 /KPr/WKdJUZgXrxpvdHt89WHOl25qUGkwta3Hdb/iB+f8me9lhYf+CB7uPqLJO7ub9/4
 vf2UP2CvWhVtnCcQ42nWOaqU9sYCn/ux5le8kXGo45cJS3NXn2wVLF9jZLKDQ7xruHEQ
 Cy2A==
X-Gm-Message-State: APjAAAUrpiOeZEtzGNsp8DZKxXnn+o4WyoEXtGMLQXfTunp8rUlUNduc
 c3XjiUMeXfa1fNBfO4yDc+WIAVoiBxo=
X-Google-Smtp-Source: APXvYqzeC0Cp8Jv1qUjtr6ALhEoYw335xsxuOa0VExg8ouNLHw/ZNf9F0FpGMH/8qK0E79rnMrlKDw==
X-Received: by 2002:a62:db86:: with SMTP id
 f128mr26983286pfg.159.1566268515781; 
 Mon, 19 Aug 2019 19:35:15 -0700 (PDT)
Received: from localhost ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id p1sm17788849pfn.83.2019.08.19.19.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 19:35:15 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/3] Add bad pmem bad blocks to bad range
In-Reply-To: <20190820023030.18232-1-santosh@fossix.org>
References: <20190820023030.18232-1-santosh@fossix.org>
Date: Tue, 20 Aug 2019 08:05:12 +0530
Message-ID: <87a7c4pnrz.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Chandan Rajendra <chandan@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj <santosh@fossix.org> writes:

> This series, which should be based on top of the still un-merged
> "powerpc: implement machine check safe memcpy" series, adds support
> to add the bad blocks which generated an MCE to the NVDIMM bad blocks.
> The next access of the same memory will be blocked by the NVDIMM layer
> itself.

This is the v2 series. Missed to add in the subject.

>
> ---
> Santosh Sivaraj (3):
>   powerpc/mce: Add MCE notification chain
>   of_pmem: Add memory ranges which took a mce to bad range
>   papr/scm: Add bad memory ranges to nvdimm bad ranges
>
>  arch/powerpc/include/asm/mce.h            |   3 +
>  arch/powerpc/kernel/mce.c                 |  15 +++
>  arch/powerpc/platforms/pseries/papr_scm.c |  86 +++++++++++-
>  drivers/nvdimm/of_pmem.c                  | 151 +++++++++++++++++++---
>  4 files changed, 234 insertions(+), 21 deletions(-)
>
> -- 
> 2.21.0
