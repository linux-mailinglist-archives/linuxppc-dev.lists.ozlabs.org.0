Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31792362A4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 23:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMTnh0tLPz3c6W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 07:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PhDBZAzo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PhDBZAzo; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMTnG29d3z2xgF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 07:27:13 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id ef17so8503763qvb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=qnIWecU4j0go3BHki/tPX89ICgmbfzbrXzKLY+iWOac=;
 b=PhDBZAzo+OIHeHKPUkiWebd2RIRE8h8B3dLA1tcUMxGsYd1ao5o99BL9jDla3voE9Y
 GPrLd+bUmEtL5Yk6emTGq2QA+qjodIhVTE5gLa8+vGwH+nqQiXqR5PTrNRb7megwHdKn
 Wy9vXZS5Sm4Ta5Zkbx3QfxiAas3oyIsb/c1ikDetmr7ImtGSBYSrROdswWOEGxzN4OK/
 0tDo7I6b4S8YsPrY8Bq/+YVu2x7RMm/LIm/Y5NiS/zm5t/vCRaPTSryG0Re/JDsrjUbG
 RL8lzHi9gtqu2COx+wLHUWnLJ1pKupIZsi9gTJPZNhnIAMrKyEgcA3tHthGlMk2qXO2B
 YjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qnIWecU4j0go3BHki/tPX89ICgmbfzbrXzKLY+iWOac=;
 b=NaJ84MZgOkgo2j6JWnfmUihzc76zO0OJoEUtJKnosh4goG7JmtZgXmQFK6x0gTd/d0
 8NNPxFj9p7y3QF/z9r/IH1xWcEpXtUkMGFPNsmSYkSC+tUBAv2ZejKJ9oRZkObZ1tH7Q
 HF6VL59VcHm/FBE0WKvOkj4io7dsVxPV45JYBF7Gx7GA1vWn5KzYIeMp2S4w7JUrA7ol
 AzGccfaIVBmqoGsAQ0aJzrWCo2jU+fGLyt8sPnRSWMtz5vuiXcBw8CpKiovSydllZXhX
 TEOvuNAszkhgo+aBoVPEZlmcWuuoXxfQCWzo3QKXsEPIY7ax/3mrYpsacfL96jrEIGqw
 mSiA==
X-Gm-Message-State: AOAM531zwFr1RavD8howNKEi9hfyBNsiyEOKLJ/WDF0VoFSLjgVlGlBl
 p1Nt9u9bFof7ovde8iNDBP8=
X-Google-Smtp-Source: ABdhPJxiaMQSF5aQnwptHbIMI7IyFwQxTjUhS8gbDjqudrYedippV2ExrK8pQT0GQ6TQ9sjUaHt5/g==
X-Received: by 2002:ad4:522b:: with SMTP id r11mr10787069qvq.6.1618608429096; 
 Fri, 16 Apr 2021 14:27:09 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id l4sm5081376qkd.105.2021.04.16.14.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:27:08 -0700 (PDT)
Message-ID: <bd3767f61d0a604918e9886ae6da2eadc8dde310.camel@gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
From: Leonardo Bras <leobras.c@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Fri, 16 Apr 2021 18:27:03 -0300
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

