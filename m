Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552934975A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 17:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5rqY3BN5z3bwW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 03:56:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dcRwho41;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dcRwho41; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5rq71Gfnz30GS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 03:56:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PGWxc5076206
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 12:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3edyEFglXCTDwajaf2PKbqXxhIv9Xd3VDm0iCmJDaHg=;
 b=dcRwho41iw7JjNFSa6VBvQPl527aIWyVPVn4wlOzUF8avPDFjz05YRt6zaLL/RnN76Bm
 fqTa/AlIqTkbwj4xJrpJ+5v1Gayl/wBhrivjE3XsRIptlKXBNg4DwGhIr1G3V2KgfwxC
 qWg4mi6LESau800HCk579O66F1a49fmzLUgvNtas3XC2qeEV9n3wBhJXu87jFHQwYkyW
 svMNTHsNV2UxWN+AZnQziT9WK/fEqR4zeMdQbUaNBj7QC+BIsOU88wY3bX1/PganUc3k
 W+fnUrwtoWxNwDpEZI8e8SgvyWv1JCE1W750dAVrv9FanhTdo57FhkABqx+SLslPtz0w xA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37gvncbvf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 12:56:31 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PGsS7R024203
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:56:29 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 37d9a6jwh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:56:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12PGu8Mh35455316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:56:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A44DA52057
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:56:26 +0000 (GMT)
Received: from pomme.local (unknown [9.211.86.32])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1BC2B5204E
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:56:25 +0000 (GMT)
Subject: Re: VDSO ELF header
To: linuxppc-dev@lists.ozlabs.org
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
Date: Thu, 25 Mar 2021 17:56:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
In-Reply-To: <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_04:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250119
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

Le 25/03/2021 à 17:46, Christophe Leroy a écrit :
> Hi Laurent
> 
> Le 25/03/2021 à 17:11, Laurent Dufour a écrit :
>> Hi Christophe,
>>
>> Since v5.11 and the changes you made to the VDSO code, it no more exposing the 
>> ELF header at the beginning of the VDSO mapping in user space.
>>
>> This is confusing CRIU which is checking for this ELF header cookie 
>> (https://github.com/checkpoint-restore/criu/issues/1417).
> 
> How does it do on other architectures ?

Good question, I'll double check the CRIU code.

> 
>>
>> I'm not an expert in loading and ELF part and reading the change you made, I 
>> can't identify how this could work now as I'm expecting the loader to need 
>> that ELF header to do the relocation.
> 
> I think the loader is able to find it at the expected place.

Actually, it seems the loader relies on the AUX vector AT_SYSINFO_EHDR. I guess 
CRIU should do the same.

>>
>>  From my investigation it seems that the first bytes of the VDSO area are now 
>> the vdso_arch_data.
>>
>> Is the ELF header put somewhere else?
>> How could the loader process the VDSO without that ELF header?
>>
> 
> Like most other architectures, we now have the data section as first page and 
> the text section follows. So you will likely find the elf header on the second 
> page.
> 
> Done in this commit: 
> https://github.com/linuxppc/linux/commit/511157ab641eb6bedd00d62673388e78a4f871cf

I'll double check on x86, but anyway, I think CRIU should rely on 
AT_SYSINFO_EHDR and not assume that the ELF header is at the beginning of VDSO 
mapping.

Thanks for your help.
Laurent.

