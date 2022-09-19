Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CD5BD3A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 19:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWWnY0gMjz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:26:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=osandov-com.20210112.gappssmtp.com header.i=@osandov-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OrFOjWmh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=osandov@osandov.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20210112.gappssmtp.com header.i=@osandov-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OrFOjWmh;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWWmv48Dcz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 03:26:22 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id b21so28520264plz.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=RQOtnF4gIAT5J5bZ40nIVekW+hFItpXA03njWhxPCkg=;
        b=OrFOjWmhbVU41C8KsRwP51cPaIp+R1Bpyjc/zwH1VMf0UdtuxBa9L6X5QY1Y1oqaC/
         ts8luvNT4hW6BrfXMpLbb3Neq13r7EaHa7gKJOKCYr/ERpiJGyP86mrn8z7x7lDqA/+9
         qHPzsTjHeBcCZ/aA9O4hovubehLTQq50GOuk47+lc1tDYOPYFatocrXQMs1ofSjETbkE
         xlSlarh4uMLAw9qmZ2TSh6IgOT3IfXtmxhHAyzyMEGbgvR4utb+Pw0toTzGeqtUrVFOE
         u4v0KdmwacMfImM4dbklbUkohrPHCIec25W/W+poubt+LMDWvYIq8OigFROgOgZw0uNZ
         T5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RQOtnF4gIAT5J5bZ40nIVekW+hFItpXA03njWhxPCkg=;
        b=eoBKge02DGwgMsuPea6AoG9BNNDmjtQgcUcrY5A9hhUhzPXncJp9BIjQxdELx+xRtz
         fX6V/RkTipvnqHtnb9fTSWF2Gz/3VhZ7vPwytR2RjTN3ju9umZgts/urgFxFdNom1v1B
         x0CVNpuXXomWuyQ6DskPiF2KRv/zP9TBZlu98yqZnKXd+XyK566L4FI0fq0swsSUFyvT
         HZLc5gJc3lym7MGWIRZkZTSs2RnvDf9BoR6HZg1zvNmQSXxKlw+ohHNdDKrGgR+dST/0
         H0JgL39oMsWrGHMojhv3DChXCaM4Qv4u4bR/Fc5AcFN3ZS2vBCDANuurlK5D41D4DMJ5
         aPRw==
X-Gm-Message-State: ACrzQf2ubeevaeJz3nBjy1rsUWYbPUcnJ4EfqGuNAN/3+nSxIypHbj/2
	EPdpckwpO24wnh8lzTJoUdCh4w==
X-Google-Smtp-Source: AMsMyM6G+tbSHGJR45aDE750Rf2Jljx5e/kiJXpECOAdkTJX3k7Dykh59BTcyBs+oHM4tJDcNKvE7A==
X-Received: by 2002:a17:90b:3e87:b0:203:b9c:f9b7 with SMTP id rj7-20020a17090b3e8700b002030b9cf9b7mr20713044pjb.93.1663608378677;
        Mon, 19 Sep 2022 10:26:18 -0700 (PDT)
Received: from relinquished.localdomain ([2601:602:a300:cc0::1ac9])
        by smtp.gmail.com with ESMTPSA id c128-20020a624e86000000b0054094544ae7sm20668966pfb.60.2022.09.19.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:26:18 -0700 (PDT)
Date: Mon, 19 Sep 2022 10:26:17 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] Discard .note.gnu.property sections in generic NOTES
Message-ID: <YyimOW229By98Dn7@relinquished.localdomain>
References: <20200428132105.170886-1-hjl.tools@gmail.com>
 <20200428132105.170886-2-hjl.tools@gmail.com>
 <YyTRM3/9Mm+b+M8N@relinquished.localdomain>
 <e15de60c-8133-3d93-eb1c-c6b1b5389887@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e15de60c-8133-3d93-eb1c-c6b1b5389887@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 17, 2022 at 06:31:20AM +0000, Christophe Leroy wrote:
