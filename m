Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE97071BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 21:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM2qQ1GR3z3fF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 05:14:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SUqO4jCC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SUqO4jCC;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM2pW4xfCz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 05:14:09 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643a1fed360so833433b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684350845; x=1686942845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOcRPuLGObm+Vg1R2GCaP1lmxZ7GfKsTU0IS+UkR3zs=;
        b=SUqO4jCCzRBEgKPabZ2BR1iWXlDt2bJ4YSx2nTK+jnAsmW8ztUDPnxFpi2XNxv89H0
         xkQ2xhTIBVlUIXd65WUWWEmzgGVJRq5XXv4dHzNMp9TnfYmVeRGoc5/iYDZuxhtKLl+X
         R/owG4gwXqt6fPHMYaTSzJ+vYIB2PSQuBqtjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350845; x=1686942845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOcRPuLGObm+Vg1R2GCaP1lmxZ7GfKsTU0IS+UkR3zs=;
        b=GVteftUqbwAVABGoKZFOpKpx2h/P11NMg0QKMx9yPw0AFn4ZWYwqBUohZKTzBUsjoX
         +X+mxO1qBDj8S1Qx+eAWNA4sC9ot/4rRfq9WJHepn/EQi5atYyeodbr/FFQOjY7cg6fK
         /FwDyUtSMjXE0QIYyiYLqNrTNCqJ8juK3VYVliQZ3Vwr15cCTQj2Ik6BAd9N51DUjHfJ
         Sx78TCweosotRq8Zt5gcXE/+EuvtgNOuE1zVjLYmCDL1JwGee1JJiW1C5tTf89GmZDDW
         oMU1r0uWj6wkOrcexLjrok9VgYl+M1WoMRGcuzc+1cBmSc5mdhFnAJBcr0rG8nxW2iZx
         pZMw==
X-Gm-Message-State: AC+VfDyigJTGtxDu/hxWnF8s5jgTqrArP/LeEuSV6WItBaxpqMTarwuc
	RB/3DbzKcVyZ34BDvC6YlDgeAA==
X-Google-Smtp-Source: ACHHUZ4LRkx/6YsdhklEs/2vurTILxouu44+3QT3dOA1O72v+gTZjxf++gH4zzIh+dIYs6Tt7TknXQ==
X-Received: by 2002:a05:6a00:15c1:b0:64c:ae1c:3385 with SMTP id o1-20020a056a0015c100b0064cae1c3385mr866272pfu.32.1684350845462;
        Wed, 17 May 2023 12:14:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f13-20020aa782cd000000b0062e63cdfcb6sm16005552pfn.94.2023.05.17.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 12:14:05 -0700 (PDT)
Date: Wed, 17 May 2023 12:14:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] scsi: ibmvscsi: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305171214.77A5A62DD@keescook>
References: <20230517143409.1520298-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517143409.1520298-1-azeemshaikh38@gmail.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023 at 02:34:09PM +0000, Azeem Shaikh wrote:
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
