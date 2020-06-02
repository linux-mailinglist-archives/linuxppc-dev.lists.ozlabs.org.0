Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CD1EB99F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:29:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bpF827KFzDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 20:29:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bp8P3vBrzDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 20:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R1/NZBR1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49bp8N3T04z9sSg;
 Tue,  2 Jun 2020 20:25:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591093524;
 bh=bN3rqa6f6l9DlK7L1JNF8T+VNnchQEaRZ8dgVazwIy8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R1/NZBR10nlS7ll7pX2mk/fNINJZy+PwyKktbGIg2EldKGyP0lxI5mgaKPeLTkw0J
 Hvmu/kSOTp6jQk7f4Agg10q2+XVIS+yJmDllATSjHioYsrlvDS6zl2VVvZf1sp0nk4
 ZIJ8LLounljxtQZLdSkXQeszAvrAzyWj7rNLXtT280ij0Khs1Ft2Vv4IICTNrtVbE3
 RhOmX5FIAprMv5VTOhaK1SqrgvflqBIGCut8PW2ETD2y0VFUxVDbs1pNsasLeNDHGk
 LtEM42rX1w91hdpauSeBzYJtNrjkN9jlVUnxQn6cxo6+eLpw4foZIhPeTLZhoZ7xaw
 t9t9p1jZvievw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/32: disable KASAN with pages bigger than 16k
In-Reply-To: <afb1a3a9-8d7d-4c99-d42f-f6d78dcef0a5@csgroup.eu>
References: <7195fcde7314ccbf7a081b356084a69d421b10d4.1590660977.git.christophe.leroy@csgroup.eu>
 <afb1a3a9-8d7d-4c99-d42f-f6d78dcef0a5@csgroup.eu>
Date: Tue, 02 Jun 2020 20:25:48 +1000
Message-ID: <87ftbdix1v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 28/05/2020 =C3=A0 12:17, Christophe Leroy a =C3=A9crit=C2=A0:
>> Mapping of early shadow area is implemented by using a single static
>> page table having all entries pointing to the same early shadow page.
>> The shadow area must therefore occupy full PGD entries.
>>=20
>> The shadow area has a size of 128Mbytes starting at 0xf8000000.
>> With 4k pages, a PGD entry is 4Mbytes
>> With 16k pages, a PGD entry is 64Mbytes
>> With 64k pages, a PGD entry is 256Mbytes which is too big.
>
> That's for 32k pages that a PGD is 256Mbytes.
>
> With 64k pages, a PGD entry is 1Gbytes which is too big.
>
> Michael, can you fix the commit log ?

Yes.

  powerpc/32: Disable KASAN with pages bigger than 16k
=20=20
  Mapping of early shadow area is implemented by using a single static
  page table having all entries pointing to the same early shadow page.
  The shadow area must therefore occupy full PGD entries.
=20=20
  The shadow area has a size of 128MB starting at 0xf8000000.
  With 4k pages, a PGD entry is 4MB
  With 16k pages, a PGD entry is 64MB
  With 64k pages, a PGD entry is 1GB which is too big.
=20=20
  Until we rework the early shadow mapping, disable KASAN when the page
  size is too big.

  Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
  Cc: stable@vger.kernel.org # v5.2+
  Reported-by: kbuild test robot <lkp@intel.com>
  Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
  Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
  Link: https://lore.kernel.org/r/7195fcde7314ccbf7a081b356084a69d421b10d4.=
1590660977.git.christophe.leroy@csgroup.eu


cheers
