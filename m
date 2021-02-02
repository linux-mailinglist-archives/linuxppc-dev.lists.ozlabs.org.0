Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F301B30D23E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:52:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVnmw5y4xzDx06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:52:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.114; helo=m15114.mail.126.com;
 envelope-from=lixinhai_lxh@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=SYpfXTjU; dkim-atps=neutral
X-Greylist: delayed 1883 seconds by postgrey-1.36 at bilbo;
 Wed, 03 Feb 2021 01:04:19 AEDT
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVRPv36P5zDqpG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:04:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=iSJT6
 K/11myAmTG7Pd2KRwwB1wVXR3Zvdkx60UDYQ4Q=; b=SYpfXTjUF54trl5vOcEpQ
 MRKdxR8vKGwYJCJSkNbwSBq6QOP4giH6OdNWQsGOR9+YUz1fPdP+CjvWjPM+AYBc
 OmeS4d9RJJ3gbfGZwBycQYXSaWzdZjvC5k3SdBa/cwZ2n2AMP/YtA/UoEXxaIbvv
 8iz+PyFKQ63NJRkW6WpNaI=
Received: from localhost.localdomain (unknown [115.197.142.211])
 by smtp7 (Coremail) with SMTP id DsmowADHymqdUxlgd2cDNw--.10970S2;
 Tue, 02 Feb 2021 21:29:03 +0800 (CST)
Subject: Re: [RFC PATCH 1/6] selftest/mremap_test: Update the test to handle
 pagesize other than 4K
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
From: Li Xinhai <lixinhai_lxh@126.com>
Message-ID: <19298b0c-2db5-3755-722d-74baeb35f1ef@126.com>
Date: Tue, 2 Feb 2021 21:29:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DsmowADHymqdUxlgd2cDNw--.10970S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw17XF1UKw1xXr13Xw1kKrg_yoWxKrWfp3
 yUA39Yqay7WFyUuw1Yqw45ArnYvan5Wr48XwsxGry5Zr4Utr9xta12kF4UXw4rCwnY9wsY
 qrnIqFnYqw4kZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jMdgZUUUUU=
X-Originating-IP: [115.197.142.211]
X-CM-SenderInfo: pol0x0pkdlszl0k6ij2wof0z/1tbiYB8t1VpECC0MMgAAsC
X-Mailman-Approved-At: Wed, 03 Feb 2021 14:49:16 +1100
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
Cc: peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, joel@joelfernandes.org,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

what is the overall purpose of this patch set? maybe need a cover
letter?

