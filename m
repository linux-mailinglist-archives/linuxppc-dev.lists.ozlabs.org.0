Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B573B6322
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD9WV243gz3bTp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 00:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/2mKAjK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E/2mKAjK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD9Vy0B82z30BN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 00:49:45 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SEWopq101732; Mon, 28 Jun 2021 10:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=h03xNSk7ghdjy3NvBWtPVvT1k716FIeYhukht/R8OYI=;
 b=E/2mKAjK8l1L+ehVCXLoYe+eUNSTmfpMU+G/BXeaR7wMVuwTIPKvYsGpnTHI5hx6shZV
 g5OG2yVhJBvL2zXpiS+L6nbjp9yz+9s8ifiGUJyWenjfFqMdDy7oKN7GUbGT0XppQ6rW
 cEkWxfnvhkhlS4EudCgbdnR79gJjvlpeGml6pkysCW6FmSpE2PJYZfw4EbOWHC3onS/1
 xuRdMwBlazdfDIFjl3yn12uZl3FcoGWb7ZP6Nftqrn7LzUmG2oajiuExlQBa4Iy9nseZ
 7feRXq+Lbgdr+I+j0AEZz8fRU/OqAE3+JTK1WBcI3BdkfRW0bulBvYqTXvSy7tcb6b4v 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ffj7t9wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:49:41 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SEXj0O105668;
 Mon, 28 Jun 2021 10:49:40 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ffj7t9w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:49:40 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SEgDsL006366;
 Mon, 28 Jun 2021 14:49:40 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 39duvak5d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:49:40 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SEndQs37749018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 14:49:39 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E9FB214C;
 Mon, 28 Jun 2021 14:49:39 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 022CAB2179;
 Mon, 28 Jun 2021 14:49:38 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.80.210.16]) by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Jun 2021 14:49:38 +0000 (GMT)
Date: Mon, 28 Jun 2021 09:49:37 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf script python: Fix buffer size to report iregs in
 perf script
Message-ID: <20210628144937.GE142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210628062341.155839-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628062341.155839-1-kjain@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PQRSfbvHeYeTApyTWRJTRB9tQZl_MKLK
X-Proofpoint-ORIG-GUID: RPs_xy7izUBK3NhDSmZVxCR39duluPST
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280102
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
 rnsastry@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 28, 2021 at 11:53:41AM +0530, Kajol Jain wrote:
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
>  .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
> index 4e4aa4c97ac5..c8c9706b4643 100644
> --- a/tools/perf/util/scripting-engines/trace-event-python.c
> +++ b/tools/perf/util/scripting-engines/trace-event-python.c
[...]
> @@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
>  			     struct evsel *evsel)
>  {
>  	struct perf_event_attr *attr = &evsel->core.attr;
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

I propose using a template rather than a magic number here. Something like:
const char reg_name_tmpl[] = "10 chars  ";
const char reg_value_tmpl[] = "0x0123456789abcdef";
const int size = __sw_hweight64(attr->sample_regs_intr) +
                 sizeof reg_name_tmpl + sizeof reg_value_tmpl;

Pardon my ignorance, but is there no separation/whitespace between the name
and the value? And is there some significance to 10 characters for the
register name, or is that a magic number?

PC
