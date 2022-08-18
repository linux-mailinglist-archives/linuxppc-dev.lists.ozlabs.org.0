Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD6C598196
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 12:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7hRm2mSMz3drQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 20:47:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aNjepu+Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aNjepu+Q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7hQz2HLBz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 20:47:06 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IAeNHk018974;
	Thu, 18 Aug 2022 10:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=6A6aTCMp7D4cmQcxzVK5B0Tgk1o4eQLyKzzRt1Ei1D8=;
 b=aNjepu+QJt70jAINZ2vYWHA5ImlmG9lfJRV+49wdt/bFlLTfb/1RPsCHZCEOkaoq6Ztg
 32oaFvfHRNI8Fcxc276smJvhx6W88Ne95ANxSllMwHx4KboW8vo1AwMdqRv7KxVDTRpk
 koQnp7HtM08352eXkGlSPTV91q2v0FZebeC5oY7LTpKHSyKWNr9k2NZ4bMnnMJnMcf7P
 RTBLejkOIWenWVSKxgaAJmV6zkdAYbCsMsSAz9tdZM2maLl/zq/m7Z4r70q0HmQj4vJ2
 kc7x8exBaJxuVF10LFKQX5nZRa2HQ0ptTiIWfKCxLTnIcRWYfkw4OLM/q9uJtkYy80TB sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1kkr0j0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:39 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27IAh3ix031886;
	Thu, 18 Aug 2022 10:46:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1kkr0hy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IAbEG5022884;
	Thu, 18 Aug 2022 10:46:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8wr1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 10:46:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IAkYpo36897042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 10:46:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E4EAA4051;
	Thu, 18 Aug 2022 10:46:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31FF8A404D;
	Thu, 18 Aug 2022 10:46:34 +0000 (GMT)
Received: from localhost (unknown [9.43.73.112])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 10:46:34 +0000 (GMT)
Date: Thu, 18 Aug 2022 16:16:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 01/16] powerpc: Replace unreachable() with it's builtin
 variant in WARN_ON()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20220808114908.240813-1-sv@linux.ibm.com>
	<20220808114908.240813-2-sv@linux.ibm.com>
	<82eec792-b71f-17cc-d905-368fd5ca62f2@csgroup.eu>
In-Reply-To: <82eec792-b71f-17cc-d905-368fd5ca62f2@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1660817468.4x4re2ul0k.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pSUNmMYB0aU1d43EEUgjWiXA_doZGrCD
X-Proofpoint-ORIG-GUID: bkaD2RFH1edI5RbUM9CkUCLOn9hGqb8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208180036
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 08/08/2022 =C3=A0 13:48, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>> objtool is throwing *unannotated intra-function call*
>> warnings with a few instructions that are marked
>> unreachable. Replace unreachable() with __builtin_unreachable()
>> to fix these warnings, as the codegen remains same
>> with unreachable() and __builtin_unreachable().
>=20
> I think it is necessary to explain why using unreachable() is not=20
> necessary for powerpc, or even why using unreachable() is wrong.
>=20
> Allthough we are getting rid of the problem here by replacing=20
> unreachable() by __builtin_unreachable(), it might still be a problem in=20
> core parts of kernel which still use unreachable.

I did a kernel build with this series applied, with a variant of=20
ppc64le_defconfig. I then did another build with the same config, but=20
with the below hunk to disable objtool:

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6be2e68fa9eb64..4c466acdc70d4c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -237,8 +237,6 @@ config PPC
        select HAVE_MOD_ARCH_SPECIFIC
        select HAVE_NMI                         if PERF_EVENTS || (PPC64 &&=
 PPC_BOOK3S)
        select HAVE_OPTPROBES
-       select HAVE_OBJTOOL                     if PPC32 || MPROFILE_KERNEL
-       select HAVE_OBJTOOL_MCOUNT              if HAVE_OBJTOOL
        select HAVE_PERF_EVENTS
        select HAVE_PERF_EVENTS_NMI             if PPC64
        select HAVE_PERF_REGS

This has the effect of disabling annotations for unreachable().

When I compared the resulting object files, I did not see changes in=20
codegen relating to the annotation, like we do with using unreachable()=20
in __WARN_FLAGS().

More specifically, arch/powerpc/kvm/book3s.o:kvmppc_h_logical_ci_load()=20
uses BUG(), and the generated code remains the same with/without the=20
unreachable() annotation.

This suggests that the bad codegen we are seeing with the annotation in=20
unreachable() is limited to its use in __WARN_FLAGS(), which I suspect=20
is due to an interaction with the use of asm_volatile_goto() for=20
WARN_ENTRY().

If I revert this patch (patch 01/16), gcc seems to add a label 8 bytes=20
before _some_ function in this object file, which happens to hold a=20
relocation against .TOC., and emits a bl to that symbol. Otherwise, gcc=20
either emits no new instruction for the annotation, or a 'nop' in some=20
cases.

If I add a 'nop' between WARN_ENTRY() and unreachable() in=20
__WARN_FLAGS(), or convert WARN_ENTRY to BUG_ENTRY thereby removing use=20
of asm_volatile_goto(), the problem goes away and no bl is emitted:

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.=
h
index 61a4736355c244..88e0027c20ba5c 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -99,6 +99,7 @@
        __label__ __label_warn_on;                              \
                                                                \
        WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_=
on); \
+       __asm__ __volatile__("nop");                            \
        unreachable();                                          \
                                                                \
 __label_warn_on:


In summary, I think the annotation itself is fine and we are only seeing=20
an issue with its usage after WARN_ENTRY() due to use of=20
asm_volatile_goto. Other uses of unreachable() don't seem to exhibit=20
this problem.

As such, I think this patch is appropriate for this series, though I=20
think we should capture some of this information in the changelog.

Note also that if and when we start utlizing the annotation, if we=20
classify twui as INSN_BUG, this change will continue to be appropriate.


- Naveen

