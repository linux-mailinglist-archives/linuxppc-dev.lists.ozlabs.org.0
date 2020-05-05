Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AC1C4EE7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:17:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GWJZ0lRwzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWFs21j0zDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GWFr4hBsz9sSW;
 Tue,  5 May 2020 17:15:12 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 25/28] powerpc: Test prefixed instructions in feature
 fixups
Date: Tue, 05 May 2020 17:15:09 +1000
Message-ID: <5803808.3aLiq0rt1P@townsend>
In-Reply-To: <20200501034220.8982-26-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-26-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hmm, I was hoping to add a tested by but I'm seeing the following failure in 
Mambo:

[    1.475459] feature-fixups: test failed at line 730

Based on the name of the test it looks like you probably made a copy/paste 
error in ftr_fixup_prefix2_expected. I suspect you probably meant to use the alt 
fixup:

globl(ftr_fixup_prefix2_expected)
	or	1,1,1
	.long 0x7000000
	.long 0x0000001
	or	2,2,2

Also for some reason these tests (and one of the code-patching tests) aren't 
passing on big endian.

- Alistair

On Friday, 1 May 2020 1:42:17 PM AEST Jordan Niethe wrote:
> Expand the feature-fixups self-tests to includes tests for prefixed
> instructions.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: New to series
> ---
>  arch/powerpc/lib/feature-fixups-test.S | 68 +++++++++++++++++++++++
>  arch/powerpc/lib/feature-fixups.c      | 74 ++++++++++++++++++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/arch/powerpc/lib/feature-fixups-test.S
> b/arch/powerpc/lib/feature-fixups-test.S index b12168c2447a..6e2da9123a9b
> 100644
> --- a/arch/powerpc/lib/feature-fixups-test.S
> +++ b/arch/powerpc/lib/feature-fixups-test.S
> @@ -791,3 +791,71 @@ globl(lwsync_fixup_test_expected_SYNC)
>  1:	or	1,1,1
>  	sync
> 
> +globl(ftr_fixup_prefix1)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +globl(end_ftr_fixup_prefix1)
> +
> +globl(ftr_fixup_prefix1_orig)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +
> +globl(ftr_fixup_prefix1_expected)
> +	or	1,1,1
> +	nop
> +	nop
> +	or	2,2,2
> +
> +globl(ftr_fixup_prefix2)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +globl(end_ftr_fixup_prefix2)
> +
> +globl(ftr_fixup_prefix2_orig)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +
> +globl(ftr_fixup_prefix2_alt)
> +	.long 0x7000000
> +	.long 0x0000001
> +
> +globl(ftr_fixup_prefix2_expected)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000001
> +	or	2,2,2
> +
> +globl(ftr_fixup_prefix3)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +	or	3,3,3
> +globl(end_ftr_fixup_prefix3)
> +
> +globl(ftr_fixup_prefix3_orig)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000000
> +	or	2,2,2
> +	or	3,3,3
> +
> +globl(ftr_fixup_prefix3_alt)
> +	.long 1 << 26
> +	.long 0x0000001
> +	nop
> +
> +globl(ftr_fixup_prefix3_expected)
> +	or	1,1,1
> +	.long 1 << 26
> +	.long 0x0000001
> +	nop
> +	or	3,3,3
> diff --git a/arch/powerpc/lib/feature-fixups.c
> b/arch/powerpc/lib/feature-fixups.c index 243011f85287..6fc499b1d63e 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -687,6 +687,75 @@ static void test_lwsync_macros(void)
>  	}
>  }
> 
> +#ifdef __powerpc64__
> +static void __init test_prefix_patching(void)
> +{
> +	extern unsigned int ftr_fixup_prefix1[];
> +	extern unsigned int end_ftr_fixup_prefix1[];
> +	extern unsigned int ftr_fixup_prefix1_orig[];
> +	extern unsigned int ftr_fixup_prefix1_expected[];
> +	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix1 -
> ftr_fixup_prefix1); +
> +	fixup.value = fixup.mask = 8;
> +	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix1 + 1);
> +	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix1 + 3);
> +	fixup.alt_start_off = fixup.alt_end_off = 0;
> +
> +	/* Sanity check */
> +	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_orig, size) == 0);
> +
> +	patch_feature_section(0, &fixup);
> +	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_expected, size) == 0);
> +	check(memcmp(ftr_fixup_prefix1, ftr_fixup_prefix1_orig, size) != 0);
> +}
> +
> +static void __init test_prefix_alt_patching(void)
> +{
> +	extern unsigned int ftr_fixup_prefix2[];
> +	extern unsigned int end_ftr_fixup_prefix2[];
> +	extern unsigned int ftr_fixup_prefix2_orig[];
> +	extern unsigned int ftr_fixup_prefix2_expected[];
> +	extern unsigned int ftr_fixup_prefix2_alt[];
> +	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix2 -
> ftr_fixup_prefix2); +
> +	fixup.value = fixup.mask = 8;
> +	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix2 + 1);
> +	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix2 + 3);
> +	fixup.alt_start_off = calc_offset(&fixup, ftr_fixup_prefix2_alt);
> +	fixup.alt_end_off = calc_offset(&fixup, ftr_fixup_prefix2_alt + 2);
> +	/* Sanity check */
> +	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_orig, size) == 0);
> +
> +	patch_feature_section(0, &fixup);
> +	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_expected, size) == 0);
> +	patch_feature_section(0, &fixup);
> +	check(memcmp(ftr_fixup_prefix2, ftr_fixup_prefix2_orig, size) != 0);
> +}
> +
> +static void __init test_prefix_word_alt_patching(void)
> +{
> +	extern unsigned int ftr_fixup_prefix3[];
> +	extern unsigned int end_ftr_fixup_prefix3[];
> +	extern unsigned int ftr_fixup_prefix3_orig[];
> +	extern unsigned int ftr_fixup_prefix3_expected[];
> +	extern unsigned int ftr_fixup_prefix3_alt[];
> +	int size = sizeof(unsigned int) * (end_ftr_fixup_prefix3 -
> ftr_fixup_prefix3); +
> +	fixup.value = fixup.mask = 8;
> +	fixup.start_off = calc_offset(&fixup, ftr_fixup_prefix3 + 1);
> +	fixup.end_off = calc_offset(&fixup, ftr_fixup_prefix3 + 4);
> +	fixup.alt_start_off = calc_offset(&fixup, ftr_fixup_prefix3_alt);
> +	fixup.alt_end_off = calc_offset(&fixup, ftr_fixup_prefix3_alt + 3);
> +	/* Sanity check */
> +	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_orig, size) == 0);
> +
> +	patch_feature_section(0, &fixup);
> +	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_expected, size) == 0);
> +	patch_feature_section(0, &fixup);
> +	check(memcmp(ftr_fixup_prefix3, ftr_fixup_prefix3_orig, size) != 0);
> +}
> +#endif /* __powerpc64__ */
> +
>  static int __init test_feature_fixups(void)
>  {
>  	printk(KERN_DEBUG "Running feature fixup self-tests ...\n");
> @@ -701,6 +770,11 @@ static int __init test_feature_fixups(void)
>  	test_cpu_macros();
>  	test_fw_macros();
>  	test_lwsync_macros();
> +#ifdef __powerpc64__
> +	test_prefix_patching();
> +	test_prefix_alt_patching();
> +	test_prefix_word_alt_patching();
> +#endif
> 
>  	return 0;
>  }




