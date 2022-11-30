Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1E263D23F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:42:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ4n6MyNz3chq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:42:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYqw3DZwz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqw1zSKz4xYV;
	Wed, 30 Nov 2022 20:31:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: oohall@gmail.com, Bo Liu <liubo03@inspur.com>, npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au, mahesh@linux.ibm.com
In-Reply-To: <20221031063706.2770-1-liubo03@inspur.com>
References: <20221031063706.2770-1-liubo03@inspur.com>
Subject: Re: [PATCH] powerpc/pseries/eeh: Fix some kernel-doc warnings
Message-Id: <166980025413.3017288.12453883360878326670.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:14 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 31 Oct 2022 02:37:06 -0400, Bo Liu wrote:
> Fixes the following W=1 kernel build warning(s):
>   arch/powerpc/platforms/pseries/eeh_pseries.c:163: warning: Function parameter or member 'config_addr' not described in 'pseries_eeh_phb_reset'
>   arch/powerpc/platforms/pseries/eeh_pseries.c:163: warning: Excess function parameter 'config_adddr' description in 'pseries_eeh_phb_reset'
>   arch/powerpc/platforms/pseries/eeh_pseries.c:198: warning: Function parameter or member 'config_addr' not described in 'pseries_eeh_phb_configure_bridge'
>   arch/powerpc/platforms/pseries/eeh_pseries.c:198: warning: Excess function parameter 'config_adddr' description in 'pseries_eeh_phb_configure_bridge'
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/eeh: Fix some kernel-doc warnings
      https://git.kernel.org/powerpc/c/afa1cda4097077e37639ca7098c2147e1885b2df

cheers
