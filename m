Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC39116DFE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:33:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WkfP6qZjzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 00:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WkVb3vgBzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 00:26:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9DMXWk068509
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Dec 2019 08:26:28 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wskq6g2cg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 08:26:28 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Mon, 9 Dec 2019 13:26:25 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 13:26:23 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB9DQM9851642478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 13:26:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC6F4A405E;
 Mon,  9 Dec 2019 13:26:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83B15A4057;
 Mon,  9 Dec 2019 13:26:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 13:26:22 +0000 (GMT)
Received: from [9.81.215.63] (unknown [9.81.215.63])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B2F12A01E4;
 Tue, 10 Dec 2019 00:26:19 +1100 (AEDT)
Subject: Re: [PATCH] powerpc: Fix __clear_user() with KUAP enabled
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20191209105946.13474-1-ajd@linux.ibm.com>
 <3349b5d5-c277-a868-8a27-ef168aae7daa@c-s.fr>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Tue, 10 Dec 2019 00:26:20 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3349b5d5-c277-a868-8a27-ef168aae7daa@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120913-4275-0000-0000-0000038D43FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120913-4276-0000-0000-000038A0F152
Message-Id: <6ff56858-87f2-1ca2-64f7-044b0c730dfc@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_04:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=676 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090116
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
Cc: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/12/19 10:50 pm, Christophe Leroy wrote:
>> -extern unsigned long __clear_user(void __user *addr, unsigned long 
>> size);
>> +extern unsigned long clear_user_asm(void __user *addr, unsigned long 
>> size);
>>   static inline unsigned long clear_user(void __user *addr, unsigned 
>> long size)
>>   {
>> @@ -409,12 +409,17 @@ static inline unsigned long clear_user(void 
>> __user *addr, unsigned long size)
>>       might_fault();
>>       if (likely(access_ok(addr, size))) {
>>           allow_write_to_user(addr, size);
>> -        ret = __clear_user(addr, size);
>> +        ret = clear_user_asm(addr, size);
>>           prevent_write_to_user(addr, size);
>>       }
> 
> What about changing the above by the following ?
> 
>         if (likely(access_ok(addr, size)))        ret = 
> __clear_user(addr, size);
> 
>>       return ret;
>>   }
>> +static inline unsigned long __clear_user(void __user *addr, unsigned 
>> long size)
>> +{
>> +        return clear_user(addr, size);
>> +}
>> +
> 
> Then
> 
> static inline unsigned long __clear_user(void __user *addr, unsigned 
> long size)
> {
>      allow_write_to_user(addr, size);
>      ret = clear_user_asm(addr, size);
>      prevent_write_to_user(addr, size);
> 
>      return ret;
> }

This is exactly the patch I initially wrote, I ran it past mpe privately 
and he suggested aliasing clear_user() -> __clear_user() instead, as 
there's not much point keeping a separate path around for a single user 
for a basically non-existent performance gain.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

