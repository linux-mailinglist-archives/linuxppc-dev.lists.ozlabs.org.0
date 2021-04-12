Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBC35C6C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 14:55:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJpcX2SlMz3byK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 22:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=vincenzo.frascino@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FJpcD2gVLz30BV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:55:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82EA51FB;
 Mon, 12 Apr 2021 05:55:03 -0700 (PDT)
Received: from [10.37.12.6] (unknown [10.37.12.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E9C53F73B;
 Mon, 12 Apr 2021 05:55:00 -0700 (PDT)
Subject: Re: [PATCH RESEND v1 1/4] lib/vdso: Mark do_hres_timens() and
 do_coarse_timens() __always_inline()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <90dcf45ebadfd5a07f24241551c62f619d1cb930.1617209142.git.christophe.leroy@csgroup.eu>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <8b42e769-2f17-e2b4-4d2a-b86c4e412598@arm.com>
Date: Mon, 12 Apr 2021 13:54:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <90dcf45ebadfd5a07f24241551c62f619d1cb930.1617209142.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/31/21 5:48 PM, Christophe Leroy wrote:
> In the same spirit as commit c966533f8c6c ("lib/vdso: Mark do_hres()
> and do_coarse() as __always_inline"), mark do_hres_timens() and
> do_coarse_timens() __always_inline.
> 
> The measurement below in on a non timens process, ie on the fastest path.
> 
> On powerpc32, without the patch:
> 
> clock-gettime-monotonic-raw:    vdso: 1155 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 813 nsec/call
> clock-gettime-monotonic:    vdso: 1076 nsec/call
> 
> With the patch:
> 
> clock-gettime-monotonic-raw:    vdso: 1100 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 667 nsec/call
> clock-gettime-monotonic:    vdso: 1025 nsec/call
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  lib/vdso/gettimeofday.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 2919f1698140..c6f6dee08746 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -46,8 +46,8 @@ static inline bool vdso_cycles_ok(u64 cycles)
>  #endif
>  
>  #ifdef CONFIG_TIME_NS
> -static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
> -			  struct __kernel_timespec *ts)
> +static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
> +					  struct __kernel_timespec *ts)
>  {
>  	const struct vdso_data *vd = __arch_get_timens_vdso_data();
>  	const struct timens_offset *offs = &vdns->offset[clk];
> @@ -97,8 +97,8 @@ static __always_inline const struct vdso_data *__arch_get_timens_vdso_data(void)
>  	return NULL;
>  }
>  
> -static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
> -			  struct __kernel_timespec *ts)
> +static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
> +					  struct __kernel_timespec *ts)
>  {
>  	return -EINVAL;
>  }
> @@ -159,8 +159,8 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
>  }
>  
>  #ifdef CONFIG_TIME_NS
> -static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
> -			    struct __kernel_timespec *ts)
> +static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
> +					    struct __kernel_timespec *ts)
>  {
>  	const struct vdso_data *vd = __arch_get_timens_vdso_data();
>  	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
> @@ -188,8 +188,8 @@ static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
>  	return 0;
>  }
>  #else
> -static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
> -			    struct __kernel_timespec *ts)
> +static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
> +					    struct __kernel_timespec *ts)
>  {
>  	return -1;
>  }
> 

-- 
Regards,
Vincenzo
