Return-Path: <linuxppc-dev+bounces-7410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B82ACA77859
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 12:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRk6Q5VQ6z2ygD;
	Tue,  1 Apr 2025 21:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743501678;
	cv=none; b=URStPNorp87RA7BdR7ue6TUTkze+uj/mVnjPq1zdPXeq+o4UR70u+YlqUUqS7Y3tHuIqZvdC7/yT2EC9VXNqoaCwucF8NFXSRxVZ0VdxP+fTPwYUgxIkQPhccgG8yXp2an0L1FmXGjj2rcmVutanfqigsxjYRm56wX9HRi3HZniYHzUBbwa21x6gwAr9xw/EmtpPlD+EyU1qQxRxp7tfPoQxtO0PM35WguTV9IbKgpLICbr5var8Gg7+kaKKlO1WHOr4dvahIMDHK1B6Ye7s6dTiHposVwyGkuIEXppni6Swf2lZd6abgGaVla2ZxXpoHOFQC5yhd+Kc319hgvwy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743501678; c=relaxed/relaxed;
	bh=AX1uIVrD2v6civ+pQ1CbMNYhfPammCmo0KjBShYI5tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5KgUPOotH75dw69MxGiRtEHmc/UpJMCYdfnrmu+CRU0gLXdcCK8fjhsY7G8YJGpYasZG20cvY3Drh4XoB2MSKBFWLujmlk7xA+qRvHC6BEjKpyRxYp7+CWPJKOy/Pd3D85Recss2C1Lw82KizJdMx2yblUV+Brueh/qbX8wia2cat/nx7vwl2JSSwKG2UoGDcuxOx3mRiKDF4wsiNXf+iXZx8em/KBzD+E7/mZbLl4tvMNWF9/Yqy05hhC3ZS3/serSDVWjtTLDPhV6vSIeJVvoIGsmlzb1pggAarRxChPOhKbKMTROTwekw2tconkFtzYgjc84WlkFgknIqtCnYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SdHIdcFv; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SdHIdcFv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRk6M2qFSz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 21:01:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A832B44D14;
	Tue,  1 Apr 2025 10:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132B7C4CEE4;
	Tue,  1 Apr 2025 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743501671;
	bh=TwUbtSRE2uBDBgVN4rSVrh6kpB+iNKhibBxhdi/cMDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdHIdcFvOSiijk/430tmyjjw/BhUNHk1XOoC0zsmJgAU1Q65zCDFmLiI5OIxTBGBm
	 heFQYAuhqbaF/wSyiI2z4NnDB06DI23Dj1gAO1EbkZtWpSnHLx31xJ3spoO9vhY6Cy
	 Wq8hZYNZ0Ho71P32LWoLUDCuvcN+qfbkd49XzX0a1fgxcj/rh59Br7R9VDN7s3S6bD
	 +aDz+AkFea8iCbAJwIdMuug2rNCjhd+AuY5NhwfJiTaHtg0Be32c6inLqL44JYbRXl
	 VS97PU11K8hcxDEWhIQtpFTjnB3nLuaZ3S9TOCzo9pSdZTkvxcO8h7uodPNhSWmxyw
	 +r68t1VpcwK9w==
Date: Tue, 1 Apr 2025 11:01:07 +0100
From: Simon Horman <horms@kernel.org>
To: davemarq@linux.ibm.com
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH net] net: ibmveth: make veth_pool_store stop hanging
Message-ID: <20250401100107.GD214849@horms.kernel.org>
References: <20250331212328.109496-1-davemarq@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331212328.109496-1-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 31, 2025 at 04:23:28PM -0500, davemarq@linux.ibm.com wrote:
> From: Dave Marquardt <davemarq@linux.ibm.com>
> 
> Use rtnl_mutex to synchronize veth_pool_store with itself,
> ibmveth_close and ibmveth_open, preventing multiple calls in a row to
> napi_disable.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> Fixes: 860f242eb534 ("[PATCH] ibmveth change buffer pools dynamically")
> Reviewed-by: Nick Child <nnac123@linux.ibm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


