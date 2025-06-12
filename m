Return-Path: <linuxppc-dev+bounces-9311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EABAD70FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 15:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ2j92kPKz2xQ6;
	Thu, 12 Jun 2025 23:01:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749733293;
	cv=none; b=ObPAYaRUjvGQmA7vtzkDzowQTxCcKHj5UIXQG0UDMBzrEtlYwjH7i675Ux28Qr7CiPe4AvtUm4HqgIX+VU9eJ7HOall/Z3S8itOSGT8TkHnZUTYStAwGVULa3zuoVli4aLv8yKf5XRWKu+TTTdgF+mWVMdm4o5c2zt58vzr8LzFgJlxzE7uoHbFdaS5Sq6RDrayjJJvU2sS6cMkixMtX64sgioIFHmEIOY35arDjYqwhmyagezaWlKyj6wx9c8q+SWyulqoYZxj+FIc2HLlV4BW+HPzhDUHp25i8AfNwVdVRjaKI0xm7tg5E1j5/oN7jJWnZ7WvPWHkO9Xx6Ayr8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749733293; c=relaxed/relaxed;
	bh=6kvV32jeGcOFC1/K663LYJkox5bqwulg4lWXbgRBwYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmpCNYkf1li85Nmmdyq1qGAexGCZhzKH47eDDmm4B0iiU7Xa8zeUctntZB9ivJ9526IzlRVL+6fbt7wembbr7YCFHk4zx+/PzwtzRB9tyy4Jdhpe1RiiPpYmZG7ngxO+3KqKd5BE2TvzxMZ+FoBB0pLWyJl0C1LMoz4JPl2/kokFBDHNtE1ilxQ6ULM+eElQZqSuOhlYUc3kt8o3MaZ+HOhi9j0mPoCozJdw0awzeckSGEgJ+grYdMqWmXMafNEx3MmMchH0xRPOA/9N7Ta3fcfH0DSRl27rmpUU7agna3myjGRav9ggOMm7Q1lgS7ZblxzM88+YVCWFeXGfvK/aMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6M6obzM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=frankja@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6M6obzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=frankja@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ2j81zFbz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 23:01:31 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCldQP024614;
	Thu, 12 Jun 2025 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6kvV32
	jeGcOFC1/K663LYJkox5bqwulg4lWXbgRBwYE=; b=I6M6obzMpSbw9Hg/SZzriA
	Pa1DkjB29N0dDimanthQaSp4vM8SfxmDIXfvGUg6rZ8+rwYb1p7MLBbkR8mVhq+U
	eQUuoH8SS35TuUe5bTPltD5+sp7B2U0HiVPvIqoxUk7qSu95ndWj0m//+oLIdCtC
	LilhhmQSG2Qj/sk1ovkg4QvP10D8JaaaBRXmy/UlfdvR3XNfDWHX0OMZvwDnsRwB
	h1imRCV8CylKuRFUTR+k1Ad21p9E7cgbg17/K8uegCJSVKzTN5OZDP1uLLgSmR0w
	bsQlTuJIxY1/vkZwg/u2ry+LC8zgZqIa3LgIisqaRsC5EbTG7lvqC2XuEyykSyfg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hgusx6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 13:01:16 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CCnZuG022048;
	Thu, 12 Jun 2025 13:01:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hgusx6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 13:01:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CBBpTb003405;
	Thu, 12 Jun 2025 13:01:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykvmp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 13:01:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CD19nN56557988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:01:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8FC52004B;
	Thu, 12 Jun 2025 13:01:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EA852004D;
	Thu, 12 Jun 2025 13:01:08 +0000 (GMT)
Received: from [9.111.70.146] (unknown [9.111.70.146])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Jun 2025 13:01:08 +0000 (GMT)
Message-ID: <d794e153-3442-45b0-9913-13967859ff7d@linux.ibm.com>
Date: Thu, 12 Jun 2025 15:01:08 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] KVM: s390: Stop adding virt/kvm to the arch include
 path
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Tianrui Zhao
 <zhaotianrui@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Anish Ghulati <aghulati@google.com>,
        Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>
References: <20250611001042.170501-1-seanjc@google.com>
 <20250611001042.170501-8-seanjc@google.com>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; keydata=
 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
In-Reply-To: <20250611001042.170501-8-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=684acf9c cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=IYcHeIosn_18Lrqvcr0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: W0OoJqjl7_byT2__YfNihLOh8aRbtciJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5OCBTYWx0ZWRfXzZckwv4wTjwp ymMuswKZh28I8KTlqqtyFbnMsXCmOfb1k3tzpZFOJuwTIKpiT9GwJg3X7vjrgcwBxUxJe9jHEkI UtszBG3fCGIwfxnSvCCBuJz4UEcfwlcXwZQW/lgjeqPSgYTW+sz/BJcMBeb16AlyWVe2lCvHG48
 zFxcxXbNqWMRypDV04OOunfCYK7sxtwdZEMu7zhA9o8T9fYOChMbTxPJY9BcS6cU7c1CuWPuW+0 pwiRnyhmrEAJOseREXD/nRGm2q23X+xiM53TZMQAKzbOgr9M/pziUtHXkwTNpjg7JdDeT1Era1J 2qNwhrzN7fAjLDU4BVf6Iq1zxGpRELpm8o3YVE8TI2/mi9BzaoW2dYuGBOlRBqhD+4T4gS8tZfL
 Ra4Fx8vqJzCd8jXk0d5b9BocIdtyEuKKNb6lLmhv/MRuCdMa1uG40wLWSU9MaUjRzhY1AEte
X-Proofpoint-ORIG-GUID: fiVy2icIIr2Ok6umQYBZ_TrWsGAeztby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1011 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 6/11/25 2:10 AM, Sean Christopherson wrote:
> Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
> intended to be used only by other code in virt/kvm, i.e. are "private" to
> the core KVM code.  It's not clear that s390 *ever* included a header from
> virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
> Makefile when s390 support was first added.
> 
> The only headers in virt/kvm at the time were the x86 specific ioapic.h,
> and iodev.h, neither of which shows up as an #include in the diff for the
> commit range 37817f2982d0f..e976a2b997fc4.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

