Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2D22A344
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 01:47:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBsZb6lxPzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 09:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S4mTuqY5; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBsXb5hnjzDqth
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 09:45:35 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id 11so3820443qkn.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=KHh56+Ss89jHm1k4aVhgmUHFFsDiPlnWkvKWi9iX6pg=;
 b=S4mTuqY5ZfXbI6vRCYpIJN+S8F0EEPCbqlyhUN0hXe3ucCH821MMzmy07dEI8JA7lB
 Kwe00d9AaTmbl5kdndQ9IrBxglWH5c3dbi55hYk3YS9Qr3PG4Mql3fjQTVZ9CxQJHGd7
 wb3VcwywfUeVjUzbdHUKI8pWPW/QTpkEDKBZ/MuSqfTSG2/vXF0FG2+5yiAIl0up/O3n
 UH4GaNc+eDFOJ4H8oEluqdyNalw619axyA0Ii2wksSNUlVR7XKw2LUXDsfpXAUqnkNpt
 5UnDLWZfzRppcO97JwnPxF2pQz6aWLKu09FIu9B65mmmFz3pWCKPxTMFj4GrLvbafjJk
 DfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KHh56+Ss89jHm1k4aVhgmUHFFsDiPlnWkvKWi9iX6pg=;
 b=O9Vd9xjLblNPSuCYpMsIEHIrZENH7JoS89y0WHZE+0bhJz+RjnsYkBKPtUBHTVPLhT
 83NrE/rCtAXjNoFalWYdAZ77ncM3gBwyUOHABBMNMl4hv5yAmHKjtGDFRWfo2i4SrNeF
 j9gemedNINhF7Ty72Kd4zr13jMIGh/HVg3VkZjF+zK77R8dwt5Nd48rryitneNKtHAQ8
 7b85Ask4aI1pj6bGgQWCbKqSmEMA2uTDXoaLaWvq8vXWZ3dGf7bEADijkqK7YcXbXYg8
 RjEnJZBSKCJ05HnJISn0NGWwyCXE02FUXbEfa4MDC/uvh7+7O4S78B9uv70b4h3x+bxK
 fRfQ==
X-Gm-Message-State: AOAM5339DgnQ5oe7YipYeTAI/NIptKHTNzcdE0xYvvyKWVxXbH/oeTpA
 VW4ia+waSUFtZXzSFqwL1OU=
X-Google-Smtp-Source: ABdhPJzCPLel4ripFzhP8OQSnx1WFD+US06BMXUjgjaCvklZoAhyPyRzjZc6/odiBunqfRfCpZQj7w==
X-Received: by 2002:a37:8746:: with SMTP id j67mr2360874qkd.405.1595461533312; 
 Wed, 22 Jul 2020 16:45:33 -0700 (PDT)
Received: from LeoBras (179-125-153-225.dynamic.desktop.com.br.
 [179.125.153.225])
 by smtp.gmail.com with ESMTPSA id p34sm973735qtd.56.2020.07.22.16.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 16:45:32 -0700 (PDT)
Message-ID: <e23c8ffd6667e675ab80c83c39f8b91beb591328.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] powerpc/iommu: Move iommu_table cleaning routine
 to iommu_table_clean
From: Leonardo Bras <leobras.c@gmail.com>
To: Brian King <brking@linux.vnet.ibm.com>, Alexey Kardashevskiy
 <aik@ozlabs.ru>,  Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, 
 Ram Pai <linuxram@us.ibm.com>
Date: Wed, 22 Jul 2020 20:45:25 -0300
In-Reply-To: <d6078fce-bb5f-f829-5de2-5bce3cee2bd5@linux.vnet.ibm.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-6-leobras.c@gmail.com>
 <51235292-a571-8792-c693-d0dc6faeb21c@ozlabs.ru>
 <0f4c2d84d0958e98e7ada53c25750fe548cadf0b.camel@gmail.com>
 <d6078fce-bb5f-f829-5de2-5bce3cee2bd5@linux.vnet.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-07-21 at 19:52 -0500, Brian King wrote:
> > 
> > As of today, there seems to be nothing like that happening in the
> > driver I am testing. 
> > I spoke to Brian King on slack, and he mentioned that at the point DDW
> > is created there should be no allocations in place.
> 
> I think there are a couple of scenarios here. One is where there is a DMA
> allocation prior to a call to set the DMA mask. Second scenario is if the
> driver makes multiple calls to set the DMA mask. I would argue that a properly
> written driver should tell the IOMMU subsystem what DMA mask it supports prior
> to allocating DMA memroy. Documentation/core-api/dma-api-howto.rst should
> describe what is legal and what is not.
> 
> It might be reasonable to declare its not allowed to allocate DMA memory
> and then later change the DMA mask and clearly call this out in the documentation
> if its not already.
> 
> -Brian

Thank you for the feedback Brian!

That makes sense to me. I will try to have this in mind for the next
patchset. 

Best regards,

