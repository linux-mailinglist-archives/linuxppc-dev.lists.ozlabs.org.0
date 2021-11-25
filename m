Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FD45D79D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:50:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0CmG1PMzz3dxD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:50:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0CjD0gTmz3cN2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0CjC4VW8z4xcv;
 Thu, 25 Nov 2021 20:47:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210920173203.1800475-1-nathanl@linux.ibm.com>
References: <20210920173203.1800475-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: delete scanlog
Message-Id: <163783299425.1228879.8095081341639658645.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:34 +1100
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Sep 2021 12:32:03 -0500, Nathan Lynch wrote:
> Remove the pseries scanlog driver.
> 
> This code supports functions from Power4-era servers that are not present
> on targets currently supported by arch/powerpc. System manuals from this
> time have this description:
> 
>   Scan Dump data is a set of chip data that the service processor gathers
>   after a system malfunction. It consists of chip scan rings, chip trace
>   arrays, and Scan COM (SCOM) registers. This data is stored in the
>   scan-log partition of the system’s Nonvolatile Random Access
>   Memory (NVRAM).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: delete scanlog
      https://git.kernel.org/powerpc/c/22887f319a39929e357810a1f964fcba7ae42c59

cheers
