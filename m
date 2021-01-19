Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82C2FC0BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 21:16:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL0LG6MbPzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 07:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL00C2Ds8zDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 07:01:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=TeLHWEk4; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4DL00C1Mw6z9sW8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 07:01:15 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DL00C1097z9sVy; Wed, 20 Jan 2021 07:01:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=lpechacek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=TeLHWEk4; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DL00B5Vnjz9sVr
 for <linuxppc-dev@ozlabs.org>; Wed, 20 Jan 2021 07:01:13 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611086468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhp7vaLHjs9Tk81yLi/x0yqdOjAbc2dEtLX5Qqby/TQ=;
 b=TeLHWEk4Azxz4zpaHKcFoSIw5YH3QFZhAZJs0M1cNBb6d1Uauj218Np2jKxoBwJ32LeF0c
 zGSMzTxlP0BG4+VZ3WVbg4L4L2vCpXPMLacMfbk53f53Qg+9kgbHWDGbcvuJFtuPnk8w8i
 SRDXuwh/03vCkUkMBU6IbVE/cMrCEu0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 330AFAC63;
 Tue, 19 Jan 2021 20:01:08 +0000 (UTC)
Date: Tue, 19 Jan 2021 21:01:07 +0100
From: Libor Pechacek <lpechacek@suse.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Only test lwm/stmw on big endian
Message-ID: <YAc6g2laaVprHX7K@fmn>
References: <20210119041800.3093047-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210119041800.3093047-1-mpe@ellerman.id.au>
X-Mailman-Approved-At: Wed, 20 Jan 2021 07:15:17 +1100
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
Cc: linuxppc-dev@ozlabs.org, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Út 19-01-21 15:18:00, Michael Ellerman wrote:
> Newer binutils (>= 2.36) refuse to assemble lmw/stmw when building in
> little endian mode. That breaks compilation of our alignment handler
> test:
> 
>   /tmp/cco4l14N.s: Assembler messages:
>   /tmp/cco4l14N.s:1440: Error: `lmw' invalid when little-endian
>   /tmp/cco4l14N.s:1814: Error: `stmw' invalid when little-endian
>   make[2]: *** [../../lib.mk:139: /output/kselftest/powerpc/alignment/alignment_handler] Error 1
> 
> These tests do pass on little endian machines, as the kernel will
> still emulate those instructions even when running little
> endian (which is arguably a kernel bug).
> 
> But we don't really need to test that case, so ifdef those
> instructions out to get the alignment test building again.
> 
> Reported-by: Libor Pechacek <lpechacek@suse.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Libor Pechacek <lpechacek@suse.com>

Thanks, Michael, for the fix!

Libor

> ---
>  .../testing/selftests/powerpc/alignment/alignment_handler.c  | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> index cb53a8b777e6..c25cf7cd45e9 100644
> --- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> +++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
> @@ -443,7 +443,6 @@ int test_alignment_handler_integer(void)
>  	LOAD_DFORM_TEST(ldu);
>  	LOAD_XFORM_TEST(ldx);
>  	LOAD_XFORM_TEST(ldux);
> -	LOAD_DFORM_TEST(lmw);
>  	STORE_DFORM_TEST(stb);
>  	STORE_XFORM_TEST(stbx);
>  	STORE_DFORM_TEST(stbu);
> @@ -462,7 +461,11 @@ int test_alignment_handler_integer(void)
>  	STORE_XFORM_TEST(stdx);
>  	STORE_DFORM_TEST(stdu);
>  	STORE_XFORM_TEST(stdux);
> +
> +#ifdef __BIG_ENDIAN__
> +	LOAD_DFORM_TEST(lmw);
>  	STORE_DFORM_TEST(stmw);
> +#endif
>  
>  	return rc;
>  }
> -- 
> 2.25.1
> 

-- 
Libor Pechacek
SUSE Labs                                Remember to have fun...
