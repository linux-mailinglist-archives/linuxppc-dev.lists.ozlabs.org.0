Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F54C8C0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 13:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7HLM1zzjz3bv4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 23:56:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dlVJsWZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7HKk2ZMdz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 23:55:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dlVJsWZX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7HKk1xG8z4xPt;
 Tue,  1 Mar 2022 23:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646139338;
 bh=3gAUw2bljeQgo+EIP3uDFWmam1knQZu7pffpGmaV4fk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dlVJsWZXk+G/5EIS6pOP76i9u12kyE3/AwRjYtkWQDUaSChKkxstgICysnR1WNgZi
 7CrNqGb+0B5EdXQSh+3R7DzUA3c9CiOXS0Ozj5tDNG2V/e/ikkI83Ngdq/ndgw/TZQ
 7yBJwtiN3X6oP638JzaoGKtuLi/MwoiZYogkr+9sLMKkiEL5waISY3OIbY6WdEX7QL
 YTgis/hp3vihz82rnv2XaKrdagoQDFgQbv3vmvkv33Ard89MNdONaFr9K/IeUu8cTf
 nrC6NDS5xQ1EPCapfFcHV6tZ0Zp/dsam/3TJ0jzg0BeBvZkoHuZ5gvEWWl0Wu83saW
 04qgfukwQbWQQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hangyu Hua <hbh25y@gmail.com>, benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH] powerpc: kernel: fix a refcount leak in format_show()
In-Reply-To: <20220228091103.39749-1-hbh25y@gmail.com>
References: <20220228091103.39749-1-hbh25y@gmail.com>
Date: Tue, 01 Mar 2022 23:55:35 +1100
Message-ID: <87o82pomrc.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hangyu Hua <hbh25y@gmail.com> writes:
> node needs to be dropped when of_property_read_string fails. So an earlier call
> to of_node_put is required here.

That's true but ...

> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
> index a0a78aba2083..cd0fa7028d86 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -30,13 +30,12 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
>  		return -ENODEV;

There's also a reference leak there ^

So if you're going to touch this code I'd like you to fix both reference
leaks in a single patch please.

Having the error cases set rc and then goto "out" which does the
of_node_put() is the obvious solution I think.

cheers

>  	rc = of_property_read_string(node, "format", &format);
> +	of_node_put(node);
>  	if (rc)
>  		return rc;
>  
>  	rc = sprintf(buf, "%s\n", format);
>  
> -	of_node_put(node);
> -
>  	return rc;
>  }
>  
> -- 
> 2.25.1
