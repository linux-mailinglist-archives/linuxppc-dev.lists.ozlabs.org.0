Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E7196335
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 03:50:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48q3B16g7pzDrBj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 13:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.26;
 helo=mail26.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=ZfQ6SBAp; 
 dkim-atps=neutral
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 48q38734yHzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 13:48:54 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585363737; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=+WpPnB0uFYRHxbJdTSXbZ3CsA3rPO9kHVEIdO35S7As=;
 b=ZfQ6SBApxW3aC6QZFlI80tZ9DhRKeQ85/lLJhUYRUs0v5cbirnS4l0DDi8+fQHTGlaJ8xRfe
 6KTw3C6A3cq8jkwFPew/hwj4rwjvpT5EDo+Bk2GLJUJyUspsn/CpgEo/bzGqaRUO7HPemGKu
 9ezrkmECDCB9vedWz1qTX80MruQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ebb0a.7f1601e7d688-smtp-out-n04;
 Sat, 28 Mar 2020 02:48:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06272C433BA; Sat, 28 Mar 2020 02:48:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 SUSPICIOUS_RECIPS autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net
 [104.54.226.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bcain)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A7892C433F2;
 Sat, 28 Mar 2020 02:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7892C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=bcain@codeaurora.org
From: "Brian Cain" <bcain@codeaurora.org>
To: "'afzal mohammed'" <afzal.mohd.ma@gmail.com>,
 "'Thomas Gleixner'" <tglx@linutronix.de>
References: <20200321174303.GA7930@afzalpc>
 <cover.1585320721.git.afzal.mohd.ma@gmail.com>
In-Reply-To: <cover.1585320721.git.afzal.mohd.ma@gmail.com>
Subject: RE: [PATCH 0/6] Kill setup_irq()
Date: Fri, 27 Mar 2020 21:48:38 -0500
Message-ID: <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQH+2owB65JuA03jeOLwO39OK5TmSwJQWNztp/kerbA=
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
Reply-To: bcain@codeaurora.org
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: linux-hexagon-owner@vger.kernel.org <linux-hexagon-
> owner@vger.kernel.org> On Behalf Of afzal mohammed
> Sent: Friday, March 27, 2020 11:08 AM
> To: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; x86@kernel.org; linux-
> sh@vger.kernel.org; linux-s390@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-parisc@vger.kernel.org; linux-
> mips@vger.kernel.org; linux-m68k@lists.linux-m68k.org; linux-
> ia64@vger.kernel.org; linux-hexagon@vger.kernel.org; linux-c6x-dev@linux-
> c6x.org; linux-omap@vger.kernel.org; linux-alpha@vger.kernel.org
> Subject: [PATCH 0/6] Kill setup_irq()
...
> Note 1: sh toolchain is available, but that will not make the  relevant
changes
> compile as it has dependency of 64bit arch toolchain,  did try a Kconfig
hack
> to make it compile w/ 32bit sh toolchain, but it  failed due to other
reasons
> (unknown operands), so gave up on that.
> Note 2: hexagon final image creation fails even w/o my patch, but it  has
> been ensured that w/ my changes relevant object files are getting  built
w/o
> warnings.

Afzal,

	What's the nature of the failure in "Note 2"?

-Brian
