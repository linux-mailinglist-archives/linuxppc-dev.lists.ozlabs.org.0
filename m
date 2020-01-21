Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56243143BC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 12:11:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4825Sg37WLzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 22:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fQaeudZN; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4825PL0rdTzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 22:08:19 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id m13so1345594pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=q9+d07yNlL7y2pMZrvszriwhmvSDwpSLEXm3PxmeYTE=;
 b=fQaeudZN+QMV1F3SRaOstbh2HT3NA2RiuiT2HN5Q6zsovUYOZBhDa04WC3qbYZd/8k
 AHY7UAshUPeVTLVD75tle7m6sBUS9iiKsoLiCndXP3VpGILT5/V6kDPZyBeL9CiIMJ88
 DKgaqE8s3DK/voqFz+h9X62AYIeP9sIcUC3JNMdOwEIgFr/HukwPKq1RVJhlEiMBP1HX
 ZMyVc+hq/UBoIvLZ02v191u+Z5WAoSD8HOwbjHCYV1bc5KDcWcQOWkoU4XWnT85ENAvB
 vu8OUh5g0HzkrUN+Q5d1fvsGqgaUcoow2tz8y1pQkWewrZ+EqDaTMw8P5LRZpnMH0O5j
 BwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=q9+d07yNlL7y2pMZrvszriwhmvSDwpSLEXm3PxmeYTE=;
 b=Ool9Ci+cXAFQyIMVydaANfqDKl3MelP5oo/HRuVAAIg6WQC2vI0vt+lDJ5St53mRNn
 jiW11ZfN0SivLL2TXweF0RmbHarZdYLU4ybAW+eA7+HNazx89UdP5pMXt5idJbr1Yr0G
 PX13DsPenmuSJXK03nnW5wsO9KP6r4ol3pWzp2c5HSRuHHO32y7czcDKi0vkioMSCMQ7
 EgaomHZfdEh9ETI8UrzV2nuOLQiVzrDf2VlYANnbtjyGufx4gppwSJq3Oup7B/kWszJf
 /GKQ3IKnonZcwJP9ZEFJcvKMSf2tjtzQImcUI4K0IqzQ5U6WMV+LlS+8TLafbQAE2EVU
 F7hg==
X-Gm-Message-State: APjAAAW0ip0vWNLUd2yAKsek2MkoDaergK2kp3fTPBFhj2oWQjhLg71t
 tWIsV0PtmMKG4E5Cn5zv37Q=
X-Google-Smtp-Source: APXvYqxZcU33OKBN70qgkmnyLULSS0Qcpq/z+2bI4UZ0cCYm/GJKOy8sTmQK/D3pzIif0b60TO+i8A==
X-Received: by 2002:a17:902:8bc9:: with SMTP id
 r9mr4794664plo.48.1579604895793; 
 Tue, 21 Jan 2020 03:08:15 -0800 (PST)
Received: from localhost (193-116-65-251.tpgi.com.au. [193.116.65.251])
 by smtp.gmail.com with ESMTPSA id a22sm45514122pfk.108.2020.01.21.03.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 03:08:15 -0800 (PST)
Date: Tue, 21 Jan 2020 21:05:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm/hash: Fix the min context value used by
 userspace.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
References: <20200108054422.161384-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200108054422.161384-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1579593605.idinjkyxla.astroid@bobo.none>
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
Cc: Romain Dolbeau <romain@dolbeau.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on January 8, 2020 3:44 pm:
> Without this kernel can endup with SLB entries as below
>=20
> 04 c00c000008000000 00066bde000a7510 256M ESID=3Dc00c00000  VSID=3D   66b=
de000a7 LLP:110
> 12 0000000008000000 00066bde000a7d90 256M ESID=3D        0  VSID=3D   66b=
de000a7 LLP:110
>=20
> Such SLB entries can result in machine check.
>=20
> We noticed this with 256MB segments because that resulted in the duplicat=
e VSID
> with first vmemmap segment and first user segement. With 1TB segments we =
observe
> duplication with EAs like
>=20
> 0x100e64b vsid for EA 0xc00db50000000000 context 7
> 0x100e64b vsid for user EA 0x1b50000000000 context 7
>=20
> and those high addresses are not common and the kernel mapping in the abo=
ve case
> is I/O remap range.
>=20
> [    0.000000] vmalloc start     =3D 0xc008000000000000
> [    0.000000] IO start          =3D 0xc00a000000000000
> [    0.000000] vmemmap start     =3D 0xc00c000000000000
>=20
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in th=
e same 0xc range")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc=
/include/asm/book3s/64/mmu-hash.h
> index 15b75005bc34..516db8a2e6ca 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -601,7 +601,7 @@ extern void slb_set_size(u16 size);
>   */
>  #define MAX_USER_CONTEXT	((ASM_CONST(1) << CONTEXT_BITS) - 2)
>  #define MIN_USER_CONTEXT	(MAX_KERNEL_CTX_CNT + MAX_VMALLOC_CTX_CNT + \
> -				 MAX_IO_CTX_CNT + MAX_VMEMMAP_CTX_CNT)
> +				 MAX_IO_CTX_CNT + MAX_VMEMMAP_CTX_CNT + 1)

Good find and fix, but the changelog is a bit difficult to read.

The bug is an off-by-one error which means the first user context ID
allocated is the vmemmap ID, right? I would lead with that.

I'm not sure that machine checks are a primary symptom, different ESID
mapping the same VSID is allowed. My guess is the machine check happens
a little later, after the vmemmap gets corrupted via its new mapping.

Guessing this hasn't immediately resulted in wholesale mayhem because
- Init is pretty small, doesn't use many segments or pages.
- Low 1TB is mapped with 256MB segments which get a different VA hash
  than the 1TB vmemmap segment.
- init tends to load itself at 256MB, so even with disable_1tb_segments,
  it's clashing with the second vmmemap segment, which is for like the
  second 256GB of memory on the first node, so not going to hit many
  systems.

Anyway good find.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
=
