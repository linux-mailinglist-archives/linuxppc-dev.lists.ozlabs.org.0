Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2432E21A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 07:23:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsHkD2669z3dGP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 17:23:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W4Na6DiU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=W4Na6DiU; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsHjr1wHjz2xZV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 17:23:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DsHjn6wf6z9sVt;
 Fri,  5 Mar 2021 17:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614925406;
 bh=vhZ+ardqsQ5ea5DSlNBSfyBBFPtTVFoe3/Aq+lA3Wms=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=W4Na6DiUpEajZaPOVjPsUiELSE3AFsUzknC3uEpdrbr+GqXVXR6GB/iZbets36I8A
 pUnaWA+0qviuS9Pj5qwEGIlx3JYely+VBLeNBKajvLhvT+Bs2YUc5IjytsHwRsjI4p
 L5KSUQ7yKZ4+DG21cPtPoQOqtj5MamKnd5o0ipHWAH/+R55Uj+PNcmEKJ10w6lNZ/g
 f0audOESlXLc2hBgO9zFi1lnNy9gpEFWO6/DPWqqCmeEFTkLirs68osCaSu7KpzNcg
 XdWMF4GO8LP3EXk8EPY2ywYy8g577rJpxuqrzySILgpk1uDlqZBtgWwb9gwcY0tOEo
 AX7XnJJyFQlIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, benh@kernel.crashing.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: export LPAR security flavor in lparcfg
In-Reply-To: <20210304114240.54112-1-ldufour@linux.ibm.com>
References: <20210304114240.54112-1-ldufour@linux.ibm.com>
Date: Fri, 05 Mar 2021 17:23:21 +1100
Message-ID: <871rcuruee.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> This is helpful to read the security flavor from inside the LPAR.

We already have /sys/kernel/debug/powerpc/security_features.

Is that not sufficient?

> Export it like this in /proc/powerpc/lparcfg:
>
> $ grep security_flavor /proc/powerpc/lparcfg
> security_flavor=1
>
> Value means:
> 0 Speculative execution fully enabled
> 1 Speculative execution controls to mitigate user-to-kernel attacks
> 2 Speculative execution controls to mitigate user-to-kernel and
>   user-to-user side-channel attacks

Those strings come from the FSP help, but we have no guarantee it won't
mean something different in future.

cheers
