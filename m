Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3813DE32A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 01:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdvdW2tRTz3dWL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 09:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ABoHgzRV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=laboger@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ABoHgzRV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdmP60s2yz2xjR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 04:14:33 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172I4Uk4065612; Mon, 2 Aug 2021 14:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oF+1KWrDgjCrVhbHAm9zTngJfuhEWpIte0xFd6CR5pA=;
 b=ABoHgzRVL2odC/C8J9ZYcZmvATrN0Byr0tvpDwpXkAeyOVBhlUNUq+AMrc/pECtQkR1q
 glRb1wDhVcWhMI55SRWErH7vcw2Q+ZR7eb5qkyVGA8HBILPcUXOTt0L0FrGE+/uL3a7m
 mmLBCxo585FXrAI2I8L6TXvnyuz4laO/8EV8tEIdqAS6U++c+zKGb3Tgg8E4eUwRrOxY
 PHNOG3ZZJxKmnKyssIR+KbXwJ68nK8+EgCkneblgf7QZgktHs4/MWrYRypdlkhECyNbz
 bGoazNFOZ/yZ/UP4cgtPKVnkPFaHlFKnb78EM0Tl0DjBv/O2uU/iw4p7tsVuCYP/2Qv3 Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m01vay3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 14:14:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172I58AW067243;
 Mon, 2 Aug 2021 14:14:19 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a5m01vaxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 14:14:19 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172ID96J006700;
 Mon, 2 Aug 2021 18:14:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3a4x5b0cs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 18:14:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172IEHHt34472344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 18:14:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 449AF28060;
 Mon,  2 Aug 2021 18:14:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3768828068;
 Mon,  2 Aug 2021 18:14:16 +0000 (GMT)
Received: from li-608f474c-22e2-11b2-a85c-e58472f80495.ibm.com (unknown
 [9.163.36.158]) by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 18:14:16 +0000 (GMT)
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO to
 generic C implementation.)
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Murphy <murp@ibm.com>,
 pmenzel@molgen.mpg.de
References: <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
 <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
 <OF44F7146F.67A4C1C2-ON00258720.004DBF64-00258720.004FCFCC@ibm.com>
 <87czqwl67h.fsf@mpe.ellerman.id.au>
From: Lynn Boger <laboger@linux.vnet.ibm.com>
Message-ID: <4c031287-9632-c77b-e5d6-222ca761fab6@linux.vnet.ibm.com>
Date: Mon, 2 Aug 2021 13:14:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czqwl67h.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: szjwlszLeoG2xfb-8pMHWwVkruHoACZW
X-Proofpoint-GUID: IZOuJOLNQGrU95TB3mcGTsXX_7TEu5Ov
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020117
X-Mailman-Approved-At: Tue, 03 Aug 2021 09:38:00 +1000
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
Cc: parkerderek86@gmail.com, xaionaro@gmail.com, paulus@samba.org,
 murphyp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes will be in Go 1.16.7 and 1.15.15. Backports are no longer being 
done for Go 1.14.

On 8/2/21 1:18 AM, Michael Ellerman wrote:
> "Paul Murphy" <murp@ibm.com> writes:
>>   
>> (My apologies for however IBM's email client munges this)
>>
>>> I heard it is going to be in Go 1.16.7, but I do not know much about Go.
>>> Maybe the folks in Cc can chime in.
>>   
>>   
>> We have backports primed and ready for the next point release. They
>> are waiting on the release manager to cherrypick them.
> OK good, that is still the correct fix in the long run.
>
>> I think we were aware that our VDSO usage may have exploited some
>> peculiarities in how the ppc64 version was constructed (i.e hand
>> written assembly which just didn't happen to clobber R30).
> Yeah I was "somewhat surprised" that Go thought it could use r30 like
> that across a VDSO call :D
>
> But to be fair the ABI of the VDSO has always been a little fishy,
> because the entry points pretend to be a transparent wrapper around
> system calls, but then in a case like this are not.
>
>> Go up to this point has only used the vdso function __kernel_clock_gettime; it
>> is the only entry point which would need to explicitly avoid R30 for
>> Go's sake.
> I thought about limiting the workaround to just that code, but it seemed
> silly and likely to come back to bite us. Once the compilers decides to
> spill a non-volatile there are plenty of other ones to choose from.
>
> cheers
