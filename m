Return-Path: <linuxppc-dev+bounces-17766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJPdLQ4JqWlc0gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 05:39:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A520ADD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 05:39:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRGzG4lvPz3c1T;
	Thu, 05 Mar 2026 15:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772685578;
	cv=none; b=NiL5YQcJ+76m57kB9dqyGWRtfa9NjvH8YYgqSJ+Q8kVaJU9CRsfPzSYeogt7nIojPAnKvQ+07K+Ltb2kD3+wAXsVB7af0Q0BBSQGErDNXFpFYDjL1hCldEOA0Wi9xq1hadQe81zt43P9KVWqKeew3+2VOO/RzjFFHnUtgxMHj7lt6eGnKJXlO+gHU6QPL5VLKK/NADdeJvtnxWJSKEnzjEGJrTtJQcFRiCcjfNFzlqGIv9fqfeTF1uciJK6HowPK1yBu15MAcYH4KGzcpZMFXlc6Iz7UeIcYO6hhJlKF90W/n724rg1Jr02T/nuJHWIPXDQYksYVYb/dw3fBj0iHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772685578; c=relaxed/relaxed;
	bh=KcaU8sTDEhDKqF+5Ny9Abe7zGwdn78hm9jnXcdm/0Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7n4JnqhL0omFvaQ8U5Vql8AGkpdpDBXemBC0GTq3ytL9rYRcmaEnOTQL2n/XyE6id46R/ImQiOu0i6R3kn15OtqLEdlOkfJbw2L1lFRUsvcZbFKdjBmgooCKp/XkceKhJ2gR5i9oaVn6iU8GqOGt0rACyfeZkyxyVYE/Qc/dKOu+dZuEpQCbTB9B318BW/Ks9CnvP4QhfC0aTmp1aafNs+8y+8Vp3kE17ncdNsTIuy+wgcbs1I4phP0ENN195MT2KLG/DLl/Q4AqVAR4HHE1u76XstDXyMREc0FF29aoTj8uvUtwX/Wh857IgYWxxX0O+25tTjgAMZIH2lEH1JQKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HI6TwgRc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HI6TwgRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRGzF4r0nz3bhG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 15:39:37 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Do9ES2165137;
	Thu, 5 Mar 2026 04:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KcaU8s
	TDEhDKqF+5Ny9Abe7zGwdn78hm9jnXcdm/0Ro=; b=HI6TwgRcBN/lZX63sy4Pq7
	FB89IRVInXCaVZxNk56WEOZKyIDd67ADRyiJH0/S0Gtp52ufKJWSNn0UgjLglKrX
	8eoxpb5dYSp9N49/SlwrfvW5U1BZIf+pIPAKD3AEFf1uzhBhzmxFb1jeksRA+I5h
	nOLEx4KLpJt2gf+BgdTQIygS5qcY5xUkrUDeH7+tZ2KNQ7qT9MGPtrP6CQAtMwiA
	rtG38yWkVmZqB1XDcsJqCZYSmS4yv9K4e4IlE+QRP3F7Wg99wZThVYcikJV0jPyU
	nUCoEN192PvIFEQnZ5yaV8Gn7sISEYqGfEM+00ap8pyO0eLj7fk3VZrSxAAH8LAQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdj5y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:39:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6251bTB0027662;
	Thu, 5 Mar 2026 04:39:33 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjhbp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:39:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6254dWTp32113180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2026 04:39:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5295058055;
	Thu,  5 Mar 2026 04:39:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2725D58043;
	Thu,  5 Mar 2026 04:39:29 +0000 (GMT)
Received: from [9.61.242.165] (unknown [9.61.242.165])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Mar 2026 04:39:28 +0000 (GMT)
Message-ID: <58f7acda-23b0-4ebd-8811-fa402cb9c2da@linux.ibm.com>
Date: Thu, 5 Mar 2026 10:09:27 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] powerpc/selftests/copyloops: extend selftest to
 exercise __copy_tofrom_user_power7_vmx
Content-Language: en-GB
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com
References: <20260304122201.153049-1-sayalip@linux.ibm.com>
 <20260304122201.153049-2-sayalip@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260304122201.153049-2-sayalip@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a90906 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=xtvLraR0ur4_u77ESH0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Yjj50P_tuAqO1iSBWxe-TboUlXNSifOf
