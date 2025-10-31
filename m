Return-Path: <linuxppc-dev+bounces-13641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A8C24106
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 10:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyb144qRJz2xdg;
	Fri, 31 Oct 2025 20:15:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761902120;
	cv=none; b=mEdUwwENP5/48AoyU+c7DLl3io557iNYi/777t+qlf68WW7Ocgih+YZWaTn34vQBqv0cF1z03jtV10LkC8zjRNr3S9xsiIApOASVdQu4JAULQJ3g++vT+8Izbcxnkw0DkUeK2SX6y018pAJ9TCo0dGrB+rWrEEbqG9kBDQMoX9Ft3DhgaHee7aaXz36RDnYAP+R2k5Er34sMoTm2QuDOgx8kwaPTbBZAzkub1LTPLYs8auE1xwIyXGqu+PAEdR5gpeTZbWVRfPSuyKOkTPGOnsaBBsXWO0w+b2yP0Y3QrGo6AlKhoz1fyrpzLq+BF0D0mA0Y4OWqIQOGS2X2/QJmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761902120; c=relaxed/relaxed;
	bh=PEZyjCEAirGsnd1ualshLT165jeP3bC2ATQpTmkSqys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ract9xsLTn7sAFVvYs1WkljYUjpsKf+F/+BU+58cXZoNnAA6fP+v7edYSW6/JNPI0uTB5yCE5ujTt0qomWnX1jYkMpIRAfg/iShJHAmj/JHQMlUKAWmtf5D+rwijaA8ka0yOmjSvyhDHzQeqpVwRpx7PAU0fECUc/HYjqrCvijNeWU2dBAM4CExce/joJbErbyZkFL9kheygpkPDapskZoTJ0AZYFA6/bmwCPFUh3yjrnN7kYuGrN9Qr1tl2nJPhdMYyvMEYkwk4Gof9LGH+OLuIgsEZksl1S3IwYr8k3ieyz/XORpMeErBAZ9CjweW2Xq67Hzujons1zYIeXWi6fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WcCj5oD0; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WcCj5oD0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=binbin.wu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyb133Bj5z2xPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 20:15:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761902120; x=1793438120;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PEZyjCEAirGsnd1ualshLT165jeP3bC2ATQpTmkSqys=;
  b=WcCj5oD0u3zhbShu6vPwdHnGv45HkFutP4XpTLr9oQ+lqdLQ/nb6DySR
   uVUvXaiD/VpZiPDt96Mkgl65WCWkb45dA10EAbNra0ic8m7tQqSKH7ZS7
   xxSOgkk7UHhGeQPye025TecTI1ONC0WvNiQ3ElThXIgT0+C5JGG+k5wdi
   EM+XVIvSThBDvxmc3KaEqqJ+2aSFGZiJ/U6RgQBYNWb6y9/jKi/UL8D9C
   j2DJVFbUVI25vFVZ2fefHwONQCyGAg7JE+WVhuxSN+NBwbqZuo/eJLqYo
   CxiY1T6UETb+ozqpZVi8Pe67mwn9RK8ROVIPXqNeobovDjpe5AER8fbq1
   g==;
X-CSE-ConnectionGUID: uFry4uJdQ7GnxOQsOEIY3A==
X-CSE-MsgGUID: lWNBomPjSs6pR+4U2U1Hog==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75509920"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75509920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:15:18 -0700
X-CSE-ConnectionGUID: /aUTuTUZR1CXvXYAACxkEg==
X-CSE-MsgGUID: 8/kgW76KTTCO7UxJ6gCbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186125404"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:15:09 -0700
Message-ID: <fd65c501-296a-4f77-86fc-7de61a7c5eeb@linux.intel.com>
Date: Fri, 31 Oct 2025 17:15:06 +0800
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
Subject: Re: [PATCH v4 23/28] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU
 to "unlocked" vCPU ioctl
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-24-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-24-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Handle the KVM_TDX_INIT_MEM_REGION and KVM_TDX_INIT_VCPU vCPU sub-ioctls
> in the unlocked variant, i.e. outside of vcpu->mutex, in anticipation of
> taking kvm->lock along with all other vCPU mutexes, at which point the
> sub-ioctls _must_ start without vcpu->mutex held.
>
> No functional change intended.
>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


