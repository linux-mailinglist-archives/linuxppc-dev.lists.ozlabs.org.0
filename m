Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B5D1E375C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 06:32:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wybg0HyyzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 14:32:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WyLj5P4MzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:21:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=NvjFzCgo; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49WyLj0Yf1z9sPF; Wed, 27 May 2020 14:21:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1590553261; bh=eCU8X9wRDZzbEoypesdQISc5J/H8gswzhje60culhhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvjFzCgoGwZfWfZdWhowsFPcEgbAthogqz43Wu55JJek+CecgA1Vm1V0OyMsEhwGg
 k5nfMcfDV1cr/Jmias9LVJGbLcBNwdX9ZzEIuPp5CEiYbxj5B3AsCb+Zn5Cl9rvHQn
 uMYjYkkrMzGQEyjHsnf62EZl9xNQxr+kdUW9B2gq6ufLlBJv8frN3XRCBb5OU43KuA
 MW18mCF3nStwTN5fhg/CtZbxa/yrCRAc7FfeyCepzs7O2gft4INYZ7HY+VnKfUHZdY
 dCMm83AVzDA2vXCaCkSo4a2yra4j7f75PeuBZLfmmwYYcImvBu0zmZsnpnGE0BpDC9
 skr0LlwvVdzWA==
Date: Wed, 27 May 2020 14:15:30 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next] KVM: PPC: Book3S HV: remove redundant NULL check
Message-ID: <20200527041530.GB293451@thinks.paulus.ozlabs.org>
References: <20200401130903.6576-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401130903.6576-1-chenzhou10@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 09:09:03PM +0800, Chen Zhou wrote:
> Free function kfree() already does NULL check, so the additional
> check is unnecessary, just remove it.
> 
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Thanks, applied to my kvm-ppc-next branch.

Paul.
