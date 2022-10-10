Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2D5F9DF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmHKJ0Nrxz3ds8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXSOkUdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXSOkUdP;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmHJN2pr5z3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:49:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AB0fhJ025316;
	Mon, 10 Oct 2022 11:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vlit3mspGcQoltaUL4UUslQlY6RHR+R4ZqT6iqVkgvM=;
 b=gXSOkUdPOcBAKdk5JKbdjAPT4hbl8tqTT2o1urKT6RShnEhT3WFDAyKMCNQ8QSnZWBBu
 iibnQmk5RUF9XCtd2u8y+ph0u1VRYr4SST0FB032DUt5RQ+Cea9WQoDi1s8HngngZSyN
 V4zQv0uLyG1tAOAzElprXzLRwnQzk7C4AwsfkFnyp3/x/iphqf0wsdDnSWEeMyPnM45s
 MmH9WMpLMtJ+X8LuZnnHj2X3CFJODwhdv9C8AMSR5aRZFhrNbI/Sv0ALQq6KsjXAfzoW
 cZJb5ZMUQovhxfzrs5oITJgzfd0DIelgojBycRBf8m3qWu262GdfwM/Ve3wzclsOXwJr WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k0tasx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:49:10 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ABJKkt028413;
	Mon, 10 Oct 2022 11:49:09 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k0tasvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:49:09 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29ABdELx011911;
	Mon, 10 Oct 2022 11:49:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3k30u9a0e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:49:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29ABn45o66650580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 11:49:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28D5642042;
	Mon, 10 Oct 2022 11:49:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD57642041;
	Mon, 10 Oct 2022 11:49:03 +0000 (GMT)
Received: from localhost (unknown [9.43.23.98])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 11:49:03 +0000 (GMT)
Date: Mon, 10 Oct 2022 17:19:02 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 00/16] objtool: Enable and implement --mcount option on
 powerpc
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy <sv@linux.ibm.com>,
        jpoimboe@redhat.com
References: <20221002104240.1316480-1-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-1-sv@linux.ibm.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1665401892.qmrp2qjj9t.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6yW98v4FKCZoy1E5uTe0Z3Mne64MmS_O
X-Proofpoint-ORIG-GUID: 2WBNXd8FziDxka69AQh5-sT2jj99ugWY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_06,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=626
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210100069
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, npiggin@gmail.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
> This patchset enables and implements objtool --mcount
> option on powerpc. This applies atop powerpc/merge branch.
>=20
> Changelog:
>=20
> ----
> v4:
>=20
> * Patch 11/16 - Introduce a new config option
> 		CONFIG_HAVE_OBJTOOL_NOP_MCOUNT as a means for
> 		architectures to enable nop'ing ftrace locations.
>=20
> 	      - Remove Acked-by tag from Peter Zijlstra (Intel),
> 		and Reviewed-by tag from Christophe Leroy.=20
> 		[This is done because I reworked the patch to add
> 		a new config option to objtool. Please let me know
> 		if you want me to retain the tags. Thanks!]
>=20
> * Patch 16/16 - Rework the patch to handle only 'bl' instruction
> 		decoding.=20

With changes to the two patches in this series that I have described,=20
and with my patch to have ftrace ignore weak symbols (*) applied, I=20
built a ppc64le config.

(*) http://lkml.kernel.org/r/20220809105425.424045-1-naveen.n.rao@linux.vne=
t.ibm.com

I then used the below diff to disable objtool and to build with=20
recordmcount:

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7e28a8fd4c24fa..81c9f895d69012 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -238,8 +238,6 @@ config PPC
        select HAVE_MOD_ARCH_SPECIFIC
        select HAVE_NMI                         if PERF_EVENTS || (PPC64 &&=
 PPC_BOOK3S)
        select HAVE_OPTPROBES
-       select HAVE_OBJTOOL                     if PPC32 || MPROFILE_KERNEL
-       select HAVE_OBJTOOL_MCOUNT              if HAVE_OBJTOOL
        select HAVE_PERF_EVENTS
        select HAVE_PERF_EVENTS_NMI             if PPC64
        select HAVE_PERF_REGS

Comparing available_filter_functions across the two builds showed the=20
below differences:
  $ diff ftrace_funcs_recordmcount_20221010.sort.out ftrace_funcs_objtool_2=
0221010.sort.out=20
  6799d6798
  < __dev_alloc_name
  6800a6800
  > dev_alloc_name_ns
  11680d11679
  < find_zone.isra.0
  22396a22396
  > ns_capable_common.part.0

All the above changes are down to compiler optimizations and shuffling=20
due to CONFIG_OBJTOOL being enabled and changing annotate_unreachable().

As such, for this series:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


Josh,
Are you ok if this series is taken in through the powerpc tree?


- Naveen
