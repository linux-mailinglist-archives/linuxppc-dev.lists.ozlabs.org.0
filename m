Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859306099AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 07:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwjyn2dkrz3cC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 16:18:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ceYlKdLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ceYlKdLo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwjxn6b78z2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 16:17:33 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29O485nd001486;
	Mon, 24 Oct 2022 05:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V67z7SGiVhJbkDGJtlj76kx1jLM77jC0oONGJegvl6s=;
 b=ceYlKdLoF0ehO4plpF0P/pdrwICjO3yiPAR8bYCXFuNUyEQTQFd/ZYDDOlZ6CKrBjGaf
 iufbcGJG2b15uMsMTW8Yqf+k4Ys+tb0TYJvC8QCoPnYf1zk9zd38+kgtDiAgEDNoKbui
 k/+UiJtRMf5vnwVfpJ1ClJ+81OGkeXHk2wAo/M9wmjf4qdAW3R1kRnbG9V/n+COANQg+
 eHL6jYPynI0Y8hLGFXrhnwTdbTzl7UiO5jLY07um355hNC2mhK0csH82dZ42TATUbUQW
 t8tFMAfPS9ErAbJ7IyIU0ZJnAmpxmnzmXSyd58jEDqU6oAl2JCNKoMRxPILC9mkkmKEz vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kctghp8d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:17:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29O5GkWT021338;
	Mon, 24 Oct 2022 05:17:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kctghp8ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:17:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29O55elQ008058;
	Mon, 24 Oct 2022 05:17:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3kc859j1f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:17:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29O5HIRi2228836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Oct 2022 05:17:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E47852050;
	Mon, 24 Oct 2022 05:17:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F34595204E;
	Mon, 24 Oct 2022 05:17:17 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 29EB560648;
	Mon, 24 Oct 2022 16:17:11 +1100 (AEDT)
Message-ID: <dd9844b8444e22257b4cdb1fce5877f0086bd63b.camel@linux.ibm.com>
Subject: Re: [PATCH v8 5/6] powerpc/code-patching: Use temporary mm for
 Radix MMU
From: Benjamin Gray <bgray@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 16:17:10 +1100
In-Reply-To: <21abdd4a7ee1cacc4847ab7424f45117f0d147ee.camel@russell.cc>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-6-bgray@linux.ibm.com>
	 <21abdd4a7ee1cacc4847ab7424f45117f0d147ee.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SX0X5n2Qj_d8PMcXPhyNrTLXM0j3RTMq
X-Proofpoint-GUID: INRy58KygdxD8y-ealQSAkXy9NZEXKF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240032
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
Cc: jniethe5@gmail.com, npiggin@gmail.com, cmr@bluescreens.de, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-24 at 14:45 +1100, Russell Currey wrote:
> On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> > From: "Christopher M. Riedl" <cmr@bluescreens.de>
> >=20
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for
> > situations
> > where a CPU needs to perform sensitive operations (such as patching
> > a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without
> > exposing
> > said mappings to other CPUs. Another benefit is that other CPU TLBs
> > do
> > not need to be flushed when the temporary mm is torn down.
> >=20
> > Mappings in the temporary mm can be set in the userspace portion of
> > the
> > address-space.
> >=20
> > Interrupts must be disabled while the temporary mm is in use. HW
> > breakpoints, which may have been set by userspace as watchpoints on
> > addresses now within the temporary mm, are saved and disabled when
> > loading the temporary mm. The HW breakpoints are restored when
> > unloading
> > the temporary mm. All HW breakpoints are indiscriminately disabled
> > while
> > the temporary mm is in use - this may include breakpoints set by
> > perf.
> >=20
> > Use the `poking_init` init hook to prepare a temporary mm and
> > patching
> > address. Initialize the temporary mm by copying the init mm. Choose
> > a
> > randomized patching address inside the temporary mm userspace
> > address
> > space. The patching address is randomized between PAGE_SIZE and
> > DEFAULT_MAP_WINDOW-PAGE_SIZE.
> >=20
> > Bits of entropy with 64K page size on BOOK3S_64:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bits of entropy =3D log=
2(DEFAULT_MAP_WINDOW_USER64 /
> > PAGE_SIZE)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PAGE_SIZE=3D64K, DEFAUL=
T_MAP_WINDOW_USER64=3D128TB
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bits of entropy =3D log=
2(128TB / 64K)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bits of entropy =3D 31
> >=20
> > The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash
> > MMU
> > operates - by default the space above DEFAULT_MAP_WINDOW is not
> > available. Currently the Hash MMU does not use a temporary mm so
> > technically this upper limit isn't necessary; however, a larger
> > randomization range does not further "harden" this overall approach
> > and
> > future work may introduce patching with a temporary mm on Hash as
> > well.
> >=20
> > Randomization occurs only once during initialization for each CPU
> > as
> > it
> > comes online.
> >=20
> > The patching page is mapped with PAGE_KERNEL to set EAA[0] for the
> > PTE
> > which ignores the AMR (so no need to unlock/lock KUAP) according to
> > PowerISA v3.0b Figure 35 on Radix.
> >=20
> > Based on x86 implementation:
> >=20
> > commit 4fc19708b165
> > ("x86/alternatives: Initialize temporary mm for patching")
> >=20
> > and:
> >=20
> > commit b3fd8e83ada0
> > ("x86/alternatives: Use temporary mm for text poking")
> >=20
> > ---
>=20
> Is the section following the --- your addendum to Chris' patch?=C2=A0 Tha=
t
> cuts it off from git, including your signoff.=C2=A0 It'd be better to hav=
e
> it together as one commit message and note the bits you contributed
> below the --- after your signoff.
>=20
> Commits where you're modifying someone else's previous work should
> include their signoff above yours, as well.

Addendum to his wording, to break it off from the "From..." section
(which is me splicing together his comments from previous patches with
some minor changes to account for the patch changes). I found out
earlier today that Git will treat it as a comment :(

I'll add the signed off by back, I wasn't sure whether to leave it
there after making changes (same in patch 2).
=C2=A0
> > +static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 *patch_addr;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long text_poke_addr=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pte_t *pte;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long pfn =3D get_pa=
tch_pfn(addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mm_struct *patching_m=
m;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct temp_mm_state prev;
>=20
> Reverse christmas tree?=C2=A0 If we care

Currently it's mirroring the __do_patch_instruction declarations, with
extra ones at the bottom.
