Return-Path: <linuxppc-dev+bounces-4890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB9A06D92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 06:28:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTCxJ2TFWz30Wp;
	Thu,  9 Jan 2025 16:28:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736400500;
	cv=none; b=aomQ8eYMRsghTNrAjqQvse5B2Opeao5wdk7WcQxjO52O10A1j/3XKBqy0FoI9fD6svnAL9hLWylWcSQ2qtQ1Gmq9Hn5T8chZTkfs82j9p0eY166p+RSLX7vCtTHQxv98oaREVITB037MAU7rZHuqFrBNCjmk5pf8gu3lpP2w25rHqDm69FVmMiqIbEIC4Zw8dzjNpAmVsIHXDqBf7+AVlUjLUH7kLQJEQVB0x2NqLGwSp2Lom6KFPq2bWPp9QMNrAz4XWklIi18RhdvSL3emOVztaviRLlmXdJSHnUIfsnPOvEzIDOnhif7M1OfWB33mJipXSZapT3Q949+44J4Neg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736400500; c=relaxed/relaxed;
	bh=0TfaGrdmaLKsDN+gqpbMDvokvQkCFmzIItORCHqt/hE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HTqXIlTRMW6cRdND+pjdfPx+8Fxq4u0Eas22mTtQW1SL/SNfk7tMC9XWYIyu5/YrRhhoi/wx59aOmp3kMDpO/oDKLLGGtexmVNgApUivMHAVcf9vhykcTwKB9ZYk/QDiIgWXSuAkVGA+kvnuBKdAsFSMZfcdaMpU0XKBoPUQaKP1Lu1jBo81+/wb29o3yoQaPLd837JobfaNtavZgSHoQMf8ugUA9LxkLilnbv5GViYDvFchcZNrq5ozNgCe9f2tSmDROSxAFjmv7OF9n7+2rIIvYTeCBvE8QkpURS7IC8GiWjnQGsaMrnjsbEDPDQQ+HLouCf47yc1iz5zWETfcvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=U+PgSr7t; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=U+PgSr7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTCxG6XNTz30W0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 16:28:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B48EE5C55C3;
	Thu,  9 Jan 2025 05:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C924C4CED2;
	Thu,  9 Jan 2025 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736400494;
	bh=JMzL7Jny9Qk/AWUNPZhjwmy7z3WhByQRQQvBVP0BM5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U+PgSr7tNogufpsgUKvrA3Lefa/H9gboswSYdrD6N96CPWFnk+1a6tF0Q0Ii9oUVE
	 rvn1vkeI/CGuw+cMXoTOn9Iostx/N1URp4FtNDQ//DJvW2BBO0NSNPaHocyTeqeILZ
	 n1/Z++kM5D2KOg0G0eVgwQvL1PPSIoUnB6WqMKjI=
Date: Wed, 8 Jan 2025 21:28:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Baoquan he <bhe@redhat.com>, ebiederm@xmission.com, Hari Bathini
 <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kexec: Initialize ELF lowest address to ULONG_MAX
Message-Id: <20250108212813.ebc0014e384e9996ab72db40@linux-foundation.org>
In-Reply-To: <ea2d2f5d-5410-4f7e-a3f5-258c432e9be9@linux.ibm.com>
References: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
	<Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
	<ea2d2f5d-5410-4f7e-a3f5-258c432e9be9@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 9 Jan 2025 09:42:14 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Hello Baoquan and Eric,
> 
> 
> On 12/12/24 08:25, Baoquan he wrote:
> > On 12/10/24 at 02:43pm, Sourabh Jain wrote:
> >> kexec_elf_load() loads an ELF executable and sets the address of the
> >> lowest PT_LOAD section to the address held by the lowest_load_addr
> >> function argument.
> >>
> >> To determine the lowest PT_LOAD address, a local variable lowest_addr
> >> (type unsigned long) is initialized to UINT_MAX. After loading each
> >> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
> >> address is lower, lowest_addr is updated. However, setting lowest_addr
> >> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
> >> returned lowest PT_LOAD address would be invalid. This is resolved by
> >> initializing lowest_addr to ULONG_MAX instead.
> >>
> >> This issue was discovered while implementing crashkernel high/low
> >> reservation on the PowerPC architecture.
> >>
> >> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
> >> Cc: Baoquan he <bhe@redhat.com>
> >> Cc: Hari Bathini <hbathini@linux.ibm.com>
> >> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: kexec@lists.infradead.org
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> >> ---
> >>   kernel/kexec_elf.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> >> index d3689632e8b9..3a5c25b2adc9 100644
> >> --- a/kernel/kexec_elf.c
> >> +++ b/kernel/kexec_elf.c
> >> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
> >>   			 struct kexec_buf *kbuf,
> >>   			 unsigned long *lowest_load_addr)
> >>   {
> >> -	unsigned long lowest_addr = UINT_MAX;
> >> +	unsigned long lowest_addr = ULONG_MAX;
> > Great catch.
> >
> > Acked-by: Baoquan He <bhe@redhat.com>
> Thank you for the Ack! The upcoming two patch series, which aim to 
> enable generic crashkernel reservation, depends on this fix. One of them 
> is already posted for upstream review: 
> https://lore.kernel.org/all/20250108101458.406806-1-sourabhjain@linux.ibm.com/ 
> I was wondering if you could guide us on how to get this fix pushed to 
> the mainline tree.

Please include this patch (with Baoquan's ack) in whichever tree
contains the powerpc patches which depend upon it.

