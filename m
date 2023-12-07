Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5280885B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDdP286lz3vsg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVs6v5Jz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVs5lgRz4xQj;
	Thu,  7 Dec 2023 23:44:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/pseries/memhp: Fix minor bugs and improve error logging
Message-Id: <170195271172.2310221.6748653819742482850.b4-ty@ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Nov 2023 11:01:52 -0600, Nathan Lynch wrote:
> This includes a fix for an array bounds read overrun that can be
> triggered when debug messages are enabled.
> 

Patches 1 and 3 applied to powerpc/next.

[1/3] powerpc/pseries/memhp: Fix access beyond end of drmem array
      https://git.kernel.org/powerpc/c/bd68ffce69f6cf8ddd3a3c32549d1d2275e49fc5
[3/3] powerpc/pseries/memhp: Log more error conditions in add path
      https://git.kernel.org/powerpc/c/27951e1d8274e9f9a2925b069e4492939a3f2099

cheers
