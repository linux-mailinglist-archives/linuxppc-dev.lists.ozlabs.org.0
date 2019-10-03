Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57813C9692
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 04:02:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kGVk730YzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 12:02:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kG925XhNzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 11:47:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="WBotX7+O"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46kG906NMKz9sDB; Thu,  3 Oct 2019 11:47:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46kG902W4Tz9sCJ;
 Thu,  3 Oct 2019 11:47:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1570067252; bh=GTIyz0yKEF3jYHEusTqus7mlajcbyoXLsW6mg8gBA4w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=WBotX7+OPZmjUAXgsmDdncGSnZkxYEaSLTw+9Fw+rwqBfYqCT7fvyWGw/SjyDHih6
 IS+6+CchY0ICAxYvmIF8qxS2oKhUQ+3I+sf9gC45WH3QNIQwlJ8K9Hof75DBBlKL5z
 3Ou0uHw2McsAK3Hoygfkk0VA3qK154tfnUQFPagX7k+2E0AweZuterfTy2j/4Ow1b5
 WVYeEOIcKeduXevJLWo/fAGVVMmN6Ih/8CtnrwgNiNYjYm4qdC81+VqStkpQroJq2E
 WGg/ZScg0OwMf82UUNxggJ4LQUpAQcQU+WoKwPMbmbYcnQD19fVlC5Z4AkpNCptXm6
 NqQrHBzzfPX9w==
Message-ID: <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
Subject: Re: [PATCH] powerpc/powernv/prd: Validate whether address to be
 mapped is part of system RAM
From: Jeremy Kerr <jk@ozlabs.org>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
Date: Thu, 03 Oct 2019 09:47:31 +0800
In-Reply-To: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
References: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vasant,

> Add check to validate whether requested page is part of system RAM
> or not before mmap() and error out if its not part of system RAM.

opal_prd_range_is_valid() will return false if the reserved memory range
does not have an ibm,prd-label property. If this you're getting invalid
memory mapped through the PRD interface, that means the device tree is
incorrectly describing those ranges.

Or am I missing something?

Cheers,


Jeremy


