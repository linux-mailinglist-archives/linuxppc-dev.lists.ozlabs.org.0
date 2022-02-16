Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869574B87CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:34:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHTq03rQz3dyZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNV0m2Gz3cN4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:18 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4JzHNV3Lbxz4xv6; Wed, 16 Feb 2022 23:30:18 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNV2n5mz4xnG;
 Wed, 16 Feb 2022 23:30:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org
In-Reply-To: <20220204085601.107257-1-sourabhjain@linux.ibm.com>
References: <20220204085601.107257-1-sourabhjain@linux.ibm.com>
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
Message-Id: <164501434135.521186.4294901426151721880.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:41 +1100
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
Cc: Abdul haleem <abdhalee@linux.vnet.ibm.com>, hbathini@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Feb 2022 14:26:01 +0530, Sourabh Jain wrote:
> On large config LPARs (having 192 and more cores), Linux fails to boot
> due to insufficient memory in the first memblock. It is due to the
> memory reservation for the crash kernel which starts at 128MB offset of
> the first memblock. This memory reservation for the crash kernel doesn't
> leave enough space in the first memblock to accommodate other essential
> system resources.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Set crashkernel offset to mid of RMA region
      https://git.kernel.org/powerpc/c/7c5ed82b800d8615cdda00729e7b62e5899f0b13

cheers
