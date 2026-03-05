Return-Path: <linuxppc-dev+bounces-17767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB1cIYMdqWlM2QAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 07:06:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9820B1E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 07:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRJvy0mfvz3c2k;
	Thu, 05 Mar 2026 17:06:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772690813;
	cv=none; b=SlhwziYsAoP+4Zeqc6NmcHNPqre6uiI1I6kNpWIWMMrWHu//F8Y5PqMTDVW4g0IOql4jr5iSBgwSgzdJw4pUELgxY7UQmi2cYSvDOmuk+8RmiLydIEUHtEPZgXT6QNHS/7+Gq43hH7slqo0Hq0EbzU5cUbZsAtM71WxhIBqxdnqqgv3hscQiggczWs3EIVQ78lGupreIyjVmrPX3pA8ho0V0F3M/6EsS+whRqw8DBuuq8aN1gJN5fnvI7vY9HljAXnzRmluntpUhljhUaVCEXwxLfq4oAAvGCDpTIMItd/OYeOJusPVTY9+K1O/6kFd6/b1pNcC/oiU4U/CJxNW2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772690813; c=relaxed/relaxed;
	bh=fRaWHhsPQMTu801NDYNbwqnuvViinAHR6Ad/5+qmXYo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mXTZmXxsNR+Uh1rUqdpJxb7RB5UM0x3efTtD8rKGnoNlqCN7XPKG9oyzTC2RB86gOKetHQ36Qy/eis6AluSS6A3ztV9C8lNv2GaXYmipHzQ0uo1fW6qlS1Y7id245F789kuFiVUn8sNcu6hhJNvradzYIQS1ndV+WzSaY3DlEqRNTkRceqcZLvaisH5UD5VvLB6msd8h9T+Q5UCpSPtAJScoPGHkfC02gsmNBminvwe2aCVujGfExiMJVHIz4WeDEg0OOqLxF+B4Z4ctI5OVN/+2SMrMo35BilgRYeAEjN6yoEQdQL/Au6tSFrtAoqBHTUFCSDrDQlFZxoHstnltag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBKhcbEt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBKhcbEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRJvw5Hn3z3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 17:06:51 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KoFfT1884906;
	Thu, 5 Mar 2026 06:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fRaWHh
	sPQMTu801NDYNbwqnuvViinAHR6Ad/5+qmXYo=; b=fBKhcbEt2BpwhCblADzUjZ
	p//lLdfMokVUZvgMOZPyZtGyT5SxqZznhrxVOtumvRSCVdMEbk/A3k/MOxoSRnPr
	OzurQ/vflAoUjKubqVKhjZ/WYDk7zSHx2inS0JBHF1hr5kJWS9hSy6MVFaVWFPGv
	KH5+whdoVJzw+vfNIGPDdTWCQcbMGMySafRKzbjvG9IDMPDqSzSJDW6OuMJceffb
	kMtEfDuFxmID+bVIDqTjCqCD6aFDF0AXh8vVRiPmgN9KPh8fBDe2eZ3GE/mCGYV5
	n/3hYlYHDrE3qNKvWYeMnSpG2LlWKlyrhwDq6cs3p6O6bNUJFR4F2WFUhRosRBFQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskd2cvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 06:06:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6251xAOi027710;
	Thu, 5 Mar 2026 06:06:05 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjhk73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 06:06:05 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 625664U456885720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2026 06:06:04 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07B1458059;
	Thu,  5 Mar 2026 06:06:04 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE2185805D;
	Thu,  5 Mar 2026 06:05:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.165])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Mar 2026 06:05:59 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] powerpc, perf: Check that current->mm is alive before
 getting user callchain
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20260227082502.1882395-1-vmalik@redhat.com>
Date: Thu, 5 Mar 2026 11:35:46 +0530
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Joe Perches <joe@perches.com>, Paul Mackerras <paulus@ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD2CF5B8-43C4-42B6-88C9-1D52286CA832@linux.ibm.com>
References: <20260227082502.1882395-1-vmalik@redhat.com>
To: Viktor Malik <vmalik@redhat.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sWXFxkk_5Vh6eK6l7zseO9ekx1R7C0SK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0MSBTYWx0ZWRfX12cTe7wgD2/B
 AVvunM2eoCe8gGigpUPEgQ30ydZiEBYkvHeOYl4crm5LgFqwVWWXgtXDtT9I0tVHUvstNDzCeu1
 9JCXZWomrg6GegDy8giKworL0R3dHPm6anEAPr9j8/shHFKMS9CqBwGNzikip4GiVKwkOb2It5+
 Tdwrgu3WVFB8jfRzj3uD2MoHGglUqASwR3uzZKtSLDwwDJRFN6Pz6+xTACJXxxF/qwiVgIuFpQq
 x99aH5gUVSwf8WsNESNKoCFl/2KswUEx9vkzsxjs9QqVcx/PVXa+OMu7O+kRES9lxCmf2ffF8i2
 epAAoNCFjzYQ3mZXBotrYH3NUuIizoB5CWozkMea6GiEUSwpgoPaZHg/DPBwbT2rlDwxQVaKFJv
 FuUkk3xrJtOnL+vW/qUWyk9kLhiChOJlAjjPjOLZE6IUyk6GbphmHBVxpgWr/lAoCtxzJJMSNyh
 s/iiEa95a8XjJ+DNysg==
