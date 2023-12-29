Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9DD81FE53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 09:54:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eVyvXw8l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1fLw71Sbz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 19:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1fL04pNSz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 19:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=9njuBDN9ld9CoGZTPj9YwY0U3/PER/6GYsJZeAgW3IE=; b=eVyvXw8l0J7bvcByL70k4KTIxc
	nUjL7fwVXzLaiDH/ULtR8ZdUWr1JeX7RiA5RdM1IWAt7XulaGEO1/xay/VeYmvlBhzI+IbSKud6+S
	HZCY92iJI4/4ysuBhdZ54tQO8cCha4ZcK5wNkYLNl4M1DSxVt57S3hLIxKiGjCUg4nrkIOZ2Tpdzv
	adPotuFWL0IsUurssCyNjlWNa1w35bZR0dKbwrFxshzzKqmWu9hhEMVByjxD7qslI59X8Ep+t8LZE
	SL6vj5VeDzmG8Avdxu4nkm0zK69++06y50WaG1Ft66TlYMxbp3wOEg1xIjVmI54COQg3q/06KzaAo
	O3wPIZnA==;
Received: from om126255101095.24.openmobile.ne.jp ([126.255.101.95] helo=[192.168.43.165])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rJ8cB-0064ib-OR; Fri, 29 Dec 2023 08:53:13 +0000
Message-ID: <8991a6d9-bf19-4c15-9803-3238cb41aa80@infradead.org>
Date: Fri, 29 Dec 2023 17:53:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] powerpc/ps3: Fixes for lv1 hcall assembly
From: Geoff Levand <geoff@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20231227072405.63751-1-npiggin@gmail.com>
 <ddfd8c20-0bc8-4373-b7a5-27dd2d00ee69@infradead.org>
Content-Language: en-US
In-Reply-To: <ddfd8c20-0bc8-4373-b7a5-27dd2d00ee69@infradead.org>
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

Hi Nick,

On 12/27/23 18:50, Geoff Levand wrote:
>> Nicholas Piggin (3):
>>   powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
>>   powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
>>   powerpc/ps3: Make real stack frames for LV1 hcalls

I tested these patches applied to v6.7-rc7 on PS3 with
CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2=y, and they seem to be working OK.  I did
not do any extensive testing though.

I tested three configurations:

 - With only the first patch 'Fix lv1 hcall assembly for ELFv2 calling
   convention' applied.

 - With the first two patches, 'Fix lv1 hcall assembly for ELFv2 calling
   convention' and 'lv1 hcall code use symbolic constant for LR save
   offset' applied.

 - And with all three patches applied.

All three configurations worked OK.  Thanks again for working on this.

Michael, I think we can just add these three patches and remove my patch that
disables CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2.

Tested-by: Geoff Levand <geoff@infradead.org>

