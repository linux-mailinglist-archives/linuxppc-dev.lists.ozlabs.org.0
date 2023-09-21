Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DED747A9323
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrqxk63F1z3f08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrqvk6SYJz3cF2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:33:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrqvj0M5wz4xPc;
	Thu, 21 Sep 2023 19:33:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/11] add missing of_node_put
Message-Id: <169528860030.876432.17353767421208248949.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:30:00 +1000
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
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mediatek@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mmc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 07 Sep 2023 11:55:10 +0200, Julia Lawall wrote:
> Add of_node_put on a break out of an of_node loop.
> 

Patches 3 and 6 applied to powerpc/next.

[03/11] powerpc/powermac: add missing of_node_put
        https://git.kernel.org/powerpc/c/a59e9eb25216eb1dc99e14fc31b76aa648d79540
[06/11] powerpc/kexec_file: add missing of_node_put
        https://git.kernel.org/powerpc/c/06b627c1236216ac1239c5e1afcc75359af3fb72

cheers
