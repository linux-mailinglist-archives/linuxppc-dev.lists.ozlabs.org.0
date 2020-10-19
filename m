Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BD292F3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 22:14:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFSf55chhzDqNP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 07:14:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CFScN6JyCzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 07:13:08 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 09JKAlXU020418;
 Mon, 19 Oct 2020 15:10:47 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 09JKAkCX020411;
 Mon, 19 Oct 2020 15:10:46 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Oct 2020 15:10:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/uaccess: Don't use "m<>" constraint with GCC
 4.9
Message-ID: <20201019201045.GS2672@gate.crashing.org>
References: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.4.2.3i
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

On Mon, Oct 19, 2020 at 12:12:46PM +0000, Christophe Leroy wrote:
> GCC 4.9 sometimes fails to build with "m<>" constraint in
> inline assembly.

> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -223,7 +223,7 @@ do {								\
>  		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
>  		EX_TABLE(1b, %l2)				\
>  		:						\
> -		: "r" (x), "m<>" (*addr)				\
> +		: "r" (x), "m"UPD_CONSTR (*addr)		\
>  		:						\
>  		: label)
>  
> @@ -294,7 +294,7 @@ extern long __get_user_bad(void);
>  		".previous\n"				\
>  		EX_TABLE(1b, 3b)			\
>  		: "=r" (err), "=r" (x)			\
> -		: "m<>" (*addr), "i" (-EFAULT), "0" (err))
> +		: "m"UPD_CONSTR (*addr), "i" (-EFAULT), "0" (err))

Wow, ugly!  But these are the only two places that use this, so

Acked-by: Segher Boessenkool  <segher@kernel.crashing.org>

I just hope that we get rid of 4.9 before we would use this a lot more ;-)


Segher
