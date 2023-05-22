Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF570C94A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 21:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQ7HV50Xmz3f7f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 05:46:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gpP2C4C7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gpP2C4C7;
	dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQ7Gc48d7z309V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 05:45:42 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-38e3228d120so3824230b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684784736; x=1687376736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNAaP6+XJai6xtjlcDTjy2E1GXqny00MK+4AdCDW8Kw=;
        b=gpP2C4C7vvuNZ+cWcDSd3U1JavsxKjczBY23iIgEEsufg8c7z4ZV9Gl3Ecd33/8qAZ
         zG0nfqIR/RLyG2Ogx9KhsfHr/KGYXQJkH1HZyqQ4Tv+JVqmumiyT1ClzeRQxbIqJ8gHf
         DmacNLw0y1ACzuqEPuY0l4jT/8Rdg1MceY4Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684784736; x=1687376736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNAaP6+XJai6xtjlcDTjy2E1GXqny00MK+4AdCDW8Kw=;
        b=V7uZsCAI0WYpeqabI2HQl0M6w3VZwpWZ8qU8hEGTqb+6J+pY7BpiuaSdGkdqD183Dz
         DabbAsZutUYUZ4F08bPxIZhOhFXZDs+4YUCQRDvDe9mOqFUMh8O5j0lRkvX+KgMOzvfp
         o8LqJ8Ddu/OPO5VxatOi0sAEAL/4H90C8ExwV+9Z35i053PAqTgQNaGibX5d7aReyslo
         pi3M6rJYez0nq/c/MHkCfX4Dn+ea8ceK1tX7RoYX52sBCqrPwxMiqDDLAsvTfuHRDesz
         c/orhgul6jEYHQ9mi/20APllJTjxzMUWEHHXinMFmYBSRj8blRc46zY9isqrijVNZ7lj
         agUA==
X-Gm-Message-State: AC+VfDzJdB/KiUaQyu9eIw1H/7dDwjLrVtBhAuWX6XS6kHPhm4Xy7job
	phcoSzWE3B8qN8LRRCs+TdJ3FMC+JWVqWOr0bv4=
X-Google-Smtp-Source: ACHHUZ7XSGaVK8OAFHtgEWwhmN/dPCgY/hsNSkZ6wHyqo93wCVtLQOXdhbv7Nf33xNA7cZ9ma8oqXA==
X-Received: by 2002:a17:90a:70ce:b0:255:4f4c:368 with SMTP id a14-20020a17090a70ce00b002554f4c0368mr5138998pjm.27.1684784390970;
        Mon, 22 May 2023 12:39:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r13-20020a17090a940d00b0025352448ba9sm6234829pjo.0.2023.05.22.12.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:39:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	tyreld@linux.ibm.com
Subject: Re: [PATCH] scsi: ibmvscsi: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 12:39:40 -0700
Message-Id: <168478437624.244538.16463667694387498508.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517143409.1520298-1-azeemshaikh38@gmail.com>
References: <20230517143409.1520298-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Kees Cook <keescook@chromium.org>, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, martin.petersen@oracle.com, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 14:34:09 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] scsi: ibmvscsi: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/015f6618194e

-- 
Kees Cook

