Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C72DAD48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:33:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwHjM1fKMzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwG4N2dtGzDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 22:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwG4M13Kbz9sSn; Tue, 15 Dec 2020 22:19:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20201202043854.76406-1-aneesh.kumar@linux.ibm.com>
References: <20201202043854.76406-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 updated 21/22 ] powerpc/book3s64/kup: Check max key
 supported before enabling kup
Message-Id: <160803087174.524967.6770437629278295515.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 22:19:30 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Nov 2020 10:14:02 +0530, Aneesh Kumar K.V wrote:
> Don't enable KUEP/KUAP if we support less than or equal to 3 keys.
> 
> [...]

Applied to powerpc/next.

[21/22] powerpc/book3s64/kup: Check max key supported before enabling kup
        https://git.kernel.org/powerpc/c/61130e203dca3ba1f0c510eb12f7a4294e31a834

cheers
