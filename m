Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257E697C2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:47:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyXR1Dx2z3ft9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRM4vhHz3cj3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRM1cdmz4x4r;
	Wed, 15 Feb 2023 23:43:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20230131184804.220756-1-kjain@linux.ibm.com>
References: <20230131184804.220756-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/hv-24x7: Fix pvr check when setting interface version
Message-Id: <167646484317.1421441.5646798011051629276.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:43 +1100
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
Cc: disgoel@linux.vnet.ibm.com, atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Feb 2023 00:18:04 +0530, Kajol Jain wrote:
> Commit ec3eb9d941a9 ("powerpc/perf: Use PVR rather than
> oprofile field to determine CPU version") added usage
> of pvr value instead of oprofile field to determine the
> platform. In hv-24x7 pmu driver code, pvr check uses PVR_POWER8
> when assigning the interface version for power8 platform.
> But power8 can also have other pvr values like PVR_POWER8E and
> PVR_POWER8NVL. Hence the interface version won't be set
> properly incase of PVR_POWER8E and PVR_POWER8NVL.
> Fix this issue by adding the checks for PVR_POWER8E and
> PVR_POWER8NVL as well.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/hv-24x7: Fix pvr check when setting interface version
      https://git.kernel.org/powerpc/c/60bd7936f99fd8cdbeca67180f80ea13d8b97a76

cheers
