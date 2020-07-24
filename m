Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B822CB75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 18:52:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCwGw2HYXzF1QD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 02:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCwDc33RTzF1PV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 02:50:24 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OGXKO9130797; Fri, 24 Jul 2020 12:50:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fux7emdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 12:50:16 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06OGYbPS135895;
 Fri, 24 Jul 2020 12:50:15 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fux7emct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 12:50:15 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OGfB1C022449;
 Fri, 24 Jul 2020 16:50:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 32brq9wx9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 16:50:14 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06OGoDUl23068970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 16:50:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 816112805E;
 Fri, 24 Jul 2020 16:50:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 474882805C;
 Fri, 24 Jul 2020 16:50:13 +0000 (GMT)
Received: from localhost (unknown [9.160.98.15])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 16:50:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCHv3 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
In-Reply-To: <CAFgQCTu_QO=50v2J0=aY2iV8P-oM82_Kfw9My600ZARUt01grw@mail.gmail.com>
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
 <1595382730-10565-2-git-send-email-kernelfans@gmail.com>
 <87imee1hvt.fsf@linux.ibm.com>
 <CAFgQCTu_QO=50v2J0=aY2iV8P-oM82_Kfw9My600ZARUt01grw@mail.gmail.com>
Date: Fri, 24 Jul 2020 11:50:12 -0500
Message-ID: <87d04k26yj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_05:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=5 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=987 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007240128
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
Cc: cheloha@linux.ibm.com, Kexec Mailing List <kexec@lists.infradead.org>,
 ldufour@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pingfan Liu <kernelfans@gmail.com> writes:
> On Thu, Jul 23, 2020 at 9:27 PM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>> Pingfan Liu <kernelfans@gmail.com> writes:
>> > This will introduce extra dt updating payload for each involved lmb when hotplug.
>> > But it should be fine since drmem_update_dt() is memory based operation and
>> > hotplug is not a hot path.
>>
>> This is great analysis but the performance implications of the change
>> are grave. The add/remove paths here are already O(n) where n is the
>> quantity of memory assigned to the LP, this change would make it O(n^2):
>>
>> dlpar_memory_add_by_count
>>   for_each_drmem_lmb             <--
>>     dlpar_add_lmb
>>       drmem_update_dt(_v1|_v2)
>>         for_each_drmem_lmb       <--
>>
>> Memory add/remove isn't a hot path but quadratic runtime complexity
>> isn't acceptable. Its current performance is bad enough that I have
> Yes, the quadratic runtime complexity sounds terrible.
> And I am curious about the bug. Does the system have thousands of lmb?

Yes.

>> Not to mention we leak memory every time drmem_update_dt is called
>> because we can't safely free device tree properties :-(
> Do you know what block us to free it?

It's a longstanding problem. References to device tree properties aren't
counted or tracked so there's no way to safely free them unless the node
itself is released. But the ibm,dynamic-reconfiguration-memory node does
not ever go away and its properties are only subject to updates.

Maybe there's a way to address the specific case of
ibm,dynamic-reconfiguration-memory and the ibm,dynamic-memory(-v2)
properties, instead of tackling the general problem.

Regardless of all that, the drmem code needs better data structures and
lookup functions.
