Return-Path: <linuxppc-dev+bounces-17372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL3UIKRcoWmDsQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:58:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 824111B4CB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMj0H3QK3z2yFQ;
	Fri, 27 Feb 2026 19:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772182687;
	cv=none; b=K4pJ04VL40W00SpmC7KO+lpE9AsaMhOZgmq3QdpdXsjT04j1PoLwSRrzC9GVxCU+33RGsMaRQQKKQkZNPOd2ioV6X70tvTnhOXcHKTIu8Kc/+NgB5kb+9QldQ0SLY88YQh0GS6Xxs7m1HFFv4AEBwUN2VMIXEh1t2DT7w23rdxf9lvBPSS82rRjUctcapFIPkThn0wOsIpEIMp+DepXws3sKOkAsLsVnfNlaHPsd5Xddt8Fe/aHBcSyFHjrd+moyB0Rl/0k3OXZ/U9PF7LLu6hT3GpQniTMl/uM/kPM94xm60ogoAOAfuCx89BPY3AnfdTlfe+QUZdZm3E1CurSt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772182687; c=relaxed/relaxed;
	bh=ohADthLDD9z3XUImOUnNifIKCKACdymEuIsWp6yNCC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JRT9pBEE5TtNGMylbHDMJmdFNdJ3baj5OYcE2mxqYHa4jpokbTpZ6xZrjVKuCnkdYN2eMlWNWNO8Nhdx5MX6Xk1tpgR+KBNIDYmgW4Qjk5oyFbutLTPclXIy1FGTHasxGH03W5MIamwHka55sWDQw/7puF4qNaC+HqnRd3yhpdBS2avm+2Dw2IMxUoJM6Y8zZQSqW5v3O4FF27Py3pEs+0WDeBIDWyKl7rdULWek7QM1/VU05VLnSbOWP7VOnZehuXPFN3U1QN6pUVT0E6iwuW0Fp6czuu7dQIHB9Zym5B4mM4CWpEps6vK0NY5twfrxW0yurKsPvCSDt6RN67QtaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZDfxp3p; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZDfxp3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMj0G45jCz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:58:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QNfeDg3178876;
	Fri, 27 Feb 2026 08:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ohADth
	LDD9z3XUImOUnNifIKCKACdymEuIsWp6yNCC8=; b=sZDfxp3pYtANr1JiWIkADr
	lfCfeth2VR2Y2XN+68ftwKl05od9arHJ/ZN3j4BjHGVaXiJSqhqqiTjt3lRe3/Tb
	NspqofphmW0zV3wzay8doVQJVU5+11+mJNZq13UTw4NcF3FoH9gDBx/1VRqKqEk6
	TdjBn1hmyUWPKSAZRmFAIMLYQI33iq0PT4s+h1C3a69Q/ka6JaNfaNWDxoiDnK88
	BWtJ0hyTd5HehP0BaTBtyhpyZEWrTdIkrk1CGRtS9TXHd4A7UZ7shYy6EnhTyqJJ
	RTOLUPNYlt/XLrTk38tmOy9Z2lHHDeHD95ij6tpl7IM0aA+Uy0d4Ld/cgXzdRuYg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34cjtjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 08:57:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R6ldH4014012;
	Fri, 27 Feb 2026 08:57:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdyhan3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 08:57:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R8vJo814090732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 08:57:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D71652004B;
	Fri, 27 Feb 2026 08:57:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49CE620040;
	Fri, 27 Feb 2026 08:57:16 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.69.15])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 27 Feb 2026 08:57:16 +0000 (GMT)
Date: Fri, 27 Feb 2026 09:57:14 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
        vbabka@suse.cz, jannh@google.com, rppt@kernel.org, mhocko@suse.com,
        pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
        npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
        borntraeger@linux.ibm.com, frankja@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm: use vma_start_write_killable() in
 process_vma_walk_lock()
