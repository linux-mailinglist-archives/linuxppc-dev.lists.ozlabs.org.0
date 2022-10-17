Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3760067D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 07:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrR9C4f84z3c9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 16:57:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=peZjcmpi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=peZjcmpi;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrR8C4FFBz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 16:56:42 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H5RhEn024994;
	Mon, 17 Oct 2022 05:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ooBJ5W8dMAHI57aYfddiBQu+jexZ0rpXrHKf/oHbut0=;
 b=peZjcmpiwZpmZ4f/jBKmL3Ov0PeHb494MWhWS2uHjoF34DZKEPZB/AJ5qg1xN52+dEtn
 VOVc565EZ8MVWdB1Wqo04hJv9XyEkY5iOCL6g/oik8zmbsEmbtEhYBvKd2/dKM0ieccv
 DMRUfX/83czAdRAfF8SZuNSY+tCWEllq1Pp8nyhbBfK3ZYDx5uyOpKei+9NqZZ0z9sLu
 x/q6rpoZqDeVLzCXznfNFcvipYSr/g3S63Czr2PW7GHfN08Ku2m9qejUVFamzJXMClu4
 OfunAYWkSa+Pdu3MKWMrrUTa3c3PWO96S5uskHKHTt8VS6v62A0Z4fULy9Mb/Vsyuyio tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk4wk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 05:56:35 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H5Uehc017844;
	Mon, 17 Oct 2022 05:56:34 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk4wjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 05:56:34 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H5pZ17004636;
	Mon, 17 Oct 2022 05:56:32 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3k7m4j9uay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 05:56:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29H5uTah53084486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Oct 2022 05:56:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89A005204E;
	Mon, 17 Oct 2022 05:56:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.28.200])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 2C8A352051;
	Mon, 17 Oct 2022 05:56:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 0/2] Remove unused macros from asm-offset
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
Date: Mon, 17 Oct 2022 11:26:25 +0530
Message-Id: <C43E1C33-D8D9-405B-A278-1F96A072B92E@linux.vnet.ibm.com>
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
To: Disha Goel <disgoel@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HcG2HYmekFa07L_PvYYEHM8RxK8b9Nlx
X-Proofpoint-ORIG-GUID: MtqpWSldv5Sbh6tQFxVG1ACm2C-RLCLV
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_03,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170033
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Kajol Jain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16-Sep-2022, at 4:27 PM, Disha Goel <disgoel@linux.vnet.ibm.com> wrote:
>=20
> The kvm code was refactored to convert some of kvm assembly routines to C.
> This includes commits which moved code path for the kvm guest entry/exit
> for p7/8 from aseembly to C. As part of the code changes, usage of some of
> the macros were removed. But definitions still exist in the assembly file=
s.
> Commits are listed below:
>=20
> Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch worka=
round by disabling MMU")
> Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support fro=
m P7/8 path")
> Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 suppo=
rt from P7/8 path")
> Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore =
in C")
>=20
> Many of the asm-offset macro definitions were missed to remove. This patc=
hset
> fixes by removing the unused macro definitions.
>=20

For the patchset,

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> Patch1 removes a set of unused kvm vcpu and hstate macros from the
> asm-offset.c
>=20
> Patch2 removes unused host_mmcr references for MMCR3/SIER2/SIER3
>=20
> Changelog:
> v1 -> v2:
> Merge all the macro removal part from asm-offset.c file into a single pat=
ch
> as suggested by Christophe Leroy.
>=20
> Link to patchset v1:
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220913074025.132=
160-2-disgoel@linux.vnet.ibm.com/
>=20
> Link to the script used to get unused macro:
> https://github.com/maddy-kerneldev/scripts/blob/master/check_asm-offset.sh
>=20
> Link to linux-ci job result:
> https://github.com/disgoel/linux-ci/actions?query=3Dbranch%3Akvmmacro.v2
>=20
> Disha Goel (1):
>  powerpc/kvm: Remove unused macros from asm-offset
>=20
> Kajol Jain (1):
>  powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
>=20
> arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
> arch/powerpc/kernel/asm-offsets.c         | 25 -----------------------
> 2 files changed, 1 insertion(+), 26 deletions(-)
>=20
> --=20
> 2.31.1
>=20

