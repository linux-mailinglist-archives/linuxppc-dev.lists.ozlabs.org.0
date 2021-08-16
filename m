Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD53ED3F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 14:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpD5G2BVkz3cM2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 22:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IG6yzZHn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.25;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=IG6yzZHn; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpD4V5TQhz30L2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 22:29:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629116962;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=FxbcwOPiYU3UCC04T+4rOtzjTGFEtDMBuZ3tUtpOc5U=;
 b=IG6yzZHnDRkebCKK6/mUS8rf2SRKDgoQmFZvfMsYnsTsgd3VGiJ6QPM0PxDMI7yq57
 0vN7OpfTj5H69zrdWvEBaYaJgyJpSAYdVhWh4VeOMKCQ0zoaZ92TRw8Y0kK2+6xXYFoC
 5lMffGqE3xtcUR5TDCXUUXSjQsQZ0KsetV9pcAXeAgLD3TxhZK6wwFX1lt5lrK0D4/ut
 uzgEIuPoB8lAE0h33UMva0Afjf3lb5Az6pqjhsmQAaV73FIgX63PzTC1aBZcElxlllWB
 9FJ69iBJihyZxQWP8Nk3cfW+W1VJwY4TRpo/OCnF8JYqop7dD2NKRIqfKZRzqHakbWxm
 MMXg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgGcl1JmBEA1yGCL+d+0mk8mOaC3A=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 AUTH)
 with ESMTPSA id j01e29x7GCTLqfQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 16 Aug 2021 14:29:21 +0200 (CEST)
Subject: Re: [FSL P50x0] lscpu reports wrong values since the RC1 of kernel
 5.13
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <a7098505-2162-d3cc-b8f9-ef8c8a7d441f@xenosoft.de>
Message-ID: <c16c3747-8c6c-fb27-4e07-a893b83a5580@xenosoft.de>
Date: Mon, 16 Aug 2021 14:29:21 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a7098505-2162-d3cc-b8f9-ef8c8a7d441f@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, qemu-devel@nongnu.org,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I tested the RC6 of kernel 5.14 today and unfortunately the issue still 
exists. We have figured out that only P5040 SoCs are affected. [1]
P5020 SoCs display the correct values.
Please check the CPU changes in the PowerPC updates 5.13-1 and 5.13-2.

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=53775#p53775


On 09 August 2021 um 02:37 pm, Christian Zigotzky wrote:
> Hi All,
>
> Lscpu reports wrong values [1] since the RC1 of kernel 5.13 on my FSL 
> P5040 Cyrus+ board (A-EON AmigaOne X5000). [2]
> The differences are:
>
> Since the RC1 of kernel 5.13 (wrong values):
>
> Core(s) per socket: 1
> Socket(s): 3
>
> Before (correct values):
>
> Core(s) per socket: 4
> Socket(s): 1
>
> Through the wrong values, I can't use "-smp 4" with a virtual e5500 
> QEMU machine with KVM HV anymore.  [3]
> "-smp 3" works with KVM HV.
>
> Maybe the file_load_64 commit from the PowerPC updates 5.13-2 is the 
> problem ( powerpc/kexec_file: Use current CPU info while setting up 
> FDT). [4]
>
> Or maybe this change (PowerPC updates 5.13-1):
>
> -#ifdef CONFIG_PPC_BOOK3E_64
> -    state->ctx_state = exception_enter();
> -    if (user_mode(regs))
> -        account_cpu_user_entry();
> -#endif
>
> ---
>
> Or maybe this change (PowerPC updates 5.13-1):
>
> diff --git a/arch/powerpc/include/asm/smp.h 
> b/arch/powerpc/include/asm/smp.h
> index 7a13bc20f0a0c..03b3d010cbab6 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -31,6 +31,7 @@ extern u32 *cpu_to_phys_id;
>  extern bool coregroup_enabled;
>
>  extern int cpu_to_chip_id(int cpu);
> +extern int *chip_id_lookup_table;
>
>  #ifdef CONFIG_SMP
>
> @@ -121,6 +122,11 @@ static inline struct cpumask 
> *cpu_sibling_mask(int cpu)
>      return per_cpu(cpu_sibling_map, cpu);
>  }
>
> +static inline struct cpumask *cpu_core_mask(int cpu)
> +{
> +    return per_cpu(cpu_core_map, cpu);
> +}
> +
>  static inline struct cpumask *cpu_l2_cache_mask(int cpu)
>  {
>      return per_cpu(cpu_l2_cache_map, cpu);
>
> ---
>
> I have found a lot of other changes in the PowerPC updates 5.13-1 
> regarding the CPU.
>
> Could you please check the CPU changes in the PowerPC updates 5.13-1 
> and 5.13-2?
>
> Please find attached the kernel 5.14-rc5 config.
>
> Thanks,
> Christian
>
>
> [1]
>
> lscpu with the correct values before the RC1 of kernel 5.13:
>
> Architecture: ppc64
> CPU op-mode(s): 32-bit, 64-bit
> Byte Order: Big Endian
> CPU(s): 4
> On-line CPU(s) list: 0-3
> Thread(s) per core: 1
> Core(s) per socket: 4
> Socket(s): 1
> Model: 1.2 (pvr 8024 0012)
> Model name: e5500
> L1d cache: 128 KiB
> L1i cache: 128 KiB
> L2 cache: 2 MiB
> L3 cache: 2 MiB
> Vulnerability Itlb multihit: Not affected
> Vulnerability L1tf: Not affected
> Vulnerability Mds: Not affected
> Vulnerability Meltdown: Not affected
> Vulnerability Spec store bypass: Not affected
> Vulnerability Spectre v1: Mitigation; __user pointer sanitization
> Vulnerability Spectre v2: Mitigation; Branch predictor state flush
> Vulnerability Srbds: Not affected
> Vulnerability Tsx async abort: Not affected
>
> ---
>
> lscpu with the wrong values since the RC1 of kernel 5.13:
>
> Architecture: ppc64
> CPU op-mode(s): 32-bit, 64-bit
> Byte Order: Big Endian
> CPU(s): 4
> On-line CPU(s) list: 0-3
> Thread(s) per core: 1
> Core(s) per socket: 1
> Socket(s): 3
> Model: 1.2 (pvr 8024 0012)
> Model name: e5500
> L1d cache: 128 KiB
> L1i cache: 128 KiB
> L2 cache: 2 MiB
> L3 cache: 2 MiB
> Vulnerability Itlb multihit: Not affected
> Vulnerability L1tf: Not affected
> Vulnerability Mds: Not affected
> Vulnerability Meltdown: Not affected
> Vulnerability Spec store bypass: Not affected
> Vulnerability Spectre v1: Mitigation; __user pointer sanitization
> Vulnerability Spectre v2: Mitigation; Branch predictor state flush
> Vulnerability Srbds: Not affected
> Vulnerability Tsx async abort: Not affected
>
> ---
>
> [2] http://wiki.amiga.org/index.php?title=X5000
>
> [3] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-May/229103.html
>
> [4] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/kexec/file_load_64.c?id=ab159ac569fddf812c0a217d6dbffaa5d93ef88f

