Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E33AB55A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 16:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5P2l0MdXz3c98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 00:05:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lUWkoeD4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lUWkoeD4; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5P21271hz3byJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 00:04:40 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so6171012pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m08QhGbjsqNMKDfakqlQtcqTK06PXTezleRaulhxGzY=;
 b=lUWkoeD4MiFsevJjayo/38vNE7ZcF3Oxzw/b1Q07FkRc7ABIzvQDeAtOro7WvCfVrO
 +VJiaMYJWwbbZat1lQItgBdYyGP9y7+FW4bSanRqQ+5ocg8rG6DhPe63YNfFFMucSoq/
 1dwu701UdFYBSLnDG01vwkNtz5Ll7cMqNVi2HgAosjZ+h/TcBaznbunrF/ePq5Ki2nas
 mpJ+ADs4ZeMjYHk4HBtHkQ5PHbNQyAOcC6+SzcpJkxox/ri31d301yaoSmcy/5zcJnl+
 iIgVGGd+lg7Rc02efWHJigJQDevZu4jTyPSQoCg626+ngc5b4j9YIYIkqhKSsoy7qgYd
 6C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m08QhGbjsqNMKDfakqlQtcqTK06PXTezleRaulhxGzY=;
 b=gq8yuZVYFaE1fwoy1OHoIptwCUoFNtz5G2k7bUsEJH71KNZL2n1t0/9AzaeM2aFsC0
 TKJGlqZmwYx56Oxv0CnE0ubA+eiRYf294MSnw1ET/8sz7EchBdsbEmovvu+3oRIeFxaS
 p40UMXFPDSM6hHjP4hdynSF5k06Mr+OC5faAgpbycV4sQ7mVqhwym8QVAL2U7Us2o01P
 gng75H58z4s+aIElzrHVWLud+4MHG169g/XiIiY3spGStZsB6YSV95MjhFI0Xbn7cgIS
 yaQRcsIvn53q+BaUlpwpwNe8vQzL4QsEyTAUvi1hXEuPKPiqJTxJHN7MCjj/otj71M6W
 A1Mg==
X-Gm-Message-State: AOAM530g+gC7vNG5XruJd/KDj8yxh3nR4OafXHIC5g2s9+Zo7hPZ/UCy
 csnvfavj+GHyti8tfn45MXw=
X-Google-Smtp-Source: ABdhPJw3GdT62IZuD4bx51NMgvLf/wsXCZbpE/gH+uomRAWk1xAMH0zRsTzXvPIjNue6X91FmIaDAA==
X-Received: by 2002:a17:90b:4b49:: with SMTP id
 mi9mr16281017pjb.219.1623938676419; 
 Thu, 17 Jun 2021 07:04:36 -0700 (PDT)
Received: from localhost ([61.69.135.108])
 by smtp.gmail.com with ESMTPSA id c5sm5652006pfn.144.2021.06.17.07.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 07:04:34 -0700 (PDT)
Date: Fri, 18 Jun 2021 00:04:31 +1000
From: Balbir Singh <bsingharora@gmail.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v15 0/4] KASAN core changes for ppc64 radix KASAN
Message-ID: <YMtWb2HJx44HdgQC@balbir-desktop>
References: <20210617093032.103097-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617093032.103097-1-dja@axtens.net>
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
Cc: elver@google.com, aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, andreyknvl@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 07:30:28PM +1000, Daniel Axtens wrote:
> Building on the work of Christophe, Aneesh and Balbir, I've ported
> KASAN to 64-bit Book3S kernels running on the Radix MMU. I've been
> trying this for a while, but we keep having collisions between the
> kasan code in the mm tree and the code I want to put in to the ppc
> tree.
> 
> This series just contains the kasan core changes that we need. These
> can go in via the mm tree. I will then propose the powerpc changes for
> a later cycle. (The most recent RFC for the powerpc changes is in the
> v12 series at
> https://lore.kernel.org/linux-mm/20210615014705.2234866-1-dja@axtens.net/
> )
> 
> v15 applies to next-20210611. There should be no noticeable changes to
> other platforms.
> 
> Changes since v14: Included a bunch of Reviewed-by:s, thanks
> Christophe and Marco. Cleaned up the build time error #ifdefs, thanks
> Christophe.
> 
> Changes since v13: move the MAX_PTR_PER_* definitions out of kasan and
> into pgtable.h. Add a build time error to hopefully prevent any
> confusion about when the new hook is applicable. Thanks Marco and
> Christophe.
> 
> Changes since v12: respond to Marco's review comments - clean up the
> help for ARCH_DISABLE_KASAN_INLINE, and add an arch readiness check to
> the new granule poisioning function. Thanks Marco.
> 
> Daniel Axtens (4):
>   kasan: allow an architecture to disable inline instrumentation
>   kasan: allow architectures to provide an outline readiness check
>   mm: define default MAX_PTRS_PER_* in include/pgtable.h
>   kasan: use MAX_PTRS_PER_* for early shadow tables
> 

The series seems reasonable

Reviewed-by: Balbir Singh <bsingharora@gmail.com>
