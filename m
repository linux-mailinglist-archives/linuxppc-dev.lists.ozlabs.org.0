Return-Path: <linuxppc-dev+bounces-14522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D52C8E125
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 12:39:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHDwx0Z3mz2yvW;
	Thu, 27 Nov 2025 22:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764243568;
	cv=none; b=GOrVhjM84OMInX/s0kM0r0Aup/jwCA8G6+6m+uYAw4NkyLzBHpMMlBuHwHaNonzDcvGDnQSrLj+mKNeivjdU8EQtJsFAw83tYsIU0Q2GILebQBAehzFe5EXBfujazvjMOqp3gb7mmJ1Zmb1IDF+XAXsrGUXKW/7CIM1Yk46vtmMueIrOONDvp33NYwoWfqyxK3OqT71toFbvcdoAhv7Dkn93+cut4TDEgiSL5WlZixY+3NoYE4JPhkR+WV9S7hcrwOvqWkxsDja1sNRXLAMzjImDEStY7u84qePEvBLh6EquvwOSQQ600uPJx387pZxm1Regf16as5mU0HciJ1ECHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764243568; c=relaxed/relaxed;
	bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1AQq1ga8RW7OBTSygIWUWLXHXEXFxm44Yu2uj6wPnSGLRE26kBDm1ItYWmCQJZAfuIXzJYz9hD3ZTvVumn6rY4QDNbJF/2hAcRuCy5qHfh5sq1/XvStJqSd5aV117888rx4aXxmg2Gg9xCOkSGuy6V47k7Vi3gmeEtbhaMtKkh98pl2BjFBYKZlXlomBdAR0smbx/uHPslZsDXz000EvbMUi1UDkxYnuh4dGl61YqTKWlShXfaPdUeTwQZ+MsfJAMMjSNu4DMckm5zJPKQ6a3vL6maJZq758q+qNX5QUn9OCztmimXp6hbQbADYIKeC6Y17t2xb/gOD2VEK6d9ABg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jNp2hhqN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jNp2hhqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHDwv3pPkz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 22:39:26 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso66202785a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764243562; x=1764848362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=jNp2hhqNSZzRndBpJI6/ojf8Or9n/JCviETZu7/e8azKDEkvH4uz+BNJg8l59N7bCx
         BxMvh35v1tvpus0kXRqI4XJjCrqvwutKadBylI1NWrPEMvH9KMJSjxTqUuJJ1uaJKnVa
         fkw+Xd/ajdBZ6aEYPX9eU1IcOsnv1QxNVa7LUNbeAo/Mo9cH/eP+Yg8ql5klAL+HOy/3
         oiQXErqeESYyVnndfCFAObZPGLtYihCuaZn/i4hhQ+KJ97JS4DBU/sPyzOfus1KI4Dye
         PxQGhiO6KG0ZIgMleRQINIZrP/+m4A+VfoHFeb/9cL/IthFFqvHNnJoYaJ9S8NHUEl5U
         ltNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243562; x=1764848362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTgQXrnGbp8yRV1ffH5aOGb73MnxpAvx9lMPfkiZ/pE=;
        b=YLCZiRzxqvR6yhocoXkQgTvEsArvMiIBi3Ljc3OxBIEuWCor0Z4887igkToTNKG6a+
         ImJHreRn2MGxPqiDHka49tAIyslfTtBfwBDXGkbuHcI7tZiDMpr+5fLcTrFDb3BEy4k6
         TindGUyepMoEKiXgKUc4b7LryZM3YyJt/9pPpCoh9b5hDEG5GKoPA/F5mdHbFNlgtFx4
         0RCIhFJlNXDpTg536VIc+y3GYJ1s27xyn1fMP4tfI5g6zMsGO01m7tTXkrZur+qwBHA0
         JYNwj6oxuM8OXGuXr36azvEs8NSwAvnad2ogqZLEsjA/IxtcoEF9In8tyxm7XAtd9/0H
         ZIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVTNOSF+2dyORXmHBd6DX2nmRnPYhrLTHPG3xA3eB/JXoF5cOb+OO+bMz266s8SxZDppI/C93ngduf2CSc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSVr6MTYGRUgG0tK1vl9hUALZGzwo7HIqbsXnFjigWHP75ftJ7
	xgZ4cRUeK8ySrYwhJKEiEzN8ismxTVbUvQLGo08mxBfBfQl6qZInYK4PBqxVR9WE4sy56LBBFGr
	YfOl+S82rtIfBtYEbgqgcAWOFOg5Lt3c=
