Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993347D94F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:15:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YO5gxL38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz7k3g2kz3dBb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YO5gxL38;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzR5lLzz3cBs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401299;
	bh=wa47dCtcQs44moWk2lsxVoZdStalKmDAfrWkT77feWw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YO5gxL388sSTdl5pvgLOrLwtlnka+vv9JxzYL+wo/+mQWA+yqCuVVxteAuUybwMBw
	 lzM44SL0dbq0ANJl6GsgsPO86U56+aMFA6VeIdeT8u2VoAmUbWmATmYRYdlZ7Tnkci
	 LvOphnPy2C1FP/79AG3NeQmc44fOTR3pt3XbR0Nr+QLwKQ0GQt7NQlqu/GgsGSGdmz
	 c5e7yZqI3h6464Opg6JydMP5FkuLcs7ULeVRKVf5FWM7vGBONN/8uC4lKOZ0hs8PW3
	 sHv9wb1zur/2lI8D/W8FuJCkluxKcpaVeh7ID4eQj26L84Q8QRSffILnG046MXbSr/
	 h7Yfwtniwdekw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzR4T4vz4xWk;
	Fri, 27 Oct 2023 21:08:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
In-Reply-To: <20231019215033.1335251-1-haren@linux.ibm.com>
References: <20231019215033.1335251-1-haren@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/vas: Limit open window failure messages in log bufffer
Message-Id: <169840079679.2701453.11822597239103827980.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: nathanl@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Oct 2023 14:50:33 -0700, Haren Myneni wrote:
> The VAS open window call prints error message and returns -EBUSY
> after the migration suspend event initiated and until the resume
> event completed on the destination system. It can cause the log
> buffer filled with these error messages if the user space issues
> continuous open window calls.  Similar case even for DLPAR CPU
> remove event when no credits are available until the credits are
> freed or with the other DLPAR CPU add event.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vas: Limit open window failure messages in log bufffer
      https://git.kernel.org/powerpc/c/73b25505ce043b561028e5571d84dc82aa53c2b4

cheers
