Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8773A200
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 15:38:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PM/tp5OV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn1g160qMz3bnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:38:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PM/tp5OV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn1f52RJMz306B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 23:37:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687441085; x=1718977085;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=88JqeT9MZdKfshSYWUg9b2Zs8SDEVOQUaP4tUg0s77U=;
  b=PM/tp5OVCkLWVnBBGAOPw9xoCnJvu5i8vOtCvOcy2+e3jPFwv91eqM77
   +GUjSp20Q/nvcyylMVOS/IZ4xTWY4eJBoXFChqk766cmgQLzcc8P6o8lT
   iEl7Ynt78wOZLV3ffWvuLZtN/yO2KqZ2+WOPpKUeU5ENpQe0MxV4y2QJy
   VWHD2/20dX3upqBYsjXId3/2fpOjHsENhtwH8g5z+B4Sc8FSfNN/g6g9j
   NWkyR5Er4z72xf8wNThyniKCESZMREWSrhSnzoUgYdEhrWvfK2Ibwt0u3
   /JPGRXF9Cj4yzsw1RAAKZx2mOKlc2qIQufEOu6TZIS56zPdG2enW2KHXB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357982800"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="357982800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1045176209"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="1045176209"
Received: from pajgaonk-mobl1.amr.corp.intel.com (HELO [10.212.235.136]) ([10.212.235.136])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:37:51 -0700
Message-ID: <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
Date: Thu, 22 Jun 2023 06:37:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
Content-Language: en-US
To: ypodemsk@redhat.com, mtosatti@redhat.com, ppandit@redhat.com,
 david@redhat.com, linux@armlinux.org.uk, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 keescook@chromium.org, paulmck@kernel.org, frederic@kernel.org,
 will@kernel.org, peterz@infradead.org, ardb@kernel.org,
 samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de,
 rmk+kernel@armlinux.org.uk, geert+renesas@glider.be,
 linus.walleij@linaro.org, akpm@linux-foundation.org,
 sebastian.reichel@collabora.com, rppt@kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230620144618.125703-3-ypodemsk@redhat.com>
 <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
 <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/22/23 06:14, ypodemsk@redhat.com wrote:
> I will send a new version with the local variable as you suggested
> soon.
> As for the config name, what about CONFIG_ARCH_HAS_MM_CPUMASK?

The confusing part about that name is that mm_cpumask() and
mm->cpu_bitmap[] are defined unconditionally.  So, they're *around*
unconditionally but just aren't updated.

BTW, it would also be nice to have _some_ kind of data behind this patch.

Fewer IPIs are better I guess, but it would still be nice if you could say:

	Before this patch, /proc/interrupts showed 123 IPIs/hour for an
	isolated CPU.  After the approach here, it was 0.

... or something.
