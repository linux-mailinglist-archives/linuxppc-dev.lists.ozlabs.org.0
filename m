Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B66194902EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:27:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jck4y4fvSz3bPM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:27:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Y4PgqYTT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Y4PgqYTT; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jck4J49Z1z2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 18:26:56 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id o15so54067828lfo.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 23:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=z6NqL6PNEvFb1W3wQZNYqKK/+9djA4WTmwURAr5hxYE=;
 b=Y4PgqYTTImdCP3NIxORLy2ojzn+vUxzY3KOshj9cTcAUZE5/VtBcfauzM6l5e9F+Ri
 jJhzCCm4aLVQ2SYP/z2kAQcXEb4+dL7l6s4r+fm9YberTOfKk/l6VWovAuqC7r7MXjtH
 WHwAzKH11sB78Tt+Lywqp0BlU9gx+h8Z0Syq9bpwMTXo8hSJiZP935MeqNPHJItUKYal
 jRyZwo/UH1FUfUN92rJB7q0jEnNhHfvvse02e9OcE6chXAPAyhoez7uojfEn6/uG6DGb
 MiF6o9/l/Log/DMItkl0TqDVd66pDLkfzv90h0iMs5xB7KnV+twvhxxXgYHeeLFwOeEx
 cgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=z6NqL6PNEvFb1W3wQZNYqKK/+9djA4WTmwURAr5hxYE=;
 b=2OuPO4I4DYSTe7pMdahs7phkRPGe/QS0rV5krZNSwIheGKNSJkt/szEpLNO2BFcMIz
 hQnlWb3PHlFSdnUd9F/FB5PtHQA8GmmUInNW995refBjIoQB0HLDGxur9GsGJeDNWtc7
 d7R8iIfNlq8psuf/CdILrjs8QNNZnQvhmicNbLWBKSbwxhooUsdtgD+9mzGW+GkEXbiV
 q9d/O+QgteohYDIE35PAGa9dm32cYGH1BrnYxsuW2Lkltz3lK0ScKp09MhYbCyttso2x
 oze7DEPUIKmwl3EWPPNYBRNzHR8SyWCeIKhyAAjmoZ3r9koWWmyiKj2uP0hzgoHNPlxR
 dWoA==
X-Gm-Message-State: AOAM531KDI/+S9ks2ZwLzYsQkw+XWqbR1gr1juVVyXC7QDUjakfQIJL0
 wNvErMHU4MqYYu9X6wFpLljks7s3qlPPOw==
X-Google-Smtp-Source: ABdhPJxdmpCScApvX/ejVe8COOxLG78PTMe3g7JX4QNE/hb0AgUmXOOmSLZv79SbNWhfhdO4zfYoTQ==
X-Received: by 2002:a05:6512:1110:: with SMTP id
 l16mr10463776lfg.121.1642404411906; 
 Sun, 16 Jan 2022 23:26:51 -0800 (PST)
Received: from wkz-x280 (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id h7sm1308872lfv.104.2022.01.16.23.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 23:26:51 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net 4/4] net/fsl: xgmac_mdio: Fix incorrect iounmap when
 removing module
In-Reply-To: <YeST+TAREKIh2RXp@lunn.ch>
References: <20220116211529.25604-1-tobias@waldekranz.com>
 <20220116211529.25604-5-tobias@waldekranz.com> <YeST+TAREKIh2RXp@lunn.ch>
Date: Mon, 17 Jan 2022 08:26:49 +0100
Message-ID: <87a6fuddqe.fsf@waldekranz.com>
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

On Sun, Jan 16, 2022 at 22:54, Andrew Lunn <andrew@lunn.ch> wrote:
> On Sun, Jan 16, 2022 at 10:15:29PM +0100, Tobias Waldekranz wrote:
>> As reported by sparse: In the remove path, the driver would attempt to
>> unmap its own priv pointer - instead of the io memory that it mapped
>> in probe.
>
> Hi Tobias
>
> The change itself is O.K.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
> But you could also change to devm_ so the core will handle the unmap,
> it is very unlikely to unmap the wrong thing.

Good idea. I have some more changes I want to include in this driver,
but they are more net-next material. Will try to work in this change as
well.
