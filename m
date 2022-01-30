Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F14A3660
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 13:51:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmrfR1PNkz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 23:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yE85WGOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=yE85WGOJ; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jmrdm6B0fz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 23:50:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9498B82924;
 Sun, 30 Jan 2022 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BE7C340E4;
 Sun, 30 Jan 2022 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643547030;
 bh=iyo+mlHxHiMCbs0SnF8JOaLkc59upPWg3JbFGcSEqpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yE85WGOJQqUx9mVNtXLXPMTV/8Y4YzBUzS9c7wxTJfFwrZeegbSrNMm+4LlmXAAc/
 g0kxwwK9OfPRsrbE+lefYqYvfs2oBm1YaMQZu1eXSm+CmdRol2cqE6VD0GfCO8Kzb+
 bqxLexM8FpZ51CvS4mK/rPK8v56QMsRzXhBwdTKk=
Date: Sun, 30 Jan 2022 13:50:27 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Modified for 5.16 and 5.15] powerpc/32s: Fix
 kasan_init_region() for KASAN
Message-ID: <YfaJk9dUMmiQOJJT@kroah.com>
References: <247bff242993dd6c8975a4f1248d822a448701ac.1643476812.git.christophe.leroy@csgroup.eu>
 <383707b74eac769f971ea72ea3db39aaf08e5111.1643476880.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <383707b74eac769f971ea72ea3db39aaf08e5111.1643476880.git.christophe.leroy@csgroup.eu>
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 05:26:10PM +0000, Christophe Leroy wrote:
> This is a backport for 5.16 and 5.15.
> 
> To apply, it also requires commit 37eb7ca91b69 ("powerpc/32s: Allocate
> one 256k IBAT instead of two consecutives 128k IBATs")

Thanks for these, now queued up.

greg k-h
