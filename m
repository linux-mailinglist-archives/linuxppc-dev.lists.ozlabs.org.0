Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC824222AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 11:50:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNt9P2sjkz304r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 20:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sd/EXhwZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sd/EXhwZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNt8c0K7Zz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 20:49:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1959ZCaP010497; 
 Tue, 5 Oct 2021 05:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eO4uXlRS6S9nvlj+QSvAE+fS6kbSQnna5E/0txyYWFg=;
 b=Sd/EXhwZRgvDbqICy1h0YtwbgRT1G6m+1jRKD12GZRwmRrxrsYpdGqURzXZu/Wc9zZA9
 6t3bFBPw90tHh+9w4kAXjs9RPJqu3znkkHZfAIIA6vgjbhTzYFUrvVu2tTDm7J0nlSe7
 pyflPhWmrP3WxeoZaBGeTDZuFrazJGqTUsemgrUnYQ7wQiJQMYzLNYVzdGccWDAEoIDi
 Vpr7Ef1aZmqqc3DSnlHCqmri1OO6fXZjl0ehmWorBhU3PSVlrFHfjcSQ1phpr6R04mHs
 fFgNmbn/0mgql4NL0lf5Op7uuxOj55H3+yL3Q9YVYlIz6/bdbIFfanHUKeFO1CSXAjHS ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bghr0kquh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:48:54 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1959mjUo031724;
 Tue, 5 Oct 2021 05:48:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bghr0kqu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:48:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1959lB7P026575;
 Tue, 5 Oct 2021 09:48:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2a0qk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 09:48:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1959mlbD26214722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 09:48:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B1DFA406B;
 Tue,  5 Oct 2021 09:48:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B471EA404D;
 Tue,  5 Oct 2021 09:48:41 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown
 [9.43.64.84]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 09:48:41 +0000 (GMT)
Subject: Re: [PATCH 1/4] perf: Add comment about current state of
 PERF_MEM_LVL_* namespace and remove an extra line
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
References: <20211005091837.250044-1-kjain@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <b069104c-73ee-6210-16d4-00bb0087933d@linux.ibm.com>
Date: Tue, 5 Oct 2021 15:18:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211005091837.250044-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Orcyn_HibsoF6e3Oq47juoF6G2yo0bl8
X-Proofpoint-GUID: WOz0dxa4UOPomjWx1ZQWLyfAl9OiOzJw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050054
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,
  Sorry I missed to update correct version details.

Link to the previous patch-set, where discussion related to addition of
new data source encoding field 'mem_hops' happened:

https://lkml.org/lkml/2021/9/4/37

Changelog:

- Rather then adding new macros for L2.1/L3.1 (same chip, different
core) entries as part of field lvlnum, we are introducing new field
called 'mem_hops' which can be used to get hops
level data(intra-chip/package or inter-chip/off-package details).
As suggested by Peter Zijlstra.

- Using OnChip to denote data accesses from 'another core of same chip'
  is not too clear. Update it to 'remote core, same chip' as pointed by
  Michael Ellerman.

- Update the fix patch of correcting data source encodings to use new
added field 'mem_hops'.

Thanks,
Kajol Jain


On 10/5/21 2:48 PM, Kajol Jain wrote:
> Add a comment about PERF_MEM_LVL_* namespace being depricated
> to some extent in favour of added PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_}
> fields.
> 
> Remove an extra line present in perf_mem__lvl_scnprintf function.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  include/uapi/linux/perf_event.h       | 8 +++++++-
>  tools/include/uapi/linux/perf_event.h | 8 +++++++-
>  tools/perf/util/mem-events.c          | 1 -
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index f92880a15645..e1701e9c7858 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1241,7 +1241,13 @@ union perf_mem_data_src {
>  #define PERF_MEM_OP_EXEC	0x10 /* code (execution) */
>  #define PERF_MEM_OP_SHIFT	0
>  
> -/* memory hierarchy (memory level, hit or miss) */
> +/*
> + * PERF_MEM_LVL_* namespace being depricated to some extent in the
> + * favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields.
> + * Supporting this namespace inorder to not break defined ABIs.
> + *
> + * memory hierarchy (memory level, hit or miss)
> + */
>  #define PERF_MEM_LVL_NA		0x01  /* not available */
>  #define PERF_MEM_LVL_HIT	0x02  /* hit level */
>  #define PERF_MEM_LVL_MISS	0x04  /* miss level  */
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
> index f92880a15645..e1701e9c7858 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -1241,7 +1241,13 @@ union perf_mem_data_src {
>  #define PERF_MEM_OP_EXEC	0x10 /* code (execution) */
>  #define PERF_MEM_OP_SHIFT	0
>  
> -/* memory hierarchy (memory level, hit or miss) */
> +/*
> + * PERF_MEM_LVL_* namespace being depricated to some extent in the
> + * favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_} fields.
> + * Supporting this namespace inorder to not break defined ABIs.
> + *
> + * memory hierarchy (memory level, hit or miss)
> + */
>  #define PERF_MEM_LVL_NA		0x01  /* not available */
>  #define PERF_MEM_LVL_HIT	0x02  /* hit level */
>  #define PERF_MEM_LVL_MISS	0x04  /* miss level  */
> diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
> index f0e75df72b80..ff7289e28192 100644
> --- a/tools/perf/util/mem-events.c
> +++ b/tools/perf/util/mem-events.c
> @@ -320,7 +320,6 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
>  	/* already taken care of */
>  	m &= ~(PERF_MEM_LVL_HIT|PERF_MEM_LVL_MISS);
>  
> -
>  	if (mem_info && mem_info->data_src.mem_remote) {
>  		strcat(out, "Remote ");
>  		l += 7;
> 
