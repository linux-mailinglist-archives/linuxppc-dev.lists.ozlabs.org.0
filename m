Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF13651D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPXMB1mmBz302V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:30:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JCafrJcS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JCafrJcS; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPXLg3WByz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:29:45 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id z2so1266052qkb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=CD5KgC7jtIRxFp9L5EX0XqWGl1RUghQJwWPnq/cGmzA=;
 b=JCafrJcSXX4Mn66ZWw8U8ND0HHkGqhAmFRiw8OMyTHMosRl8XNVwao/iHwNS7jMLX1
 /N7bbezhvWpt+Iqas9/VOpTAJrx4FkJp16RYUuY7uI6+ufT58hn2Lkk2gei8Or6L8eOS
 pPm3UWa12JX9fTiXDsRAF82Qrq92UEv3Qi6zkHFgExT0gNh+CmoNr3fpsvKM5pCD8REE
 xmVPf2zAPQetho4L8Gz6N/1cXKukAoxpvXHCTPuBnDDst5T8fNKgPTTbQTasdckAOFur
 lfTbDyKvTK+fqPslxjcFuGjRG7OC8RIU6BlXRrkQ99635WyW5KLZYWjN4b9OGUCv1KJf
 raWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CD5KgC7jtIRxFp9L5EX0XqWGl1RUghQJwWPnq/cGmzA=;
 b=JLPSVixAdj2Gorn4oQOv+hfBP4PYF2EIzHeY5k0s13cQEe8wmawCS6JQ14OiBxSCCJ
 d2c9I7YZtYtA/eOpgHPiwwjQ3Aa+cDPE7U0V4FDmXALT26DspWyp2qFL5LO4KmUs40uD
 nDfABzE9wFUwbDka3bmAqZs0M+s+9FUazXGRdyibwbmEavwb1cq76qfuS61HwIouK0I8
 zuSW83ScLBsX0sGk6UyRw9xmM3VQttW2dy7RAYS+RA0vwtg7MWGlkCBkeqxSGOsmfkQY
 M9ZHACxTL/Adedkb008O3E72RzsdLcjFlP4e0DghmvV0oOuHob3KL4hpsJMSIGyuF3e6
 xelQ==
X-Gm-Message-State: AOAM533XFGViJufQTIU+LSZgBIKjjRoUQoXvApTZUjje/FUdakAyjwRW
 qmQaaeadxte0nuMJfwUFrsQ=
X-Google-Smtp-Source: ABdhPJwZS2BpuCSdCWdDvSF5KnO6hp7JbxTakxD8Xsi7lNH9Uo+5o2UZGcERr3xdBBoefGdvXPZw9w==
X-Received: by 2002:a37:a206:: with SMTP id l6mr15817573qke.5.1618896581783;
 Mon, 19 Apr 2021 22:29:41 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id v3sm5539052qkb.124.2021.04.19.22.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 22:29:41 -0700 (PDT)
Message-ID: <2977fdf112bce230ca6739c0a7f9f1f55bd2f693.camel@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/pseries/iommu: Fix window size for direct
 mapping with pmem
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Date: Tue, 20 Apr 2021 02:29:38 -0300
In-Reply-To: <58b28a98-37aa-055f-5dec-d8c0005c9519@ozlabs.ru>
References: <20210420045404.438735-1-leobras.c@gmail.com>
 <58b28a98-37aa-055f-5dec-d8c0005c9519@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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

On Tue, 2021-04-20 at 15:18 +1000, Alexey Kardashevskiy wrote:
> 
> On 20/04/2021 14:54, Leonardo Bras wrote:
> > As of today, if the DDW is big enough to fit (1 << MAX_PHYSMEM_BITS) it's
> > possible to use direct DMA mapping even with pmem region.
> > 
> > But, if that happens, the window size (len) is set to
> > (MAX_PHYSMEM_BITS - page_shift) instead of MAX_PHYSMEM_BITS, causing a
> > pagesize times smaller DDW to be created, being insufficient for correct
> > usage.
> > 
> > Fix this so the correct window size is used in this case.
> 
> Good find indeed.
> 
> afaict this does not create a huge problem though as 
> query.largest_available_block is always smaller than (MAX_PHYSMEM_BITS - 
> page_shift) where it matters (phyp).
> 
> 
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 

Thanks for reviewing!

Leonardo Bras

