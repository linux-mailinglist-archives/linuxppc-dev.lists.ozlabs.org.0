Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3B4466B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 17:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm53b1XSFz3bhx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 03:06:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTPAp5KG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lTPAp5KG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm52q3B11z2ync
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 03:05:54 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5Fk6dr018640
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 16:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zpLYG08mPEICb80ybYyYbj72/6pHO4z4LDYzdScq+RY=;
 b=lTPAp5KGwOmzkNGd23JmzGXZ4WK/gWcrB1ruIiTDV5dzn2Pi2nw1ZXvfspIHSR68AJup
 9s/5CiSsIQEg849ZE2z3FYYwAbnM6nctSgSx1+d4Dk3deT+A7/LNXwMd4k5vGkdxqWrt
 HkCUA/z/viq4py2uvI4528Y0GqdE9i4Rp/TliNCWxkQPZC9PhwYwaFeJEvCYPeBfQyfD
 xAjWTsLiNQ8nlBwI8d8zdSKCX8qmI63ZkaWYW7OpliVkewp22G+afymYMafksElc7wX+
 rMoKEvSLlUgYbgPn8BxA7gnOsXW+2/i2plIepWilEWouHEkE27pJhMQWeYRo0HwdtKnI 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c57hxrfcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 16:05:50 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5FlTlC028176
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 16:05:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c57hxrfc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 16:05:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5FwFL3022391;
 Fri, 5 Nov 2021 16:05:48 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3c4t3xgeqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 16:05:48 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5G5lnF44892592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 16:05:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB0E612405C;
 Fri,  5 Nov 2021 16:05:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3A1C124058;
 Fri,  5 Nov 2021 16:05:46 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.4.166])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 16:05:46 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Fix numa FORM2 parsing fallback code
In-Reply-To: <20211105132909.1582449-1-npiggin@gmail.com>
References: <20211105132909.1582449-1-npiggin@gmail.com>
Date: Fri, 05 Nov 2021 21:35:43 +0530
Message-ID: <87bl2yegfc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XPREEyts8BdYRUuiAGVPfqDiz6vN8zEK
X-Proofpoint-ORIG-GUID: IhBcY4_xwYCuV6Amu6YrfQxDnjbk8St1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050091
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> In case the FORM2 distance table from firmware is not the expected size,
> there is fallback code that just populates the lookup table as local vs
> remote.
>
> However it then continues on to use the distance table. Fix.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/mm/numa.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 6f14c8fb6359..0789cde7f658 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -380,6 +380,7 @@ static void initialize_form2_numa_distance_lookup_table(void)
>  	const __be32 *numa_lookup_index;
>  	int numa_dist_table_length;
>  	int max_numa_index, distance_index;
> +	bool good = true;
>  
>  	if (firmware_has_feature(FW_FEATURE_OPAL))
>  		root = of_find_node_by_path("/ibm,opal");
> @@ -407,30 +408,26 @@ static void initialize_form2_numa_distance_lookup_table(void)
>  
>  	if (numa_dist_table_length != max_numa_index * max_numa_index) {
>  		WARN(1, "Wrong NUMA distance information\n");
> -		/* consider everybody else just remote. */
> -		for (i = 0;  i < max_numa_index; i++) {
> -			for (j = 0; j < max_numa_index; j++) {
> -				int nodeA = numa_id_index_table[i];
> -				int nodeB = numa_id_index_table[j];
> -
> -				if (nodeA == nodeB)
> -					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
> -				else
> -					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
> -			}
> -		}
> +		good = false;
>  	}
> -
>  	distance_index = 0;
>  	for (i = 0;  i < max_numa_index; i++) {
>  		for (j = 0; j < max_numa_index; j++) {
>  			int nodeA = numa_id_index_table[i];
>  			int nodeB = numa_id_index_table[j];
> -
> -			numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index++];
> -			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
> +			int dist;
> +
> +			if (good)
> +				dist = numa_dist_table[distance_index++];
> +			else if (nodeA == nodeB)
> +				dist = LOCAL_DISTANCE;
> +			else
> +				dist = REMOTE_DISTANCE;
> +			numa_distance_table[nodeA][nodeB] = dist;
> +			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, dist);
>  		}
>  	}
> +
>  	of_node_put(root);
>  }
>  
> -- 
> 2.23.0
