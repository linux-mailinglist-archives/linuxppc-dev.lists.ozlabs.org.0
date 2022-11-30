Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E663D22E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:39:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ0f4cQMz3fT4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:39:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqq3Rmdz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqp6M9mz4xZ7;
	Wed, 30 Nov 2022 20:31:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <YzNNznewTyCJiGFz@google.com>
References: <YzNNznewTyCJiGFz@google.com>
Subject: Re: [PATCH] powerpc/sgy_cts1000: convert to using gpiod API and facelift
Message-Id: <166980023729.3017288.15906997195440617007.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:57 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Liang He <windhl@126.com>, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Sep 2022 12:23:58 -0700, Dmitry Torokhov wrote:
> This patch converts the driver to newer gpiod API, and away from
> OF-specific legacy gpio API that we want to stop using.
> 
> While at it, let's address a few more issues:
> 
> - switch to using dev_info()/pr_info() and friends
> - cancel work when unbinding the driver
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/sgy_cts1000: convert to using gpiod API and facelift
      https://git.kernel.org/powerpc/c/4e87bd14e501030619d1bad29b3ec1f947f84fc4

cheers
