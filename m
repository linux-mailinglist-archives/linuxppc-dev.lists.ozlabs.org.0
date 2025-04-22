Return-Path: <linuxppc-dev+bounces-7896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E40A968FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 14:21:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhhD03xwYz3bdD;
	Tue, 22 Apr 2025 22:21:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745324464;
	cv=none; b=T1yygPIulDPNw8qEGKRAmmlMcv76qD812hAb/xJJ4dQQiRPmVjvfWatFqmlMb8BSkUeTrpcfraN265PHZryz0Km7NwSxUJhwkafZg1wpj4q0xSBJqYX/mFkpUCHypWswnMCrQThErC9am9WCIpgbDHSZwbDM6jXZeZFqPgK8cCtD21aLLP9m2aAvXMGArP58bayG25fyGAI6VJJHVri5MSilo59/0Vn5e5Oi5Xv0jNi6W1xy32ruljyiAb2hOkemIhEoCf37Rc5x2QzRJUrJ4m9TXKeB1ngeOyD2J72hNiScsnRXBAKduETn+0epvzFRQAh6I0szqnvE6Q+r4q0b3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745324464; c=relaxed/relaxed;
	bh=nKfZ4p6Gcd8cCqdubjMzSanaocw1QMORablQR5XOMpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGil+OuqA8h5QCVt+03IpILGbw4+5ZTnZdDFwcjv1ROUbsnM1d+mkg2+9yJ7kXsSoOpQ70HTk8vTAvA+d2fJhtHGKSujLj3hL59FzGB3Vp+wyZ/6zyzCxe0v+w8vhH9jXErxD5CrQ+floAG+pGsqwFtkxJFf5gVYluCoAlZ3lllkT4dJNq0Po6/22xIEWIdqfLQDoSaK6i2avjx4pjO5keOCF/HH2wlvGx9YGX+v8aUwupoTXkXmMoOKNvfp1n8zX2qMIUN+U15AWB9R9LCOqPwRyHSWEorVh8pfxdmpOOGrhR5RP/1Qt92IvsVz4wx5RaOpuUtrXHLDfwPYSXGFQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gv3VkBdw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gv3VkBdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhhCz6wtfz305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 22:21:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EFD661362;
	Tue, 22 Apr 2025 12:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B25AC4CEE9;
	Tue, 22 Apr 2025 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324459;
	bh=+KyTPZcZpjUlSXuR6Od3i08Rwm0tJd9CK0l/bnn8NmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gv3VkBdw7aXshQ4XgExftOsReBTV7mhTllK8tkzMq1Vhs1cPm6z3f9Pwik48nniTU
	 wlRogZnmr5bVtm3XVdBqNvJzKlLs2Lda+M5BYzx7DZ7zonx1k7ShuO+xZkYO/rOl3d
	 8zPrfFrStsT9Jbf/7Uhk+m2Ovx/cFrCljHD9jW0bXdjp4tAC8cPM1v//O3Zlc/PQwZ
	 BZ2VKkZIqOh6zqutSOYux73tdvwGZfpcZIvqIjXagnPt7k8cCztFcYVsmpLND+nz/G
	 oo6UjuEEjfm/J73vd6pLOGNgzV9r2MOZYpezz9ffEKHaB44oWjzZPdImpmDt2uX1/D
	 NGCsQH1P2tSYg==
Date: Tue, 22 Apr 2025 13:20:56 +0100
From: Simon Horman <horms@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 2/3] net: ibmveth: Reset the adapter when
 unexpected states are detected
Message-ID: <20250422122056.GC2843373@horms.kernel.org>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
 <20250416205751.66365-3-davemarq@linux.ibm.com>
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
In-Reply-To: <20250416205751.66365-3-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 03:57:50PM -0500, Dave Marquardt wrote:
> Reset the adapter through new function ibmveth_reset, called in
> WARN_ON situations. Removed conflicting and unneeded forward
> declaration.
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


