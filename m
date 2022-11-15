Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FC62912C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 05:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBChC0kbcz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 15:22:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mpi-sws.org header.i=@mpi-sws.org header.a=rsa-sha256 header.s=mail201904 header.b=u0OZEBqL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mpi-sws.org (client-ip=139.19.86.40; helo=juno.mpi-klsb.mpg.de; envelope-from=msammler@mpi-sws.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=mpi-sws.org header.i=@mpi-sws.org header.a=rsa-sha256 header.s=mail201904 header.b=u0OZEBqL;
	dkim-atps=neutral
X-Greylist: delayed 318 seconds by postgrey-1.36 at boromir; Tue, 15 Nov 2022 15:21:44 AEDT
Received: from juno.mpi-klsb.mpg.de (juno.mpi-klsb.mpg.de [139.19.86.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBCgD4S8yz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 15:21:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mpi-sws.org
	; s=mail201904; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:References:In-Reply-To:Message-ID:Cc:To:From:Date:sender:reply-to:content-id
	:content-description:resent-date:resent-from:resent-sender:resent-to:
	resent-cc:resent-message-id:list-id:list-help:list-unsubscribe:list-subscribe
	:list-post:list-owner:list-archive;
	bh=r0432T7jVMKum4pTQ/oaiZ/Dqwe0AOeMgD6+AgcoabM=; b=u0OZEBqLvhRz2kS1/bubuw0oc/
	jdxC/tN6ayyi577vyJ7wUzNHnDOcDYgLDtvUXcZBdasK0sV3a9YAROtJBeIzjg2ygOERc279e7n5z
	5Od2PpOUUW0ysj0XozLS0Q+szCA33K6oxhUYWqdMQmhBIQJJpHxql6piO4ySosLFTwAg=;
Received: from srv-00-62.mpi-klsb.mpg.de ([139.19.86.27]:45226 helo=max.mpi-klsb.mpg.de)
	by juno.mpi-klsb.mpg.de (envelope-from <msammler@mpi-sws.org>) 
	with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92) id 1ounMo-00021Z-Rg; Tue, 15 Nov 2022 05:16:16 +0100
Received: from [107.133.148.158] (port=57104 helo=dummy.faircode.eu)
	by max.mpi-klsb.mpg.de (envelope-from <msammler@mpi-sws.org>) 
	with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2) id 1ounMo-001oYS-62; Tue, 15 Nov 2022 05:16:10 +0100
Date: Mon, 14 Nov 2022 20:16:07 -0800 (PST)
From: Michael Sammler <msammler@mpi-sws.org>
To: =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>
Message-ID: <0a643215-03ce-4388-bd1a-301dcab87c41@mpi-sws.org>
In-Reply-To: <CAEAAPHZrMDGsAnZM=GC0bu5WpGvXaDakJBq-WDkW06aDc7_68w@mail.gmail.com>
References: <CAEAAPHZrMDGsAnZM=GC0bu5WpGvXaDakJBq-WDkW06aDc7_68w@mail.gmail.com>
Subject: Re: [RFC PATCH] seccomp: Add protection keys into seccomp_data
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <0a643215-03ce-4388-bd1a-301dcab87c41@mpi-sws.org>
X-RSPAMD-Score: -0.1 (/)
X-RSPAMD-Report: Action: no action
 Symbol: RCVD_VIA_SMTP_AUTH(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: MID_RHS_MATCH_FROM(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: R_SPF_NEUTRAL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: DMARC_NA(0.00)
 Symbol: RCPT_COUNT_SEVEN(0.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: FROM_EQ_ENVFROM(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: RCVD_TLS_ALL(0.00)
 Message-ID: 0a643215-03ce-4388-bd1a-301dcab87c41@mpi-sws.org
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
Cc: wad@chromium.org, Kees Cook <keescook@chromium.org>, linux-api@vger.kernel.org, linuxram@us.ibm.com, luto@amacapital.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> We're currently working on a feature in chromium that uses pkeys for
> in-process isolation. Being able to use the pkey state in the seccomp
> filter would be pretty useful for this. For example, it would allow
> us to enforce that no code outside the isolated thread would ever
> map/mprotect executable memory.
> We can probably do something similar by adding instruction pointer
> checks to the seccomp filter, but that feels quite hacky and this
> feature would make a much nicer implementation.
>
> Are there any plans to make a version 2 of this patch?

Thanks for your interest in this patch, but I am now working on other projects and currently don't plan to make a version 2 of this patch.
