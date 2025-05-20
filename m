Return-Path: <linuxppc-dev+bounces-8732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBDABD5C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 13:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1sCY2k6Mz2ySf;
	Tue, 20 May 2025 21:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747739113;
	cv=none; b=djQQ5rICPai/XNMof/X0Aje6SjBfFwWkjqkhIC3fsqpb7O8PZ5tBhM6isJQuOxLunR93wUhun8GuxiM1kwAp6K2uSfpeno0F0rt1l9fZ+V2uu4igI5vMSygrAlNN14mofIPMcQo2gysXNEaGnJhYK4eNw6LZ9Hm9asV97On3hb+gt1rli1ubPOsqspwsE7YVumnlegodQBRSDxOUQ3L3Iu+ICIFiGC02Hy57u5VGVzU9WnfegSCDlRU/tvUhgbHAutjBAx4XpjfPTC7xu41hbi3lKmzTaRIWI3yiBUiWLRqR4CyixDMvG5GEv/cr97hmnLcU60A6bPLVx/6QAhEruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747739113; c=relaxed/relaxed;
	bh=H/Rusjr9wTndlEZPfIkE0YN92i4aaeYkw976ZduqJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxFJMi7Pd71dYmrHbFSfGxuwOz33OFu5VXUIvwiZ0rB1D+v7B6gQXys5/f3a6zXg3wBZRQa8yshQY+l84BpdEcbJl3ibTvaaRxJ3+/US8HYbmSEUF3615Bon7Tdjxwmwiji9EKKJh60AZ9rbBaIk2RxlM0mHs9HXxBohdR4a0cXoMsmMGvlcBeAHyefwiH5Eer7wLfF2QJ+AlSxhpaoKhgAoToEGq8IydQ+G+rXmIsJHUjEj4Xc8bbkmi5SvcpVyDjKes9I7JrYBnCGn63xAP0GNNkkdzBbBipHaB95MOVNcaAUcI9OLvPpsfGRikGoDw3BulEdrbGtAYFYQIfaV6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nrgUP7hf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nrgUP7hf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1sCX1rchz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 21:05:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9651629E1;
	Tue, 20 May 2025 11:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF75FC4CEE9;
	Tue, 20 May 2025 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747739109;
	bh=dqzHqbI45drYiJcBhZWpXVC3zrDHhjThfa+aqxLgwrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrgUP7hfhz5mXv2m1/f+QzqIHK72xfHiTHCMO0Sau8GbC1B5LyHb3dOKygYBk3yjF
	 1WAGBWIES+DRDo7d8Xq6AcTD6DeCUf1iL55Y7j5jxHkR/L1Sd7loUjy5zMwYHIit8t
	 wV8YCDAakvMjTrDzrVTlYo3C24SCx1kf71Ce/rHc=
Date: Tue, 20 May 2025 13:05:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Remove
 myself
Message-ID: <2025052056-disarray-blitz-acb2@gregkh>
References: <8734czh8yg.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <8734czh8yg.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 08:28:55PM +1000, Michael Ellerman wrote:
> I'm no longer able to perform this role since I left IBM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index 0e19d2f0d6bb..da6bf0f6d01e 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -290,7 +290,6 @@ an involved disclosed party. The current ambassadors list:
>    AMD		Tom Lendacky <thomas.lendacky@amd.com>
>    Ampere	Darren Hart <darren@os.amperecomputing.com>
>    ARM		Catalin Marinas <catalin.marinas@arm.com>
> -  IBM Power	Michael Ellerman <ellerman@au.ibm.com>
>    IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
>    Intel		Tony Luck <tony.luck@intel.com>
>    Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
> -- 
> 2.47.1
> 
> 

Thanks for the patch, I'll take this through my tree.

greg k-h

