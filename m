Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DBD8BAE95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 16:10:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KM4XIarb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWCPl6Lp9z3dGt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 00:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=KM4XIarb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWCNw2rv3z3clb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 00:09:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1714745381;
	bh=+fi7fUfomErHHAmvDww2p/WTBqGy/yFZDfIKZxnytjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KM4XIarbWLiqP+rTdHhYP4ADp2FfBPZJESIvebE/x46r3wpaPNaKYYJ8DjRuiR4XK
	 lgnUuJtE42KneR0ACxiqLQ5uJD/S7BK84VwhVwYe9egEdoAzvtQwKV4FeMNTpP6GjL
	 22eK/o3npUywdzgLbvtpx7d4AZBFjdzVsbPnc49I=
Date: Fri, 3 May 2024 16:09:40 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <4cda5d2d-dd92-44ef-9e7b-7b780ec795ab@t-8ch.de>
References: <CGME20240423075608eucas1p265e7c90f3efd6995cb240b3d2688b803@eucas1p2.samsung.com>
 <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240503090332.irkiwn73dgznjflz@joelS2.panther.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503090332.irkiwn73dgznjflz@joelS2.panther.com>
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey Joel,

On 2024-05-03 11:03:32+0000, Joel Granados wrote:
> Here is my feedback for your outstanding constification patches [1] and [2].

Thanks!

> # You need to split the patch
> The answer that you got from Jakub in the network subsystem is very clear and
> baring a change of heart from the network folks, this will go in as but as a
> split patchset. Please split it considering the following:
> 1. Create a different patchset for drivers/,  fs/, kernel/, net, and a
>    miscellaneous that includes whatever does not fit into the others.
> 2. Consider that this might take several releases.
> 3. Consider the following sufix for the interim function name "_const". Like in
>    kfree_const. Please not "_new".

Ack. "_new" was an intentionally unacceptable placeholder.

> 4. Please publish the final result somewhere. This is important so someone can
>    take over in case you need to stop.

Will do. Both for each single series and a combination of all of them.

> 5. Consistently mention the motivation in your cover letters. I specify more
>    further down in "#Motivation".
> 6. Also mention that this is part of a bigger effort (like you did in your
>    original cover letters). I would include [3,4,5,6]
> 7. Include a way to show what made it into .rodata. I specify more further down
>    in "#Show the move".
> 
> # Motivation
> As I read it, the motivation for these constification efforts are:
> 1. It provides increased safety: Having things in .rodata section reduces the
>    attack surface. This is especially relevant for structures that have function
>    pointers (like ctl_table); having these in .rodata means that these pointers
>    always point to the "intended" function and cannot be changed.
> 2. Compiler optimizations: This was just a comment in the patchsets that I have
>    mentioned ([3,4,5]). Do you know what optimizations specifically? Does it
>    have to do with enhancing locality for the data in .rodata? Do you have other
>    specific optimizations in mind?

I don't know about anything that would make it faster.
It's more about safety and transmission of intent to API users,
especially callback implementers.

