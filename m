Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 352D113D218
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:17:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yns65tk2zDqBy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynLq5xtxzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:54:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=O99RfooA; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynLq4pP7z8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:54:43 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynLq30B8z9sRQ; Thu, 16 Jan 2020 12:54:43 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=O99RfooA; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynLp5Yx4z9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:54:42 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id z14so17722137qkg.9
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26tJUxlWxyJYuQyhtm6k+kcB4ixHj93vV0BGb0hv06E=;
 b=O99RfooApnCzFGt8y/Ltmnp0p7zWFVYj9Sfr4UII+0AF4Taj1S71uI3mH2PheOg41e
 8b0aB3fEThPxUVF4smURYZQ3Idwz4wTmKvJBUjQN1o83UAaEViur1VEKkDBoAmFWpNTv
 cVqn8KlmyuTf6/KWrCNDeAsq5jMIIX+HuydnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26tJUxlWxyJYuQyhtm6k+kcB4ixHj93vV0BGb0hv06E=;
 b=M89yq6oseB6DtNoRn8wm9MWb+rjsc3w9o4BH5ROGuNL7C9D6koHGHw3aKcxgKtgBeK
 PlJ3/v8+htPXMZLaVgXScpp/RGWKfsjCz15BHapBpptANJL1JE1pKOU2EB+C3Man5tIJ
 va/xeT5Y/kCmOmZQ5AD87KXPf1ZkWgtdMEv6H1+AJjCqE2c3iodfG1ciyKxU7szTscDZ
 6L7FMv00pbKcAPmWA3xa39a3O8MckcPGDt3wslqQ7mlmsXKyS/e94VoTziAupPQX727U
 pnyHxVCPQUFs0X2owECXuKiIGjrrrSMS6zTNFxWGYXZU7YAyhEADNOw0feSPMLnvPZZp
 mE4A==
X-Gm-Message-State: APjAAAVhXWqIkDqSnxfla3srt1ZV1V3TrIPY3b5FAX6PeNhVa6k5DqWH
 ii/y1xtEFULtgPURfDUgSpS5KuyfsPhxRkDZZFQ=
X-Google-Smtp-Source: APXvYqwMb7D8yeD2y5VXY9lQ2hWXsvwE5HsBAAuzpuSRZF+RdX4HL+eBRFltKbZ0Um8smNMjM57XVRyVJIYGNwcC4Xo=
X-Received: by 2002:a37:68d5:: with SMTP id
 d204mr26303564qkc.171.1579139679400; 
 Wed, 15 Jan 2020 17:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-1-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:54:27 +0000
Message-ID: <CACPK8XdqTn=WpydjJ4888KMF4N4LiF0jL_FYx8Yy0d8dnMiC1Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] powerpc/configs: Drop CONFIG_QLGE which moved to
 staging
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The QLGE driver moved to staging in commit 955315b0dc8c ("qlge: Move
> drivers/net/ethernet/qlogic/qlge/ to drivers/staging/qlge/"), meaning
> our defconfigs that enable it have no effect as we don't enable
> CONFIG_STAGING.
>
> It sounds like the device is obsolete, so drop the driver.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
