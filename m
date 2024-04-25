Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5EC8B23A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 16:13:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lHoAFnQO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQHrf3Lv8z3vgn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 00:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lHoAFnQO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQHqx1fFDz3dFw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 00:12:43 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2dde561f852so11570041fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 07:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714054356; x=1714659156; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgj3m/Cw0cxG7wHpYlRihQfjnwxhhxsXHcabhCA3Erw=;
        b=lHoAFnQOfkbmrclZ9bjbCvUafuxkWiYardbRMpnpqxlYHfeE5OdeD/npTFPzJ9KZEF
         Wnj3qETwsOMnj/CVl9yQfcXJYYmUzR3hhdyeSPnpCN1Hmnt/oKtaV0XtbiUKBoblgNF4
         EBH1ynG973JPRF6WPUYSkLr56lLO0VcEWtnrRY95wkCuVJhPPiEX9W1k83nwpPPriuhV
         iyP6x1NA2aE8kXVggZAkogfzK+NouvqvRlX1OFDJiCYemTh+AKCubtMzI1IR0jD6B1ZA
         qxhycvTu2gVAUuw/T/C8MFevTOuJnW/VPn5+UOOlC6Pn+HmMeAb9LRAFaAdJjMM5lKpK
         V4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714054356; x=1714659156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgj3m/Cw0cxG7wHpYlRihQfjnwxhhxsXHcabhCA3Erw=;
        b=EY8PEQULzU5kMNJPMkKN9miKXQMTBTZUFAiQA4oVb7f2siomBIwk+yfWGr61sLkITa
         J1pv+nGpqaGbcUVAQMklN8oxynmDkigEz070/SgMD9PPoR7okABotiFEfK2/7SMTM4OB
         wFnFlua9942pneIYW4bI84OXjT1BBQ2Sr4dioem7GwgW02jHyF1ECyUQATrs4wc2AdSu
         ehaxjU7aJY4rS8f4S1eNTA81uxEDRAwPJVzsvg5wwL6xI58jfL/bKrMl5IAPXjrEDW4x
         WXeMAdQmjB0gyWu+uQUwnx1CA6oRkO1IwMMcwBRKVK4LNWEshRGc+0tCZyjKeH6W3a1o
         pEkA==
X-Forwarded-Encrypted: i=1; AJvYcCU9IOaCpAamBmxGYcjIxUeqyOk/72C8TLIi1gxo36r09airWUG5+Z6EBcrYIP03v1GNhJfSMxykyNjzCcI8KnIOx9dE3y92YeT5UQ71MA==
X-Gm-Message-State: AOJu0YyLkGrNHuBaeOzoIh4lLuw1TBvBH2BMV/4bvScqkkUQkX39GKNv
	xj+34AYlMO3NaL7GbzGsTlAEKcZ2riWmQ6DePIKvaSLl7ZH1drG6YaZGvEVXoPM=
X-Google-Smtp-Source: AGHT+IG4h73e/VD0OiMdGC2ljHdBFoL8+iSdydmC9vOMTBe1nYjTZzgcSwjFqh+dbSJpqsAZN+aRMQ==
X-Received: by 2002:a2e:818a:0:b0:2de:4b8d:ee31 with SMTP id e10-20020a2e818a000000b002de4b8dee31mr3860645ljg.37.1714054356205;
        Thu, 25 Apr 2024 07:12:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg16-20020a05600c539000b0041aa8ad46d6sm10244618wmb.16.2024.04.25.07.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 07:12:35 -0700 (PDT)
Date: Thu, 25 Apr 2024 17:12:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to
 KVM_SET_USER_MEMORY_REGION2
Message-ID: <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-26-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-26-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, Benjamin Copeland <ben.copeland@linaro.org>, Marc Zyngier <maz@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digik
 od.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
> Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
> support for guest private memory can be added without needing an entirely
> separate set of helpers.
> 
> Note, this obviously makes selftests backwards-incompatible with older KVM
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> versions from this point forward.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is there a way we could disable the tests on older kernels instead of
making them fail?  Check uname or something?  There is probably a
standard way to do this...  It's these tests which fail.

 kvm_aarch32_id_regs
 kvm_access_tracking_perf_test
 kvm_arch_timer
 kvm_debug-exceptions
 kvm_demand_paging_test
 kvm_dirty_log_perf_test
 kvm_dirty_log_test
 kvm_guest_print_test
 kvm_hypercalls
 kvm_kvm_page_table_test
 kvm_memslot_modification_stress_test
 kvm_memslot_perf_test
 kvm_page_fault_test
 kvm_psci_test
 kvm_rseq_test
 kvm_smccc_filter
 kvm_steal_time
 kvm_vgic_init
 kvm_vgic_irq
 kvm_vpmu_counter_access

regards,
dan carpenter

