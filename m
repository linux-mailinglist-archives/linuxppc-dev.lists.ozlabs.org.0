Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D780E2588E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:21:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgdlv6kP0zDqQh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgdjZ6LJqzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:19:14 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79176AD29;
 Tue,  1 Sep 2020 07:19:11 +0000 (UTC)
Date: Tue, 1 Sep 2020 09:19:08 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v11] Fixup for "powerpc/vdso: Provide
 __kernel_clock_gettime64() on vdso32"
Message-ID: <20200901071908.GF29521@kitsune.suse.cz>
References: <7b3e35bdf93b93f3f1f0dcb4e1f373ce3b8a0035.1598938114.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b3e35bdf93b93f3f1f0dcb4e1f373ce3b8a0035.1598938114.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

can you add Fixes: ?

Thanks

Michal

On Tue, Sep 01, 2020 at 05:28:57AM +0000, Christophe Leroy wrote:
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/vdso/gettimeofday.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
> index 59a609a48b63..8da84722729b 100644
> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -186,6 +186,8 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
>  #else
>  int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
>  			     const struct vdso_data *vd);
> +int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
> +			       const struct vdso_data *vd);
>  int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>  			    const struct vdso_data *vd);
>  #endif
> -- 
> 2.25.0
> 
