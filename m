Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79D2A6E4A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:44:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRHCq4FvlzDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pX29kLlm; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRH386RrDzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 06:36:51 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id h62so3434948wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ErfYpYEPgr7SyR0IGrTLDHOPTVsMeF+NG57/GEyOHB0=;
 b=pX29kLlmBcSPTSQCXTO8Lo9d4QG+nqnnImw6YFxmstscNqOOswbExguUzzT4L2axlU
 D3GWk5jA11ZzA+AZVtegLCVhl2Ob2ZmAEEHVzMHCsciCYwyQTL8h89K8WzLvAsv7TRcu
 7yI+7qd87nij+dGvWnf+2yyWANiI/xOXRymlotH13o1iY4W7M550ffyUTs+i/hqzxRcZ
 TKhz+VRg0g9MO6Q9omYUAHnyYyG0b/tNB7yPcru/BSqEkR7LGsnBTwhTnSMhBAoFeI05
 ZFKQqxZhOGvRVRNlQ6UmnNU504R2+m9kxBQlMwaHA65WTwkPAt9WKivfMsX/iLNdWsoh
 CY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ErfYpYEPgr7SyR0IGrTLDHOPTVsMeF+NG57/GEyOHB0=;
 b=SrJdjEmbqijaW6iLzYyeTniakMGSbN7ojAJpbLuhsDVi0a8+/0bZUYsM1hJrdwzEqX
 7VijYgr5McfkRa+rtVtPxs+i7UYYy/SzwjuPIJRroVk7h3by1em/Yzb6nRN1CDvkUD+r
 AozbB2FZCD2AjWuog5oM0BAB2SILpseW55vDuS0Fd5A4llIGCJUaiMgTCxAkse+okrFi
 3VvYJ4IkXZze+p1pYSlzrljNUfArDNX+UGnpNcCodje6nXHetYaDw7tLIcXR5dG+0TXd
 5pE6+5PL3JgqG7cezD9IE1Tl2aUK6ayz2LUY5N7lHh3XRv48jSaKFFBVVBa7ljya3agN
 a3Pg==
X-Gm-Message-State: AOAM532MvvzD4QhaZgnpBdrV0gPhZLqvEKMvUwx1a6fTkFFMqqR2P5oW
 4TsKmykCEm0ONpE8p4AWoDeS3Q==
X-Google-Smtp-Source: ABdhPJztfIELyaPKKHSKpD48Wccw9fHxSvlItbhEYnm/xRNIcnSe+Wnjs2/1thwCJMJZLY6LsZDnhw==
X-Received: by 2002:a1c:a90e:: with SMTP id s14mr6477604wme.46.1604518608351; 
 Wed, 04 Nov 2020 11:36:48 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:36:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/36] tty: serial: pmac_zilog: Make disposable variable
 __always_unused
Date: Wed,  4 Nov 2020 19:35:47 +0000
Message-Id: <20201104193549.4026187-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/tty/serial/pmac_zilog.h:365:58: warning: variable ‘garbage’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-serial@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/pmac_zilog.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/pmac_zilog.h b/drivers/tty/serial/pmac_zilog.h
index bb874e76810e0..968aec7c1cf82 100644
--- a/drivers/tty/serial/pmac_zilog.h
+++ b/drivers/tty/serial/pmac_zilog.h
@@ -362,7 +362,7 @@ static inline void zssync(struct uart_pmac_port *port)
 
 /* Misc macros */
 #define ZS_CLEARERR(port)    (write_zsreg(port, 0, ERR_RES))
-#define ZS_CLEARFIFO(port)   do { volatile unsigned char garbage; \
+#define ZS_CLEARFIFO(port)   do { volatile unsigned char __always_unused garbage; \
 				     garbage = read_zsdata(port); \
 				     garbage = read_zsdata(port); \
 				     garbage = read_zsdata(port); \
-- 
2.25.1

