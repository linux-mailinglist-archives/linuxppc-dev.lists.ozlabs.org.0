Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B849B83D85C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 11:43:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HQgP8YHN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLvSJ4z5Dz3dLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 21:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HQgP8YHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLvRT59Jlz3d97
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 21:43:01 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40QA2Eih002662;
	Fri, 26 Jan 2024 10:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2IMEERAUR7WgGpN5eMUxTy1J+tHxs7yz/GZ4foVta4s=;
 b=HQgP8YHN79Z/Xd0sxe8xQr/TmQICezlxF2sBTzg/p/TKOGogvlVIIoYvzcnbVPP1FLgL
 cgOIGh0BviOvSeh2kzYPSza4U8R1WtCPcGoxngZ41yjVyavCtJuLb26e88cHVfhS6aAw
 suZuwz/MdDHZBTJP11EyqL/74TDMEH8a/t4w1LgDzq16aEHefJ4pUFz8T0wlBf2oxi+c
 fC2Uc29B4CEirjN9xrhY+pdaQuz3lmqzL5IYwoT6uHJG2BqEBexfg9/GeHg8mfK42mZG
 tK4DhfieXlEIrCCJFFf+77IbMLL3oHxa4Tz/suB8qkhqpqLndHvDPXFKMs83XvIifD6j HQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvamjgvak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 10:42:44 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40QAavab026508;
	Fri, 26 Jan 2024 10:42:43 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgtthf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 10:42:43 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40QAgfga44434050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jan 2024 10:42:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A12C15805E;
	Fri, 26 Jan 2024 10:42:41 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 948D65805D;
	Fri, 26 Jan 2024 10:42:38 +0000 (GMT)
Received: from [9.67.128.71] (unknown [9.67.128.71])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jan 2024 10:42:38 +0000 (GMT)
Message-ID: <46ca196c-b7d3-4f3c-9ef0-5d66fb24c9e6@linux.ibm.com>
Date: Fri, 26 Jan 2024 18:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto:vmx: Move ppc vmx diirectory to
 arch/powerpc/crypto.
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20240102205856.370103-1-dtsen@linux.ibm.com>
 <ZbN0LufXZ6YZmn3E@gondor.apana.org.au>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <ZbN0LufXZ6YZmn3E@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DPUyM4vhsiTM7ytNws9YY-5eg4mmlmv2
X-Proofpoint-ORIG-GUID: DPUyM4vhsiTM7ytNws9YY-5eg4mmlmv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 mlxlogscore=692 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260078
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
Cc: dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Herbert.

-Danny

On 1/26/24 4:58 PM, Herbert Xu wrote:
> On Tue, Jan 02, 2024 at 03:58:56PM -0500, Danny Tsen wrote:
>> Relocate all crypto files in vmx driver to arch/powerpc/crypto directory
>> and remove vmx directory.
>>
>> drivers/crypto/vmx/aes.c rename to arch/powerpc/crypto/aes.c
>> drivers/crypto/vmx/aes_cbc.c rename to arch/powerpc/crypto/aes_cbc.c
>> drivers/crypto/vmx/aes_ctr.c rename to arch/powerpc/crypto/aes_ctr.c
>> drivers/crypto/vmx/aes_xts.c rename to arch/powerpc/crypto/aes_xts.c
>> drivers/crypto/vmx/aesp8-ppc.h rename to arch/powerpc/crypto/aesp8-ppc.h
>> drivers/crypto/vmx/aesp8-ppc.pl rename to arch/powerpc/crypto/aesp8-ppc.pl
>> drivers/crypto/vmx/ghash.c rename to arch/powerpc/crypto/ghash.c
>> drivers/crypto/vmx/ghashp8-ppc.pl rename to arch/powerpc/crypto/ghashp8-ppc.pl
>> drivers/crypto/vmx/vmx.c rename to arch/powerpc/crypto/vmx.c
>>
>> deleted files:
>> drivers/crypto/vmx/Makefile
>> drivers/crypto/vmx/Kconfig
>> drivers/crypto/vmx/ppc-xlate.pl
>>
>> This patch has been tested has passed the selftest.  The patch is also tested with
>> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/Kconfig                   |  20 ++
>>   arch/powerpc/crypto/Makefile                  |  20 +-
>>   .../crypto/vmx => arch/powerpc/crypto}/aes.c  |   0
>>   .../vmx => arch/powerpc/crypto}/aes_cbc.c     |   0
>>   .../vmx => arch/powerpc/crypto}/aes_ctr.c     |   0
>>   .../vmx => arch/powerpc/crypto}/aes_xts.c     |   0
>>   .../vmx => arch/powerpc/crypto}/aesp8-ppc.h   |   0
>>   .../vmx => arch/powerpc/crypto}/aesp8-ppc.pl  |   0
>>   .../vmx => arch/powerpc/crypto}/ghash.c       |   0
>>   .../powerpc/crypto}/ghashp8-ppc.pl            |   0
>>   .../crypto/vmx => arch/powerpc/crypto}/vmx.c  |   0
>>   drivers/crypto/Kconfig                        |  14 +-
>>   drivers/crypto/Makefile                       |   2 +-
>>   drivers/crypto/vmx/.gitignore                 |   3 -
>>   drivers/crypto/vmx/Kconfig                    |  14 --
>>   drivers/crypto/vmx/Makefile                   |  23 --
>>   drivers/crypto/vmx/ppc-xlate.pl               | 231 ------------------
>>   17 files changed, 46 insertions(+), 281 deletions(-)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes.c (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_cbc.c (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_ctr.c (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_xts.c (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.h (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.pl (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghash.c (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghashp8-ppc.pl (100%)
>>   rename {drivers/crypto/vmx => arch/powerpc/crypto}/vmx.c (100%)
>>   delete mode 100644 drivers/crypto/vmx/.gitignore
>>   delete mode 100644 drivers/crypto/vmx/Kconfig
>>   delete mode 100644 drivers/crypto/vmx/Makefile
>>   delete mode 100644 drivers/crypto/vmx/ppc-xlate.pl
> Patch applied.  Thanks.
