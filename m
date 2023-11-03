Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EB7DFE83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 05:11:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6jRt2oX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SM6kY3CMsz3dBG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 15:11:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6jRt2oX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=yilun.xu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SM6jd3c8Xz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 15:10:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698984646; x=1730520646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=juHXPhfl2UOyfQDlVnje9FjGKXxO1moD004mEr2wKcQ=;
  b=h6jRt2oXgSHkI1OFqV/XMViw6HMRBY/IZVD2LFK8PS2azzktfvpG0yDq
   AupxRVXSTG375Cn2ZglJVE4QrtzmwSir+pBGYMd8FRV059hRLVxLS51uh
   svHCZOMicuT5XA7QIwk6BFbDfeE0xGMulS4gdQsLoj8P+WrOvqV/Sk/9b
   L7ilnei4ge7PNAqrvxbRK0pUdXrleIrC3Gwuzku4tWQVD2eAs2FhMC7wP
   lpYfBdk6PzfQRYkARQQtfNGLP0h11jD8fyze4aFpZ0VLz8++hh5mgTdFJ
   cO2iyepk1/tmU796Jbn/GnWkBtBeky9IDaHxs2U7qEALfZPuKM1sk2mtz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387762868"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="387762868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 21:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008694807"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1008694807"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 21:10:28 -0700
Date: Fri, 3 Nov 2023 12:09:01 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
Message-ID: <ZURyXWhZDSCBnMV1@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 11:21:51AM -0700, Sean Christopherson wrote:
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>  
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
                  ^

Should update to "memory_fault" to align with other places.

[...]

> @@ -520,6 +521,12 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>  			__u32 flags;
>  		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
>  		/* Fix the size of the union. */
>  		char padding[256];
>  	};

Thanks,
Yilun

> 
