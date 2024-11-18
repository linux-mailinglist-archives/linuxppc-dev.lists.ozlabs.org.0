Return-Path: <linuxppc-dev+bounces-3424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421359D1BD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 00:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XskTw4H3jz2yNf;
	Tue, 19 Nov 2024 10:33:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731972836;
	cv=none; b=h7hN/mW0y2bFmuCOjXtkEnUBHGXttDAWRfkieOwKabzD1gwVlInxFMyD0I8WywhxfjlhP0T2+lpGKVaqCmqAZucdI/v3toCadTQV8OEu15aaC4vgYqE3RgtvhuO9e9NivF3qsi5FE91TJsrBNTkxyvtRhO88vpLRd/llwuBVte5U9FrUM+qecwgxLY5L+SN8eyNKjUv2eGHtXLubHnZU/2l/0qIzcZh6z6feDpta1K+4Q/kG5hzBJhVuh2LBfVa6VD5GCBpnlCiiwjiLWIw1ROYpn0Jt2KxsInqAtXCi1y4555wd3bu3fzSK2BP/AMLSZRyc+8IhNYBFAAZPqCUaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731972836; c=relaxed/relaxed;
	bh=yODI5yQrw/WFV8G/EAwEiA46R0zIcWLgUg6vGLKRIgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R/DDPkKG/ZQphEFMPW/PFBoIkQ8TMLfmsll92XyC7ohkHduP5sUJRnRRvNgaQWF+WloIIvCe3sFgwfOLFv4+Xai8MZNwJLJJLCEBLvRScYzLt0SnafGw+XtS5C28G7+6oc8njKID10m7UNE7635z2+YDUM1+frgQLlHjrMNSg+34gAu2/dd0Sy3XPoFsq81ADEBtedvEaIV1Q8ZglgOeQd9Vxob96ba68qY/L3TCY9So1eGaxVOh7jKi6fMq6Atra8u3CyRU9qMJN7sNn8OXdyTcnIfST6fVYic/zl+SyGsk9VUdOEslv/eliQNYHjQtyVgapp5CwhvLwPaoEDcMyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X35gIRXu; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X35gIRXu;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XskTs5RfQz2y65
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 10:33:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731972825;
	bh=yODI5yQrw/WFV8G/EAwEiA46R0zIcWLgUg6vGLKRIgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X35gIRXuQ5xgmY7+3mR9DcMSvhN7pqQOrVfIV15GqnMvaRLQDPcLtBVqCTo7AfC+M
	 d9opK2eW2HbT2cETixfTOMtwernsR7cUqIe5sldgjZVWM8lf4P9omubBW4TQHMPqCf
	 cdRcyi3a2YpErrRGajC7DBVLa4cPu7dihuXxtv6TdbZzcPsFi0+zp/tpEA6qIgUU6w
	 KHdR812KpqadQkoCZouV99HRZoaytkBcq0VEHjBZiL8rsWo/5Qghm2VOCzLAjD22vv
	 6BpOkcvzTxAlSLZQ62s9e1ryCQdIpl1NybB7pEP//4u1L7nfcE3Qd7XvTeM1ys3t5v
	 hG8etGZngpU+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XskTj28X5z4x33;
	Tue, 19 Nov 2024 10:33:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tony.luck@intel.com
Subject: Re: [PATCH] EDAC/powerpc: Remove PPC_MAPLE drivers
In-Reply-To: <20241118104142.GAZzsZ5vcY_Vv3GvY-@fat_crate.local>
References: <20241112084134.411964-1-mpe@ellerman.id.au>
 <20241118104142.GAZzsZ5vcY_Vv3GvY-@fat_crate.local>
Date: Tue, 19 Nov 2024 10:33:46 +1100
Message-ID: <87a5dwi0bp.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Borislav Petkov <bp@alien8.de> writes:
> On Tue, Nov 12, 2024 at 07:41:34PM +1100, Michael Ellerman wrote:
>> These two drivers are only buildable for the powerpc "maple" platform
>> (CONFIG_PPC_MAPLE), which has now been removed, see
>> commit 62f8f307c80e ("powerpc/64: Remove maple platform").
>> 
>> Remove the drivers.
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  drivers/edac/Kconfig        |  18 --
>>  drivers/edac/Makefile       |   2 -
>>  drivers/edac/amd8111_edac.c | 596 ------------------------------------
>>  drivers/edac/amd8111_edac.h | 118 -------
>>  drivers/edac/amd8131_edac.c | 358 ----------------------
>>  drivers/edac/amd8131_edac.h | 107 -------
>>  6 files changed, 1199 deletions(-)
>>  delete mode 100644 drivers/edac/amd8111_edac.c
>>  delete mode 100644 drivers/edac/amd8111_edac.h
>>  delete mode 100644 drivers/edac/amd8131_edac.c
>>  delete mode 100644 drivers/edac/amd8131_edac.h
>> 
>> The removal commit is in the powerpc/next branch:
>>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next
>> 
>> I can take this via the powerpc tree if that's easiest, let me know.
>
> Yes, please do. 

Thanks, will do.

> I've been meaning to reply to you but then gazillion things interrupted me and
> ... you know how it is. Sorry.

No worries, I do know how it is :)

cheers

