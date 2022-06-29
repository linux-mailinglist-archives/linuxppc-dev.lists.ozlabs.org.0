Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BA855FF9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0p84LsKz3dqc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0n40Yrnz3cht
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:16:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0n35MwDz4xDH;
	Wed, 29 Jun 2022 22:16:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <26f8b72a4276c0bd8ed63860c7316f6361c351b4.1655978907.git.christophe.leroy@csgroup.eu>
References: <26f8b72a4276c0bd8ed63860c7316f6361c351b4.1655978907.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/powermac: Remove empty function note_scsi_host()
Message-Id: <165650493014.3004956.6600560027462595950.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:15:30 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Jun 2022 12:08:36 +0200, Christophe Leroy wrote:
> note_scsi_host() has been an empty function since
> commit 6ee0d9f744d4 ("[POWERPC] Remove unused old code
> from powermac setup code").
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powermac: Remove empty function note_scsi_host()
      https://git.kernel.org/powerpc/c/d7f396461518c766b2436d64b6d3ba6a4c418dcf

cheers
