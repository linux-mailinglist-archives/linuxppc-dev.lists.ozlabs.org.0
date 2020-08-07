Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034723E6D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 06:26:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNC415RrJzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 14:26:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JLEBCwQ0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNC2F4SH0zDqB9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 14:25:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07747vhT194660; Fri, 7 Aug 2020 00:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=fNjh79zz3rNZaxAEkwhh/pkduIKocc8OCe4FqYYb530=;
 b=JLEBCwQ0RoRe0YcpwIHds3EQUS0Me+h4gO0FXsom2XBqNM/cRNaieZpOtz3VKbtxCi4o
 wtXVJuNldH5FzJRGB8aTrulEeajsI1eRB+tiA/ckaFrsW6+qhlOt/j1lhF9JT+iwEVsb
 ARi1vg6wSi4U0pMc0JKddNjJCBKVNlO8+p7H7oMgbQvaOFvNOB0iXb7SgmnqcHvzKC8N
 az/15CHXVSQ95RhqeXH8g5W5Mk2xGHObgAFTbLPajkjnJuZk27jG9afEU/u84p0342Cp
 oc50JaW9tBTWVp4iF/wblLELJlFFyMexzmrfi1hw6odxm1fYgoK6lq1RT+n3M2yWxKti Mg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rephd2a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 00:25:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0774OuQb011367;
 Fri, 7 Aug 2020 04:25:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 32n019twax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 04:25:00 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0774OxHO40894860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 04:24:59 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56A84B2064;
 Fri,  7 Aug 2020 04:24:59 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C80EB205F;
 Fri,  7 Aug 2020 04:24:59 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 04:24:58 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
In-Reply-To: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
Date: Thu, 06 Aug 2020 23:24:58 -0500
Message-ID: <87pn83ytet.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_01:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=1
 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070025
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index e437a9ac4956..6c659aada55b 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>  	}
>  }
>  
> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};

It's odd to me to use MAX_NUMNODES for this array when it's going to be
indexed not by Linux's logical node IDs but by the platform-provided
domain number, which has no relation to MAX_NUMNODES.

> +
> +int firmware_group_id_to_nid(int firmware_gid)
> +{
> +	static int last_nid = 0;
> +
> +	/*
> +	 * For PowerNV we don't change the node id. This helps to avoid
> +	 * confusion w.r.t the expected node ids. On pseries, node numbers
> +	 * are virtualized. Hence do logical node id for pseries.
> +	 */
> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> +		return firmware_gid;
> +
> +	if (firmware_gid ==  -1)
> +		return NUMA_NO_NODE;
> +
> +	if (nid_map[firmware_gid] == NUMA_NO_NODE)
> +		nid_map[firmware_gid] = last_nid++;

This should at least be bounds-checked in case of domain numbering in
excess of MAX_NUMNODES. Or a different data structure should be used?
Not sure.

I'd prefer Linux's logical node type not be easily interchangeable with
the firmware node/group id type. The firmware type could be something
like:

struct affinity_domain {
	u32 val;
};
typedef struct affinity_domain affinity_domain_t;

with appropriate accessors/APIs.

This can prevent a whole class of errors that is currently possible with
CPUs, since the logical and "hardware" ID types are both simple
integers.
