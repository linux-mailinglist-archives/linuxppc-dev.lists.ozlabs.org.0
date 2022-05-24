Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349B5328F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sPB4C6Bz3fP4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7z3K7dz3chn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7z2gW5z4yTP;
 Tue, 24 May 2022 21:15:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210608064809.199116-1-ruscur@russell.cc>
References: <20210608064809.199116-1-ruscur@russell.cc>
Subject: Re: [PATCH] selftests/powerpc: Handle more misreporting cases in
 spectre_v2
Message-Id: <165339056364.1718562.11909614040294117880.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:23 +1000
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
Cc: cascardo@canonical.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Jun 2021 16:48:09 +1000, Russell Currey wrote:
> In commit f3054ffd71b5 ("selftests/powerpc: Return skip code for
> spectre_v2"), the spectre_v2 selftest is updated to be aware of cases
> where the vulnerability status reported in sysfs is incorrect, skipping
> the test instead.
> 
> This happens because qemu can misrepresent the mitigation status of the
> host to the guest.  If the count cache is disabled in the host, and this
> is correctly reported to the guest, then the guest won't apply
> mitigations.  If the guest is then migrated to a new host where
> mitigations are necessary, it is now vulnerable because it has not
> applied mitigations.
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Handle more misreporting cases in spectre_v2
      https://git.kernel.org/powerpc/c/48482f4dd3432e5e62873bf0f2e254cfb8ce2ac2

cheers
