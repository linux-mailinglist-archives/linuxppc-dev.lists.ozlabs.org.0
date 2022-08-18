Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AB598205
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 13:13:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7j154NC6z3drQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 21:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2Bngfz7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2Bngfz7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7j0P6855z2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 21:12:37 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAqCBj027648;
	Thu, 18 Aug 2022 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m5xFRYbqQ/2lXXY1pQSEa2jDiReGuiBLzYwDkADrplE=;
 b=M2Bngfz7d4VqP77Src4wPCnEmqXKT6WT3sLE6z1uvfiwN6MlwzpD5Oy8ngDALfjJhGWj
 jbcWhmNcAVUNwpl0C2hYSea91OU3Cd7SqcVCf9NNXuEYi2gHpvE3KUeRvVHfstA4cRE5
 yUlqqwxUHAmxDCYgXXIRZvRZdrOWPjZbyuqKMX1GS/RbJ1not/aP0PLTWrhPo3Q9wHS8
 4vXVna0Yp7cTyyvLL9byM7QxiCcMd23Y+CsBs2oEmxL+gQ2o/AFrmqURsEJTVNwowVJu
 H7qcOGbI2PAoHjVU/UJLbRMYIBjajQS7jwONe0BdytPOanCttGSXlfa93vdo349+w7F2 IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1m250jq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 11:12:21 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27IArAwY030058;
	Thu, 18 Aug 2022 11:12:20 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1m250jpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 11:12:20 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IB6ctP004824;
	Thu, 18 Aug 2022 11:12:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3hx3k9ds81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 11:12:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IBCFBm24117694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 11:12:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9255011C050;
	Thu, 18 Aug 2022 11:12:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B130111C04C;
	Thu, 18 Aug 2022 11:12:12 +0000 (GMT)
Received: from [9.109.198.207] (unknown [9.109.198.207])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 11:12:12 +0000 (GMT)
Message-ID: <07a21891-1571-95ac-8afd-93ff1b92ef4b@linux.vnet.ibm.com>
Date: Thu, 18 Aug 2022 16:42:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/16] powerpc: Skip objtool from running on
 drivers/crypto/vmx/aesp8-ppc.o
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-6-sv@linux.ibm.com>
 <fad7cc16-7dfb-de90-50e7-f2524525e1c3@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <fad7cc16-7dfb-de90-50e7-f2524525e1c3@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u77vzHn5j6OLoMBp3u99w8-jXYTOmXBn
X-Proofpoint-GUID: I7V-918uXgSUN3wJksp4lQ7YQiYuCSZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180038
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/08/22 14:04, Christophe Leroy wrote:
>
> Le 08/08/2022 à 13:48, Sathvika Vasireddy a écrit :
>> With objtool enabled, below warnings are seen when trying to build:
>>
>> drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: aes_p8_set_encrypt_key+0x44: unannotated intra-function call
>>
>> drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: .text+0x2448: unannotated intra-function call
>>
>> drivers/crypto/vmx/aesp8-ppc.o: warning: objtool: .text+0x2d68: unannotated intra-function call
>>
>> Skip objtool from running on this file, as
>> there are no calls to _mcount.
> Why not fix it the same way as for other files ? Please explain.
For two main reasons:

1. Since this file comes from OpenSSL, and since it is a perl file which 
generates a .S file,  it may not
     be the best choice to make too many code changes to such files, 
unless absolutely necessary.

2. Second reason is that, at least as far as the objtool --mcount 
functionality is concerned, we do not
     have to run objtool on that file because that file does not have 
any calls to _mcount.
>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>    drivers/crypto/vmx/Makefile | 2 ++
>>    1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
>> index 2560cfea1dec..7b41f0da6807 100644
>> --- a/drivers/crypto/vmx/Makefile
>> +++ b/drivers/crypto/vmx/Makefile
>> @@ -9,3 +9,5 @@ targets += aesp8-ppc.S ghashp8-ppc.S
>>    
>>    $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
>>    	$(call if_changed,perl)
>> +
>> +OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
