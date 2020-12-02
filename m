Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C02CC35A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 18:21:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmQjZ2RTyzDrBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 04:21:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jWOUQK99; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmQgX0PwmzDqy6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 04:19:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2H2iIW036126; Wed, 2 Dec 2020 12:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KhLSfmcgHoi0rdSEHXVNcHYYMh8sQRfiuBk9PBbd8I8=;
 b=jWOUQK99UUuc11hMfr8I8Lw10RAlXzyN3vK5d1F6GrOcTW7PlEAf/WGYoKGTUWE+zVut
 AcJiyss3oABPcZegYrutDu5SV8IXb0S0lWnBUvSgY4jZx1lwJ1LG1ICjE5uIQldVu53u
 UMm1yANwKlyLt0LTTq5Fnbwfz/9kj9/7Z2vVFhDG1DFNxDdl+vqHlnp8WVqhMiTCyaEH
 th0wJNJy5KjpuyX/tA/GaPLd3nsSZ8rvV3LBMlQhUk0aZMTn/ZNat0+9CLNq2RQrMdf/
 Ibpd4uY/i1gdcAp5PmBbWFvSrnXzyxsh7FDxjbRcG0vbtZh2TW52wBMhn/dsm6R3rjMn yg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3566pj2b7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 12:19:15 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2HETev023714;
 Wed, 2 Dec 2020 17:19:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 356cbeh79b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 17:19:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2HJEhb3998260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 17:19:14 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43906112061;
 Wed,  2 Dec 2020 17:19:14 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40F07112062;
 Wed,  2 Dec 2020 17:19:13 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 17:19:13 +0000 (GMT)
Subject: Re: [PATCH 00/13] ibmvfc: initial MQ development
To: Hannes Reinecke <hare@suse.de>, james.bottomley@hansenpartnership.com
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
 <90e9a8ac-d2b9-bb64-7c7d-607adaea0f26@suse.de>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <1d5ec685-7160-52da-417b-23a53bcfc47e@linux.ibm.com>
Date: Wed, 2 Dec 2020 09:19:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <90e9a8ac-d2b9-bb64-7c7d-607adaea0f26@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_08:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 suspectscore=2 clxscore=1011 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020100
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/2/20 4:03 AM, Hannes Reinecke wrote:
> On 11/26/20 2:48 AM, Tyrel Datwyler wrote:
>> Recent updates in pHyp Firmware and VIOS releases provide new infrastructure
>> towards enabling Subordinate Command Response Queues (Sub-CRQs) such that each
>> Sub-CRQ is a channel backed by an actual hardware queue in the FC stack on the
>> partner VIOS. Sub-CRQs are registered with the firmware via hypercalls and then
>> negotiated with the VIOS via new Management Datagrams (MADs) for channel setup.
>>
>> This initial implementation adds the necessary Sub-CRQ framework and implements
>> the new MADs for negotiating and assigning a set of Sub-CRQs to associated VIOS
>> HW backed channels. The event pool and locking still leverages the legacy single
>> queue implementation, and as such lock contention is problematic when increasing
>> the number of queues. However, this initial work demonstrates a 1.2x factor
>> increase in IOPs when configured with two HW queues despite lock contention.
>>
> Why do you still hold the hold lock during submission?

Proof of concept.

> An initial check on the submission code path didn't reveal anything obvious, so
> it _should_ be possible to drop the host lock there.

Its used to protect the event pool and the event free/sent lists. This could
probably have its own lock instead of the host lock.

> Or at least move it into the submission function itself to avoid lock
> contention. Hmm?

I have a followup patch to do that, but I didn't see any change in performance.
I've got another patch I'm finishing that provides dedicated event pools for
each subqueue such that they will no longer have any dependency on the host lock.

-Tyrel

> 
> Cheers,
> 
> Hannes

