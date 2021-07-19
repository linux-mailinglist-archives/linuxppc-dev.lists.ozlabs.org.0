Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C2F3CEB18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 20:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT9jl4j1fz3bb3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 04:44:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oydbKBWL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oydbKBWL; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT9jG1kB4z2yMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 04:43:45 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id x6so8897320qvx.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=gVSVogAXROTPh3Dssd0UNY8nOlWjhPggt2vXEoxEy3U=;
 b=oydbKBWLfMAN9YjAsnWY1riBcENGN55t7esTwa86bYBQusYt5haJf44rKAdNZgprlR
 NNtNSMrpy0XZUzl6fgTZTIBA62XF2R4XNlMQBbd/FJ/pmzsZvpmjeMsSsBV3kFuRndr/
 KIAYISKEzbnLWgj47t4BrcD+EGmS5zfijzU0zhnKUAYgD3qfakhN+Ufr1W07GABWpWav
 nKqxGYL1aY4W+EyEYa0RCW0CaUteZqhYW4L9NCA8kNSyDvR8eRMYea6yESkA/j+O5Jq7
 lU/GyjEvL9J+Q4NKZoBVVqd1KYexU6bLsvy6LMUneuRyHyeVJnJnyoSg6W7E8/FaEJWf
 /erA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=gVSVogAXROTPh3Dssd0UNY8nOlWjhPggt2vXEoxEy3U=;
 b=Xg9pAb8r7f7iZROJ0qRTbf8FubBiunTl+y+n+vIraMp8nRBIbhVvwgWM/ySKAXjkzj
 Li7tqi61lgGWldXgfn11wJ+EvBkmL/+XHqPuULt2Zd5I4zeWnCa9skAN8v4lpcGk9qhy
 L2d48rCgC8gdjdDaIORSb63hxHIRpADFTtkffvNVPjUyKIjx46zxZy+eRsshP8WHm1yh
 cKcqtuz4tMCCOnjgRQ/urhxsP1hj4BwIT3HNOA/sTjePdqjf0QPl30UgWujR3afCszm6
 vTFbKzBmKyVI2Q9pDiKc2zsgAyRKbOFzfCQ3tuMxoiRvJNLyIzcCWBI9q1waRQeAUXYV
 ohfg==
X-Gm-Message-State: AOAM531YNmbRkIP0oCA04A0g8hDATdJ2Cp4JCRRi686DTd/KpybAUv4B
 wiRZuUJyQ1Iox+h6JNcHF10=
X-Google-Smtp-Source: ABdhPJyHxmWj4jRy+IaYfbUTtp+JlyfSuTdFWpuyI6w/20JYm0iGpz1vIYlNh7ENCzyfsSCrPoqRZw==
X-Received: by 2002:a0c:8c0c:: with SMTP id n12mr26495316qvb.13.1626720220683; 
 Mon, 19 Jul 2021 11:43:40 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id n13sm558843qtx.92.2021.07.19.11.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:43:40 -0700 (PDT)
Message-ID: <c289fe19580ece6941fc74563d301c4fb3ab9125.camel@gmail.com>
Subject: Re: [PATCH v5 01/11] powerpc/pseries/iommu: Replace hard-coded page
 shift
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Mon, 19 Jul 2021 15:43:59 -0300
In-Reply-To: <d96c25e1-41da-881b-da35-87ffb28ce335@linux.ibm.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-2-leobras.c@gmail.com>
 <d96c25e1-41da-881b-da35-87ffb28ce335@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-07-19 at 15:48 +0200, Frederic Barrat wrote:
> 
> 
> On 16/07/2021 10:27, Leonardo Bras wrote:
> > Some functions assume IOMMU page size can only be 4K (pageshift ==
> > 12).
> > Update them to accept any page size passed, so we can use 64K
> > pages.
> > 
> > In the process, some defines like TCE_SHIFT were made obsolete, and
> > then
> > removed.
> > 
> > IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figures 3.4 and 3.5
> > show
> > a RPN of 52-bit, and considers a 12-bit pageshift, so there should
> > be
> > no need of using TCE_RPN_MASK, which masks out any bit after 40 in
> > rpn.
> > It's usage removed from tce_build_pSeries(), tce_build_pSeriesLP(),
> > and
> > tce_buildmulti_pSeriesLP().
> > 
> > Most places had a tbl struct, so using tbl->it_page_shift was
> > simple.
> > tce_free_pSeriesLP() was a special case, since callers not always
> > have a
> > tbl struct, so adding a tceshift parameter seems the right thing to
> > do.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> 
> FWIW,
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 

Thanks!

