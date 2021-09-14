Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84540A280
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 03:30:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7m4m2cwMz2ynY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 11:30:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fiY6IKkn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=fiY6IKkn; 
 dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7m422TNFz2y8S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 11:29:52 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id j12so20611971ljg.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 18:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bwi8JzS7IUd8bGkWIzVwnKvogSVEcsXYPsg+JItZ8oM=;
 b=fiY6IKkngrztRhJGLgdJI9edL8TxraujPTd/SV9hEAguGAT699jCnoG9v8OqqH6g18
 Q/qWrqcQakgXqGliTOaGo0x4Pbjavw5l8FSGzMGvdRux3P6zyr3TBrlLAYFaZ0KiKcI8
 Ui5X/EZ1nitBe2QYSn5SdXndTGE/D8aiGMAJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bwi8JzS7IUd8bGkWIzVwnKvogSVEcsXYPsg+JItZ8oM=;
 b=O7FlwakgfqFRvPNULSMoD0Gy5AFSg8GCteQxM5siQiCmMNu4VPy9atn9lCfbltrXpn
 ulvuYzPJowjvlo1nIR1y+jklGAUkJd2ATU+ljPL4giUSD9nbXV3dA/5Q9q+9fobCDZfd
 A/ygnNs6oIioFztDw7ztuiaaE+jXmY0QCE0op6lSQcqxIg5hTNvxdkKWJAqZLqOTtOnd
 DDCTovqsOCZnP3vytQK1gKvlzItM2kT/Oh7SjNUqdwizDSLjYHcuwVF132rLunnwX203
 2cGg+px9vwkW0JkToAf4TRFCZQp2V2m4hXmLtFXjvvJ/TS3ynAwLLjGn5PdPxulNSwIO
 zgpw==
X-Gm-Message-State: AOAM531fdsjUhRiA322Wt8RC01mQ8zdmA2ueBJwluL48SuPmi4aXX402
 sXgEJx04Uc5qo6zYsAlTOqtaB9Z9Irf3m+tV6MU=
X-Google-Smtp-Source: ABdhPJyjGdTH2JAIQCAVae5kVjYTZ2eCqPCSuXKFaFBVDYr1Z/ca2ZLrEvFNIcs1QtteCnW3+ouI+g==
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr13296455ljg.67.1631582983852; 
 Mon, 13 Sep 2021 18:29:43 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id j12sm1152748ljc.121.2021.09.13.18.29.42
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 18:29:43 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id s12so20709251ljg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 18:29:42 -0700 (PDT)
X-Received: by 2002:a05:651c:158e:: with SMTP id
 h14mr9527198ljq.56.1631582982632; 
 Mon, 13 Sep 2021 18:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
