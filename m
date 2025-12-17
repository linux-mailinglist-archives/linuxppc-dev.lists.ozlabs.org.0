Return-Path: <linuxppc-dev+bounces-14827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBECC5F8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 05:44:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWLmb2XQKz2ySq;
	Wed, 17 Dec 2025 15:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765946655;
	cv=none; b=OeDX1ZhRUJ/tSpG8SBH25jYHLKVzzBsfgYr9Lv9zv9HAgmOsGAcdYPDCU6C0q2Md9R3FODf10JIsnA5RV+GYdv1Yigc5FhzwX/UoVSlll9wSgL3tDdrJobpaxoRJSb9ZNQkF/ulC3VvgdZARL4LPNq7fh3W3Xo6J0r69GpR/2CTcti21Gq0FKqpgrEouSEzqlmGIT/jMIckyLaRCuRwFUR4PIL1P86HBoiTZU7SckXT4uSOhdUP8rbKux8L/6aGwilfzDwE2rd/a1x7xfbZ+e6cFM0jhdhMmi3A+qbSW2OOQaisATfswpzDOshbVE+q1g3M7+Vg27r0iuq+JwYGJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765946655; c=relaxed/relaxed;
	bh=hf4hQPCaVmfzWvX/cbH0q9Iikj3S7N4JK17uWCZzlEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hon3eqAbio2SHb9Q1n285KxOP1NJcQUSmaYrodHI2Myq2pX9yfHI/0UENJqkI2ounDh1Kv+tF8rJxGtTI5VeCwqT89LFQ0CFdMOmbfJqb7JI6FtL1o1nLX6eMS1omjiRemU1KWonW6eK/yKRQWnziXX5hu0rPkeXa2FhT6nsqcFHj+/7AW0R2/eg866UDXmR7BvWcQzU+EsUon1ryToUu5Bo3zWYoc2PhQHms/PdQs/jNiMVl1XDdSHR5uf/LFvc76oW7dnEu9vWzaf9rQWs/MTrgeifEchKhyTTwBXysgmIknte70matAQZbMKS93V/J3AZ5rPVbARiEqp633j/9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2PN9Sod; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2PN9Sod;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWLmY73f0z2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 15:44:13 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGHLoN2012702;
	Wed, 17 Dec 2025 04:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hf4hQP
	CaVmfzWvX/cbH0q9Iikj3S7N4JK17uWCZzlEs=; b=j2PN9Sodrtsu2qP+jei/So
	nckJKH/iG5d47Kza83+x8Jn54iA9BdL/r/jXt0FCrr+yNy8D6xPtSzuyCf8+nZF5
	CQRb39EjIU8WlOyBEg5gxuvckKL3mFohjfANdavv9etk+dp+XdkZVLxl0poOpZ1C
	L6aoNbwNWOHhPtoWieTEtjIvCOinkhVWzAE+u4T96HneXiiMrt8p6KJU0EZBUpnc
	PKwuY06rqRuXLePAHulZAFz3qjPLCzgf1s8bNK4uc6Vk4R/g4hOIYh5aBELr6GKc
	z1O2TVGj6yoUcp1IYgqunb9TxES/qOHgfXPKwDn9N3HPRRx3lnL8rmUQ4urVJLTA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm26xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 04:43:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH4hXa2017666;
	Wed, 17 Dec 2025 04:43:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm26xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 04:43:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH3LOO1014406;
	Wed, 17 Dec 2025 04:43:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpk02ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 04:43:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH4hSlm37159376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 04:43:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C5982004D;
	Wed, 17 Dec 2025 04:43:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36B9420040;
	Wed, 17 Dec 2025 04:43:22 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Dec 2025 04:43:22 +0000 (GMT)
Date: Wed, 17 Dec 2025 10:13:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] powerpc: Prepare for IRQ entry exit
Message-ID: <33v3ncxlwtc5qfdc257hky7pnly5j445qaqzc45vnbiswnge4t@wx5nujnzrazh>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-7-mkchauras@linux.ibm.com>
 <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
 <vk6k6fbjpq6pajvce5idrfq2m7smygpazpqemxkiyov7ywhbt7@6sckgpjdxarq>
 <49b2a51b-a324-4a8b-b6e8-434fcc411b19@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49b2a51b-a324-4a8b-b6e8-434fcc411b19@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7wzSmHDqhXN482lo5gBYx58JbD8Y7Bp0
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=694234f6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=ixD0K9jzaLZG2YaxzQsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: WcoYlVRc5uaL6mtGNcDuUO0GKp6ptd2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX7Zmwi0QrAl+8
 RJoEy3KJcmP3ubN0z5iGTRJnDt1F8aZILB9nFNx6AFN0ssECOC8lP+WgsiEiHKKbBXuHVJhgUxY
 MCMYfE6yWiFoUkTiqzvVJEM+YXj253O7gBlMDUL7+HI62MpVTbA/LawYrRtaraQdoV1+7a0Nrxr
 4joAtL8GREY5FBajBiWrMWZyhT/SGJVyi1N8ZWWr8mUAst9XpA/rkcHA26kQUZhsK9cNwTTzI1A
 Ow+tlB1gZRmhcVb3Aa7nOgR59wz3msLz1zI1NmJ0uhwURdFyvseF7fuC9IoGUSY1cMtYrrY5T6l
 7kJUglsoCF9kTye+RBggIi/akAYe7IxuLTlxEGRkiYsTutV/LdLkcS2Sz3KdtBLxOJsNQ1XKZT1
 kEuBFeJYu7iyG+Sa/CeEoLkkg0/gTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 11:40:51PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 16/12/2025 à 16:00, Mukesh Kumar Chaurasiya a écrit :
> > On Tue, Dec 16, 2025 at 10:58:16AM +0100, Christophe Leroy (CS GROUP) wrote:
> > > 
> > > 
> > > Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > > > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > > > 
> > > > Move interrupt entry and exit helper routines from interrupt.h into the
> > > > PowerPC-specific entry-common.h header as a preparatory step for enabling
> > > > the generic entry/exit framework.
> > > > 
> > > > This consolidation places all PowerPC interrupt entry/exit handling in a
> > > > single common header, aligning with the generic entry infrastructure.
> > > > The helpers provide architecture-specific handling for interrupt and NMI
> > > > entry/exit sequences, including:
> > > > 
> > > >    - arch_interrupt_enter/exit_prepare()
> > > >    - arch_interrupt_async_enter/exit_prepare()
> > > >    - arch_interrupt_nmi_enter/exit_prepare()
> > > >    - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
> > > >      debug register maintenance, and soft mask handling.
> > > > 
> > > > The functions are copied verbatim from interrupt.h to avoid functional
> > > > changes at this stage. Subsequent patches will integrate these routines
> > > > into the generic entry/exit flow.
> > > 
> > > Can we move them instead of duplicating them ?
> > > 
> > Till we enable the Generic framework i didn't want to touch the already
> > used code path. Once we enable the code all the unused code should be
> > removed. This helps us in bisecting future issues caused due to this.
> 
> I can't see who it can help bisecting. What did I miss ?
> 
> If you copy the code, you don't know whether what you have copied is correct
> or not until you use it. So when you start using it you don't know if the
> problem is in the copied code or the code using it.
> 
> If instead of copying the code you move it and continue to use the moved
> code from the only implementation, they when you start using it with the new
> code you are sure it works and then if you have a problem you know it is not
> the moved code but the new code using it.
> 
Sure makes sense. Will move this instead of duplicating.

Regards,
Mukesh
> Christophe

