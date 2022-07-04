Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C95653F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3pj4TyLz3gWb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fX5J6Nz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fX4D9cz4xYV;
	Mon,  4 Jul 2022 21:36:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210429050208.266619-1-maddy@linux.ibm.com>
References: <20210429050208.266619-1-maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Update MMCR2 to support event exclude_idle
Message-Id: <165693444269.9954.4761798275894011090.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:34:02 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Apr 2021 10:32:08 +0530, Madhavan Srinivasan wrote:
> struct perf_event_attr supports exclude counting of idle task.
> This is sent to kernel via perf_event_attr.exclude_idle and
> in perf tool, user can use ":I" event modifier to enable this
> for specific event.
> 
> Monitor Mode Control Register 2 (MMCR2) SPR has control bits
> for each PMCs to freeze counting based on the Control Register
> CTRL[RUN] state. CTRL[RUN] is not set when idle task is
> running. Patch adds a check for event attr.exclude_idle to
> set MMCR2[FCnWAIT] bit.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Update MMCR2 to support event exclude_idle
      https://git.kernel.org/powerpc/c/5969e0c1c7e2132d8b2cf80168072b1195ddce46

cheers
