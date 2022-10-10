Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF25F9FF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 16:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmLSb0Rwdz3dsF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 01:11:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c6TYWAx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c6TYWAx3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmLRZ14N0z3bjp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 01:10:49 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ADYTDN024581;
	Mon, 10 Oct 2022 14:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=kVVtL9sg5geUzXWpD0lphCXAA2C4tqRVjLqbQUC6IoA=;
 b=c6TYWAx3yPy3kVvONUh5oe0AlS1afBH5nQxwQMZVonq49/3UqbaGAZcHdNwXrUSW1XZX
 fsuoUcgph+ea4c+B7KBmkTs2mDRxdc+iJYW0IXdpLj5HLDuup62R52Zk6nUMVmYrTvJn
 0bxwGBNAfHpb/8cbgZFuaJiaWVExPA2z3jYYQVDy6rQSney2Ep1Sw/zCzRx+OIYwdH/a
 LB2dp6Svogtius4PHZcG6hfVuteXlD6D+ZKTg1A9pBK2tqEXRpHxMUzKbIQCT6MP4uoF
 eXi5/Jcgs9H2u8pIApnml3HXFrLYx+UAgRnuNk9mNRr+EqpIF6Cy50YYvG6TWx031Bsz OQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3ju7743r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 14:10:39 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29AE5rH0017672;
	Mon, 10 Oct 2022 14:10:39 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02dal.us.ibm.com with ESMTP id 3k30u9r1q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 14:10:39 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29AEAew166191700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 14:10:40 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C0158056;
	Mon, 10 Oct 2022 14:10:37 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C63E5803F;
	Mon, 10 Oct 2022 14:10:37 +0000 (GMT)
Received: from localhost (unknown [9.163.68.247])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 14:10:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
In-Reply-To: <87h70for01.fsf@mpe.ellerman.id.au>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
 <87h70for01.fsf@mpe.ellerman.id.au>
Date: Mon, 10 Oct 2022 09:10:37 -0500
Message-ID: <8735bvbwgy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X2AAXZAOir1-kLJTxJrXSE4ZcIOLtkkR
X-Proofpoint-ORIG-GUID: X2AAXZAOir1-kLJTxJrXSE4ZcIOLtkkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_08,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100084
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> + KASAN list
>>
>> Le 06/10/2022 =C3=A0 06:10, Michael Ellerman a =C3=A9crit=C2=A0:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> kasan is known to crash at boot on book3s_64 with non-radix MMU. As
>>>> noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
>>>> KASAN support"):
>>>>
>>>>    A kernel with CONFIG_KASAN=3Dy will crash during boot on a machine
>>>>    using HPT translation because not all the entry points to the
>>>>    generic KASAN code are protected with a call to kasan_arch_is_ready=
().
>>>=20
>>> I guess I thought there was some plan to fix that.
>>
>> I was thinking the same.
>>
>> Do we have a list of the said entry points to the generic code that are=
=20
>> lacking a call to kasan_arch_is_ready() ?
>>
>> Typically, the BUG dump below shows that kasan_byte_accessible() is=20
>> lacking the check. It should be straight forward to add=20
>> kasan_arch_is_ready() check to kasan_byte_accessible(), shouldn't it ?
>
> Yes :)
>
> And one other spot, but the patch below boots OK for me. I'll leave it
> running for a while just in case there's a path I've missed.

It works for me too, thanks (p8 pseries qemu).

This avoids the boot-time oops, but kasan remains unimplemented for hash
mmu. Raising the question: with the trivial crashes addressed, is the
current message ('KASAN not enabled as it requires radix!') sufficient
to notify developers (such as me, a week ago) who mean to use kasan on a
book3s platform, unaware that it's radix-only? Would a WARN or something
more prominent still be justified?

I guess people will figure it out as soon as they think to search the
kernel log for 'KASAN'...
