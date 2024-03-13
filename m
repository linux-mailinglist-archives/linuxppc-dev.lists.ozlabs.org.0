Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B187B404
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:59:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cn0HghnJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw4DR2gQnz3vlM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cn0HghnJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw4Ck2sMtz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:58:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710367138;
	bh=58KkESeDPsHRbNx3kntj2Fa/IfuLFOWCJOevvMZ9NFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cn0HghnJvMFZRPw0P+io9IjHeIgs6/QwC17HjQ//7evaFzP0W027PIs3ksjlNuQnB
	 IrxQzIhnirVJEDKFqzyEVZx2ks8IgXp/hXzSxt1/Oo+gVyJXAQV5LADKb2cM1O92vF
	 +znXkkQfMZbhU6dgXerpdVtxOxQG48d3s6KnzMdtBBPxLJx2J0rvJ5aUec7qPhN5vs
	 R+91taN3agDZx4IHHDUjCSgbdf2g5bzsgrzIZj80sx63HrjYuB5neBs37PG2wvclMC
	 AtGZcEJWaklW4UoakfhPHYA/Ck2yFNVgEazJeZgHDKfSBWupH5oJKAoew2e6UMO+3V
	 GZ0bZjpuJIF8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tw4Cg2VH3z4wcg;
	Thu, 14 Mar 2024 08:58:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "debug@rivosinc.com"
 <debug@rivosinc.com>, "luto@kernel.org" <luto@kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "peterz@infradead.org" <peterz@infradead.org>
Subject: Re: [PATCH v3 07/12] powerpc: Use initializer for struct
 vm_unmapped_area_info
In-Reply-To: <e9b5b322b451dfe2dde8da2b1240cf51f74b0541.camel@intel.com>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
 <20240312222843.2505560-8-rick.p.edgecombe@intel.com>
 <dad7735d-dc57-4c89-a2b2-29d971f3cf69@csgroup.eu>
 <e9b5b322b451dfe2dde8da2b1240cf51f74b0541.camel@intel.com>
Date: Thu, 14 Mar 2024 08:58:51 +1100
Message-ID: <87wmq53ias.fsf@mail.lhotse>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:
> On Wed, 2024-03-13 at 06:44 +0000, Christophe Leroy wrote:
>> I understand from this text that, as agreed, this patch removes the 
>> pointless/redundant zero-init of individual members. But it is not
>> what 
>> is done, see below ?
>
> Err, right. I think I decided to leave it because it was already acked
> and there wasn't enough discussion on the ack to be sure. I will update
> it.

That's fine by me, you can keep my ack.

cheers
