Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BD13E891C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 06:10:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkxDw3dlhz3bYj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 14:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3pwcADc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S3pwcADc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkxDC55V9z3002
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 14:09:46 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17B44ujN181103; Wed, 11 Aug 2021 00:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Cld5r/IQOgaF79C8GYE9UhAKObHupaW1hlfP+8i4EZM=;
 b=S3pwcADczcGgAQm2w7otubd9bsKu+Enn1CWQJfPqTbz+MGMZmR0141UCVyrgSQSBduzY
 wE/byPsrCT36BVko6152gshro3gFMRG5ONN2ierosiMNb+u4jq0NIgtUB+UZn46NRiIe
 XWeUf6HtYQCUXoDwUTUOeC9jMGuXsuM+MSO97KKI8xV4/5QKIEgbpOTLBidCRkNC6LhD
 XlcmceW/+181N/aNHByRI8v5K7Y4EUWGpE99zC+cuQMvLHk75c8Ldh4Np8o3S37lrhaQ
 Jodzflgimb7tVXlqAJKKdvU3jG9Uxe8usb10k0ep/8KqOMFqFnc4rj51cWPOoCHAjDKP gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab8kkxdsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 00:09:38 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17B45Lnj183702;
 Wed, 11 Aug 2021 00:09:38 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab8kkxds6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 00:09:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17B47bx0023360;
 Wed, 11 Aug 2021 04:09:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htctj4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 04:09:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17B49aQo21954984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 04:09:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A345812405A;
 Wed, 11 Aug 2021 04:09:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA1E12405C;
 Wed, 11 Aug 2021 04:09:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.72.171])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 04:09:34 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 5/6] powerpc/pseries: Add support for FORM2
 associativity
In-Reply-To: <YRHsXDPaEZyLGLl+@yekko>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
 <20210809052434.53978-6-aneesh.kumar@linux.ibm.com>
 <YRHsXDPaEZyLGLl+@yekko>
Date: Wed, 11 Aug 2021 09:39:32 +0530
Message-ID: <87a6loaagz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ECbrHkLMbVEp8hCu7n6WCVE36_885Gbq
X-Proofpoint-ORIG-GUID: fE-bw3EPWjsaoqCAFXhqDfIeQzbgP1Lu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_01:2021-08-10,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=922 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110024
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Aug 09, 2021 at 10:54:33AM +0530, Aneesh Kumar K.V wrote:
>> PAPR interface currently supports two different ways of communicating resource
>> grouping details to the OS. These are referred to as Form 0 and Form 1
>> associativity grouping. Form 0 is the older format and is now considered
>> deprecated. This patch adds another resource grouping named FORM2.
>> 
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> LGTM, with the exception of some minor nits noted below.
...

> +
>> +	for (i = 0; i < max_numa_index; i++)
>> +		/* +1 skip the max_numa_index in the property */
>> +		numa_id_index_table[i] = of_read_number(&numa_lookup_index[i + 1], 1);
>> +
>> +
>> +	if (numa_dist_table_length != max_numa_index * max_numa_index) {
>> +
>
> Stray extra whitespace line here.
>
>> +		WARN(1, "Wrong NUMA distance information\n");
>> +		/* consider everybody else just remote. */
>> +		for (i = 0;  i < max_numa_index; i++) {
>> +			for (j = 0; j < max_numa_index; j++) {
>> +				int nodeA = numa_id_index_table[i];
>> +				int nodeB = numa_id_index_table[j];
>> +
>> +				if (nodeA == nodeB)
>> +					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
>> +				else
>> +					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
>> +			}
>> +		}
>
> I don't think it's necessarily a problem, but something to consider is
> that this fallback will initialize distance for *all* node IDs,
> whereas the normal path will only initialize it for nodes that are in
> the index table.  Since some later error checks key off whether
> certain fields in the distance table are initialized, is that the
> outcome you want?
>

With the device tree details not correct, one of the possible way to
make progress is to consider everybody remote. With new node hotplug
support we used to check whether the distance table entry is
initialized. With the updated spec, we expect all possible numa node
distance to be available during boot.

-aneesh
