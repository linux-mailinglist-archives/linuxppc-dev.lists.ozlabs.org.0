Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460E6D5AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 22:20:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qQVK58ztzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qQL94sWrzDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 06:13:04 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IK8ndj060325; Thu, 18 Jul 2019 16:12:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttvupefxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2019 16:12:55 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6IKA5R7071430;
 Thu, 18 Jul 2019 16:12:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttvupefwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2019 16:12:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6IK9wfn001885;
 Thu, 18 Jul 2019 20:12:54 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2trtmrj63w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2019 20:12:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6IKCrn934079156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 20:12:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 995DB112066;
 Thu, 18 Jul 2019 20:12:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15580112062;
 Thu, 18 Jul 2019 20:12:51 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.186.82])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 18 Jul 2019 20:12:50 +0000 (GMT)
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
 <20190713060023.8479-5-bauerman@linux.ibm.com>
 <4fcc84ae-b93a-b5f1-fba4-b0e2af7b727c@ozlabs.ru>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v2 04/13] powerpc/pseries/svm: Add helpers for
 UV_SHARE_PAGE and UV_UNSHARE_PAGE
In-reply-to: <4fcc84ae-b93a-b5f1-fba4-b0e2af7b727c@ozlabs.ru>
Date: Thu, 18 Jul 2019 17:12:47 -0300
Message-ID: <877e8f3xvk.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=8 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180207
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Alexey,

Thanks for your review!

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 13/07/2019 16:00, Thiago Jung Bauermann wrote:
>> From: Ram Pai <linuxram@us.ibm.com>
>>
>> These functions are used when the guest wants to grant the hypervisor
>> access to certain pages.
>>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/ultravisor-api.h |  2 ++
>>   arch/powerpc/include/asm/ultravisor.h     | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
>> index fe9a0d8d7673..c7513bbadf57 100644
>> --- a/arch/powerpc/include/asm/ultravisor-api.h
>> +++ b/arch/powerpc/include/asm/ultravisor-api.h
>> @@ -25,6 +25,8 @@
>>   #define UV_UNREGISTER_MEM_SLOT		0xF124
>>   #define UV_PAGE_IN			0xF128
>>   #define UV_PAGE_OUT			0xF12C
>> +#define UV_SHARE_PAGE			0xF130
>> +#define UV_UNSHARE_PAGE			0xF134
>>   #define UV_PAGE_INVAL			0xF138
>>   #define UV_SVM_TERMINATE		0xF13C
>>   diff --git a/arch/powerpc/include/asm/ultravisor.h
>> b/arch/powerpc/include/asm/ultravisor.h
>> index f5dc5af739b8..f7418b663a0e 100644
>> --- a/arch/powerpc/include/asm/ultravisor.h
>> +++ b/arch/powerpc/include/asm/ultravisor.h
>> @@ -91,6 +91,21 @@ static inline int uv_svm_terminate(u64 lpid)
>>     	return ucall(UV_SVM_TERMINATE, retbuf, lpid);
>>   }
>> +
>> +static inline int uv_share_page(u64 pfn, u64 npages)
>> +{
>> +	unsigned long retbuf[UCALL_BUFSIZE];
>> +
>> +	return ucall(UV_SHARE_PAGE, retbuf, pfn, npages);
>
>
> What is in that retbuf? Can you pass NULL instead?

I think so, that buffer isn't used actually. Claudio is working on a
ucall_norets() which doesn't take the buffer and I can switch to that.

--
Thiago Jung Bauermann
IBM Linux Technology Center
