Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79B221C0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 07:44:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6jrS3K0wzDqJN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:44:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6jpc48SWzDqG1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 15:43:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6jpc2ySgz8tNy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 15:43:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6jpc2Mp6z9sRK; Thu, 16 Jul 2020 15:43:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6jpb6g6Zz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 15:43:19 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G5WcAJ164468; Thu, 16 Jul 2020 01:43:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32adafn42y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 01:43:11 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G5XK0w166197;
 Thu, 16 Jul 2020 01:43:10 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32adafn42h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 01:43:10 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G5ebaQ015824;
 Thu, 16 Jul 2020 05:43:09 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 328ux7hu5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 05:43:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G5h9TV15991466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 05:43:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04EA7112061;
 Thu, 16 Jul 2020 05:43:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C9C2112064;
 Thu, 16 Jul 2020 05:43:04 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 05:43:04 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466101903.24747.7234708045729315954.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 12/12] ppc64/kexec_file: fix kexec load failure with
 lack of memory hole
In-reply-to: <159466101903.24747.7234708045729315954.stgit@hbathini.in.ibm.com>
Date: Thu, 16 Jul 2020 02:43:01 -0300
Message-ID: <87r1tc817e.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=100
 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=-1000
 priorityscore=1501 mlxscore=100 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160042
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> The kexec purgatory has to run in real mode. Only the first memory
> block maybe accessible in real mode. And, unlike the case with panic
> kernel, no memory is set aside for regular kexec load. Another thing
> to note is, the memory for crashkernel is reserved at an offset of
> 128MB. So, when crashkernel memory is reserved, the memory ranges to
> load kexec segments shrink further as the generic code only looks for
> memblock free memory ranges and in all likelihood only a tiny bit of
> memory from 0 to 128MB would be available to load kexec segments.
>
> With kdump being used by default in general, kexec file load is likely
> to fail almost always.

Ah. I wasn't aware of this problem.

> This can be fixed by changing the memory hole
> lookup logic for regular kexec to use the same method as kdump.

Right. It doesn't make that much sense to use memblock to find free
memory areas for the kexec kernel, because memblock tracks which memory
areas are free for the currently running kernel. But that's not what
matters for the kernel that will be kexec'd into. In this case, regions
which may be reserved for the current OS instance may well be free for a
freshly started kernel. The kdump method is better at knowing which
memory regions are actually reserved by the firmware/hardware.

> This
> would mean that most kexec segments will overlap with crashkernel
> memory region. That should still be ok as the pages, whose destination
> address isn't available while loading, are placed in an intermediate
> location till a flush to the actual destination address happens during
> kexec boot sequence.

Yes, since the kdump kernel and the "regular" kexec kernel can't be both
booted at the same time, it's not a problem if both plan to use the same
region of memory.

>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Tested-by: Pingfan Liu <piliu@redhat.com>

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

> ---
>
> v2 -> v3:
> * Unchanged. Added Tested-by tag from Pingfan.
>
> v1 -> v2:
> * New patch to fix locating memory hole for kexec_file_load (kexec -s -l)
>   when memory is reserved for crashkernel.
>
>
>  arch/powerpc/kexec/file_load_64.c |   33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
