Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91D3D6CD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 05:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYj765qwSz30HQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 13:33:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V6SGlSp4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V6SGlSp4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYj6W4K63z2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 13:32:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R39gwV077026; Mon, 26 Jul 2021 23:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/LUiS0mWMOK6aJNeKAHktYy1+9SLDcKDvp8zRaXaX6g=;
 b=V6SGlSp4zMHbTPec2Nfqg/12B0nBv63CHEZIcnIug5BXQNlv3ndYRzyodIP7dRt3FQxw
 oEMtB0ptb2sV0hDoNzeHf0i0BHQdFDNguAG4Od6zhPE3bCoJK0JzaOKNElHwhxtGDrBq
 OD0i+pwAWSCimXsGM/zsELbcmwPp/VU2+NU8yzR/LXgXglZBA9D4BkPWqM7l+sjAXrJv
 D9y+UWEMMzerMzJhJuxaF5S+Y7VaFFtciczEbESiNy6khdKvQJmPubKNAVfjW5nJlzBD
 f6opAR6fTYUjOIjXNtESWEU+c4Rj5m0+EvSWfcm260ksLjSYBFXk8rgOZZfmiYh1pbBo yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a29mch2qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 23:32:40 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16R39Z92076111;
 Mon, 26 Jul 2021 23:32:40 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a29mch2qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 23:32:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16R2v337013311;
 Tue, 27 Jul 2021 03:32:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3a235kt8e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 03:32:39 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16R3WcCl25690518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 03:32:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B8BEC6055;
 Tue, 27 Jul 2021 03:32:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30940C605F;
 Tue, 27 Jul 2021 03:32:36 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.74.145])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Jul 2021 03:32:35 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 4/6] powerpc/pseries: Consolidate different NUMA
 distance update code paths
In-Reply-To: <YP4f7lj9p4f/h77f@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-5-aneesh.kumar@linux.ibm.com>
 <YPjMkQ5W1fSQdzNe@yekko> <87zgueu8ql.fsf@linux.ibm.com>
 <YP4f7lj9p4f/h77f@yekko>
Date: Tue, 27 Jul 2021 09:02:33 +0530
Message-ID: <87r1fktory.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xxbe_5jhXfxcmdHaZpvjjQyi_h3REGRq
X-Proofpoint-ORIG-GUID: lHMc5zjNYcwIz1bs6fGo9WLgK5sl6qnn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_03:2021-07-26,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270012
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

> On Thu, Jul 22, 2021 at 12:37:46PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>> 
>> > On Mon, Jun 28, 2021 at 08:41:15PM +0530, Aneesh Kumar K.V wrote:

....

