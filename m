Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D655BACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 17:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWsJN4fqZz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 01:36:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4DAl4iT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i4DAl4iT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWsHd3nmmz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 01:35:25 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RF6Qip004248;
	Mon, 27 Jun 2022 15:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3tfjcfA1umXJ4zRA8k81/Dm9rb1xlzZ/FzN7iv+qR7k=;
 b=i4DAl4iToA77Ek7S+1qQWoVgwOooNicJZmnXoz+PYNZ3i5BBiezgII4hIBEmqazgasOv
 znFq47ecF9kYvVDmw7BdYRJv9BWI7JLZS6Nqreyqap56NPFIZOqnX/FrVh+c2AuLffjd
 qGvp6047lzshP827GB/9UrCLFjlUWDi9cvCCdgEcoTBrDhnb6lnk0T85qHVql7kHFoB7
 aSy8KrY44ndOyARXfxnE3T2M2hslErbYSxA4VZqxs5NEA/s50mVCPzS5Bv5c1C6ULt1b
 /hqfe0QnEng7ysiz0vXisXqPDUJ8c1UEq1ZrVg32yE7s0/bNgayd3JZzjEdGdWLmQsX3 zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyeht9q5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:35:12 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RFKerq003707;
	Mon, 27 Jun 2022 15:35:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyeht9q3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:35:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RFYjZJ004307;
	Mon, 27 Jun 2022 15:35:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3gwt08u55t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 15:35:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RFZEwo28574032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 15:35:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41C2BA405F;
	Mon, 27 Jun 2022 15:35:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 286D1A405B;
	Mon, 27 Jun 2022 15:35:03 +0000 (GMT)
Received: from [9.43.63.124] (unknown [9.43.63.124])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 15:35:02 +0000 (GMT)
Message-ID: <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
Date: Mon, 27 Jun 2022 21:05:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4KBnhyse84Bsf1tf-lv6ToDA5RguKz1x
X-Proofpoint-ORIG-GUID: DRBNFF3yOeqTv-LmNDmfHMb205HicYjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=974 adultscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270067
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 25/06/22 12:16, Christophe Leroy wrote:
>
> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
>> objtool is throwing *unannotated intra-function call*
>> warnings with a few instructions that are marked
>> unreachable. Remove unreachable() from WARN_ON()
>> to fix these warnings, as the codegen remains same
>> with and without unreachable() in WARN_ON().
> Did you try the two exemples described in commit 1e688dd2a3d6
> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with
> asm goto") ?
>
> Without your patch:
>
> 00000640 <test>:
>    640:	81 23 00 84 	lwz     r9,132(r3)
>    644:	71 29 40 00 	andi.   r9,r9,16384
>    648:	40 82 00 0c 	bne     654 <test+0x14>
>    64c:	80 63 00 0c 	lwz     r3,12(r3)
>    650:	4e 80 00 20 	blr
>    654:	0f e0 00 00 	twui    r0,0
>
> 00000658 <test9w>:
>    658:	2c 04 00 00 	cmpwi   r4,0
>    65c:	41 82 00 0c 	beq     668 <test9w+0x10>
>    660:	7c 63 23 96 	divwu   r3,r3,r4
>    664:	4e 80 00 20 	blr
>    668:	0f e0 00 00 	twui    r0,0
>    66c:	38 60 00 00 	li      r3,0
>    670:	4e 80 00 20 	blr
>
>
> With your patch:
>
> 00000640 <test>:
>    640:	81 23 00 84 	lwz     r9,132(r3)
>    644:	71 29 40 00 	andi.   r9,r9,16384
>    648:	40 82 00 0c 	bne     654 <test+0x14>
>    64c:	80 63 00 0c 	lwz     r3,12(r3)
>    650:	4e 80 00 20 	blr
>    654:	0f e0 00 00 	twui    r0,0
>    658:	4b ff ff f4 	b       64c <test+0xc>		<==
>
> 0000065c <test9w>:
>    65c:	2c 04 00 00 	cmpwi   r4,0
>    660:	41 82 00 0c 	beq     66c <test9w+0x10>
>    664:	7c 63 23 96 	divwu   r3,r3,r4
>    668:	4e 80 00 20 	blr
>    66c:	0f e0 00 00 	twui    r0,0
>    670:	38 60 00 00 	li      r3,0			<==
>    674:	4e 80 00 20 	blr				<==
>    678:	38 60 00 00 	li      r3,0
>    67c:	4e 80 00 20 	blr
>
The builtin variant of unreachable (__builtin_unreachable()) works.

How about using that instead of unreachable() ?


- Sathvika

