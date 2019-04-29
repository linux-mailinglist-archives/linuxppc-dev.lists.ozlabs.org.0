Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB8DA62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 04:07:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sp2G4Q3xzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 12:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sp0k2kMJzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 12:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ZDh+JJdW"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 44sp0j4Vkwz9s7T; Mon, 29 Apr 2019 12:05:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1556503557; bh=C9jMjFQh8bIIcTLpSucBn3+IOPxRQfPJx62R3f27fHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDh+JJdWNbUnjZwYJ2OgXrlC5Te6OdRn22WeQuX4mEFi/3J71pfQo+39F6D6VmfIs
 gN6aTHh8fhD28hDxoQTNfGh80vVwOayHLTgGy/WObYcwr29+LgPtSFjpNYGvpucq7e
 RFvR2OWhFp0B7fWmnkVIVl5FSX1jogLJM1ivdGOqA7fkxhMHaDiTR0CdT1LUZLyBXU
 kNwsUKwXM2eBaXfB8xSfPnOIqb8nOoKndLFvhgA8sb3l7oGWYMgduupXvs/dphOqD1
 8Md0UWqf3a3EcS154gfVMUDHZtwTRPKEseYrZA6+ZANLVUVipPwrDyKTM5PLPIDLER
 jBXEXZZQAZv0g==
Date: Mon, 29 Apr 2019 12:05:55 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v8 05/20] KVM: PPC: Book3S HV: Remove pmd_is_leaf()
Message-ID: <20190429020555.GB11154@blackberry>
References: <20190403141627.11664-1-steven.price@arm.com>
 <20190403141627.11664-6-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190403141627.11664-6-steven.price@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, kvm-ppc@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2019 at 03:16:12PM +0100, Steven Price wrote:
> Since pmd_large() is now always available, pmd_is_leaf() is redundant.
> Replace all uses with calls to pmd_large().

NAK.  I don't want to do this, because pmd_is_leaf() is purely about
the guest page tables (the "partition-scoped" radix tree which
specifies the guest physical to host physical translation), not about
anything to do with the Linux process page tables.  The guest page
tables have the same format as the Linux process page tables, but they
are managed separately.

If it makes things clearer, I could rename it to "guest_pmd_is_leaf()"
or something similar.

Paul.
