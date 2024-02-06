Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C8384BC8C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 18:52:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W3Skh+K/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTrSQ6DqMz3cVK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 04:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W3Skh+K/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTrRg02ZCz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 04:52:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2BA1CE12B3;
	Tue,  6 Feb 2024 17:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D442AC433F1;
	Tue,  6 Feb 2024 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707241932;
	bh=sbkWhpso4EZTK/maCFJTjKFRmHHtepEZjYY0FS4eWcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3Skh+K/0BjVo3UuRa0tzv8HyAIHxOZp+7iMmwUZsKsnRBnSQ2Pd9QdYglYUcdA+Q
	 mcuyd9KfuzcYumM0pn4ZxFH3NJSYQ4GQkIyc+KBoItd7QpOmTpd4NILfddpLszLvWk
	 7MImDsZUBygaGIQjsp2xECMjK5VasXYq7zotFmBd6P58/fjg+d7EY6onCGvWwjIBIx
	 umyA6N8zCu8HJN6ySjk+/oSvGXcNo0I56+tTjlTXDj3FpdJDbs9CumhF4Z04ni7qcC
	 CER+AChQ3dBuCwzxlGtLtmvdDjqrbWZZIS4fUW+OLbQAgNDe/Rd9dwfTrFa/Mao+Zi
	 zEtHomv9vW3zA==
Date: Tue, 6 Feb 2024 09:52:10 -0800
From: Keith Busch <kbusch@kernel.org>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS
 kernel crash while booting
Message-ID: <ZcJxyjfBniERIWiq@kbusch-mbp.mynextlight.net>
References: <a54c8860-18c7-474d-95e2-a0153a2da885@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a54c8860-18c7-474d-95e2-a0153a2da885@linux.vnet.ibm.com>
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
Cc: "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, kch@nvidia.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, alan.adamson@oracle.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 06, 2024 at 10:05:20PM +0530, Tasmiya Nalatwad wrote:
> Greetings,
> 
> [revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS kernel crash
> while booting to kernel
> 
> Reverting below commit fixes the problem
> 
> commit 9f079dda14339ee87d864306a9dc8c6b4e4da40b
>     nvme: allow passthru cmd error logging

Thanks for the report. Let's take a shot at fixing it before considering
a revert. I copied you on the patch proposal.
