Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257252D2A6A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 13:13:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqzbT6hSJzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 23:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Gk4rH6WC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqzQd3NjDzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 23:05:28 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8C4icI194791; Tue, 8 Dec 2020 07:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tvqJThqpNtsO7FWP24mxfRRvagslwMFYIoOLLvWKHmU=;
 b=Gk4rH6WCcaxsdzdo39ItgQVktG10JU+nDQpGL92hu5drm2OFH03f4qifojzMVByX8shb
 Q4DFzq8+5HD3Q/dd88/z5MtMfGgXC5HIWpgy43nTwECLEEYy6DjHooOodhKBZmc+ZaxW
 9JqV9umfy9XaNNPQqOaynT2Ihpiz8JQeCCI066CRI612YRrvVOcN/e1JaWlwc/UrUJ1y
 6t3sDCZfEotr/nB0RINveIp0Vk8iypnnl6lXVbOjVqEbGSvkjGb7L5yWpic1u/jP4wK9
 NWJ8KGklYfd8ZIvSuNYrYu6IgmsYJkGhDKGATsSzghlGHXA99hw9UVPiyRwyoWmTxuii Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufny00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 07:05:06 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8C56rU001288;
 Tue, 8 Dec 2020 07:05:06 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufnxsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 07:05:05 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8C4ENt022690;
 Tue, 8 Dec 2020 12:04:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u83h8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:04:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8C4jkv2228960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 12:04:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EF5DA4040;
 Tue,  8 Dec 2020 12:04:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D194EA404D;
 Tue,  8 Dec 2020 12:04:43 +0000 (GMT)
Received: from [9.199.61.42] (unknown [9.199.61.42])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 12:04:43 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: Remove per cpu variables from MCE handlers
To: Ganesh <ganeshgr@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
 <871rg0twpw.fsf@mpe.ellerman.id.au>
 <a514db98-6090-467a-74ae-9c7b4337d0c1@linux.ibm.com>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>
Message-ID: <83ca2e1c-88f5-fc57-11e2-056f3ce835d7@linux.ibm.com>
Date: Tue, 8 Dec 2020 17:34:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a514db98-6090-467a-74ae-9c7b4337d0c1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080077
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/8/20 4:16 PM, Ganesh wrote:
> 
> On 12/8/20 4:01 PM, Michael Ellerman wrote:
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>> diff --git a/arch/powerpc/include/asm/paca.h
>>> b/arch/powerpc/include/asm/paca.h
>>> index 9454d29ff4b4..4769954efa7d 100644
>>> --- a/arch/powerpc/include/asm/paca.h
>>> +++ b/arch/powerpc/include/asm/paca.h
>>> @@ -273,6 +274,17 @@ struct paca_struct {
>>>   #ifdef CONFIG_MMIOWB
>>>       struct mmiowb_state mmiowb_state;
>>>   #endif
>>> +#ifdef CONFIG_PPC_BOOK3S_64
>>> +    int mce_nest_count;
>>> +    struct machine_check_event mce_event[MAX_MC_EVT];
>>> +    /* Queue for delayed MCE events. */
>>> +    int mce_queue_count;
>>> +    struct machine_check_event mce_event_queue[MAX_MC_EVT];
>>> +
>>> +    /* Queue for delayed MCE UE events. */
>>> +    int mce_ue_count;
>>> +    struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
>>> +#endif /* CONFIG_PPC_BOOK3S_64 */
>>>   } ____cacheline_aligned;
>> How much does this expand the paca by?
> 
> Size of paca is 4480 bytes, these add up another 2160 bytes, so expands
> it by 48%.
> 

Should we dynamically allocate the array sizes early as similar to that
of paca->mce_faulty_slbs so that we don't bump up paca size ?

Thanks,
-Mahesh.
