Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0408C755D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 13:40:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyO02AKP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg7T0195Gz3fmX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 21:40:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyO02AKP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg7SG3HmWz3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 21:40:14 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44G9tHIG014697;
	Thu, 16 May 2024 11:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Cdkakt5nIoiblbiSIViMcQKNwneapIYRohkNyPb6PyQ=;
 b=KyO02AKPiPGr1yXE/136MhM9GCOIJBYVy/chWZn7EVMCaCe3tpeUevEHXxN7omx9PIxm
 EJjGkjTEL/9Kq7g2K4LJlf1YEDcMbFkdvimziOOZSeMtYsbSSxEIU7KViDCbwKrduZ24
 XCkLWbVqvjH0Djx8Qn+Grd7zwNkfuJ7PXEHTf3AWPXHSL3bOSCM9g+ps2c5j1qJhxJ6m
 xNx5n0nLdvb0WBw92s/Co6R0wajcActtZFn9D3WHHZHOdjxuhLFNvnukCKgnKF8qBirP
 5LprL97dyX1MbHAR4X3XNiyygWUNYpIEUtdtYT2X3ZwM+t7F/6jO1Pr7IIfSNSn7OsZf Kw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5d67rqb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 11:40:00 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44G9QSDf005721;
	Thu, 16 May 2024 11:39:59 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq318r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 11:39:59 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GBdt0d48496910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 11:39:58 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDA335805C;
	Thu, 16 May 2024 11:39:55 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF6F958060;
	Thu, 16 May 2024 11:39:54 +0000 (GMT)
Received: from [9.67.138.125] (unknown [9.67.138.125])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 11:39:54 +0000 (GMT)
Message-ID: <3c14a6cf-509e-4743-be26-b14aef7f6930@linux.ibm.com>
Date: Thu, 16 May 2024 06:39:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Andy Polyakov <appro@cryptogams.org>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse>
 <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n8Z0X2o36bwPDtwQ7kznsRkefGBk65ll
X-Proofpoint-ORIG-GUID: n8Z0X2o36bwPDtwQ7kznsRkefGBk65ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_05,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=777 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160082
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

I learned something here.  Will fix this.  Thanks.

-Danny

On 5/16/24 3:38 AM, Andy Polyakov wrote:
> Hi,
>
>>> +.abiversion    2
>>
>> I'd prefer that was left to the compiler flags.
>
> Problem is that it's the compiler that is responsible for providing 
> this directive in the intermediate .s prior invoking the assembler. 
> And there is no assembler flag to pass through -Wa. If concern is ABI 
> neutrality, then solution would rather be #if (_CALL_ELF-0) == 
> 2/#endif. One can also make a case for
>
> #ifdef _CALL_ELF
> .abiversion _CALL_ELF
> #endif
>
> Cheers.
>
