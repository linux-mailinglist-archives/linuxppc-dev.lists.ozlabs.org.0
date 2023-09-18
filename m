Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2D7A4B7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:17:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=P40gAJhu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq7hK2xyGz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 01:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=P40gAJhu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq7gL67Czz30PY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 01:16:45 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4121f006c30so27235771cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050199; x=1695654999; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=P40gAJhuauVBSp345Kwo5VzhdhFDkbJ1QNqIk2WG1MM60BpKHsaPKQRqAqbR9bQmUx
         rDXL1T8/4cXWQF5JAfwedLSGYBr0gIhnvRcRhEVVf+ZAxMHR4DClkwT+uA6rvwiiIoBL
         FMMJ7bcQPrjpqwa+t/ZXIiY/NGpeH9KYyJX1xFOgAhYOxz/axShKApcbccMIY6pXO2XE
         QiZ2Ky2qpW9Lhy0XbIZ4/AvpC8wRSEI0Y4l1ffzo6giQnA3ZKuUU85b5X/EnDrhORTER
         ogloP2WnzKkEGCiG/bc3LXrF4ahOdZzqXNH5vDuAQx0RS5R1sA4y5YFqDljU/SuMwS1E
         FujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050199; x=1695654999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ucvab0+WYvq4UufE5S4SV2ca9jdWUsP9GGHLs6BCgo=;
        b=Gu1LsW295nw4HZjF7QoqySg6/ZLQ6zLbHTl/YkBEX2+Vf/D/2Io2Z8IiMFcea0Zu1I
         9RpAQA4TOLubod42jAkfgNlA4+IFg9X70N8H0OJhL/mofbh7v21mvh0/kN0N6HUKDhZy
         IQYwEbfmATXeauDC2qG1qOGbyHnrb0tK+UtWOX36I9n4+QTx7zTXavuGfZPQQAX4hsPG
         37TLBJl2aJxfrzmmnvymPeIiX1e6L1yFDa0Rm+m5E7aAUVCNpSBnp02/XT3a/rZzBOxS
         RFSyXUqEknV8Pvq9oqD7EA/XV3GwKyL+S8Zs9VaKl8HQitDP6vXOirYCdlrYLNa64iq7
         tD4w==
X-Gm-Message-State: AOJu0YyT1ib4YwpARIE2GmoGbhaO80ylr67qsuXMD0TXM4MQrNqB4tfH
	ElzGDm5z2ehvwWq+k3yPY1lF+w==
X-Google-Smtp-Source: AGHT+IE1nILLKPaFxe5im/MfVjUE0HuRytyibnYnzCmrjBnu/bqUhqldLHu9krEWO371lIWoHdHJrg==
X-Received: by 2002:ac8:5ac9:0:b0:403:ef0a:ac69 with SMTP id d9-20020ac85ac9000000b00403ef0aac69mr11892621qtd.62.1695050199490;
        Mon, 18 Sep 2023 08:16:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id z22-20020ac87116000000b004108f6788a6sm3081779qto.41.2023.09.18.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:16:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiFzJ-0005Nh-7L;
	Mon, 18 Sep 2023 12:16:37 -0300
Date: Mon, 18 Sep 2023 12:16:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of
 CONFIG_HAVE_KVM
Message-ID: <20230918151637.GF13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-2-seanjc@google.com>
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 05:30:53PM -0700, Sean Christopherson wrote:
> Wrap the helpers for getting references to KVM instances with a check on
> CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
> NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
> to get references to KVM based on whether or not the architecture supports
> KVM is nonsensical.
> 
> Drop the guard around linux/kvm_host.h entirely, conditionally including a
> generic headers is completely unnecessary.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      | 2 +-
>  drivers/vfio/vfio_main.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
