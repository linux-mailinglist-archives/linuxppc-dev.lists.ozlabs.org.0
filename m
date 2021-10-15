Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97C42F84E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 18:35:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWBh60PPsz3cCf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 03:35:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OAneOMA7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OAneOMA7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWBgR3BZXz2yyS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 03:34:27 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12D4C6124B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634315665;
 bh=CeRkCWgGmv/lIzYdYu8TkmPyC9GDgaOguZhhWXNJNFY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OAneOMA7XZSFOfZz+nHz+4YXLFXmDwnHzcWC4zY6bn20z/F83fiY2OWgIcZ4C3Ijp
 U/kfatfek+/t6NhOK9eYmxHYG/EWHm+UGxGtwMZiPqlbDC8nUHYskjewvHnxJnQ1od
 jA4aZ/pUQ2VK0jZkcrAjqLPnR+P+mKmFb1OTDJ2JYzsLnW1BjWHI8cYHoZGdbVcsHn
 qexoVBqm6mUGlFC/34RkVMaWg5Ej7m+/T2iNVvPWNbjDuBE+0z/8aN8KhHv+vCOjKY
 U9fnn7e0HePffvnKv9p9aBvuPub8zLiMZlR1uhMzw0kndBseFhetz8LUVr2/0Lgubh
 dygurnBytBxfQ==
Received: by mail-ed1-f47.google.com with SMTP id d9so40120276edh.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:34:24 -0700 (PDT)
X-Gm-Message-State: AOAM531NJKCEwgkq3rII8oF1kACM46i+BLBFL6l82mM5psBEV2TNCYHl
 sZ0xdz0gCJQxCnPDknAR8dW9P8PvgGmDxzgpJA==
X-Google-Smtp-Source: ABdhPJyib4rggH0EElJoYb3M6MGXjTs3c3OVEluVFhpPqQmG+CA7o8G7W5ifQ9eqdM31IDo3cVTH/0BnZYFo2iafnjg=
X-Received: by 2002:a17:906:6a1d:: with SMTP id
 qw29mr7817053ejc.147.1634315663388; 
 Fri, 15 Oct 2021 09:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211013220532.24759-1-agust@denx.de>
In-Reply-To: <20211013220532.24759-1-agust@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Oct 2021 11:34:12 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ThrytPNx06bD4EOBGMQ8NHqJFUX8JuR-4q5KrzJbO_g@mail.gmail.com>
Message-ID: <CAL_Jsq+ThrytPNx06bD4EOBGMQ8NHqJFUX8JuR-4q5KrzJbO_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Update mpc5200 dts files to fix warnings
To: Anatolij Gustschin <agust@denx.de>
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
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 5:05 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> This series fixes localbus, memory and pci node build warnings.
> It was tested with current linux-next on digsy_mtc and tqm5200
> boards.
>
> Anatolij Gustschin (4):
>   powerpc/5200: dts: add missing pci ranges
>   powerpc/5200: dts: fix pci ranges warnings
>   powerpc/5200: dts: fix memory node unit name
>   powerpc/5200: dts: fix localbus node warnings

For patches 1-3:

Reviewed-by: Rob Herring <robh@kernel.org>
