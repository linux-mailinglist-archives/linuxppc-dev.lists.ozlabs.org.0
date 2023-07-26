Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1C764179
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 23:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RBiICJQz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB72v44Mrz3bYg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 07:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RBiICJQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB7211TPBz2yDy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 07:53:26 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686e0213c0bso275745b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 14:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690408403; x=1691013203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o3CN+su3di7WaA9bWuG9cZg9fmgR34kXAM5LCkUKN0=;
        b=RBiICJQzenyR3+D4KJZHLpmaQiqoWkKDAQ3LssNG4zdPxb5jhUUj0L6CQFhsgam7vg
         H+zqZacAXrPed3+5TdMOZxPocLkXrVM+FkX/MgCbp9E/kRSRfQ27NA9MPC9Rbu7GxcaK
         o32dURpNXqUP7bKtXqJ+6vcXTllE/LtWrn89Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690408403; x=1691013203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o3CN+su3di7WaA9bWuG9cZg9fmgR34kXAM5LCkUKN0=;
        b=aJdhKsdTggpY7oM4UIML4I2X+2WlVD9ELgKtfjdCE9MpWF3HEo6Cy8s+B3ZB9QOmrG
         Xg+LBi9DQkhfiJdhJTOPCDKPmpjKROpPYu18Dqetb/SaMOaHV1HhTeRcyDLo5063n0uq
         MlitrQbneVkqKRCyeTs440VAqkKiZnG5VzhN9g9EcTwOFDNccH9aykWB0/Z74gQJEY7C
         Cfo7FaO7ZuhESw/E9+RaiZ8IJnkDl2LSBTISW9f7bxY7fqhnWo8CjTLhmL4TVMMKsVA0
         he+2EYw0vPOXkvMeAsNcKZnbLUiOa7Ljafa9ThHld2oFqX8sz49UgbZnY+VOrycqHY3x
         5yEQ==
X-Gm-Message-State: ABy/qLZPY0ZvX9u6ODXn4wnfcmHFH6N/6Q6sDeG6M5xeclE042ksVI15
	TqctDj+KCjvieicqKoHYRR9WSQ==
X-Google-Smtp-Source: APBJJlHxmqHoJCbHhpHOLxLueAFUER7U20Jsnko71nzWTdplk4lISZJmwPL6ZD+DateuphlGdXMrCg==
X-Received: by 2002:a05:6a20:13d2:b0:13b:77e6:4fad with SMTP id ho18-20020a056a2013d200b0013b77e64fadmr2492621pzc.59.1690408403634;
        Wed, 26 Jul 2023 14:53:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c20-20020aa78e14000000b0064aea45b040sm64996pfr.168.2023.07.26.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 14:53:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
Date: Wed, 26 Jul 2023 14:53:12 -0700
Message-Id: <169040838888.1782149.4842834187896840611.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
References: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 23 May 2023 02:14:25 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
      (no commit info)

Best regards,
-- 
Kees Cook

