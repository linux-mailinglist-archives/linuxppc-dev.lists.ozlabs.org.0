Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C36048C6B91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 19:34:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JghmkUKo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfgMV1Vpfz3dLS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 03:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JghmkUKo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfgLp3WCfz3cVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 03:33:53 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34f52fc2191so3761365f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715794424; x=1716399224; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REXKNTAxo862A8ReBddrMUjz3K+lbyLjZMQEflUAct8=;
        b=JghmkUKoSEwZc5v4PITFnx8Ts807UESSd1Bc5PhMzR7w5DaYMFDP8dMIFM4V0whnJj
         gVPD+Vb1RXP4Wvq7aFeG5QngK1GhqBTPnALnXhNhnYc1qhTpuHLhyZwAyWHq5N/9iaQH
         XcbFbHjWzR6fkKyUEFgxWYC41j6hs/hvcO0SKp9rAyQsGNsuMTQxML80+O0bqBsrGFvT
         nvUhFD22479HocBngxqnKiyqSGUbvdFaGqQ6uk3kpeaO2NOdtgIFpPr1eflf3yX+UUnC
         GXyk0cGlKmtD9sCVtHs20KnyKAwVl5j3Qouzoi1f6ryS1YGXx5P7+cQ7pkG9icqSh7Vn
         i9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715794424; x=1716399224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REXKNTAxo862A8ReBddrMUjz3K+lbyLjZMQEflUAct8=;
        b=vxWMmQSOy54CxOPXbYQ6uCPAKA9JcfpdZ9b37AG8SkEkc10dZQ6NDMGle2pBqrLJQ7
         mN3faBmHj5XO283sksTzuQdZeCbzpucjia4a5WzcdtWTqD2ePuFjfRuINfHY+A+14NRV
         r48cm16v9omnDY+N57i6Pu7aWaPJeVE/5u9xeR20sMZds+wJQDCdEPPRwf32KWDXQksX
         hzrgc5yZy7HPtlp2LdjDTg7Kn5eSfmE5dUIS8Ts9MEE2toMA4n/QWtVId0NATF0d/RMb
         Yp/X4rMKRsIi3c6d7EkGrHzYdI0I1x8gqxcI6zZ7T2UVRzJOP3BcwrdO3R00N6Lzrnjn
         JKsg==
X-Forwarded-Encrypted: i=1; AJvYcCXwm8JZFqtIzmhssL6188+rvpkwi94k5Ohmgc9rbzwC7p6wPDiW+SMIDl+9g9MOMpgWi5EJTGHLOSodYi/xiSdq9G5/3bpZmA1Wo8m3Tg==
X-Gm-Message-State: AOJu0YzKF+DIf4/j5Iy9nYX0pYJpBujB+ewqtmDrxWgN6dXVocLwt929
	kxAK4xHI5I5InTQK5kzeLONzlnw9qBAWcOwI8jnQROzX/Az6a/YNAW1Lp/eaNM+tmXf9CfqDDBD
	BtBrTNNXLBfY8oZC6D4TVG1rlWySnbFdQzp6O
X-Google-Smtp-Source: AGHT+IECmpnR3hqErRAHKi5zZVxQqX+AzRVW0B5FrzgG6JtiQjlGQI3473zUOeMvDrH067XEBa75l4kB51sO6OrPOMs=
X-Received: by 2002:a5d:5351:0:b0:343:e02f:1a46 with SMTP id
 ffacd0b85a97d-3504a62fb12mr13056195f8f.2.1715794423681; Wed, 15 May 2024
 10:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
In-Reply-To: <ZkSUaVx3uCIPkpkJ@localhost.localdomain>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Wed, 15 May 2024 10:33:03 -0700
Message-ID: <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker poison errors
To: Oscar Salvador <osalvador@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 3:54=E2=80=AFAM Oscar Salvador <osalvador@suse.de> =
wrote:
>
> On Wed, May 15, 2024 at 12:41:42PM +0200, Borislav Petkov wrote:
> > On Fri, May 10, 2024 at 11:29:26AM -0700, Axel Rasmussen wrote:
> > > @@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_f=
ault *vmf)
> > >
> > >     /* Higher priority than uffd-wp when data corrupted */
> > >     if (marker & PTE_MARKER_POISONED)
> > > -           return VM_FAULT_HWPOISON;
> > > +           return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;
> >
> > If you know here that this poisoning should be silent, why do you have
> > to make it all complicated and propagate it into arch code, waste
> > a separate VM_FAULT flag just for that instead of simply returning here
> > a VM_FAULT_COMPLETED or some other innocuous value which would stop
> > processing the fault?
>
> AFAIK, He only wants it to be silent wrt. the arch fault handler not scre=
aming,
> but he still wants to be able to trigger force_sig_mceerr().

Right, the goal is to still have the process get a SIGBUS, but to
avoid the "MCE error" log message. The basic issue is, unprivileged
users can set these markers up, and thereby completely spam up the
log.

Also since this is a process-specific thing, and it's not a real
hardware poison event, it's unclear system admins care at all at a
global level (this is why we didn't want to switch to just
printk_ratelimited for example). Better to let the process handle the
SIGBUS however it likes for its use case (logging a message elsewhere,
etc.).

That said, one thing I'm not sure about is whether or not
VM_FAULT_SIGBUS is a viable alternative (returned for a new PTE marker
type specific to simulated poison). The goal of the simulated poison
feature is to "closely simulate" a real hardware poison event. If you
live migrate a VM from a host with real poisoned memory, to a new
host: you'd want to keep the same behavior if the guest accessed those
addresses again, so as not to confuse the guest about why it suddenly
became "un-poisoned". At a basic level I think VM_FAULT_SIGBUS gives
us what we want (send SIGBUS to the process, don't log about MCEs),
but I'm not confident I know all the differences vs. VM_FAULT_HWPOISON
on all the arches.

>
>
> --
> Oscar Salvador
> SUSE Labs
