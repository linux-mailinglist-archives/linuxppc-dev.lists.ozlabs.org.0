Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351B72F28C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:22:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aHfGPzSz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgq1w0Kpgz306B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 12:22:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aHfGPzSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgq0y5XZQz300R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 12:21:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB6E7602DD;
	Wed, 14 Jun 2023 02:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07036C433C8;
	Wed, 14 Jun 2023 02:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686709276;
	bh=1233ZXGXQFsQqyKN4SMgVEKVrMyXgWIXoP8CWIHdab8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHfGPzSzYan4Zl5/64jVKdxEcdleJZ1HToAvQha1DxXdthJq4LAwUwuMmdhcc/3t2
	 qjqW0fQrJxHwwLzDRIdqPQzxRM09npWTmwxZdcwcuqy3SsWwPInxRpofJiYGeZcTU+
	 fA0+QcMLa6GJL24vE4vakuVs+5HouglFyVhBlsiAeFGIzbF0h8DtQVEkTGTpU3uwgK
	 pgxN8qrdCoc57u3WCL8CKFMqrYIHY8GulFJ5ohzAhAoJmaK10GBvwvNa47Hp9uCH6t
	 WpAlxI/XpJ0S5nLFL8a9Iz8/8+w9Iie9VfeC6s7VUzxtMz2cM1RZjoUtJt5SKIFLtq
	 YwRbM80cYluvg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 6153F40692; Tue, 13 Jun 2023 23:21:13 -0300 (-03)
Date: Tue, 13 Jun 2023 23:21:13 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 06/17] tools/perf/tests: Fix shellcheck warnings for
 trace+probe_vfs_getname.sh
Message-ID: <ZIkkGSmS1luuBGkb@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-7-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613164145.50488-7-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: Saket <skb99@linux.vnet.ibm.com>, irogers@google.com, maddy@linux.ibm.com, Avnish Chouhan <avnish@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, Akanksha J N <akanksha@linux.ibm.com>, linux-perf-users@vger.kernel.org, Abhishek Singh Tomar <abhishek@linux.ibm.com>, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 13, 2023 at 10:11:34PM +0530, Athira Rajeev escreveu:
> From: Akanksha J N <akanksha@linux.ibm.com>
> 
> Fix the shellcheck warnings on powerpc and x86 for testcase
> trace+probe_vfs_getname.sh. Add quotes to prevent word splitting
> which are caused by unquoted command expansions.
> 
> Before fix:
> 
> $ shellcheck -S warning trace+probe_vfs_getname.sh
> 
> 	In trace+probe_vfs_getname.sh line 13:
> 	. $(dirname $0)/lib/probe.sh
> 	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
> 
> 	In trace+probe_vfs_getname.sh line 18:
> 	. $(dirname $0)/lib/probe_vfs_getname.sh
> 	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
> 
> 	In trace+probe_vfs_getname.sh line 21:
> 		evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
> 		            ^-- SC2046 (warning): Quote this to prevent word splitting.
> 
> 	100: Check open filename arg using perf trace + vfs_getname          : Ok
> 
> After the fix:
> 
> $ shellcheck -S warning trace+probe_vfs_getname.sh
> 
> 	100: Check open filename arg using perf trace + vfs_getname          : Ok

So, I tried this on x86_64, fedora and get:

[root@quaco ~]# perf test "trace + vfs"
115: Check open filename arg using perf trace + vfs_getname          : FAILED!
[root@quaco ~]# 

Then, looking at the change:


> -	evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
> +	evts=$(echo "$(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/')" | sed 's/ /,/')

So, before:

[root@quaco ~]# evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
[root@quaco ~]# echo $evts
open,openat
[root@quaco ~]#

Then after:

[root@quaco ~]# evts=$(echo "$(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/')" | sed 's/ /,/')
[root@quaco ~]# echo $evts
open openat
[root@quaco ~]#

Not equivalent, so I'm removing this patch, please check and resubmit,
please.

- Arnaldo

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Signed-off-by: Akanksha J N <akanksha@linux.ibm.com>
> Signed-off-by: Abhishek Singh Tomar <abhishek@linux.ibm.com>
> Signed-off-by: Saket <skb99@linux.vnet.ibm.com>
> Signed-off-by: Avnish Chouhan <avnish@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/trace+probe_vfs_getname.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/trace+probe_vfs_getname.sh b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> index 0a4bac3dd77e..935eac7efa47 100755
> --- a/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/trace+probe_vfs_getname.sh
> @@ -10,15 +10,15 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
>  
> -. $(dirname $0)/lib/probe.sh
> +. "$(dirname $0)"/lib/probe.sh
>  
>  skip_if_no_perf_probe || exit 2
>  skip_if_no_perf_trace || exit 2
>  
> -. $(dirname $0)/lib/probe_vfs_getname.sh
> +. "$(dirname $0)"/lib/probe_vfs_getname.sh
>  
>  trace_open_vfs_getname() {
> -	evts=$(echo $(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/') | sed 's/ /,/')
> +	evts=$(echo "$(perf list syscalls:sys_enter_open* 2>/dev/null | grep -E 'open(at)? ' | sed -r 's/.*sys_enter_([a-z]+) +\[.*$/\1/')" | sed 's/ /,/')
>  	perf trace -e $evts touch $file 2>&1 | \
>  	grep -E " +[0-9]+\.[0-9]+ +\( +[0-9]+\.[0-9]+ ms\): +touch\/[0-9]+ open(at)?\((dfd: +CWD, +)?filename: +${file}, +flags: CREAT\|NOCTTY\|NONBLOCK\|WRONLY, +mode: +IRUGO\|IWUGO\) += +[0-9]+$"
>  }
> -- 
> 2.39.1
> 

-- 

- Arnaldo
