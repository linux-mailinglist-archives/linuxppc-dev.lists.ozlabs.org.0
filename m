Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335773629C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 22:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMT8B0Yxfz3c4j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 06:58:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pz/bSOQm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pz/bSOQm; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMT7k4Lrwz30Bh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 06:58:09 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id d23so18235934qko.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=qnIWecU4j0go3BHki/tPX89ICgmbfzbrXzKLY+iWOac=;
 b=pz/bSOQmz9g+p6n0hHD1XQp4RAoq2j/Dj0uYmko1vHfn5u7RxBa80ABt2yiEG25v68
 haJilWm4NQoEiFZmf6ZCbgXgD0WEvFImh7UxgbDrysgLT0RyxcXbeAQsfenuXFUhxMZ0
 kqgYHnrvKY1kb9ACeLaIhxNJTlueR0VDBoK5nyTA7AWNFEcOVXwKX/bhRfyDzO5BDxYu
 iyyzTYTkUbhk8xG+XjJB0unQDDTTmiCESPhkYjks9+OV4j3FvRjcw8FUhL+gaUffJ1XI
 Ix5RU/RXzOdSgrB+BelgyWuXjivn2djucxlh6gW5fRKzGgkoysyHferoLsZxEue8M1RI
 O/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qnIWecU4j0go3BHki/tPX89ICgmbfzbrXzKLY+iWOac=;
 b=nSaeQ4M43qkszTtASKAZliUvDS4okaQxAwD1k8WyCfl+lTAjNJ4LaG/LQHwlI2LgbC
 EBB/WTKQ4gNi/PhrN1yeD22MCYxoI4fww8PKqJjQIGyRcNEg5mmyPE/yo83KZVIuLCPq
 eCMBlG2VQ0p5c+EzgiRWCYsq6OKfpPg5DdfHoJbfsmWfCUVYfII5gXrlsUkM9SJiqEyV
 OiB69vNDj9MlL4xP8dPvvoiLFuCgygEQtnwDkR6kAdUls2LVj+WOs8O20k+MRnbPpa6g
 IfgNxz7DINcoY6udbyR8jpgB7FmzbYWe6IaewdX8hqO6WpGs1NM51nNl7aFtXRWkq5tX
 f9Lw==
X-Gm-Message-State: AOAM5332FYM1n5xjWLbGRJFb8bzv0hnprOkomLO28iRotjTy7azvbFN8
 g7hYL99lGvLf7cmSTb9ZGTU=
X-Google-Smtp-Source: ABdhPJxFhinlHNn02trTin40jfBumlNTfk5ie7OrDNyXW4/JI/YC1pS+0OjO1mDC9iZf7UePRpjcKg==
X-Received: by 2002:a37:d4e:: with SMTP id 75mr1110422qkn.457.1618606685688;
 Fri, 16 Apr 2021 13:58:05 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id n15sm4860020qkk.109.2021.04.16.13.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 13:58:05 -0700 (PDT)
Message-ID: <7b089cd48b90f2445c7cb80da1ce8638607c46fc.camel@gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
From: Leonardo Bras <leobras.c@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Apr 2021 17:57:59 -0300
In-Reply-To: <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
References: <20210415180050.373791-1-leobras.c@gmail.com>
 <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Rob, thanks for this feedback!

On Thu, 2021-04-15 at 13:59 -0500, Rob Herring wrote:
> +PPC and PCI lists
> 
> On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > 
> > Many other resource flag parsers already add this flag when the input
> > has bits 24 & 25 set, so update this one to do the same.
> 
> Many others? Looks like sparc and powerpc to me. 
> 

s390 also does that, but it look like it comes from a device-tree.

> Those would be the
> ones I worry about breaking. Sparc doesn't use of/address.c so it's
> fine. Powerpc version of the flags code was only fixed in 2019, so I
> don't think powerpc will care either.

In powerpc I reach this function with this stack, while configuring a
virtio-net device for a qemu/KVM pseries guest:

pci_process_bridge_OF_ranges+0xac/0x2d4
pSeries_discover_phbs+0xc4/0x158
discover_phbs+0x40/0x60
do_one_initcall+0x60/0x2d0
kernel_init_freeable+0x308/0x3a8
kernel_init+0x2c/0x168
ret_from_kernel_thread+0x5c/0x70

For this, both MMIO32 and MMIO64 resources will have flags 0x200.

> 
> I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
> the flags. AFAICT, that's not set anywhere outside of arch code. So
> never for riscv, arm and arm64 at least. That leads me to
> pci_std_update_resource() which is where the PCI code sets BARs and
> just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
> IORESOURCE_* flags. So it seems like 64-bit is still not handled and
> neither is prefetch.
> 

I am not sure if you mean here:
a) it's ok to add IORESOURCE_MEM_64 here, because it does not affect
anything else, or
b) it should be using PCI_BASE_ADDRESS_MEM_TYPE_64 
(or IORESOURCE_MEM_64 | PCI_BASE_ADDRESS_MEM_TYPE_64) instead, since
it's how it's added in powerpc/sparc, and else there is no point.

Again, thanks for helping!

Best regards,
Leonardo Bras

