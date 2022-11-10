Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9D62479A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 17:51:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7SXb5vhVz3dvN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:51:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dFHHoN/N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dFHHoN/N;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7SWf5NNsz3cMK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 03:50:38 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id k22so2722646pfd.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngpTqFXA20Qov7vlYrPcJjUI8sUR/quxgJrGzBa7LTQ=;
        b=dFHHoN/Nh+VXrE9JsY3e3+fkRaRAvb1aGnzgeGfgDdwTgSMupLwM8ROA3+W4pYGjY0
         5rtK6lElI+DgF0DyaiLvpiaAorCWCegKieghDDMY6o0ECE7iPV/tCP64EmRRyb1QKnLg
         h1cjN79kb5l9jgix2MCBmxfqZYQuwhlkODvDz7ZvaH4sxe61Ml97iSmSMtvAoCeE4p6S
         zdFuv8u4MZbd4uwMLlGMYvkNsSjoXRG5kz2GxfEgOPys7+fCqRAsVr0dupEjPva4LkLJ
         QEyjxBRtbWEN1lQAedlvI4TNbWVV6gyxLgVr0x17HRSOYZcACGBuRj0/yzFNApiBrJr+
         O6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngpTqFXA20Qov7vlYrPcJjUI8sUR/quxgJrGzBa7LTQ=;
        b=Rj2KGofGElBVXyasmXzPJHuVUBiiMfdOBQpaL2Ui3dzQOTVc9QIr3GgXtXJqQUj3AC
         EQm7ypmLJV3Y31fWvKSEBsDgwxa+OLLPRA+0UtZUqTbJnmH4GOfQv6EDCOkc6xDTJT0W
         +hiFwcXRFscXhmqSj1edh7m8/nYFiF4bobPghDD26Mk9yku0UgEiyj2FjGRwl3YEylUq
         1DXPOKn0+ZkV2WaQkKigYHVYwn7yaAYV/qmWbbr0RKzeIi+FymD0/5F/f07S8H2k7iPG
         /FTUVMVb5iNoA+5HnKrquxmQ/7FjwdiNlQwP8LY9WdLee8mE00AriyOyBry5kBPkBW0V
         UAyg==
X-Gm-Message-State: ACrzQf3i/95r+OkvaUHHlb+1zRMWmUugTHT8zBsNRDq779dweR2zc8SQ
	vhQtnjBWmdFQy/qcXmJrFPxkIA==
X-Google-Smtp-Source: AMsMyM41GjMawKBCP5Kop4vnrwekEGW/LOSR6lYqiErYbTmquFxjglLK4Ryhg/mdPPwnXrGhT3xNoQ==
X-Received: by 2002:aa7:8d08:0:b0:56b:a4f6:e030 with SMTP id j8-20020aa78d08000000b0056ba4f6e030mr3031241pfe.85.1668099036440;
        Thu, 10 Nov 2022 08:50:36 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902db0200b00186f81bb3f0sm11518667plx.122.2022.11.10.08.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:50:35 -0800 (PST)
Date: Thu, 10 Nov 2022 16:50:32 +0000
From: Sean Christopherson <seanjc@google.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
Message-ID: <Y20r2NR9MaBbOGLn@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-33-seanjc@google.com>
 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
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

On Thu, Nov 10, 2022, Robert Hoo wrote:
> After this patch set, still find some printk()s left in arch/x86/kvm/*,
> consider clean all of them up?

Hmm, yeah, I suppose at this point it makes sense to tack on a patch to clean
them up.
