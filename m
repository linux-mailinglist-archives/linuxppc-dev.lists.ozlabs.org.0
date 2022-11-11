Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07363624EB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 01:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7fCG6Vfjz3f3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 11:07:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hNVPv+ey;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hNVPv+ey;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7fBH6hRKz3cF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 11:06:14 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id b29so3453197pfp.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 16:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sXQg6m0KDTXTm2nqz+lTg6WMBvdzJA0Ss4aaQqsqfi0=;
        b=hNVPv+ey8HIvOZmC+WAnWIG8OYAeSlZS0xPLzYhDCZmnArotz5Y/nhfn9r9c8PCEFe
         E8mVjVIva+def9PHp762BmRXmUoK5jg3heR3NAusrpN5STPSFfkervClje0NQa5CwXrE
         HdlsTtSUM+MPo4+vdGUA38aqr644tAa7P5bI3VxUrx5hCBiuVMLzUakeu0v8EjWAOK7v
         BgVrNZDyAWChq0qRi87Yhdn0EcEzkTu6Ae/6zTz8SPVNgwEGA83vKScQ/P1+h2fj3QJH
         Ic9NMyWV4IhkYFZTb5wG6PyKY3kSFDqOOs7F1TgAuJpwI7fBOge9ep4GrU+eZD7ML8Bk
         8lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXQg6m0KDTXTm2nqz+lTg6WMBvdzJA0Ss4aaQqsqfi0=;
        b=N7IAoT/CF5HoJ3o1QAh3hUwWudcBcWYDEz+9q2E0PnJ3SG6iz/yrpohf1IXCHU0FvZ
         R678COyX3uFI44KaeTyXb/3H+k4FU4NhibLfYxgPf7Ob3RdJ/aw1A9sAF7hmEp4Dbs7u
         N9SHE1gplsPhDqgR3bcyKPdf42/BPcvNTUDzGhneiwSlV+jODpA1F+jCyxCjYHuGaBoT
         QVIANsn/YjzXY6tRO4kK9DXArzXTb03JfaUXzJlpAziWMlDyq2c8iQ2rOJCw0angEf4r
         SesyUNFk70Lb4kg5pZXxqmWeum0WBSXsyTMee3YfOsUjKUxVin1hUkjxLFnXQtFDsTtd
         BBsg==
X-Gm-Message-State: ACrzQf3ifL3pykUUBRrdHS4pIkJjF5d0AMsLvpHPUhd1fguIh1DELPAu
	lcaKq0yzU2B84BKX0LucjvtHOQ==
X-Google-Smtp-Source: AMsMyM4gD1W2r9wxYtObzCBR9GM6UAk6Hoer15K7R44TK7byNmqvji7Uiit5OvUTQRObzAPBYqhIPw==
X-Received: by 2002:a05:6a00:bef:b0:56e:3a98:1089 with SMTP id x47-20020a056a000bef00b0056e3a981089mr3906306pfu.38.1668125172489;
        Thu, 10 Nov 2022 16:06:12 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id s18-20020a170903215200b00186a6b6350esm234146ple.268.2022.11.10.16.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 16:06:12 -0800 (PST)
Date: Fri, 11 Nov 2022 00:06:08 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <Y22R8GAvcuoWBELA@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <20221103210402.GB1063309@ls.amr.corp.intel.com>
 <Y2RB4qT02EkhMjPL@google.com>
 <20221104071819.GD1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104071819.GD1063309@ls.amr.corp.intel.com>
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

On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> On Thu, Nov 03, 2022 at 10:34:10PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Thu, Nov 03, 2022, Isaku Yamahata wrote:
> > > On Wed, Nov 02, 2022 at 11:19:03PM +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > > index f223c845ed6e..c99222b71fcc 100644
> > > > --- a/arch/x86/include/asm/kvm_host.h
> > > > +++ b/arch/x86/include/asm/kvm_host.h
> > > > @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
> > > >  };
> > > >  
> > > >  struct kvm_x86_init_ops {
> > > > -	int (*check_processor_compatibility)(void);
> > > > +	int (*check_processor_compatibility)(int cpu);
> > > 
> > > Is this cpu argument used only for error message to include cpu number
> > > with avoiding repeating raw_smp_processor_id() in pr_err()?
> > 
> > Yep.
> > 
> > > The actual check is done on the current executing cpu.
> > > 
> > > If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
> > > in non-preemptive context, it's a bit confusing. So voting to remove it and
> > > to use.
> > 
> > What if I rename the param is this_cpu?  I 100% agree the argument is confusing
> > as-is, but forcing all the helpers to manually grab the cpu is quite annoying.
> 
> Makes sense. Let's settle it with this_cpu.

Finally got to actually change the code, and am not a fan of passing "this_cpu"
everywhere.  It's not terrible, but it's not clearly better than just grabbing
the CPU on-demand.  And while manually grabbing the CPU in the helpers is annoying,
in at least two cases the pain is just shifted to the caller.

I'm going with your original suggestion of just grabbing raw_smp_processor_id()
in the helpers that print the error message.
