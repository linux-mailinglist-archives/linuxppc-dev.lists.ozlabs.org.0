Return-Path: <linuxppc-dev+bounces-15408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD761D01C08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 10:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmzf726wHz2yG7;
	Thu, 08 Jan 2026 20:10:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767863455;
	cv=none; b=nCJCwGIX61k0alKq4JPMqL7sQmbpzcbf0t+TAsL3aFp2OfHp1IEmrSluhvPPJWZu2IlQvpSt7aj8GBHigTCsHSHB8vGGL8dyoL5Mf2qIbF5ndJ85LytiXZDzorBd9gh33QOtpZkYFj2T2PaoKJGFZ1yfdu6GirHSeWK0O1e3PjKg0w5hzBOe7rj74s2XKa+nGmzD8l1fvFF4XZK4wlM/fvOC1frrmnPqp89ogzHV5dupeOI/gQu/Gdb1oqrXjmurksZqdmvYQKeeeRb8lXvYX2tp9UYfSAIZRgkZC7cbCroCBVu4t0PBWGue4k6hXG3x+sh9lOgd1jSopSGZmpV3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767863455; c=relaxed/relaxed;
	bh=C3+XNaSDI2xF3PAxj604v/eV3Vxp1rIX5xTH/wFBtxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itE7HrROZGHIMLIkxu32VjUCDCELOw9IDqhZMKFF1CXvopLIIsf64wOnUh680Rk0IXK/+mD57w9O6RmNSwHNfuWwF5IlVtE7+JPImwTFbnznGQNgO7l2LMqXbi1mFxD45uctZvasTQQhcdmwE76YD8SMna5hRHAV7dP99VhG2oGYTvPzl+pfQzQL2EpFxzyKQGpjn+ew5oWz8HokKrRtBd9BCV4oZdy0oXZeHVZs0CgRQMvldyY/ic5Jz2lUiK/xOyacidwqlxTRaeuLXJ9HmowzwXXPl1zEaQgzezR3UbENsMmBWcxpUhhdWdH2xBlDU0iKsn89EwGnGjjPPWWzhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FT/D8P2Z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FT/D8P2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmzf568Xbz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 20:10:53 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 607M5W4g016651;
	Thu, 8 Jan 2026 09:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=C3+XNa
	SDI2xF3PAxj604v/eV3Vxp1rIX5xTH/wFBtxo=; b=FT/D8P2ZvPCje+7wZXaPOU
	6JpP2myP4tg+GJQfNthTtY/cqXL+CiBFyl94t4u1fTD7SQU/aISFjYTeNP5ZHVye
	1+xcMbIkJvy9goJRm627iK80Ntvy2ncyya5HMB+FuDb8nV29yhR6m26POYf9dLFg
	tmPw9C6hk5A8TAJjgH7ViJdJilRF6C47MUoaVi9rqlwOSe/p63w7E3V2dYq4IIXV
	z3xMhqyUR3JiACQJx4EkpljMAfvSZZZmMJ5UzqCxU3QvCsbz+2vNz7C0XR6ev+pi
	g1xoxi73Frv7jTLYzYO9++dNFjkSJ2klXXQAjg78aCwSE/LiXseyDtHNFW2BIBWA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsqdf1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 09:10:05 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 608969Nu000800;
	Thu, 8 Jan 2026 09:10:04 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsqdf1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 09:10:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6086NFB9019341;
	Thu, 8 Jan 2026 09:10:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfg51dpcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 09:10:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60899xWF21365240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Jan 2026 09:09:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81BB92004B;
	Thu,  8 Jan 2026 09:09:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49E6E20040;
	Thu,  8 Jan 2026 09:09:55 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.109.250.90])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Jan 2026 09:09:55 +0000 (GMT)
Date: Thu, 8 Jan 2026 14:39:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Venkat <venkat88@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, Shrikanth Hegde <sshegde@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        namcao@linutronix.de, Thomas Gleixner <tglx@linutronix.de>,
        Kan Liang <kan.liang@linux.intel.com>, mark.barnett@arm.com,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
Message-ID: <aV90NVNEUjMABRNp@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <3BBCC728-0BF9-484A-85F9-2760DEFD56BD@linux.ibm.com>
 <e18ac87b-0034-4297-ae15-0dd0a36abb15@kernel.org>
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
In-Reply-To: <e18ac87b-0034-4297-ae15-0dd0a36abb15@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kjAhBS6LqblIFnGa8V9aLQIxCDmHlrEB
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=695f746d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=tckgzhkTuugkUmzQtsYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: BqE6XJzG-6CpC_PizBV9atVnQVvHZqFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX5gKYUkSs2rwh
 +0A3dJ3CEqdIbfWPWU8h1vhRVmTVpaZtrRYWsfqHB1afobdRSSnl7/KqJTZKFFJmkQXAICUPG8G
 /Mmy3ase8NPhXa7OaUptaY4K8yeDnp3WVyBLT603NFffuOKI3gPQ5kdg8N+xXEqKJ0BqUKvxdd/
 p/V/zJGGBqRaMGfw5bybzZFxp2VzUl6Xay1qKQs+Nj7JrI88oFGT5d9HLt7uh1WYft4FV/UCEJL
 AlheuWR2QQd+qkwc0081PBMHIiWDTjKdR0T0OU4YW/i1PSWUs+GTrO/ZVtXGJQSmu3EkHtssOSy
 ep0c8TqvrM3UpnrI9DabPRI9VC8cdR3/BDCZA889Wg2WOjOTIAC8sNMRbsKiWg2nTq3REUDbyWd
 QKpLFJM6s1GdeBfEe0MsHchv8FK0RWJOVA/RCzQHtiUxYyUVYET1VkTB5he6JoK/wpa4yTcX/Qe
 OrxmGjkEot1MGkZhw8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601080059
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 07:05:42AM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi,
> 
> Le 08/01/2026 à 06:16, Venkat a écrit :
> > With this patch set, build fails.
> > 
> > Failure logs:
> > 
> > ld: init/main.o: in function `do_one_initcall':
> > /root/linux/init/main.c:1384: undefined reference to `memcpy'
> 
> I guess you have KASAN enabled ?
> 
> See
> https://lore.kernel.org/all/0947502d-96e3-4179-ae48-603de74dc7b3@kernel.org/
> 
> This is because of commit 69d4c0d32186 ("entry, kasan, x86: Disallow
> overriding mem*() functions") which changed the core behaviour in 2023
> without taking care of other architectures than x86 who was the only one
> with CONFIG_GENERIC_ENTRY ?
> 
> For powerpc the expected behaviour introduced in 2019 by commit 26deb04342e3
> ("powerpc: prepare string/mem functions for KASAN") needs to be modified the
> same way to fit with the core change.
> 
> Christophe
Hey Christophe, Venkat

I am working on this. I'll send out a new revision soon.

Regards,
Mukesh

