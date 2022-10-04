Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F65F449C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf9l6VVvz3fCP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:46:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1T5f9xz3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1T4XSkz4xH7;
	Wed,  5 Oct 2022 00:38:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, mpe@ellerman.id.au
In-Reply-To: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
References: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Move vas_migration_handler early during migration
Message-Id: <166488993807.779920.10263423367250127743.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:38 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Sep 2022 01:27:07 -0700, Haren Myneni wrote:
> When the migration is initiated, the hypervisor changes VAS
> mappings as part of pre-migration event. Then the OS gets the
> migration event which closes all VAS windows before the migration
> starts. NX generates continuous faults until windows are closed
> and the user space can not differentiate these NX faults coming
> from the actual migration. So to reduce this time window, close
> VAS windows first in pseries_migrate_partition().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Move vas_migration_handler early during migration
      https://git.kernel.org/powerpc/c/465dda9d320d1cb9424f1015b0520ec4c4f0d279

cheers
