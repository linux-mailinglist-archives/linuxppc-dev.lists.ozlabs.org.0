Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E51242434
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 05:15:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRFFH3kQvzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 13:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MQ9WOL6a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRFCc4TflzDqJR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 13:13:48 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C34lk2145724; Tue, 11 Aug 2020 23:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BU+F9Dz86IxGpKuNXb+Aj16VHYGro8E1U1EdyCc32AA=;
 b=MQ9WOL6aaYFeg64aFqp+VfUV3t7hj8UNOO+1HLi0ju2IHATgBhGV7p3Y42NqJRP6YB0x
 /IQ2woP0WnJNW4tBv89HiPwoVEnq2UDb5ECElqnByemI0U0F2j9EikSF3Xf77XwjVrzZ
 DO2jpGYKmA5/nd8crCuEqtWw7YbBUiNWDizlXuOh8xRwCipW+nOq8mnWsKXu1TSiDEbY
 kH7beCzaMN8SxmQNmH5+1RjOcJyUb3B6RdfxyOrT4sNHUoCDkIHYKd4XnznxB8WaEZeM
 X5MRnXhTvyO8qifLscss/sZ31EwqJrby9SPPQVBwHLbYtC9WwxDD/XjhAAP+0s05sN4+ lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32uya7d49v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 23:13:43 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07C3592Z148824;
 Tue, 11 Aug 2020 23:13:43 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32uya7d498-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Aug 2020 23:13:42 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C36WaM028972;
 Wed, 12 Aug 2020 03:13:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp83xwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 03:13:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C3Dc3Z31785320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 03:13:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7247F11C04C;
 Wed, 12 Aug 2020 03:13:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE6A11C050;
 Wed, 12 Aug 2020 03:13:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 03:13:38 +0000 (GMT)
Received: from [9.81.222.219] (unknown [9.81.222.219])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B44CCA00EF;
 Wed, 12 Aug 2020 13:13:36 +1000 (AEST)
Subject: Re: [PATCH] powerpc/rtas: Restrict RTAS requests from userspace
To: Daniel Axtens <dja@axtens.net>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20200702161932.18176-1-ajd@linux.ibm.com>
 <87bljjxau2.fsf@mpe.ellerman.id.au>
 <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
 <875z9pnvuv.fsf@dja-thinkpad.axtens.net>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <9fac1a12-55e1-2b37-ffb4-a91cbb775d0d@linux.ibm.com>
Date: Wed, 12 Aug 2020 13:13:32 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <875z9pnvuv.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120020
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/8/20 11:41 pm, Daniel Axtens wrote:
>>>> +static bool block_rtas_call(int token, int nargs,
>>>> +			    struct rtas_args *args)
>>>> +{
>>>> +	int i;
>>>> +	const char *reason;
>>>> +	char *token_name = rtas_token_name(token);
>>>
>>> This code isn't particularly performance critical, but I think it would
>>> be cleaner to do the token lookup once at init time, and store the token
>>> in the filter array?
>>>
>>> Then this code would only be doing token comparisons.
>>
>> Yeah that would be cleaner, can get rid of rtas_token_name().
> 
> I'm not sure I quite understand what you're suggesting.
> 
> You still need to do a string->token lookup at least once as the tokens
> differ between PowerVM and qemu. Are you saying that you can fold the
> token name lookup into the init function?

Yeah, mpe is suggesting adding a member to the struct to cache the token 
value, and then just looping through all of them to populate that field 
at init time.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