X-Gm-Gg: ASbGncvDAcWvKKVx6W0V0keeBHKehAk+QGAhx3hjkYG70Ptm1p3rnb1mKs0FlH6X2ID
	xToxolD2w4jCfMoRHhrmDQcPPc90fXwm7mdSKfVuOwYtjeCOCw7kF6lNdTzCjSN15xVPD+Leh5O
	JmqOSGAzbfF+sftLUozKKVC9PLuQUbqem0/Y9PYN4xnd7isJqOtDG0G/n/1cpIOfDfMMJy2y7ub
	VxJJSCi0VPHbnttL8F+zsQOr9bvZGmEzYfMdD4IVqoey0zw65r7uooSx9chTvRI3pB+VQ==
X-Google-Smtp-Source: AGHT+IF8AX3QuwU8PWoyMHubrE0YEf7OwwbSbZImelOgI0KoQ85t34HoENkNaCeescbBRgk60ctOqyrcZAkFR1pI8MI=
X-Received: by 2002:a05:620a:4094:b0:8b2:3484:8e22 with SMTP id
 af79cd13be357-8b32a8d7accmr3051143885a.0.1764243562227; Thu, 27 Nov 2025
 03:39:22 -0800 (PST)
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
References: <20251127011438.6918-1-21cnbao@gmail.com> <20251127011438.6918-2-21cnbao@gmail.com>
 <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
In-Reply-To: <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 19:39:11 +0800
X-Gm-Features: AWmQ_bmMHpk-p6E2I_jCY1Xqg4XmWm0x9ikXHEjIDdMSrcjAo4PIsH4k_44adgY
Message-ID: <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 6:52=E2=80=AFPM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Thu, Nov 27, 2025 at 09:14:37AM +0800, Barry Song wrote:
> > From: Oven Liyang <liyangouwen1@oppo.com>
> >
> > If the current page fault is using the per-VMA lock, and we only releas=
ed
> > the lock to wait for I/O completion (e.g., using folio_lock()), then wh=
en
> > the fault is retried after the I/O completes, it should still qualify f=
or
> > the per-VMA-lock path.
> >
> <snip>
> > Signed-off-by: Oven Liyang <liyangouwen1@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  arch/arm/mm/fault.c       | 5 +++++
> >  arch/arm64/mm/fault.c     | 5 +++++
> >  arch/loongarch/mm/fault.c | 4 ++++
> >  arch/powerpc/mm/fault.c   | 5 ++++-
> >  arch/riscv/mm/fault.c     | 4 ++++
> >  arch/s390/mm/fault.c      | 4 ++++
> >  arch/x86/mm/fault.c       | 4 ++++
>
> If only we could unify all these paths :(

Right, it=E2=80=99s a pain, but we do have bots for that?
And it=E2=80=99s basically just copy-and-paste across different architectur=
es.

>
> >  include/linux/mm_types.h  | 9 +++++----
> >  mm/filemap.c              | 5 ++++-
> >  9 files changed, 39 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index b71625378ce3..12b2d65ef1b9 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -1670,10 +1670,11 @@ enum vm_fault_reason {
> >       VM_FAULT_NOPAGE         =3D (__force vm_fault_t)0x000100,
> >       VM_FAULT_LOCKED         =3D (__force vm_fault_t)0x000200,
> >       VM_FAULT_RETRY          =3D (__force vm_fault_t)0x000400,
> > -     VM_FAULT_FALLBACK       =3D (__force vm_fault_t)0x000800,
> > -     VM_FAULT_DONE_COW       =3D (__force vm_fault_t)0x001000,
> > -     VM_FAULT_NEEDDSYNC      =3D (__force vm_fault_t)0x002000,
> > -     VM_FAULT_COMPLETED      =3D (__force vm_fault_t)0x004000,
> > +     VM_FAULT_RETRY_VMA      =3D (__force vm_fault_t)0x000800,
>
> So, what I am wondering here is why we need one more fault flag versus
> just blindly doing this on a plain-old RETRY. Is there any particular
> reason why? I can't think of one.

Because in some cases we retry simply due to needing to take mmap_lock.
For example:

/**
 * __vmf_anon_prepare - Prepare to handle an anonymous fault.
 * @vmf: The vm_fault descriptor passed from the fault handler.
 *
 * When preparing to insert an anonymous page into a VMA from a
 * fault handler, call this function rather than anon_vma_prepare().
 * If this vma does not already have an associated anon_vma and we are
 * only protected by the per-VMA lock, the caller must retry with the
 * mmap_lock held.  __anon_vma_prepare() will look at adjacent VMAs to
 * determine if this VMA can share its anon_vma, and that's not safe to
 * do with only the per-VMA lock held for this VMA.
 *
 * Return: 0 if fault handling can proceed.  Any other value should be
 * returned to the caller.
 */
vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
{
...
}

Thus, we have to check each branch one by one, but I/O wait is the most
frequent path, so we handle it first.

>
> I would also like to see performance numbers.

Yes. From what I understand, this patchset should improve performance in a
fairly straightforward way.
But yes, I can certainly include some data in v2.

>
> The rest of the patch looks OK to me.

Thanks
Barry

