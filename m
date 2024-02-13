Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE10852EC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 12:08:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lm3b2fcw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYz8N42Pnz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 22:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lm3b2fcw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYz7g00Dsz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 22:07:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F696CE1A55;
	Tue, 13 Feb 2024 11:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F06FC433F1;
	Tue, 13 Feb 2024 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707822459;
	bh=8IAiOzlAm0hby7CIaHI0gOwxx/kmSj9YMV3D4bA1Yck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lm3b2fcwh3x7jo+27J56ukMPcy+oEKsQKexJEYw3AivzBeYYdbDJ5rehVk7I+aLu8
	 jucKBlzs0tp7SpQBjyrD41j1+wB3V6xrds4Du2RCPPY4wN9+Qv0lW3XFkAMhL+KWEk
	 F9aCEJuyrdKaD2iCJFsIz3giONMgwiMsI1Z3S0oI=
Date: Tue, 13 Feb 2024 12:07:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Message-ID: <2024021332-unzip-satirical-268d@gregkh>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
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
Cc: linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 05:04:58PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Patch 1/5 is a prerequisite to 2/5, but the others have
> no dependency. They were built using bootlin's without warnings using
> powerpc64le-power8--glibc--stable-2023.11-1 toolchain.
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
