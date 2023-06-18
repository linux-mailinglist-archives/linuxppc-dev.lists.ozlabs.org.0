Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF311734877
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 22:59:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ZVT9TlvX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qklcg4JPhz303p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 06:58:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ZVT9TlvX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qklbn1tMdz305Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 06:58:11 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f9a81da5d7so251891cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687121888; x=1689713888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZtyfCTAVMiPGQWHjgwoE9XDDUe5Zitl3naYIJu5u8M=;
        b=ZVT9TlvXekbzjsIk4FVN6w5b3V3bL2g07xM58CsOQEKlBliMaOMo4yZji4Q+4M2pTX
         PwOyYLy6AVqkAYYG8oZQzsoJ5wXO3fYU4dvuBveWcoPn/DBqA76dOm2wErETk5RMX4DF
         Pdjj7y7tVBfSg3bUPlVpNbbP9RKpJTFpWfMqG6NS8ogCoI9SFLLQjHjuiJCl9wmx/QMI
         sfudbAhw5Fv3ydEbSaSvd7K7sWgk9eaIp4KEVRbqeVVI+v27ojzRWzN3DHLLYoRPb3Uw
         6IMcAn+rqIjZUCyYlDlj0BpHHcpwknOPBIBYMxSFkst2yjNHbhKR20MPChNpYuTjpIYD
         wwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687121888; x=1689713888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZtyfCTAVMiPGQWHjgwoE9XDDUe5Zitl3naYIJu5u8M=;
        b=LKrQTwUGFsD6dTrJeVShJTCXF3slV7cj/4+MnBXidjQHbIQODWoS/Lo9/95xCvrP+e
         L3QTtxG4ME6kMm1DVU3WD4rAOh6nQqtCC2wIBbkg+nPfFpkaBwQy77fXNkJmoyC5wtF6
         3GhbhakqMPNfZm2AcYFFhel3b332YjoqLzH0PGamfaZY4WqTIZcGoti/ac7HCJ68jlp+
         Vhd/XDKFC5hvB7HBre3lwqPcD9CRLHnpzholQFe3/EXM+ug0g0ToiVvB2++ZZVrosGey
         ONyi+j4kktXL+QXSLmmmsBswP5Pzq0JZX91Af/dETnXUNcQ0ABvYCUJj3rJdNaqibdBW
         Odow==
X-Gm-Message-State: AC+VfDwoab74KOFHyrXtlgBRLd+0erkFDB+bYJ1UlOkDAo07FxzwzPoA
	aHgYzJ16/62kAua2kFOFop9QnPPKxAydwM+XOjfhag==
X-Google-Smtp-Source: ACHHUZ6ZDWbPtAWRuLjADFFa6FEUQ3GypTx245KPaUVC0BHZGX9Wd0LOXtVKSGnZtQDaYiPHdDlVEaUz0sYg2vTadSQ=
X-Received: by 2002:a05:622a:20a:b0:3f9:a78f:c527 with SMTP id
 b10-20020a05622a020a00b003f9a78fc527mr291449qtx.21.1687121888063; Sun, 18 Jun
 2023 13:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X>
 <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X> <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
 <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com> <ZI0uh8P/akwkGo0D@google.com>
In-Reply-To: <ZI0uh8P/akwkGo0D@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 18 Jun 2023 14:57:31 -0600
Message-ID: <CAOUHufbAjZd4Mxkio9OGct-TZ=L0QRG+_6Xa7atQVFN_4ez86w@mail.gmail.com>
Subject: Re: [PATCH v2 07/23 replacement] mips: add pte_unmap() to balance pte_offset_map()
To: Hugh Dickins <hughd@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 9:54=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Thu, Jun 15, 2023 at 04:02:43PM -0700, Hugh Dickins wrote:
> > To keep balance in future, __update_tlb() remember to pte_unmap() after
> > pte_offset_map().  This is an odd case, since the caller has already do=
ne
> > pte_offset_map_lock(), then mips forgets the address and recalculates i=
t;
> > but my two naive attempts to clean that up did more harm than good.
> >
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Hugh Dickins <hughd@google.com>
>
> FWIW: Tested-by: Yu Zhao <yuzhao@google.com>
>
> There is another problem, likely caused by khugepaged, happened multiple =
times. But I don't think it's related to your series, just FYI.
>
>   Got mcheck at ffffffff81134ef0
>   CPU: 3 PID: 36 Comm: khugepaged Not tainted 6.4.0-rc6-00049-g62d8779610=
bb-dirty #1

...

>   Kernel panic - not syncing: Caught Machine Check exception - caused by =
multiple matching entries in the TLB.

In case anyone plans to try to fix this - the problem goes back to at
least 5.15 stable. My (educated) guess is that nobody complained about
it because all the testing is done in QEMU, which does NOT detect
conflicting TLBs. This means the verification of the fix would need to
be on a real piece of h/w or an updated QEMU.

In target/mips/tcg/sysemu/tlb_helper.c:

static void r4k_fill_tlb(CPUMIPSState *env, int idx)
{
    r4k_tlb_t *tlb;
    uint64_t mask =3D env->CP0_PageMask >> (TARGET_PAGE_BITS + 1);

    /* XXX: detect conflicting TLBs and raise a MCHECK exception when neede=
d */
...
