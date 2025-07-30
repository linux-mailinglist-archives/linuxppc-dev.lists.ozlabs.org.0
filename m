Return-Path: <linuxppc-dev+bounces-10451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42037B15AB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 10:33:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsQV76XWcz30Vq;
	Wed, 30 Jul 2025 18:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753864431;
	cv=none; b=cP25TtiffJ/99SlIrftGmajILgiUCD6NWYOFZX8pCb3I5xDlEkLRrek4Q0m48ZQ1ciuPT5sTtAR8sltjC9tpsSTYTkXV4mqY8S4650NnKTFT5pqqBTJaoWNqi/5a35JsfFFIAZo3yM9TZ7ZOhMJEjEbBaQpBXuUKQRTee9OZAUs6BJyztOPN450Te3Al75fIXKNCnARDxwjxjf5BP7vY4cviH1mCrXAlf5wWhDVwymRQqA7iHECBFaODnPjcDC/kjpkboaAxdeHSepurASnbaDLRymd9UbnGLhcJkumDGPTQ+PPoJ8bTodjl7Qm+ZuvlgsXGItWKlU3ZvLdsE+4UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753864431; c=relaxed/relaxed;
	bh=dt9jR8QiUK88lCjFXNLtmxPAcSGZTe27UFLY4HQiQM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6AE9XaPlfKWP31tGlHMSyMHst0Tb/1SY9CczudiUO4OVuR/P75ZQXYL79SK2guDAYiZv0g/OCBeicMLfURQ1Kx83WE916k9YBlrhHWt2mAc7KMdTrq+y5IqPslpQYkXegZxtNgZla51QvmrNWMb6EN3j5I6nQo+MFGlThUPPhf7VKuN9+eqGQliH3edQHDBHMMh0ELm/DjV/KpQYjbBKd3KnIUjMoVb7m9bWaTb7HsfTpBNa7VWZrMKE39Z5a6SYAAruIOphqm8hO1ebaM2PXHaA5GaGhCqK8dOJBzvDGa5sykTIFAZU11fBpA0P2HuX/tSVcPQrCT4tk7UfP8JFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sv3nk2Ab; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sv3nk2Ab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsQV65VRJz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 18:33:50 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U0knd0021843;
	Wed, 30 Jul 2025 08:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dt9jR8
	QiUK88lCjFXNLtmxPAcSGZTe27UFLY4HQiQM0=; b=Sv3nk2AbHUaa4pHvc83BEu
	qzrjgECrFUfSIawSgc7+lV39ijm9wSXgylGc0fkPADxrQhJXtzE5rbmg4JnQ1SIr
	babAWeZcG315Pvnr5X00G9X0uBPtigCY94dbns72CiHHmEFwqCJZiQhhir7zSpy7
	svhjTR4ewgzxifdzS7/b+n3HaqOusd1TCo2rGxl/iPGLyPZkZ5KXrjjVEEdRV29o
	hitcMrjtfVChYdcYyap2uRH3tWJzkngGKPCRbOQMVUUGguSWsn35NfKrD8X2gPRr
	RKa1ZvMMtV0NtiPo1eQyBk/iViCq27thHU+Wgp6Kf26bkMaLTHjGYQvFssOFmFOA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qemuj71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:33:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56U8PIDp029649;
	Wed, 30 Jul 2025 08:33:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qemuj6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:33:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6NAln016005;
	Wed, 30 Jul 2025 08:33:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aumpfpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:33:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56U8XZKj50725344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Jul 2025 08:33:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ACD220049;
	Wed, 30 Jul 2025 08:33:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1C9920040;
	Wed, 30 Jul 2025 08:33:34 +0000 (GMT)
Received: from localhost (unknown [9.39.23.62])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Jul 2025 08:33:34 +0000 (GMT)
Date: Wed, 30 Jul 2025 14:03:33 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/qspinlock: Add spinlock contention tracepoint
Message-ID: <ajtwxjuidgib2tixuhtykeucyqflyn4ta3f3vdedjbzqsbpykn@wty7zcswiqyr>
References: <20250725081432.1254986-1-nysal@linux.ibm.com>
 <7bba99d8-b171-4ac1-a33c-4c086f3684fd@csgroup.eu>
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
In-Reply-To: <7bba99d8-b171-4ac1-a33c-4c086f3684fd@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yVW7lf3hsXfnMlGiQ4q_yGmx2SGhCOK1
X-Proofpoint-GUID: 8qpdR_IPP_Se6ZLvBjWXR6il40gX1Jxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NyBTYWx0ZWRfX0g4DzMTmSu8S
 gmAQ9uzZH5jR1Su8Tdxy9KBFS15bUPDVJJOlnokpMlWECA025fptdifa3fIKN+4iArW7BNK0Y8N
 E4yU1u9unT6HtIQU6k4OAAz39qk6OoggQLMtFTsMISEo49R17VVwm8K87hXhtSbd8BkuG/FHGYL
 EsvRDBKcNEDC3CaC4Im4XjT/6H97Dd0ISSNModvT6xTID4zdv4mjJXH24kZ3NjM/y007E2KJaNF
 j1crjdahufZL5llyHFrBIuSaC4t6lWR8cRHPKBOcPWYrKRLCP5WaZH+O/C8dq/6l+Uq6s1Q1ocN
 LX2p6Oow3b9q0CfDAzhrVK48AIfNdTW/06NJx9/QfQlflCVtr3vZunqkD056aoVdJdRl89Z7vhg
 gGGpzI0ATKYAL64L69NpsD8PIsRw2lVoAwsWjFp9Q+XNa3ycRAVsCGBruAf0/xQN3+sLYcqw
X-Authority-Analysis: v=2.4 cv=BJOzrEQG c=1 sm=1 tr=0 ts=6889d8e3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JZGb1Hen3STrfkKHDJAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mDVER0IZTAoA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300057
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 08:46:28AM +0200, Christophe Leroy wrote:
> 
> 
> Le 25/07/2025 à 10:14, Nysal Jan K.A. a écrit :
> > @@ -718,16 +720,17 @@ void queued_spin_lock_slowpath(struct qspinlock *lock)
> >   	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
> >   		if (try_to_steal_lock(lock, true)) {
> >   			spec_barrier();
> > -			return;
> > +		} else {
> > +			queued_spin_lock_mcs_queue(lock, true);
> 
> If I read correctly, now all this is single line so you have to drop the
> braces , see
> https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces

Will fix the coding style in v2. Thanks for the review.

--Nysal

