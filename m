Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5524ED539
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 10:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTbYF4wlbz302c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 19:09:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=aA4LJOR8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=aA4LJOR8; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTbXT4Tqrz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 19:08:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vgFxkctDb1FZErJ2oJenfEMHhTzev2yqQ09Rt4ERQxU=; b=aA4LJOR8MTxejC1TyR1HcWxmCa
 LrhuCQFnUh3CRSyXPPFc9f6ZtThp5vHGoFFQGp/sx7CyB+dumpA5dxIw+B3PiKIMaatgk5cCuwvQ6
 mUC5KWnfjW8aur8tMRherLxfeLbJtWKewxILva23uF2c+k1pj2LmUm5uiAAJdD3ZTddjxsAuKftLV
 TgKSUw2+FUZDQzxhKvYfa7ACP1wiLggzmgkZ3eKjsTPVsI92uuLH5r6RyHx3Q7dByp1jmRzlmAXOd
 +IN04P6J3op3CoQs06cFKJq96zv5ZBr2GAC8guy03Msr3brJA4tbZvpHskAQR4nMPZkZDYCWoPQ1I
 1bYJ3H8A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZpqp-0022BW-Rs; Thu, 31 Mar 2022 08:08:15 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7200098695C; Thu, 31 Mar 2022 10:08:14 +0200 (CEST)
Date: Thu, 31 Mar 2022 10:08:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1] objtool: Use target file endianness instead of a
 compiled constant
Message-ID: <20220331080814.GQ8939@worktop.programming.kicks-ass.net>
References: <7c503552c4bc1f0e1aa4775765f8f24e9d1b0a04.1648713067.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c503552c4bc1f0e1aa4775765f8f24e9d1b0a04.1648713067.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy <sv@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 31, 2022 at 09:52:07AM +0200, Christophe Leroy wrote:
> Some architectures like powerpc support both endianness, it's
> therefore not possible to fix the endianness via arch/endianness.h
> because there is no easy way to get the target endianness at
> build time.
> 
> Use the endianness recorded in the file objtool is working on.
> 

> +#include <objtool/elf.h>
>  
>  /*
> - * Does a byte swap if target endianness doesn't match the host, i.e. cross
> + * Does a byte swap if target file endianness doesn't match the host, i.e. cross
>   * compilation for little endian on big endian and vice versa.
>   * To be used for multi-byte values conversion, which are read from / about
>   * to be written to a target native endianness ELF file.
>   */
> -#define bswap_if_needed(val)						\
> +static inline bool need_bswap(GElf_Ehdr *ehdr)
> +{
> +	return (__BYTE_ORDER == __LITTLE_ENDIAN) ^
> +	       (ehdr->e_ident[EI_DATA] == ELFDATA2LSB);
> +}
> +
> +#define bswap_if_needed(ehdr, val)					\
>  ({									\
>  	__typeof__(val) __ret;						\
> +	bool __need_bswap = need_bswap(ehdr);				\
>  	switch (sizeof(val)) {						\
> -	case 8: __ret = __NEED_BSWAP ? bswap_64(val) : (val); break;	\
> -	case 4: __ret = __NEED_BSWAP ? bswap_32(val) : (val); break;	\
> -	case 2: __ret = __NEED_BSWAP ? bswap_16(val) : (val); break;	\
> +	case 8: __ret = __need_bswap ? bswap_64(val) : (val); break;	\
> +	case 4: __ret = __need_bswap ? bswap_32(val) : (val); break;	\
> +	case 2: __ret = __need_bswap ? bswap_16(val) : (val); break;	\
>  	default:							\
>  		BUILD_BUG(); break;					\
>  	}								\

Far less painfull that I imagined it would be,.. but I think I prefer
passing in elf, as opposed to elf->ehdr, would that work?
