Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7635DE95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 14:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKPtB75DCz30Gj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 22:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JoNThV9s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JoNThV9s; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKPsk4Yl4z2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 22:23:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DC3dZv081568; Tue, 13 Apr 2021 08:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2yMEjPZSqLkXO24ydJuaWfvjycFYgWdt1+r4Vl0TFBo=;
 b=JoNThV9szNW3Jsbd3IqMBVfVP9+kGfDCdSF7C8hIXcOE6+T9uoC+xr2vOl6VMXKqQkq2
 jSQ8KityR+usxhfJk8jc7K7CD7mX0STuANQq6xi032iiKLXHWPxnlKzvymGCRyxRHnR5
 IR307EZTIhDYJY7zrlizwYDWRkiWPm3BZo8xHMOYObmVVQy1WoTyWRTKc8KuMaXZUgWK
 ZwH4ecOilcuzDXoL+86HAE5iJqWXaOIu4TOKm2tsqsZgM17kfnRlZuMxds645byKeco+
 bL+H0aBL/y253qfnapC8LuVRMiAdr0YwHYxiwtcTz6qTWk+r8cpCCT5/HLnvR6re1Tpj vg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37vkd68xjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:23:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCJUwq002405;
 Tue, 13 Apr 2021 12:23:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 37u3n9rfu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:23:31 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCNVQV31195500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:23:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C2B28058;
 Tue, 13 Apr 2021 12:23:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BFD22805C;
 Tue, 13 Apr 2021 12:23:31 +0000 (GMT)
Received: from localhost (unknown [9.163.8.142])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:23:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210409101409.GA2633526@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210409101409.GA2633526@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 07:23:30 -0500
Message-ID: <87mtu2fk59.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a0hjbba_iSSak-djYgeto7jae4gjdEHn
X-Proofpoint-ORIG-GUID: a0hjbba_iSSak-djYgeto7jae4gjdEHn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_04:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130086
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> That leaves us with just 2 options for now.
> 1. Update numa_mem later and only update numa_node here.
> - Over a longer period of time, this would be more confusing since we
> may lose track of why we are splitting the set of numa_node and numa_mem.
>
> or
> 2. Use my earlier patch.
>
> My choice would be to go with my earlier patch.
> Please do let me know your thoughts on the same.

OK, agreed. Thanks.
