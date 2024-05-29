Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 97DDF8D415F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LpJNQAzN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqP2S3T8Lz7B7w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LpJNQAzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqP1f1Nfqz3vgd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:19:16 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7e1e8502d02so150739f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717021153; x=1717625953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIQsNObstWkWgKnY1UZsOrj0Wfr/JVGgFuTZShWQ62k=;
        b=LpJNQAzNWnAUIR5sAIS5Cm7c0ydH885hjCGqsy2Oy7tiT4hIo9SBEcwKlhziCA/4Vr
         mlRvEXktBU3a5MNZKIS8vQuaVht9bT76DTzBEyKVPCaYk9DhorRio65CkYg0wW/HjByT
         i3SxvsohUA2bMRoUgITdzj+srjS4RV812LtfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021153; x=1717625953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIQsNObstWkWgKnY1UZsOrj0Wfr/JVGgFuTZShWQ62k=;
        b=d7+b6GNrnFTI5nV3SX+KsPe0nzzAxrIrFJady/D7knNYtpvkflE1+N8fcRUFTuqZqv
         b6iFlKzIDpp9Ta7a2ghYfpbxp9A2IM6bmUcc/xIBLtou0vCBBbjtDtMsL4nEgivnX8Fw
         Voxj6XwMg+3l4DpB92qnevKtc10OVJCMqGlYqdIxtPZkPTx2p0KSVdox9a5RlQJeVLCw
         JQ9s2s0XuiofJTDam9SHrenEUcRNrrZozcg0xeJV16F4JBsmNNl9ICpqu1yLAhSH+1bF
         SLRyNHzz4r7gn+9v/lHs+eqFdhGV4NqCSRN65Q8ygW9Ig8VtSKVD+zuQPj31F5PT9X2d
         d3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/hTarjDDZnaEUVzhL4t79Uordyhnilsz6t0Up/PiO00GbCtEFlIq1W8JGb4V//xeTh2RhJF36nXwjJvzUE2Bi21UpYq0T/2+tCG+xww==
X-Gm-Message-State: AOJu0YzyJXAiNZOeidjsrSDu4BfJUInvKUyyMtMpbYkDf8k8jC84DIS6
	Z/Z0V61Es2miJXhAxT6B3VlTcnHUfGM1qtDodP6hpkrHK44IkwjKbdYbkhq7ZeY=
X-Google-Smtp-Source: AGHT+IGX3vM7AirEhD0z1TjIJ73Jy0G+hX175YByeN8PNH6Y8OAF4RTa4RM3+I+p92DV9/6KWiuc1Q==
X-Received: by 2002:a05:6602:1d41:b0:7de:e495:42bf with SMTP id ca18e2360f4ac-7eaf5d79567mr28209339f.1.1717021152820;
        Wed, 29 May 2024 15:19:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b0e80c3b6fsm1483913173.135.2024.05.29.15.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 15:19:12 -0700 (PDT)
Message-ID: <3f3a70ba-40d2-4624-b8c5-7c3ae2a025fb@linuxfoundation.org>
Date: Wed, 29 May 2024 16:19:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/overlayfs: Fix build error on ppc64
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org
References: <20240521022616.45240-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240521022616.45240-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: shuah <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/24 20:26, Michael Ellerman wrote:
> Fix build error on ppc64:
>    dev_in_maps.c: In function ‘get_file_dev_and_inode’:
>    dev_in_maps.c:60:59: error: format ‘%llu’ expects argument of type
>    ‘long long unsigned int *’, but argument 7 has type ‘__u64 *’ {aka ‘long
>    unsigned int *’} [-Werror=format=]
> 
> By switching to unsigned long long for u64 for ppc64 builds.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c b/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
> index 759f86e7d263..2862aae58b79 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
> +++ b/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #define _GNU_SOURCE
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>   
>   #include <inttypes.h>
>   #include <unistd.h>

Applied to linux-kselftest fixes for the next rc.

Michael, If you want to take this through, let me know, I can drop this.

thanks,
-- Shuah
