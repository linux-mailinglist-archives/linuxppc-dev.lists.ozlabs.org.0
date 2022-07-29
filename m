Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6668585083
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSZT4LYHz3dtC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYs38dSz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYs1F4vz4x1c;
	Fri, 29 Jul 2022 23:10:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, jolsa@kernel.org, mpe@ellerman.id.au, acme@kernel.org
In-Reply-To: <20220520084630.15181-1-atrajeev@linux.vnet.ibm.com>
References: <20220520084630.15181-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 1/2] powerpc/perf: Add support for caps under sysfs in powerpc
Message-Id: <165909971373.253830.11662171769797597633.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:01:53 +1000
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 14:16:29 +0530, Athira Rajeev wrote:
> Add caps support under "/sys/bus/event_source/devices/<pmu>/"
> for powerpc. This directory can be used to expose some of the
> specific features that powerpc PMU supports to the user.
> Example: pmu_name. The name of PMU registered will depend on
> platform, say power9 or power10 or it could be Generic Compat
> PMU.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/perf: Add support for caps under sysfs in powerpc
      https://git.kernel.org/powerpc/c/6320e693d98c7430653866b7ca6679338134cb79
[2/2] docs: ABI: sysfs-bus-event_source-devices: Document sysfs caps entry for PMU
      https://git.kernel.org/powerpc/c/999d7c47a0f737157608b9b0d2d37bdd1afec58c

cheers
