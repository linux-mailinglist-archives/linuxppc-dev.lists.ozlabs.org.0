Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 920545A4286
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 07:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKGp3bYTz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 15:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+9gXMC/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+9gXMC/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKG22Xg1z2xGf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 15:47:21 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T3nkUC019437;
	Mon, 29 Aug 2022 05:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HnBwohWacgYEuPKS+IFdY3Wh7/m18PjVGtUqNP2tyuo=;
 b=g+9gXMC/IGmVeQ9uq2llE0Pj3UzOmtHZUTTqs7cCNFxwgODSuzj9O4mrWZXUivZUkLxm
 ZeZiiNn9L1MPMpkccpjMRdTRpUfqdKBblg9xVJao+c/g59JL5mLTUc+h6ZBApc3r9kLt
 9cXyoXq7Le0vR0d2eyZNI16UoFQvWWeNHUy9GK9SoljMTL0pQMVzyf6SAPDsh35QEfyR
 jC9c2c4K8UNaqOBkmNycs+9kx1QB4RmB+bhmDfqFbpXC2qQlONXylVRAIWrJk/SJOIdh
 KN3zntzb9pMjYqLmg/A+w6kujk+MRqm41clGFuElxPsJpeFUf68ox9SerGrVBMCdzIoe 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8nw0t658-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:46:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T5d0tD033093;
	Mon, 29 Aug 2022 05:46:54 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8nw0t64e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:46:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T5ZYm5026918;
	Mon, 29 Aug 2022 05:46:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3j7aw91uue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:46:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T5kmhG36307308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 05:46:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D46C54C044;
	Mon, 29 Aug 2022 05:46:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BCAB4C040;
	Mon, 29 Aug 2022 05:46:44 +0000 (GMT)
Received: from [9.43.67.34] (unknown [9.43.67.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 05:46:43 +0000 (GMT)
Message-ID: <8c185fe0-cc43-1cd9-ea1d-0e0f34ad1828@linux.vnet.ibm.com>
Date: Mon, 29 Aug 2022 11:16:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/16] powerpc: Replace unreachable() with it's builtin
 variant in WARN_ON()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-2-sv@linux.ibm.com>
 <43a23349-3356-3347-f395-ba31db8c6978@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <43a23349-3356-3347-f395-ba31db8c6978@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Oi5FODQRRJuBCQ0cChU3-zr7qxLHKnvx
X-Proofpoint-GUID: vwuxdR0fMFD4vVq1ltBJW9O5nqe8AWly
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290026
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 26/08/22 15:48, Christophe Leroy wrote:
>
> Le 08/08/2022 à 13:48, Sathvika Vasireddy a écrit :
>> objtool is throwing *unannotated intra-function call*
>> warnings with a few instructions that are marked
>> unreachable. Replace unreachable() with __builtin_unreachable()
>> to fix these warnings, as the codegen remains same
>> with unreachable() and __builtin_unreachable().
>>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/bug.h | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>> index 61a4736355c2..074be1a78c56 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -99,7 +99,7 @@
>>    	__label__ __label_warn_on;				\
>>    								\
>>    	WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
>> -	unreachable();						\
>> +	__builtin_unreachable();				\
> Should you add barrier_before_unreachable() before
> __builtin_unreachable() to avoid stack bombs ?
>
> See commit 173a3efd3edb ("bug.h: work around GCC PR82365 in BUG()")

Yes, adding barrier_before_unreachable() before __builtin_unreachable()

works around the build issues reported at 
https://lkml.org/lkml/2022/8/25/418.

I'll post a v2 with this change.

Thanks for the suggestion!

- Sathvika

