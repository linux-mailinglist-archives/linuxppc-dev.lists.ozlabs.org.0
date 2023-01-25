Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3F67B301
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 14:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P243000zmz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:10:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lNFbFff2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P24204rYHz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 00:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lNFbFff2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P241w5FBpz4xN5;
	Thu, 26 Jan 2023 00:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1674652197;
	bh=Fwm8ctv+aCNu1LYwfHNIxF2N4IkFJEym+qN9b8CLahU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lNFbFff2B/+4f6CEwrZJlkdL7Wg89pqNa6jlqXE86gaDP07osJlKhAXgJ7PPsVJ7P
	 rIP+e3JfSbHKBTSyIRtukysVpTAa1cPdGtDHNY8W6vFSAz8eU9xWYhl1WB9QCDPBQ8
	 8QWqiD4xaO6Fa83SzLFtimmjvSNe59I68T5zV2osJSscYqiDVSD1MfTq12uPcMX4FG
	 pIlhwukmzXgPvzyUUk3HQ3lzrGbkQpbtno/bdJtTtINvFEgfYJyxh3GOmTkHazquZV
	 2yqydn4pJY/gAY1sbX8ooTIPL+shpN8u+NFwihi5Ra7HCmrXTcethT0vHJPV//UUoY
	 xd1DMy9d/9S9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 02/24] powerpc/pseries: Fix alignment of PLPKS
 structures and buffers
In-Reply-To: <20230120074306.1326298-3-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-3-ajd@linux.ibm.com>
Date: Thu, 26 Jan 2023 00:09:53 +1100
Message-ID: <87pmb2pxpa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, joel@jms.id.au, ruscur@russell.cc, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> A number of structures and buffers passed to PKS hcalls have alignment
> requirements, which could on occasion cause problems:
>
> - Authorisation structures must be 16-byte aligned and must not cross a
>   page boundary
>
> - Label structures must not cross page boundaries
>
> - Password output buffers must not cross page boundaries
>
> Round up the allocations of these structures/buffers to the next power of
> 2 to make sure this happens.

It's not the *next* power of 2, it's the *nearest* power of 2, including
the initial value if it's already a power of 2.

That in conjunction with slab's guarantee that power of 2 sized objects
are naturally aligned, and that the relevant structs are smaller than a
page, is what makes this actually work.

So I think the patch is fine, but the change log and comments probably
need to be a bit clearer.

cheers

> Reported-by: Benjamin Gray <bgray@linux.ibm.com>
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Reviewed-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v3: Merge plpks fixes and signed update series with secvar series
>
> v4: Fix typo in commit message
>
>     Move up in series (npiggin)
> ---
>  arch/powerpc/platforms/pseries/plpks.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
> index 9e85b6d85b0b..a01cf2ff140a 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -126,7 +126,8 @@ static int plpks_gen_password(void)
>  	u8 *password, consumer = PKS_OS_OWNER;
>  	int rc;
>  
> -	password = kzalloc(maxpwsize, GFP_KERNEL);
> +	// The password must not cross a page boundary, so we align to the next power of 2
> +	password = kzalloc(roundup_pow_of_two(maxpwsize), GFP_KERNEL);
>  	if (!password)
>  		return -ENOMEM;
>  
> @@ -162,7 +163,9 @@ static struct plpks_auth *construct_auth(u8 consumer)
>  	if (consumer > PKS_OS_OWNER)
>  		return ERR_PTR(-EINVAL);
>  
> -	auth = kzalloc(struct_size(auth, password, maxpwsize), GFP_KERNEL);
> +	// The auth structure must not cross a page boundary and must be
> +	// 16 byte aligned. We align to the next largest power of 2
> +	auth = kzalloc(roundup_pow_of_two(struct_size(auth, password, maxpwsize)), GFP_KERNEL);
>  	if (!auth)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -196,7 +199,8 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
>  	if (component && slen > sizeof(label->attr.prefix))
>  		return ERR_PTR(-EINVAL);
>  
> -	label = kzalloc(sizeof(*label), GFP_KERNEL);
> +	// The label structure must not cross a page boundary, so we align to the next power of 2
> +	label = kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
>  	if (!label)
>  		return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.39.0
