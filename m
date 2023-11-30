Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA927FFD51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 22:14:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgF8FrV/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh88f0cTvz2yhZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 08:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SgF8FrV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh87P4Kzfz3dBm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 08:13:37 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-285a64dcf3eso1276766a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701378814; x=1701983614; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fidcjtTW722GJ2IM4Au/VykloMhm7RTaqk1o/atYAEw=;
        b=SgF8FrV/j3EZ4gmau+rqotd8+ImP3clRTGMOTy7FHtc5kl1ahimwXTx+eMbiaVp8Xs
         9sF6ILnWtN2t/hqpjUrRk5Rvsxs6X6A2pgKSmdXWl26/RZzuaKC48UmFglFRWGbI9Xrf
         sRqsnz8DGFofH31vVbF+35jvnloquDL4n8F7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701378814; x=1701983614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fidcjtTW722GJ2IM4Au/VykloMhm7RTaqk1o/atYAEw=;
        b=fRqyJl3VhSBzUvuaNzWfjTuYjo8o5l6C1/Wy/OkgfOjK/hpSx+DEHCcazwfFlVGF6R
         CMSHBtBTiUnutT9v/vcf4SJdBfOKt+wy/0yfJuSqrOh7xNYTgFORH799XiaJKulqALNo
         htD7un+yrZ26m/vrD4MvwykmmpYCqOcogaXSmWsKneqCiJSM/F2Bls17zMJLfXTEYMye
         10IOb6l4SGDyv02T4SKa/bG8eGOhvmsBWqR37xex+yyH82m18Wlp2YPYzU4RRo3j+yNI
         I3vO2CjROPOkgtGxuQd78yS2hAIy7Ld61c3WXoS9vvbW85jYlGMNYpK1OYKOridrcCqg
         uurw==
X-Gm-Message-State: AOJu0YxBDVKOO3onQwRMGd6gFijjMosvR/yinIL3TpqKLuAJDhGGZHrT
	10nE+T9YAVsDpfirQ6ngD5ZpZw==
X-Google-Smtp-Source: AGHT+IEKJ/wr7SUlbtYwADUSjvGI7oq2tySAREjzqV7MWT2FI9gP4yoKXMynlqfV5uTQNeEytkLvBg==
X-Received: by 2002:a17:90b:4acf:b0:285:a160:df1b with SMTP id mh15-20020a17090b4acf00b00285a160df1bmr19079170pjb.7.1701378814029;
        Thu, 30 Nov 2023 13:13:34 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gf18-20020a17090ac7d200b0028098225450sm3743947pjb.1.2023.11.30.13.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:13:33 -0800 (PST)
Date: Thu, 30 Nov 2023 13:13:32 -0800
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] scsi: ibmvscsi: replace deprecated strncpy with strscpy
Message-ID: <202311301313.6248EF5E@keescook>
References: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvscsi-c-v1-1-f8b06ae9e3d5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvscsi-c-v1-1-f8b06ae9e3d5@google.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023 at 08:40:48PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We expect partition_name to be NUL-terminated based on its usage with
> format strings:
> |       dev_info(hostdata->dev, "host srp version: %s, "
> |                "host partition %s (%d), OS %d, max io %u\n",
> |                hostdata->madapter_info.srp_version,
> |                hostdata->madapter_info.partition_name,
> |                be32_to_cpu(hostdata->madapter_info.partition_number),
> |                be32_to_cpu(hostdata->madapter_info.os_type),
> |                be32_to_cpu(hostdata->madapter_info.port_max_txu[0]));
> ...
> |       len = snprintf(buf, PAGE_SIZE, "%s\n",
> |                hostdata->madapter_info.partition_name);
> 
> Moreover, NUL-padding is not required as madapter_info is explicitly
> memset to 0:
> |       memset(&hostdata->madapter_info, 0x00,
> |                       sizeof(hostdata->madapter_info));
> 
> Considering the above, a suitable replacement is `strscpy` [2] due to
> the fact that it guarantees NUL-termination on the destination buffer
> without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Agreed; this conversion looks correct to me too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
