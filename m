Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A0550641
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 19:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQMn05CdSz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 03:08:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ELooSgG/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ELooSgG/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQMmL1dDyz30LC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 03:07:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D86C260D36
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 17:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9CAC3411A
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655572062;
	bh=KqmNordb+QHA2ZI4oQIWOsfJ2gjxU8YjcD2HdXlvMzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ELooSgG/KSJ7yFrax/Y2UJqiGNJlBJKaVV3AuacAx8foXpCJ/x7LCblKOywfWoUDy
	 t1Z7NFEOPotYx1Hhg9GHWUolRA2LiruJX6MjwGIbbu82G1uaw+pdulwYSDtxR1A8fs
	 KuqAiSJsHBPijwOK7EEH1jtX+1NXbPNcY0md992sI5ZzDvHTkGziZ4EDjSDitVd/Qr
	 DQ6WIywLeZ2m/TmIcwWzj3sAxUKXOQKf3OWVcvLGbO+1kzTTH65miHIQGIdFmlNPkg
	 xqCeLTqnELDuiZN3jglByq9zDhbV2HyUC2SCXvV7M9+NW9lZ35iCoyljjVIeFfrEDP
	 43tMXCXxdowWA==
Received: by mail-pj1-f48.google.com with SMTP id m4so3441994pjv.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 10:07:42 -0700 (PDT)
X-Gm-Message-State: AJIora9lnFk/AiZr7FisIri5MRhEg9SFnh9Aq7aRpyA2M9SViLs1wpJi
	G5OUmeaEQW2tH0H51J/8hGX0FgBKL414shM7y0o=
X-Google-Smtp-Source: AGRyM1sNRZu0x7H3Y0OO0426x3Ze9/v/FHGS+rQpIQqiGzcKpJfW9zzE6W7AVtBlMKAfJLfQm+5wy2fo5G+EVxxh0I8=
X-Received: by 2002:a17:903:1c5:b0:167:71bd:462f with SMTP id
 e5-20020a17090301c500b0016771bd462fmr15669728plh.65.1655572061950; Sat, 18
 Jun 2022 10:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220618060850.4058525-1-windhl@126.com>
In-Reply-To: <20220618060850.4058525-1-windhl@126.com>
From: Timur Tabi <timur@kernel.org>
Date: Sat, 18 Jun 2022 12:07:05 -0500
X-Gmail-Original-Message-ID: <CAOZdJXU6R1wma8VXwfPYzq6eSkT84DiXb+3eQCEVanLZC2LQ3w@mail.gmail.com>
Message-ID: <CAOZdJXU6R1wma8VXwfPYzq6eSkT84DiXb+3eQCEVanLZC2LQ3w@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: Fix refcount leak bug in ucc_uart.c
To: Liang He <windhl@126.com>
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
Cc: Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 1:09 AM Liang He <windhl@126.com> wrote:
>
> In soc_info(), of_find_node_by_type() will return a node pointer
> with refcount incremented. We should use of_node_put() when it is
> not used anymore.
>
> Signed-off-by: Liang He <windhl@126.com>

Acked-by: Timur Tabi <timur@kernel.org>
