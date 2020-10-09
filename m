Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0E28820A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yb24qj9zDqhl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFN1SXBzDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFL1XtZz9sVd; Fri,  9 Oct 2020 17:04:05 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201007040903.819081-1-oohall@gmail.com>
References: <20201007040903.819081-1-oohall@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/eeh: Delete eeh_pe->config_addr
Message-Id: <160222338956.867048.16776486313568514901.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:05 +1100 (AEDT)
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

On Wed, 7 Oct 2020 15:09:02 +1100, Oliver O'Halloran wrote:
> The eeh_pe->config_addr field was supposed to be removed in
> commit 35d64734b643 ("powerpc/eeh: Clean up PE addressing") which made it
> largely unused. Finish the job.

Applied to powerpc/next.

[1/2] powerpc/eeh: Delete eeh_pe->config_addr
      https://git.kernel.org/powerpc/c/269e583357df32d77368903214f10f43fa5d7a5f
[2/2] powerpc/pseries/eeh: Fix use of uninitialised variable
      https://git.kernel.org/powerpc/c/8175bd580e629dcf9cc507794da774a6b8d3a9bd

cheers
