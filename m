Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CCB3FCED2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 22:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzfT359w3z2ymb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 06:49:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OPzpmN8i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OPzpmN8i; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzfSM6pl2z2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 06:49:22 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id a66so796751qkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 13:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0XGq0QWFCnzYO26yFWXj5mnRnRTvlRa41ppVOuxHxJw=;
 b=OPzpmN8iojb71hEsYdQswFgRF9J5uQa4An56DALbmyvZw6zJCR/N8Q6ipsBdsFV2M3
 MmPKYVkEgHeOL711NOoxm4vRV0ZpnAmOFR2Zn/5vnLtSM4TBvzoBuQ1dCa+5xCTzcy4T
 YXtZhbysJ3yFxd4kXf7oCr2LfWoSx5zAJMHS5KbGIPzvCzXf9EeHPa9JSji2fs9CsbKj
 vp35vzB5nH0/g4LS5we3vACD2iPRT5T2XTqUKvcDP1XTBeWgyzgsaAXT66+CRfmOqiyn
 fl5hr8udJncyK9g9khAmpIOgwuEUjL1yTA+FfAIv11tQsET/e45BQOr9CwCOtvie93wo
 +DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0XGq0QWFCnzYO26yFWXj5mnRnRTvlRa41ppVOuxHxJw=;
 b=R09nAShrtX/rEo1oSYmS0IoaavumkknxZRK4nu0Q4UXxNpTz/tUomUBLAceWAYcYnR
 CLQ/2yrtpLWCuEtK6LcRsevN3pYt/q68xp13/JSnxnDIrORbIPWbtvreN4TyrIKTiOeb
 AFzPxTG1yiEpri5DhIgWiaMgC6uRLE91VGVBURaAE8JVI3kHFCo5XCTNt2ZF47F2hrPZ
 bBb54o4VDIMDzvnSfTYIzPjmw/cmKvEmNcOcCpC4kaNRT1V8Y61GJ+6jk7GkTmeinrEP
 3FBbnIcfQbJ3lHTo/zK+pnpKZjDgHkBrGhHSE8vf3rnUowuHtEA/6ZklBwTHf49xHu/E
 JXoA==
X-Gm-Message-State: AOAM530lr5j/s2if6LG0m4CwzzfJCrHccsYWhgBrI2vVVHrs7koGoCw4
 AbLXP0Ou2qVxiQJh5rGywqk=
X-Google-Smtp-Source: ABdhPJzHNi57SmFcQgygfZZHQNyCxnxCZeGp0wu/IiKtXd+dWkDZkVnEU/lmwwE0ENmjHdWWIDCBDA==
X-Received: by 2002:a37:a853:: with SMTP id r80mr4977523qke.326.1630442959347; 
 Tue, 31 Aug 2021 13:49:19 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f1:e948:8e69:9cd6:5512:12f4?
 ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id x27sm5300509qtm.23.2021.08.31.13.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:49:18 -0700 (PDT)
Message-ID: <dc80ad61dbd52a3fda5cd47ab5e60e45009b511d.camel@gmail.com>
Subject: Re: [PATCH v6 00/11] DDW + Indirect Mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: David Christensen <drc@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Frederic Barrat
 <fbarrat@linux.ibm.com>
Date: Tue, 31 Aug 2021 17:49:36 -0300
In-Reply-To: <311ece8f-bedc-b3f7-0d1b-2cb78438890f@linux.vnet.ibm.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <82ca56ab-6a0a-7cbb-a5e7-facc40f35c3c@linux.vnet.ibm.com>
 <e867b4ddce01adf318bc8837c997ceb64e44c1c5.camel@gmail.com>
 <311ece8f-bedc-b3f7-0d1b-2cb78438890f@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-08-31 at 13:39 -0700, David Christensen wrote:
> > 
> > This series allow Indirect DMA using DDW when available, which
> > usually
> > means bigger pagesizes and more TCEs, and so more DMA space.
> 
> How is the mapping method selected?  LPAR creation via the HMC, Linux
> kernel load parameter, or some other method?

At device/bus probe, if there is enough DMA space available for Direct
DMA, then it's used. If not, it uses indirect DMA.

> 
> The hcall overhead doesn't seem too worrisome when mapping 1GB pages
> so 
> the Indirect DMA method might be best in my situation (DPDK).

Well, it depends on usage.
I mean, the recommended use of IOMMU is to map, transmit and then
unmap, but this will vary on the implementation of the driver.

If, for example, there is some reuse of the DMA mapping, as in a
previous patchset I sent (IOMMU Pagecache), then the hcall overhead can
be reduced drastically.

> 
> Dave
Best regards,
Leonardo