Message-ID: <20260227095714.5e69a0a8@p-imbrenda>
In-Reply-To: <CAJuCfpEk_VPqwpqtAiCJSR5bkvHuzvC8ooXrB4jKTYnQB2D4YA@mail.gmail.com>
References: <20260226070609.3072570-1-surenb@google.com>
	<20260226070609.3072570-4-surenb@google.com>
	<20260226191007.409a7a21@p-imbrenda>
	<CAJuCfpEk_VPqwpqtAiCJSR5bkvHuzvC8ooXrB4jKTYnQB2D4YA@mail.gmail.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3MyBTYWx0ZWRfX9WncEKIsvtkE
 93BCkSDioR3viSI4k8M8ER0no2D2zADEGoLWX0KPQp0RA8BsPJbCrfq2KNwhRaeVWK9DAn3UOd6
 JAAx02zp+y9sAZSn4DLDrb3m80HWoUwQ3XZbkAc/WY4whBIPdkpq5++S1OS1U/BZL1YM5xtJRtL
 asZKx6fRd45Z4dwVYGheVX0JssABTlQnZcPMUUlLPHlLa2PGtc+gWSwVlWd/LbyzyJTu5/eCRQv
 ZD0ydFAWHEbM9dSGMVwbFmFBk6I11/cjfskqj1vi3sWYi9ExPCWFV8MocD36VLDGxyr7Hgvw95a
 oNSV4Q1Wk5+LBR+205t5wPH9duGWR6eo7a84XSUaM2JtRffZshKV0ovn8RzJA32bUOqSp/TehRx
 vmDqLHCgdsnyiO0l67/DgUsWIDjh+fag6Xuw/2WaA0DTHK1m/3W1tSm4sGSr6C6KPXPZdDprF1U
 j1k9+KMGXV8XsaOEoIg==
X-Proofpoint-ORIG-GUID: ajegLXIpD6Zt7S3-2yKIDNzKpDYqMOPu
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=69a15c75 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=VnNF1IyMAAAA:8 a=Ch0MJLqadWv443iAyyUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: co2lSwi4qVEs7Dzgf2PvZ6JwEnc7YSIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602270073
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17372-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuahahnjy
 @gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[imbrenda@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imbrenda@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 824111B4CB1
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 10:24:49 -0800
Suren Baghdasaryan <surenb@google.com> wrote:

> On Thu, Feb 26, 2026 at 10:10=E2=80=AFAM Claudio Imbrenda
> <imbrenda@linux.ibm.com> wrote:
> >
> > On Wed, 25 Feb 2026 23:06:09 -0800
> > Suren Baghdasaryan <surenb@google.com> wrote:
> > =20
> > > Replace vma_start_write() with vma_start_write_killable() when
> > > process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> > > Adjust its direct and indirect users to check for a possible error
> > > and handle it. Ensure users handle EINTR correctly and do not ignore
> > > it.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  arch/s390/kvm/kvm-s390.c |  2 +-
> > >  fs/proc/task_mmu.c       |  5 ++++-
> > >  mm/mempolicy.c           | 14 +++++++++++---
> > >  mm/pagewalk.c            | 20 ++++++++++++++------
> > >  mm/vma.c                 | 22 ++++++++++++++--------
> > >  mm/vma.h                 |  6 ++++++
> > >  6 files changed, 50 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> > > index 7a175d86cef0..337e4f7db63a 100644
> > > --- a/arch/s390/kvm/kvm-s390.c
> > > +++ b/arch/s390/kvm/kvm-s390.c
> > > @@ -2948,7 +2948,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsign=
ed int ioctl, unsigned long arg)
> > >               }
> > >               /* must be called without kvm->lock */
> > >               r =3D kvm_s390_handle_pv(kvm, &args);
> > > -             if (copy_to_user(argp, &args, sizeof(args))) {
> > > +             if (r !=3D -EINTR && copy_to_user(argp, &args, sizeof(a=
rgs))) {
> > >                       r =3D -EFAULT;
> > >                       break;
> > >               } =20
> >
> > can you very briefly explain how we can end up with -EINTR here?
> >
> > do I understand correctly that -EINTR is possible here only if the
> > process is being killed? =20
>=20
> Correct, it would happen if the process has a pending fatal signal
> (like SIGKILL) in its signal queue.
>=20
> >
> > [...] =20

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>


