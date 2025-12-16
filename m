Return-Path: <linuxppc-dev+bounces-14817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4ADCC3D3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0gr20qgz2yF1;
	Wed, 17 Dec 2025 02:08:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897736;
	cv=none; b=P5ZzwlmgrRepWlDen6PVy810/gmpzOdiOX19D/YSepfdKBo9FJK5n5dMFRetM4NM00biOuYbzrmnMyLTLG7qe2f2+JMpw7DLvv1LjDYIsWwJ259hJxQsqqpEuw1cKxy6U6PF+99SCMVdS6iVOeIJeJ6gM+DhOU8j3GqDjOjvKx8vpDgRjn1zmlCAT58ckiVomeUakSacx1SlJRMKT57C5VdRDXBczP8CrorkXT0JjBtXYTQth5KPm56YqzIUbxFb68v7YI2BoCP43yyFQaWAVFSA2ngCttUXpaYjbtD+Bm1jyyy7TfaB2nVsR9mWX91gNR6PwaKUOJwVsiVGqHCyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897736; c=relaxed/relaxed;
	bh=dnq+6hu5BPEuSmUqMghxEs2qLn+nY1+2BWDHq+u/9H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhaPdBkLp65uKKXxN9MtapjslQ7xdi0JTTbxPKg7SRPe7t7UZz7mEyjtvN9XHQzpNHtl613zxaC5lc4jXmnBEuQjsaWw46Ibs+Zk5f4lKvBA54u+3O/cDwNYAPnhc4Gu4eslA49rsEFmejKbl2f51Dwdb50XPXonkgq6dgQV3gsQ1dB0lGcxjVclBFXxkrMB2iTGgURiXVtgGs7lDhPAAANpVNkUmJyQzXANsCQbflYx7URcqx1GpkrxnckOM9lgySoMD4bkAK3JXeM5sUsjrO9NRTsR9yiJ/85scn6MtTccF81I84F2RWvCO6wSc9+SJtJ7O5Rxn2FgneIzsrKiBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jvLw0F81; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jvLw0F81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0gp6c8pz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:08:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCU1kx025358;
	Tue, 16 Dec 2025 15:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dnq+6hu5BPEuSmUqMghxEs2qLn+nY1
	+2BWDHq+u/9H8=; b=jvLw0F81t+1/6KGdJbLobQbFgPPfG1RB2fDflAuLm5dMAx
	uAUqyp445Ax6BUdZUnfvcLrH/xm1UK1XVmZyETgKwoYbaSyl9gnOKSZDuv+2AB1Y
	nCxPFNodwUtknWV0P0sHlX672n7m35ZuUy6aABc35tPDHn4IFxzpJPZti/hVZdd9
	bXm+sbwT1GOA9D4mz+HBxS+M8p64+Eztws5bRVZT4cpjwR18khb5zI1Y0bCADVVs
	P2+M9GdceCicpD2vsjK00UQbQKixu6nHEvblthnUxb/66LzkMC0XPmOBu7pD8CmE
	U2UxCbuXbfiIXUORmUL9UtMLfXO2YVT+rAQYcCTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7r50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:08:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGF0nTr008690;
	Tue, 16 Dec 2025 15:08:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7r4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:08:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCS4Rg026786;
	Tue, 16 Dec 2025 15:08:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfsd0wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:08:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGF8KKO33620442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:08:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72C6E2004B;
	Tue, 16 Dec 2025 15:08:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C600620043;
	Tue, 16 Dec 2025 15:08:13 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:08:13 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:38:10 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
        mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <4ajwe2mjxijqffbmsf7drav53wxucd7wnrcn7uuvbacrmc22je@2c32xx4oopwn>
References: <20251214130245.43664-9-mkchauras@linux.ibm.com>
 <202512160453.iO9WNjrm-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512160453.iO9WNjrm-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=694175ea cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=aWUhAYk7kU26KNEIdPkA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: r3HWgdkiCXzA9dGJNkHGMeaSBqJvbdxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX0UtVttCb4LgR
 OYPkGhGK4hYKUKcCEMOlkfKk+1+MCfEtIF1TyXckb8zPa2WZvqCLxJOLd41B42+cSOUWXzWIv9H
 5+K/YbssELWZ2XbCFRWXPvQjRnc3XOP075Om7F3BDm0wWwS0MYqqdgFY8uDQ3r0FJEF7sal7dra
 jkOxvm+3TqZs5+xgNdfkKBWam0kYqPJibOn4aDIabGv+1W/ArKuenyJEg+DpAhrVkP7915nl7Ki
 Dwlf1tT5QQR/yfTcv+9H1Gp5XFb8JYJota0V1Rv6gVgskNXM35CbnU0VNd/W7l1KQMuEJ+1moJK
 lYD6g6TOrXoijl9rKIrYYZ3M8MsPQ+jE0j5+dLUjfHKltUo+goSANEoNWLW14bhJ1h1zZK86GM2
 l3yakQdYyg7HDhOcTymlVuwS/i+JYg==
