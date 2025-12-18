Return-Path: <linuxppc-dev+bounces-14883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5132CCD0BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJKM3C31z2xrM;
	Fri, 19 Dec 2025 04:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766080647;
	cv=none; b=OiTvYrX/K9J5zCHjFjx2vi+DSmqBboBDwcifYIPocZ4mXov2PBI+ejZKFFIq/73Hq5ZE6w4q1i/Yr8QMYZYKVZQfCwOWRv0iGNAN49+pqbfjJ9U3btfSZK6vRS4HDFvNa9zoJR3ONaT9b0h1j/k16c8gMrG3B4UVmPuVI60i80KQ+BZhYXgsV5FpeWm8RkDYmvXYNGdF+kvPBH2NYPKbcMvh999MYCig7TiPSOclhNRX+2Nmy20Fm0pg4MdtkLJbJ9q4AFG17z48aTiXEojYkHfztZ/VBv9IawdpaOon+Hex/wMDHrIRms7DFfTBKkie1Ymf+TVg2PuvD24MtRJktw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766080647; c=relaxed/relaxed;
	bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6AAkVVjjAAURhe20oj3yxo84dChDE0eyzAXEPAPi8lffQCCLVk2t50Uoj3y2bCxvOvDcGWc71JHtP+u7ImE0I1H0mVbcNsvdRm3lIJVIBl260Gzoq6sihZSTWHXaBP9RBRlBgCNKE0lu7PZN/gyg0SGUNFaCgR9SXq4Wk61SaiT09fxifENVRMBOssc+0+LyvSn0EdLxdFC6XNYeVA2JrXAonpmjfHth0SJ6lyW7K3soMdzCIF8aBdpKxbsxelAZu9Fc8WAX0MyxGGiQZhGxux+1HHKjE/zFZFVdb3BkJunSOo7HQ7bYaex86KuUOSU9kYDVz+gJcpGwMN69MEMRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kR7o8AsD; dkim-atps=neutral; spf=pass (client-ip=209.85.208.48; helo=mail-ed1-f48.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org) smtp.mailfrom=soleen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kR7o8AsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=209.85.208.48; helo=mail-ed1-f48.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJKL14MZz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:57:25 +1100 (AEDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso1269671a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 09:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080582; x=1766685382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=kR7o8AsDvHNJmySn7m8mC8k2jcBEetCuySLOQgWfkSPJ3/NTFQMt3UUBIm4/a1puJz
         Mdy9mncIEdsqot2RS/KbhTmhWzeN4jN6iesH2N9s3KVt55ywlj3hd1KqPm3UTMnD9vxT
         8krIfobgJS7No3hD0szelpy7fX2tRpAz5LFOhz3wxfK+390XmR2mkFRCu79N+HReZN+X
         QCtuE0Cid6JfT0SbZeNcmCLOcbhjPezTNs8Sek4HjMFG4cU3NO9MbXuawLhWCzzJHZo0
         Fb7u921SKQzgpU+gibQglLfPvPzlsFb86EaIChEZ3b70YuoCAD1m8SFNYGsmVP84IREn
         BVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080582; x=1766685382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+6WN6/p1fp60hzkSr+llXdbvd+YBmTxfk1iXBMLJZA=;
        b=OhtSi9K2v67mC4N47nd3WJ+OyycbWSNZKg0zD8ooPkgECi8Y4RlMeIsKqOpk/Lq7wh
         5D84vtAcVg5Cr5rCaOgNQnxbNjJqNKgNrKRUb6grtwaqfD0kG3vdhmkkKm+mYlQautWT
         M0t/oyoOHlLAllj/Hzp7yuUCopHA+kPt17EQxBln1F8LlVOwvEJocf0UapwptuYNNwK1
         xX+onGkcVwi361oYPXTkj2l6W4tLpzYRquWQvNE2nhcYtjrUlBbloDvoOsodf55PYBkc
         g59/6x0/o3M0nOZXKxlX7PXUPWr3j6QNhS3UwT3NDgiopm35OhrXt0FwpIunrn7Q0Sm7
         Hdlw==
X-Forwarded-Encrypted: i=1; AJvYcCUbnOOdPFWbVHmDlqVGim1h+hWIV9yS2WmovpzcICnmjSMQGd4vtH4eAa/2XfPTcey319nmFkEaxhai/ik=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQY9Uf7wBFgxVuSPix1I2hHO8JdMoC68bw1DrcRjovU8ovp4z+
	q/UerbWvDRKncuGHbnQUpsUGX+lvmh5bai6Gig+BGtU8dy/OH3K8lSOpW81zNrATcSIn5FVs9L5
	sLYtRngQzYWn2pK4nS+0livlXQae2rr+a/W6aU6Nlgw==
X-Gm-Gg: AY/fxX7xlDwqFMxljN+BnSCIYAk5xWOWRaJE/q1yLTXcJbWaFVKGM/iYszC/R3I4718
	pSyDF44p2QwTv/xTv3AHlxsUg+oQ35Nt2zj5tTUqEokUpHNlERRkbmsnYEFFArframq5IWnSIJm
	mYnPFppvptAi8vDE268xb2tCrzUqlph0cDJcWHNB5UnWITUrm+jbsfAFKrEZy+yEv6WYCQ7dUBG
	63+tpuIOquN0DbfAoMStBEv5gi81pS7bP+lw3Yd9VAqbxdluCVuaYJah1qUipRnJ4z86r00r0av
	kUNJnf8O5Bl6vK+ti2P700X+
X-Google-Smtp-Source: AGHT+IFq7ELTQKzF/TRk0SfbylhiIq5ob7abkvIiaiZCwA97lZgHawIVNTbXj5kEfVQ3oQIcBivxjmxKv95IDYu+mh0=
X-Received: by 2002:a05:6402:35c1:b0:649:e5be:1b4e with SMTP id
 4fb4d7f45d1cf-64b8e94d187mr222712a12.9.1766080582211; Thu, 18 Dec 2025
 09:56:22 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:55:45 -0500
X-Gm-Features: AQt7F2qjqHZAYpNwxuF-SUIUKVwppChumOkUsgRootjGM8dZ2yshNK1pTfmluNo
Message-ID: <CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> [I will be leaving IBM in about a month from now, and will also be on lea=
ve
> for most of that time starting tomorrow. I've cc'd my personal email, whi=
ch
> I am going to use for any kernel development I do after I leave, and also
> Srish Srinivasan, who will be taking over some of my work.]
>
> Support page table check on PowerPC. Page table check tracks the usage of
> of page table entries at each level to ensure that anonymous mappings hav=
e
> at most one writable consumer, and likewise that file-backed mappings are
> not simultaneously also anonymous mappings.
>
> In order to support this infrastructure, a number of helpers or stubs mus=
t be
> defined or updated for all powerpc platforms. Additionally, we separate
> set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrum=
ented
> mappings.
>
> On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_pag=
e()
> requires the address. We revert previous changes that removed the address
> parameter from various interfaces, and add it to some other interfaces,
> in order to allow this.
>
> For now, we don't allow page table check alongside HUGETLB_PAGE, due to t=
he
> arch-specific complexity of set_huge_page_at(). (I'm sure I could figure
> this out, but I have to get this version on this list before I leave my j=
ob.)
>
> This series was initially written by Rohan McLure, who has left IBM and
> is no longer working on powerpc.
>
> v18:
>  * Rebase on mm-new
>  * Add instrumentation for pudp_invalidate()
>  * Add cleanup patch to use pte_advance_pfn()
>  * Move p{m,u}d_user_accessible_page() to a more sensible place in the co=
de
>  * Disable when HUGETLB_PAGE is enabled

Thank you. This series looks good to me.

Pasha