X-Proofpoint-GUID: Yjj50P_tuAqO1iSBWxe-TboUlXNSifOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMyBTYWx0ZWRfX4I1gONG7aSRP
 D2udLIusu/s9326lWdBadkTKS4UVclXgt+pQ+sf+5GsMjWCFeJwoTC35Otdf2Ogf0N4OZkfb3lS
 yVC6Llj7wRNtB+tuf0eH8MRe7kxsxUeFDj534+n7A0u/yFssB1dLFnH0zCwNeoFEmPC6ZBcOtF6
 kO62xY4jjn17Tzd5m+hFoATWotXf5kjSdwEohlihhb3HslJLY3alY8V80bGJzuuGra4wL6MLlNp
 E1R9DJLi5Cd8IgV31tKGR3schzEebeGDBy9HdBhi4jSi6oPkjJByWSFL1RZmMayx4JO8T9K+QJH
 zy+Z8zE3sxj5RalOiF6Q4Z0bU3dRSOqf2whfpr5NdVoutv6FSJyu9K9+bf+f8c0BeU25olmN/tR
 qT+SFLql6Jk1WT9rjBXSFZyno9Xv/cuiI3OwkdKOzy0wgpF6TnLXdIo5Z2JoEte2QEmrBX6s5Dz
 07ss0Q2Ddw63R4h2aeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: BE7A520ADD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17766-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


On 04/03/26 5:52 pm, Sayali Patil wrote:
> The new PowerPC VMX fast path (__copy_tofrom_user_power7_vmx) is not
> exercised by existing copyloops selftests. This patch updates
> the selftest to exercise the VMX variant, ensuring the VMX copy path
> is validated.
>
> Changes include:
>    - COPY_LOOP=test___copy_tofrom_user_power7_vmx with -D VMX_TEST is used
>      in existing selftest build targets.
>    - Inclusion of ../utils.c to provide get_auxv_entry() for hardware
>      feature detection.
>    - At runtime, the test skips execution if Altivec is not available.
>    - Copy sizes above VMX_COPY_THRESHOLD are used to ensure the VMX
>      path is taken.
>
> This enables validation of the VMX fast path without affecting systems
> that do not support Altivec.
>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


# timeout set to 130
# selftests: powerpc/copyloops: copyuser_p7
# test: test___copy_tofrom_user_power7
# tags: git_version:v7.0-rc2-92-gb7b2ed2d96ea
# success: test___copy_tofrom_user_power7
ok 4 selftests: powerpc/copyloops: copyuser_p7
# timeout set to 130
# selftests: powerpc/copyloops: copyuser_p7_vmx
# test: test___copy_tofrom_user_power7_vmx
# tags: git_version:v7.0-rc2-92-gb7b2ed2d96ea
# success: test___copy_tofrom_user_power7_vmx


Regards,

Venkat.

