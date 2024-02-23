Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 421908624A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 12:45:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cTTMqFPx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThlSN0H72z3vZ6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 22:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cTTMqFPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThHhQ425Bz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 04:54:28 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cedfc32250so1031003a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 09:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708710864; x=1709315664; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EW5C3xAbB93Dl8HA3rkUUESot8i2S4c+lP8NyQ15EwA=;
        b=cTTMqFPxJvfo4KUCHBhRgTZc4FDDZGoXd+GtXde15tVgpxdE5+qfWkvMo/Gm+cn/4u
         5Hg2WyBE4cVGo/Ayys9Vtcqu9cYYia+5+u4HEVB2h2ENJmcbHQ0gmLgu78lQEJ2IwzKE
         0xJtYYQjCMF4jiAUWel0W6zdSiC3VBMvcMAgsryRXmTARi41CZ69MhA2BEUeTq67g+qf
         Fm/+ufEdx9YpjmNHA3EFhURQ5MqdqcJ/VRuaIzrg0ui9803AXkx8rTLRNb4eKvnougej
         gtSnZC046gkZ9O7vz534n8SiTQTdFaW260cBYh4SEAZ4oBzIOUkxVPghQtBzf/BYBHUQ
         Ew8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710864; x=1709315664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EW5C3xAbB93Dl8HA3rkUUESot8i2S4c+lP8NyQ15EwA=;
        b=ERV9Ej+cs9Ba9suwKWU5QIkk26INFGAPRvjOM1BLrO9gGMu9l+RHcjckXN+y7nMpnc
         ROkUTZiNDCVHXsYxX+DdBBolz0Tjngveac8T6FEemafqbmQHqPESKOUF+Pxkhyic0+5G
         S2ji2oDmbzKccv2+z4tC1/STc1VzkzuOkebhN6SLxtR9M171qgq0d4NBlA0dcBtMNToI
         FbaBepbS64xU9vatQb3cwW9WLEPDjvwR6MsDgFcUpb7q4ULBZxkz84fUHDoXbv5kYmtH
         mEhkw7/1A1qC6jrANF8EqSGKEpIYkt057Z84T4cA/Yj3Uv7D0FrYikPkHd7YQn2WXyz+
         tfqA==
X-Forwarded-Encrypted: i=1; AJvYcCXjVo10cYcI8ShhWRyU/4SUpAQ3C0/TcdxLQP8NnvB6LLhOc9N9RltmcaEGBEftzf9+jw+HcYFDRK9zuST8kHiU90sfp8BKNWs7yF5s0w==
X-Gm-Message-State: AOJu0YwKxZNtTmBJQgh5UDXs5BDHCCgTTPYcqLep/+GcX2eeBxe0r8/Q
	s9Y2tvIRoq972gitASZv1SPBmnN30WJqVZWUCJx3ASE0JLeQwC1VMr6r9VR+RDE=
X-Google-Smtp-Source: AGHT+IGNFyyaEi8tf90krOFfzHcAsGNEa49d8V1iRD6w/prtvv/1kt+U6lypuN1vV1fZ9snR2FEcCQ==
X-Received: by 2002:a05:6a20:9f90:b0:1a0:e468:f954 with SMTP id mm16-20020a056a209f9000b001a0e468f954mr824656pzb.4.1708710864333;
        Fri, 23 Feb 2024 09:54:24 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:a351:1ab0:98d6:3d53])
        by smtp.gmail.com with ESMTPSA id v18-20020a63f852000000b005dc87643cc3sm12523028pgj.27.2024.02.23.09.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:54:23 -0800 (PST)
Date: Fri, 23 Feb 2024 09:54:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v9 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <ZdjbzRdmeIRiZMC9@ghost>
References: <20240221-fix_sparse_errors_checksum_tests-v9-0-bff4d73ab9d1@rivosinc.com>
 <20240221-fix_sparse_errors_checksum_tests-v9-2-bff4d73ab9d1@rivosinc.com>
 <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30e4f267-86c2-4df6-9f33-d6f5fc77c4db@csgroup.eu>
