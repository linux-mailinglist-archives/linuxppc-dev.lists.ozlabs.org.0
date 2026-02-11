Return-Path: <linuxppc-dev+bounces-16815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E9fGjfjjGk/uwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 21:14:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C0127596
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 21:14:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fB8mM01xKz2yFc;
	Thu, 12 Feb 2026 07:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770840882;
	cv=pass; b=fqVaRYuQsoQea/52LOHrj86tQqhKqZczLLCqOFZ+DSFOp16y9ubjJNWrDv3wbNBZC2MweJzSYsBlVZ365my4uV5TSTjHMHEHgpS4wTCtCmgbLHmvDY4hdgHI7rik0fqjC4CWVZJX46yJigaXE65RmK3UwYjp+oU5njQsnry84hElKU9C/6U9VGr6g3VVCxdc+ycoGBcqH1VsRIKkKy1ZPIebQ44DC993n2GPUZR56AX4DPek0qHz0bYWYGBJ01gkd/MNjnkihw3oVDYzjJ6hGQUHnggEX6JaymVxABazQVx1h5ErHbbpLjf/0lTyCAfucrSNHbrHkbnGUs3IFHjugA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770840882; c=relaxed/relaxed;
	bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfZcwPlj79myJgg5L22j1OfzL+vIuEfJ8MvVR+TgRtQasIe21+BJKa1rG6pYjg3bnhH5Og/S3BQ98SRQZ7pcWVGbOVpYqrBYz6Mbj4HxZ6CcRnons71Fem0EWdUH3y9zIxipvQiXUhpj47zzX8l/9RcE/r5rzjQkqQRMiiXuhOGOSuwaeZXmn9u4UJx8pND7wRW9cig3xOdDjEt0g+zvEwHeKbGX+NKMdnCA2lmA5IfpBXxmH5YfvckaoEUyGHm9thFNjWMbK2UO5S4NY8Ov2kjuIS3k40UNK+lhD7eamGAjiCG9idQ3Ly/EZ4NIlCeFYigaRbUWnEZs6jfQn4S62A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kSZHwymP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kSZHwymP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fB8mK0809z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 07:14:39 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so1034179966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 12:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=aUjoHXqKe0UkSfnhL0zvuBWCF03Dn1M8p8NbmwFkMxYqL8l5xdSjqR+ttc6XJY2bBK
         7gZysb3HiwvXIfsJbZywz9CyQLrnG5jTqMBuphyY+V0AhrUUGknLdAjL2iQy5hrqrMWP
         GmkvTdfeEC+QKD0OOyQCw/W/0LdTx0qqN0s2RXOB4oaYtsyjQ7DMFM9zbix+HBWCQG7D
         sAEqXHbiKQ/l2Rs8Xr7oMJCL79ys4GoJmOy7zydZXPew2J4FAYhWrIbX7iWa2sMDxX0e
         YyLQObDyDRAvwzDBRIU0FttcGKxF27fgYC6bd5xizPU2osYdsrY0rpP+TqmcXlSmxSm/
         tngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=Y08Xo/ayF3BeX8G9CdHJ2A17kGnLYPle5z+d1c7EJXY=;
        b=LPXJCIY3LVsqc0+YKxFFDeSOafSVR/77jqBZw/2R4BxYhql9dU1VKpInsL+Y4x08aI
         XOCtZ+BCVbvIWcWXY54rP1GZqx//4Mm+ieix7ta3lFcjuylrE4eLgooh6k1Vr6F97i4M
         NkbVah5Y+4NdnPbwuDZD8EzgP40SjSyxPT8MvEJoalAhC2hu3qC6dixCHBC7cKymUfNz
         mHVE0pNw7e3TU5bRS4ogiKraX1+QhZJvVRPQsJHmWqqiFEqih+ZjAj+Ff73MLc0Yn6Zv
         Twio5hDaTE3ho3hfPnksgbl81fPhjtSpXd6fBjWsqfWI8OLu/voLcbcOWhJ+EP4WPLO9
         9Z3g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=kSZHwymPelrcBAKNTbSVX5JPmP1JeabqGkIlvtTrDUOApbLvPehLpCf8dZmNDQoJdi
         QZ/cC3xkiNgYKx1QxT2VslVtBwyc1wP9ECqFxQ+mDSQP+dE/2ms+21r/OYG/m9Ueb8S7
         9cF5CzWnr60jarQRSTiOjlHTWBJ9tZIutXp423so7L3lw/mHOsxszCj+Mn0tSWz2eF1+
         gAWAlb+V5jMMrWrSFgrYZtSPFgmdoopzN+MLTe5o0F6gvMQG1Xzl8qBm/HACBNaIOvn7
         42j61qfomfI/G5/0TAUR/9Yb82voOxCmR4NoKff5cPvQxvGX4bZAObZ+385g4TI7nnU3
         7wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=XpKcVMUtHCEaIwKse/91CsksjNHxfCNe/uzFNI/iVKPMCx1+Cfe+F3T73TdzSSI2CN
         1iKyWd0V1N7OEPZeKkAHZB99s5NRKnPdCVaYMHfIZM1zjKm7Zkyj2xO78gmaDdlQ+TvP
         6ur6jx6hgNfmTUNfaPEwA5nM24YPNdfcOYFTtNi0vMebOdLOpd1SsdcrBE6/yFJ4Vt7E
         hlP0aeXCjTzm0x/MAdZLoGDaA8riO2QU3NhB1hkLZb2nbx8jLGXabn7PJ0pdzGoxvdKu
         Y5iyQxKraXCgpLuyl9aKnZAk3wPy6PldvNnibqQswR23kf0bA2Usplh5dZDt4JGWWRs9
         Bi1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwxf5YwAGPrsf/FRgXmwzzyXgA/PSKkscLmGdIJ6nqB/nHVOb/Fos5882UHdDUEQbAXvcl+P5hUlAjX6w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbKWKPAAvgzbswB2VKURy6ne4nkpozNse+++32PxzcrpvCSwL2
	+uQ8bMSV5XTU2R31/RHXiqnu98P/8viL6iyp0Fft7kXlktZvfeGa4xMIFCqJ48gecut1OKrv5yr
	2wtvkweALr/MY1mZVfGTAa6ImjkM+vnQ=
