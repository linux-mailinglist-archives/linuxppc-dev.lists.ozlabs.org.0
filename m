Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9B3030FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 01:32:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPnkw12z8zDr28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lLtaOxwg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPnjB4R20zDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 11:31:25 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10Q02eSN052276; Mon, 25 Jan 2021 19:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=5orEmH7GjXb9T6dppAu3nZMub/TPP4rO1PEClnt1LXU=;
 b=lLtaOxwg1Fv1ZjUNm2LyqU+iZJvHxtlxbbORaNuqcfncuVIndP1hXMRkQDCjJ5CigIVr
 QMW5NmzbbiGQDrq+k0YekUqP0iDbbZUt72lOM+rTGhE2E+GvTMOwNTfn0zYAEv+jau4Z
 vH1Xct0QqDS5JsySaQWMGg8D7ZQfq+S4z02ZhYEwEbaHL+RiCnZQKQBgAf4mSQbAOrDw
 V3HrKiKXVuT37T1RjmFx1P/MFbjbcLtmh1DXUI8/1xb0HuZG+UoOcSWHDvqSmz2ekqka
 g98K9EikZdCbZ/tYl/BufLVPUDTsLMXFkMFnCHpfH2I8tevDt7/xRAX906B35wBIt/oJ dw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36a64yk2rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 19:31:03 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q0KIPk018190;
 Tue, 26 Jan 2021 00:31:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 36a6wsrk92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 00:31:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10Q0V1nI4588032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 00:31:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B552C6059;
 Tue, 26 Jan 2021 00:31:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FC57C6055;
 Tue, 26 Jan 2021 00:30:57 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.183.123])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Jan 2021 00:30:57 +0000 (GMT)
References: <20201220064959.GB392325@kernel.org>
 <20210122043714.266075-1-bauerman@linux.ibm.com>
 <20210123180911.aafa8404a3a7a30779713456@linux-foundation.org>
 <20210124073421.GG6332@kernel.org>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations
 with kernel_end
In-reply-to: <20210124073421.GG6332@kernel.org>
Date: Mon, 25 Jan 2021 21:30:55 -0300
Message-ID: <87h7n44k00.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_10:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250119
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
Cc: riel@surriel.com, kernel-team@fb.com, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, guro@fb.com, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Konrad Rzeszutek Wilk <konrad@darnok.org>, iamjoonsoo.kim@lge.com,
 mhocko@kernel.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Mike Rapoport <rppt@kernel.org> writes:

> On Sat, Jan 23, 2021 at 06:09:11PM -0800, Andrew Morton wrote:
>> On Fri, 22 Jan 2021 01:37:14 -0300 Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>> 
>> > Mike Rapoport <rppt@kernel.org> writes:
>> > 
>> > > > Signed-off-by: Roman Gushchin <guro@fb.com>
>> > > 
>> > > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>> > 
>> > I've seen a couple of spurious triggers of the WARN_ONCE() removed by this
>> > patch. This happens on some ppc64le bare metal (powernv) server machines with
>> > CONFIG_SWIOTLB=y and crashkernel=4G, as described in a candidate patch I posted
>> > to solve this issue in a different way:
>> > 
>> > https://lore.kernel.org/linuxppc-dev/20201218062103.76102-1-bauerman@linux.ibm.com/
>> > 
>> > Since this patch solves that problem, is it possible to include it in the next
>> > feasible v5.11-rcX, with the following tag?
>> 
>> We could do this,

Thanks!

>> if we're confident that this patch doesn't depend on
>> [1/2] "mm: cma: allocate cma areas bottom-up"?  I think it is...
>
> A think it does not depend on cma bottom-up allocation, it's rather the other
> way around: without this CMA bottom-up allocation could fail with KASLR
> enabled.

I agree. Conceptually, this could have been patch 1 in this series.

> Still, this patch may need updates to the way x86 does early reservations:
>
> https://lore.kernel.org/lkml/20210115083255.12744-1-rppt@kernel.org

Ah, I wasn't aware of this. Thanks for fixing those issues. That series
seems to be well accepted.

>> > Fixes: 8fabc623238e ("powerpc: Ensure that swiotlb buffer is allocated from low memory")
>> 
>> I added that.

Thanks!
-- 
Thiago Jung Bauermann
IBM Linux Technology Center
