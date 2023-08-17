Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662B77F671
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:30:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLbh0EqS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPVk5yLDz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:30:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLbh0EqS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPTp4YmRz2yVC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:30:06 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RRPTp3zbCz4wy6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:30:06 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RRPTg6MXMz4wy5; Thu, 17 Aug 2023 22:29:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLbh0EqS;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RRPTg32d5z4wxR;
	Thu, 17 Aug 2023 22:29:59 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HCSH3T025387;
	Thu, 17 Aug 2023 12:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=4HzpTP7FNAMT9uAwevK5G07vm/QGlG2BcywlhBGJw0k=;
 b=kLbh0EqSZ3cxQ8J3HT6c4Ii69Yjo3mtmRNluD0vhG3ZRincOTTO2MgpDdcTl/62uFcFF
 6RdF68p56IRPV9nF1kEsHPbdebc6EGt/aX9a41LKTd2hwm0g/mVP4GbPUY0Lc3CS8ozy
 ZaBPMFNIZEB2ctUGM4JOjP5CBu+Lzyvf9jgKsUPfasqkHSlhy9QPDPbptLZyMbPIjNjR
 DNTHXLqR+TbPf9pb09Ryk38uBPeLdIiuuiaHDqYDfkTPJKk60kaysIoJRBF7BELyXZnS
 gipZnQWtdVmEazaGUh1OsFLrMacEJR86hSYVz0E22nMeSvf/z2twcmEhqvo3P3i+4fbo lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shkgn05wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 12:29:56 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37HCOM0o011665;
	Thu, 17 Aug 2023 12:29:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shkgn05wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 12:29:55 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37HAZDd2018869;
	Thu, 17 Aug 2023 12:29:54 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3seq41wdpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 12:29:54 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37HCTrBb3080734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Aug 2023 12:29:54 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB1B958068;
	Thu, 17 Aug 2023 12:29:53 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9671C58061;
	Thu, 17 Aug 2023 12:29:53 +0000 (GMT)
Received: from localhost (unknown [9.61.129.82])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Aug 2023 12:29:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, mahesh@linux.ibm.com
Subject: Re: [PATCH v8 1/2] powerpc/rtas: Rename rtas_error_rc to
 rtas_generic_errno
In-Reply-To: <87zg2q5fs9.fsf@mail.lhotse>
References: <169138864808.65607.6576358707894823512.stgit@jupiter>
 <877cpxdksx.fsf@mail.lhotse>
 <xzsx7qc3el674iyy2lsn3adm7j2vh5xj6cjaqxgjm6lwcjiz5u@evoqbrvhqf26>
 <87zg2q5fs9.fsf@mail.lhotse>
Date: Thu, 17 Aug 2023 07:29:53 -0500
Message-ID: <87o7j5zwam.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TeqLM47v-5tkhNdGU3T38VRBt8JITo02
X-Proofpoint-GUID: 1YuDwTWJIanuaxXs99mqFgTHlJm_V3fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_05,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=917 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308170109
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver
 O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
>> On 2023-08-15 13:52:14 Tue, Michael Ellerman wrote:
>>> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> ...
>>> > diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>>> > index 3abe15ac79db1..5572a0a2f6e18 100644
>>> > --- a/arch/powerpc/include/asm/rtas.h
>>> > +++ b/arch/powerpc/include/asm/rtas.h
>>> > @@ -202,7 +202,9 @@ typedef struct {
>>> >  #define RTAS_USER_REGION_SIZE (64 * 1024)
>>> >  
>>> >  /* RTAS return status codes */
>>> > -#define RTAS_BUSY		-2    /* RTAS Busy */
>>> > +#define RTAS_HARDWARE_ERROR	(-1)  /* Hardware Error */
>>> > +#define RTAS_BUSY		(-2)  /* RTAS Busy */
>>> 
>>> Are the brackets necessary?
>>
>> During v5 changset I received offline review comment to add brackets,
>> hence continued here as well. I can take it away if Nathan is fine with
>> it.
>
> OK. I can't think of a context where the brackets are useful, but I'm
> probably just not thinking hard enough. I don't really mind adding them,
> I was just curious what the justification for them was.

It was my (mistaken) suggestion -- they're not needed.