X-Authority-Analysis: v=2.4 cv=H7DWAuYi c=1 sm=1 tr=0 ts=69a91d4e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=IR7ToW8eRpEKds_zBhIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: chi_52EH7bETP7h6aLGRD6ob0kFnAAJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: ACD9820B1E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17767-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



> On 27 Feb 2026, at 1:55=E2=80=AFPM, Viktor Malik <vmalik@redhat.com> =
wrote:
>=20
> It may happen that mm is already released, which leads to kernel =
panic.
> This adds the NULL check for current->mm, similarly to 20afc60f892d
> ("x86, perf: Check that current->mm is alive before getting user
> callchain").
>=20
> I was getting this panic when running a profiling BPF program
> (profile.py from bcc-tools):
>=20
>    [26215.051935] Kernel attempted to read user page (588) - exploit =
attempt? (uid: 0)
>    [26215.051950] BUG: Kernel NULL pointer dereference on read at =
0x00000588
>    [26215.051952] Faulting instruction address: 0xc00000000020fac0
>    [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
>    [...]
>    [26215.052049] Call Trace:
>    [26215.052050] [c000000061da6d30] [c00000000020fc10] =
perf_callchain_user_64+0x2d0/0x490 (unreliable)
>    [26215.052054] [c000000061da6dc0] [c00000000020f92c] =
perf_callchain_user+0x1c/0x30
>    [26215.052057] [c000000061da6de0] [c0000000005ab2a0] =
get_perf_callchain+0x100/0x360
>    [26215.052063] [c000000061da6e70] [c000000000573bc8] =
bpf_get_stackid+0x88/0xf0
>    [26215.052067] [c000000061da6ea0] [c008000000042258] =
bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
>    [...]
>=20
> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
> Signed-off-by: Viktor Malik <vmalik@redhat.com>
> ---

This issue was reported [1] sometime last year on the linux-next repo. =
And even Shrikanth, has also reported this, and with more accurate repro =
steps[2].

[1]: =
https://lore.kernel.org/all/49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm=
.com/

[2]: =
https://lore.kernel.org/all/2a71b853-f461-4327-8d44-ef97564b2b91@linux.ibm=
.com/

If it makes sense, add below tag.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=20

> arch/powerpc/perf/callchain_32.c | 3 +++
> arch/powerpc/perf/callchain_64.c | 3 +++
> 2 files changed, 6 insertions(+)
>=20
> diff --git a/arch/powerpc/perf/callchain_32.c =
b/arch/powerpc/perf/callchain_32.c
> index ddcc2d8aa64a..b46e21679566 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct =
perf_callchain_entry_ctx *entry,
> sp =3D regs->gpr[1];
> perf_callchain_store(entry, next_ip);
>=20
> + if (!current->mm)
> + return;
> +
> while (entry->nr < entry->max_stack) {
> fp =3D (unsigned int __user *) (unsigned long) sp;
> if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
> diff --git a/arch/powerpc/perf/callchain_64.c =
b/arch/powerpc/perf/callchain_64.c
> index 115d1c105e8a..eaaadd6fa81b 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct =
perf_callchain_entry_ctx *entry,
> sp =3D regs->gpr[1];
> perf_callchain_store(entry, next_ip);
>=20
> + if (!current->mm)
> + return;
> +
> while (entry->nr < entry->max_stack) {
> fp =3D (unsigned long __user *) sp;
> if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
> --=20
> 2.53.0
>=20


