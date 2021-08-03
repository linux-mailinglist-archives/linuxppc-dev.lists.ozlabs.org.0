Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 221463DEAC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 12:21:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf9s40k9qz3dFf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 20:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf9r60ztmz306F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 20:20:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Gf9r01DXFz9sRR; Tue,  3 Aug 2021 20:20:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1626676399-15975-1-git-send-email-ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/2] cpuidle/pseries: cleanup of the CEDE0 latency
 fixup code
Message-Id: <162798602812.163057.13114310314725073045.b4-ty@ellerman.id.au>
Date: Tue, 03 Aug 2021 20:20:28 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, joedecke@de.ibm.com,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Jul 2021 12:03:17 +0530, Gautham R. Shenoy wrote:
> 
> Hi,
> 
> This is the v5 of the patchset to fixup CEDE0 latency only from
> POWER10 onwards.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] cpuidle/pseries: Fixup CEDE0 latency only for POWER10 onwards
      https://git.kernel.org/powerpc/c/7cbd631d4decfd78f8a17196dce9abcd4e7e1e94
[2/2] cpuidle/pseries: Do not cap the CEDE0 latency in fixup_cede0_latency()
      https://git.kernel.org/powerpc/c/4bceb03859c1a508669ce542c649c8d4f5d4bd93

cheers
