Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999AF3649D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 20:30:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPFkM35tmz30Gp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 04:30:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f2x6LB5e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f2x6LB5e; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPFjw6Cwwz2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 04:30:28 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JI37RX035305; Mon, 19 Apr 2021 14:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+GrMsbAbHcemcVqibamdzeH4T45MipgcS1pGANDliFU=;
 b=f2x6LB5eobuWZj7QgJGyXI/MVIO6rSTeVv+DbjpgFV6mD3zS7MYxk6L5Hu4YpRI2SfJ/
 nn8qNqEk/QkzkRdKerxJwb/19yzndUleuYR4sSWkXf3HM2klu0Vel1XA1lsnOH6mag+K
 sYTWKHMjOjxe9zNYqXKq6uCAHCrnw/Jl+TZtv73Wn7AFGBndMeGdhGZZETeu8/+xCMNd
 KBbVNtbek4tv64Ca4SbgY2/3fSv5cFy3FHAxMPJ4ilhB+hBR+wma1TC6b/vVj/Yh9xTC
 oDeWfcdlaEFa2pYNQgxRvzQt2yu1dKWHvWZaIGdOSG8w5URNrRmfIcc4oXREaDlj2UMM qw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 380d7dt4r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:30:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13JISevv026255;
 Mon, 19 Apr 2021 18:30:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 37yqaa0xqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 18:30:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13JIUItu31850992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 18:30:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76B84AC062;
 Mon, 19 Apr 2021 18:30:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1B8CAC059;
 Mon, 19 Apr 2021 18:30:17 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.78.157])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Apr 2021 18:30:17 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Add shutdown() to vio_driver and vio_bus
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20210402001325.939668-1-tyreld@linux.ibm.com>
 <f326def4-0db0-f924-1700-dd7be3154153@linux.ibm.com>
 <87im4ldrft.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <59bd8028-cb1a-fdf6-74ce-68e868e4f486@linux.ibm.com>
Date: Mon, 19 Apr 2021 11:30:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87im4ldrft.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s8WA5X0vf7pSbMdon8W6mtkvDPUAD7D_
X-Proofpoint-GUID: s8WA5X0vf7pSbMdon8W6mtkvDPUAD7D_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_11:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104190124
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/17/21 5:30 AM, Michael Ellerman wrote:
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 4/1/21 5:13 PM, Tyrel Datwyler wrote:
>>> Currently, neither the vio_bus or vio_driver structures provide support
>>> for a shutdown() routine.
>>>
>>> Add support for shutdown() by allowing drivers to provide a
>>> implementation via function pointer in their vio_driver struct and
>>> provide a proper implementation in the driver template for the vio_bus
>>> that calls a vio drivers shutdown() if defined.
>>>
>>> In the case that no shutdown() is defined by a vio driver and a kexec is
>>> in progress we implement a big hammer that calls remove() to ensure no
>>> further DMA for the devices is possible.
>>>
>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>> ---
>>
>> Ping... any comments, problems with this approach?
> 
> The kexec part seems like a bit of a hack.
> 
> It also doesn't help for kdump, when none of the shutdown code is run.

If I understand correctly for kdump we have a reserved memory space where the
kdump kernel is loaded, but for kexec the memory region isn't reserved ahead of
time meaning we can try and load the kernel over potential memory used for DMA
by the current kernel. Please correct me if I've got that wrong.

> 
> How many drivers do we have? Can we just implement a proper shutdown for
> them?

Well that is the end goal. I just don't currently have the bandwidth to do each
driver myself with a proper shutdown sequence, and thought this was a launching
off point to at least introduce the shutdown callback to the VIO bus.

Off the top of my head we have 3 storage drivers, 2 network drivers, vtpm, vmc,
pseries_rng, nx, nx842, hvcs, hvc_vio.

I can drop the kexec_in_progress hammer and just have each driver call remove()
themselves in their shutdown function. Leave it to each maintainer to decide if
remove() is enough or if there is a more lightweight quiesce sequence they
choose to implement.

-Tyrel

> 
> cheers
> 

