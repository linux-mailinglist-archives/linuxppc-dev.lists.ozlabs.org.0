Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A120EAF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 03:31:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wmzJ2lJjzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wmwY5kygzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:29:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=klXYTE8w; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wmwY0ngrz9sDX;
 Tue, 30 Jun 2020 11:29:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593480541;
 bh=sO4yMS1A2SFbDoE7ljp73eC5quNBLazBAQZ5GXL7cPE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=klXYTE8wct8ju2z/MZ7O3QIEO6iBhY530LxsxGishzWu1BwXpZBg1tJwXzLtjnNZ6
 moG0u0gJLwMe/6QxC+tEtX0kPD8vuwctfKS1fRoeL6vuUFVbOHm4/+y5A1S8nVYKQx
 deeLYzfMoEgKYx7fpT5Cy7/c4SDNd/vmSydNr2BTdOlKJ0XUKkfe9kqi8tBrnxGECK
 QXPHsfc2b0jfjshQLmoXp1agsfTbPc7h59LDqYEdTSDrGcWLupWvYlRxmhyTWHK8Dk
 UD+DZ6EJFuXFEqUSJ3tTzhNPSPYgTeHteuvPCN1+Hgym2aBAosUI7hDpx84aMb2r+e
 5XJSB4EnEgoLg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] powerpc: inline doorbell sending functions
In-Reply-To: <202006280326.fcRFUNzs%lkp@intel.com>
References: <20200627150428.2525192-2-npiggin@gmail.com>
 <202006280326.fcRFUNzs%lkp@intel.com>
Date: Tue, 30 Jun 2020 11:31:15 +1000
Message-ID: <87zh8l7318.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, Anton Blanchard <anton@linux.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:
> Hi Nicholas,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on scottwood/next v5.8-rc2 next-20200626]
> [cannot apply to kvm-ppc/kvm-ppc-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-pseries-IPI-doorbell-improvements/20200627-230544
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-randconfig-c003-20200628 (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from arch/powerpc/kernel/asm-offsets.c:38:
>    arch/powerpc/include/asm/dbell.h: In function 'doorbell_global_ipi':
>>> arch/powerpc/include/asm/dbell.h:114:12: error: implicit declaration of function 'get_hard_smp_processor_id'; did you mean 'raw_smp_processor_id'? [-Werror=implicit-function-declaration]
>      114 |  u32 tag = get_hard_smp_processor_id(cpu);
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>          |            raw_smp_processor_id
>    arch/powerpc/include/asm/dbell.h: In function 'doorbell_try_core_ipi':
>>> arch/powerpc/include/asm/dbell.h:146:28: error: implicit declaration of function 'cpu_sibling_mask'; did you mean 'cpu_online_mask'? [-Werror=implicit-function-declaration]
>      146 |  if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
>          |                            ^~~~~~~~~~~~~~~~
>          |                            cpu_online_mask
>>> arch/powerpc/include/asm/dbell.h:146:28: warning: passing argument 2 of 'cpumask_test_cpu' makes pointer from integer without a cast [-Wint-conversion]
>      146 |  if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~

Seems like CONFIG_SMP=n is probably the root cause.

You could try including asm/smp.h, but good chance that will lead to
header soup.

Other option would be to wrap the whole lot in #ifdef CONFIG_SMP?

cheers
