Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CED8B9660
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 10:22:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FD+omsla;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVRky6wJnz3cZR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 18:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FD+omsla;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVRkB4sxMz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 18:22:09 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4427vEJY019173;
	Thu, 2 May 2024 08:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+e1sy4bUe3023GtY1gPbpRm6ulsaeQmRvwovFAJwMJQ=;
 b=FD+omslaKaYQPIkOWXLQn40NI5sK/xg/QotBpidn2DX6U+9gtQ3HfYInNYCJYheASCTS
 fzo9BxKi6Qj1DecNkAy6JQq5vJqA0r8zLJrjCFCPqYhz9SN5NG2qEx3fubIajSa2EhRV
 JE+v72OhWUznB0pzDnW2fAXmKvPWxgCaUv05MWyXsX/rrIIDh2ZCa1LHuRcvIM4Ay0JK
 8HYsBKDrfsKAGMsdN2IrvoCdBTYrYzkIv1iPohPQZSAZIohvWL2GmO5dv4eyHPj3tgIO
 x8DSP5DlN9/GMK2507PoPY90rqkF9XXEZJb+G35Cy8Sblv6996T5eHGOiNyLqh1QBBP1 XA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xv6w101v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 08:22:04 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4426XIVn015582;
	Thu, 2 May 2024 08:22:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed36gyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 08:22:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4428Lxn826477226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2024 08:22:01 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE37B20040;
	Thu,  2 May 2024 08:21:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 450EB2004B;
	Thu,  2 May 2024 08:21:58 +0000 (GMT)
Received: from [9.171.50.201] (unknown [9.171.50.201])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 May 2024 08:21:58 +0000 (GMT)
Message-ID: <5f0cb59d-0deb-4919-97b6-a99ae640c424@linux.ibm.com>
Date: Thu, 2 May 2024 13:51:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/powerpc: Convert pmu Makefile to for
 loop style
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20240422133453.1793988-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240422133453.1793988-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D-vFqqofNExImy4mrjLrTskLwyotx9c_
X-Proofpoint-GUID: D-vFqqofNExImy4mrjLrTskLwyotx9c_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-05-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405020049
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
Cc: spoorthy@linux.ibm.com, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/22/24 7:04 PM, Michael Ellerman wrote:
> The pmu Makefile has grown more sub directories over the years. Rather
> than open coding the rules for each subdir, use for loops.

Nice cleanup. Thanks.

Tested-by: Madhavan Srinivasan <maddy@linux.ibm.com>


> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   tools/testing/selftests/powerpc/pmu/Makefile | 43 ++++++++++----------
>   1 file changed, 22 insertions(+), 21 deletions(-)
>
> v2: Actually send both patches.
>
> diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
> index 1fcacae1b188..773933e5180e 100644
> --- a/tools/testing/selftests/powerpc/pmu/Makefile
> +++ b/tools/testing/selftests/powerpc/pmu/Makefile
> @@ -9,7 +9,9 @@ top_srcdir = ../../../../..
>   include ../../lib.mk
>   include ../flags.mk
>   
> -all: $(TEST_GEN_PROGS) ebb sampling_tests event_code_tests
> +SUB_DIRS := ebb sampling_tests event_code_tests
> +
> +all: $(TEST_GEN_PROGS) $(SUB_DIRS)
>   
>   $(TEST_GEN_PROGS): $(EXTRA_SOURCES)
>   
> @@ -23,12 +25,16 @@ $(OUTPUT)/count_stcx_fail: loop.S $(EXTRA_SOURCES)
>   
>   $(OUTPUT)/per_event_excludes: ../utils.c
>   
> +$(SUB_DIRS):
> +	BUILD_TARGET=$(OUTPUT)/$@; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $@ all
> +
>   DEFAULT_RUN_TESTS := $(RUN_TESTS)
>   override define RUN_TESTS
>   	$(DEFAULT_RUN_TESTS)
> -	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
> -	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
> -	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
> +	+@for TARGET in $(SUB_DIRS); do \
> +		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
> +		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests; \
> +	done;
>   endef
>   
>   emit_tests:
> @@ -36,34 +42,29 @@ emit_tests:
>   		BASENAME_TEST=`basename $$TEST`;	\
>   		echo "$(COLLECTION):$$BASENAME_TEST";	\
>   	done
> -	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
> -	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
> -	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
> +	+@for TARGET in $(SUB_DIRS); do \
> +		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
> +		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests; \
> +	done;
>   
>   DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
>   override define INSTALL_RULE
>   	$(DEFAULT_INSTALL_RULE)
> -	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
> -	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
> -	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install
> +	+@for TARGET in $(SUB_DIRS); do \
> +		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
> +		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install; \
> +	done;
>   endef
>   
>   DEFAULT_CLEAN := $(CLEAN)
>   override define CLEAN
>   	$(DEFAULT_CLEAN)
>   	$(RM) $(TEST_GEN_PROGS) $(OUTPUT)/loop.o
> -	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
> -	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
> -	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean
> +	+@for TARGET in $(SUB_DIRS); do \
> +		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
> +		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean; \
> +	done;
>   endef
>   
> -ebb:
> -	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
> -
> -sampling_tests:
> -	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
> -
> -event_code_tests:
> -	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
>   
>   .PHONY: all run_tests ebb sampling_tests event_code_tests emit_tests
