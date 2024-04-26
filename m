Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAB8B417E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 23:46:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJNss4+T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR5sX6LYKz3ck4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 07:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJNss4+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR5rq44Jsz3cZ9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 07:46:18 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QLgeqD019047;
	Fri, 26 Apr 2024 21:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=wRZrGmThNELo3Xfz5iQP3Jjffi/9sTGcWnxF1dq5thY=;
 b=RJNss4+T0x0StAB7USpyfXckKdFCJysH6EdPLY89igDsxSLhWl9hvY3YU9S/bxWswngf
 8ixJOmiTQvb52t2zxH6cv2SMnCzO9h+VuRZ+uW7gR7foNSRPKRKImFOCJxiCOPBuUQ9c
 np+DqkcKujAL25gUTDaiafP17plMW7ImX+1E7NnQTw3t8H5KpaLEW5dtVcU8Yqq2Pchq
 32hJp3temeevYHGx/xRhJx9a44iVhJMQyioFkdm2Cw6SMhi29tb13nS17kjCSTdVwyHN
 dd1ebjft93VX25BKcKx7Fhk65hgG1j/tEfavB9zBheXqMBvkpD1UIOmbD8N3ur/vyVkS Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrmdsg04a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:46:05 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43QLk5SN024028;
	Fri, 26 Apr 2024 21:46:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrmdsg040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:46:05 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QIXbag029873;
	Fri, 26 Apr 2024 21:45:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmr1u27br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 21:45:52 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QLjo6N33227462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 21:45:52 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC14958061;
	Fri, 26 Apr 2024 21:45:49 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B94095805E;
	Fri, 26 Apr 2024 21:45:49 +0000 (GMT)
Received: from localhost (unknown [9.61.131.19])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 21:45:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Enforce hcall result buffer validity
 and size
In-Reply-To: <87cyqy7il1.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20240408-pseries-hvcall-retbuf-v1-1-ebc73d7253cf@linux.ibm.com>
 <874jcac3xb.fsf@mail.lhotse>
 <87cyqy7il1.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Fri, 26 Apr 2024 16:45:48 -0500
Message-ID: <87h6fnu7ar.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wDXp9tlFkETxl1Ou-sSH1opb0QpCliJX
X-Proofpoint-ORIG-GUID: oF085i7jg4_RvCUlAzLaHBK-oH8S2iEf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_18,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 spamscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260153
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>> writes:
>>>
>>> plpar_hcall(), plpar_hcall9(), and related functions expect callers to
>>> provide valid result buffers of certain minimum size. Currently this
>>> is communicated only through comments in the code and the compiler has
>>> no idea.
>>>
>>> For example, if I write a bug like this:
>>>
>>>   long retbuf[PLPAR_HCALL_BUFSIZE]; // should be PLPAR_HCALL9_BUFSIZE
>>>   plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, ...);
>>>
>>> This compiles with no diagnostics emitted, but likely results in stack
>>> corruption at runtime when plpar_hcall9() stores results past the end
>>> of the array. (To be clear this is a contrived example and I have not
>>> found a real instance yet.)
>>
>> We did have some real stack corruption bugs in the past.
>>
>> I referred to them in my previous (much uglier) attempt at a fix:
>>
>>   https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1476780032-21643-2-git-send-email-mpe@ellerman.id.au/
>>
>> Annoyingly I didn't describe them in any detail, but at least one of them was:
>>
>>   24c65bc7037e ("hwrng: pseries - port to new read API and fix stack
>>   corruption")
>
> Thanks for this background.
>
>
>> Will this catch a case like that? Where the too-small buffer is not
>> declared locally but rather comes into the function as a pointer?
>
> No, unfortunately. But here's a sketch that forces retbuf to be an
> array [...]

I've made some attempts to improve on this, but I think the original
patch as written may be the best we can do without altering existing
call sites or introducing new APIs and types.

FWIW, GCC is capable of warning when a too-small dynamically allocated
buffer is used. I don't think it would have caught the pseries-rng
bug, but it works when the size of the buffer is available e.g.

  #include <stdlib.h>

  long plpar_hcall(long opcode, long rets[static 4], ...);

  void f(void)
  {
      long retbuf_stack_4[4];
      long retbuf_stack_3[3];
      long *retbuf_heap_4 = malloc(4 * sizeof(long));
      long *retbuf_heap_3 = malloc(3 * sizeof(long));

      plpar_hcall(0, retbuf_stack_4);    
      plpar_hcall(0, retbuf_stack_3); // bug
      plpar_hcall(0, retbuf_heap_4);
      plpar_hcall(0, retbuf_heap_3);  // bug
  }

<source>:13:5: warning: 'plpar_hcall' accessing 32 bytes in a region of size 24 [-Wstringop-overflow=]
   13 |     plpar_hcall(0, retbuf_stack_3); // bug
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<source>:13:5: note: referencing argument 2 of type 'long int[4]'
<source>:3:6: note: in a call to function 'plpar_hcall'
    3 | long plpar_hcall(long opcode, long rets[static 4], ...);
      |      ^~~~~~~~~~~
<source>:15:5: warning: 'plpar_hcall' accessing 32 bytes in a region of size 24 [-Wstringop-overflow=]
   15 |     plpar_hcall(0, retbuf_heap_3);  // bug
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<source>:15:5: note: referencing argument 2 of type 'long int[4]'
<source>:3:6: note: in a call to function 'plpar_hcall'
    3 | long plpar_hcall(long opcode, long rets[static 4], ...);
      |      ^~~~~~~~~~~

Compiler Explorer link for anyone interested in experimenting:
https://godbolt.org/z/x9GKMTzdb

It looks like -Wstringop-overflow is disabled in Linux's build for now,
but hopefully that will change in the future.

OK with taking the patch as-is?
