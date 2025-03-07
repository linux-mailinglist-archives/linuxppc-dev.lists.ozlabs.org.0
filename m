Return-Path: <linuxppc-dev+bounces-6793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39FA5615E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 08:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8HKn05Vqz30gC;
	Fri,  7 Mar 2025 18:02:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741330956;
	cv=none; b=DFHLzFIRPMklUU2J/7etK+n6P1rB2+qHGpypzJxltzCkvdHexRDbWAFLKnjJz7WUGGtKOCRHx0raoO63ef21p2z7uNn4/ZLRjBH3TuVz4kvItqrFIFzww3DWOnzCSqnO+eD/9/b1B07YQVGgD3O9jnmPfOWjwPrxx3+ZczZimYtFBDRMOCg5pQRfG817+Ufq52ft4xIEaTHgR/8Jgy0HVzLqWOAL/nraHZxIjXxaDsVlN7cwMimIq0Op2TQkal0iZsUJMWNpGRuFcBi0olScGTilYGsbm1TgxHfPBMPs0fcsi8XBAeLdNcg6XmCPdfAkBig2z8PmoGjoLbRiaGRxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741330956; c=relaxed/relaxed;
	bh=jeU+yfjHIAyalVv5PYmp3OMyddzcHlq2oCYLvb5VDjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z0PCoyZP0BTNnqDIZL0A06b2FnH2l5kYDw/WBfiFli8eOgdwk8rrBGYFfn5D87qOFxb9sNvFGqBW+8uke2Mp+cmU5qb3I0ctb2bw8jlzNn14N+B74H8BUeD+cmzD53JsFnYh445uRuVeqnClcKRIE2u7DsNQB73+EjQKExjpeSmt7NNY96UXzH3hGdZoOd7Eu+B3e0x2dc+cYCE4me4njat81aI+KaFRKXJdl34cyyVQ0fpF3BkbX8O2ahy4d56JCiezRlfEHxOA+b0RbNLBjUIzpB1FujcoZfq5eyEyddZrDhCQU03na/R1A017iMOSgx6v4alJSiGpdhjGxiSaQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqaQ1Jb8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YqaQ1Jb8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8HKm0vxVz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 18:02:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526KpgCS011863;
	Fri, 7 Mar 2025 07:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jeU+yf
	jHIAyalVv5PYmp3OMyddzcHlq2oCYLvb5VDjI=; b=YqaQ1Jb8/lglByMRcE0b+/
	oGli+3zkecBORCblg323nwZtDRrh7fOBhcD37c5zZNmv6cmOyVFlaLLEw9/GfVq/
	4sfLz9NgsCBmhhTfW01Bm5gE9vBEC6P7Ja71KvSoCfZxRC35C0tjEZrkxX2feEfT
	M7RxmG6XmWq+EwzuZkk1GTftI76LcSGtKNZOx/5x0rZB0WcJyPQ9E/7QplySKcH9
	E2c9lfUX8RFCpSrA4v8RsHQQUGihkzViRKBtojU1iOL0FzArPtGVZU5jRziTy3PM
	oThyynm6q32SQ66mABsnrC/W7/MVwDnVaD2mJtbt112+YMAabiKIYG9e5FSKsEsw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457k45a6tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 07:02:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5275YvAw020846;
	Fri, 7 Mar 2025 07:02:22 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djnwc5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 07:02:22 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52772LJn26673916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 07:02:21 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46BFA58518;
	Fri,  7 Mar 2025 07:02:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C671E58519;
	Fri,  7 Mar 2025 07:02:17 +0000 (GMT)
Received: from [9.43.103.133] (unknown [9.43.103.133])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Mar 2025 07:02:17 +0000 (GMT)
Message-ID: <7d61512d-6dd1-4c09-b408-67bc16340237@linux.ibm.com>
Date: Fri, 7 Mar 2025 12:32:14 +0530
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
Subject: Re: PowerPC: sleftests/powerpc fails to compile linux-next
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fSRNlexL2JJzyspuwUc5HpsP1bq2uuXT
X-Proofpoint-GUID: fSRNlexL2JJzyspuwUc5HpsP1bq2uuXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_02,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070048
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/6/25 10:30 PM, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> I see selftests/powerpc fails to compile on next-20250306.
> 
> This error has been introduced in next-20250218. Make is successful on next-20250217.
> 
> 
> Attached is the .config used.
> 
> 
> If you fix this, please add below tag.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> Errors:
> 
> make -C powerpc/
> make: Entering directory '/root/venkat/linux-next/tools/testing/selftests/powerpc'
> Makefile:60: warning: overriding recipe for target 'emit_tests'
> ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/alignment; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C alignment all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/benchmarks; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C benchmarks all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/cache_shape; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C cache_shape all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/copyloops; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C copyloops all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/dexcr; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C dexcr all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/dscr; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C dscr all
> make[1]: Nothing to be done for 'all'.
> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>   CC       pkey_exec_prot
> In file included from pkey_exec_prot.c:18:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~

Commit 6d61527d931ba ('mm/pkey: Add PKEY_UNRESTRICTED macro') added a macro PKEY_UNRESTRICTED to handle implicit literal
value of 0x0 (which is "unrestricted"). belore patch add the same to powerpc/mm selftest.

Can you try with this patch to check whether it fixes the build break for you


diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index c6d4063dd4f6..d6deb6ffa1b9 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -24,6 +24,9 @@
 #undef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE   0x4
 
+#undef PKEY_UNRESTRICTED
+#define PKEY_UNRESTRICTED      0x0
+
 /* Older versions of libc do not define this */
 #ifndef SEGV_PKUERR
 #define SEGV_PKUERR    4


Maddy



> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: note: each undeclared identifier is reported only once for each function it appears in
> pkey_exec_prot.c: In function ‘segv_handler’:
> pkey_exec_prot.c:75:53: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    75 |                         pkey_set_rights(fault_pkey, PKEY_UNRESTRICTED);
>       | ^~~~~~~~~~~~~~~~~
> make[1]: *** [../../lib.mk:222: /root/venkat/linux-next/tools/testing/selftests/powerpc/mm/pkey_exec_prot] Error 1
>   CC       pkey_siginfo
> In file included from pkey_siginfo.c:22:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>       |                                  ^~~~~~~~~~~~~~~~~
> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: note: each undeclared identifier is reported only once for each function it appears in
> pkey_siginfo.c: In function ‘segv_handler’:
> pkey_siginfo.c:86:39: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>    86 |                 pkey_set_rights(pkey, PKEY_UNRESTRICTED);
>       |                                       ^~~~~~~~~~~~~~~~~
> make[1]: *** [../../lib.mk:222: /root/venkat/linux-next/tools/testing/selftests/powerpc/mm/pkey_siginfo] Error 1
> make[1]: Target 'all' not remade because of errors.
> make: *** [Makefile:40: mm] Error 2
> make: Leaving directory '/root/venkat/linux-next/tools/testing/selftests/powerpc'
> 
> 
> Regards,
> 
> Venkat.


