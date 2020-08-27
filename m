Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC67253D9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:19:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcXdS1JZhzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcXbs2LzlzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 16:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f3MFT/P8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcXbr1rGJz9sRK;
 Thu, 27 Aug 2020 16:18:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598509112;
 bh=zpqgZWqMZBvBf2CzQA0fslJNWPEvUc1PO93V2mr8V/4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f3MFT/P8oi70COf7CmSBb9X4Pm5gW1urUz1iaE5cy58gVRDgj+iH3jqMK77uxKejJ
 WGYwu0R5gGOCB+cBXUZyKJhyf0+pvayrqwe6k/MJZyG2w6C4iRrOAAu72di90uZXu1
 3JPcy5SXvGzbhUw6Uzp4+V7K+Lplbf9e2mOconJQFWK5V4LPo9yBC+GMfhwpM4LiED
 WFzPhiEikjtft3fYfKg4MBgc7+pRXePA822pKrbcE6rhpYXwPYg402tcPJPgnvnkKk
 3LVSjLcBvH7S+V6/hM/2MKjofvg2G6dADmMF5vpIR7XMwzan+a7oGIo4xRL5Ae+SeF
 YdiVmukFrAoPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: Update documentation of ISA versions for
 Power10
In-Reply-To: <20200827040556.1783-1-jniethe5@gmail.com>
References: <20200827040556.1783-1-jniethe5@gmail.com>
Date: Thu, 27 Aug 2020 16:18:31 +1000
Message-ID: <87ft88393c.fsf@mpe.ellerman.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> Update the CPU to ISA Version Mapping document to include Power10 and
> ISA v3.1.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Transactional Memory = No
> ---
>  Documentation/powerpc/isa-versions.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index a363d8c1603c..3873bbba183a 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -62,6 +65,7 @@ PPC970     No
>  ========== ====================================
>  CPU        Transactional Memory
>  ========== ====================================
> +Power10    No  (* see Power ISA v3.1 Appendix A.)

There's three "Appendix A"s in ISA v3.1.

There's one in Book I, and one in Book II.

And then the one you're referring to is not actually in Book III, it's
listed after Book III, and is apparently an appendix to all three books?

Which is just utterly confusing.

So I'll change it to say:

"Appendix A. Notes on the Removal of Transactional Memory from the Architecture"

Which is very long, but at least you can search for it.

cheers
