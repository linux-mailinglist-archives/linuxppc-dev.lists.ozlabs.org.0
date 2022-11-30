Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502B63E431
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:03:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMvrN2dYWz3bf8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:03:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NnMo7/46;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NnMo7/46;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMvqP0Qgwz304s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:02:23 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 140so198987pfz.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHOMyfsfvQkL/nShVDUzK82mKXXqJYsG0axSizIXaLY=;
        b=NnMo7/46lbMBrXBXQZRYVq3GggYMT+7jEJcq9CL/cSVNfI9/zGr929gpN24qaTzNDj
         EuAX3kX5hoFkykznYnPSEMhpqrvV96Ls6XOPXnZJFhl++LMNCZ1xBLhLYGuEyeIeBOlg
         1Pda6St2Grg/DjBtBU5P+snxis04vfL2wZmjtsQkvZDNryITBkJPcp25ppL/joru6uaX
         pdFAr7CPrxA89GBOBBQLxyhlYq8vGrdtF3rzEmU5z3DvHeLGy15BW/hWdiMul0LnS4v8
         aUBoc+y5QRGugr1owVbIQyI2ZzhFRbthIb2QpbXN2iQwGAYLSCnMYOTrkzCCC2hVImkh
         7vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHOMyfsfvQkL/nShVDUzK82mKXXqJYsG0axSizIXaLY=;
        b=OW7Y9vWqzvek2ubdUKVRQ38RgAtqETqsE0ZKUDmIiNkSOiX9D51fgVPGIshxYrjGlK
         BkHOBA/3hV8dLAWgAyUryhKughHRgl3Z8UlY8eVrFDXoKjr3d5rRQiDNPNWNFakB9x1R
         uUk7uJitbqgJemImUcn5uja+2DcYsoPPz65VpsKlUP0PoDM/atfvJpZqorHaUSo9rYvG
         M62AnH9/k89JXrJdqjHvfuja0gDUqvge1M/qtnj1UHuW8BLVKZQZYdl4xoA9bvr6Ixfu
         UI/NVeGuQCaMzzUcz+AoFgzHchElI/cF3XSJyi6AbCcLb+r4C/IwZh+Zc5N0d5z7/f6N
         HuzA==
X-Gm-Message-State: ANoB5pnA/8CDI/lKbsJxpQhkYFebCpNftKizm7sQfe3+c5mpXxDxp8+o
	6cczRanjbWxLSn3EmZL/kYNIAw==
X-Google-Smtp-Source: AA0mqf5Nj1181KAxR2A/WI368LXBMRYoBlCi8ORJRhPIy6nAs8C080UTF7/1gaOFg5Avl9sdvRAfNA==
X-Received: by 2002:a63:2361:0:b0:45f:f8df:108e with SMTP id u33-20020a632361000000b0045ff8df108emr37236360pgm.127.1669849341423;
        Wed, 30 Nov 2022 15:02:21 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id a6-20020a624d06000000b005633a06ad67sm509519pfb.64.2022.11.30.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 15:02:20 -0800 (PST)
Date: Wed, 30 Nov 2022 23:02:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
Message-ID: <Y4fg+MO2DusqMSZO@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-33-seanjc@google.com>
 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
 <Y20r2NR9MaBbOGLn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y20r2NR9MaBbOGLn@google.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Robert Hoo wrote:
> > After this patch set, still find some printk()s left in arch/x86/kvm/*,
> > consider clean all of them up?
> 
> Hmm, yeah, I suppose at this point it makes sense to tack on a patch to clean
> them up.

Actually, I'm going to pass on this for now.  The series is already too big.  I'll
add this to my todo list for the future.
