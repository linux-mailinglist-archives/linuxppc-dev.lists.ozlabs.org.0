Return-Path: <linuxppc-dev+bounces-12663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBBBB8854
	for <lists+linuxppc-dev@lfdr.de>; Sat, 04 Oct 2025 04:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdq046rXTz3dBb;
	Sat,  4 Oct 2025 12:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.178.132.221
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759512261;
	cv=none; b=NP6QQRxU8vYhPm+GIQCA6q7dgWp1sJ+lfvPZ/8xXe53psFLx9744frlZI3WqccXr//cm4xj8jd/RTywQNdLwP1X2DZDuHBTlVeNAAfyQOy3/bM5w/MNm0FzA2pZph2UaHwk/f1Uo4W/e/vsA6N/h0sLChR+3Qy7wryjEbU8ZKITxaa+BMLnbA0GxXYLCXlsfjC7TRTP+ztb/QVt1FSSpo+PX49IOWd8lrJSd81KUVYvqWZJwTchHbOse3wlhPveMJH02GJvtVmUZyWsq4M9iUGCKdhYpnvCwLdFNkeuC2vkb9Qsr4iAn8vAC7tLk/W+PnC/Ka9NzfpE7vqcLbB7sfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759512261; c=relaxed/relaxed;
	bh=eKU8SJ09O6RAdk9rzTuf+EPgBar7M5OPCHBeslmadhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cUQSF+LpsDEF9Av9rTmGmnAr/0OHqL7GfVzteLEFvnSur+79iWiAdA84wIziDEZznxjMNiFwzAwJRkzGovSf9ZBH9fwE5h/6yDNnCaGz5H8nvT+GZIsMa/H6M3yLgJJu5DvVwyrLEMkFFlJVejiSf9aXmJp6zBnVpaU7OAzsVRXiVRz0pDfNA6J2GXq4Aol7SM5TrTkRSPEmIPL8JOXtIK7PLOg/AnDqiISiPmI3Z+elwXZ3+gjPsXtw7j08tyZPDy9kGDzFbx0VszxbNz1wdPB7c5MYlEk1flPubJrFx4ldlf7Kdm110fg2EghTeQ96ZeGP3msEL+5b9iwZo4o59w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=JWksdeCh; dkim-atps=neutral; spf=pass (client-ip=63.178.132.221; helo=fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com; envelope-from=prvs=36448ed3a=kalyazin@amazon.co.uk; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.co.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=JWksdeCh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.co.uk (client-ip=63.178.132.221; helo=fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com; envelope-from=prvs=36448ed3a=kalyazin@amazon.co.uk; receiver=lists.ozlabs.org)
Received: from fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com [63.178.132.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdbBC2zHGz3d44
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 03:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1759512259; x=1791048259;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=eKU8SJ09O6RAdk9rzTuf+EPgBar7M5OPCHBeslmadhA=;
  b=JWksdeChu/pdNigi0g3HfgURaIpOlDzYWxp7I3N5b6zrRg/ECDTuoVMR
   BjDKYN4cCK6JBwEyKv91FWxkcQNZdXwfL1oycGwzDM3Cgz5guMxYCzXns
   YUCplvCqwc75yalbBnQ64+OR+92fzrfD+GKUQ3H/WM6apXpbDI+RxL2M1
   RRVOPcrbShRkVveBTJ44OllaBfRG91BLFQXA2KF6d3R2LyxQci4K3XGd+
   FJT+aFQnC5MGlbdOXcBnUnLGfBpdd3OI7hjBiZ2m9wA+Gir/mGUaX9eqX
   8O9DteSbzyHma93o0YBMCAFk4IRijyojqKivY+qyuHyrGoMJAYU2ME0h3
   A==;
X-CSE-ConnectionGUID: /bGeMqI5QHGO7ZeMBtXCHg==
X-CSE-MsgGUID: d1ZXsYzERHSwet8rfgRFpg==
X-IronPort-AV: E=Sophos;i="6.18,313,1751241600"; 
   d="scan'208";a="2975643"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-013.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 17:24:05 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:5746]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.33.147:2525] with esmtp (Farcaster)
 id f44c7b7f-75fc-43b3-8033-16cf4d5d0ded; Fri, 3 Oct 2025 17:24:04 +0000 (UTC)
X-Farcaster-Flow-ID: f44c7b7f-75fc-43b3-8033-16cf4d5d0ded
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 3 Oct 2025 17:24:04 +0000
Received: from [192.168.4.149] (10.106.83.12) by EX19D022EUC002.ant.amazon.com
 (10.252.51.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 3 Oct 2025
 17:24:02 +0000
Message-ID: <fc0bb268-07b7-41ef-9a82-791d381f56ac@amazon.com>
Date: Fri, 3 Oct 2025 18:23:57 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <kalyazin@amazon.com>
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	"Oliver Upton" <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
	"Michael Ellerman" <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson
	<seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>
CC: <kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Xiaoyao Li
	<xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, Chao Peng
	<chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen
	<jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, David Matlack
	<dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?=
	<mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve
	<vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, "Maciej
 Szmigiero" <mail@maciej.szmigiero.name>, David Hildenbrand
	<david@redhat.com>, Quentin Perret <qperret@google.com>, Michael Roth
	<michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, Liam Merwick
	<liam.merwick@oracle.com>, "Isaku Yamahata" <isaku.yamahata@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-16-pbonzini@redhat.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <20231105163040.14904-16-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.12]
X-ClientProxiedBy: EX19D013EUA004.ant.amazon.com (10.252.50.48) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 05/11/2023 16:30, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> memory that is tied to a specific KVM virtual machine and whose primary
> purpose is to serve guest memory.

...
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f1a575d39b3b..8f46d757a2c5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c

...

> -static int check_memory_region_flags(const struct kvm_userspace_memory_region2 *mem)
> +static int check_memory_region_flags(struct kvm *kvm,
> +				     const struct kvm_userspace_memory_region2 *mem)
>   {
>   	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
>   
> +	if (kvm_arch_has_private_mem(kvm))
> +		valid_flags |= KVM_MEM_GUEST_MEMFD;
> +
> +	/* Dirty logging private memory is not currently supported. */
> +	if (mem->flags & KVM_MEM_GUEST_MEMFD)
> +		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;

I was wondering whether this restriction is still required at this stage 
or can be lifted in cases where the guest memory is accessible by the 
host.  Specifically, it would be useful to support differential memory 
snapshots based on dirty page tracking in Firecracker [1] or in live 
migration.  As an experiment, I removed the check and was able to 
produce a diff snapshot and restore a Firecracker VM from it.

[1] 
https://github.com/firecracker-microvm/firecracker/blob/main/docs/snapshotting/snapshot-support.md#creating-diff-snapshots

> +
>   #ifdef __KVM_HAVE_READONLY_MEM
>   	valid_flags |= KVM_MEM_READONLY;
>   #endif
> @@ -2018,7 +2029,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>   	int as_id, id;
>   	int r;
>   
> -	r = check_memory_region_flags(mem);
> +	r = check_memory_region_flags(kvm, mem);
>   	if (r)
>   		return r;

