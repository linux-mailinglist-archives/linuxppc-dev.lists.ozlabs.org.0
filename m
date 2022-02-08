Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5A4ACFFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 04:57:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt8NQ3qH7z3c7f
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 14:57:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tUM0j/7X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=riteshh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tUM0j/7X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt8M865pfz3bPJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 14:56:20 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2182I3nl021099; 
 Tue, 8 Feb 2022 03:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=ONdp6KgAz/SdXmdbrZafej/l0I0v7+YNbAlyMkZUBmk=;
 b=tUM0j/7X/7s8VTCM0vlqhS1AUu9CiusC1GPsnnBwYBD1BhVWTHpDsfXWFM7HTFV5PhnW
 46yrHtZmYuejtVpXFWpqK8211Sa/E28zkSiajIyQDYvvd0yZhPbgq+dzIlKaKiFByxRi
 CzRj702WuGj41lqsiE4Qz2tYbQ1F4OwM0vbOO9dZPmB4RrP1uiHVfu3edW2Jfo1g7mC8
 EqTZihJi5+WDWZ3zP/SIHC0qKsXc0vmilAwi2vKq307loWVkqSxLFcSjEhQzTAzNZIzf
 +vjZFGte6yELgY8JoN9yHYK5fo4mc0SBqP+7TohMlx114jF/C+STpORyYpie2BDeBldl lg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e3fm4hc05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 03:56:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2183qSkQ029092;
 Tue, 8 Feb 2022 03:56:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggjt2yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 03:56:11 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2183u8Xg44106222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 03:56:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2847D52057;
 Tue,  8 Feb 2022 03:56:08 +0000 (GMT)
Received: from localhost (unknown [9.43.111.247])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A9AB55204E;
 Tue,  8 Feb 2022 03:56:07 +0000 (GMT)
Date: Tue, 8 Feb 2022 09:26:06 +0530
From: Ritesh Harjani <riteshh@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv2] selftests/powerpc/copyloops: Add memmove_64 test
Message-ID: <20220208035606.mxjd6k4jqswallxp@riteshh-domain>
References: <57242c1fe7aba6b7f0fcd0490303bfd5f222ee00.1631512686.git.riteshh@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57242c1fe7aba6b7f0fcd0490303bfd5f222ee00.1631512686.git.riteshh@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0Emz8gSkO-Yjpsd-68cmYm45zsqwVI2h
X-Proofpoint-GUID: 0Emz8gSkO-Yjpsd-68cmYm45zsqwVI2h
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_01,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 clxscore=1011 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080016
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Found this, while checking my older emails. Sorry about not checking on this
before. Have addressed the review comments here [1]

This still applies cleanly on 5.17-rc3 and passes.

riteshh-> ./copyloops/memmove_64
test: memmove
tags: git_version:v5.17-rc3-1-g84f773abc114
success: memmove

[1]: https://lore.kernel.org/all/87sfybl5f9.fsf@mpe.ellerman.id.au/

-ritesh

