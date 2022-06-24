Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7A55958F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 10:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTrDf4gjQz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 18:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=meV/HI47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=meV/HI47;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTrCy2yj9z3blV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 18:40:13 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O7aYmJ007105;
	Fri, 24 Jun 2022 08:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=34yAiJzih1DSpC/+JB3ayNblGkWCzxnzcG3hFnIpUiw=;
 b=meV/HI47lnZS7nIBJ0dQHb9Fq0TYFPY5qGRdAsOUv0ZKtYh9iVk1j9PR2JOkeZwHPYOq
 Lk15DAKrBwBPZCN655p9uRZZ9MbILbpZlNBOlI6/CSvjrxtefLu7p4tSTU/agovd3c6R
 UVfiek70q8AekPqCwwSHlg6SB1fneS7mRio8XjIHCxpZoZNGraYtxi4FWDnLIJC+KFvX
 c4k/ZHvMkI0TIKgTdSHNzJvsh7T84UmSkJ7G112KTtliHvnee0yDrEHbfhHRPQcxOzf3
 9f3BYBqvIGxWNN6Z41EQ+cgR0MOw+IV6XTvpeQdjqdlAPz3F/Scq9H0iUKRUlIpAb8Ps xA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gw8nuswxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 08:40:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25O8M5YL026666;
	Fri, 24 Jun 2022 08:40:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b98p2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 08:40:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25O8e1R815729078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 08:40:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A05894C040;
	Fri, 24 Jun 2022 08:40:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D2124C046;
	Fri, 24 Jun 2022 08:40:00 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
	Fri, 24 Jun 2022 08:40:00 +0000 (GMT)
Date: Fri, 24 Jun 2022 14:09:59 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/numa: Return the first online node instead
 of 0
Message-ID: <20220624083959.GA145013@linux.vnet.ibm.com>
References: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WtIK1D5y3dW8VUAynOaGpFTOxqKVF3DG
X-Proofpoint-ORIG-GUID: WtIK1D5y3dW8VUAynOaGpFTOxqKVF3DG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206240032
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2022-06-23 18:24:41]:

> If early cpu to node mapping finds an invalid node id, return
> the first online node instead of node 0.
> 
> With commit e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
> the kernel marks node 0 offline in certain scenarios.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 8a4d4f4d9749..704088b1d53c 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -60,7 +60,7 @@ static inline int early_cpu_to_node(int cpu)
>  	 * Fall back to node 0 if nid is unset (it should be, except bugs).
>  	 * This allows callers to safely do NODE_DATA(early_cpu_to_node(cpu)).
>  	 */
> -	return (nid < 0) ? 0 : nid;
> +	return (nid < 0) ? first_online_node : nid;

Looks good but just two queries.

1. Is there a possibility of early_cpu_to_node() being called before any
node is online?

2. first_online_node is actually not a variable, it returns the lowest
online node. Right? If lets a early_cpu_to_node() for the same CPU across a
node online/offline may end up giving two different nids. Right?


>  }
> 
>  int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> -- 
> 2.36.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
