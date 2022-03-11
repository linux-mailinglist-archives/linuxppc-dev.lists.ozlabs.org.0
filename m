Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E84D6755
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 18:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFXcS6fgmz30RS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 04:15:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFXc10GLYz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:14:41 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KFXc03cN7z4xLR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:14:40 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KFXbx5yxHz4xLT; Sat, 12 Mar 2022 04:14:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KFXbx3zqKz4xLR
 for <linuxppc-dev@ozlabs.org>; Sat, 12 Mar 2022 04:14:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFXbs1R3lz9sSC;
 Fri, 11 Mar 2022 18:14:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rwW2T1FTTMD; Fri, 11 Mar 2022 18:14:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFXbs0Y6Dz9sSB;
 Fri, 11 Mar 2022 18:14:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01D718B78F;
 Fri, 11 Mar 2022 18:14:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OywPQEhlSiaT; Fri, 11 Mar 2022 18:14:32 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 810ED8B763;
 Fri, 11 Mar 2022 18:14:32 +0100 (CET)
Message-ID: <4f1c7f08-a7ae-973d-fd54-e61d8f933418@csgroup.eu>
Date: Fri, 11 Mar 2022 18:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [FIX PATCH v1] powerpc/pseries: Fix reference count leak during
 CPU unplug
Content-Language: fr-FR
To: Bharata B Rao <bharata@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
References: <1489034268-24888-1-git-send-email-bharata@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1489034268-24888-1-git-send-email-bharata@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: sachinp@linux.vnet.ibm.com, nfont@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2017 à 05:37, Bharata B Rao a écrit :
> The following warning is seen when a CPU is hot unplugged on a PowerKVM
> guest:
> 
> refcount_t: underflow; use-after-free.
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 53 at lib/refcount.c:128 refcount_sub_and_test+0xd8/0xf0
> Modules linked in:
> CPU: 0 PID: 53 Comm: kworker/u510:1 Not tainted 4.11.0-rc1 #3
> Workqueue: pseries hotplug workque pseries_hp_work_fn
> task: c0000000fb475000 task.stack: c0000000fb81c000
> NIP: c0000000006f0808 LR: c0000000006f0804 CTR: c0000000007b98c0
> REGS: c0000000fb81f710 TRAP: 0700   Not tainted  (4.11.0-rc1)
> MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>
>    CR: 48002222  XER: 20000000
> CFAR: c000000000c438e0 SOFTE: 1
> GPR00: c0000000006f0804 c0000000fb81f990 c000000001573b00 0000000000000026
> GPR04: 0000000000000000 000000000000016c 667265652e0d0a73 652d61667465722d
> GPR08: 0000000000000007 0000000000000007 0000000000000001 0000000000000006
> GPR12: 0000000000002200 c00000000ff40000 c00000000010c578 c0000001f11b9f40
> GPR16: c0000001fe0312a8 c0000001fe031078 c0000001fe031020 0000000000000001
> GPR20: 0000000000000000 0000000000000000 c000000001454808 fffffffffffffef7
> GPR24: 0000000000000000 c0000001f1677648 0000000000000000 0000000000000000
> GPR28: 0000000010000008 c000000000e4d3d8 0000000000000000 c0000001eaae07d8
> NIP [c0000000006f0808] refcount_sub_and_test+0xd8/0xf0
> LR [c0000000006f0804] refcount_sub_and_test+0xd4/0xf0
> Call Trace:
> [c0000000fb81f990] [c0000000006f0804] refcount_sub_and_test+0xd4/0xf0 (unreliable)
> [c0000000fb81f9f0] [c0000000006d04b4] kobject_put+0x44/0x2a0
> [c0000000fb81fa70] [c0000000009d5284] of_node_put+0x34/0x50
> [c0000000fb81faa0] [c0000000000aceb8] dlpar_cpu_remove_by_index+0x108/0x130
> [c0000000fb81fb30] [c0000000000ae128] dlpar_cpu+0x78/0x550
> [c0000000fb81fbe0] [c0000000000a7b40] handle_dlpar_errorlog+0xc0/0x160
> [c0000000fb81fc50] [c0000000000a7c74] pseries_hp_work_fn+0x94/0xa0
> [c0000000fb81fc80] [c000000000102cec] process_one_work+0x23c/0x540
> [c0000000fb81fd20] [c00000000010309c] worker_thread+0xac/0x620
> [c0000000fb81fdc0] [c00000000010c6c4] kthread+0x154/0x1a0
> [c0000000fb81fe30] [c00000000000bbe0] ret_from_kernel_thread+0x5c/0x7c
> 
> Fix this by ensuring that of_node_put() is called only from the
> error path in dlpar_cpu_remove_by_index(). In the normal path,
> of_node_put() happens as part of dlpar_detach_node().
> 
> Signed-off-by: Bharata B Rao <bharata@linux.vnet.ibm.com>
> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>


Is this patch still needed ?

Thanks
Christophe





> ---
> Changes in v1:
> - Fixed the refcount problem in the userspace driven unplug path
>    in addition to in-kernel unplug path. (Sachin Sant)
> 
> v0: https://patchwork.ozlabs.org/patch/736547/
> 
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 7bc0e91..c5ed510 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -619,7 +619,8 @@ static int dlpar_cpu_remove_by_index(u32 drc_index)
>   	}
>   
>   	rc = dlpar_cpu_remove(dn, drc_index);
> -	of_node_put(dn);
> +	if (rc)
> +		of_node_put(dn);
>   	return rc;
>   }
>   
> @@ -856,9 +857,12 @@ static ssize_t dlpar_cpu_release(const char *buf, size_t count)
>   	}
>   
>   	rc = dlpar_cpu_remove(dn, drc_index);
> -	of_node_put(dn);
> -
> -	return rc ? rc : count;
> +	if (rc) {
> +		of_node_put(dn);
> +		return rc;
> +	} else {
> +		return count;
> +	}
>   }
>   
>   #endif /* CONFIG_ARCH_CPU_PROBE_RELEASE */
