Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DBC361469
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 23:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLtXY6TXyz3c0Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1537 seconds by postgrey-1.36 at boromir;
 Fri, 16 Apr 2021 01:04:47 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLjLR6CmSz2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 01:04:47 +1000 (AEST)
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1lX37j-000708-Ga; Thu, 15 Apr 2021 16:37:39 +0200
Received: from [85.7.101.30] (helo=pc-6.home)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1lX37i-000EJ3-8n; Thu, 15 Apr 2021 16:37:38 +0200
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Jianlin Lv <Jianlin.Lv@arm.com>, bpf@vger.kernel.org
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
Date: Thu, 15 Apr 2021 16:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.4/26141/Thu Apr 15 13:13:26 2021)
X-Mailman-Approved-At: Fri, 16 Apr 2021 07:58:52 +1000
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
Cc: irogers@google.com, songliubraving@fb.com, catalin.marinas@arm.com,
 linux-doc@vger.kernel.org, zlim.lnx@gmail.com, paul.walmsley@sifive.com,
 ast@kernel.org, andrii@kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, illusionist.neo@gmail.com,
 maheshb@google.com, will@kernel.org, nicolas.dichtel@6wind.com,
 linux-s390@vger.kernel.org, iii@linux.ibm.com, paulburton@kernel.org,
 corbet@lwn.net, mchehab+huawei@kernel.org, masahiroy@kernel.org,
 x86@kernel.org, john.fastabend@gmail.com, linux@armlinux.org.uk,
 linux-riscv@lists.infradead.org, borntraeger@de.ibm.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, naveen.n.rao@linux.ibm.com,
 kuba@kernel.org, tklauser@distanz.ch, linux-mips@vger.kernel.org,
 grantseltzer@gmail.com, xi.wang@gmail.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, gor@linux.ibm.com, luke.r.nels@gmail.com,
 linux-kernel@vger.kernel.org, hca@linux.ibm.com, kpsingh@kernel.org,
 iecedge@gmail.com, horms@verge.net.au, bp@alien8.de, viro@zeniv.linux.org.uk,
 yhs@fb.com, tglx@linutronix.de, dvyukov@google.com, tsbogend@alpha.franken.de,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 udknight@gmail.com, kafai@fb.com, bjorn@kernel.org, palmer@dabbelt.com,
 quentin@isovalent.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/15/21 11:32 AM, Jianlin Lv wrote:
> For debugging JITs, dumping the JITed image to kernel log is discouraged,
> "bpftool prog dump jited" is much better way to examine JITed dumps.
> This patch get rid of the code related to bpf_jit_enable=2 mode and
> update the proc handler of bpf_jit_enable, also added auxiliary
> information to explain how to use bpf_jit_disasm tool after this change.
> 
> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
[...]
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> index 0a7a2870f111..8d36b4658076 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2566,9 +2566,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   		cond_resched();
>   	}
>   
> -	if (bpf_jit_enable > 1)
> -		bpf_jit_dump(prog->len, proglen, pass + 1, image);
> -
>   	if (image) {
>   		bpf_jit_binary_lock_ro(header);
>   		prog->bpf_func = (void *)image;
> diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> index c8496c1142c9..990b1720c7a4 100644
> --- a/net/core/sysctl_net_core.c
> +++ b/net/core/sysctl_net_core.c
> @@ -273,16 +273,8 @@ static int proc_dointvec_minmax_bpf_enable(struct ctl_table *table, int write,
>   
>   	tmp.data = &jit_enable;
>   	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> -	if (write && !ret) {
> -		if (jit_enable < 2 ||
> -		    (jit_enable == 2 && bpf_dump_raw_ok(current_cred()))) {
> -			*(int *)table->data = jit_enable;
> -			if (jit_enable == 2)
> -				pr_warn("bpf_jit_enable = 2 was set! NEVER use this in production, only for JIT debugging!\n");
> -		} else {
> -			ret = -EPERM;
> -		}
> -	}
> +	if (write && !ret)
> +		*(int *)table->data = jit_enable;
>   	return ret;
>   }
>   
> @@ -389,7 +381,7 @@ static struct ctl_table net_core_table[] = {
>   		.extra2		= SYSCTL_ONE,
>   # else
>   		.extra1		= SYSCTL_ZERO,
> -		.extra2		= &two,
> +		.extra2		= SYSCTL_ONE,
>   # endif
>   	},
>   # ifdef CONFIG_HAVE_EBPF_JIT
> diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
> index c8ae95804728..efa4b17ae016 100644
> --- a/tools/bpf/bpf_jit_disasm.c
> +++ b/tools/bpf/bpf_jit_disasm.c
> @@ -7,7 +7,7 @@
>    *
>    * To get the disassembly of the JIT code, do the following:
>    *
> - *  1) `echo 2 > /proc/sys/net/core/bpf_jit_enable`
> + *  1) Insert bpf_jit_dump() and recompile the kernel to output JITed image into log

Hmm, if we remove bpf_jit_dump(), the next drive-by cleanup patch will be thrown
at bpf@vger stating that bpf_jit_dump() has no in-tree users and should be removed.
Maybe we should be removing bpf_jit_disasm.c along with it as well as bpf_jit_dump()
itself ... I guess if it's ever needed in those rare occasions for JIT debugging we
can resurrect it from old kernels just locally. But yeah, bpftool's jit dump should
suffice for vast majority of use cases.

There was a recent set for ppc32 jit which was merged into ppc tree which will create
a merge conflict with this one [0]. So we would need a rebase and take it maybe during
merge win once the ppc32 landed..

   [0] https://lore.kernel.org/bpf/cover.1616430991.git.christophe.leroy@csgroup.eu/

>    *  2) Load a BPF filter (e.g. `tcpdump -p -n -s 0 -i eth1 host 192.168.20.0/24`)
>    *  3) Run e.g. `bpf_jit_disasm -o` to read out the last JIT code
>    *
> diff --git a/tools/bpf/bpftool/feature.c b/tools/bpf/bpftool/feature.c
> index 40a88df275f9..98c7eec2923f 100644
> --- a/tools/bpf/bpftool/feature.c
> +++ b/tools/bpf/bpftool/feature.c
> @@ -203,9 +203,6 @@ static void probe_jit_enable(void)
>   		case 1:
>   			printf("JIT compiler is enabled\n");
>   			break;
> -		case 2:
> -			printf("JIT compiler is enabled with debugging traces in kernel logs\n");
> -			break;

This would still need to be there for older kernels ...

>   		case -1:
>   			printf("Unable to retrieve JIT-compiler status\n");
>   			break;
> 

