Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1AB38EA15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 16:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpgCG10yNz3btH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 00:51:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUHCZFgu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PUHCZFgu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpgBk32Qvz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 00:51:09 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OEiIIU108918; Mon, 24 May 2021 10:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=a8/EepwwVV94zGtrs7QaAveV1JbI/x0tGV+hewzY2Is=;
 b=PUHCZFguaND/4kFHc13mQ7QCqdMwnJlA1SpTP2x6jqfqPnGRN4cVQIgl9Yb2iXpRggg9
 CuRFj4USB8isxoY7OdoPeK2WrsBdeT5pRKsruXidxGMyZr4ukSo7L3DG1ZtWnNNjbYPG
 OvArwZ3+zB65j3D4ByXF8lEOcQJApp3aph5M1kzyUPwPJCUumP9pYakl3494kILksucf
 sLdQG2P1ZJmRyNP5Lha9Mus9/ukht8w8rpNtC3GR5XDYdozRonf/7zSV0bJPQ0CG0HYn
 HK1+KT7CPEucyje0WG1H35nRhTLnaxUat4/TSVk4/RezV91jhii439RlzVuVsAT66wVC eg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38re5sg6gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 10:50:49 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OEkwOd029006;
 Mon, 24 May 2021 14:50:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 38psk88f5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 14:50:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OEohfS19005910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 14:50:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F27411C04A;
 Mon, 24 May 2021 14:50:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4ECE11C052;
 Mon, 24 May 2021 14:50:40 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 24 May 2021 14:50:40 +0000 (GMT)
Date: Mon, 24 May 2021 20:20:40 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 2/3] powerpc/numa: Populate distance map correctly
Message-ID: <20210524145040.GK2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-3-srikar@linux.vnet.ibm.com>
 <87im386wuh.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87im386wuh.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OOHls-M3GlBk14tS2W34GAI7d_dSyxX3
X-Proofpoint-ORIG-GUID: OOHls-M3GlBk14tS2W34GAI7d_dSyxX3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_08:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=665
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105240092
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Valentin Schneider <valentin.schneider@arm.com> [2021-05-24 15:16:22]:

> On 20/05/21 21:14, Srikar Dronamraju wrote:
> > +int arch_populate_distance_map(unsigned long *distance_map)
> > +{
> > +	int i;
> > +	int distance = LOCAL_DISTANCE;
> > +
> > +	bitmap_set(distance_map, distance, 1);
> > +
> > +	if (!form1_affinity) {
> > +		bitmap_set(distance_map, REMOTE_DISTANCE, 1);
> > +		return 0;
> > +	}
> > +
> > +	for (i = 0; i < distance_ref_points_depth; i++) {
> > +		distance *= 2;
> > +		bitmap_set(distance_map, distance, 1);
> 
> Do you have guarantees your distance values will always be in the form of
> 
>   LOCAL_DISTANCE * 2^i
> 
> because that certainly isn't true for x86/arm64.
> 

This is true till now. It don't think that's going to change anytime soon, but
we never know what lies ahead.

For all practical purposes, (unless a newer, shinier property is proposed,)
distance_ref_points_depth is going to give us the unique distances.

> > +	}
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> >   * info is found.
> > --
> > 2.27.0

-- 
Thanks and Regards
Srikar Dronamraju
