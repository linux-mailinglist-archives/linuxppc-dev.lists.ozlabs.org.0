Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BB6EE8C9926
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 09:11:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SwmpOU74;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjT9R2nkGz3fmm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 17:05:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SwmpOU74;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjT8m07xSz3cWx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 17:04:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716188696;
	bh=RoV6VIkaAluYtFGJCDi1Z/NPqWiUqa7zI7Xfg4Z2ElY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SwmpOU74v7iueWM0M4jzR0SSrYnUqrg9pTXGUHWbEImhkFE6CCjSQALlemjffjzUS
	 rTJPNL2bYsaI51L9wkKVUxPWjtiSWFiG3hMGQ09uGLLHmuiTEiabqsFD7nvqZPSP6q
	 G6i1Mhg5loGDMEuhFFBVNyeuTbYfGhwS3flwn5rid/8jDwxd5JCseOmRVA4AZZ+/lJ
	 Vu5Zva3Ykzoehr15evLo86ICfPENU3pt3Wbqv5Uo2pqJI0ldiP2xOGX4v70fpOjqio
	 c3w4Gk4Lf1fywLRB8Uwa/5KnKXxjiUB2+qkPgs6ypF6MwBs3KHgCVwKkjkpAhVufiA
	 LeWPLdIuH7G/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjT8l5qWsz4wc3;
	Mon, 20 May 2024 17:04:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: cve@kernel.org, linux-kernel@vger.kernel.org,
 linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2023-52665: powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
In-Reply-To: <2024051725-CVE-2023-52665-1d6f@gregkh>
References: <2024051725-CVE-2023-52665-1d6f@gregkh>
Date: Mon, 20 May 2024 17:04:55 +1000
Message-ID: <87zfslufoo.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> Description
> ===========
>
> In the Linux kernel, the following vulnerability has been resolved:
>
> powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
>
> Commit 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian
> builds"), merged in Linux-6.5-rc1 changes the calling ABI in a way
> that is incompatible with the current code for the PS3's LV1 hypervisor
> calls.
>
> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
>
> Fixes run time errors like these:
>
>   BUG: Kernel NULL pointer dereference at 0x00000000
>   Faulting instruction address: 0xc000000000047cf0
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   Call Trace:
>   [c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
>   [c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
>   [c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8
>
> The Linux kernel CVE team has assigned CVE-2023-52665 to this issue.

IMHO this doesn't warrant a CVE. The crash mentioned above happens at
boot, so the system is not vulnerable it's just broken :)

cheers
