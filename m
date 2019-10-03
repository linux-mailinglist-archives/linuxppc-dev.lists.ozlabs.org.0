Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82EC98D5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 09:09:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kPJ44BJWzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 17:09:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kPG7708KzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 17:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="TkkleGCY"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46kPG73ZMnz9sN1; Thu,  3 Oct 2019 17:07:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46kPG65f50z9s4Y;
 Thu,  3 Oct 2019 17:07:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1570086447; bh=PbXE+uwM8k5PZ9gZA1wyhmTz2LREoDYBE+t9IDHZp3I=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=TkkleGCYl5HnEhP4GyZbOoe97MfLiOsxJraJLESHFdk29qJMDOkaFGvKgPTbOhwRs
 Bop1uzlin/aH7ky3shqumk8CGH07KbGk6/zou1pPqmI7rspXzaoP9d32JvlU7O/9Sr
 j4JN4C/VKmCniTvf5oP36eydjHPO3RMUelB9ffzIpr3Y0cbu4Sf45K2Pxas5biK2qe
 WM4npx7Z0wDtCqSjIpM51b4Twr54Bsdg5DDGnLViiVlTtvGFDzARvfqL4Y6gHApQXO
 hcdSiov7YyqwSn8jMocijLjfAYwsySzFpL25mbw9iMFco9Aw6/j2MHPTsyXnrxPS8j
 alenJJWr3FHMw==
Message-ID: <452718dfe591c4718498aab6b5c7b68a95cf6c5a.camel@ozlabs.org>
Subject: Re: [PATCH] powerpc/powernv/prd: Validate whether address to be
 mapped is part of system RAM
From: Jeremy Kerr <jk@ozlabs.org>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
Date: Thu, 03 Oct 2019 15:07:24 +0800
In-Reply-To: <9b9b529d-cad7-0ace-acf6-e07d0dea5670@linux.vnet.ibm.com>
References: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
 <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
 <0e8a4057-fbe7-9b1a-6613-ad500ebe8b67@linux.vnet.ibm.com>
 <049794f6a16f548bcb418d31fecf268cb4a335e5.camel@ozlabs.org>
 <9b9b529d-cad7-0ace-acf6-e07d0dea5670@linux.vnet.ibm.com>
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

> > OK. How about we just don't do that?
> 
> Yes. Hostboot will fix that. It will make sure that HBRT is loaded
> into regular memory.

Super.

> > It sounds like we're just trying to work around an invalid
> > representation of the mappings.
> 
> Its not workaround. Its additional check.

The issue is that you've added a check for stuff that the kernel doesn't
(and shouldn't) know about, and assumed that the kernel knows better
than the device tree. It may be the correct thing to do in this case,
but we can't guarantee that it's always correct.

For example, what if there is a future HBRT range that is fine to go
into NVRAM? With this change, that's not possible.

Or, what if there's a range of address-space that isn't backed by system
RAM (say, some MMIO-mapped hardware) that we want to expose to a future
HBRT implementation? This change will block that.

The kernel doesn't know what is and is not valid for a HBRT mapping, so
it has no reason to override what's specified in the device tree. We've
designed this so that the kernel provides the mechanism for mapping
pages, and not the policy of which pages can be mapped.

Regards,


Jeremy


