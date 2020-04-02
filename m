Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70019C596
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:11:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tRNw5mfYzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=104.130.122.27;
 helo=mail27.static.mailgun.info;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=shN0gK8X; 
 dkim-atps=neutral
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 48tRCc6ch2zDrQV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:03:37 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585839817; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=MFdcBokfw79s+7lRCHgLw9NzMSmYZr6xzGhOl6ZSO68=;
 b=shN0gK8Xk5HKNXec5tNjYBYY2gfYBmXOZxSIKXIImpn7nPvB1oXJMnWKXY5MhSI0F6uo/Wtl
 d7xOWDqb/asqG2XPoht+ThJTCvL5Cd/FCyhij1kuPyWJW7KOxeietPGs/0MQxR6vUdANeyVU
 01oF4J6C5PpWvQZF1r/B6UwK95c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e85fec5.7f70c9e2ac70-smtp-out-n03;
 Thu, 02 Apr 2020 15:03:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 66FA0C43636; Thu,  2 Apr 2020 15:03:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 SUSPICIOUS_RECIPS autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net
 [104.54.226.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bcain)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 866DFC43636;
 Thu,  2 Apr 2020 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 866DFC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=bcain@codeaurora.org
From: "Brian Cain" <bcain@codeaurora.org>
To: "'afzal mohammed'" <afzal.mohd.ma@gmail.com>
References: <20200321174303.GA7930@afzalpc>
 <cover.1585320721.git.afzal.mohd.ma@gmail.com>
 <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
 <20200328073253.GA5250@afzalpc>
In-Reply-To: <20200328073253.GA5250@afzalpc>
Subject: RE: [PATCH 0/6] Kill setup_irq()
Date: Thu, 2 Apr 2020 10:03:28 -0500
Message-ID: <0fc601d608ff$df0ea550$9d2beff0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQH+2owB65JuA03jeOLwO39OK5TmSwJQWNztApEZe3IB1U/c2KfelGEA
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
 linux-alpha@vger.kernel.org, 'Thomas Gleixner' <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: linux-hexagon-owner@vger.kernel.org <linux-hexagon-
> owner@vger.kernel.org> On Behalf Of afzal mohammed
...
> On Fri, Mar 27, 2020 at 09:48:38PM -0500, Brian Cain wrote:
> 
> > > Note 2: hexagon final image creation fails even w/o my patch
> 
> > 	What's the nature of the failure in "Note 2"?
> 
> drivers/base/firmware_loader/main.o: In function `fw_is_builtin_firmware':
> /devel/src/kernel6/drivers/base/firmware_loader/main.c:132:(.text+0xc8):
> relocation truncated to fit: R_HEX_16_X against symbol
`__start_builtin_fw'
> defined in .modinfo section in .tmp_vmlinux1
> Makefile:1077: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1

Thanks for reporting it -- I will make a patch to fix it.

-Brian
