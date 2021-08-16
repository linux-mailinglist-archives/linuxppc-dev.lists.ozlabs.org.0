Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64D3ECE34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 07:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp3QZ6mGgz3cHv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 15:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WvacYWl3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WvacYWl3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp3Pr25hZz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 15:58:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G5XHFv099011; Mon, 16 Aug 2021 01:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fC7hgy3nm2cte1J50sw2IbnHRiInXmLWORbOxVrxkfI=;
 b=WvacYWl3B1/0PM8i41RXVLo5h7wTTs/2owyCDEUwog65Xnk5clCwjyYT2jmFmt1bnwuU
 bx9eTzv1uAJ6OzkhfSiIfIlvckLaYPLIfYHf7qUVNf+sXS+rKhVlk09kwIZXBNcaD98s
 vTw+ZVk+CyBywcZnuIsnXM9hXk3I6hJqblBdKrCSE98DqxfU/Yrb/hmLzNoJ/QJoNoue
 jhp3LMV6n03AZttfELK2ap+XkEipkHpQEQOFxIINBuLWn/77+BC8jgMTmp1cr+SFTU+r
 MUI+G3uhaDH0m7sV/gFjLziRumbcTVpNBy4vbXfwPT1BNckl4CFAYWwOgTC553MMUYt1 uQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aettyvjcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 01:58:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17G5w4rY029288;
 Mon, 16 Aug 2021 05:58:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3ae5fbc556-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 05:58:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17G5wc5a35783138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 05:58:38 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786A3AE066;
 Mon, 16 Aug 2021 05:58:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F95CAE064;
 Mon, 16 Aug 2021 05:58:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.38.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 05:58:35 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powerpc/perf: Use stack siar instead of mfspr
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <37c6279f-a05c-7dd9-b034-05ca524bc6b0@linux.ibm.com>
 <9662dfbf-d163-c313-745e-aeda0f638e98@csgroup.eu>
 <8735rcmcni.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <aa52c0d7-f5cb-4716-a900-f7664dceef3b@linux.ibm.com>
Date: Mon, 16 Aug 2021 11:28:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8735rcmcni.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZM_SUZJCIj6SKyToyQg1qtC_vW3vars9
X-Proofpoint-GUID: ZM_SUZJCIj6SKyToyQg1qtC_vW3vars9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_01:2021-08-13,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160036
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/14/21 6:00 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 13/08/2021 à 10:29, kajoljain a écrit :
>>>
>>> On 8/13/21 1:54 PM, Kajol Jain wrote:
>>>> Minor optimization in the 'perf_instruction_pointer' function code by
>>>> making use of stack siar instead of mfspr.
>>>>
>>>> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
>>>> into perf_read_regs")
>>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>>
>>> Please ignore this patch-set as I mentioned wrong version number. I will resend
>>> this patch-set again with correct version. Sorry for the confusion.
>>
>> I fear you are creating even more confusion by sending a v1 after sending a v2 ...
> 
> Yeah in future just reply to the v2 saying "oops I sent v2 instead of
> v1" and leave it at that.

Hi Christophe/Michael,
     Sure I will take care next time.

Thanks,
Kajol Jain

> 
> cheers
> 
