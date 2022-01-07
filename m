Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E94877F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 14:08:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVk7H1bVFz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 00:08:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DC3O50Fa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DC3O50Fa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVk6R41VHz30MK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jan 2022 00:07:58 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207C6g6i017071; 
 Fri, 7 Jan 2022 13:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=7wKYsuTIeVHRO5LgRdwt6kfkJAgaFB5gW9WbvG/QZyg=;
 b=DC3O50FaXKT08HEW4+e26VerT43iPI+MBqKeJXQzIl6uYhj/KOwHuXe37xdxznWn/Dmr
 DHwWWbBE2xolX63bWFA5GFoDoQue67Jq6ptgsxRmbY9SshWLuA7818qZqx5mpd+0ld6P
 BNSZaE5NmQXpraZPrgwRnmSEAoHg2gNqEoK17/410UJWw89Mr8MN59gcXLIxSQ5PA/Vw
 f09EYwzLDFgDObnqQNXuZz+9B6JTV68K+rvfK9ohJGK4MYqSZn4mbYQlL9Ry1VczHD3e
 OnoZ0pAMLcKEW6OW8s3THpK7GjzTGtNac5wjuhb9F1QPMnZBjOhTPi5pHtMop0fBtn7U zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de52ggwxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:07:52 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207D4jUM021277;
 Fri, 7 Jan 2022 13:07:52 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de52ggwwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:07:52 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207D2toC011558;
 Fri, 7 Jan 2022 13:07:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3de5cc7nnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 13:07:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207D7ooS25756064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 13:07:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08774BE058;
 Fri,  7 Jan 2022 13:07:50 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 601B6BE05D;
 Fri,  7 Jan 2022 13:07:49 +0000 (GMT)
Received: from localhost (unknown [9.211.33.229])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Jan 2022 13:07:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] KVM: PPC: mmio: Return to guest after emulation
 failure
In-Reply-To: <63f9a19c-0b5c-8746-7ef4-ab72cbda397c@ozlabs.ru>
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
 <20220106200304.4070825-7-farosas@linux.ibm.com>
 <63f9a19c-0b5c-8746-7ef4-ab72cbda397c@ozlabs.ru>
Date: Fri, 07 Jan 2022 10:07:47 -0300
Message-ID: <87a6g73d98.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HoSR5rs-03WGlB_46YnL0ZRq7E9a3udA
X-Proofpoint-ORIG-GUID: hMIW0oVcgLDPOm3l9kI3vZbDW1comikr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_04,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070090
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 07/01/2022 07:03, Fabiano Rosas wrote:
>> If MMIO emulation fails we don't want to crash the whole guest by
>> returning to userspace.
>> 
>> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
>> implementation") added a todo:
>> 
>>    /* XXX Deliver Program interrupt to guest. */
>> 
>> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
>> emulation from priv emulation") added the Program interrupt injection
>> but in another file, so I'm assuming it was missed that this block
>> needed to be altered.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
>
> Looks right.
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> but this means if I want to keep debugging those kvm selftests in 
> comfort, I'll have to have some exception handlers in the vm as 
> otherwise the failing $pc is lost after this change :)

Yes! But that will be a problem for any test. These kinds of issues is
why I wanted a trial period before sending the test infrastructure
upstream. Maybe we don't need exception handlers, but just a way to
force the test to crash if it tries to fetch from 0x700.