X-Mailman-Approved-At: Sat, 24 Feb 2024 22:42:55 +1100
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
Cc: Parisc List <linux-parisc@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Helge Deller <deller@gmx.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 23, 2024 at 10:06:54AM +0000, Christophe Leroy wrote:
> 
> 
> Le 22/02/2024 à 03:55, Charlie Jenkins a écrit :
> > The test cases for ip_fast_csum and csum_ipv6_magic were failing on a
> > variety of architectures that are big endian or do not support
> > misalgined accesses. Both of these test cases are changed to support big
> > and little endian architectures.
> 
> It is unclear. The endianess issue and the alignment issue are two 
> independant subjects that should be handled in separate patches.
> 
> According to the subject of this patch, only misaligned accesses should 
> be handled here. Endianness should have been fixed by patch 1.
> 
> Also, would be nice to give exemple of architecture that has such 
> problem, and explain what is the problem exactly.
> 
> > 
> > The test for ip_fast_csum is changed to align the data along (14 +
> > NET_IP_ALIGN) bytes which is the alignment of an IP header. The test for
> > csum_ipv6_magic aligns the data using a struct. An extra padding field
> > is added to the struct to ensure that the size of the struct is the same
> > on all architectures (44 bytes).
> 
> What is the purpose of that padding ? You take fields one by one and 
> never do anything with the full struct.

sizeof(struct csum_ipv6_magic_data)) takes into account the full struct.

> 
> > 
> > Fixes: 6f4c45cbcb00 ("kunit: Add tests for csum_ipv6_magic and ip_fast_csum")
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >   lib/checksum_kunit.c | 393 ++++++++++++++++++---------------------------------
> >   1 file changed, 134 insertions(+), 259 deletions(-)
> > 
> > diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
> > index 776ad3d6d5a1..f1b18e3628dd 100644
> > --- a/lib/checksum_kunit.c
> > +++ b/lib/checksum_kunit.c
> > @@ -13,8 +13,9 @@
> >   
> >   #define IPv4_MIN_WORDS 5
> >   #define IPv4_MAX_WORDS 15
> > -#define NUM_IPv6_TESTS 200
> > -#define NUM_IP_FAST_CSUM_TESTS 181
> > +#define WORD_ALIGNMENT 4
> 
> Is that macro really needed ? Can't you just use sizeof(u32) or 
> something similar ?

It is for readability purposes. This was introduced to ensure that
alignment on a 32-bit boundary was happening, so I called this word
alignment.

> 
> 
> > +/* Ethernet headers are 14 bytes and NET_IP_ALIGN is used to align them */
> > +#define IP_ALIGNMENT (14 + NET_IP_ALIGN)
> 
> Only if no VLAN.
> 
> When using VLANs it is 4 bytes more. But why do you mind that at all
> ?

Architectures make assumptions about the alignment of the packets to
optimize code. Not doing this alignment will cause illegal misaligned
accesses on some ARM platforms. Yes, VLEN is ignored here, but this
alignment is required to be supported and that is what the test cases
are stressing.

