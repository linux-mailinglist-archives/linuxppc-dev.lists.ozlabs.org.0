Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6996227B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 10:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6gMx4xpgz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 20:56:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mpRP0hXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zg5h=3j=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mpRP0hXj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6gM02Qjpz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 20:55:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D3546196E;
	Wed,  9 Nov 2022 09:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C7FC433C1;
	Wed,  9 Nov 2022 09:55:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mpRP0hXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1667987713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZshSE8V0gK3sPlp+UQXRzu6fn4sgo2cyoEtjL7uI+k=;
	b=mpRP0hXjQXAWhxawj9mk9joW0tM7oRwy8d0r7vw/cpKCXIgPU0w1jmgtoLJUkrE9A8PiMU
	VV7uxy2+bxJmh+IVrI6SqB9Dm2zsvodi9hNwLpR0ebEIdsNeK3/s2pr+7+zZNVIipbyapF
	qL6l2PkNlXxfUH9z5Ppk9XvnmAW8rNE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75292193 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 9 Nov 2022 09:55:13 +0000 (UTC)
Date: Wed, 9 Nov 2022 10:55:10 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [6.1.0-rc4-next-20221108] Boot failure on powerpc
Message-ID: <Y2t4/sELkmB4pn2p@zx2c4.com>
References: <E051ACF6-5282-49D1-9C60-BB2450569268@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E051ACF6-5282-49D1-9C60-BB2450569268@linux.ibm.com>
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
Cc: linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Should be fixed already in today's next.
