Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A84895BAF88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTcJR43rtz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 00:43:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OulnIc0P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OulnIc0P;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTcHq2pFmz3bcv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 00:43:00 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id v1so21635464plo.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=CczDj0L6fyErXarjYUw/nJButDiDyt2jg/VsMlHD9x0=;
        b=OulnIc0PtMHK6HBr/Ps6pXumK5u3z46zD9qTpwgCt3YZ9WlxymyQYofzW2uXiYqD68
         l+1dCUz9ozdNUjkvCBpAKBX7kXamXafBqAitnxJWe/mgSPrKxR+LqZz1ASr2cVF+MT0i
         FqQW0UwdPP0m9XW+ODPsEEuMnSXwGDAiQYCCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CczDj0L6fyErXarjYUw/nJButDiDyt2jg/VsMlHD9x0=;
        b=4NLDNqfrmylEzt6/Vpv3TpV3p6hOQMPiebbADfA+mcqNO7vnmMwYqX07vgXB6lTtuy
         jLbGRFTJOnc1AHK/M2dnd/6jkQh7a0QHC5ndpc4wJPD4fzmNpc2uf4f/QnbRejDt/oIC
         vrJ5IYPaTH+58kadLxtIBdYWz+upw5MyaLuJLTO1LUwsmMR9ojTtDQXLAPyhvulbahrT
         5L/Ux4eAslQ0VG/azcodpYyoQ6rTgfimkHpX1Vw2ka0r0RM8ijCTOlJnm5WVdfNYAti3
         Ft11TEQT1le1YC5GjONIdOj0HSxGYSisnoeUuGbpVlVS5kNrlzeFmDGas8tQdKb3a0WF
         IojQ==
X-Gm-Message-State: ACrzQf2jnGDkA5QG99lnkV4oRmFXrUIqAE+iySlp0xWFPvu4Kf92GorW
	gHdDaOzcjqd4Cn3KAT4iq7zQjQ==
X-Google-Smtp-Source: AMsMyM6fN+pgEnc/ncnyOHdVfzsAk03A4QioD6WtmLqIzn6JzDwi9BxnF+gf8QmMz6pDubaM926hUw==
X-Received: by 2002:a17:902:b693:b0:178:5fa6:4b3 with SMTP id c19-20020a170902b69300b001785fa604b3mr170800pls.63.1663339376925;
        Fri, 16 Sep 2022 07:42:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m17-20020a637d51000000b0042ff6b0cf4dsm13491251pgn.58.2022.09.16.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:42:56 -0700 (PDT)
Date: Fri, 16 Sep 2022 07:42:55 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] powerpc/xmon: Fix -Wswitch-unreachable warning in
 bpt_cmds
Message-ID: <202209160742.81BE54E@keescook>
References: <YySE6FHiOcbWWR+9@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YySE6FHiOcbWWR+9@work>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 16, 2022 at 03:15:04PM +0100, Gustavo A. R. Silva wrote:
> When building with automatic stack variable initialization, GCC 12
> complains about variables defined outside of switch case statements.
> Move the variable into the case that uses it, which silences the warning:
> 
> arch/powerpc/xmon/xmon.c: In function ‘bpt_cmds’:
> arch/powerpc/xmon/xmon.c:1529:13: warning: statement will never be executed [-Wswitch-unreachable]
>  1529 |         int mode;
>       |             ^~~~
> 
> Fixes: 09b6c1129f89 ("powerpc/xmon: Fix compile error with PPC_8xx=y")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
