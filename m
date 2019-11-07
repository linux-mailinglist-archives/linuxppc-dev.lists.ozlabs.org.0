Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54AAF2DA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 12:44:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781l70B5FzF4Nk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 22:44:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781ft5x21zF3cg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 22:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="bwyA4TIJ"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4781fs5wHDz9sP3;
 Thu,  7 Nov 2019 22:40:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573126822;
 bh=FJpJLvMPLcF1D0gjiHAXrOBxl7SYUXs9DR1oR7+NSrM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bwyA4TIJCT3NGRCo2pGMJWIIKNxJ0ril0iMNAMkiryZZ4htDbOhPU0JOXpA9OpKpC
 AhUuLI7B3aYFy+g/fhH8Y9kmOoYRvsxETQKy1uNpz/E/RPxEeegZro9lRb9zLcyccL
 amyofDbiw/3lxYIq/TWtrnQ/Y8siVhb4+GWwOuEnPIr8W+009vnhXvzkNAU6jHfreN
 LJAqTSBhxpixRxiqvwl9rDIpiJtFa4nW+ZRFKEntzvIXuW9hLCl0HJM3ubsIpPpPFA
 fegUSrE8oJBd2UdG/fuEvjzfmcoBdtKiHP31IfCgtHdjp7eVxdGTLb0NP2baDgufOL
 WkGs31TlcDzag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 7/9] PCI: rpaphp: annotate and correctly byte swap DRC
 properties
In-Reply-To: <1572967453-9586-8-git-send-email-tyreld@linux.ibm.com>
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
 <1572967453-9586-8-git-send-email-tyreld@linux.ibm.com>
Date: Thu, 07 Nov 2019 22:40:19 +1100
Message-ID: <8736ez6hjw.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> The device tree is in big endian format and any properties directly
> retrieved using OF helpers that don't explicitly byte swap should
> be annotated. In particular there are several places where we grab
> the opaque property value for the old ibm,drc-* properties and the
> ibm,my-drc-index property.
>
> Fix this for better static checking by annotating values we know to
> explicitly big endian, and byte swap where appropriate.
>
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/pci/hotplug/rpaphp_core.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

This is allegedly still popping some sparse warnings:

  +drivers/pci/hotplug/rpaphp_core.c:XX:28: warning: incorrect type in assignment (different base types) expected restricted __be32 const [usertype] * got int const *[assigned] names
  +drivers/pci/hotplug/rpaphp_core.c:XX:28: warning: incorrect type in assignment (different base types) expected restricted __be32 const [usertype] * got int const *[assigned] types
  +drivers/pci/hotplug/rpaphp_core.c:XX:30: warning: incorrect type in assignment (different base types) expected restricted __be32 const [usertype] * got int const *[assigned] indexes
  +drivers/pci/hotplug/rpaphp_core.c:XX:36: warning: incorrect type in assignment (different base types) expected restricted __be32 const [usertype] * got int const *[assigned] domains


I say allegedly because that output's from a script that tries to diff
sparse warnings before and after the build and it's not always 100% reliable.

cheers