>
> v3->v4
> No changes in the patch.
>
> v3: https://lore.kernel.org/all/20260304053506.118632-2-sayalip@linux.ibm.com/
>
> ---
>   .../selftests/powerpc/copyloops/.gitignore        |  4 ++--
>   .../testing/selftests/powerpc/copyloops/Makefile  | 11 ++++++++---
>   tools/testing/selftests/powerpc/copyloops/stubs.S |  8 --------
>   .../selftests/powerpc/copyloops/validate.c        | 15 ++++++++++++++-
>   4 files changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore b/tools/testing/selftests/powerpc/copyloops/.gitignore
> index 7283e8b07b75..80d4270a71ac 100644
> --- a/tools/testing/selftests/powerpc/copyloops/.gitignore
> +++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
> @@ -2,8 +2,8 @@
>   copyuser_64_t0
>   copyuser_64_t1
>   copyuser_64_t2
> -copyuser_p7_t0
> -copyuser_p7_t1
> +copyuser_p7
> +copyuser_p7_vmx
>   memcpy_64_t0
>   memcpy_64_t1
>   memcpy_64_t2
> diff --git a/tools/testing/selftests/powerpc/copyloops/Makefile b/tools/testing/selftests/powerpc/copyloops/Makefile
> index 42940f92d832..0c8efb0bddeb 100644
> --- a/tools/testing/selftests/powerpc/copyloops/Makefile
> +++ b/tools/testing/selftests/powerpc/copyloops/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   TEST_GEN_PROGS := copyuser_64_t0 copyuser_64_t1 copyuser_64_t2 \
> -		copyuser_p7_t0 copyuser_p7_t1 \
> +		copyuser_p7 copyuser_p7_vmx \
>   		memcpy_64_t0 memcpy_64_t1 memcpy_64_t2 \
>   		memcpy_p7_t0 memcpy_p7_t1 copy_mc_64 \
>   		copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2 \
> @@ -28,10 +28,15 @@ $(OUTPUT)/copyuser_64_t%:	copyuser_64.S $(EXTRA_SOURCES)
>   		-D SELFTEST_CASE=$(subst copyuser_64_t,,$(notdir $@)) \
>   		-o $@ $^
>   
> -$(OUTPUT)/copyuser_p7_t%:	copyuser_power7.S $(EXTRA_SOURCES)
> +$(OUTPUT)/copyuser_p7:	copyuser_power7.S $(EXTRA_SOURCES)
>   	$(CC) $(CPPFLAGS) $(CFLAGS) \
>   		-D COPY_LOOP=test___copy_tofrom_user_power7 \
> -		-D SELFTEST_CASE=$(subst copyuser_p7_t,,$(notdir $@)) \
> +		-o $@ $^
> +
> +$(OUTPUT)/copyuser_p7_vmx:       copyuser_power7.S $(EXTRA_SOURCES) ../utils.c
> +	$(CC) $(CPPFLAGS) $(CFLAGS) \
> +		-D COPY_LOOP=test___copy_tofrom_user_power7_vmx \
> +		-D VMX_TEST \
>   		-o $@ $^
>   
>   # Strictly speaking, we only need the memcpy_64 test cases for big-endian
> diff --git a/tools/testing/selftests/powerpc/copyloops/stubs.S b/tools/testing/selftests/powerpc/copyloops/stubs.S
> index ec8bcf2bf1c2..3a9cb8c9a3ee 100644
> --- a/tools/testing/selftests/powerpc/copyloops/stubs.S
> +++ b/tools/testing/selftests/powerpc/copyloops/stubs.S
> @@ -1,13 +1,5 @@
>   #include <asm/ppc_asm.h>
>   
> -FUNC_START(enter_vmx_usercopy)
> -	li	r3,1
> -	blr
> -
> -FUNC_START(exit_vmx_usercopy)
> -	li	r3,0
> -	blr
> -
>   FUNC_START(enter_vmx_ops)
>   	li	r3,1
>   	blr
> diff --git a/tools/testing/selftests/powerpc/copyloops/validate.c b/tools/testing/selftests/powerpc/copyloops/validate.c
> index 0f6873618552..fb822534fbe9 100644
> --- a/tools/testing/selftests/powerpc/copyloops/validate.c
> +++ b/tools/testing/selftests/powerpc/copyloops/validate.c
> @@ -12,6 +12,10 @@
>   #define BUFLEN (MAX_LEN+MAX_OFFSET+2*MIN_REDZONE)
>   #define POISON 0xa5
>   
> +#ifdef VMX_TEST
> +#define VMX_COPY_THRESHOLD 3328
> +#endif
> +
>   unsigned long COPY_LOOP(void *to, const void *from, unsigned long size);
>   
>   static void do_one(char *src, char *dst, unsigned long src_off,
> @@ -81,8 +85,12 @@ int test_copy_loop(void)
>   	/* Fill with sequential bytes */
>   	for (i = 0; i < BUFLEN; i++)
>   		fill[i] = i & 0xff;
> -
> +#ifdef VMX_TEST
> +	/* Force sizes above kernel VMX threshold (3328) */
> +	for (len = VMX_COPY_THRESHOLD + 1; len < MAX_LEN; len++) {
> +#else
>   	for (len = 1; len < MAX_LEN; len++) {
> +#endif
>   		for (src_off = 0; src_off < MAX_OFFSET; src_off++) {
>   			for (dst_off = 0; dst_off < MAX_OFFSET; dst_off++) {
>   				do_one(src, dst, src_off, dst_off, len,
> @@ -96,5 +104,10 @@ int test_copy_loop(void)
>   
>   int main(void)
>   {
> +#ifdef VMX_TEST
> +	/* Skip if Altivec not present */
> +	SKIP_IF_MSG(!have_hwcap(PPC_FEATURE_HAS_ALTIVEC), "ALTIVEC not supported");
> +#endif
> +
>   	return test_harness(test_copy_loop, str(COPY_LOOP));
>   }

