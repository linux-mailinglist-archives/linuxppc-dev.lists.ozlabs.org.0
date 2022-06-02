Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F053BB7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 17:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDV6N2NxWz3bxk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 01:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU6SwoCo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDV5g2ksyz3bkK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 01:18:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU6SwoCo;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LDV5c0J91z4xZD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 01:18:28 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LDV5c0Cw1z4xXF; Fri,  3 Jun 2022 01:18:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU6SwoCo;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LDV5c05jWz4x7V;
	Fri,  3 Jun 2022 01:18:27 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f2a4c51c45so7101336fac.9;
        Thu, 02 Jun 2022 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fIposw9bqQ/A/8+/bJlACkRyYumL8k5kj0sa3GrGDf4=;
        b=UU6SwoCo6VxWFctnTFZFCpqb4KbprqRWac1seiCMaVK5Oc23l19yk4ET1SoPpjDK8I
         cIGMhTfOtWjIRzEVJLCztWa86AAvLIx5y6+oQS1KZmwsnWWqhRLXc1nZPHD3XjcJT/cG
         fjwFinsfiWbzkMYGEJoG70DZs+Kyus+KLgo5KwWwAtxWTSjzCMUGgPYvwasN1TybnEqk
         /p3rJrPT2g0d5/vUh/sCQOLQre/277BJwEdcmLh0X+HE5tx3Pf90jPWQqFIYmgmRaQYW
         UhlX2kF6YWWoHQMq2nDUhBbR81imMMJmeL9m3Dvd83AQQVFoydxTjVTx20Us2U++aaNR
         dLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=fIposw9bqQ/A/8+/bJlACkRyYumL8k5kj0sa3GrGDf4=;
        b=drTaJWZvqN6dtt05GRieUqAzFU2Px3vRdYwFThv+XU5xrX1thg734RhaAHB3QZTyoC
         GqsitwxuOeYXVVxjSec/0s/MRMw1v8TwxfkDA18CkurtkIeUynPcxRQJqmvtQkmAJw/9
         M2MFMpzNXTKzfTGw5rE5a+lEhXuCT4ZhlfqGd08dGWCcZBeSB0qo9ZemDa7kFCfDa+bK
         x2BYZnKj4O9u9VSwvhcRcj3L6iHgOXjymBxykB212ziss5tYz0wNlntdSnZpz/gjExYU
         NPS17ayUQRFZbG1g/swNFPSKtdl7yFZoDlNfHDPa8ao8NffNbIxPiLRZ4AePa4hT2Q6V
         Vy4A==
X-Gm-Message-State: AOAM531ZfzxodwjWcqY1gpGk/iaVSv5LIlLwGGSEKr1BCAHGWRe0I345
	okuq5nVMlLzmtGeo4QANEzBH313HmAE=
X-Google-Smtp-Source: ABdhPJysFKTT0rMzWrVQR/Pj+qn73S351ApiUhtjS+V2jtNpRHalJoYqTIOGZA/kI7QN5jMtRRsUcw==
X-Received: by 2002:a05:6870:8888:b0:e9:a3eb:a52d with SMTP id m8-20020a056870888800b000e9a3eba52dmr3059463oam.181.1654183102140;
        Thu, 02 Jun 2022 08:18:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11-20020a9d728b000000b0060b66b6641fsm2257002otj.5.2022.06.02.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 08:18:21 -0700 (PDT)
Date: Thu, 2 Jun 2022 08:18:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v2 3/6] powerpc: Book3S 64-bit outline-only KASAN support
Message-ID: <20220602151819.GA1057366@roeck-us.net>
References: <YoTEb2BaH3MDkH+2@cleo>
 <YoTE69OQwiG7z+Gu@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTE69OQwiG7z+Gu@cleo>
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, May 18, 2022 at 08:05:31PM +1000, Paul Mackerras wrote:
> From: Daniel Axtens <dja@axtens.net>
> 
> Implement a limited form of KASAN for Book3S 64-bit machines running under
> the Radix MMU, supporting only outline mode.
> 
>  - Enable the compiler instrumentation to check addresses and maintain the
>    shadow region. (This is the guts of KASAN which we can easily reuse.)
> 
>  - Require kasan-vmalloc support to handle modules and anything else in
>    vmalloc space.
> 
>  - KASAN needs to be able to validate all pointer accesses, but we can't
>    instrument all kernel addresses - only linear map and vmalloc. On boot,
>    set up a single page of read-only shadow that marks all iomap and
>    vmemmap accesses as valid.
> 
>  - Document KASAN in powerpc docs.
> 

With this patch applied, powerpc:allmodconfig builds fail as follows.

Building powerpc:allmodconfig ... failed
--------------
Error log:
Error: External symbol 'memset' referenced from prom_init.c
make[3]: [arch/powerpc/kernel/Makefile:202: arch/powerpc/kernel/prom_init_check] Error 1 (ignored)
powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o uses soft float
powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
make[5]: [scripts/Makefile.build:435: drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 1 (ignored)
make[2]: *** No rule to make target 'drivers/gpu/drm/amd/amdgpu/amdgpu.o', needed by 'modules-only.symvers'.  Stop.
make[1]: [Makefile:1753: modules] Error 2 (ignored)

This is with gcc 11.3 and binutils 2.38. I also tried with gcc 11.2 and
binutils 2.36.1, with the same results.

Reverting this patch fixes the problem.

Guenter