> 
> 
> Le 16/09/2022 à 21:40, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Tue, Apr 28, 2020 at 06:21:05AM -0700, H.J. Lu wrote:
> >> With the command-line option, -mx86-used-note=yes, the x86 assembler
> >> in binutils 2.32 and above generates a program property note in a note
> >> section, .note.gnu.property, to encode used x86 ISAs and features.  But
> >> kernel linker script only contains a single NOTE segment:
> >>
> >> PHDRS {
> >>   text PT_LOAD FLAGS(5);
> >>   data PT_LOAD FLAGS(6);
> >>   percpu PT_LOAD FLAGS(6);
> >>   init PT_LOAD FLAGS(7);
> >>   note PT_NOTE FLAGS(0);
> >> }
> >> SECTIONS
> >> {
> >> ...
> >>   .notes : AT(ADDR(.notes) - 0xffffffff80000000) { __start_notes = .; KEEP(*(.not
> >> e.*)) __stop_notes = .; } :text :note
> >> ...
> >> }
> >>
> >> The NOTE segment generated by kernel linker script is aligned to 4 bytes.
> >> But .note.gnu.property section must be aligned to 8 bytes on x86-64 and
> >> we get
> >>
> >> [hjl@gnu-skx-1 linux]$ readelf -n vmlinux
> >>
> >> Displaying notes found in: .notes
> >>    Owner                Data size Description
> >>    Xen                  0x00000006 Unknown note type: (0x00000006)
> >>     description data: 6c 69 6e 75 78 00
> >>    Xen                  0x00000004 Unknown note type: (0x00000007)
> >>     description data: 32 2e 36 00
> >>    xen-3.0              0x00000005 Unknown note type: (0x006e6558)
> >>     description data: 08 00 00 00 03
> >> readelf: Warning: note with invalid namesz and/or descsz found at offset 0x50
> >> readelf: Warning:  type: 0xffffffff, namesize: 0x006e6558, descsize:
> >> 0x80000000, alignment: 8
> >> [hjl@gnu-skx-1 linux]$
> >>
> >> Since note.gnu.property section in kernel image is never used, this patch
> >> discards .note.gnu.property sections in kernel linker script by adding
> >>
> >> /DISCARD/ : {
> >>    *(.note.gnu.property)
> >> }
> >>
> >> before kernel NOTE segment in generic NOTES.
> >>
> >> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> >> Reviewed-by: Kees Cook <keescook@chromium.org>
> >> ---
> >>   include/asm-generic/vmlinux.lds.h | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> >> index 71e387a5fe90..95cd678428f4 100644
> >> --- a/include/asm-generic/vmlinux.lds.h
> >> +++ b/include/asm-generic/vmlinux.lds.h
> >> @@ -833,7 +833,14 @@
> >>   #define TRACEDATA
> >>   #endif
> >>
> >> +/*
> >> + * Discard .note.gnu.property sections which are unused and have
> >> + * different alignment requirement from kernel note sections.
> >> + */
> >>   #define NOTES                                                                \
> >> +     /DISCARD/ : {                                                   \
> >> +             *(.note.gnu.property)                                   \
> >> +     }                                                               \
> >>        .notes : AT(ADDR(.notes) - LOAD_OFFSET) {                       \
> >>                __start_notes = .;                                      \
> >>                KEEP(*(.note.*))                                        \
> >> --
> >> 2.25.4
> >>
> > 
> > Hi, H.J.,
> > 
> > I recently ran into this same .notes corruption when building kernels on
> > Arch Linux.
> > 
> > What ended up happening to this patch? It doesn't appear to have been
> > merged, and I couldn't find any further discussion about it. I'm happy
> > to resend it for you if you need a hand.
> 
> As far as I can see, ARM64 is doing something with that section, see 
> arch/arm64/include/asm/assembler.h
> 
> Instead of discarding that section, would it be enough to force 
> alignment of .notes to 8 bytes ?
> 
> Thanks
> Christophe

Unfortunately, "alignment requirement" here isn't just the starting
alignment of the .notes section; it also refers to internal padding in
the note metadata to keep things aligned. Changing this would break
anyone who parses /sys/kernel/notes (e.g., perf).

Here is a little more context around this mess:

The System V gABI [1] says that the note header and descriptor should be
aligned to 4 bytes for 32-bit files and 8 bytes for 64-bit files.
However, Linux never followed this, and 4-byte alignment is used for
both 32-bit and 64-bit files; see elf(5) [2].

The only exception as of 2022 is
.note.gnu.property/NT_GNU_PROPERTY_TYPE_0, which is defined to follow
the gABI alignment. There was a long thread discussing this back in 2018
with the subject "PT_NOTE alignment, NT_GNU_PROPERTY_TYPE_0, glibc and
gold" [3].

According to the gABI Linux Extensions [4], consumers are now supposed
to use the p_align of the PT_NOTE segment instead of assuming an
alignment.

There are a few issues with this for the kernel:

* The vmlinux linker script squishes together all of the notes sections
  with different alignments without adjusting their internal padding,
  but sets p_align to the maximum required alignment. This is what
  confuses readelf and co: they expect 8-byte alignment, but most of the
  note entries are only padded for 4-byte alignment.
* The vmlinux .notes section is exported as /sys/kernel/notes. This is
  stable ABI and has always had 4-byte alignment; all existing parsers
  assume this.
* /sys/kernel/notes doesn't currently have a way to specify an alternate
  alignment anyways.

My suggestion would be to keep .note.gnu.property in its own section in
vmlinux, or create a new .notes8 section with 8-byte alignment, and
leave .notes and /sys/kernel/notes alone.

I'm not sure what exactly arch/arm64/include/asm/assembler.h is doing
with this file. Perhaps the author, Mark Brown, can clarify?

1: http://www.sco.com/developers/gabi/latest/ch5.pheader.html#note_section
2: https://man7.org/linux/man-pages/man5/elf.5.html#:~:text=Notes%20(Nhdr)
3: https://public-inbox.org/libc-alpha/13a92cb0-a993-f684-9a96-e02e4afb1bef@redhat.com/
4: https://gitlab.com/x86-psABIs/Linux-ABI
