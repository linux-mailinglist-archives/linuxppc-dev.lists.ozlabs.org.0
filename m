Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E67857D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW5031fttz3gbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dl4S8Fz3dHy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dg1Bs0z4x5p;
	Wed, 23 Aug 2023 22:04:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, windhl@126.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, ruanjinjie <ruanjinjie@huawei.com>
In-Reply-To: <20221110011929.3709774-1-ruanjinjie@huawei.com>
References: <20221110011929.3709774-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH] powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
Message-Id: <169279175567.797584.15288361947822567301.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Nov 2022 09:19:29 +0800, ruanjinjie wrote:
> If device_register() returns error in ibmebus_bus_init(), name of kobject
> which is allocated in dev_set_name() called in device_add() is leaked.
> 
> As comment of device_add() says, it should call put_device() to drop
> the reference count that was set in device_initialize() when it fails,
> so the name can be freed in kobject_cleanup().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
      https://git.kernel.org/powerpc/c/afda85b963c12947e298ad85d757e333aa40fd74

cheers