On 21/09/13 11:47AM, Ritesh Harjani wrote:
> While debugging an issue, we wanted to check whether the arch specific
> kernel memmove implementation is correct.
> This selftest could help test that.
>
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Suggested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Ritesh Harjani <riteshh@linux.ibm.com>
> ---
> v1 -> v2: Integrated memmove_64 test within copyloops tests
> [v1]: https://patchwork.ozlabs.org/patch/1518082
>
>  .../selftests/powerpc/copyloops/.gitignore    |  1 +
>  .../selftests/powerpc/copyloops/Makefile      |  9 ++-
>  .../selftests/powerpc/copyloops/asm/ppc_asm.h |  1 +
>  .../selftests/powerpc/copyloops/mem_64.S      |  1 +
>  .../powerpc/copyloops/memcpy_stubs.S          |  8 +++
>  .../powerpc/copyloops/memmove_validate.c      | 58 +++++++++++++++++++
>  6 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 120000 tools/testing/selftests/powerpc/copyloops/mem_64.S
>  create mode 100644 tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S
>  create mode 100644 tools/testing/selftests/powerpc/copyloops/memmove_validate.c
>
> diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore b/tools/testing/selftests/powerpc/copyloops/.gitignore
> index 994b11af765c..7283e8b07b75 100644
> --- a/tools/testing/selftests/powerpc/copyloops/.gitignore
> +++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
> @@ -13,3 +13,4 @@ copyuser_64_exc_t0
>  copyuser_64_exc_t1
>  copyuser_64_exc_t2
>  copy_mc_64
> +memmove_64
> diff --git a/tools/testing/selftests/powerpc/copyloops/Makefile b/tools/testing/selftests/powerpc/copyloops/Makefile
> index 3095b1f1c02b..77594e697f2f 100644
> --- a/tools/testing/selftests/powerpc/copyloops/Makefile
> +++ b/tools/testing/selftests/powerpc/copyloops/Makefile
> @@ -13,7 +13,8 @@ TEST_GEN_PROGS := copyuser_64_t0 copyuser_64_t1 copyuser_64_t2 \
>  		copyuser_p7_t0 copyuser_p7_t1 \
>  		memcpy_64_t0 memcpy_64_t1 memcpy_64_t2 \
>  		memcpy_p7_t0 memcpy_p7_t1 copy_mc_64 \
> -		copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2
> +		copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2 \
> +		memmove_64
>
>  EXTRA_SOURCES := validate.c ../harness.c stubs.S
>
> @@ -56,3 +57,9 @@ $(OUTPUT)/copyuser_64_exc_t%: copyuser_64.S exc_validate.c ../harness.c \
>  		-D COPY_LOOP=test___copy_tofrom_user_base \
>  		-D SELFTEST_CASE=$(subst copyuser_64_exc_t,,$(notdir $@)) \
>  		-o $@ $^
> +
> +$(OUTPUT)/memmove_64: mem_64.S memcpy_64.S memmove_validate.c ../harness.c \
> +		memcpy_stubs.S
> +	$(CC) $(CPPFLAGS) $(CFLAGS) \
> +		-D TEST_MEMMOVE=test_memmove \
> +		-o $@ $^
> diff --git a/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h b/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
> index 58c1cef3e399..003e1b3d9300 100644
> --- a/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
> +++ b/tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h
> @@ -26,6 +26,7 @@
>  #define _GLOBAL(A) FUNC_START(test_ ## A)
>  #define _GLOBAL_TOC(A) _GLOBAL(A)
>  #define _GLOBAL_TOC_KASAN(A) _GLOBAL(A)
> +#define _GLOBAL_KASAN(A) _GLOBAL(A)
>
>  #define PPC_MTOCRF(A, B)	mtocrf A, B
>
> diff --git a/tools/testing/selftests/powerpc/copyloops/mem_64.S b/tools/testing/selftests/powerpc/copyloops/mem_64.S
> new file mode 120000
> index 000000000000..db254c9a5f5c
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/copyloops/mem_64.S
> @@ -0,0 +1 @@
> +../../../../../arch/powerpc/lib/mem_64.S
> \ No newline at end of file
> diff --git a/tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S b/tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S
> new file mode 100644
> index 000000000000..d9baa832fa49
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/copyloops/memcpy_stubs.S
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ppc_asm.h>
> +
> +FUNC_START(memcpy)
> +	b test_memcpy
> +
> +FUNC_START(backwards_memcpy)
> +	b test_backwards_memcpy
> diff --git a/tools/testing/selftests/powerpc/copyloops/memmove_validate.c b/tools/testing/selftests/powerpc/copyloops/memmove_validate.c
> new file mode 100644
> index 000000000000..1a23218b5757
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/copyloops/memmove_validate.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <malloc.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <assert.h>
> +#include "utils.h"
> +
> +void *TEST_MEMMOVE(const void *s1, const void *s2, size_t n);
> +
> +#define BUF_LEN 65536
> +#define MAX_OFFSET 512
> +
> +size_t max(size_t a, size_t b)
> +{
> +	if (a >= b)
> +		return a;
> +	return b;
> +}
> +
> +static int testcase_run(void)
> +{
> +	size_t i, src_off, dst_off, len;
> +
> +	char *usermap = memalign(BUF_LEN, BUF_LEN);
> +	char *kernelmap = memalign(BUF_LEN, BUF_LEN);
> +
> +	assert(usermap != NULL);
> +	assert(kernelmap != NULL);
> +
> +	memset(usermap, 0, BUF_LEN);
> +	memset(kernelmap, 0, BUF_LEN);
> +
> +	for (i = 0; i < BUF_LEN; i++) {
> +		usermap[i] = i & 0xff;
> +		kernelmap[i] = i & 0xff;
> +	}
> +
> +	for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
> +		for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
> +			for (len = 1; len < MAX_OFFSET - max(src_off, dst_off); len++) {
> +
> +				memmove(usermap + dst_off, usermap + src_off, len);
> +				TEST_MEMMOVE(kernelmap + dst_off, kernelmap + src_off, len);
> +				if (memcmp(usermap, kernelmap, MAX_OFFSET) != 0) {
> +					printf("memmove failed at %ld %ld %ld\n",
> +							src_off, dst_off, len);
> +					abort();
> +				}
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +int main(void)
> +{
> +	return test_harness(testcase_run, "memmove");
> +}
> --
> 2.31.1
>
