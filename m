Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381E1715B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 12:09:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sqgf11KgzDqsj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 22:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FY89/SsX; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sqd84WLWzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:07:22 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t14so988694plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lmJQ36No1Gca/vcFrG4Eq9htTy7KPRzUbksdwrxz8LI=;
 b=FY89/SsX+eLNCZfl66UEb1ue7T2rDlxc39BUUNyQcUvYHLhQYmTZm8AV265dDcZriC
 n+pnoFgE+Sf8zXMbshaCCS6PUdHyFAtJ6zdH/VH1FXYuwfzu7iVLsjLF6SXNOrrDux5S
 VamD+96xP7YyeTt6xJaJYHlRfPSsbdooqEZo5JblB/xTNMzIpcuEBudbBh1o9hd+8Pp3
 VCC1Cl49y6FD+xnV0DQbsVUKowy7XWxJSXmwRChAoXpyUp1BbPkGQQ1IWMsgmCulUb0i
 idnYS7ecLxRWLTUTaFORqK3tstLgLRTwqSSk0D4o9TOL/U8ZbVv3Bk/xfDvuCNpgSmSI
 BGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lmJQ36No1Gca/vcFrG4Eq9htTy7KPRzUbksdwrxz8LI=;
 b=q+i9MowFkWDlhoRVzsKu89Ku9P4katvoYtfG7Zt7cFGuYbm1+4ARwzJjpV8z1fY5vK
 P2oiEPBQYTgJEBF2Y5qlUy6sL5P3vrHA/IsnHgoSvfMUXD7EWJbfbh0GmTDT90OA3fPi
 zPYCD1MPxUMb6Y4oX2xCQUECDkzCBk/5t8MzCezV0D8leXnofIkh/ivweMOLVsQ20S1X
 2FgC97I8+ZQVCT/Fh0g0mI5DTpBIrTKm8av8w7JqXq8v5dBNenq97F2wPRWNfZpCk/2c
 kkLl/KeEk+/8gVN3mPAR6xnplPc4do8CBFkRCrJQyunw9bbZdWn8zwyTbcDUEbJhaCMP
 ZU8A==
X-Gm-Message-State: APjAAAV9IdoG+d/sk405wyyEwMIIRxdOebR7Ic52CDXIcAHCYsGy4x8C
 cpzWsp/eIIVMiCMfVbq7UOw=
X-Google-Smtp-Source: APXvYqxWerA+MNtWPhmtZePrzWtN41f/X1PPHbm1Zy+BYl6m6MsiGmn5uHRszUhnUu+SXUCNhUoPbQ==
X-Received: by 2002:a17:902:8b89:: with SMTP id
 ay9mr3891143plb.309.1582801636613; 
 Thu, 27 Feb 2020 03:07:16 -0800 (PST)
Received: from localhost ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id c5sm6662799pfi.10.2020.02.27.03.07.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 03:07:15 -0800 (PST)
Date: Thu, 27 Feb 2020 16:37:13 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/18] genirq: Remove setup_irq()
Message-ID: <20200227110713.GA5708@afzalpc>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <87y2somido.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2somido.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, Michal Marek <michal.lkml@markovi.net>,
 linux-rpi-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Gilles Muller <Gilles.Muller@lip6.fr>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Thu, Feb 27, 2020 at 11:31:15AM +0100, Thomas Gleixner wrote:

> Vs. merging this series, I suggest the following approach:
> 
>    - Resubmit the individual changes as single patches or small series
>      to the relevant maintainers and subsystem mailing lists. They have
>      no dependency on a core change and can be applied where they belong
>      to.
> 
>    - After 5.6-rc6, verify which parts have made their way into
>      linux-next and resubmit the ignored ones as a series to me along
>      with the removal of the core parts.
> 
> That way we can avoid conflicting changes between subsystems and the tip
> irq/core branch as much as possible.

Okay, i will do accordingly.

[ your mail crossed my v3 (only one patch) posting ]

Regards
afzal
