Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F54F314470
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 01:00:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZNLy6MnFzDvX9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Eb4XMyvh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZNJt4CBlzDvWP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 10:58:37 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 118NXEvH155636; Mon, 8 Feb 2021 18:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=mxn87d4AQHZAkLlT2xU24ah/PVAVDm4ATnnmcY7rvko=;
 b=Eb4XMyvhwDH3HB0LvVSlJxJWsdw9GHkBaxCr2nPW/9jV2Fm01Eaf3AGx6Rtp1yC4Pf6f
 n9A7ZDuUPm08lhlItSkDdQNr1WQEv+AgkLcq9Q3JQglTnPsBrMt8WXTSIt4UVm+hYvtr
 xOZ9d689FLZ/VXL6whLzNecynW4pGNIRtIgYrXHTBn8vY70jHAcu4V3GJUS2orh1wTy7
 M/yqKkkH78ChyWyq9yWEd1xGztKS91ci6KdcdjmNOAkmw0p8bXGEeYihphsQ6D2U3ugw
 CmdhO707cb4pB19U11/sqr/DulUr20pdE3g6IseLZo7PRmktytwRspD2XyEbmT+6Vg51 0w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36kbsmwe4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 18:58:13 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 118NmKDr021090;
 Mon, 8 Feb 2021 23:58:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 36hjr92f6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 23:58:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 118NwCQS26149262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Feb 2021 23:58:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B721DAE063;
 Mon,  8 Feb 2021 23:58:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 685ADAE05F;
 Mon,  8 Feb 2021 23:58:09 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.80.224.222])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Feb 2021 23:58:09 +0000 (GMT)
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
Date: Mon, 08 Feb 2021 20:58:07 -0300
Message-ID: <87ft26yuwg.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_16:2021-02-08,
 2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080130
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
Cc: riel@surriel.com, iamjoonsoo.kim@lge.com, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, mhocko@kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, guro@fb.com,
 Konrad Rzeszutek Wilk <konrad@darnok.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 kernel-team@fb.com
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
>> We could do this, if we're confident that this patch doesn't depend on
>> [1/2] "mm: cma: allocate cma areas bottom-up"?  I think it is...
>
> A think it does not depend on cma bottom-up allocation, it's rather the other
> way around: without this CMA bottom-up allocation could fail with KASLR
> enabled.

I noticed that this patch is now upstream as:

2dcb39645441 memblock: do not start bottom-up allocations with kernel_end

> Still, this patch may need updates to the way x86 does early reservations:
>
> https://lore.kernel.org/lkml/20210115083255.12744-1-rppt@kernel.org

... but the patches from this link still aren't. Isn't this a potential
problem for x86?

The patch series on the link above is now superseded by v2:

https://lore.kernel.org/linux-mm/20210128105711.10428-1-rppt@kernel.org/

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
