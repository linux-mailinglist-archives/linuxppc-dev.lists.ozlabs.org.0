Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70A18F1C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:28:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8F32w4LzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n2LY028g; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8B85lsHzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:25:36 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id w2so3055469oic.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BlNsxbp9HHMniuJM81RM7rBX4vj95s0I3+pOS8kzTBk=;
 b=n2LY028gZjF5dbavPSnf3Me7QSXBMKqc4sTXZDbx803WWKw0MOEAbYaH32F+89W13F
 Q965B8NWVzfEQEQMT/3fTQpa7FKd/K0UvSnEG2eXEE3u4ejcp+Al0cEQA8TJuKMLYM+o
 RD0sq8+em5KmxfKKf56invEOJil0C4wGy2Oc2qTEnPKouXjnNaqFYsuILlmBiPGMIlGT
 EdvYFXm4TjDdIKUFUq+QLghwuVdk0TyE5CbhWaQ8SA5KTSNOTl8FFRThti2OgFiOl+uY
 zQy96CdA11VmgoE0aSqdC88YEG8vJcbAY8oXrocMhdaunvO5m8O+Y/PEovfNtwDddduE
 jfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BlNsxbp9HHMniuJM81RM7rBX4vj95s0I3+pOS8kzTBk=;
 b=fZbbfPwGvPicxWqMX4wEbVIRibGTw97eBCahmY0qHsJFD4f75Y3IrNpTRHcFSxe/Eg
 5ArXAHcAJObZMlFR+XvjRg52irKeWuqrV2tHby+UmfYKDBqWzXPCRIwhZcw2VdNdQrUK
 xQdZI1GhDcajKX/QoNzM0CGGtYLbtJYatNxAGZCBYScgO5i8Kp8F0ukeMXfK9ZKYzwRo
 Nm3y39WywSIVYFoNKBHjbsim0j2iPnswOazlk6X6JOFloWOFLlDcGaIGUBHkhKOrrKf3
 19dhpx9kkjSWsJIJ49DTbb7TpyTu2RhTjkiOuYyER0C9GrrPnsSRCwK7qWwnsYvixQFA
 Ff+w==
X-Gm-Message-State: ANhLgQ3kR7/IgNQd5w2AgG9IzYAtgooGPBF3EpcoLf7jCXJ8tUTNF3GE
 0uxuYcjR4mfJ2VY4RWQfQJTFp5WZbM23DxrMoLw=
X-Google-Smtp-Source: ADFU+vsIvWNumvQUeHmbSZ/VsmgUyBeKKV0g91hnVve+x0uvXZbfZYWYJ4ygRYpDlFcZRvkR7rfHGeVUgtvL8Hkila8=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr16953711oig.40.1584955534069; 
 Mon, 23 Mar 2020 02:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <1584944279.gvl0lg5dde.astroid@bobo.none>
In-Reply-To: <1584944279.gvl0lg5dde.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:25:22 +1100
Message-ID: <CACzsE9r5uvL-zp34VrCqO_RTEsXPbLrt2iu+MHL-apapydOugA@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Initial Prefixed Instruction support
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:22 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:17 pm:
> > A future revision of the ISA will introduce prefixed instructions. A
> > prefixed instruction is composed of a 4-byte prefix followed by a
> > 4-byte suffix.
> >
> > All prefixes have the major opcode 1. A prefix will never be a valid
> > word instruction. A suffix may be an existing word instruction or a
> > new instruction.
> >
> > This series enables prefixed instructions and extends the instruction
> > emulation to support them. Then the places where prefixed instructions
> > might need to be emulated are updated.
> >
> > The series is based on top of:
> > https://patchwork.ozlabs.org/patch/1232619/ as this will effect
> > kprobes.
> >
> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel Axtens.
> > The major changes:
> >     - Move xmon breakpoints from data section to text section
> >     - Introduce a data type for instructions on powerpc
>
> Thanks for doing this, looks like a lot of work, I hope it works out :)
>
Yes it did end up touching a lot of places. I started thinking that
that maybe it would be simpler to just use a u64 instead of the struct
for  instructions.
If we always keep the word instruction / prefix in the lower bytes,
all of the current masking should still work and we can use operators
again instead of ppc_inst_equal(), etc.
It also makes printing easier. We could just #define INST_FMT %llx or
#define INST_FMT %x on powerpc32 and use that for printing out
instructions.
> Thanks,
> Nick
