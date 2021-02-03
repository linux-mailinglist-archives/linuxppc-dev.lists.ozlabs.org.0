Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CC30DE37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 16:34:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW5Lz17nkzDyyh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 02:34:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WmwltSqC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW5JW6J68zDws5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 02:31:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29A7264E22;
 Wed,  3 Feb 2021 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612366312;
 bh=dB0FrxZ9jb6QIctdN2xvdkaRYOvyG1RZvuwpNtUXA98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WmwltSqCb2ETH8e/H1eVmidN/P2pIu+DB1jVVvfgJZMCewbvdnInqNZEf5ut1fkwA
 lgFH6+WkmmlS/LhJkljpEviFxXxCW7Np8UsyXLmICx5kdUPAd30fyMzCv36IfFNCi1
 +wCtjHAxjU5chskDD1tk/LQvGhNxBFd+6O6O4ys7tbdPYNOiS6E4d33nVImjroDBCi
 6hYBHBXz51dq7Fff6LEFGw2oj4j8D6eZm5Z54AlXVlHc9pQ0Sa6N/KlMTPKVRWl7KS
 H8haXjMm0Q7rB+n+6A1tTyPAa9ibz/4W0fLUVVwyAgZ8UT6XWuHi88ijl4eZ3h481e
 L3NYW5GL4k2Bw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id D36BA40513; Wed,  3 Feb 2021 12:31:48 -0300 (-03)
Date: Wed, 3 Feb 2021 12:31:48 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf: Fix powerpc gap between kernel end and
 module start
Message-ID: <20210203153148.GC854763@kernel.org>
References: <1609208054-1566-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20210112093811.GA1272772@krava>
 <dd8b772b-fa13-975b-be42-2b7bdf14b46d@linux.ibm.com>
 <1D564116-5FAC-4775-BEB2-4D5B837080D6@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D564116-5FAC-4775-BEB2-4D5B837080D6@linux.vnet.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@redhat.com>,
 Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Feb 02, 2021 at 04:02:36PM +0530, Athira Rajeev escreveu:
> 
> 
>     On 18-Jan-2021, at 3:51 PM, kajoljain <kjain@linux.ibm.com> wrote:
> 
> 
> 
>     On 1/12/21 3:08 PM, Jiri Olsa wrote:
> 
>         On Mon, Dec 28, 2020 at 09:14:14PM -0500, Athira Rajeev wrote:
> 
>         SNIP
> 
> 
>             c000000002799370 b backtrace_flag
>             c000000002799378 B radix_tree_node_cachep
>             c000000002799380 B __bss_stop
>             c0000000027a0000 B _end
>             c008000003890000 t icmp_checkentry      [ip_tables]
>             c008000003890038 t ipt_alloc_initial_table      [ip_tables]
>             c008000003890468 T ipt_do_table [ip_tables]
>             c008000003890de8 T ipt_unregister_table_pre_exit        [ip_tables]
>             ...
> 
>             Perf calls function symbols__fixup_end() which sets the end of
>             symbol
>             to 0xc008000003890000, which is the next address and this is the
>             start
>             address of first module (icmp_checkentry in above) which will make
>             the
>             huge symbol size of 0x80000010f0000.
> 
>             After symbols__fixup_end:
>             symbols__fixup_end: sym->name: _end, sym->start:
>             0xc0000000027a0000,
>             sym->end: 0xc008000003890000
> 
>             On powerpc, kernel text segment is located at 0xc000000000000000
>             whereas the modules are located at very high memory addresses,
>             0xc00800000xxxxxxx. Since the gap between end of kernel text
>             segment
>             and beginning of first module's address is high, histogram
>             allocation
>             using calloc fails.
> 
>             Fix this by detecting the kernel's last symbol and limiting
>             the range of last kernel symbol to pagesize.
> 
> 
>     Patch looks good to me.
> 
>     Tested-By: Kajol Jain<kjain@linux.ibm.com>
> 
>     Thanks,
>     Kajol Jain
> 
> 
>             Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> 
> 
>         I can't test, but since the same approach works for arm and s390,
>         this also looks ok
> 
>         Acked-by: Jiri Olsa <jolsa@redhat.com>
> 
>         thanks,
>         jirka
> 
> 
> Hi Arnaldo,
> 
> Can you please help review this patch and merge if this looks good..

Thanks, collected the Tested-by from Kajol and the Acked-by from Jiri
and applied to my local tree for testing, then up to my perf/core
branch.

- Arnaldo
