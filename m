Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BF3B0CA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 20:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8ZHq32G5z3bxw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 04:12:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=omZYJmHq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=omZYJmHq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8ZHM1x4Jz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 04:12:15 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MI3itC178148; Tue, 22 Jun 2021 14:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mLEiEdrRO+V5LRYuP1iz+bCOB7dk72PNnwumnPiW2a4=;
 b=omZYJmHqkSq+ahEQlxTbDstF1LLAOWOPRGI69bvuPbtdD6C9uWkRpxG/Ys41j1Bzhau4
 e4zgiFkG9Q7q1JRbELTMTR333mguf2LIomWHx1gRdtacJjtSay9uhy8IdNpdUaVPnweI
 qefUMoZDt8LufRuM3k2cQvmDkxe5Een8KeRCJfX8w53w9PDRLqpP9OQuHGFc6M1/NGbn
 RZWnFyTLChHrIcAjzHZZVqwE+eRuJtw3+mpThIUQYBESsNyu1oi7qaHS3JwB+f7PmRBx
 +yddk5U5Wk6mUqNhMX43wSF1rJ2uFwAScIa+CngY+TCADuySnAuQEpqTgxUDB6uFEbp1 TA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bjbwwk74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 14:12:07 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MI48hb004528;
 Tue, 22 Jun 2021 18:12:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 399wjg8qbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 18:12:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MIC6oG26935586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 18:12:06 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB22B2064;
 Tue, 22 Jun 2021 18:12:06 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83A2FB205F;
 Tue, 22 Jun 2021 18:12:05 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.216.48])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 18:12:05 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/prom_init: Convert prom_strcpy() into
 prom_strscpy_pad()
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
References: <20210621064938.2021419-1-mpe@ellerman.id.au>
 <87lf73iddy.fsf@dja-thinkpad.axtens.net> <87bl7y35dw.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <210884ec-a4a4-c9f8-89f4-4e3adf2d0cb3@linux.ibm.com>
Date: Tue, 22 Jun 2021 11:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87bl7y35dw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Na51e42jCNOjLDxpxyNMgPVDMNfx-Qep
X-Proofpoint-GUID: Na51e42jCNOjLDxpxyNMgPVDMNfx-Qep
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_11:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220111
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/21 9:11 PM, Michael Ellerman wrote:
> Daniel Axtens <dja@axtens.net> writes:
>> Hi
>>
>>> -static char __init *prom_strcpy(char *dest, const char *src)
>>> +static ssize_t __init prom_strscpy_pad(char *dest, const char *src, size_t n)
>>>  {
>>> -	char *tmp = dest;
>>> +	ssize_t rc;
>>> +	size_t i;
>>>  
>>> -	while ((*dest++ = *src++) != '\0')
>>> -		/* nothing */;
>>> -	return tmp;
>>> +	if (n == 0 || n > INT_MAX)
>>> +		return -E2BIG;
>>> +
>>> +	// Copy up to n bytes
>>> +	for (i = 0; i < n && src[i] != '\0'; i++)
>>> +		dest[i] = src[i];
>>> +
>>> +	rc = i;
>>> +
>>> +	// If we copied all n then we have run out of space for the nul
>>> +	if (rc == n) {
>>> +		// Rewind by one character to ensure nul termination
>>> +		i--;
>>> +		rc = -E2BIG;
>>> +	}
>>> +
>>> +	for (; i < n; i++)
>>> +		dest[i] = '\0';
>>> +
>>> +	return rc;
>>>  }
>>>  
>>
>> This implementation seems good to me.
>>
>> I copied it into a new C file and added the following:
>>
>> int main() {
>> 	char longstr[255]="abcdefghijklmnopqrstuvwxyz";
>> 	char shortstr[5];
>> 	assert(prom_strscpy_pad(longstr, "", 0) == -E2BIG);
>> 	assert(prom_strscpy_pad(longstr, "hello", 255) == 5);
>> 	assert(prom_strscpy_pad(shortstr, "hello", 5) == -E2BIG);
>> 	assert(memcmp(shortstr, "hell", 5) == 0);
>> 	assert(memcmp(longstr, "hello\0\0\0\0\0\0\0\0\0", 6) == 0);
>> 	return 0;
>> }
>>
>> All the assertions pass. I believe this covers all the conditions from
>> the strscpy_pad docstring.
>>
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
> 
> Thanks.
> 
> I'll also drop the explicit nul termination in patch 2, which is a
> leftover from when I was using strncpy().

I guess you can ignore my other email questioning this.

-Tyrel

> 
> cheers
> 

