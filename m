Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E0587B38
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsWg35kPz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsWH6b0dz2xGd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:01:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsWH41T8z4x1L;
	Tue,  2 Aug 2022 21:01:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>, npiggin@gmail.com, mpe@ellerman.id.au
In-Reply-To: <20220711034927.213192-1-kjain@linux.ibm.com>
References: <20220711034927.213192-1-kjain@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/kvm: Move pmu code in kvm folder to separate file for power9 and later platforms
Message-Id: <165943809291.1060517.17469284777484730130.b4-ty@ellerman.id.au>
Date: Tue, 02 Aug 2022 21:01:32 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jul 2022 09:19:26 +0530, Kajol Jain wrote:
> File book3s_hv_p9_entry.c in powerpc/kvm folder consists of functions
> like freeze_pmu, switch_pmu_to_guest and switch_pmu_to_host which are
> specific to Performance Monitoring Unit(PMU) for power9 and later
> platforms.
> 
> For better maintenance, moving pmu related code from
> book3s_hv_p9_entry.c to a new file called book3s_hv_p9_perf.c,
> without any logic change.
> Also make corresponding changes in the Makefile to include
> book3s_hv_p9_perf.c during compilation.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/2] powerpc/kvm: Move pmu code in kvm folder to separate file for power9 and later platforms
      https://git.kernel.org/powerpc/c/db5360840f09eded71009a981084ab10a93a08d8
[2/2] powerpc/kvm: Remove comment related to moving PMU code to perf subsystem
      https://git.kernel.org/powerpc/c/4008d54e29531813e800580f8309133b9b14a921

cheers
