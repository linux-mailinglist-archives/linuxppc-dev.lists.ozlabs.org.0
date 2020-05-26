Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BC1E1CCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 10:01:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WRH91TNlzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 18:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WRDv5nNhzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 17:59:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=qKvFKOr4; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49WRDv3x0gz9sSs; Tue, 26 May 2020 17:59:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1590479951; bh=y9Dh8QD2sldowdau5z37SlPA9CE0uXq3c+Lcs+yQous=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKvFKOr4bi6PBmH5CPpjSHqLaLsfjMJlHFldlHQBVeS+7XcOjYOfYTH4di0pdc7Hi
 FVViWy67aZlWPBRAQGPlYeSxhJYnxAMg6tUrxM7ujmP2xoQhgf6Mx0UN0vM1hJeY7t
 JvM8uJJGbFh2/CAEX/ygfnuoL2sIBrm+X2QAxmHRutXk9tH3mjlx6udhTPxaPT9II6
 VPTxAVMeS3Kg+Ml9CWLC5I2cKQR8ZvZT9IzeTqwbN1e+m7RnnK2SqRIwmruJYzVQ3a
 qOnWFZnPedUSiv7IL6wWd3+Wx1GF6WRLG0IndceBboMAoFmwEvQbSFUs7V1n+5okLr
 6ncWU8VKADeHA==
Date: Tue, 26 May 2020 17:59:04 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [linux-next PATCH] mm/gup.c: Convert to use
 get_user_{page|pages}_fast_only()
Message-ID: <20200526075904.GE282305@thinks.paulus.ozlabs.org>
References: <1590396812-31277-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590396812-31277-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: mark.rutland@arm.com, kvm@vger.kernel.org, peterz@infradead.org,
 linux-mm@kvack.org, jolsa@redhat.com, sfr@canb.auug.org.au,
 Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com,
 alexander.shishkin@linux.intel.com, mingo@redhat.com, msuchanek@suse.de,
 John Hubbard <jhubbard@nvidia.com>, kvm-ppc@vger.kernel.org, acme@kernel.org,
 namhyung@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@linux.ibm.com,
 pbonzini@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 02:23:32PM +0530, Souptick Joarder wrote:
> API __get_user_pages_fast() renamed to get_user_pages_fast_only()
> to align with pin_user_pages_fast_only().
> 
> As part of this we will get rid of write parameter.
> Instead caller will pass FOLL_WRITE to get_user_pages_fast_only().
> This will not change any existing functionality of the API.
> 
> All the callers are changed to pass FOLL_WRITE.
> 
> Also introduce get_user_page_fast_only(), and use it in a few
> places that hard-code nr_pages to 1.
> 
> Updated the documentation of the API.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

The arch/powerpc/kvm bits look reasonable.

Reviewed-by: Paul Mackerras <paulus@ozlabs.org>
