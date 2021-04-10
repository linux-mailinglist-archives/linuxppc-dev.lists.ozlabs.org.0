Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329E35AE4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcpM050Bz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp24QyRz3005
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:30 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp206Lyz9sWH; Sun, 11 Apr 2021 00:29:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1617725761-1464-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1617725761-1464-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Fix PMU constraint check for EBB events
Message-Id: <161806493740.1467223.9552501600191606671.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:57 +1000
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
Cc: cascardo@canonical.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Apr 2021 12:16:01 -0400, Athira Rajeev wrote:
> The power PMU group constraints includes check for EBB events
> to make sure all events in a group must agree on EBB. This
> will prevent scheduling EBB and non-EBB events together.
> But in the existing check, settings for constraint mask and
> value is interchanged. Patch fixes the same.
> 
> Before the patch, PMU selftest "cpu_event_pinned_vs_ebb_test"
> fails with below in dmesg logs. This happens because EBB event
> gets enabled along with a non-EBB cpu event.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix PMU constraint check for EBB events
      https://git.kernel.org/powerpc/c/10f8f96179ecc7f69c927f6d231f6d02736cea83

cheers
