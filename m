Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B442E78FCB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 13:54:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tujk+flZ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1DPIkngr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rcc0941Rfz3c6c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 21:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tujk+flZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1DPIkngr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=dkirjanov@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 599 seconds by postgrey-1.37 at boromir; Fri, 01 Sep 2023 21:16:14 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcb7f0c4wz3bY3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 21:16:13 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0783F2185A;
	Fri,  1 Sep 2023 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693566360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddEY5hmSfZEknJMt5BoR/ARnTSJr3qAhZpAWd1WA6sQ=;
	b=tujk+flZ+MtJfbZ24Hkdo/mLpNv2iBxplhrqI4DTvD6ardJEvbGN22FLMMCdL1JwkgG/+2
	UtbMU0SLpsAzeGbt2SGkU+oRBWyJZMPKhiBXItouA8u5TvNXsAjaTVWGhDEKTmWJafBmr+
	mvr9HU7Gna1Lx42+GAwrO4n0IKjZfYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693566360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddEY5hmSfZEknJMt5BoR/ARnTSJr3qAhZpAWd1WA6sQ=;
	b=1DPIkngrFTwgdEMkgQz8P5Y0/tY0WRXCjjRLeZLK4EnAC4eVNM1mjOjg5Xf9+aZecC2jQu
	62xXsGSJRgmApRAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAA8F13582;
	Fri,  1 Sep 2023 11:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ODsjJ5fF8WREdQAAMHmgww
	(envelope-from <dkirjanov@suse.de>); Fri, 01 Sep 2023 11:05:59 +0000
Message-ID: <7b8be7bd-baf2-15c0-2a0c-ddf64839a451@suse.de>
Date: Fri, 1 Sep 2023 14:05:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] fsl_ucc_hdlc: process the result of hold_open()
Content-Language: en-US
To: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGA0LAg0JTRjtC/0LjQvdCw?=
 <adiupina@astralinux.ru>, Jakub Kicinski <kuba@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
References: <896acfac-fadb-016b-20ff-a06e18edb4d9@csgroup.eu>
 <20230828121235.13953-1-adiupina@astralinux.ru>
 <20230828123849.69466f0a@kernel.org>
 <977826f0-3289-53bd-b3f6-90977a4e0ca0@astralinux.ru>
From: Denis Kirjanov <dkirjanov@suse.de>
In-Reply-To: <977826f0-3289-53bd-b3f6-90977a4e0ca0@astralinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Sep 2023 21:54:06 +1000
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/1/23 13:48, Александра Дюпина wrote:
> Thanks for the review!
> 
> 28.08.2023 22:38, Jakub Kicinski пишет:
>> Don't you have to undo all the things done prior to hdlc_open()?
> Yes, it looks like I really need to undo everything that was done before hdlc_open().
> But the question arose - would it be enough to call the uhdlc_close(dev) function?

looks like it is.

> In addition, it seems to me and my colleagues that a call to hdlc_close(dev) should be added to the uhdlc_close() function, similar to the 

yes, take a look at the comment for hdlc_close()

following functions:
> 1. drivers/net/wan/n2.c (n2_close function)
> 2. drivers/net/wan/pc300too.c (pc300_close function)
> 3. drivers/net/wan/pci200syn.c (pci200_close function)
> 4. drivers/net/wan/wanxl.c (wanxl_close function)
> Tell me, please, are we wrong?
> 
