Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3112DD0B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 12:46:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxVZc4Ht1zDqTy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 22:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oJeQ/wcX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxVTb5JNszDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 22:42:10 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHBVsfQ052609; Thu, 17 Dec 2020 06:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KmzD9YHKtbxYHP91VGej+/4uTFedvndl8/Bulecew/M=;
 b=oJeQ/wcXK1u5ns6w6ziZWJp41+a/pFOkBsQ1O/5UgvPkkpVVhjykYwEMi0cDf35bO1r+
 hl47Oa+M2NZW4r7A8mSVaDkKMdY8C8dz/6yZwYnUb4m62a21QfF24dZejjCqVzcwVN2t
 2h0X64IaoWWk+iA9EmtyerS8Hc5eZgrg4Kg9y6mqCIOQV2nYI+wwTkXEtVBTrxcnzWza
 33v482Gs729YIt+gYjVJ3uVJDENZ9LXTiPtZlvxwGJ6u7BSTHPF0pPl6hdMipza/sNAF
 fcuXURP3Ld9F/TODyWurSkd0Me/w2LeA/uo5W4hMeaIpmTLgKKXvH3A2MHGNaE1mjoNW CQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g6d3rfk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 06:42:05 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHBdaWw016551;
 Thu, 17 Dec 2020 11:42:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8fuc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:42:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHBekst22675854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:40:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB7014C05A;
 Thu, 17 Dec 2020 11:40:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD7AF4C040;
 Thu, 17 Dec 2020 11:40:44 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.124.35])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 11:40:44 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Dont create sysfs event files for
 dummy events
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20201217113230.1069882-1-kjain@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <d61d619b-3557-f4ff-a363-3a8f12b3a9ed@linux.ibm.com>
Date: Thu, 17 Dec 2020 17:10:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201217113230.1069882-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_07:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170080
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
Cc: suka@us.ibm.com, maddy@linux.vnet.ibm.com, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/17/20 5:02 PM, Kajol Jain wrote:
> hv_24x7 performance monitoring unit creates list of supported events
> from the event catalog obtained via HCALL. hv_24x7 catalog could also
> contain invalid or dummy events (with names like FREE_  or CPM_FREE_ so


Can you also include " RESERVED_NEST*" as part of the check.

# ls /sys/devices/hv_24x7/events | grep RESERVED
RESERVED_NEST1
RESERVED_NEST10
RESERVED_NEST11
RESERVED_NEST12
...


Maddy


> on). These events does not have any hardware counters backing them.
> So patch adds a check to string compare the event names to filter
> out them.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/perf/hv-24x7.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 6e7e820508df..c3252d8a7818 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -894,6 +894,11 @@ static int create_events_from_catalog(struct attribute ***events_,
>
>   		name = event_name(event, &nl);
>
> +		if (strstr(name, "FREE_")) {
> +			pr_info("invalid event %zu (%.*s)\n", event_idx, nl, name);
> +			junk_events++;
> +			continue;
> +		}
>   		if (event->event_group_record_len == 0) {
>   			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
>   					event_idx, nl, name);
> @@ -955,6 +960,9 @@ static int create_events_from_catalog(struct attribute ***events_,
>   			continue;
>
>   		name  = event_name(event, &nl);
> +		if (strstr(name, "FREE_"))
> +			continue;
> +
>   		nonce = event_uniq_add(&ev_uniq, name, nl, event->domain);
>   		ct    = event_data_to_attrs(event_idx, events + event_attr_ct,
>   					    event, nonce);