In-Reply-To: <20210914105359.5c651d55@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 18:29:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
Message-ID: <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: multipart/mixed; boundary="0000000000001a287705cbea846b"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000001a287705cbea846b
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 5:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > I have no idea why it then complains about removal of the GCC4 macros.
>
> Me neither :-(

Ooh.

So I'm looking at gcc sources, just to see if "maybe this thing is
somehow conditional".

And bingo.

In cpp_init_special_builtins(), gcc does

      if (b->value == BT_HAS_ATTRIBUTE
          && (CPP_OPTION (pfile, lang) == CLK_ASM
              || pfile->cb.has_attribute == NULL))
        continue;

which basically says that if we're pre-processing an ASM file, the
magical pre-processor symbol for __has_attribute is not defined.

I'm not sure what that 'pfile->cb.has_attribute == NULL' thing means,
but the libcpp/ChangeLog file also mentions this:

        (cpp_init_special_builtins): Don't initialize __has_attribute
        or __has_cpp_attribute if CLK_ASM or pfile->cb.has_attribute is NULL.

So this is a very very special magical thing: if building an *.S file,
__has_attribute magically goes away.

And sure enough, that's exactly what is going on. It's during that
build of arch/powerpc/boot/crt0.S, and the reason this hits on powerpc
is that in arch/powerpc/boot/Makefile we have

         -include $(srctree)/include/linux/compiler_attributes.h

as part of BOOTCFLAGS, and then it does

        BOOTAFLAGS      := -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc

to also include that header file when building ASM files.

And our old GCC4 code silently hid this all, and made it work, because
for a *.S file  you'd then (completely illogically) get those fake
gcc-4 attribute macros.

Now, do I know *why* that ppc Makefile it does that? No. Neither do I
know why the gcc people decided to just make ASM preprocessor so
special.

But at least I understand how the odd error happens.

This was too damn subtle. When you have to go read the compiler
sources to figure things like this out, you know you are too deep.

The fix should be pretty simple: remove almost all of BOOTCFLAGS from
BOOTAFLAGS.

But sadly, "almost all" isn't "all". There's the include path stuff,
there's the ABI and endianness, and there's the bit size ones.

So I think the fix is either

 (a) remove that

         -include $(srctree)/include/linux/compiler_attributes.h

     thing entirely, and add it as required to the C files.

OR

 (b) something like this ENTIRELY UNTESTED ATTACHED patch

I will leave it to the powerpc people to make the right choice.

               Linus

--0000000000001a287705cbea846b
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ktjeb6jv0>
X-Attachment-Id: f_ktjeb6jv0

IGFyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlIHwgMjYgKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9ib290
L01ha2VmaWxlCmluZGV4IDY5MDBkMGFjMjQyMS4uOWJjZjYyZDY1NTA5IDEwMDY0NAotLS0gYS9h
cmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQorKysgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmls
ZQpAQCAtMzIsMjggKzMyLDMwIEBAIGVsc2UKICAgICBCT09UQVIgOj0gJChBUikKIGVuZGlmCiAK
LUJPT1RDRkxBR1MgICAgOj0gLVdhbGwgLVd1bmRlZiAtV3N0cmljdC1wcm90b3R5cGVzIC1Xbm8t
dHJpZ3JhcGhzIFwKLQkJIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1PMiAtbXNvZnQtZmxvYXQgLW1u
by1hbHRpdmVjIC1tbm8tdnN4IFwKLQkJIC1waXBlIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mbm8t
YnVpbHRpbiAtZlBJQyAtbm9zdGRpbmMgXAotCQkgLWluY2x1ZGUgJChzcmN0cmVlKS9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX2F0dHJpYnV0ZXMuaCBcCi0JCSAkKExJTlVYSU5DTFVERSkKK0JPT1RD
T1JFRkxBR1MgOj0gJChMSU5VWElOQ0xVREUpCiAKIGlmZGVmIENPTkZJR19QUEM2NF9CT09UX1dS
QVBQRVIKLUJPT1RDRkxBR1MJKz0gLW02NAorQk9PVENPUkVGTEFHUwkrPSAtbTY0CiBlbHNlCi1C
T09UQ0ZMQUdTCSs9IC1tMzIKK0JPT1RDT1JFRkxBR1MJKz0gLW0zMgogZW5kaWYKIAotQk9PVENG
TEFHUwkrPSAtaXN5c3RlbSAkKHNoZWxsICQoQk9PVENDKSAtcHJpbnQtZmlsZS1uYW1lPWluY2x1
ZGUpCitCT09UQ09SRUZMQUdTCSs9IC1pc3lzdGVtICQoc2hlbGwgJChCT09UQ0MpIC1wcmludC1m
aWxlLW5hbWU9aW5jbHVkZSkKIAogaWZkZWYgQ09ORklHX0NQVV9CSUdfRU5ESUFOCi1CT09UQ0ZM
QUdTCSs9IC1tYmlnLWVuZGlhbgorQk9PVENPUkVGTEFHUwkrPSAtbWJpZy1lbmRpYW4KIGVsc2UK
LUJPT1RDRkxBR1MJKz0gLW1saXR0bGUtZW5kaWFuCi1CT09UQ0ZMQUdTCSs9ICQoY2FsbCBjYy1v
cHRpb24sLW1hYmk9ZWxmdjIpCitCT09UQ09SRUZMQUdTCSs9IC1tbGl0dGxlLWVuZGlhbgorQk9P
VENPUkVGTEFHUwkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1tYWJpPWVsZnYyKQogZW5kaWYKIAotQk9P
VEFGTEFHUwk6PSAtRF9fQVNTRU1CTFlfXyAkKEJPT1RDRkxBR1MpIC1ub3N0ZGluYworQk9PVENG
TEFHUyAgICA6PSAtV2FsbCAtV3VuZGVmIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVduby10cmlncmFw
aHMgXAorCQkgLWZuby1zdHJpY3QtYWxpYXNpbmcgLU8yIC1tc29mdC1mbG9hdCAtbW5vLWFsdGl2
ZWMgLW1uby12c3ggXAorCQkgLXBpcGUgLWZvbWl0LWZyYW1lLXBvaW50ZXIgLWZuby1idWlsdGlu
IC1mUElDIC1ub3N0ZGluYyBcCisJCSAtaW5jbHVkZSAkKHNyY3RyZWUpL2luY2x1ZGUvbGludXgv
Y29tcGlsZXJfYXR0cmlidXRlcy5oIFwKKwkJICQoQk9PVENPUkVGTEFHUykKKworQk9PVEFGTEFH
Uwk6PSAtRF9fQVNTRU1CTFlfXyAkKEJPT1RDT1JFRkxBR1MpIC1ub3N0ZGluYwogCiBCT09UQVJG
TEFHUwk6PSAtY3JECiAK
--0000000000001a287705cbea846b--
