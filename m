Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F71EC72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 12:56:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453s0v5lWxzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 20:55:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="eNU6Zat3"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453rzV2vYszDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 20:54:45 +1000 (AEST)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 835E72084E;
 Wed, 15 May 2019 10:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557917683;
 bh=dNal3QDLJl+mFNZwJ56ZTHzOLfm6CZ/5Af2fCpyQRkA=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=eNU6Zat3T++Qxi0rYyuGK9XZj2a7Du1PtmlNT7CL2zelTGmUS3kDwOY7lx06u/OVM
 Nk3UZ7TlYWCct4Lpfym8P783NZQXI6jbFpK1syPF6s3Su/PPDpNykQWmVzZWKKc1lo
 y0T7BwMd5YPMk6206L6c0hMj9FbwPhRhHeWFOOcE=
Date: Wed, 15 May 2019 10:54:42 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
Subject: Re: [PATCH] powerpc/pseries: Fix xive=off command line
In-Reply-To: <155791470178.432724.8008395673479905061.stgit@bahia.lan>
References: <155791470178.432724.8008395673479905061.stgit@bahia.lan>
Message-Id: <20190515105443.835E72084E@mail.kernel.org>
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
Cc: , linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: eac1e731b59e powerpc/xive: guest exploitation of the XIVE interrupt controller.

The bot has tested the following trees: v5.1.1, v5.0.15, v4.19.42, v4.14.118.

v5.1.1: Build OK!
v5.0.15: Build OK!
v4.19.42: Failed to apply! Possible dependencies:
    8ca2d5151e7f ("powerpc/prom_init: Move a few remaining statics to appropriate sections")
    c886087caee7 ("powerpc/prom_init: Move prom_radix_disable to __prombss")

v4.14.118: Failed to apply! Possible dependencies:
    028555a590d6 ("powerpc/xive: fix hcall H_INT_RESET to support long busy delays")
    7a22d6321c3d ("powerpc/mm/radix: Update command line parsing for disable_radix")
    8ca2d5151e7f ("powerpc/prom_init: Move a few remaining statics to appropriate sections")
    c886087caee7 ("powerpc/prom_init: Move prom_radix_disable to __prombss")


How should we proceed with this patch?

--
Thanks,
Sasha
