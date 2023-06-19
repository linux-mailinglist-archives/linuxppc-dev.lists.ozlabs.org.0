Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B11735C0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 18:18:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaF6L4AC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlFLh3f5qz3bWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 02:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gaF6L4AC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlFKk697Kz309m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 02:17:45 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35JFq4CK000658;
	Mon, 19 Jun 2023 16:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=T3U8jMHxS5CAFb9h0CXdTshAnP3Ssx+P0u8kgH27xe8=;
 b=gaF6L4ACaPLD6tvzaB3Ev3PhQ7rwDZfJahgYRsfE+VwWzpbO65yiBWfPIHHL0nup57C4
 bkuhpWB/Q6tv3t/M0zDdf8Oj0g2Pt9AcJ0AXNlFeeP5SZX7fbwxEirBIohMKvjjBohvu
 hXPNRzfxZwTd0bSwa2Jfy/lcGZaRXHM/RleZVV/z574z8w+lgL0p158GudNKAD4wh2EC
 CLqF2M4wjnRFo9pmq4wY1PrTD53eN5RCfzeSYjzCVvCy03SBwmF4UmL88ShsYsKCqwvn
 Wi/41885LnhM+CZPQAjz/mbWKEZv5l8aZOKuVXSHjXM9GwHWWYgN4l0sgKI2xheD/OII sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rat1r8nm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 16:17:36 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35JFq69c000740;
	Mon, 19 Jun 2023 16:17:36 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rat1r8nj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 16:17:36 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35JD03iP020825;
	Mon, 19 Jun 2023 16:17:34 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3r94f639pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 16:17:34 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35JGHX4Z27918884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 16:17:33 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AD895805C;
	Mon, 19 Jun 2023 16:17:33 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B03D5805B;
	Mon, 19 Jun 2023 16:17:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.80.193])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 16:17:30 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Tarun Sahu <tsahu@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
In-Reply-To: <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
 <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
Date: Mon, 19 Jun 2023 21:47:27 +0530
Message-ID: <875y7jifzc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PuX4B68A2hjXyt68OE0mHSY1eNuSHLxo
X-Proofpoint-ORIG-GUID: spmOxf8BTjZW9zgIrmS9L5n5pKKT8cQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306190147
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
Cc: foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 09.06.23 08:08, Aneesh Kumar K.V wrote:
>> Certain devices can possess non-standard memory capacities, not constrained
>> to multiples of 1GB. Provide a kernel parameter so that we can map the
>> device memory completely on memory hotplug.
>
> So, the unfortunate thing is that these devices would have worked out of 
> the box before the memory block size was increased from 256 MiB to 1 GiB 
> in these setups. Now, one has to fine-tune the memory block size. The 
> only other arch that I know, which supports setting the memory block 
> size, is x86 for special (large) UV systems -- and at least in the past 
> 128 MiB vs. 2 GiB memory blocks made a performance difference during 
> boot (maybe no longer today, who knows).
>
>
> Obviously, less tunable and getting stuff simply working out of the box 
> is preferable.
>
> Two questions:
>
> 1) Isn't there a way to improve auto-detection to fallback to 256 MiB in 
> these setups, to avoid specifying these parameters?

The patch does try to detect as much as possible by looking at device tree
nodes and aperture window size. But there are still cases where we find
a memory aperture of size X GB and device driver hotplug X.YGB memory.

>
> 2) Is the 256 MiB -> 1 GiB memory block size switch really worth it? On 
> x86-64, experiments (with direct map fragmentation) showed that the 
> effective performance boost is pretty insignificant, so I wonder how big 
> the 1 GiB direct map performance improvement is.


Tarun is running some tests to evaluate the impact. We used to use 1GiB
mapping always. This was later switched to use memory block size to fix
issues with memory unplug
commit af9d00e93a4f ("powerpc/mm/radix: Create separate mappings for hot-plugged memory")
explains some details related to that change.


>
>
> I guess the only real issue with 256 MiB memory blocks and 1 GiB direct 
> mapping is memory unplug of boot memory: when unplugging a 256 MiB 
> block, one would have to remap the 1 GiB range using 2 MiB ranges.

>
> ... I was wondering what would happen if you simply leave the direct 
> mapping in this corner case in place instead of doing this remapping. 
> IOW, remove the memory but keep the direct map pointing at the removed 
> memory. Nobody should be touching it, or are there any cases where that 
> could hurt?
>
>
> Or is there any other reason why we really want 1 GiB memory blocks 
> instead of to defaulting to 256 MiB the way it used to be?
>

The idea we are working towards is to keep the memory block size small
but map the boot memory using 1G. An unplug request can split that 1G
mapping later. We could look at the possibility of leaving that mapping
without splitting. But not sure why we would want to do that if we can
correctly split things. Right now there is no splitting support in powerpc.

-aneesh
