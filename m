Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F885BCA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfK9n426cz3cgk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:54:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfK9P5Rpvz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:54:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfK9P0wgHz4wxX;
	Tue, 20 Feb 2024 23:54:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
References: <cover.1704900449.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/7] macintosh: Convert to platform remove callback returning void
Message-Id: <170843363897.1291121.16845812107659928983.b4-ty@ellerman.id.au>
Date: Tue, 20 Feb 2024 23:53:58 +1100
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
Cc: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Jan 2024 16:42:47 +0100, Uwe Kleine-König wrote:
> this series converts all drivers below drivers/macintosh to use
> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources without noticing.
> 
> This is merge window material. All patches are pairwise independent of
> each other so they can be applied individually. There isn't a maintainer
> for drivers/macintosh, I'm still sending this as a series in the hope
> Michael feels repsonsible and applies it completely.
> 
> [...]

Applied to powerpc/next.

[1/7] macintosh: therm_windtunnel: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/bd6d99b70b2ffa96119826f22e96a5b77e6f90d6
[2/7] macintosh: windfarm_pm112: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/839cf59b5596abcdfbcdc4278a7bd4f8da32e1b2
[3/7] macintosh: windfarm_pm121: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/2e7e64c8427c2385bf47456a612d908f827bbbbf
[4/7] macintosh: windfarm_pm72: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/057894a40e973c829baacce0b9de6bdf6c8ec1da
[5/7] macintosh: windfarm_pm81: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/fb0217d79d77f1092929bae1137ac0f586c29fec
[6/7] macintosh: windfarm_pm91: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/7cfe99872c711ffa727db85c608a0897955a2758
[7/7] macintosh: windfarm_rm31: Convert to platform remove callback returning void
      https://git.kernel.org/powerpc/c/4b26558415d628ad2c0d3d4ec65156a0c99eaf02

cheers
