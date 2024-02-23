Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CED86108E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 12:38:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=eSAhnN4a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th7L80s1Fz3vYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 22:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=eSAhnN4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th7KM1JBNz3dRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 22:37:25 +1100 (AEDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Th7K92jZGz9ssc;
	Fri, 23 Feb 2024 12:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1708688237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/cnYUO4t1KnFyWBtPESWQ1mYGZ8vow6mQdKLDyR1pc=;
	b=eSAhnN4ahg6PeXaRexhK/avhwA+IWYb3jKCemeJYcLlzdezH8LgnibRcp4AkSVTxE8v8ZA
	gTyXWYgq8lX9Yj4FcUi4uMow0ZZwnqiqs+f3HJC2SAki1v/iE/dcTtPl/mf1J7Ek18mt1w
	9s0H+i8+WEpqYepKcDTk4XsQ0cYF39gLnlUOKUrkyymJ99o8jWgmTfXhKgYz0rQlq/V6kj
	dNzyLuSWsQj5sHhm6Q8P3OxxsEvuQXQZPy36uFkeZd1hTRNXLn14SH/gh2rcIt8KqaGopS
	/uxiB5/Hoyv/IwhjYU9SRJSYEywY6k9uLXkir1Yv109X1K7tp0a9fm9V0hvGAA==
Date: Fri, 23 Feb 2024 12:37:13 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: "test_ip_fast_csum: ASSERTION FAILED at
 lib/checksum_kunit.c:589" at boot with CONFIG_CHECKSUM_KUNIT=y enabled on a
 Talos II, kernel 6.8-rc5
Message-ID: <20240223123713.2e49b981@yea>
In-Reply-To: <b2a7b678-fc59-4d12-acc3-696866cfd7c2@csgroup.eu>
References: <20240223022654.625bef62@yea>
	<528c6abf-e5ef-42cd-a5d7-6ede3254523d@csgroup.eu>
	<Zdg3X4A1eJsJ+ACh@ghost>
	<6c37ffa2-8642-46c0-89ba-1f1e29b094d9@csgroup.eu>
	<ZdhCnoRu3i1Cnwks@ghost>
	<b2a7b678-fc59-4d12-acc3-696866cfd7c2@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8gai3cka79z68h461yeewwdpd8k1qg58
X-MBO-RS-ID: 26b6a50f4d4151b2f26
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Charlie Jenkins <charlie@rivosinc.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Feb 2024 09:06:56 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Yes, with second patch is magically works, meaning the patch description 
> is not correct because the problem for powerpc it not at all related to 
> memory alignment but to endianness. And endianness should have been 
> fixed by patch 1, but instead of it, patch 1 just hides the problem by 
> forcing casts.
> 
> The real fix for endianness which should be your patch 1 is the 
> following change. With that change it works perfectly well without any 
> forced cast:
> 
> diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
> index 225bb7701460..bf70850035c7 100644
> --- a/lib/checksum_kunit.c
> +++ b/lib/checksum_kunit.c
> @@ -215,7 +215,7 @@ static const u32 init_sums_no_overflow[] = {
>   	0xffff0000, 0xfffffffb,
>   };
> 
> -static const __sum16 expected_csum_ipv6_magic[] = {
> +static const u16 expected_csum_ipv6_magic[] = {
>   	0x18d4, 0x3085, 0x2e4b, 0xd9f4, 0xbdc8, 0x78f,	0x1034, 0x8422, 0x6fc0,
>   	0xd2f6, 0xbeb5, 0x9d3,	0x7e2a, 0x312e, 0x778e, 0xc1bb, 0x7cf2, 0x9d1e,
>   	0xca21, 0xf3ff, 0x7569, 0xb02e, 0xca86, 0x7e76, 0x4539, 0x45e3, 0xf28d,
> @@ -241,7 +241,7 @@ static const __sum16 expected_csum_ipv6_magic[] = {
>   	0x3845, 0x1014
>   };
> 
> -static const __sum16 expected_fast_csum[] = {
> +static const u16 expected_fast_csum[] = {
>   	0xda83, 0x45da, 0x4f46, 0x4e4f, 0x34e,	0xe902, 0xa5e9, 0x87a5, 0x7187,
>   	0x5671, 0xf556, 0x6df5, 0x816d, 0x8f81, 0xbb8f, 0xfbba, 0x5afb, 0xbe5a,
>   	0xedbe, 0xabee, 0x6aac, 0xe6b,	0xea0d, 0x67ea, 0x7e68, 0x8a7e, 0x6f8a,
> @@ -577,7 +577,8 @@ static void test_csum_no_carry_inputs(struct kunit 
> *test)
> 
>   static void test_ip_fast_csum(struct kunit *test)
>   {
> -	__sum16 csum_result, expected;
> +	__sum16 csum_result;
> +	u16 expected;
> 
>   	for (int len = IPv4_MIN_WORDS; len < IPv4_MAX_WORDS; len++) {
>   		for (int index = 0; index < NUM_IP_FAST_CSUM_TESTS; index++) {
> @@ -586,7 +587,7 @@ static void test_ip_fast_csum(struct kunit *test)
>   				expected_fast_csum[(len - IPv4_MIN_WORDS) *
>   						   NUM_IP_FAST_CSUM_TESTS +
>   						   index];
> -			CHECK_EQ(expected, csum_result);
> +			CHECK_EQ(to_sum16(expected), csum_result);
>   		}
>   	}
>   }
> @@ -598,7 +599,7 @@ static void test_csum_ipv6_magic(struct kunit *test)
>   	const struct in6_addr *daddr;
>   	unsigned int len;
>   	unsigned char proto;
> -	unsigned int csum;
> +	__wsum csum;
> 
>   	const int daddr_offset = sizeof(struct in6_addr);
>   	const int len_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr);
> @@ -611,10 +612,10 @@ static void test_csum_ipv6_magic(struct kunit *test)
>   		saddr = (const struct in6_addr *)(random_buf + i);
>   		daddr = (const struct in6_addr *)(random_buf + i +
>   						  daddr_offset);
> -		len = *(unsigned int *)(random_buf + i + len_offset);
> +		len = le32_to_cpu(*(__le32 *)(random_buf + i + len_offset));
>   		proto = *(random_buf + i + proto_offset);
> -		csum = *(unsigned int *)(random_buf + i + csum_offset);
> -		CHECK_EQ(expected_csum_ipv6_magic[i],
> +		csum = *(__wsum *)(random_buf + i + csum_offset);
> +		CHECK_EQ(to_sum16(expected_csum_ipv6_magic[i]),
>   			 csum_ipv6_magic(saddr, daddr, len, proto, csum));
>   	}
>   #endif /* !CONFIG_NET */
> ---
> 
> Christophe

Your patch applied on top of 6.8-rc5 fixes the issue. Thanks!

And I take your remarks here as a hint for the other "drm_test_fb_xrgb8888_to_xrgb2101010 on Big Endian machines" issue I posted. ;) Let's see what I can do.

Regards,
Erhard