X-Proofpoint-ORIG-GUID: RS86Nrsm5haUZvShKDP7KBGcdDiXsZiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 04:27:55AM +0800, kernel test robot wrote:
> Hi Mukesh,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on powerpc/fixes linus/master v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251214-210813
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20251214130245.43664-9-mkchauras%40linux.ibm.com
> patch subject: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
> config: powerpc-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160453.iO9WNjrm-lkp@intel.com/
> 
I tried this with gcc 9.4 and gcc 14. I am not able to reproduce this.
Will investigate further, meanwhile if anyone has any ideas that can help it would be great.

Regards,
Mukesh
> All errors (new ones prefixed by >>):
> 
>    powerpc-linux-ld: init/main.o: in function `do_trace_event_raw_event_initcall_level':
>    include/trace/events/initcall.h:10: undefined reference to `memcpy'
>    powerpc-linux-ld: init/main.o: in function `repair_env_string':
>    init/main.c:512: undefined reference to `memmove'
>    powerpc-linux-ld: init/do_mounts.o: in function `do_mount_root':
>    init/do_mounts.c:162: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `start_thread':
>    arch/powerpc/kernel/process.c:1919: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `__set_breakpoint':
>    arch/powerpc/kernel/process.c:880: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `arch_dup_task_struct':
>    arch/powerpc/kernel/process.c:1724: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `copy_thread':
>    arch/powerpc/kernel/process.c:1801: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/process.c:1812: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/signal.o: in function `do_signal':
>    arch/powerpc/kernel/signal.c:247: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `register_decrementer_clockevent':
> >> arch/powerpc/kernel/time.c:834: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `platform_device_register_resndata':
> >> include/linux/platform_device.h:158: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/prom.o: in function `move_device_tree':
> >> arch/powerpc/kernel/prom.c:134: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/setup-common.o: in function `probe_machine':
> >> arch/powerpc/kernel/setup-common.c:646: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `user_regset_copyin':
> >> include/linux/regset.h:276: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_write':
>    include/linux/regset.h:42: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr_get':
> >> arch/powerpc/kernel/ptrace/ptrace-view.c:230: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
> >> include/linux/regset.h:30: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr32_get_common':
>    arch/powerpc/kernel/ptrace/ptrace-view.c:707: undefined reference to `memcpy'
> >> powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:708: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:710: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
> >> include/linux/regset.h:30: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-novsx.o: in function `membuf_write':
>    include/linux/regset.h:42: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/optprobes.o: in function `can_optimize':
> >> arch/powerpc/kernel/optprobes.c:71: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_map_magic_page':
> >> arch/powerpc/kernel/kvm.c:407: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsrd':
> >> arch/powerpc/kernel/kvm.c:178: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsr':
>    arch/powerpc/kernel/kvm.c:231: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `epapr_hypercall0_1':
> >> arch/powerpc/include/asm/epapr_hcalls.h:511: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/mm/mem.o: in function `execmem_arch_setup':
> >> arch/powerpc/mm/mem.c:423: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_15':
> >> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_14':
> >> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_13':
> >> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/mm/init-common.o:arch/powerpc/mm/init-common.c:81: more undefined references to `memset' follow
>    powerpc-linux-ld: arch/powerpc/lib/pmem.o: in function `memcpy_flushcache':
> >> arch/powerpc/lib/pmem.c:84: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/sysdev/fsl_mpic_err.o: in function `mpic_setup_error_int':
> >> arch/powerpc/sysdev/fsl_mpic_err.c:70: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/platforms/8xx/pic.o: in function `irq_domain_create_linear':
> >> include/linux/irqdomain.h:405: undefined reference to `memset'
>    powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1.o: in function `cpm1_clk_setup':
>    arch/powerpc/platforms/8xx/cpm1.c:251: undefined reference to `memcpy'
>    powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1-ic.o: in function `irq_domain_create_linear':
>    include/linux/irqdomain.h:405: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_newtask':
>    include/trace/events/task.h:9: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_rename':
>    include/trace/events/task.h:34: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `copy_struct_from_user':
>    include/linux/uaccess.h:396: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
>    kernel/fork.c:2800: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `mm_init':
>    kernel/fork.c:1044: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `bitmap_zero':
>    include/linux/bitmap.h:238: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `pgd_alloc':
>    arch/powerpc/include/asm/nohash/pgalloc.h:26: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `__kmem_cache_create':
>    include/linux/slab.h:379: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `arch_dup_task_struct':
>    kernel/fork.c:854: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `mm_alloc':
>    kernel/fork.c:1120: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
>    kernel/fork.c:1238: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `copy_process':
>    kernel/fork.c:2030: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `posix_cputimers_init':
>    include/linux/posix-timers.h:103: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `copy_sighand':
>    kernel/fork.c:1618: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `copy_signal':
>    kernel/fork.c:1687: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `dup_mm':
>    kernel/fork.c:1483: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/fork.o: in function `create_io_thread':
>    kernel/fork.c:2549: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `kernel_thread':
>    kernel/fork.c:2661: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `user_mode_thread':
>    kernel/fork.c:2678: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `sys_fork':
>    kernel/fork.c:2692: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o: in function `sys_vfork':
>    kernel/fork.c:2707: undefined reference to `memset'
>    powerpc-linux-ld: kernel/fork.o:kernel/fork.c:2740: more undefined references to `memset' follow
>    powerpc-linux-ld: kernel/softirq.o: in function `do_trace_event_raw_event_irq_handler_entry':
>    include/trace/events/irq.h:53: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/resource.o: in function `find_next_iomem_res':
>    kernel/resource.c:372: undefined reference to `memset'
>    powerpc-linux-ld: kernel/resource.o: in function `__request_region_locked':
>    kernel/resource.c:1261: undefined reference to `memset'
>    powerpc-linux-ld: kernel/resource.o: in function `reserve_setup':
>    kernel/resource.c:1757: undefined reference to `memset'
>    powerpc-linux-ld: kernel/resource.c:1760: undefined reference to `memset'
>    powerpc-linux-ld: kernel/sysctl.o: in function `proc_put_long':
>    kernel/sysctl.c:339: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sysctl.o: in function `_proc_do_string':
>    kernel/sysctl.c:127: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sysctl.o: in function `proc_get_long':
>    kernel/sysctl.c:284: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sysctl.o: in function `bitmap_copy':
>    include/linux/bitmap.h:259: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sysctl.o: in function `proc_do_static_key':
>    kernel/sysctl.c:1433: undefined reference to `memset'
>    powerpc-linux-ld: kernel/capability.o: in function `__do_sys_capset':
>    kernel/capability.c:218: undefined reference to `memset'
>    powerpc-linux-ld: kernel/ptrace.o: in function `syscall_set_arguments':
>    arch/powerpc/include/asm/syscall.h:127: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/ptrace.o: in function `ptrace_get_syscall_info':
>    kernel/ptrace.c:998: undefined reference to `memset'
>    powerpc-linux-ld: kernel/ptrace.o: in function `copy_siginfo':
>    include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/user.o: in function `ratelimit_state_init':
>    include/linux/ratelimit.h:12: undefined reference to `memset'
>    powerpc-linux-ld: kernel/user.o: in function `__kmem_cache_create':
>    include/linux/slab.h:379: undefined reference to `memset'
>    powerpc-linux-ld: kernel/signal.o: in function `do_trace_event_raw_event_signal_generate':
>    include/trace/events/signal.h:50: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/signal.o: in function `clear_siginfo':
>    include/linux/signal.h:23: undefined reference to `memset'
>    powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
>    include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/signal.o: in function `do_sigaltstack':
>    kernel/signal.c:4396: undefined reference to `memset'
>    powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
>    include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/signal.o: in function `signals_init':
>    kernel/signal.c:5011: undefined reference to `memset'
>    powerpc-linux-ld: kernel/sys.o: in function `override_release':
>    kernel/sys.c:1331: undefined reference to `memset'
>    powerpc-linux-ld: kernel/sys.o: in function `__do_sys_newuname':
>    kernel/sys.c:1356: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sys.o: in function `__do_sys_uname':
>    kernel/sys.c:1380: undefined reference to `memcpy'
>    powerpc-linux-ld: kernel/sys.o: in function `prctl_set_auxv':
> 
> 
> vim +18 include/linux/signal.h
> 
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  14  
> ae7795bc6187a15 Eric W. Biederman 2018-09-25  15  static inline void copy_siginfo(kernel_siginfo_t *to,
> ae7795bc6187a15 Eric W. Biederman 2018-09-25  16  				const kernel_siginfo_t *from)
> ca9eb49aa9562ea James Hogan       2016-02-08  17  {
> ca9eb49aa9562ea James Hogan       2016-02-08 @18  	memcpy(to, from, sizeof(*to));
> ca9eb49aa9562ea James Hogan       2016-02-08  19  }
> ca9eb49aa9562ea James Hogan       2016-02-08  20  
> ae7795bc6187a15 Eric W. Biederman 2018-09-25  21  static inline void clear_siginfo(kernel_siginfo_t *info)
> 8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  22  {
> 8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24 @23  	memset(info, 0, sizeof(*info));
> 8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  24  }
> 8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  25  
> 4ce5f9c9e754691 Eric W. Biederman 2018-09-25  26  #define SI_EXPANSION_SIZE (sizeof(struct siginfo) - sizeof(struct kernel_siginfo))
> 4ce5f9c9e754691 Eric W. Biederman 2018-09-25  27  
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  28  static inline void copy_siginfo_to_external(siginfo_t *to,
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  29  					    const kernel_siginfo_t *from)
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  30  {
> fa4751f454e6b51 Eric W. Biederman 2020-05-05 @31  	memcpy(to, from, sizeof(*from));
> fa4751f454e6b51 Eric W. Biederman 2020-05-05 @32  	memset(((char *)to) + sizeof(struct kernel_siginfo), 0,
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  33  		SI_EXPANSION_SIZE);
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  34  }
> fa4751f454e6b51 Eric W. Biederman 2020-05-05  35  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

