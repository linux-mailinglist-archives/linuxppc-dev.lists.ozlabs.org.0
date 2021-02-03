Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A405C30D9AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:20:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1373gwhzF01V
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:20:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4DW09R1NrjzDwpK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09Q0dY4z9tlM; Wed,  3 Feb 2021 22:40:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210122075029.797013-1-clg@kaod.org>
References: <20210122075029.797013-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/prom: Fix "ibm,arch-vec-5-platform-support" scan
Message-Id: <161235200758.1516112.11532779504057524553.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:17 +1100 (AEDT)
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jan 2021 08:50:29 +0100, Cédric Le Goater wrote:
> The "ibm,arch-vec-5-platform-support" property is a list of pairs of
> bytes representing the options and values supported by the platform
> firmware. At boot time, Linux scans this list and activates the
> available features it recognizes : Radix and XIVE.
> 
> A recent change modified the number of entries to loop on and 8 bytes,
> 4 pairs of { options, values } entries are always scanned. This is
> fine on KVM but not on PowerVM which can advertises less. As a
> consequence on this platform, Linux reads extra entries pointing to
> random data, interprets these as available features and tries to
> activate them, leading to a firmware crash in
> ibm,client-architecture-support.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/prom: Fix "ibm,arch-vec-5-platform-support" scan
      https://git.kernel.org/powerpc/c/ed5b00a05c2ae95b59adc3442f45944ec632e794

cheers
