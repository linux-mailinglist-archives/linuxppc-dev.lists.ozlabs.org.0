Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C97AD2A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 10:06:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ihwTLsAd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvFnf1Cvxz2yVg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 18:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ihwTLsAd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvFmk6pdNz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 18:05:42 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P8023w011032;
	Mon, 25 Sep 2023 08:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2DB9KC7d1xLCq7zZE9xGcP41ZOeZ94BTzPQzAzaPvcI=;
 b=ihwTLsAdOylL2LNnp+wLz1ImLWIaQemNLyIrU//Uk8AxyOwDFox49DCIAAEMy/hn7gwT
 Kg2cKs8Ws7/Fni5qpWnfRkwHgzOkFVtvsaV08crOdVKA2IR3ASpmNViX79tPaJfFwYEz
 SgzWktuRfvd27ka4Pmqhbg+x9lRLdef5rWoejYZsHcAca+fuq05z+wb4kpvKLVLoVtea
 kp2fpS6FmOUuGLuAyCdMiFOoAtmxlDLB9aZwQm5iuucQ3wOiUzn8OlUmp7if62a88Q1b
 UOoe6foimXprJA3b2smKTbwenmyLlNPRFJ1YxwPg46zRqxDqNrLGQ9NGdRLyyo3tJcnQ /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta66yd4sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 08:05:35 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38P7rJRH011959;
	Mon, 25 Sep 2023 08:05:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta66yd4sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 08:05:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38P65HTj008250;
	Mon, 25 Sep 2023 08:05:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabbmrj06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 08:05:34 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38P84H0N19923646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 08:04:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45A4820043;
	Mon, 25 Sep 2023 08:04:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BADDB20040;
	Mon, 25 Sep 2023 08:04:13 +0000 (GMT)
Received: from [9.43.77.183] (unknown [9.43.77.183])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Sep 2023 08:04:13 +0000 (GMT)
Message-ID: <e5e806c3-da4a-8672-9c8e-6c341c6bd27d@linux.ibm.com>
Date: Mon, 25 Sep 2023 13:34:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E_6F2SC12iiUvi61TAr0y7cIWtdhH0NQ
X-Proofpoint-ORIG-GUID: Z501TpPl4i-GhCAYc8hhGeXC0_2jltcS
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_04,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250057
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, root <root@ltcden13-lp4.aus.stglabs.ibm.com>, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/7/23 22:45, Athira Rajeev wrote:
> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
> 
> shellcheck was run on perf tool shell scripts s a pre-requisite
> to include a build option for shellcheck discussed here:
> https://www.spinics.net/lists/linux-perf-users/msg25553.html
> 
> And fixes were added for the coding/formatting issues in
> two patchsets:
> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/
> 
> Three additional issues are observed with shellcheck "0.6" and
> this patchset covers those. With this patchset,
> 
> # for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> # echo $?
> 0
> 

Patchset looks good to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

> Athira Rajeev (3):
>   tests/shell: Fix shellcheck SC1090 to handle the location of sourced
>     files
>   tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
>     tetscase
>   tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts
> 
>  tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 4 ++++
>  tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 4 ++++
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 4 ++++
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 4 ++++
>  tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 4 ++++
>  tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
>  tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
>  tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
>  tools/perf/tests/shell/record.sh                             | 1 +
>  tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
>  tools/perf/tests/shell/stat+csv_summary.sh                   | 4 ++--
>  tools/perf/tests/shell/stat+shadow_stat.sh                   | 4 ++--
>  tools/perf/tests/shell/stat+std_output.sh                    | 1 +
>  tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
>  tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
>  15 files changed, 35 insertions(+), 4 deletions(-)
> 
