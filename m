Return-Path: <linuxppc-dev+bounces-14659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9ACA8EF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 19:55:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNLDM0Bx6z2y7b;
	Sat, 06 Dec 2025 05:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764960930;
	cv=none; b=jyaXIETl7bEf3taw1I0+j3rK6tG6dA9YjklW8QMFnI1fHZvJNGtMCc5dVgbqTAHJs6sgBKfNnTifKpb/hftodlENzj0cu1V8D9pnooHuxJO1mlAtJHskgemYrCiW22iuTcfG1t1aMFC4ijt4iYY92ywxN+4Iqn9F/S84T5Fv50DfMFYE1arezTcKeNNqDxILRBylKw9xTsKzoFGmeNXZdujEh8vsxww4ec/eGBTI7VJFwD05y7ugbGNwoxT60EGNsu1TcvITXVEF0opRohdIWA3svfxv7G0WutVU0Sf8g1VPnaF8paCodAeC2RxInqwB5DpoZ6Ozd8+ZDqNR4vIWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764960930; c=relaxed/relaxed;
	bh=hkY55I0wH1o0bPSyujPgKQtyxxItb6wLc0jdMgtBuEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4La5w9OKX/IsjpokJOq6hmUL2hSbTCwYz4VuesDDQJUpaFmjMO5ORGRBgr0TUKimuw6NfwfKFrX5oohUdDUu4AWiZ6r7xxrACeeHBomK7aVJtH2TY/HDd8+bU48pBEW+B0XDkjVhVJpgNHehlFLLqRUsdifh8lm5FiSo82jk2KzYn3B6Z1Dok5z9jDhIZSJDFKoDyx4Zh6y/H0MnX/Wb83RUap0DqyDPgCesWbD8RexcqocFMlhMwRW17hw7v7Gpy20yQRg5YL/lK+nwlRm+tgR6fakZsckAHC1iniGcyZ5MvFbx//95JZ5XlHcJSQYEVFTe2HuTm7XOMxo7MI+PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=swoNLai6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=swoNLai6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNLDK5sVjz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 05:55:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5AQmK7025146;
	Fri, 5 Dec 2025 18:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=hkY55I0wH1o0bPSyujPgK
	QtyxxItb6wLc0jdMgtBuEI=; b=swoNLai65TpksOxN0tpsFZrgBU5UPVMv0l2xv
	bGmonYSTu6SjL6zxWtUP+DZ8CP4eiSvWnGoE3fAtJ07HfQhDn8mIdI1FYJqqYcmF
	n3CC225psnCWFSnM5xQYt1MtXyrDCtorhkuT0QJPSZ7MivKN/d2BvB0JVXcAvzdR
	FKgVBt2x0I6qQSVdjroYeXR1oEV2rSlHLZ0KyKP0vIFcQLDXrOYYsD96RsHNtsFh
	D9dVsvFnwxpy6ZVxjEGkIQcanxlVMhTeqSRZpaCHplcxpfOjkb1qeTQlOOQvTKhs
	gwL/E1sRQ3GFLkU6ftxroERXTjr8YBKqumJJ9sJBMPfzuNAcw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgqmb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:55:01 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5IpM61031245;
	Fri, 5 Dec 2025 18:55:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgqmb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:55:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5I0Gqu024059;
	Fri, 5 Dec 2025 18:54:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5sy1c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 18:54:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5Istjd27853440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 18:54:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA3A620043;
	Fri,  5 Dec 2025 18:54:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB7ED20040;
	Fri,  5 Dec 2025 18:54:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  5 Dec 2025 18:54:51 +0000 (GMT)
Date: Sat, 6 Dec 2025 00:24:51 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Ilya Leoshkevich <iii@linux.ibm.com>,
        Beata Michalska <beata.michalska@arm.com>
Subject: Re: [PATCH 08/17] sched/core: Implement CPU soft offline/online
Message-ID: <aTMqeylKyRwS7mn_@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
 <20251204175405.1511340-9-srikar@linux.ibm.com>
 <20251205160326.GF2528459@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20251205160326.GF2528459@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0JnT39zW7MDc1HnCm8VvGNiKv5pKaO-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAxNiBTYWx0ZWRfXzY1ln51zytSW
 HcLlG3QEIeFXdF1ip8twPdjAIIuk3qiNQWvpv9zqyeVj4o0cDtSRhH+j9z89inZ/leairwpdOIn
 ABCMErGxp8L4UjmuiQjtsdQCS0o/8UupvF473eE0/jw+uqUFbDQfZ+PP/ojn01JvJcrAyM9TdMq
 emIWiWK5OWQwru37R85JZKTXuRKtScpPDa5pFaVlUYsbUhvSa5YYgu+w6w5LBjj657Te0xISZOT
 WvC7UoN4aAB5r3lp4tnLxa0XP431Cnb8czhKhXxiZtXv7YN1O0V5ar8cF/0AXTXuBZSfv7mOs8H
 7+HJQ889tZw6KVMxwNmNlRyKs17e0QAlhakY2pVaB2in9V64vYB1uWbKTvNWYKhe3JrIefYI1N1
 3IUyk0Vwl8AnBuHVVqokTnTWdPE2sw==
