Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB92DA616
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 03:17:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw22w1b1xzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw20y19MKzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 13:15:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=a1eIbgUR; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Cw20x5ZWFz9sRR; Tue, 15 Dec 2020 13:15:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1607998545; bh=HIoL3hYia/VL0H8kxL6qHX8RQtpD9XmN0+Gy2vsT9c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a1eIbgUR8izZ8apPi6OAsVBqalg61msyq1wD1KLkArhkC7vAdmdAS17cb/B+XGiWp
 jnZ6skMXJvFPwVxQq2KWtYBYNCjp+ZdBVksqX/q+xu/6IcPTL+DGNa0lQK9QX9KpMd
 eHLkop+Fe+3aemWoK7rxsXDWTBAMk70i53x0QzNnkfPsj7+iE+QRjKRDLMk/zVLlWR
 dPrVU8f7K6tz7iljIYbmoKtqSGc8DVZPqx+kryU/lV8eI1m1OL9oAyasRL9N6ibJF3
 NjtCVm4ByCnE/nASHWNADKGa3k/ogFFdYirxOzRfsPCop290p0shx2iF0WTPCqkfn8
 FJNGj5C+s9XOw==
Date: Tue, 15 Dec 2020 13:15:23 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Fix mask size for emulated msgsndp
Message-ID: <20201215021523.GC2441086@thinks.paulus.ozlabs.org>
References: <20201208215707.31149-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208215707.31149-1-leobras.c@gmail.com>
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

On Tue, Dec 08, 2020 at 06:57:08PM -0300, Leonardo Bras wrote:
> According to ISAv3.1 and ISAv3.0b, the msgsndp is described to split RB in:
> msgtype <- (RB) 32:36
> payload <- (RB) 37:63
> t       <- (RB) 57:63
> 
> The current way of getting 'msgtype', and 't' is missing their MSB:
> msgtype: ((arg >> 27) & 0xf) : Gets (RB) 33:36, missing bit 32
> t:       (arg &= 0x3f)       : Gets (RB) 58:63, missing bit 57
> 
> Fixes this by applying the correct mask.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
