Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7029A2B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 03:33:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKwjQ3wLLzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 13:32:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sjvm+Hms; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKwgs2kFWzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 13:31:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09R22RTc053876; Mon, 26 Oct 2020 22:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dpve2cJL+l/PRNCQwoiPDNGaPY/+fphobHA55GN/7us=;
 b=Sjvm+HmsnCHLx0ANw6WahfB8vuL+dpZt4KRkqmCpD1bSGRtVbT7bylJEeYL6MvMmRwJ3
 IzHKCcOdeM7H3zgIyeu5lCEPBg7mkqGjkBjtJ4Gge3COEmmqu1tr3bqspGHV3Kngoa7U
 lT6Xtg65s6LwRoEZHV3JXElJ0MqHeNKCUJDGePUdc/wHh2lZfrYyMFJKWdw/h4zNYhX6
 rkK7YQiJvA6NG4eAzKv6sd9cEfoBdQ9NB3GSRBTBKRaa1As8puW5HzgOtGNZZmAd8E9J
 kV1tb/LWZylrviRqk525q52AakCWFHXp4TwlBT4HYmd8mjYK5STPzPHdW154UWU3bZNl Cw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34duwdj3rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 22:31:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09R2SqRY000712;
 Tue, 27 Oct 2020 02:31:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 34cbhh2uk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 02:31:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09R2VKRj22806814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 02:31:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96E5DA405B;
 Tue, 27 Oct 2020 02:31:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C32CEA4060;
 Tue, 27 Oct 2020 02:31:19 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.199.32.222])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Oct 2020 02:31:19 +0000 (GMT)
Subject: Re: [PATCH 5/5] powerpc/perf: use regs->nip when siar is zero
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20201021085329.384535-1-maddy@linux.ibm.com>
 <20201021085329.384535-5-maddy@linux.ibm.com>
 <6ad49bc4-6fc8-0cb9-2228-3da9fea3f0dc@csgroup.eu>
 <87r1prxd9e.fsf@mpe.ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <37d7fe94-696f-fc59-2756-7ea89525d4ae@linux.ibm.com>
Date: Tue, 27 Oct 2020 08:01:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87r1prxd9e.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_20:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=711 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270010
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/22/20 6:55 AM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 21/10/2020 à 10:53, Madhavan Srinivasan a écrit :
>>> In power10 DD1, there is an issue where the
>>> Sampled Instruction Address Register (SIAR)
>>> not latching to the sampled address during
>>> random sampling. This results in value of 0s
>>> in the SIAR. Patch adds a check to use regs->nip
>>> when SIAR is zero.
>> Why not use regs->nip at all time in that case, and not read SPRN_SIAR at all ?
> Yeah that's a reasonable question.
>
> I can't really find anywhere in the ISA that explains it.
>
> I believe the main (or only?) reason is that interrupts might be
> disabled when the PMU samples the instruction. So in that case the SIAR
> will point at an instruction somewhere in interrupts-off code, whereas
> the NIP will point to the location where we re-enabled interrupts and
> took the PMU interrupt.

sorry for the delayed response, was out.

thats correct and also we see SIAR zeroing only for some of
the events. We still want to use the SIAR address for
the sample creation and use nip only if it  zero.

Maddy


>
> cheers
