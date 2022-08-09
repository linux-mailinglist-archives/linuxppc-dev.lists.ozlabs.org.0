Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A558D3BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 08:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M234q32tyz30BP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 16:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LU9ZwpMv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LU9ZwpMv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M23431hs1z2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 16:26:10 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27960KRQ030598;
	Tue, 9 Aug 2022 06:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0tHR0dUovDdcOcO8mlXS6xxFDZ5pswykHYtMoZ4Vnfw=;
 b=LU9ZwpMvopkG/pUj2KhQmPuUoBpMhwT7mBcyyBU6J/BMLtqP55PpGG5t9nP6xQv1+8yN
 G1WKzA609EruqR8IE6vJaWmcYKymDV7LJpmDGoOdvrphVFwwbBWnLhDwdvsRPl83Gdx9
 jyZszBWDCdI4GWueN1r1D/uo+VFBz/9oqFVO/Jw6SNzlpIgFHMlax6Fgfys+js7K8mDJ
 3k09JA2uXNw0gKGbQz0w8gs+a8msSdQcYFwgtSiTRpNEhu0Om6Bg78+llnQg3FdT3JKp
 c9wmAY9QLLWqqkGZZVzlXtOk6J0uBsHVhWv/nKQG+Tr0GyZEkh1IgqxQlxWpYCqX17Es Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3huf275awa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:25:50 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2795WHag003055;
	Tue, 9 Aug 2022 06:25:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3huf275avd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:25:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2796K1O6023372;
	Tue, 9 Aug 2022 06:25:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3hsfx8u33r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:25:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2796PiJD33292760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Aug 2022 06:25:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1545A4054;
	Tue,  9 Aug 2022 06:25:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38A09A405C;
	Tue,  9 Aug 2022 06:25:44 +0000 (GMT)
Received: from localhost (unknown [9.43.41.164])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Aug 2022 06:25:44 +0000 (GMT)
Date: Tue, 09 Aug 2022 11:55:42 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Paul Mackerras
	<paulus@samba.org>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
	<96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
	<CAKwvOd=VBnx63Gj1vTH-8tR50Zd1r50x+NS8JRc4nXARaC2FcQ@mail.gmail.com>
In-Reply-To: 	<CAKwvOd=VBnx63Gj1vTH-8tR50Zd1r50x+NS8JRc4nXARaC2FcQ@mail.gmail.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1660026096.me2vg4spl7.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tDeZcGNCEjgVycAYsJJJ4_SQQs0YTm7S
X-Proofpoint-GUID: 5ZMZNTNRPJ_g1A2Q4T5F4uxokI98MwyY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=887
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090026
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
Cc: nathan@kernel.org, omosnacek@gmail.com, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers wrote:
> Christ...that's not what I meant to send; sorry, mutt is giving me
> bizarro errors today so I can't insert myself into threads using the
> usual incantation I have in the past.  What I meant to send was:
>=20
> Christophe,
> Ondrej reported a regression with ftrace when building w/ clang
> bisected to this commit. Can you PTAL?
> https://github.com/ClangBuiltLinux/linux/issues/1682

Thanks for the report. That was my doing - I tend to miss the fact that=20
clang doesn't support -mprofile-kernel. Can you check if the below patch=20
fixes it for you?

- Naveen

---
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index cb158c32b50b99..7b85c3b460a3c0 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -393,11 +393,11 @@ int ftrace_make_nop(struct module *mod,
  */
 static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-       if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))
+       if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
+       else
                return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) &&
                       ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
-       else
-               return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
 }
=20
 static int
@@ -412,7 +412,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lon=
g addr)
        if (copy_inst_from_kernel_nofault(op, ip))
                return -EFAULT;
=20
-       if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1) &&
+       if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
            copy_inst_from_kernel_nofault(op + 1, ip + 4))
                return -EFAULT;
=20


