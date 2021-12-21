Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4647BF83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 13:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJFmT3Ywkz3cVw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 23:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJFlb0MJlz2xXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 23:15:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJFlY2J3Xz4xn0;
 Tue, 21 Dec 2021 23:15:21 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
References: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
Subject: Re: [PATCH]selftests/powerpc: skip tests for unavailable mitigations.
Message-Id: <164008885692.2078648.5834426444949840972.b4-ty@ellerman.id.au>
Date: Tue, 21 Dec 2021 23:14:16 +1100
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
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Dec 2021 22:12:23 +0530, Sachin Sant wrote:
> Mitigation patching test iterates over a set of mitigations irrespective
> of whether a certain mitigation is supported/available in the kernel.
> This causes following messages on a kernel where some mitigations
> are unavailable:
> 
>   Spawned threads enabling/disabling mitigations ...
>   cat: entry_flush: No such file or directory
>   cat: uaccess_flush: No such file or directory
>   Waiting for timeout ...
>   OK
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: skip tests for unavailable mitigations.
      https://git.kernel.org/powerpc/c/18678591846d668649fbd4f87b4a4c470818d386

cheers
