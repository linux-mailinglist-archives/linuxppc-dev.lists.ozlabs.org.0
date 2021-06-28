Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0255A3B5993
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCzRj6hnlz3bV5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PULsJ+fC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PULsJ+fC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCzRC2ZLSz2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:15:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15S744tO116374; Mon, 28 Jun 2021 03:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r/immuZYVE8Caoc6yGkt0MFN06PO3hMxemxPKVsCOXg=;
 b=PULsJ+fCBXwXQpq19YESKYj0NUC1PSmgzSWtwYgrrtUlXkB52ioit+TZ2eR/ACgDEcvH
 QdE60MHlrGWSM0Accw/n6FFe/VKL31exLwfVqcJnXHauLyHJPW8u/xd+PS6O6AAolGnp
 3+unw+UygJRQbHODn98vnrJkJUPGf4kfKEDtQjPL1VfrvTexV70kIGFnYSRS+pA/OgB1
 zvVI8rQL/FMObBe1IV3uQkBgWZ7q6UHJvHTqCLozkk+7RxVVtkP9AaR/bSA5lO7U+3P0
 yWMQP+jF6FFmQvnC2orEqrJZ5280vlzJ8MwkfOOqoo0j/cJeixSDSCa2/+HNjnbPFLRv eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39f77qkfd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 03:15:46 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15S75M6n124410;
 Mon, 28 Jun 2021 03:15:46 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39f77qkfc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 03:15:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15S78YCZ030026;
 Mon, 28 Jun 2021 07:15:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39duv8gmmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 07:15:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15S7EAK835979730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 07:14:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63E09A4166;
 Mon, 28 Jun 2021 07:15:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8345AA4124;
 Mon, 28 Jun 2021 07:15:38 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.199.47.223])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Jun 2021 07:15:38 +0000 (GMT)
Subject: Re: [PATCH] perf script python: Fix buffer size to report iregs in
 perf script
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org
References: <20210628062341.155839-1-kjain@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <46ddcac9-e115-6b96-11ec-6208bcd1c98a@linux.ibm.com>
Date: Mon, 28 Jun 2021 12:45:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628062341.155839-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vyCjQThvpV6iZpLIzekUkfEwUnIT5C78
X-Proofpoint-GUID: -295f2NuuxizaUdLdi4i3_NLvBLXf4i4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_05:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280049
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, pc@us.ibm.com,
 jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tested by creating perf-script.py using perf script
and priting the iregs. Seen more values with this patch.


Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

On 28/06/21 11:53 am, Kajol Jain wrote:
> Commit 48a1f565261d ("perf script python: Add more PMU fields
> to event handler dict") added functionality to report fields like
> weight, iregs, uregs etc via perf report.
> That commit predefined buffer size to 512 bytes to print those fields.
> 
> But incase of powerpc, since we added extended regs support
> in commits:
> 
> Commit 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
> Counter SPRs as part of extended regs")
> Commit d735599a069f ("powerpc/perf: Add extended regs support for
> power10 platform")
> 
> Now iregs can carry more bytes of data and this predefined buffer size
> can result to data loss in perf script output.
> 
> Patch resolve this issue by making buffer size dynamic based on number
> of registers needed to print. It also changed return type for function
> "regs_map" from int to void, as the return value is not being used by
> the caller function "set_regs_in_dict".
> 
> Fixes: 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
> Counter SPRs as part of extended regs")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
> index 4e4aa4c97ac5..c8c9706b4643 100644
> --- a/tools/perf/util/scripting-engines/trace-event-python.c
> +++ b/tools/perf/util/scripting-engines/trace-event-python.c
> @@ -687,7 +687,7 @@ static void set_sample_datasrc_in_dict(PyObject *dict,
>   			_PyUnicode_FromString(decode));
>   }
>   
> -static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
> +static void regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
>   {
>   	unsigned int i = 0, r;
>   	int printed = 0;
> @@ -695,7 +695,7 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
>   	bf[0] = 0;
>   
>   	if (!regs || !regs->regs)
> -		return 0;
> +		return;
>   
>   	for_each_set_bit(r, (unsigned long *) &mask, sizeof(mask) * 8) {
>   		u64 val = regs->regs[i++];
> @@ -704,8 +704,6 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
>   				     "%5s:0x%" PRIx64 " ",
>   				     perf_reg_name(r), val);
>   	}
> -
> -	return printed;
>   }
>   
>   static void set_regs_in_dict(PyObject *dict,
> @@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
>   			     struct evsel *evsel)
>   {
>   	struct perf_event_attr *attr = &evsel->core.attr;
> -	char bf[512];
> +
> +	/*
> +	 * Here value 28 is a constant size which can be used to print
> +	 * one register value and its corresponds to:
> +	 * 16 chars is to specify 64 bit register in hexadecimal.
> +	 * 2 chars is for appending "0x" to the hexadecimal value and
> +	 * 10 chars is for register name.
> +	 */
> +	int size = __sw_hweight64(attr->sample_regs_intr) * 28;
> +	char bf[size];
>   
>   	regs_map(&sample->intr_regs, attr->sample_regs_intr, bf, sizeof(bf));
>   
> 

-- 
Thanks and Regards
R.Nageswara Sastry
