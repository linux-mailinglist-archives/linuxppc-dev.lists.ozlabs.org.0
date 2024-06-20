Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDF910494
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 14:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gP61JY3z3fn5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 22:52:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gMV20m9z30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:50:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4gMW0ZVTz4wqK;
	Thu, 20 Jun 2024 22:50:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
In-Reply-To: <20240116055910.421605-1-haren@linux.ibm.com>
References: <20240116055910.421605-1-haren@linux.ibm.com>
Subject: Re: [PATCH v6] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Message-Id: <171888775104.806750.10241803458861124976.b4-ty@ellerman.id.au>
Date: Thu, 20 Jun 2024 22:49:11 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Jan 2024 21:59:10 -0800, Haren Myneni wrote:
> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
> 
> The open and close VAS window functions hold mutex and then issue
> these HCALLs. So these operations can take longer than the
> necessary when multiple threads issue open or close window APIs
> simultaneously, especially might affect the performance in the
> case of repeat open/close APIs for each compression request.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
      https://git.kernel.org/powerpc/c/43ac9f5cd457bb01930f87448ddaaae455f8a8cf

cheers