> 3. Readability: because it is easier to know up-front that data is not supposed
>    to change or its obvious that a function is re-entrant. Actually a lot of the
>    readability reasons is about knowing things "up-front".
> As we move forward with the constification in sysctl, please include a more
> detailed motivation in all your cover letters. This helps maintainers (that
> don't have the context) understand what you are trying to do. It does not need
> to be my three points, but it should be more than just "put things into
> .rodata". Please tell me if I have missed anything in the motivation.

Will do.

> # Show the move
> I created [8] because there is no easy way to validate which objects made it
> into .rodata. I ran [8] for your Dec 2nd patcheset [7] and there are less in
> .rodata than I expected (the results are in [9]) Why is that? Is it something
> that has not been posted to the lists yet? 

Constifying the APIs only *allows* the actual table to be constified
themselves.
Then each table definition will have to be touched and "const" added.

See patches 17 and 18 in [7] for two examples.

Some tables in net/ are already "const" as the static definitions are
never registered themselves but only their copies are.

This seems to explain your findings.

> Best

Thanks!

> [1] https://lore.kernel.org/all/20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net/
> [2] https://lore.kernel.org/all/20240418-sysctl-const-table-arg-v2-1-4012abc31311@weissschuh.net
> [3] [PATCH v2 00/14] ASoC: Constify local snd_sof_dsp_ops
>     https://lore.kernel.org/all/20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org
> [4] [PATCH v2 00/19] backlight: Constify lcd_ops
>     https://lore.kernel.org/all/20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org
> [5] [PATCH 1/4] iommu: constify pointer to bus_type
>     https://lore.kernel.org/all/20240216144027.185959-1-krzysztof.kozlowski@linaro.org
> [6] [PATCH 00/29] const xattr tables
>     https://lore.kernel.org/all/20230930050033.41174-1-wedsonaf@gmail.com
> [7] https://lore.kernel.org/all/20231204-const-sysctl-v2-0-7a5060b11447@weissschuh.net/
> 
> [8]

[snip]

> [9]
>     section: .rodata                obj_name : kern_table
>     section: .rodata                obj_name : sysctl_mount_point
>     section: .rodata                obj_name : addrconf_sysctl
>     section: .rodata                obj_name : ax25_param_table
>     section: .rodata                obj_name : mpls_table
>     section: .rodata                obj_name : mpls_dev_table
>     section: .data          obj_name : sld_sysctls
>     section: .data          obj_name : kern_panic_table
>     section: .data          obj_name : kern_exit_table
>     section: .data          obj_name : vm_table
>     section: .data          obj_name : signal_debug_table
>     section: .data          obj_name : usermodehelper_table
>     section: .data          obj_name : kern_reboot_table
>     section: .data          obj_name : user_table
>     section: .bss           obj_name : sched_core_sysctls
>     section: .data          obj_name : sched_fair_sysctls
>     section: .data          obj_name : sched_rt_sysctls
>     section: .data          obj_name : sched_dl_sysctls
>     section: .data          obj_name : printk_sysctls
>     section: .data          obj_name : pid_ns_ctl_table_vm
>     section: .data          obj_name : seccomp_sysctl_table
>     section: .data          obj_name : uts_kern_table
>     section: .data          obj_name : vm_oom_kill_table
>     section: .data          obj_name : vm_page_writeback_sysctls
>     section: .data          obj_name : page_alloc_sysctl_table
>     section: .data          obj_name : hugetlb_table
>     section: .data          obj_name : fs_stat_sysctls
>     section: .data          obj_name : fs_exec_sysctls
>     section: .data          obj_name : fs_pipe_sysctls
>     section: .data          obj_name : namei_sysctls
>     section: .data          obj_name : fs_dcache_sysctls
>     section: .data          obj_name : inodes_sysctls
>     section: .data          obj_name : fs_namespace_sysctls
>     section: .data          obj_name : dnotify_sysctls
>     section: .data          obj_name : inotify_table
>     section: .data          obj_name : epoll_table
>     section: .data          obj_name : aio_sysctls
>     section: .data          obj_name : locks_sysctls
>     section: .data          obj_name : coredump_sysctls
>     section: .data          obj_name : fs_shared_sysctls
>     section: .data          obj_name : fs_dqstats_table
>     section: .data          obj_name : root_table
>     section: .data          obj_name : pty_table
>     section: .data          obj_name : xfs_table
>     section: .data          obj_name : ipc_sysctls
>     section: .data          obj_name : key_sysctls
>     section: .data          obj_name : kernel_io_uring_disabled_table
>     section: .data          obj_name : tty_table
>     section: .data          obj_name : random_table
>     section: .data          obj_name : scsi_table
>     section: .data          obj_name : iwcm_ctl_table
>     section: .data          obj_name : net_core_table
>     section: .data          obj_name : netns_core_table
>     section: .bss           obj_name : nf_log_sysctl_table
>     section: .data          obj_name : nf_log_sysctl_ftable
>     section: .data          obj_name : vs_vars
>     section: .data          obj_name : vs_vars_table
>     section: .data          obj_name : ipv4_route_netns_table
>     section: .data          obj_name : ipv4_route_table
>     section: .data          obj_name : ip4_frags_ns_ctl_table
>     section: .data          obj_name : ip4_frags_ctl_table
>     section: .data          obj_name : ctl_forward_entry
>     section: .data          obj_name : ipv4_table
>     section: .data          obj_name : ipv4_net_table
>     section: .data          obj_name : unix_table
>     section: .data          obj_name : ipv6_route_table_template
>     section: .data          obj_name : ipv6_icmp_table_template
>     section: .data          obj_name : ip6_frags_ns_ctl_table
>     section: .data          obj_name : ip6_frags_ctl_table
>     section: .data          obj_name : ipv6_table_template
>     section: .data          obj_name : ipv6_rotable
>     section: .data          obj_name : sctp_net_table
>     section: .data          obj_name : sctp_table
>     section: .data          obj_name : smc_table
>     section: .data          obj_name : lowpan_frags_ns_ctl_table
>     section: .data          obj_name : lowpan_frags_ctl_table
