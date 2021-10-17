Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C6D4308B7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKFS657kz3cGD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKCp2Z0Tz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:32:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXKCp1xWXz4xqT;
 Sun, 17 Oct 2021 23:32:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211011070356.99952-1-clg@kaod.org>
References: <20211011070356.99952-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/boot: Use CONFIG_PPC_POWERNV to compile OPAL
 support
Message-Id: <163447392630.1159469.11407811949736491239.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:32:06 +1100
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

On Mon, 11 Oct 2021 09:03:56 +0200, Cédric Le Goater wrote:
> CONFIG_PPC64_BOOT_WRAPPER is selected by CPU_LITTLE_ENDIAN which is
> used to compile support for other platforms such as Microwatt. There
> is no need for OPAL calls on these.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/boot: Use CONFIG_PPC_POWERNV to compile OPAL support
      https://git.kernel.org/powerpc/c/6ffeb56ee2109b30a9e393f7e0c22c9b5030ac38

cheers