> 
> >   
> >   /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
> >   static const u32 random_init_sum = 0x2847aab;
> 
> ...
> 
> > @@ -578,15 +451,19 @@ static void test_csum_no_carry_inputs(struct kunit *test)
> >   static void test_ip_fast_csum(struct kunit *test)
> >   {
> >   	__sum16 csum_result, expected;
> > -
> > -	for (int len = IPv4_MIN_WORDS; len < IPv4_MAX_WORDS; len++) {
> > -		for (int index = 0; index < NUM_IP_FAST_CSUM_TESTS; index++) {
> > -			csum_result = ip_fast_csum(random_buf + index, len);
> > -			expected = (__force __sum16)
> > -				expected_fast_csum[(len - IPv4_MIN_WORDS) *
> > -						   NUM_IP_FAST_CSUM_TESTS +
> > -						   index];
> > -			CHECK_EQ(expected, csum_result);
> > +	int num_tests = (MAX_LEN / WORD_ALIGNMENT - IPv4_MAX_WORDS * WORD_ALIGNMENT);
> > +
> > +	for (int i = 0; i < num_tests; i++) {
> > +		memcpy(&tmp_buf[IP_ALIGNMENT],
> > +		       random_buf + (i * WORD_ALIGNMENT),
> > +		       IPv4_MAX_WORDS * WORD_ALIGNMENT);
> 
> That looks weird.

If you have constructive feedback then I would be happy to clarify.

> 
> > +
> > +		for (int len = IPv4_MIN_WORDS; len <= IPv4_MAX_WORDS; len++) {
> > +			int index = (len - IPv4_MIN_WORDS) +
> > +				 i * ((IPv4_MAX_WORDS - IPv4_MIN_WORDS) + 1);
> 
> Missing blank line after declaration.
> 
> > +			csum_result = ip_fast_csum(tmp_buf + IP_ALIGNMENT, len);
> > +			expected = (__force __sum16)htons(expected_fast_csum[index]);
> 
> You must do proper type conversion using to_sum16(), not a forced cast.
> 

to_sum16 also does a forced cast, if to_sum16 is a "proper type
conversion", then this is as well. It seems to be an arbitrary to me,
but I can make it to_sum16 since it makes no difference.

> > +			CHECK_EQ(csum_result, expected);
> >   		}
> >   	}
> >   }
> > @@ -594,29 +471,27 @@ static void test_ip_fast_csum(struct kunit *test)
> >   static void test_csum_ipv6_magic(struct kunit *test)
> >   {
> >   #if defined(CONFIG_NET)
> > -	const struct in6_addr *saddr;
> > -	const struct in6_addr *daddr;
> > -	unsigned int len;
> > -	unsigned char proto;
> > -	unsigned int csum;
> > -
> > -	const int daddr_offset = sizeof(struct in6_addr);
> > -	const int len_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr);
> > -	const int proto_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
> > -			     sizeof(int);
> > -	const int csum_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
> > -			    sizeof(int) + sizeof(char);
> > -
> > -	for (int i = 0; i < NUM_IPv6_TESTS; i++) {
> > -		saddr = (const struct in6_addr *)(random_buf + i);
> > -		daddr = (const struct in6_addr *)(random_buf + i +
> > -						  daddr_offset);
> > -		len = *(unsigned int *)(random_buf + i + len_offset);
> > -		proto = *(random_buf + i + proto_offset);
> > -		csum = *(unsigned int *)(random_buf + i + csum_offset);
> > -		CHECK_EQ((__force __sum16)expected_csum_ipv6_magic[i],
> > -			 csum_ipv6_magic(saddr, daddr, len, proto,
> > -					 (__force __wsum)csum));
> > +	struct csum_ipv6_magic_data {
> > +		const struct in6_addr saddr;
> > +		const struct in6_addr daddr;
> > +		__be32 len;
> > +		__wsum csum;
> > +		unsigned char proto;
> > +		unsigned char pad[3];
> > +	} *data;
> > +	__sum16 csum_result, expected;
> > +	int ipv6_num_tests = ((MAX_LEN - sizeof(struct csum_ipv6_magic_data)) / WORD_ALIGNMENT);
> > +
> > +	for (int i = 0; i < ipv6_num_tests; i++) {
> > +		int index = i * WORD_ALIGNMENT;
> > +
> > +		data = (struct csum_ipv6_magic_data *)(random_buf + index);
> > +
> > +		csum_result = csum_ipv6_magic(&data->saddr, &data->daddr,
> > +					      ntohl(data->len), data->proto,
> > +					      data->csum);
> > +		expected = (__force __sum16)htons(expected_csum_ipv6_magic[i]);
> 
> Same, use to_sum16() instead htons() and a forced cast.
> 
> > +		CHECK_EQ(csum_result, expected);
> >   	}
> >   #endif /* !CONFIG_NET */
> >   }
> > 
> 
> 
> Christophe

- Charlie

