Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EED7B3A4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 20:57:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAqvKwj6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ry0340knFz3cl1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 04:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DAqvKwj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ry02914S5z2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 04:56:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c5db4925f9so7789805ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696013802; x=1696618602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viFu6r0UYe+M2GIK9v2NmILPjJMba2+ouWRdc3CGGmo=;
        b=DAqvKwj6mtvSMaTwpmTGLdBlrW+OUTrXigYbAbCEt2Cc/CGAbssL4b9NpRb82/8Gag
         PkO5KDF0vD9YLCO7NJqi3BgG0k6BZcGzpypkRjk6XpOW45BC2GCuU2DQhKYHAcsDOh05
         abZ6xaUvphrKp9v+1A7887xGoAc8cfwR0W+Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696013802; x=1696618602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viFu6r0UYe+M2GIK9v2NmILPjJMba2+ouWRdc3CGGmo=;
        b=D18eVwSfGP+ej5O6lsjnDIprR9ETXYSfSdTTjN0Ac38V6HWBPPsznErFffrFbO/VsN
         ARSK2W6lX5kqBVkWDWNMJPNKCPQGnwqomyDV4CafE5GrC0AYjEvqMXb/T9JwfYqQk9ga
         tl0DTcAb+nB4HJX7jTqqCZfZhIUrxzX6UpZz21gqBKN2U4Wi+IGebyKiYN5TfnlF1NDz
         ax4EPrPREZxSkKH/EpqBRPo9bf3gcF8Dvv1p+HJP/oO4u2hqZ6X7i7mY9BNGrWXD6AcA
         fD5znSbDIbJQ/EYl7BvLRGJ/XrrAZatNVUqhljFeSaO+My8iwxhiWsns55nKSXi4i869
         i1MA==
X-Gm-Message-State: AOJu0YzY01xbPAOUT1LuAcEZiAp0u9oIye+Puld4qLZyvVySDsJ9EUJB
	H4AKEUgVicsXCmE2i8vCAOitfA==
X-Google-Smtp-Source: AGHT+IG6ycLvJhoXuGVCEKkMG9iMqITIOTXsWbm9Kz37/RyNws1GzSB+B8H7SuyFFn3vA3gbgMfwlw==
X-Received: by 2002:a17:902:c948:b0:1bf:193a:70b6 with SMTP id i8-20020a170902c94800b001bf193a70b6mr8030559pla.5.1696013802531;
        Fri, 29 Sep 2023 11:56:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001c733c0e456sm3829091plb.22.2023.09.29.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:56:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] hwmon: (ibmpowernv) refactor deprecated strncpy
Date: Fri, 29 Sep 2023 11:55:45 -0700
Message-Id: <169601374243.3010937.14194696181874272859.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919-strncpy-drivers-hwmon-ibmpowernv-c-v2-1-37d3e64172bc@google.com>
References: <20230919-strncpy-drivers-hwmon-ibmpowernv-c-v2-1-37d3e64172bc@google.com>
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
Cc: linux-hwmon@vger.kernel.org, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Sep 2023 05:22:51 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `memcpy` as we've already precisely calculated
> the number of bytes to copy while `buf` has been explicitly
> zero-initialized:
> | 	char buf[8] = { 0 };
> 
> [...]

Applied to for-next/hardening, thanks! (I've updated the Subject here
and with the older "refactor" subjects...)

Take care,

-- 
Kees Cook

