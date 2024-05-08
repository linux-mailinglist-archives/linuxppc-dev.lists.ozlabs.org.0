Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0FB8BFF29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGcR5GM9z3gDc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGXN4DG5z3cXG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:41:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGXN3QSKz4x0K;
	Wed,  8 May 2024 23:41:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mahesh@linux.ibm.com, oohall@gmail.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, Ghanshyam Agrawal <ghanshyam1898@gmail.com>
In-Reply-To: <cover.1703756365.git.ghanshyam1898@gmail.com>
References: <cover.1703756365.git.ghanshyam1898@gmail.com>
Subject: Re: [PATCH v2 0/3] Fix typos, grammatical errors and add units of function param
Message-Id: <171517558557.165093.17275880454582090207.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:39:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Dec 2023 15:45:17 +0530, Ghanshyam Agrawal wrote:
> This patch series fixes spelling mistake in the word "auxillary",
> fixes a grammatical error related to full stop and adds the units
> of the size param in the description of eeh_set_pe_aux_size function.
> 
> Ghanshyam Agrawal (3):
>   powerpc/eeh: Fix spelling of the word "auxillary"
>   powerpc/eeh: Add full stop to fix a grammatical error
>   powerpc/eeh: Add the units of size param in the description
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/eeh: Fix spelling of the word "auxillary"
      https://git.kernel.org/powerpc/c/39434af10f1045b50826b8b506415f36681d4b40
[2/3] powerpc/eeh: Add full stop to fix a grammatical error
      (squashed)
[3/3] powerpc/eeh: Add the units of size param in the description
      (squashed)

cheers
