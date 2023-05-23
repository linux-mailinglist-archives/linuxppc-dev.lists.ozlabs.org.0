Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F670E2B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQh1t5Qg9z3f83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 03:21:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hTrpGv/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hTrpGv/L;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQh11262Lz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 03:20:51 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-53eee18a192so1129168a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684862448; x=1687454448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+vO/cCzHwQuFnPVrGLDZXukRrxNDu5SHC6BXOa81Zs=;
        b=hTrpGv/LdaPA65qPf/L+BSDkbT6zxNZTQPjO/67q6q9Xdc3oYNnP6YT9VTuIFvwA2n
         zzddg+xmleQpDg8/38lvv8BZYegLr+KluMOfzUuair0+1TpySYCCpJhlWYGOgB9PEhXt
         X+fTUDs9r+oaJYcBZwZTy6oX1F0dGqIStzIwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862448; x=1687454448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+vO/cCzHwQuFnPVrGLDZXukRrxNDu5SHC6BXOa81Zs=;
        b=J80Qb3Y8QlGv852+xbvVCAUF/D5njPOd8di0q0SO4G4lrwYwfm6s+9dZ2LAXEFt6Q5
         NevCpwr3SLqrNnJx7vNHZjslcEh38gn83E9m1D80sa3UGmhQcrJVCn5mkoeMQf07sKSV
         +INtskROc+8HuL5tenMz99pjwzBbPsF04meP6CK6xSILLNq9bEMYruUtXxD+DkK+O92U
         X1abK+TXotPYJJowhxzfi/dtCuQvpmC8Od7F/ZXw6R8LM7TzPzg8Yi06JAdwacTtdtz7
         Lull2fslmgqYn4DJp75gdgP85ykeBeM9tSfWe8v+YvfKUleHp/6+QblHMp+8MHQ72IZ+
         z3Qw==
X-Gm-Message-State: AC+VfDxoHL2FutFxme1sOMvMYLMzJ8DbkKdMyjp8LkcTLMT8rB5C/G+V
	K3sTvLjOKwLf0pN9NqwCsT6cDw==
X-Google-Smtp-Source: ACHHUZ4P8xDP0TNAyj32JLK4hmrdVTDjOgl2B0qIzRYWdP+XmmGQKtfRjG2ZNIm+vY9oedRsM1SR9Q==
X-Received: by 2002:a17:903:428a:b0:1ac:4a41:d38d with SMTP id ju10-20020a170903428a00b001ac4a41d38dmr13144028plb.51.1684862448641;
        Tue, 23 May 2023 10:20:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o18-20020a170902d4d200b001ae44e2f425sm7007182plg.223.2023.05.23.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:20:48 -0700 (PDT)
Date: Tue, 23 May 2023 10:20:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305231020.37C95FD@keescook>
References: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 02:14:25AM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
