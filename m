Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1687E7D33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 15:58:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S4feCaRo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRhlf5C5sz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 01:58:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S4feCaRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRhkn6Hwpz3cSQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 01:57:37 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AAEQMT9032255;
	Fri, 10 Nov 2023 14:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OR0F6kZzSe5OlfGfHrXDEF78xpuZ7prabawm7FZWMY0=;
 b=S4feCaRo1GiJTC9IBkLAChUhsxxodZD7zKF4cYXQQrYyu+hhYi83ck7b9r6W0x9WX0sU
 vNt72MMn1GdVZ72JxouSp2F1170LXNQ0miFQLMI+dPXBEtYQ94jbfHp+bmUOF1BDTEk6
 ttOBZx8ycFnzNMfH2QN6tcPAfV8f4n+V5mTZBFwvtpUtHM/0QTQq2POGrs5PxqqjipWh
 HtnpwqAZgYW74+dPAG1E7YcpLAwdGKqP4zM1NCWoH5VtZv8uJqmb2bNGzwOlgakKuEp1
 r02AjP/VXmAtVI+13d5sa+PyEIgB0XIZJB4Qs13Phya39PQrinwjPHzDabC8whdUBu3V Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u9p9jgxat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:57:26 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AAEUOLZ015411;
	Fri, 10 Nov 2023 14:57:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u9p9jgxaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:57:25 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AADgq73019248;
	Fri, 10 Nov 2023 14:57:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u7w24bh5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:57:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AAEvN4v2753082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 14:57:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA51D2004B;
	Fri, 10 Nov 2023 14:57:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425F120043;
	Fri, 10 Nov 2023 14:57:20 +0000 (GMT)
Received: from [9.43.3.89] (unknown [9.43.3.89])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Nov 2023 14:57:20 +0000 (GMT)
Message-ID: <9a51f827-6bf4-412b-9feb-37cc41ad3e90@linux.ibm.com>
Date: Fri, 10 Nov 2023 20:27:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: get_user_pages() and EXEC_ONLY mapping.
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <87bkc1oe8c.fsf@linux.ibm.com> <20231110145306.GP4488@nvidia.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20231110145306.GP4488@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OgEGoQQTePdkqQSqW5C5MgKHSBh62sMw
X-Proofpoint-ORIG-GUID: oYE4Jq765dbBJsUXg6vNxwKvZGInymf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=742 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311100123
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/10/23 8:23 PM, Jason Gunthorpe wrote:
> On Fri, Nov 10, 2023 at 08:19:23PM +0530, Aneesh Kumar K.V wrote:
>>
>> Hello,
>>
>> Some architectures can now support EXEC_ONLY mappings and I am wondering
>> what get_user_pages() on those addresses should return. 
> 
> -EPERM
> 
>> Earlier PROT_EXEC implied PROT_READ and pte_access_permitted()
>> returned true for that. But arm64 does have this explicit comment
>> that says
>>
>>  /*
>>  * p??_access_permitted() is true for valid user mappings (PTE_USER
>>  * bit set, subject to the write permission check). For execute-only
>>  * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
>>  * not set) must return false. PROT_NONE mappings do not have the
>>  * PTE_VALID bit set.
>>  */
>>
>> Is that correct? We should be able to get struct page for PROT_EXEC
>> mappings?
> 
> If the memory is unreadable then providing a back door through
> O_DIRECT and everthing else to read it sounds wrong to me.
> 
> If there is some case where a get_user_pages caller is exec-only
> compatible then a new FOLL_EXEC flag to permit it would make sense.
> 

I was expecting pin_user_pages() to return -EPERM and get_user_pages()
return struct page. This was based on Documentation/core-api/pin_user_pages.rst  

"Another way of thinking about these flags is as a progression of restrictions:
FOLL_GET is for struct page manipulation, without affecting the data that the
struct page refers to. FOLL_PIN is a *replacement* for FOLL_GET, and is for
short term pins on pages whose data *will* get accessed. "

May be we can clarify PROT_EXEC details in the documentation? 

-aneesh
