Return-Path: <linuxppc-dev+bounces-4566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C579D9FFC61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 17:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCVR1wv8z2yJ5;
	Fri,  3 Jan 2025 03:54:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735836879;
	cv=none; b=Wf+YTyJi3RGAjQfc7BotXjqqiV1+Fxg6lYvx+tnCnrca82AswDSWw2TUIuh7V9Md8ZnYg26NdiKL9jXCogaGLD7It+kBwlzW4luuD9Up8fEsAg0XGKDkIcL4uJG+v/lEBWRY++dqLOmoKn85LJZgVYJVdW7PPCGp6sdEgYnTNtLIk0VPNe54bjT30uVe+4YTlT5c/7bupqceYFye+9yh7YRQTOAQWZUaD7kD/IHpxkPiC3zyhhApyBhRMVZBpr8pSgSV9gNCmMuQ7ot+mrQHDKl36wlLI0gSbaLU6UnSTpnGMNkyO9LnfnCL6Q1D3N6w1WgNva2WHN+FdROwgjngXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735836879; c=relaxed/relaxed;
	bh=sCBzV52clRZewxzKvyJND6V/O+edFzGisB1HLVdLyCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCOLff1oYyFGRVnBrgDKET+N7PRSaTDOLiHecTBVQh0AD2VA1l3F/ewqOdwTNYzjSFP/A0QQHSvcntsFXa2A3999/3uLf8D6ofJp7B5l7FqthMB8Xf7YAOyi5lStkn2ZBr/SYMBJohLpcgpS6oSr0NG6L1wzUA1SH61XNoDh8d9NeCWPnFVNHKCPx3s/IAgjrWstCY+1UuEOipFwKqM9bhsG1lp47nPeDghPGFtPXPL5g9hXbukHV+h/MwdMBRwTJmaMpaz3Gh5BOzMlZ4dtHeRFjN/EXMnqoxymC+N/c3MU5wu6lkqvRE5OkN8yMp+dytX8S2JhoT8z0AG1K9LPbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCVP5G26z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 03:54:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E835A11FB;
	Thu,  2 Jan 2025 08:54:30 -0800 (PST)
Received: from [10.57.91.208] (unknown [10.57.91.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3632B3F673;
	Thu,  2 Jan 2025 08:53:54 -0800 (PST)
Message-ID: <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
Date: Thu, 2 Jan 2025 17:53:52 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 30/12/2024 10:07, Qi Zheng wrote:
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 551d614d3369c..3466fbe2e508d 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -108,8 +108,12 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
>  static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
>  				  unsigned long addr)
>  {
> -	if (pgtable_l5_enabled)
> +	if (pgtable_l5_enabled) {
> +		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
> +
> +		pagetable_p4d_dtor(ptdesc);
>  		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));

Nit: could use the new ptdesc variable here instead of calling
virt_to_ptdesc().

- Kevin

