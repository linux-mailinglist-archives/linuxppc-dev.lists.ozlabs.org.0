Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1534F613
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97hp4Tstz3g0k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xc43vmz3bvk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xc2QZdz9sXb; Wed, 31 Mar 2021 12:10:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20210305125554.5165-1-ldufour@linux.ibm.com>
References: <20210305125554.5165-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: export LPAR security flavor in lparcfg
Message-Id: <161715296647.226945.115384263678902468.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:26 +1100
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Mar 2021 13:55:54 +0100, Laurent Dufour wrote:
> This is helpful to read the security flavor from inside the LPAR.
> 
> In /sys/kernel/debug/powerpc/security_features it can be seen if
> mitigations are on or off but the level set through the ASMI menu.
> Furthermore, reporting it through /proc/powerpc/lparcfg allows an easy
> processing by the lparstat command [1].
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: export LPAR security flavor in lparcfg
      https://git.kernel.org/powerpc/c/6ce56e1ac380eaa088d3f4c01446e15e195bd541

cheers
