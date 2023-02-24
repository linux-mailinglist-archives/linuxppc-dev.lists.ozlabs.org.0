Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC36A1B37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 12:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNS5T5xT3z3f4n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 22:16:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QITyyJUR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QITyyJUR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNS4W0MW9z3chW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 22:15:54 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OABVZD013650
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 11:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6wZG6taDGbM5eL3NgH4fWlaHaJW2hP/koBpz0Tw4juQ=;
 b=QITyyJURnYHd+uIG3Wqg55H56kizDl7B37EgwQHMBT+nWcN+WZx9dyJ0u/poPFfS85AB
 CXNyhCBIEpS33GR/OuJe521U4xABkAVFEcZGWLp1cIoSuWfl/aCdqMDgUpu4dADFyhh4
 C+6sIhRlKykOOHZJ+ifUNXyx72CKk+LXV0LScdO1oYgmdfjilYabTXJj1lVBRPrpy3BH
 SprWHStA9Jq/TIRP40E+KmWtxmGv+cfT788kxYlZubDXJmqQL6HHLe7eOlhiXx/b4vPI
 mLQpYoWs/ZM2hBcxjHEhZFDhvJnX34cTSsZRW9/fAnag8vh3SBCyWR0mq2yngMuXGYgP FA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxu90sb37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 11:15:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31O6KKAu031457
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 11:15:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ntpa6dxk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 11:15:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31OBFlQo15008404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Feb 2023 11:15:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E943520043;
	Fri, 24 Feb 2023 11:15:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61C9E20040;
	Fri, 24 Feb 2023 11:15:46 +0000 (GMT)
Received: from [9.43.42.63] (unknown [9.43.42.63])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Feb 2023 11:15:46 +0000 (GMT)
Message-ID: <acb32fb3-c674-25fa-d6de-bcb6a4ce8f46@linux.ibm.com>
Date: Fri, 24 Feb 2023 16:45:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
 <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/M6kFeUsLBwcbP0@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/b1Hpk8rhrR+H9I@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <Y/b1Hpk8rhrR+H9I@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: doePGCcxhkuFbT1ykoXBZYqdNVcFwYM9
X-Proofpoint-ORIG-GUID: doePGCcxhkuFbT1ykoXBZYqdNVcFwYM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_06,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240091
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

On 23/02/23 10:39, Kautuk Consul wrote:

> Hi Sathvika,
>> Just one question though. Went through the code again and I think
>> that this place shouldn't be proper to insert a SYM_FUNC_END
>> because we haven't entered the guest at this point and the name
>> of the function is kvmppc_hv_entry which  I think implies that
>> this SYM_FUNC_END should be at some place after the HRFI_TO_GUEST.
>>
>> What do you think ?
> Any updates on this ? Is there any other way to avoid this warning ?
Hmm, to mark the end of the kvmppc_hv_entry function, I think 
SYM_FUNC_END(kvmppc_hv_entry) should be placed before the next symbol, 
which is kvmppc_got_guest() in this case.

However, if you think it needs to be put at a different place, then it 
does not make sense to have any other symbols before that. You may want 
to consider checking if other macros like SYM_INNER_LABEL() can be used.

- Sathvika

