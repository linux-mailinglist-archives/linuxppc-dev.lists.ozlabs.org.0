Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37919BDDFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 14:17:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dcW460DSzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 22:17:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="c4bcBKL2"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dcPy4ZnpzDqlj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 22:12:31 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id c3so6201498qtv.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oBVGKXAk9w+4EA6L5BY1AZojVwuWJkNrQjSpnpyAGMs=;
 b=c4bcBKL2RswqhJka+wiljWOhLAsbSc3lO0LNNlKe115b8Vdcoi5KORR97rsw/4sSOZ
 oRYLiTAtgcDBybItrH5KMGkBJeced+LfN+XdUQgEPNbJCama9mP+oe4D8hi+7SPDFuHE
 cN82TlTIPwKRRekxBmeW9MnWTcxIeqIdQqcA6WzNm2IpDALCVibW9Snm7k84lsd9ivPD
 kr71R+AFyhKUTHoqANP8iHQV5/3ayDDQcz8FMJfnrdEZs2j/PHQcAI01jsAmgG3+gYqJ
 8lLbKM+F8DVS9fGj0vpB8i1g12PeVvmDTRT8DeG9r1p7l10fY3zXEkptqGmDnq5PBqsA
 HHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oBVGKXAk9w+4EA6L5BY1AZojVwuWJkNrQjSpnpyAGMs=;
 b=ItwSRM1K84Itu3tKg/p6b+3sJSR4pki5yH4eSMnjXUl2siQUbGde+F8Jm//S/elmQX
 GgT84kkurNgE5ZHN4WqV4Hgx9IA2EhG3Q5mj9jshxtoVoCFLjl9WKbELF7vw1Wb+d7/Y
 p7ZLtfdwNYITMjRU6MIjIph+76mMeBiZce5yL0xd6pn0Hi6OxEubf7NkjvW8PajyUk0z
 2Wdm3swUlWrElsB8qWnbJ2Io5RsaxZyOiW6pILx8uMQQoHdWhgA6V5EkgQIT+pVcox0m
 L4JLxV82fcIEO1lMUqherqNR7b7+TzhZFLxeEBqdwvPRo7C1mbAD7XlKHRCVHBeQbWNT
 uIrQ==
X-Gm-Message-State: APjAAAXVugBilMXtp7Jn6XhtNBi7cSw+Odel3PbXfWGoiKQ1u0GRUwl+
 9B1fpmGFPdtFtE9DQ93/xPtTwQ==
X-Google-Smtp-Source: APXvYqxA9x+bSDQm0nofvSyORE8/echJIVBjKRlR0e39o2pTT9Cm797abvqf7P+y0MOYdExlef7hMQ==
X-Received: by 2002:ac8:36bb:: with SMTP id a56mr8429682qtc.164.1569413547483; 
 Wed, 25 Sep 2019 05:12:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-223-10.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.223.10])
 by smtp.gmail.com with ESMTPSA id u132sm2520827qka.50.2019.09.25.05.12.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 05:12:26 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iD69i-0006UQ-D3; Wed, 25 Sep 2019 09:12:26 -0300
Date: Wed, 25 Sep 2019 09:12:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v9 2/8] KVM: PPC: Move pages between normal and secure
 memory
Message-ID: <20190925121226.GA21150@ziepe.ca>
References: <20190925050649.14926-1-bharata@linux.ibm.com>
 <20190925050649.14926-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925050649.14926-3-bharata@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2019 at 10:36:43AM +0530, Bharata B Rao wrote:
> Manage migration of pages betwen normal and secure memory of secure
> guest by implementing H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> 
> H_SVM_PAGE_IN: Move the content of a normal page to secure page
> H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> 
> Private ZONE_DEVICE memory equal to the amount of secure memory
> available in the platform for running secure guests is created.
> Whenever a page belonging to the guest becomes secure, a page from
> this private device memory is used to represent and track that secure
> page on the HV side. The movement of pages between normal and secure
> memory is done via migrate_vma_pages() using UV_PAGE_IN and
> UV_PAGE_OUT ucalls.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
>  arch/powerpc/include/asm/hvcall.h           |   4 +
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h |  29 ++
>  arch/powerpc/include/asm/kvm_host.h         |  13 +
>  arch/powerpc/include/asm/ultravisor-api.h   |   2 +
>  arch/powerpc/include/asm/ultravisor.h       |  14 +
>  arch/powerpc/kvm/Makefile                   |   3 +
>  arch/powerpc/kvm/book3s_hv.c                |  20 +
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 481 ++++++++++++++++++++
>  8 files changed, 566 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
>  create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 11112023e327..2595d0144958 100644
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -342,6 +342,10 @@
>  #define H_TLB_INVALIDATE	0xF808
>  #define H_COPY_TOFROM_GUEST	0xF80C
>  
> +/* Platform-specific hcalls used by the Ultravisor */
> +#define H_SVM_PAGE_IN		0xEF00
> +#define H_SVM_PAGE_OUT		0xEF04
> +
>  /* Values for 2nd argument to H_SET_MODE */
>  #define H_SET_MODE_RESOURCE_SET_CIABR		1
>  #define H_SET_MODE_RESOURCE_SET_DAWR		2
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> new file mode 100644
> index 000000000000..9603c2b48d67
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __POWERPC_KVM_PPC_HMM_H__
> +#define __POWERPC_KVM_PPC_HMM_H__

This is a strange sentinal for a header called kvm_book3s_uvmem.h

Jason
