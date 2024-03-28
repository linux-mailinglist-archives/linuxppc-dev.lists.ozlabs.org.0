Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E188F778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 06:52:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tttGRj5y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4t3W1D0Tz3vk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 16:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tttGRj5y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vgupta@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4t2n4Ntsz3vf1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 16:51:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5D0460DCD;
	Thu, 28 Mar 2024 05:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4998EC43390;
	Thu, 28 Mar 2024 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711605102;
	bh=6kv4U+OlSY+qlQflghGbIVo8TBSoBTX2u5cN0RYYRzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tttGRj5ylh9xVO642wPR1F2Asn5IsF3J1IDJ9pqvnIh1qj6XQgGrpl4six+k1HHRf
	 aoU7KuEjvUv5Ii9zuOT+mH6BtpmkaBTz4FcZS6L0LCZTPajk2hXlbfy/k1hVU+NZ28
	 Wg4db9y1MDaDrXtFBBEgTQekHUKH7dUpja3VbrZJgu7ADxfru+YZW5u7cB9IMMs8zC
	 mrubWP/EDVcMLefx6YTk6HA9erGzEt7LjzHG8vGbMoVsnZ2OEqqw0kIfJszeXgBiPy
	 1PPy5iqTnZAlh9yVfb4I75n6QCxgZoMfaqW4bU26A3LhUrFRRN7YufRgRneeNEP5Gc
	 5Xn0oSBC206dA==
Message-ID: <3360dba8-0fac-4126-b72b-abc036957d6a@kernel.org>
Date: Wed, 27 Mar 2024 22:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
To: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 peterx <peterx@redhat.com>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Matt Turner <mattst88@gmail.com>, linux-arm-kernel@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+CC Alexey

On 3/27/24 09:22, Arnd Bergmann wrote:
> On Wed, Mar 27, 2024, at 16:39, David Hildenbrand wrote:
>> On 27.03.24 16:21, Peter Xu wrote:
>>> On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
>>>
>>> I'm not sure what config you tried there; as I am doing some build tests
>>> recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
>>> avoid a lot of issues, I think it's due to libc missing.  But maybe not the
>>> case there.
>> CCin Arnd; I use some of his compiler chains, others from Fedora directly. For
>> example for alpha and arc, the Fedora gcc is "13.2.1".
>> But there is other stuff like (arc):
>>
>> ./arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
>> ./arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration of 
>> function 'write_aux_reg' [-Werro
>> r=implicit-function-declaration]
>>     82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
>>        |         ^~~~~~~~~~~~~
> Seems to be missing an #include of soc/arc/aux.h, but I can't
> tell when this first broke without bisecting.

Weird I don't see this one but I only have gcc 12 handy ATM.

    gcc version 12.2.1 20230306 (ARC HS GNU/Linux glibc toolchain -
build 1360)

I even tried W=1 (which according to scripts/Makefile.extrawarn) should
include -Werror=implicit-function-declaration but don't see this still.

Tomorrow I'll try building a gcc 13.2.1 for ARC.


>
>> or (alpha)
>>
>> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/crypto.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/crypto_algapi.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/aead.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/crypto_skcipher.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!

Are these from ARC build or otherwise ?

Thx,
-Vineet
