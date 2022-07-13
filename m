Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D34573B6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 18:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljk3P58f6z3cJC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 02:44:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qMnv4zuy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qMnv4zuy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljk2p3VpTz3c2T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 02:43:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A1CF61C1A;
	Wed, 13 Jul 2022 16:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342F5C34114;
	Wed, 13 Jul 2022 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657730607;
	bh=nMsRYviHgVpR/eEib6JhLatM36YsgmWc+/23uSoN1UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMnv4zuyB2PLEp46Dpmnr4L9/j34bKiuM4C6yeIvRMSP8OmDBUncj6WzIFyvm/LHE
	 Qvw/iDN6OUKnOVjpvOMMeJT5t2ecIeFTnOP1GX7f6YTBwWgDKNkIaxbMSro3Ssq1s1
	 hfNdJndLCyPw9iQc1wDasVCjD9An+McAZjK+/CCU=
Date: Wed, 13 Jul 2022 18:43:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ning Qiang <sohu0106@126.com>
Subject: Re: [PATCH] macintosh:fix oob read in do_adb_query function
Message-ID: <Ys72JqcqGQQa12YS@kroah.com>
References: <20220713153734.2248-1-sohu0106@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713153734.2248-1-sohu0106@126.com>
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
Cc: security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 13, 2022 at 11:37:34PM +0800, Ning Qiang wrote:
> In do_adb_query function of drivers/macintosh/adb.c, req->data is copy
> form userland. the  parameter "req->data[2]" is Missing check, the
> array size of adb_handler[] is 16, so "adb_handler[
> req->data[2]].original_address" and "adb_handler[
> req->data[2]].handler_id" will lead to oob read.
> 
> Signed-off-by: Ning Qiang <sohu0106@126.com>

Cc: stable <stable@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

