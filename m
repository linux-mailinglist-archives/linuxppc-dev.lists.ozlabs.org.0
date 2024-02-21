Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E985EC92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:10:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgBpG3cj7z3vcY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 10:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgBmp3LWmz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 10:09:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TgBmk3NLrz4wyf;
	Thu, 22 Feb 2024 10:09:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240221044623.1598642-1-mpe@ellerman.id.au>
References: <20240221044623.1598642-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc: Add Power11 architected and raw mode
Message-Id: <170855692315.1938434.7161682039729128816.b4-ty@ellerman.id.au>
Date: Thu, 22 Feb 2024 10:08:43 +1100
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
Cc: maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 15:46:22 +1100, Michael Ellerman wrote:
> Add CPU table entries for raw and architected mode. Most fields are
> copied from the Power10 table entries.
> 
> CPU, MMU and user (ELF_HWCAP) features are unchanged vs P10. However
> userspace can detect P11 because the AT_PLATFORM value changes to
> "power11".
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Add Power11 architected and raw mode
      https://git.kernel.org/powerpc/c/c2ed087ed35ca569d8179924ba560be248c758e5
[2/2] powerpc/perf: Power11 Performance Monitoring support
      https://git.kernel.org/powerpc/c/b22ea627225b53ec7ce25c19d6df9fa8217d1643

cheers
