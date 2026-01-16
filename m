Return-Path: <linuxppc-dev+bounces-15874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223BD2A972
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 04:14:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dslLl3vkQz2xqj;
	Fri, 16 Jan 2026 14:14:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768533247;
	cv=none; b=jutgXuuDMokg9mM0jK8wmHcVNuShxki/IHBeUu9wmB/jKE8bOhUBkxODpZ+eH6ABGEy/z+ERA4MyKALsE83JfjqLQFhqSkqDpI4q/AcqCMOpc8ok/ZKzu/Sag0t3VR7fMsAUKNjeHFnEPkHNc3kxSy3LzRP0nVF1P5pr7ulTaJFIgB9UGn0NY6I7WHsG9bpxbYIC8pFoLHXKxPkbdPI1aUcmmjbuf/MbTRrUyPsNoMoa2lh8Da9pX+RpdOJqCkh2KWz7qnI529t56mWXtgarcay5xafh2pPZziJ3LxoLDpI/+GTHgT2cS87rC9tRybou+Bv+zF+TrQdyOh5fvWpD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768533247; c=relaxed/relaxed;
	bh=fW9DCoyeRwgZraySQWN8vHpYbvVPEVqIauwbJyIM5A0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CoN9v8Sca1o21k3TGYNQa0yTaKOEaILebPMyrVY+E6pLAgyEh1BUXCEVY3HEVrUVNesm3iKZ5jO5MhaXeYWpat2qGEOPi4GGEwr+06P1EUePBcTI3oC6wU8lUc8x4UQPUBDDe/p/5SVPkY7HYt0mOmy/P+PrMtavPKedZhKj0lvwIlMCByXlu3Y6Xlkr550feUUx5R0VeidHWTetQsPyVRe5waUjtJcktFi8fa3upDUnT92rbJ6ZGKb4qQG/8cHUXF83har3j4Q4PT0eGVLZSw+Gpdn2OEMpfkHkG/ER6rMmE4GJU27t/Yr3otT5RyLkb/XHEiQ/P/LRZ8f9liULbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NYygGJ9J; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NYygGJ9J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dslLk1sFcz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 14:14:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNIHeB029136;
	Fri, 16 Jan 2026 03:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fW9DCo
	yeRwgZraySQWN8vHpYbvVPEVqIauwbJyIM5A0=; b=NYygGJ9J3OYSrN2x4e9z6X
	NYJJ7RxBn3MNL1AVw7mshGtX9hPULZCWlATJxyuqbZdUQNguUfdOxrarn4j5Ydg1
	AGxQ+d5Zgz6XZzKjE2TXf58qyp1fSESB+YjMrh9aoxPdurBGbMmC22goMcZuNX/z
	f9zzUdAKK6dBmJVMrUhMz+afmJX2H72x6505h4wAImixn8Ym3Uw54J2ocq8sNd24
	Tnbr6UBUIEDOOI/BkljqDwrEkqyz7B/CNXwLzBbk12VTJjv2QrIFNMGmWZWDEcyy
	x/HlZF3eMB4ZeJMeBQ6mXmns4eec10jUcxphWK90EAjjjDG36OrRJ2dqbKDWG3tQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G3DoSk002919;
	Fri, 16 Jan 2026 03:13:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNYKXh014274;
	Fri, 16 Jan 2026 03:13:50 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fykxcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G3DnoW25101006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 03:13:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BE25805C;
	Fri, 16 Jan 2026 03:13:48 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A470458051;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Message-ID: <ba35672820c2fbad2611a0a89b3cb60125776f9b.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Pasha Tatashin	
 <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Rohan McLure	 <rmclure@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
        x86@kernel.org, Nicholas Miehlbradt
 <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan	 <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Fri, 16 Jan 2026 14:13:42 +1100
In-Reply-To: <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
References: 
	<20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
		<CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
		<bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
		<b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
		<cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
	 <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=6969acef cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Y5EJBO6SgJiHs8anXDIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 55htG9PDokbxJx8uQ6srL93nebqrpK1p
X-Proofpoint-GUID: YOi29F4SNz54m1WROzu-sRkP6zlVhnnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyMiBTYWx0ZWRfX+AFfHh/cyIIs
 bJQv6kvsfmeTtynUjb6q5acSz5NV99GlwAWc2Cdw+aIY773Sk1Jx0AU8AGPqrkiFsh5DIgsWZab
 l4KzZtSHmo4HZ6zzXOr8C5VRJI8wJtmrLRHxvQhtRdWyhdOlJTWYsr11jTchKxv8aEGc7AQSEH4
 PewoYzY2OxNY+PBDkh/xfq7ECz3wsnqg4Ot0ixK+uM67WU1GFayhSS1Xv2R94C2p1Aleg6ympam
 PBuyjS4HCHvSNa/blb2ORlmIncCBmSTSBjvXh3yuRJ8/x9kPI30vigZ97XQ+5gUduWdvjeZOz64
 5yUKs1skk9SpC5UfQMTteYAjlJmk9mR3kPFfFR76igDW6b1BTU7Z4deWPfgEJ2SzlNbgWL6xkdN
 1KEbXNv7crX3PHM3ZLXRK+2ftCyNFptvnp/hpTMzaDxvNeGOnIODTok8V2WUhnRn2GL6xdQHsCl
 /G87cYrP3vwn/veSdtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601160022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2026-01-15 at 16:18 -0800, Andrew Morton wrote:
> On Thu, 15 Jan 2026 17:13:26 +1100 Andrew Donnellan <ajd@linux.ibm.com> w=
rote:
>=20
> > On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> > > What is the merge plan ? I see all powerpc commits are acked by Maddy=
,=20
> > > will the series be merged by Andrew into the mm tree ?
> >=20
> > This is what I was expecting - this revision is rebased on mm-new as it
> > stood
> > around when I sent it.
>=20
> Ouch, sorry, I did not understand this.=C2=A0 So we've lost 4 weeks testi=
ng :(
>=20
> The core MM and ARM changes are trival, in the if-it-compiles-it-works
> category.=C2=A0 Is the mm tree really the best place for this?=C2=A0 It'l=
l get
> more testing in the powerpc tree?
>=20
> But if you're OK with it, I'm OK with it.
>=20
> > By the way it doesn't apply on top of powerpc/merge branch:
>=20
> I guess we'll be hearing from Mark when this hits linux-next.=20
> Hopefully the resolution isn't horrible.
>=20
> As I'm adding this to mm.git's mm-new branch, Mark won't actually be
> seeing it.=C2=A0 I'll aim to move this into mm-unstable (and hence
> linux-next) after just a single day.

Thanks, sorry for the confusion! *Hopefully* 18th time's the charm...


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

