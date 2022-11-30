Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEC663D286
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:54:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZKf5R2Hz3hdZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:53:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtt1n1Lz3fRR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYts4wb1z4y42;
	Wed, 30 Nov 2022 20:34:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221017032333.1852406-1-yangyingliang@huawei.com>
References: <20221017032333.1852406-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
Message-Id: <166980024810.3017288.10212728445066769277.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:08 +1100
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
Cc: clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Oct 2022 11:23:33 +0800, Yang Yingliang wrote:
> If remapping 'data->trig_page' fails, the 'data->eoi_mmio' need be unmapped
> before returning from xive_spapr_populate_irq_data().
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
      https://git.kernel.org/powerpc/c/8b49670f3bb3f10cd4d5a6dca17f5a31b173ecdc

cheers
