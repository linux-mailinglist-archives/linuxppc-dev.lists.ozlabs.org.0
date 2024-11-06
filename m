Return-Path: <linuxppc-dev+bounces-2893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461729BDACD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 02:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjn2J6sBzz2yLg;
	Wed,  6 Nov 2024 12:00:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730854856;
	cv=none; b=mAUuoO56JmjG4CilmQaL/xo53nMPyEr+k2CaujZj+sdxHoxJnYQabb0BE3pgRsLmcjTMgYVXBnf16FuUzlBJD66lxJTo1Yv5EZbG28wfixA/Tq19GqIyIvqUW7T0gulWFrkUaogL+Gu+sHaqGCsG/yzg8+sUzcy92wHVoFnhXN06bNU6ks86sbaMnV1gbKHYlyFTFcmJolvOsmRvnYuozI31o0QkheE1N4pxcoCVC5Hta8oh1TWEM/nbrmgeeN1mHICBf6HLRlVvWsoGotAymWLiUljCfDLDklpaNpmx0INBljGA/jCABvTZAtlXl6pFeaBug0D2F7QuPETXRkYZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730854856; c=relaxed/relaxed;
	bh=LMlH0g+4qQ4OGP6MLRSf9K788q8uLfk7t7uCIz5/bzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C4MKMWuXYB/YqpVoAd27VS1QkZA0OHeQQjcGxLUmQK1vKlv/zH/gZRzPZitSypdj5cSJi+xRC6UdhUQWw5S8ip4hH6OWyJYH8oRYOkp48yD2DtuL+HlT1dSV+3SvWlupiUNpcz9kh8TF/JmGhBGz49UOSjDZeTYr40dlP9rpNiStqPBpovvgBmc4VDiK9CzJ1mHRMOyQOBnx2bmJ1Jd42YpFBZQ+uBhWLmu/s3KXmbARPQQLWT9bDEtDk3/dgqNTFOHw7LgKIpVGren957Xm0AgyY4ZvfLCJQCMm8U54lUcFn1Wjh46nptJJisobg9M49vmGcLsVYYruAyXFnDOqbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JEsGig4D; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JEsGig4D;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjn2G57YSz2xqc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 12:00:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730854844;
	bh=LMlH0g+4qQ4OGP6MLRSf9K788q8uLfk7t7uCIz5/bzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JEsGig4DCP63nvbgdEs6PnxcR+MECBZZxmYY5k+78SesGTz7IAWTvWHUpoGVvnX4k
	 PEufyOv7GLpGbGFCQPMJT4KarwvwhyJD1gVDxT7PoxvJkAlByAdKs+kBoPFBG7YtSo
	 sWlqWua1Ej6T43jCWNkHhlWqa3i9AsxM3hskTdKKFjnFJg8UgIBGGCPT8UdHuNvcFC
	 mFWoen6pOxpqh+ztBNA7GJ0T/1M8BZEPJhlVGI+2p5giVhf1hme5QspkoQw6wL5K8H
	 yDZ1K+JHPHLveH1zylFPIwyXqQYERr0KXF2XMtrJwJAqJysCfNKMNr85w4pG+2OdsU
	 xuIfrRoSvDPKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xjn233DGGz4x9G;
	Wed,  6 Nov 2024 12:00:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Khrustalev <yury.khrustalev@arm.com>, linux-arch@vger.kernel.org,
 acme@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Sandipan Das <sandipan@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, nd@arm.com, Yury Khrustalev
 <yury.khrustalev@arm.com>
Subject: Re: [PATCH v3 1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
In-Reply-To: <20241028090715.509527-2-yury.khrustalev@arm.com>
References: <20241028090715.509527-1-yury.khrustalev@arm.com>
 <20241028090715.509527-2-yury.khrustalev@arm.com>
Date: Wed, 06 Nov 2024 12:00:42 +1100
Message-ID: <87ttcl89c5.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Yury Khrustalev <yury.khrustalev@arm.com> writes:
> Memory protection keys (pkeys) uapi has two macros for pkeys restrictions:
>
>  - PKEY_DISABLE_ACCESS 0x1
>  - PKEY_DISABLE_WRITE  0x2
>
> with implicit literal value of 0x0 that means "unrestricted". Code that
> works with pkeys has to use this literal value when implying that a pkey
> imposes no restrictions. This may reduce readability because 0 can be
> written in various ways (e.g. 0x0 or 0) and also because 0 in the context
> of pkeys can be mistaken for "no permissions" (akin PROT_NONE) while it
> actually means "no restrictions". This is important because pkeys are
> oftentimes used near mprotect() that uses PROT_ macros.
>
> This patch adds PKEY_UNRESTRICTED macro defined as 0x0.
>
> Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
> ---
>  include/uapi/asm-generic/mman-common.h       | 1 +
>  tools/include/uapi/asm-generic/mman-common.h | 1 +
>  2 files changed, 2 insertions(+)
  
Apparently you're not meant to modify the copy in tools/, there's a
script that does that, which is run by acme, see:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

cheers

