Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97F80885C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:50:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDdv1Q9Rz3wW3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVt37Lrz3dBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVt1y14z4xRn;
	Thu,  7 Dec 2023 23:44:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
Subject: Re: [PATCH 0/7] powerpc/rtas: Trivial, coding style, and kernel-doc fixes
Message-Id: <170195271156.2310221.17797655469126733617.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 06 Nov 2023 07:42:52 -0600, Nathan Lynch wrote:
> * Fix recently introduced kernel-doc warnings.
> * Make minor coding style adjustments for readability.
> * Remove rtas_service_present() and an old call_rtas() declaration.
> * Move a pseries-specific function prototype to pseries code.
> 

Patches 3-7 applied to powerpc/next.

[3/7] powerpc/rtas: Drop declaration of undefined call_rtas() function
      https://git.kernel.org/powerpc/c/981d1c997fbc5e193b282f3a325a0230bf697363
[4/7] powerpc/rtas: Remove unused rtas_service_present()
      https://git.kernel.org/powerpc/c/1d8faf1f41b550eb7ab7ac841ebd70f205840dde
[5/7] powerpc/rtas: Move post_mobility_fixup() declaration to pseries
      https://git.kernel.org/powerpc/c/010862d235c9fab4f0f9dd169efc72df94110758
[6/7] powerpc/rtas: Remove trailing space
      https://git.kernel.org/powerpc/c/19773eda86e289526b7f08fa56c92e75cd7796f6
[7/7] powerpc/rtas: Remove 'extern' from function declarations in rtas.h
      https://git.kernel.org/powerpc/c/646477fc47905157a8440cdc45aad22901b5b3ce

cheers
