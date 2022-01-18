Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353BF49216C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 09:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdMh10SCGz3bZ0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 19:41:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GYa/Ng60;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GYa/Ng60; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdMgH3SRXz2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 19:40:56 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id d3so67549675lfv.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 00:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eFp60zM566fMUXfSuCkgCFAYaA/B6xtn0oTLQVf7dtY=;
 b=GYa/Ng60uMnUXuIDsrjGTxhPGC6+q3PUPOg6wzsKhejSjAJgS+AppUgZauK/wSefFR
 wuf3WAw2VJeHrpX1HXmc8Gg6tTnHC5RFk4HuIXSK7z8E93IWaznwicN5FCsXtWzg4jH3
 AtpLVYb+Cj2kfAe+wuQ8VrjtL0DPJ0yWlm2Ayw6dYtpqJRjbBT8N0Yyu3Bp+2rQ1dytW
 8XVlYTIia4l3MC+mkolW/+Jf7lWx2y8UKzwz5GJFmFndBK+OHCbBv9qigDtcdzESHyVt
 SO02zWQ5iqyr2WNizeTmkvr0L7sA4e34abMqhKC4tKkHbHD9pDEzNa5w10tVc8tNqNY9
 QHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eFp60zM566fMUXfSuCkgCFAYaA/B6xtn0oTLQVf7dtY=;
 b=MdB1fL+UfOWPD+rIpiUgyn2llTNYCQYjEoo3SiGUg+UGY0ijajrM0gK2NXUU/7rTPM
 e8cA2hYViwnlu5MeB8rMUTTEyY4Wi21sfDTlfjCm62t/DDSe8nf7IBr7cIKpf57nVTRj
 7CaHI7Sw5zGlRTEhcoFlQBsYRNoKnuWtRqyz6kjiPbspNF/384sXBGxv/ixBmQ3awOaI
 wmUeyFzWweL+84fW/dtk4UK82m72ExlbrAGVYDrBtPNfDlb141Dp/NwztQ0O8mbF0kd/
 zZazGClPB44Q2A6iocSWp0+jw8eAHubSjy60HKdIwXhD3bNtuNi8nv1qpt//M7iywocf
 gGsg==
X-Gm-Message-State: AOAM530HfpycDmlSlgUixc1MuUcDMIL/cQCyHI5HrsXBKhS4GyZWv9gR
 9UJZDcCYhtEYKCCTYDFHIFo8nDmxgUiiCQ==
X-Google-Smtp-Source: ABdhPJxH3hWdGIoDEmjUyMLh7W6a1jE2bVAw+f9XKolwCCvlMjdgnS9W7TYYx+CF3BL9/Bzm2BImhw==
X-Received: by 2002:ac2:4d86:: with SMTP id g6mr21321927lfe.682.1642495250673; 
 Tue, 18 Jan 2022 00:40:50 -0800 (PST)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id i15sm1615158lfu.108.2022.01.18.00.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 00:40:50 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net, kuba@kernel.org
Subject: Re: [PATCH net 1/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
In-Reply-To: <20220116211529.25604-2-tobias@waldekranz.com>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-2-tobias@waldekranz.com>
Date: Tue, 18 Jan 2022 09:40:48 +0100
Message-ID: <877daxcu7j.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 16, 2022 at 22:15, Tobias Waldekranz <tobias@waldekranz.com> wrote:
> Once an MDIO read transaction is initiated, we must read back the data
> register within 16 MDC cycles after the transaction completes. Outside
> of this window, reads may return corrupt data.
>
> Therefore, disable local interrupts in the critical section, to
> maximize the probability that we can satisfy this requirement.
>
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>

Fixes: d55ad2967d89 ("powerpc/mpc85xx: Create dts components for the FSL QorIQ DPAA FMan")
