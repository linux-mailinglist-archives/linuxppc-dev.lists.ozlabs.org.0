Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5A563D4E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 03:03:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZYjB5xf0z3dvc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 11:03:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WOVRwA7H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WOVRwA7H;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZYhX59lSz3bnd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 11:02:51 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id w24so4129339pjg.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Jul 2022 18:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+QLbq0w+CZfYo6/BgLDLv123MX+VJmesqUpPeKC97pk=;
        b=WOVRwA7HSikldTi++/cqjLgkGyx1K0hCf5nuW4OrFlAXhnRTSF+Y/yNNej6ML6yzcE
         V6nLGsFv65rOYWATYTvQBSr/zmmYpBIMTmmdr5IW1yWU/C9qqD6ZjH2/SBxE8T2AFOnb
         kI4fj3fTeYBB7YR2SCUhm9s0bMSGtNGi6k09c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QLbq0w+CZfYo6/BgLDLv123MX+VJmesqUpPeKC97pk=;
        b=muhafPI10QKhSACYGkCPbryC+DRxNN6rVQOmwlYoa0+WyTfustCdTisjxx1Rl6abWR
         sKo8cIG/ve5SaCUbjUo1jDJBtcYoL+sc7uW5KGM5G0SdscQ7/hX1uR3Z/kuLRQvf1FSg
         AWXQLhEL8xHFJOXWeze/gdoRoVNdyfmh5k3BM3L7+y9noXP9/4+jAWK0kgB5m6KPJrZR
         6IQ4FPy7ZqHsvB9fcTgKCXeb6AuKMjjcN/9zSXMYjkdGbUD7E8CGNUQ7HmAugyvgZJpU
         yhy9d0FTE+JfZx8xyQ+KduIEv7hvPERhJNFjFH0NzybobmsHT+Z8WtdXIDOBM3JzHx//
         ljWw==
X-Gm-Message-State: AJIora84Hptq7gPCcj2mGZ4blGClAi1EYHVdVuWO2aaKcaZ+/RZZFfL6
	xIHLyNxynby6hcDpQtlbuoLkeQ==
X-Google-Smtp-Source: AGRyM1vr8gIh5aKj2l7LLWkGGNi1HXOfn7r3prwi2OEXDiHlxyrQv2BZHDG3gbMUAKS+m12eq68kNQ==
X-Received: by 2002:a17:902:ea07:b0:16a:2833:3207 with SMTP id s7-20020a170902ea0700b0016a28333207mr23231909plg.86.1656723768114;
        Fri, 01 Jul 2022 18:02:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g10-20020a170902934a00b0016a11b9aeaasm16113169plp.225.2022.07.01.18.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 18:02:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: gongruiqi1@huawei.com,
	elver@google.com
Subject: Re: [PATCH v2] stack: Declare {randomize_,}kstack_offset to fix Sparse warnings
Date: Fri,  1 Jul 2022 18:02:43 -0700
Message-Id: <165672376092.2486882.1451446093485208376.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629060423.2515693-1-gongruiqi1@huawei.com>
References: <20220629060423.2515693-1-gongruiqi1@huawei.com>
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
Cc: Kees Cook <keescook@chromium.org>, xiujianfeng@huawei.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jun 2022 14:04:23 +0800, GONG, Ruiqi wrote:
> Fix the following Sparse warnings that got noticed when the PPC-dev
> patchwork was checking another patch (see the link below):
> 
> init/main.c:862:1: warning: symbol 'randomize_kstack_offset' was not declared. Should it be static?
> init/main.c:864:1: warning: symbol 'kstack_offset' was not declared. Should it be static?
> 
> Which in fact are triggered on all architectures that have
> HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET support (for instances x86, arm64
> etc).
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] stack: Declare {randomize_,}kstack_offset to fix Sparse warnings
      https://git.kernel.org/kees/c/375561bd6195

-- 
Kees Cook

