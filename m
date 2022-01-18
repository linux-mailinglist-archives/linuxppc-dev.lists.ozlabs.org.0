Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B510492170
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 09:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdMhk071rz3bNC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 19:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DCLSLN8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=DCLSLN8W; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdMgq0J2Qz3bSl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 19:41:26 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id e3so64907911lfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KayE+dD9BOJPbBI3dzY5YWHtd7b0tO6VXGPUQ7A3tSo=;
 b=DCLSLN8WIBnU7Hxizbo3PUruGT2r/4vhs+wQQEEc2OOrewVjYLvioOSxRM7Nem8ruU
 qqv+iahul3Comoky8pxi/sCjrwsqsb4ZH7q4h+KVMzCZCBd1EUpEadQTuuOb9cvNYglF
 coVLRUBnbCLrdLK/Ho/sAy/z+fGIdn3FnsztK8vjNNvpQNG4+3hpBiETh6AYBi7AONNO
 XZP3Eaz5EsoMNt/6rWjplvGywTFKYBwr3Zt4BFrudrP4cer3QEpM/vHF+ncCMOJZOAQw
 ZkpB62Q8oaUz/Z7BF5E0/xascFRcZv465Axfu9pQj+iiX+VsTxvswI3sIpoViPSyIWla
 Waqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KayE+dD9BOJPbBI3dzY5YWHtd7b0tO6VXGPUQ7A3tSo=;
 b=kKhpnixioXyf1BZ/YnmFNn7gas8KOM+aulF8SlSvdOVcCWb/UbCqGjjMqGJL0Y6mLv
 UQn63eCfVmOU3p2KxRh1V4TYBd0jlmlrpm58byvF5BJDuGhPfb+6EE+SGCM2XbBEdjgM
 rpOalzENEeo2YUeil6wEOWKIxhCWghN/GL/aXXQIP+dC4SeuJMRqM6TwqRY3umzEXK/F
 tXzOrcc2v28LjI9N2EWVA7XjUyfeUOa7+i6aIGNhEXuOFC0iUTizdhmtqUASSmM7QMHr
 /TCi+nB0AP+gEhPalP4uwjnmOSep2Al2oHeOlRlHQ3gCcIJhY4eejaUWzJixd4fv66l0
 o77A==
X-Gm-Message-State: AOAM533+JSANbhJ1kqkqW6oi90wbG3paKveNakM3c6zzOAhg7Fm/zeD3
 vVmqEqNO2PNQQYxuRm6ky67K3gT3gO56nQ==
X-Google-Smtp-Source: ABdhPJwYYYw7AZR9dAg45TO/f05v2lVVcZQ6g00aO7hhIvX7+FI5r6NaI0qaM2apqWQ4D/SSaZVJxQ==
X-Received: by 2002:a19:5f51:: with SMTP id a17mr19365584lfj.122.1642495282602; 
 Tue, 18 Jan 2022 00:41:22 -0800 (PST)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id k8sm779383lfg.1.2022.01.18.00.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 00:41:22 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net, kuba@kernel.org
Subject: Re: [PATCH net 3/4] powerpc/fsl/dts: Enable WA for erratum A-009885
 on fman3l MDIO buses
In-Reply-To: <20220116211529.25604-4-tobias@waldekranz.com>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-4-tobias@waldekranz.com>
Date: Tue, 18 Jan 2022 09:41:21 +0100
Message-ID: <874k61cu6m.fsf@waldekranz.com>
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
> This block is used in (at least) T1024 and T1040, including their
> variants like T1023 etc.
>
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>

Fixes: d55ad2967d89 ("powerpc/mpc85xx: Create dts components for the FSL QorIQ DPAA FMan")