X-Authority-Analysis: v=2.4 cv=UO7Q3Sfy c=1 sm=1 tr=0 ts=69332a85 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=aRRHB1lr27hSuLPYZcEA:9 a=wPNLvfGTeEIA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: Idlp8Q6kZtfYsd_VtKLHTRVxwOIGAnR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Peter Zijlstra <peterz@infradead.org> [2025-12-05 17:03:26]:

Hi Peter, 


> 
> What happens if you then offline one of these softoffline CPUs? Doesn't
> that do sched_cpu_deactivate() again?
> 
> Also, the way this seems to use softoffline_mask is as a hidden argument
> to sched_cpu_{de,}activate() instead of as an actual mask.
> 
> Moreover, there does not seem to be any sort of serialization vs
> concurrent set_cpu_softoffline() callers. At the very least
> update_group_capacity() would end up with indeterminate results.
> 

To serialize soft_offline with actual offline, can we take cpu_maps_update_begin() / cpu_maps_update_done


> This all doesn't look 'robust'.

I figured out when Shrikanth Hegde reported a warning to me today evening.

Basically pin a task to CPU, and then run workload so that the load causes steal and then do a cpu offline 
Pinning just causes the window to be sure enough to hit the case easily.

[  804.464298] ------------[ cut here ]------------
[  804.464325] CPU capacity asymmetry not supported on SMT
[  804.464341] WARNING: CPU: 575 PID: 2926 at kernel/sched/topology.c:1677 sd_init+0x428/0x494
[  804.464355] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto drm drm_panel_orientation_quirks xfs sd_mod sg ibmvscsi scsi_transport_srp ibmveth pseries_wdt dm_mirror dm_region_hash dm_log dm_mod fuse
[  804.464409] CPU: 575 UID: 0 PID: 2926 Comm: cpuhp/575 Kdump: loaded Not tainted 6.18.0-master+ #15 VOLUNTARY
[  804.464415] Hardware name: IBM,9080-HEU Power11 (architected) 0x820200 0xf000007 of:IBM,FW1110.00 (OK1110_066) hv:phyp pSeries
[  804.464420] NIP:  c000000000215c4c LR: c000000000215c48 CTR: 00000000005d54a0
[  804.464425] REGS: c00001801cfff3c0 TRAP: 0700   Not tainted  (6.18.0-master+)
[  804.464429] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28828228  XER: 0000000c
[  804.464441] CFAR: c000000000171988 IRQMASK: 0
               GPR00: c000000000215c48 c00001801cfff660 c000000001c28100 000000000000002b
               GPR04: 0000000000000000 c00001801cfff470 c00001801cfff468 000001fff1280000
               GPR08: 0000000000000027 0000000000000000 0000000000000000 0000000000000001
               GPR12: c00001ffe182ffa8 c00001fff5d43b00 c00001804e999548 0000000000000000
               GPR16: 0000000000000000 c0000000015732e8 c00000000153f380 c00000012b337c18
               GPR20: c000000002edb660 0000000000000239 0000000000000004 c000018029a26200
               GPR24: 0000000000000000 c0000000029787c8 0000000000000002 c00000012b337c00
               GPR28: c00001804e7cb948 c000000002ee06d0 c00001804e7cb800 c0000000029787c8
[  804.464491] NIP [c000000000215c4c] sd_init+0x428/0x494
[  804.464496] LR [c000000000215c48] sd_init+0x424/0x494
[  804.464501] Call Trace:
[  804.464504] [c00001801cfff660] [c000000000215c48] sd_init+0x424/0x494 (unreliable)
[  804.464511] [c00001801cfff740] [c000000000226fd8] build_sched_domains+0x1c0/0x938
[  804.464517] [c00001801cfff850] [c000000000228f98] partition_sched_domains_locked+0x4a8/0x688
[  804.464523] [c00001801cfff940] [c000000000229244] partition_sched_domains+0x5c/0x84
[  804.464528] [c00001801cfff990] [c00000000031a020] rebuild_sched_domains_locked+0x1d8/0x260
[  804.464536] [c00001801cfff9f0] [c00000000031dde4] cpuset_handle_hotplug+0x564/0x728
[  804.464542] [c00001801cfffd80] [c0000000001d9fa8] sched_cpu_activate+0x2d4/0x2dc
[  804.464549] [c00001801cfffde0] [c00000000017567c] cpuhp_invoke_callback+0x26c/0xb20
[  804.464556] [c00001801cfffec0] [c000000000177554] cpuhp_thread_fun+0x210/0x2e8
[  804.464561] [c00001801cffff40] [c0000000001c1640] smpboot_thread_fn+0x200/0x2c0
[  804.464568] [c00001801cffff90] [c0000000001b5758] kthread+0x134/0x164
[  804.464575] [c00001801cffffe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
[  804.464581] Code: 4082fe5c 3d420120 894a2525 2c0a0000 4082fe4c 3c62ff95 39200001 3d420120 38639830 992a2525 4bf5bcbd 60000000 <0fe00000> 813e003c 4bfffe24 60000000
[  804.464598] ---[ end trace 0000000000000000 ]---


But this warning will still remain even if we take the cpu_maps_update_begin.

This comes due to
	WARN_ONCE((sd->flags & (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY)) ==
		  (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY),
		  "CPU capacity asymmetry not supported on SMT\n");

which was recently added by 
Commit c744dc4ab58d ("sched/topology: Rework CPU capacity asymmetry detection")
Is there a way to tweak this WARN_ONCE?

-- 
Thanks and Regards
Srikar Dronamraju

