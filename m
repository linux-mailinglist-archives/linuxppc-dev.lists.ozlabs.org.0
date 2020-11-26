Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 472592C50E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 10:07:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChX35381VzDr7G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 20:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BMf9+sZ6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChX1V75d8zDr37
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 20:06:22 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQ9172J004659; Thu, 26 Nov 2020 04:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TqsO8eqMQ/6K2OfWbGDrug/rv6DyFLgH1yrMwXF14Fg=;
 b=BMf9+sZ6chmb9Qhp+iTknSnxQpQCCEqYRMD2fUC4mXCsHPBTbR99t57MtLQl6SY3G/TN
 rMgFucMq4yXJupeSmqWzZ0scRM01n+la5LhholNZBz/i4tQ2+Qc0bYc5rijN/UtokVlH
 SyCNMM9gr9ZUHWCsomju5zV0u02iVHjaa5S/8YBrATCMLy6ffSKCTJwSv6+99ZVSuBiP
 maaOmgdwhvOJGk8TS87UGYfFl3K0R5QnDdlhd4YAc4Wb2GtSfK6gitxU2KmttZlrVMWb
 4pXBH8Cd2AUfose9xsp/m4J1hqBFWykRJibYiZG4mYzJiDLzm/8oB9pY12UpKlE0xQEB WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3523k1g9rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 04:06:16 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AQ93HHt012528;
 Thu, 26 Nov 2020 04:06:15 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3523k1g9pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 04:06:15 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQ92Gqw000923;
 Thu, 26 Nov 2020 09:06:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8dfap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 09:06:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQ96AA09961734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 09:06:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E074411C05B;
 Thu, 26 Nov 2020 09:06:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8F2811C054;
 Thu, 26 Nov 2020 09:06:08 +0000 (GMT)
Received: from [9.199.34.187] (unknown [9.199.34.187])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 09:06:08 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc: sstep: Fix load and update instructions
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20201119054139.244083-1-sandipan@linux.ibm.com>
 <daf02936-8a92-e909-7495-7a48f01cfe31@linux.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <7b3fca78-9db3-8c92-3dd4-ef3062155142@linux.ibm.com>
Date: Thu, 26 Nov 2020 14:36:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <daf02936-8a92-e909-7495-7a48f01cfe31@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_02:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260051
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
Cc: jniethe5@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 25/11/20 3:39 pm, Ravi Bangoria wrote:
> 
>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index 855457ed09b5..25a5436be6c6 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -2157,11 +2157,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>             case 23:    /* lwzx */
>>           case 55:    /* lwzux */
>> +            if (u && (ra == 0 || ra == rd))
>> +                return -1;
> 
> I guess you also need to split case 23 and 55?
> 

'u' takes care of that. It will be set for lwzux but not lwzx.

- Sandipan
