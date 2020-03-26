Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA3193EB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:16:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p3qS3ZTvzDqss
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:16:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cQ20pRzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cP6L4rz9sRY; Thu, 26 Mar 2020 23:06:28 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: eb4f8e259acc37b91b62ca57e0d3c8960c357843
In-Reply-To: <07a17425743600460ce35fa9432d42487a825583.1582099499.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/kprobes: Remove redundant code
Message-Id: <48p3cP6L4rz9sRY@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:27 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-02-19 at 08:05:57 UTC, Christophe Leroy wrote:
> At the time being we have something like
> 
> 	if (something) {
> 		p = get();
> 		if (p) {
> 			if (something_wrong)
> 				goto out;
> 			...
> 			return;
> 		} else if (a != b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
> 	p = get();
> 	if (!p) {
> 		if (a != b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
> 
> This is similar to
> 
> 	p = get();
> 	if (!p) {
> 		if (a != b) {
> 			if (some_error)
> 				goto out;
> 			...
> 		}
> 		goto out;
> 	}
> 	if (something) {
> 		if (something_wrong)
> 			goto out;
> 		...
> 		return;
> 	}
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/eb4f8e259acc37b91b62ca57e0d3c8960c357843

cheers
