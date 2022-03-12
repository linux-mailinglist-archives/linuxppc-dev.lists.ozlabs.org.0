Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D84D6E33
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzjB0cKJz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:35:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzhm6F8kz30Dk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:35:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzhm58fHz4xLT;
 Sat, 12 Mar 2022 21:35:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com, mpe@ellerman.id.au
In-Reply-To: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
References: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] powerpc/pseries/vas: VAS/NXGZIP support with LPM
Message-Id: <164708129066.830080.17334657683440823206.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:34:50 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 27 Feb 2022 23:46:01 -0800, Haren Myneni wrote:
> Virtual Accelerator Switchboard (VAS) is an engine stays on the
> chip. So all windows opened on a specific engine belongs to VAS
> the chip. The hypervisor expects the partition to close all
> active windows on the sources system and reopen them after
> migration on the destination machine.
> 
> This patch series adds VAS support with the partition migration.
> When the migration initiates, the VAS migration handler will be
> invoked before pseries_suspend() to close all active windows and
> mark them in-active with VAS_WIN_MIGRATE_CLOSE status. Whereas
> this migration handler is called after migration to reopen all
> windows which has VAS_WIN_MIGRATE_CLOSE status and make them
> active again. The user space gets paste instruction failure
> when it sends requests on these in-active windows.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/pseries/vas: Define global hv_cop_caps struct
      https://git.kernel.org/powerpc/c/278fe1cc2205a05bfd92c794be3d207372b17289
[2/3] powerpc/pseries/vas: Modify reconfig open/close functions for migration
      https://git.kernel.org/powerpc/c/716d7a2e3764cb79061371767bff1a691adb4e7f
[3/3] powerpc/pseries/vas: Add VAS migration handler
      https://git.kernel.org/powerpc/c/37e6764895ef7431f45ff603a548549d409993d2

cheers
