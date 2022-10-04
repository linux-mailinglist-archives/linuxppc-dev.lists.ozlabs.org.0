Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0555F44DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfMp0bPpz3gst
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:54:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1j6LqTz3drX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1h2yB1z4xHW;
	Wed,  5 Oct 2022 00:39:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926131643.146502-1-nathanl@linux.ibm.com>
References: <20220926131643.146502-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] powerpc/pseries: restrict error injection and DT changes when locked down
Message-Id: <166488995179.779920.16022330580724234832.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:51 +1100
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, gcwilson@linux.ibm.com, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 08:16:41 -0500, Nathan Lynch wrote:
> Add two new lockdown reasons for use in powerpc's pseries platform
> code.
> 
> The pseries platform allows hardware-level error injection via certain
> calls to the RTAS (Run Time Abstraction Services) firmware. ACPI-based
> error injection is already restricted in lockdown; this facility
> should be restricted for the same reasons.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries: block untrusted device tree changes when locked down
      https://git.kernel.org/powerpc/c/99df7a2810b6d24651d4887ab61a142e042fb235
[2/2] powerpc/rtas: block error injection when locked down
      https://git.kernel.org/powerpc/c/b8f3e48834fe8c86b4f21739c6effd160e2c2c19

cheers
