Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7055BA4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqPs4wWNz3dnt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNEFk/xO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNEFk/xO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqHd6ktvz3f46
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:05:17 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDq2hw017608;
	Mon, 27 Jun 2022 14:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ZOj8LmJ8ihCbPYph9tzmQE4C6yXEkCkbajK/rYPopRI=;
 b=sNEFk/xObF4MqYJGJXSnob7Nrm6ytMAy49mlpv3GC9yqqsorMzf7Mk7fcGy7wpy3kpbr
 /a/r6PBZseaBfk0NSByFLE6GH9Ex8nBCHkUv7on3W8DO4+0BUzNdm99YQn37fPm+8TMS
 WChWux8CN8EcP5KOd7GmR1F7TfJwEZh4zDdfrCasm/sPkOa3D7WqaCZdSo5Kr/5czNcu
 /FLXPQJSLAFXMNR9wxl5loYh/6Vz3WBVGBIy5g5PKN/OC3kJx8Mwq6MYmkUeLF26EhQO
 tgZsni8boIjeLMJRPy82jM7uPegm81cYyeAhYbShtkEc7xNKA/PsbIclh4lWjCFN7TXA EQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gydtfgbq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 14:05:11 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RDntVu005046;
	Mon, 27 Jun 2022 14:05:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03dal.us.ibm.com with ESMTP id 3gwt09pfgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 14:05:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RE5AXB24510846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 14:05:10 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E4CCB206B;
	Mon, 27 Jun 2022 14:05:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DB41B2071;
	Mon, 27 Jun 2022 14:05:08 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.61.244])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 14:05:08 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/numa: Return the first online node instead
 of 0
In-Reply-To: <20220624083959.GA145013@linux.vnet.ibm.com>
References: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
 <20220624083959.GA145013@linux.vnet.ibm.com>
Date: Mon, 27 Jun 2022 19:35:05 +0530
Message-ID: <87v8smxkvi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J7avjAeudlp29pNiTebUgzJMdiXaSAES
X-Proofpoint-GUID: J7avjAeudlp29pNiTebUgzJMdiXaSAES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270062
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2022-06-23 18:24:41]:
>
>> If early cpu to node mapping finds an invalid node id, return
>> the first online node instead of node 0.
>> 
>> With commit e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
>> the kernel marks node 0 offline in certain scenarios.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/topology.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 8a4d4f4d9749..704088b1d53c 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -60,7 +60,7 @@ static inline int early_cpu_to_node(int cpu)
>>  	 * Fall back to node 0 if nid is unset (it should be, except bugs).
>>  	 * This allows callers to safely do NODE_DATA(early_cpu_to_node(cpu)).
>>  	 */
>> -	return (nid < 0) ? 0 : nid;
>> +	return (nid < 0) ? first_online_node : nid;
>
> Looks good but just two queries.
>
> 1. Is there a possibility of early_cpu_to_node() being called before any
> node is online?

The kernel operate with node 0 online most of the early boot and mark it offline
in mem_topology_setup() just before parse_numa_properties(). So we
should find some nodes set online.

>
> 2. first_online_node is actually not a variable, it returns the lowest
> online node. Right? If lets a early_cpu_to_node() for the same CPU across a
> node online/offline may end up giving two different nids. Right?
>

The change is specific to a case where we find uninitialized
numa_cpu_lookup_table. ie, the firmware didn't specify the mapping for
the cpu. I do agree that for such cpus the node mapping can change
because of the above. I am not sure whether this can cause any issue in
practice. But returning node 0 which can be marked offline can result
in crashes? 

>
>>  }
>> 
>>  int of_drconf_to_nid_single(struct drmem_lmb *lmb);
>> -- 
>> 2.36.1
>> 
>
> -- 
> Thanks and Regards
> Srikar Dronamraju
