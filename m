Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9820ABBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:11:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tQ3K6ds6zDqs3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:11:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTp3QL2zDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTl337yz9sTQ; Fri, 26 Jun 2020 14:46:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200611121119.1015740-1-npiggin@gmail.com>
References: <20200611121119.1015740-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: indirect function call use bctrl rather than
 blrl in ret_from_kernel_thread
Message-Id: <159314672456.1150869.3397384495775302476.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:46:03 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jun 2020 22:11:19 +1000, Nicholas Piggin wrote:
> blrl is not recommended to use as an indirect function call, as it may
> corrupt the link stack predictor.
> 
> This is not a performance critical path but this should be fixed for
> consistency.

Applied to powerpc/next.

[1/1] powerpc/64: indirect function call use bctrl rather than blrl in ret_from_kernel_thread
      https://git.kernel.org/powerpc/c/89bbe4c798bc3a43c882179adb5222c1a972ac70

cheers
