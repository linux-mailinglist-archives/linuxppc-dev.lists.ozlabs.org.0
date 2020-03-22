Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A118E73F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 07:58:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lSyh3Gr0zDqtd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 17:58:20 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=smtp header.b=iXrIdEDe; 
 dkim-atps=neutral
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Sun, 22 Mar 2020 17:56:51 AEDT
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 48lSwz6hv3zDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 17:56:50 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584860210; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=NqefWYA7oKSyYiu2yGdTUR8SlVG4/Arckme8ISShSZ8=;
 b=iXrIdEDelVwvz0/GHd1PHS3DOLR+Z4BCbB2PlI5D4KHEu8CnoJH0VXpoRYR0CgumNULrZkXf
 Ms0auVOC2aHYWvoHzNbvnVUyImpnZ1eOWhGaQCi+QZ4sVfW+G0hTo/fg7PMgHmIehMM9S1wT
 ALg10PYrTM/90Cd891btiUFE7vY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e770aee.7f2499bb8538-smtp-out-n01;
 Sun, 22 Mar 2020 06:51:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3DD2AC4478F; Sun, 22 Mar 2020 06:51:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38C5DC433D2;
 Sun, 22 Mar 2020 06:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38C5DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "Joel Fernandes \(Google\)" <joel@joelfernandes.org>
Subject: Re: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
References: <20200322021938.175736-1-joel@joelfernandes.org>
Date: Sun, 22 Mar 2020 08:51:15 +0200
In-Reply-To: <20200322021938.175736-1-joel@joelfernandes.org> (Joel
 Fernandes's message of "Sat, 21 Mar 2020 22:19:38 -0400")
Message-ID: <87a748khlo.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
	".ozlabs.org"@lists.ozlabs.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
	Oleg Nesterov <oleg@redhat.com>, linuxppc-dev@lists,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Joel Fernandes (Google)" <joel@joelfernandes.org> writes:

> Reword and clarify better about the rwsem non-owner release issue.
>
> Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/
>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

There's something wrong with your linux-pci and linux-usb addresses:

	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,


	"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,


-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