On 2/2/21 5:11 PM, Aneesh Kumar K.V wrote:
> Instead of hardcoding 4K page size fetch it using sysconf(). For the performance
> measurements test still assume 2M and 1G are hugepage sizes.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   tools/testing/selftests/vm/mremap_test.c | 113 ++++++++++++-----------
>   1 file changed, 61 insertions(+), 52 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/mremap_test.c b/tools/testing/selftests/vm/mremap_test.c
> index 9c391d016922..c9a5461eb786 100644
> --- a/tools/testing/selftests/vm/mremap_test.c
> +++ b/tools/testing/selftests/vm/mremap_test.c
> @@ -45,14 +45,15 @@ enum {
>   	_4MB = 4ULL << 20,
>   	_1GB = 1ULL << 30,
>   	_2GB = 2ULL << 30,
> -	PTE = _4KB,
>   	PMD = _2MB,
>   	PUD = _1GB,
>   };
>   
> +#define PTE page_size
> +
>   #define MAKE_TEST(source_align, destination_align, size,	\
>   		  overlaps, should_fail, test_name)		\
> -{								\
> +(struct test){							\
>   	.name = test_name,					\
>   	.config = {						\
>   		.src_alignment = source_align,			\
> @@ -252,12 +253,17 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
>   	return 0;
>   }
>   
> +#define MAX_TEST 13
> +#define MAX_PERF_TEST 3
>   int main(int argc, char **argv)
>   {
>   	int failures = 0;
>   	int i, run_perf_tests;
>   	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
>   	unsigned int pattern_seed;
> +	struct test test_cases[MAX_TEST];
> +	struct test perf_test_cases[MAX_PERF_TEST];
> +	int page_size;
>   	time_t t;
>   
>   	pattern_seed = (unsigned int) time(&t);
> @@ -268,56 +274,59 @@ int main(int argc, char **argv)
>   	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
>   		       threshold_mb, pattern_seed);
>   
> -	struct test test_cases[] = {
> -		/* Expected mremap failures */
> -		MAKE_TEST(_4KB, _4KB, _4KB, OVERLAPPING, EXPECT_FAILURE,
> -		  "mremap - Source and Destination Regions Overlapping"),
> -		MAKE_TEST(_4KB, _1KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
> -		  "mremap - Destination Address Misaligned (1KB-aligned)"),
> -		MAKE_TEST(_1KB, _4KB, _4KB, NON_OVERLAPPING, EXPECT_FAILURE,
> -		  "mremap - Source Address Misaligned (1KB-aligned)"),
> -
> -		/* Src addr PTE aligned */
> -		MAKE_TEST(PTE, PTE, _8KB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "8KB mremap - Source PTE-aligned, Destination PTE-aligned"),
> -
> -		/* Src addr 1MB aligned */
> -		MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned"),
> -		MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned"),
> -
> -		/* Src addr PMD aligned */
> -		MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "4MB mremap - Source PMD-aligned, Destination PTE-aligned"),
> -		MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned"),
> -		MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "4MB mremap - Source PMD-aligned, Destination PMD-aligned"),
> -
> -		/* Src addr PUD aligned */
> -		MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2GB mremap - Source PUD-aligned, Destination PTE-aligned"),
> -		MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2GB mremap - Source PUD-aligned, Destination 1MB-aligned"),
> -		MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2GB mremap - Source PUD-aligned, Destination PMD-aligned"),
> -		MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "2GB mremap - Source PUD-aligned, Destination PUD-aligned"),
> -	};
> -
> -	struct test perf_test_cases[] = {
> -		/*
> -		 * mremap 1GB region - Page table level aligned time
> -		 * comparison.
> -		 */
> -		MAKE_TEST(PTE, PTE, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "1GB mremap - Source PTE-aligned, Destination PTE-aligned"),
> -		MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "1GB mremap - Source PMD-aligned, Destination PMD-aligned"),
> -		MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> -		  "1GB mremap - Source PUD-aligned, Destination PUD-aligned"),
> -	};
> +	page_size = sysconf(_SC_PAGESIZE);
> +
> +	/* Expected mremap failures */
> +	test_cases[0] =	MAKE_TEST(page_size, page_size, page_size,
> +				  OVERLAPPING, EXPECT_FAILURE,
> +				  "mremap - Source and Destination Regions Overlapping");
> +
> +	test_cases[1] = MAKE_TEST(page_size, page_size/4, page_size,
> +				  NON_OVERLAPPING, EXPECT_FAILURE,
> +				  "mremap - Destination Address Misaligned (1KB-aligned)");
> +	test_cases[2] = MAKE_TEST(page_size/4, page_size, page_size,
> +				  NON_OVERLAPPING, EXPECT_FAILURE,
> +				  "mremap - Source Address Misaligned (1KB-aligned)");
> +
> +	/* Src addr PTE aligned */
> +	test_cases[3] = MAKE_TEST(PTE, PTE, PTE * 2,
> +				  NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "8KB mremap - Source PTE-aligned, Destination PTE-aligned");
> +
> +	/* Src addr 1MB aligned */
> +	test_cases[4] = MAKE_TEST(_1MB, PTE, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "2MB mremap - Source 1MB-aligned, Destination PTE-aligned");
> +	test_cases[5] = MAKE_TEST(_1MB, _1MB, _2MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "2MB mremap - Source 1MB-aligned, Destination 1MB-aligned");
> +
> +	/* Src addr PMD aligned */
> +	test_cases[6] = MAKE_TEST(PMD, PTE, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "4MB mremap - Source PMD-aligned, Destination PTE-aligned");
> +	test_cases[7] =	MAKE_TEST(PMD, _1MB, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "4MB mremap - Source PMD-aligned, Destination 1MB-aligned");
> +	test_cases[8] = MAKE_TEST(PMD, PMD, _4MB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "4MB mremap - Source PMD-aligned, Destination PMD-aligned");
> +
> +	/* Src addr PUD aligned */
> +	test_cases[9] = MAKE_TEST(PUD, PTE, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				  "2GB mremap - Source PUD-aligned, Destination PTE-aligned");
> +	test_cases[10] = MAKE_TEST(PUD, _1MB, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				   "2GB mremap - Source PUD-aligned, Destination 1MB-aligned");
> +	test_cases[11] = MAKE_TEST(PUD, PMD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				   "2GB mremap - Source PUD-aligned, Destination PMD-aligned");
> +	test_cases[12] = MAKE_TEST(PUD, PUD, _2GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				   "2GB mremap - Source PUD-aligned, Destination PUD-aligned");
> +
> +	perf_test_cases[0] =  MAKE_TEST(page_size, page_size, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +					"1GB mremap - Source PTE-aligned, Destination PTE-aligned");
> +	/*
> +	 * mremap 1GB region - Page table level aligned time
> +	 * comparison.
> +	 */
> +	perf_test_cases[1] = MAKE_TEST(PMD, PMD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				       "1GB mremap - Source PMD-aligned, Destination PMD-aligned");
> +	perf_test_cases[2] = MAKE_TEST(PUD, PUD, _1GB, NON_OVERLAPPING, EXPECT_SUCCESS,
> +				       "1GB mremap - Source PUD-aligned, Destination PUD-aligned");
>   
>   	run_perf_tests =  (threshold_mb == VALIDATION_NO_THRESHOLD) ||
>   				(threshold_mb * _1MB >= _1GB);
> 

