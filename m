Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4AA246677
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 14:38:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVYWJ1DzQzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 22:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fTPMCZu3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVX5B39LRzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 21:34:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HBVVjT175685; Mon, 17 Aug 2020 07:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B5iYghOmdUTlZbfbKZxE3mD8qZFBdZJrezB0sYvsVsY=;
 b=fTPMCZu389J3PsggV63ssAVQLxs7E2P6MizTgz114feAqcWcWcraojgFf34Q6VTWRhtL
 JmDPxffUs/RrXvmA4bDkE5VhbaCBGi8cPVdV2l7BryfHEZdHWyIjd9JFksQaXoH+65+8
 DWFBdnBYR7nP3liGQ4pqcN2uvtIc+GNBUVBk+yf67iZ+SsEWpvFiz0WwVU1rV33Fw7/g
 ocyuaiuZr3jyQJiJV5FgM9e+cLRvFwXnqQnAcrEYrj1xIOPQDeNwSN3RKLR23BCWmlpI
 7j/dCNfbG8Q+pkm+x4/KV4wRnOjuC4v8Zpcg95uDGweKcxRGYYwI+0L+0jlGmWL85cU0 Vg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7ngy045-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 07:34:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HBOcAQ002614;
 Mon, 17 Aug 2020 11:34:29 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 32x7b826qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 11:34:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HBYQPv32440660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 11:34:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA08BAE053;
 Mon, 17 Aug 2020 11:34:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C03C0AE051;
 Mon, 17 Aug 2020 11:34:25 +0000 (GMT)
Received: from [9.102.2.56] (unknown [9.102.2.56])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 11:34:25 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/numa: Introduce logical numa id
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
 <20200817105950.GA31352@linux.vnet.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <15a2f88d-e609-cce9-a82c-321073b9574b@linux.ibm.com>
Date: Mon, 17 Aug 2020 17:04:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817105950.GA31352@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_06:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=867 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008170083
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/17/20 4:29 PM, Srikar Dronamraju wrote:
> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-17 16:02:36]:
> 
>> We use ibm,associativity and ibm,associativity-lookup-arrays to derive the numa
>> node numbers. These device tree properties are firmware indicated grouping of
>> resources based on their hierarchy in the platform. These numbers (group id) are
>> not sequential and hypervisor/firmware can follow different numbering schemes.
>> For ex: on powernv platforms, we group them in the below order.
>>
>>   *     - CCM node ID
>>   *     - HW card ID
>>   *     - HW module ID
>>   *     - Chip ID
>>   *     - Core ID
>>
>> Based on ibm,associativity-reference-points we use one of the above group ids as
>> Linux NUMA node id. (On PowerNV platform Chip ID is used). This results
>> in Linux reporting non-linear NUMA node id and which also results in Linux
>> reporting empty node 0 NUMA nodes.
>>
>> This can  be resolved by mapping the firmware provided group id to a logical Linux
>> NUMA id. In this patch, we do this only for pseries platforms considering the
>> firmware group id is a virtualized entity and users would not have drawn any
>> conclusion based on the Linux Numa Node id.
>>
>> On PowerNV platform since we have historically mapped Chip ID as Linux NUMA node
>> id, we keep the existing Linux NUMA node id numbering.
> 
> I still dont understand how you are going to handle numa distances.
> With your patch, have you tried dlpar add/remove on a sparsely noded machine?
> 

We follow the same steps when fetching distance information. Instead of 
using affinity domain id, we now use the mapped node id. The relevant 
hunk in the patch is

+	nid = affinity_domain_to_nid(&domain);

  	if (nid > 0 &&
-		of_read_number(associativity, 1) >= distance_ref_points_depth) {
+	    of_read_number(associativity, 1) >= distance_ref_points_depth) {
  		/*
  		 * Skip the length field and send start of associativity array
  		 */

I haven't tried dlpar add/remove. I don't have a setup to try that. Do 
you see a problem there?

-aneesh


