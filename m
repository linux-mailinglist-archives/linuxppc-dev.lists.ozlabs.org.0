Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A211CBF51
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 10:45:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K13y6hLKzDr3V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:45:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kcvLKoGH; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K1235Sf0zDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 18:43:39 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id y6so5370135pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 09 May 2020 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MM0pGuoQz+m2i7SaYQltsjhcG+vuQhDEB07kHe3ONp0=;
 b=kcvLKoGHrq9a+5FfTP8I/NSRlRWu8KC1v695rjWAb9PcXDvN9fvLTi2oFBnMQCjBOY
 EPu3A2k0S9rM8sVRt4AllKRGzkMHa+mCg07kNipoGXPLoIxr1zaKy3OPelFzOOmwND7+
 cgkpVRemAhJ+yVySh/spOAaQ5wnLx3cu0pfxBJXEAP3lXJPmIXNN+mJf1OtqtiHIfG7S
 tXDRZBpYBb5eY7ddn+nJ/QeJl3ZniXG4JIaqkvaRwTvEcD3UFG+JGxjLmBFn9rzxPHlj
 TqFHybaSAf2rwWCCo8B7A4jeFE8p5+QkzdYbyT/6RuaJA8ed/2SRuqa7RBk6ZKovLbLK
 JJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MM0pGuoQz+m2i7SaYQltsjhcG+vuQhDEB07kHe3ONp0=;
 b=hiWnoiiJIgeVOroDxDaVnm3BZENfmwe0hxh/2hlbFUsWKyS9d0OjUXy4b1IkgsBwxX
 wCpApA7UBnmOJttwkhmhVODcJSHHBmV4pZyPd/WwAl9Dc9bwAc36hxUrfV4D8d4U+ZfH
 +9KsLSWWm/8tLJyURjro91kuKCq0ThEL1cznQ5gkaPirKu5+Ih7vSB+C+YggoXtjiEdx
 cGpPFeezWxGJce3w53/7ygXt1lI8RcnvTQg2usgRdbEGCINLk6yTMAeH2lvM6LfwUEaS
 jXRNKkU+FhExsiS2Kp5pireyUFXGho7qQjtmMY49jFQJqcItzsNWOseaFku+hchXQaxH
 RU+w==
X-Gm-Message-State: AGi0Pub9RWVX4ljZk2LYDexecxeKDHSAJ+VRhS0zfs3TjIN+goxyP6z2
 CWyeTEnFPXNJq9d+a85f5EE=
X-Google-Smtp-Source: APiQypJOeWgThOJc+RzZuE2Da5TBy3JNA8q5LcFNGI6CFT06/rcxe512zRiuVgYXqPtfTYAokEoLdw==
X-Received: by 2002:a17:90a:f40f:: with SMTP id
 ch15mr6228382pjb.178.1589013816321; 
 Sat, 09 May 2020 01:43:36 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id v9sm4218268pju.3.2020.05.09.01.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 01:43:35 -0700 (PDT)
Date: Sat, 09 May 2020 18:43:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: ioremap() called early from pnv_pci_init_ioda_phb()
To: Qian Cai <cai@lca.pw>, Oliver O'Halloran <oohall@gmail.com>
References: <B183CDAA-DA88-4760-9C1B-F73A8F7840E7@lca.pw>
 <CAOSf1CFNp6+k_y_87r7p2e8cKfX0rK-9wBxeR+K0e0y8R0_TNg@mail.gmail.com>
In-Reply-To: <CAOSf1CFNp6+k_y_87r7p2e8cKfX0rK-9wBxeR+K0e0y8R0_TNg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1589013519.0fzm2px5cz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Oliver O'Halloran's message of May 9, 2020 6:11 pm:
> On Sat, May 9, 2020 at 12:41 AM Qian Cai <cai@lca.pw> wrote:
>>
>>  Booting POWER9 PowerNV has this message,
>>
>> "ioremap() called early from pnv_pci_init_ioda_phb+0x420/0xdfc. Use earl=
y_ioremap() instead=E2=80=9D
>>
>> but use the patch below will result in leaks because it will never call =
early_iounmap() anywhere. However, it looks me it was by design that phb->r=
egs mapping would be there forever where it would be used in pnv_ioda_get_i=
nval_reg(), so is just that check_early_ioremap_leak() initcall too strong?
>=20
> The warning there is junk. The PHBs are setup at boot and never torn
> down so we're not "leaking" the mapping. It's supposed to be there for
> the lifetime of the kernel.
>=20
> That said, we could probably move the PCI setup to a point later in
> boot where the normal ioremap can be be used. We would have to check
> for initcalls which depend on the PHBs being setup and delay those too
> though.

I think it helps to unify code a bit more and take special cases out of=20
ioremap to have all these early calls use early_ioremap.

We actually do want to move these later if possible too, on radix they=20
use memblock for page tables, and on hash they don't even set up proper=20
kernel page tables but just bolt PTEs into the hash table.

Thanks,
Nick
