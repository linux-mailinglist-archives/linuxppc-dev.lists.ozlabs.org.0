Return-Path: <linuxppc-dev+bounces-9446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22FADEFD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 16:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMmZm4JZcz309v;
	Thu, 19 Jun 2025 00:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750257536;
	cv=none; b=iuCom2e2dmynNefPC3QAMH29wEgyQwPXAkuJtDjj+jiFopLfwSs7u7GHqL1tREin5GqIz8pwyzq0BulWHTKFrFua3HidXScbMAOygzB2FvIfts9hK6JcvEP9sNPOw4/I8yol8oaPeZooUjCTSsqbHHNz1SOL+9G8nlpFyk0ZZ8n83RnrwUaZisefmueOLSgF3uPoCpxcwjpkIp5AUonDHkwBkySndN/9Gk+53P7NtiYRucidj7JwDiJQCFx8RGk+qmjrykLJMVClHt5wWWZnwpeA9omXwsD5MQb33HQcBhkIGkLmrmVq+ebtzkmInuzTx1Wfg9FPO87LmSFU5/MJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750257536; c=relaxed/relaxed;
	bh=G86THoiXntuE9nvymU0mSTPHnod5BstLl4/8jMQvSug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aY19l2r6ni6tKDBXzVSA0xYW1AvhuT40Wu+BULPwLNtXBakGKWTeQ9XWZwMHbY8mPIgCoAg1PkHKiabkDVvQfgE7A7K5Uil8Y4tuOW+ndnHGKxTHKN+/YmxSaGa5MrbjmXErW6CG3tUsxLerVK88ybMW6ehU4UZUp/ciKRoH1HosnWvSRYLcQIu2sSqCi2XgRDh0jB5No3mI5pg+XrkAuamB3m5Jah4hQ7udktrxSyS166zGWyC81rRID+tcuPkXIRx0oTVQiihqb6L8LKDPTi8BrGS75fqvZ4TfuXpZtLHvlVrRhvB1XWA9wkblBwRJOM3isDrw4318tvqZqIOtZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eJxVsZDR; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eJxVsZDR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMmZk5QSDz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 00:38:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A23349FB1;
	Wed, 18 Jun 2025 14:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176A2C4CEE7;
	Wed, 18 Jun 2025 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750257530;
	bh=CCQrJPOlFziorEEXSMhBVKx2aRs57L92oZtgRiKhIqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJxVsZDRTKouuvSstIFHZTCgc7qzBVQwUEQir+LRrdHu+CjVbgoKy2m+kIaK4b/CP
	 aaDfkRyydh1wQSPETvwShjUUKninKcZ2cXavYMnxuIQ3f1OcdEvlAeCKjaGhXy2RfR
	 PzoOv8YTZVikaoB81rV+TndZMkgZFDHsOLH5i3T4=
Date: Wed, 18 Jun 2025 16:38:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself
 for Power
Message-ID: <2025061841-tidal-commode-3653@gregkh>
References: <20250614152925.82831-1-maddy@linux.ibm.com>
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
In-Reply-To: <20250614152925.82831-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 14, 2025 at 08:59:24PM +0530, Madhavan Srinivasan wrote:
> Adding myself as the contact for Power
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index da6bf0f6d01e..34e00848e0da 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -290,6 +290,7 @@ an involved disclosed party. The current ambassadors list:
>    AMD		Tom Lendacky <thomas.lendacky@amd.com>
>    Ampere	Darren Hart <darren@os.amperecomputing.com>
>    ARM		Catalin Marinas <catalin.marinas@arm.com>
> +  IBM Power	Madhavan Srinivasan <maddy@linux.ibm.com>
>    IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
>    Intel		Tony Luck <tony.luck@intel.com>
>    Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
> -- 
> 2.49.0
> 
> 

I'll take this, thanks!

greg k-h

