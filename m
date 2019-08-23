Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D89A728
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 07:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F97m2vS7zDrgk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 15:34:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F95r1rc2zDrfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 15:32:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="P8HigVev"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46F95q6CgFz9sDQ; Fri, 23 Aug 2019 15:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1566538367; bh=/vm4RWX8jxrnP7cIg16ozDOrP8OuPgLDgomlE32zxpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8HigVevzTu+3Tb//Q1o3LAWFtPM7klSM61MKFFh8zFR70YFK0za4auOtyoPWaErv
 TTRMNU3BgsKp8kzMvE+09FLNs6cgbqcoy+3MbP6fz3epmKSub/oBfZE+3y9xGxL8z3
 HUifoYQSKeLourEy4BOtd1iIWvPzGbYf4W24ZHMCOeNr3EDs7YMRaNF16ekT9RQfGF
 +UphyLJafV6Q+sQWMNUZL+kkggVV2Iy1Ey54S1nDR+MpAh1qaOPGwduDtof0SeLHz9
 bl1d+Mx9pKp6VS4mH0VZSV5HXOIpcRQxeLO+v/1TpTthBNlSRb+/VniheK9AyXaYzi
 5k5d8XDbyGDZg==
Date: Fri, 23 Aug 2019 15:32:41 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] vfio/spapr_tce: Fix incorrect tce_iommu_group
 memory free
Message-ID: <20190823053241.hogc44em2ccwdwq4@oak.ozlabs.ibm.com>
References: <20190819015117.94878-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819015117.94878-1-aik@ozlabs.ru>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kvm@vger.kernel.org, Jose Ricardo Ziviani <joserz@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 11:51:17AM +1000, Alexey Kardashevskiy wrote:
> The @tcegrp variable is used in 1) a loop over attached groups
> 2) it stores a pointer to a newly allocated tce_iommu_group if 1) found
> nothing. However the error handler does not distinguish how we got there
> and incorrectly releases memory for a found+incompatible group.
> 
> This fixes it by adding another error handling case.
> 
> Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Good catch.  This is potentially nasty since it is a double free.
Alex, are you going to take this, or would you prefer it goes via
Michael Ellerman's tree?

Reviewed-by: Paul Mackerras <paulus@ozlabs.org>
