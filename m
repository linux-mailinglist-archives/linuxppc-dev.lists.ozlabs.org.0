Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2322FAF77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 05:37:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKbTq3lS7zDqRX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 15:37:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R91+5Uo0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKbRx4pBFzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 15:35:22 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J43aFl122075; Mon, 18 Jan 2021 23:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HSQ8C2v8jsyfvSro/dBUdFSLoNbqrwTvDk61vBAuM90=;
 b=R91+5Uo03uSUnnp/uTMfC3XI9aNxu/krCIySYYoVoeQ5JKRYxzYnua5ZnjybeS8lVzna
 KziqNHVbqhh9gLe/xeHsUHCDl+hdqX7dEev1X8OFlxl4ePpCwLK9JiSizWx6GboCg8D9
 qMd7kXxs5v1LJIfeSZh7rQbq8p+6Ht3VfxKW13IH9DlrVr0PlsRxe1v+BtiMVFBPvcjp
 LuigccbMCFsgM/dUVHDyQ/PFoYxMlOJdXa1XUGRgp9c6jr0H2+eT0z3tzREYtoi49Otq
 ogaWysIQmA3dTozbNIYM3HFuWrR6v3NtZCfrSsOaSenm2A5K50vCrMnZsga0MCCYOkcw 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365p412q67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 23:35:17 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10J4I2AA162204;
 Mon, 18 Jan 2021 23:35:16 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365p412q5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 23:35:16 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J4XRxp017188;
 Tue, 19 Jan 2021 04:35:15 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 363qs8up78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 04:35:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J4ZEjP21299568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 04:35:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C86CC6055;
 Tue, 19 Jan 2021 04:35:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82057C6057;
 Tue, 19 Jan 2021 04:35:11 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.119])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 04:35:11 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] selftests/powerpc: Fix exit status of pkey tests
In-Reply-To: <20210118093145.10134-1-sandipan@linux.ibm.com>
References: <20210118093145.10134-1-sandipan@linux.ibm.com>
Date: Tue, 19 Jan 2021 10:05:07 +0530
Message-ID: <87wnw95ytg.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_15:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190022
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
Cc: harish@linux.ibm.com, efuller@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:

> Since main() does not return a value explicitly, the
> return values from FAIL_IF() conditions are ignored
> and the tests can still pass irrespective of failures.
> This makes sure that we always explicitly return the
> correct test exit status.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Reported-by: Eirik Fuller <efuller@redhat.com>
> Fixes: 1addb6444791 ("selftests/powerpc: Add test for execute-disabled pkeys")
> Fixes: c27f2fd1705a ("selftests/powerpc: Add test for pkey siginfo verification")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  tools/testing/selftests/powerpc/mm/pkey_exec_prot.c | 2 +-
>  tools/testing/selftests/powerpc/mm/pkey_siginfo.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
> index 9e5c7f3f498a..0af4f02669a1 100644
> --- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
> @@ -290,5 +290,5 @@ static int test(void)
>  
>  int main(void)
>  {
> -	test_harness(test, "pkey_exec_prot");
> +	return test_harness(test, "pkey_exec_prot");
>  }
> diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
> index 4f815d7c1214..2db76e56d4cb 100644
> --- a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
> +++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
> @@ -329,5 +329,5 @@ static int test(void)
>  
>  int main(void)
>  {
> -	test_harness(test, "pkey_siginfo");
> +	return test_harness(test, "pkey_siginfo");
>  }
> -- 
> 2.25.1
