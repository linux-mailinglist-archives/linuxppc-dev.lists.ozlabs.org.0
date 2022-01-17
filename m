Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF234902E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jck2F1vs2z3bV6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=viRDtpeg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=viRDtpeg; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jck1b4HF4z2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:24:32 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id b14so35658250lff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 23:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=EKQKtl0HMrpVhiuwin/tzZY8SOxpyFb5Q17+Qj5KqcY=;
 b=viRDtpegzW5nXkSDQEsb2LFF906I4+LaV8BcpG+yhWa725oz2aFO0Yfjxl8GQ8cuiq
 de/Gu44z8OP8qLp8hnEPqo8UWhygdVP2oE2FYt1QDvo2DxoipYu4T6lWJE9us5+3fi1k
 5zXAj+eYACgGvSId1jOzED5zx686MrCJ07jm/gq7OkoEX17N4FlflKjqOChO9m7HnVy1
 MbyxvyeC2BxjUKj2ZBh80WljteA/ZxbEjaVojhtz2f2btHezvEYc95GRQq4wIHlKUX5V
 ddbIRPwSns32ofYzrcfdLiLtiFqa/Pr1fmvQ9HEEDmhNRV5S8tlVdxP28/WyDY5cLxPd
 gj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EKQKtl0HMrpVhiuwin/tzZY8SOxpyFb5Q17+Qj5KqcY=;
 b=hhO3IoIhMVuEGzb4qYtWAgQpYO02n0KYa+144nmDteuAb32zlkCsGxZi4wFFw7HD1d
 ylgZC9PWlmELwk6fXOCPIxdQVMRmfbSRhCTF0wlcW1NqUNaECtkGyxxOw8WhVuuotZ39
 q8cWCcKsjy/x0fC5vVzwJS1ekuo4pMa6ZsCTq4OcJiqpwU0U57vTkruMhIcueEvRLiSM
 PFHtXvUElkqvmgREgIFkNCNvr6wD8lttvug22zUzxXqwr2J4WDkeuhcvow5rhPBFJ0+e
 xgEH5tNJ1YXs/Ub2hUHlScnh/awIubqReT97DU9m+QnSKy+5X0DfE9zHN/zPoIxzqauk
 T2wQ==
X-Gm-Message-State: AOAM532N1bAWlYxFedNNbazQRafGnQuEbhRH2SV+jEtjrLFHVUDUxuOR
 /aeBJVqwqzAAEt01QLsK5hAr9LVHChJ2UQ==
X-Google-Smtp-Source: ABdhPJydjGVwZwOYF3Sov6EeiRjKAo/leF5UAFrr0paBHQvdmk/Zax99dmMM9gu1iIGsj2j50Gdqfw==
X-Received: by 2002:a19:f616:: with SMTP id x22mr15969174lfe.618.1642404266369; 
 Sun, 16 Jan 2022 23:24:26 -0800 (PST)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id c5sm482267lfp.105.2022.01.16.23.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 23:24:25 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net 1/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
In-Reply-To: <YeSV67WeMTSDigUK@lunn.ch>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-2-tobias@waldekranz.com> <YeSV67WeMTSDigUK@lunn.ch>
Date: Mon, 17 Jan 2022 08:24:22 +0100
Message-ID: <87czkqdduh.fsf@waldekranz.com>
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
 paulus@samba.org, kuba@kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 16, 2022 at 23:02, Andrew Lunn <andrew@lunn.ch> wrote:
> On Sun, Jan 16, 2022 at 10:15:26PM +0100, Tobias Waldekranz wrote:
>> Once an MDIO read transaction is initiated, we must read back the data
>> register within 16 MDC cycles after the transaction completes. Outside
>> of this window, reads may return corrupt data.
>> 
>> Therefore, disable local interrupts in the critical section, to
>> maximize the probability that we can satisfy this requirement.
>
> Since this is for net, a Fixes: tag would be nice. Maybe that would be
> for the commit which added this driver, or maybe when the DTSI files
> for the SOCs which have this errata we added?

Alright, I wasn't sure how to tag WAs for errata since it is more about
the hardware than the driver. Should I send a v2 even if nothing else
pops up, or is this more of a if-you're-sending-a-v2-anyway type of
comment?
