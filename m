Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF2285706
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:22:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5fmB2FVKzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:22:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkH6v6BzDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkH5K1Xz9sSf; Wed,  7 Oct 2020 14:21:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU
 group constraints
Message-Id: <160204083688.257875.9574572368861589810.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:11 +1100 (AEDT)
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Sep 2020 03:10:04 -0400, Athira Rajeev wrote:
> PMU counter support functions enforces event constraints for group of
> events to check if all events in a group can be monitored. Incase of
> event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
> not all constraints are applicable, say the threshold or sample bits.
> But current code includes pmc5 and pmc6 in some group constraints (like
> IC_DC Qualifier bits) which is actually not applicable and hence results
> in those events not getting counted when scheduled along with group of
> other events. Patch fixes this by excluding PMC5/6 from constraints
> which are not relevant for it.

Applied to powerpc/next.

[1/1] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints
      https://git.kernel.org/powerpc/c/3b6c3adbb2fa42749c3d38cfc4d4d0b7e096bb7b

cheers
