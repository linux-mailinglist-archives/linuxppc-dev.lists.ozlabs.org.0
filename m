Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DBF3499EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 20:03:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5vd13P2mz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:03:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kaGEXXmh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kaGEXXmh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5vcY1hkqz30KR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 06:02:35 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PIY1rx053774; Thu, 25 Mar 2021 15:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : cc : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5TSZvWmAq47qPT3ZC2XijbVOZgYy2PCzsx2HCBwSf/E=;
 b=kaGEXXmhVjUTbYsifYoqMmCzn5CDNXtzvK4HrzlwgxeBJSbI7oLkSnUl00dzn4gVV4zV
 eUOgEZuFq+7WIZwq2woSOq7v4xmez4JAxKIvfx4Fhb/85CcLrU5n49BysC28sKbFPehg
 i1lEnjw8tZr8hYEFMtUzfli+ucwD3wuuxj8tut7tYVaxka0k3GZYtrpJ96E0mly+eOVR
 iKlFghxJq9BtolVbGs/1FBnLiYLyzAyEkRY3MIFHh3E5gKAaDwty0cNgvsZXNTUiitq3
 ktBJfBizwLzw3bpIuV7SGnbxWSfkkHf2/EzCLJuMO6iMV0K70cPZti/xsxlZ+UBFYc72 Kg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gvav7dr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 15:02:26 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PJ1YWF009655;
 Thu, 25 Mar 2021 19:02:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmnn2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 19:02:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PJ2MSa32506310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 19:02:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BE4B4C04E;
 Thu, 25 Mar 2021 19:02:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80F594C04A;
 Thu, 25 Mar 2021 19:02:21 +0000 (GMT)
Received: from pomme.local (unknown [9.211.113.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 19:02:21 +0000 (GMT)
Subject: Re: VDSO ELF header
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
Message-ID: <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
Date: Thu, 25 Mar 2021 20:02:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_07:2021-03-25,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250135
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 25/03/2021 à 17:56, Laurent Dufour a écrit :
> Le 25/03/2021 à 17:46, Christophe Leroy a écrit :
>> Hi Laurent
>>
>> Le 25/03/2021 à 17:11, Laurent Dufour a écrit :
>>> Hi Christophe,
>>>
>>> Since v5.11 and the changes you made to the VDSO code, it no more exposing 
>>> the ELF header at the beginning of the VDSO mapping in user space.
>>>
>>> This is confusing CRIU which is checking for this ELF header cookie 
>>> (https://github.com/checkpoint-restore/criu/issues/1417).
>>
>> How does it do on other architectures ?
> 
> Good question, I'll double check the CRIU code.

On x86, there are 2 VDSO entries:
7ffff7fcb000-7ffff7fce000 r--p 00000000 00:00 0                          [vvar]
7ffff7fce000-7ffff7fcf000 r-xp 00000000 00:00 0                          [vdso]

And the VDSO is starting with the ELF header.

> 
>>
>>>
>>> I'm not an expert in loading and ELF part and reading the change you made, I 
>>> can't identify how this could work now as I'm expecting the loader to need 
>>> that ELF header to do the relocation.
>>
>> I think the loader is able to find it at the expected place.
> 
> Actually, it seems the loader relies on the AUX vector AT_SYSINFO_EHDR. I guess 
> CRIU should do the same.
> 
>>>
>>>  From my investigation it seems that the first bytes of the VDSO area are now 
>>> the vdso_arch_data.
>>>
>>> Is the ELF header put somewhere else?
>>> How could the loader process the VDSO without that ELF header?
>>>
>>
>> Like most other architectures, we now have the data section as first page and 
>> the text section follows. So you will likely find the elf header on the second 
>> page.

I'm wondering if the data section you're refering to is the vvar section I can 
see on x86.


>>
>> Done in this commit: 
>> https://github.com/linuxppc/linux/commit/511157ab641eb6bedd00d62673388e78a4f871cf
> 
> I'll double check on x86, but anyway, I think CRIU should rely on 
> AT_SYSINFO_EHDR and not assume that the ELF header is at the beginning of VDSO 
> mapping.
> 
> Thanks for your help.
> Laurent.
> 