X-Gm-Gg: AZuq6aIf01H26pDyx5n1GI0S76/cXh+YYyhoNDHggoXrSjsm6M5pA7Qh4t0h/pMfgIh
	3h53eLQoagnxK4hWcir9D4KwTGF5jRw7LG9nDY66+Vpz+QFvuhA7mMq+j7tSSap1yI5RQQSf24T
	b8DyV+TasyqJCW9agSnxfFMQdChWTFeFl4QLwUKWKBJ7kw2naOvEFcy2+s4RWI+Bj6nPN7XRZVt
	E6OwYkmBMB0ZTLIOuph/vwTXdVkTA9qdQVK0Yc1ydPzx3NqYyHDxjTXaDyRH9VrfCYL6oIeliC6
	fmoo54zNf598QIDit64XRT22UZd/bqhmHPdecdVC4Q==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
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
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16815-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linmag7@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:maddy@linux.ibm.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.lin
 ux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,gmx.de:email,intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 980C0127596
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>
> Every architecture defines empty_zero_page that way or another, but for t=
he
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
>
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to th=
e
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
>
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
>
> For the most part the change is mechanical, with these being noteworthy:
>
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boo=
t
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sparc64 can have empty_zero_page in BSS rather allocate it, but it
>   can't use virt_to_page() for BSS. Keep it's definition of ZERO_PAGE()
>   but instead of allocating it, make mem_map_zero point to
>   empty_zero_page.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the gener=
ic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
>
>         /* A handy thing to have if one has the RAM. Declared in head.S *=
/
>
>   that unfortunately had to go :)
>
> Acked-by: Helge Deller <deller@gmx.de>   # parisc
> Tested-by: Helge Deller <deller@gmx.de>  # parisc
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/include/asm/pgtable.h          |  6 ------

> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 90e7a9539102..12a3c5f8ece8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -125,12 +125,6 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> -/*
> - * ZERO_PAGE is a global shared page that is always zero:  used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(ZERO_PGE))
> -
>  /*
>   * On certain platforms whose physical address space can overlap KSEG,
>   * namely EV6 and above, we must re-twiddle the physaddr to restore the

This looks good from an Alpha perspective

Acked-by: Magnus Lindholm <linmag7@gmail.com>

