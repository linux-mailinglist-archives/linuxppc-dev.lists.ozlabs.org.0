Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7732CEFE7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:42:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnb5c293SzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ipQfaDz2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnb3945QzzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:40:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4E2qWg053685; Fri, 4 Dec 2020 09:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TtpGs2JB55MFYXZj3cwX4c1EJekk2tWPQbyFnzjQDWs=;
 b=ipQfaDz26nO+HdJ5+u8QCGfA6Qg9+Mj/1bOp3aq3MF+FbaFxgL8VQnZaBe4WLA6at9jV
 Rgy0WP5a7DHT4vnmYs0a5tRU+sopfY8o2ikyPEz2GIIYoeR/zzSoXUold7bGHeo1Hcao
 Cingu6zPkKe+CPbq1VSB+fsXQhYgnmutKSGSjSyvb4plI+wvVBK8d2qVw7zBYg1gpGfj
 +Oh/S+vdFj0NAft+Wz5PZKpbaCtpuZpZbyWtK+SXRQ/n84g9H3vqSJFxCbGe4+RGwqQJ
 7EU/W3ikWG2H9jANLOc5cXZY31foeqqnW0KC0c8grsKa8OWJxkqE/Nr8ZiYPNSmEIHpB hQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357hfa2vpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 09:40:16 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4EcwqM000370;
 Fri, 4 Dec 2020 14:40:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 353e6a684q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:40:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4EeELi35521022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 14:40:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD49C2805A;
 Fri,  4 Dec 2020 14:40:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A64DB2805C;
 Fri,  4 Dec 2020 14:40:14 +0000 (GMT)
Received: from localhost (unknown [9.65.194.14])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 14:40:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/29] powerpc/rtas: complete ibm,suspend-me status codes
In-Reply-To: <877dpxvimm.fsf@mpe.ellerman.id.au>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-4-nathanl@linux.ibm.com>
 <877dpxvimm.fsf@mpe.ellerman.id.au>
Date: Fri, 04 Dec 2020 08:40:14 -0600
Message-ID: <87360l3a9d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_04:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040080
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> We don't completely account for the possible return codes for
>> ibm,suspend-me. Add definitions for these.
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/rtas.h | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> index 55f9a154c95d..f060181a0d32 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -23,11 +23,16 @@
>>  #define RTAS_RMOBUF_MAX (64 * 1024)
>>  
>>  /* RTAS return status codes */
>> -#define RTAS_NOT_SUSPENDABLE	-9004
>>  #define RTAS_BUSY		-2    /* RTAS Busy */
>>  #define RTAS_EXTENDED_DELAY_MIN	9900
>>  #define RTAS_EXTENDED_DELAY_MAX	9905
>>  
>> +/* statuses specific to ibm,suspend-me */
>> +#define RTAS_SUSPEND_ABORTED     9000 /* Suspension aborted */
>
> This made me ... pause.
>
> But it really is positive 9000, I checked PAPR.

Yes, 9000 falls within the "vendor-specific success codes" range in the
RTAS status value table. I guess aborting a suspend is
operator-initiated and it's not considered an error condition from that
point of view.
