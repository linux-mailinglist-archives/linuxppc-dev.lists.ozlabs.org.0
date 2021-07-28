Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2FB3D90E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 16:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZc293x8Bz3cl2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 00:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=hfec=mu=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZc1n6M3Jz307m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 00:46:53 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4215C60527;
 Wed, 28 Jul 2021 14:46:49 +0000 (UTC)
Date: Wed, 28 Jul 2021 10:46:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 2/7] kallsyms: Fix address-checks for kernel related
 range
Message-ID: <20210728104642.7ae75442@oasis.local.home>
In-Reply-To: <20210728081320.20394-3-wangkefeng.wang@huawei.com>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
 <20210728081320.20394-3-wangkefeng.wang@huawei.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 ryabinin.a.a@gmail.com, arnd@arndb.de,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 ast@kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 mingo@redhat.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jul 2021 16:13:15 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> The is_kernel_inittext/is_kernel_text/is_kernel function should not
> include the end address(the labels _einittext, _etext and _end) when
> check the address range, the issue exists since Linux v2.6.12.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> ---
>  include/linux/kallsyms.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index 2a241e3f063f..b016c62f30a6 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -27,21 +27,21 @@ struct module;
>  static inline int is_kernel_inittext(unsigned long addr)
>  {
>  	if (addr >= (unsigned long)_sinittext
> -	    && addr <= (unsigned long)_einittext)
> +	    && addr < (unsigned long)_einittext)
>  		return 1;
>  	return 0;
>  }
>  
>  static inline int is_kernel_text(unsigned long addr)
>  {
> -	if ((addr >= (unsigned long)_stext && addr <= (unsigned long)_etext))
> +	if ((addr >= (unsigned long)_stext && addr < (unsigned long)_etext))
>  		return 1;
>  	return in_gate_area_no_mm(addr);
>  }
>  
>  static inline int is_kernel(unsigned long addr)
>  {
> -	if (addr >= (unsigned long)_stext && addr <= (unsigned long)_end)
> +	if (addr >= (unsigned long)_stext && addr < (unsigned long)_end)
>  		return 1;
>  	return in_gate_area_no_mm(addr);
>  }