> 
>> >
>> >> +		nid = of_read_number(&aa.arrays[index], 1);
>> >> +
>> >> +		if (nid == 0xffff || nid >= nr_node_ids)
>> >> +			nid = default_nid;
>> >> +		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
>> >> +			int i;
>> >> +			const __be32 *associativity;
>> >> +
>> >> +			index = lmb->aa_index * aa.array_sz;
>> >> +			associativity = &aa.arrays[index];
>> >> +			/*
>> >> +			 * lookup array associativity entries have different format
>> >> +			 * There is no length of the array as the first element.
>> >
>> > The difference it very small, and this is not a hot path.  Couldn't
>> > you reduce a chunk of code by prepending aa.array_sz, then re-using
>> > __initialize_form1_numa_distance.  Or even making
>> > __initialize_form1_numa_distance() take the length as a parameter.
>> 
>> The changes are small but confusing w.r.t how we look at the
>> associativity-lookup-arrays. The way we interpret associativity array
>> and associativity lookup array using primary_domain_index is different.
>> Hence the '-1' in the node lookup here.
>
> They're really not, though.  It's exactly the same interpretation of
> the associativity array itself - it's just that one of them has the
> array prepended with a (redundant) length.  So you can make
> __initialize_form1_numa_distance() work on the "bare" associativity
> array, with a given length.  Here you call it with aa.array_sz as the
> length, and in the other place you call it with prop[0] as the length.
>
>> 
>> 	index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>> 	nid = of_read_number(&aa.arrays[index], 1);
>> 
>> 
>> >
>> >> +			 */
>> >> +			for (i = 0; i < max_associativity_domain_index; i++) {
>> >> +				const __be32 *entry;
>> >> +
>> >> +				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
>> >
>> > Does anywhere verify that distance_ref_points[i] <= aa.array_size for
>> > every i?
>> 
>> We do check for 
>> 
>> 	if (primary_domain_index <= aa.array_sz &&
>
> Right, but that doesn't check the other distance_ref_points entries.
> Not that there's any reason to have extra entries with Form2, but we
> still don't want stray array accesses.

This is how the change looks. I am not convinced this makes it simpler.
I will add that as the last patch and we can drop that if we find that
not helpful? 

modified   arch/powerpc/mm/numa.c
@@ -171,20 +171,31 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
-/*
- * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
- * info is found.
- */
-static int associativity_to_nid(const __be32 *associativity)
+static int __associativity_to_nid(const __be32 *associativity,
+				  bool lookup_array_assoc,
+				  int max_array_index)
 {
 	int nid = NUMA_NO_NODE;
+	int index;
 
 	if (!numa_enabled)
 		goto out;
+	/*
+	 * ibm,associativity-lookup-array doesn't have element
+	 * count at the start of the associativity. Hence
+	 * decrement the primary_domain_index when used with
+	 * lookup-array associativity.
+	 */
+	if (lookup_array_assoc)
+		index = primary_domain_index - 1;
+	else {
+		index = primary_domain_index;
+		max_array_index = of_read_number(associativity, 1);
+	}
+	if (index > max_array_index)
+		goto out;
 
-	if (of_read_number(associativity, 1) >= primary_domain_index)
-		nid = of_read_number(&associativity[primary_domain_index], 1);
-
+	nid = of_read_number(&associativity[index], 1);
 	/* POWER4 LPAR uses 0xffff as invalid node */
 	if (nid == 0xffff || nid >= nr_node_ids)
 		nid = NUMA_NO_NODE;
@@ -192,6 +203,15 @@ static int associativity_to_nid(const __be32 *associativity)
 	return nid;
 }
 
+/*
+ * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
+ * info is found.
+ */
+static inline int associativity_to_nid(const __be32 *associativity)
+{
+	return __associativity_to_nid(associativity, false, 0);
+}
+
 static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist;
@@ -295,19 +315,38 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
-static void __initialize_form1_numa_distance(const __be32 *associativity)
+static void __initialize_form1_numa_distance(const __be32 *associativity,
+					     bool lookup_array_assoc,
+					     int max_array_index)
 {
 	int i, nid;
+	int index_offset = 0;
 
 	if (affinity_form != FORM1_AFFINITY)
 		return;
+	/*
+	 * ibm,associativity-lookup-array doesn't have element
+	 * count at the start of the associativity. Hence
+	 * decrement the distance_ref_points index when used with
+	 * lookup-array associativity.
+	 */
+	if (lookup_array_assoc)
+		index_offset = 1;
+	else
+		max_array_index = of_read_number(associativity, 1);
 
-	nid = associativity_to_nid(associativity);
+	nid = __associativity_to_nid(associativity, lookup_array_assoc, max_array_index);
 	if (nid != NUMA_NO_NODE) {
 		for (i = 0; i < distance_ref_points_depth; i++) {
 			const __be32 *entry;
+			int index = be32_to_cpu(distance_ref_points[i]) - index_offset;
 
-			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
+			/*
+			 * broken hierarchy, return with broken distance table
+			 */
+			if (index > max_array_index)
+				return;
+			entry = &associativity[index];
 			distance_lookup_table[nid][i] = of_read_number(entry, 1);
 		}
 	}
@@ -321,7 +360,7 @@ static void initialize_form1_numa_distance(struct device_node *node)
 	if (!associativity)
 		return;
 
-	__initialize_form1_numa_distance(associativity);
+	__initialize_form1_numa_distance(associativity, false, 0);
 }
 
 /*
@@ -586,27 +625,14 @@ static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
 
 	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
+		const __be32 *associativity;
 
-		if (nid == 0xffff || nid >= nr_node_ids)
-			nid = default_nid;
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, true, aa.array_sz - 1);
 		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
-			int i;
-			const __be32 *associativity;
-
-			index = lmb->aa_index * aa.array_sz;
-			associativity = &aa.arrays[index];
-			/*
-			 * lookup array associativity entries have different format
-			 * There is no length of the array as the first element.
-			 */
-			for (i = 0; i < distance_ref_points_depth; i++) {
-				const __be32 *entry;
-
-				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
-				distance_lookup_table[nid][i] = of_read_number(entry, 1);
-			}
+			__initialize_form1_numa_distance(associativity,
+							 true, aa.array_sz - 1);
 		}
 	}
 	return nid;
@@ -632,9 +658,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
 	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
+		const __be32 *associativity;
 
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, true, aa.array_sz - 1);
 		if (nid == 0xffff || nid >= nr_node_ids)
 			nid = default_nid;
 	}
@@ -939,7 +967,7 @@ static int __init parse_numa_properties(void)
 
 		if (__vphn_get_associativity(i, vphn_assoc) == 0) {
 			nid = associativity_to_nid(vphn_assoc);
-			__initialize_form1_numa_distance(vphn_assoc);
+			__initialize_form1_numa_distance(vphn_assoc, false, 0);
 		} else {
 
 			/*
@@ -953,7 +981,7 @@ static int __init parse_numa_properties(void)
 			associativity = of_get_associativity(cpu);
 			if (associativity) {
 				nid = associativity_to_nid(associativity);
-				__initialize_form1_numa_distance(associativity);
+				__initialize_form1_numa_distance(associativity, false, 0);
 			}
 			of_node_put(cpu);
 		}
@@ -993,7 +1021,7 @@ static int __init parse_numa_properties(void)
 		associativity = of_get_associativity(memory);
 		if (associativity) {
 			nid = associativity_to_nid(associativity);
-			__initialize_form1_numa_distance(associativity);
+			__initialize_form1_numa_distance(associativity, false, 0);
 		} else
 			nid = default_nid;
 

