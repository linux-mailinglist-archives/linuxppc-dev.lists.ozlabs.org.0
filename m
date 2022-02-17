Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5C4BA4AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 16:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzzbz4XtXz3cbD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 02:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=relay5.hostedemail.com (client-ip=64.99.140.39;
 helo=relay5.hostedemail.com; envelope-from=joe@perches.com;
 receiver=<UNKNOWN>)
Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzzbT54HHz3cDB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 02:42:11 +1100 (AEDT)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 1AFCB2042F;
 Thu, 17 Feb 2022 15:42:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id AF56320032; 
 Thu, 17 Feb 2022 15:42:05 +0000 (UTC)
Message-ID: <1f6cabc8b183056546571b391770e1eea8524fd3.camel@perches.com>
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
From: Joe Perches <joe@perches.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 17 Feb 2022 07:42:04 -0800
In-Reply-To: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AF56320032
X-Spam-Status: No, score=-4.42
X-Stat-Signature: nz9e5z1u3yz1f5rpbt3m7jkkokhucyw8
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19KaPmP/R/KoYWstS8VZiTyOYA8oslrR+Y=
X-HE-Tag: 1645112525-592173
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-02-17 at 13:19 +0100, Christophe Leroy wrote:
> All functions defined as static inline in net/checksum.h are
> meant to be inlined for performance reason.
> 
> But since commit ac7c3e4ff401 ("compiler: enable
> CONFIG_OPTIMIZE_INLINING forcibly") the compiler is allowed to
> uninline functions when it wants.
> 
> Fair enough in the general case, but for tiny performance critical
> checksum helpers that's counter-productive.

Thanks.  Trivial style notes:

> diff --git a/include/net/checksum.h b/include/net/checksum.h
[]
> @@ -22,7 +22,7 @@
>  #include <asm/checksum.h>
>  
>  #ifndef _HAVE_ARCH_COPY_AND_CSUM_FROM_USER
> -static inline
> +static __always_inline
>  __wsum csum_and_copy_from_user (const void __user *src, void *dst,
>  				      int len)
>  {

__wsum might be better placed on the previous line.

[]

> @@ -45,7 +45,7 @@ static __inline__ __wsum csum_and_copy_to_user
>  #endif
>  
>  #ifndef _HAVE_ARCH_CSUM_AND_COPY
> -static inline __wsum
> +static __always_inline __wsum
>  csum_partial_copy_nocheck(const void *src, void *dst, int len)

To be consistent with the location of the __wsum return value
when splitting the function definitions across multiple lines.

(like the below)

> @@ -88,42 +88,43 @@ static inline __wsum csum_shift(__wsum sum, int offset)
>  	return sum;
>  }
>  
> -static inline __wsum
> +static __always_inline __wsum
>  csum_block_add(__wsum csum, __wsum csum2, int offset)
>  {
>  	return csum_add(csum, csum_shift(csum2, offset));
>  }
>  
> -static inline __wsum
> +static __always_inline __wsum
>  csum_block_add_ext(__wsum csum, __wsum csum2, int offset, int len)
>  {
>  	return csum_block_add(csum, csum2, offset);
>  }
>  
> -static inline __wsum
> +static __always_inline __wsum
>  csum_block_sub(__wsum csum, __wsum csum2, int offset)
>  {
>  	return csum_block_add(csum, ~csum2, offset);
>  }
>  
> -static inline __wsum csum_unfold(__sum16 n)
> +static __always_inline __wsum csum_unfold(__sum16 n)
>  {
>  	return (__force __wsum)n;
>  }
>  

[]

> -static inline __wsum csum_partial_ext(const void *buff, int len, __wsum sum)
> +static __always_inline
> +__wsum csum_partial_ext(const void *buff, int len, __wsum sum)
>  {
>  	return csum_partial(buff, len, sum);
>  }

And this __wsum could be moved too.

> @@ -150,15 +151,15 @@ void inet_proto_csum_replace16(__sum16 *sum, struct sk_buff *skb,
[]
> -static inline __wsum remcsum_adjust(void *ptr, __wsum csum,
> +static __always_inline __wsum remcsum_adjust(void *ptr, __wsum csum,
>  				    int start, int offset)
>  {
>  	__sum16 *psum = (__sum16 *)(ptr + offset);

And this one could be split like the above

static __always_inline __wsum
remcsum_adjust(void *ptr, __wsum csum, int start, int offset)


