Return-Path: <linuxppc-dev+bounces-13434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6FC146C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 12:43:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwpQx5Zjmz3dWl;
	Tue, 28 Oct 2025 22:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761651785;
	cv=none; b=mzKubvoMdZrwuSH6ssGCZfEzE77zXefrcChtU2fmrXjwgk84VTPZdy1KNN5lp8m9etuogDh6Qg9kReSrKnEqmUzqOZ7PycPLdVv7MCPuSHuBYWgB4iU085nF19UVJyjtO0DiL+dufk4VvvSDQU24nTh1V6kFFLvrYDlV1FufcWinifi4/NGFo9wzr5HE4Z9533Pstt1dm2ZDxMfsFWGuUuTUpLPILGOyVbr5wRClAT8zTnKPlCAT+SvkzH/1Vl0WoalS2Dl2mLFoNxE0phIDUFFlvVlVYpLXZnxHKVrQ5Z2r2Ik+ZLnCeCtSnM90CVlWrGbefuSi628cdbitvXcFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761651785; c=relaxed/relaxed;
	bh=rVlAk8Ncbn6PJuOegR+7DA8/03MNMoaXM5rmuz/7VpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg4EU1YAsYeIWVAz5oer+R6hwZmQMcf8diVu24yhjyY/IoJUYFj4iyx6EFzSu7eogEZXtUFnucp76azYkq5XJ6FUpy+axjIuZ/KVkqYh1DYPD2oMZ6D9lWzOwH0qZyRKH3qPOFjW1fyBytB+4DZxiheWSGZKI2c86QWMMAzNipP6+TuxaC1CWYz2FNf4HLhHg507UQyYZgDXxwHwxS98iAKWNkHdWlDMgMXWha2JtII+AUXnUerDDr/rdu6CPcXCR+2CeBPvYqxcpBbGdBDixwam8X+LnbNA0aUrhFNopIn7zzDK/eWHr1zKb6qRZqHcrzus75/YILExDF2Vywbfmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T+BDIUky; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T+BDIUky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwpQw4zFHz3dWh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 22:43:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RKu8d2023993;
	Tue, 28 Oct 2025 11:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=rVlAk8Ncbn6PJuOegR+7D
	A8/03MNMoaXM5rmuz/7VpE=; b=T+BDIUkysc+gwITkriBDHkLyqD6UVCMf78fpy
	TCU1G2uIr/3KOzLKhXWg7iu/J4xkWysqzrl7Ha+1BYaVSP/IakDVcM1vUmxzHC/L
	jtMn7VQgXi0gGnzSVUAYRKE4nYRWvmdoa2DlJsSThFYvhh7rQPkfXsi8F0qUYCt3
	HOpeRY467lPlJ4dFzebWscHPCPlcE+bLrvU5Bm5pKSeC5HRYq8eZWeNakLINzHHR
	c+8w7QBGFvsevXhcUWAZ7EbfuwSNHeh+XXI0uVROBEN2RJdvNIRvpFe+T+f3R3yl
	WkNbH/o0i05I0X5RqHjCV6FZP0LyqAdMrXOkccF16GhWSMyjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p293na7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 11:42:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59SBgHQ3007161;
	Tue, 28 Oct 2025 11:42:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p293na2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 11:42:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59S8NBSe030364;
	Tue, 28 Oct 2025 11:42:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a1acjtdca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 11:42:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59SBgBvT54722926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Oct 2025 11:42:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 861CB20043;
	Tue, 28 Oct 2025 11:42:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEFF720040;
	Tue, 28 Oct 2025 11:42:08 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 28 Oct 2025 11:42:08 +0000 (GMT)
Date: Tue, 28 Oct 2025 17:12:07 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Nicholas Piggin <npiggin@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/2] sched: Feature to decide if steal should update CPU
 capacity
Message-ID: <aQCsD4AWgjczDfjB@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251028104255.1892485-1-srikar@linux.ibm.com>
 <20251028111813.GK3245006@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20251028111813.GK3245006@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxOSBTYWx0ZWRfX3E65AGWX3YDK
 ZcQMHwei5KhTLQIaIVtiDqwCXhZbu1FjPJQtDXYSxAYBUjt5ze1UrTdq4dEtGDZOpc8UYjEsZcw
 X7ZmLTRjfQZZRUJiYwViBDKZUAiMH1VfPQ1d2gWW6ws92nvgNi8LOyTLouC1y/UDiictDsCJdKZ
 kbVahpA3tpLiqzrV23mzldrF/XGPLaaNXfxvJvRVIvKbnIjct49HVkcH1Sb4RzAXaE9jN6MoRpb
 Mvo+IKDRH1o1ZOLazf655vXeEc3jhLy1V9L4t4fcgrXPe0rbu5MY+2d5Lw/ZKsPE/EzxWta/Clf
 DKq7AIi/kBg03+IsQ08kcGkSn2gTxH+f16YdzKhKOVDEA6Qc7UCp/jtnHc/VRmbzprTsg/cSyDb
 Iqrs6gwNJnv+xsVV5STLhoIR2WxaUQ==
X-Proofpoint-GUID: 7EE3qoUTsocvgzt5-oWxn5mEHfSh58gl
X-Authority-Analysis: v=2.4 cv=V8ZwEOni c=1 sm=1 tr=0 ts=6900ac19 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=an05pmTB2Cu0hgrGQSoA:9 a=wPNLvfGTeEIA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: vIm5uMRFkyLB3neSmqeFXK9ByuhWRcRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510250019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Peter Zijlstra <peterz@infradead.org> [2025-10-28 12:18:13]:

> On Tue, Oct 28, 2025 at 04:12:54PM +0530, Srikar Dronamraju wrote:
> > At present, scheduler scales CPU capacity for fair tasks based on time
> > spent on irq and steal time. If a CPU sees irq or steal time, its
> > capacity for fair tasks decreases causing tasks to migrate to other CPU
> > that are not affected by irq and steal time. All of this is gated by
> > NONTASK_CAPACITY.
> > 
> > In virtualized setups, a CPU that reports steal time (time taken by the
> > hypervisor) can cause tasks to migrate unnecessarily to sibling CPUs that
> > appear to be less busy, only for the situation to reverse shortly.
> > 
> > To mitigate this ping-pong behaviour, this change introduces a new
> > scheduler feature flag: ACCT_STEAL which will control whether steal time
> > contributes to non-task capacity adjustments (used for fair scheduling).
> 
> Please don't use sched_feat like this. If this is something that wants
> to be set by architectures move it to a normal static_branch (like eg.
> sched_energy_present, sched_asymc_cpucapacity, sched_cluster_active,
> sched_smt_present, sched_numa_balancing etc.).

Ok, Peter, will move it to a static_branch approach and post a v2.

-- 
Thanks and Regards
Srikar Dronamraju

