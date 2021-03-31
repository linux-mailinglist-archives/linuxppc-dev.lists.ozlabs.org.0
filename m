Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479F34F80E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9DB83T2Dz3cQ3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:39:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=aDBKOXI5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=aDBKOXI5; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9D9K32kcz3bts
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:39:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9D9K1Dyvz9sVq; Wed, 31 Mar 2021 15:39:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617165541; bh=KTxKn4A+3y7wOzGjUOwDKHrFATZ4opklwIOLGfFtl0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDBKOXI5biBBBFdJoMVfTdjpmxNhcPhxiS0DWIZ0KZ5TPSxTuBCW/kNuvu7RJc5Tc
 u6EIswJbEO1dLvQgUE6/SU3CM6fQzErjJRy0aoxDQEG/ra9ZFFx66YCuoyMFHLp+Yr
 GqjXjcznadVV+1if4re722p/lva2tIQFhI3MO50KnjFdpWaNZHVU+d3xxmg38ohhnA
 kct/2xsPxCV2EURw/TQFcK/szkDRkCBxPqVUJG6/3G1URnhex3N2bMhx7hmqRIxl6R
 l/DJg50qClhVspKo/RUfAj3lTN8QA6fOERu0iSWcD7zoNGBlYCYW7yOH2D5NropORO
 xdIX6nM9KUs+w==
Date: Wed, 31 Mar 2021 15:35:29 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/46] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
Message-ID: <YGP8Ee8aCt/ryhH+@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-6-npiggin@gmail.com>
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
Cc: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:24AM +1000, Nicholas Piggin wrote:
> This SPR is set to 0 twice when exiting the guest.
> 
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
