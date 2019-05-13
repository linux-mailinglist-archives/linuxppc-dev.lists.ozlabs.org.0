Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E10511BF5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 00:07:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452w100BNrzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 08:07:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452vzc3GyvzDqGp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 08:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iEelTsof"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 452vzc0Y6yz8vrx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 08:06:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 452vzc0Kwzz9s3l; Tue, 14 May 2019 08:06:36 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=matthewgarrett@google.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iEelTsof"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 452vzb11g7z9s9N
 for <linuxppc-dev@ozlabs.org>; Tue, 14 May 2019 08:06:34 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id a190so1701336ite.4
 for <linuxppc-dev@ozlabs.org>; Mon, 13 May 2019 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIx3h0Mt9J+/lEWG7UoB4dTDXrEgdUjpPED38EFg7mE=;
 b=iEelTsof+PDlHfZHmpCsN1rfQAIAXGmSyIh/ZEbPdRedDgxTFdUqLg7anbmYK8zGgN
 mz8ec7r6euQ3VdSjSndqQ+ytzbNVB+gjBfW8lG6QX3FwNyK/tEc1Dk16ORUDOgNmv/0C
 4vLbedTDkGwHilbifp4a9lVkTsWEGkEMtJJd73f0KAXfI+Xet0TkUTeP433yvMpHTQi9
 O9J36p+2xqo2BqojOCPSot1JMnD43wgjzsgdNKLKub4yrbwbLpC7SeabpGWTsm4GIjR9
 hsCs+/3nZwxaS3FHvCsJLQ0bkls0A64xkM7XrdDtyDIyk3wEp1t49+RTCwdpUbVR8Ygc
 ZXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIx3h0Mt9J+/lEWG7UoB4dTDXrEgdUjpPED38EFg7mE=;
 b=RdKYvYynT3cvi70kzbq7/UZRTyMBbmyEfF0sDRtTvXjmVF94c5OWUIYq+mA2QoGjTQ
 L68LHL3Ykz7uXxwyYkioXCosCynssFjy3MF10vr3ltm3jHgegfGBjhCHbgqPunG5HtAI
 wjizhU2KWj+32JY1Q8X+MoMYy9eqxUfvrrRw4dj/CJ+WQtNb0sqUOoGPxmxbHBXZUDvC
 r8P5MVmDqxTxPpYzzsoiwYhKlbNaj/0fSpDWmpEHdD95AHPLwO0UfHQPhLFepyJavalD
 95xKEyIkiiG7YXPyQhDohv0YZpMqf6y67sZH6lbGKz+Z2BV8suAGYUoKwsKw3auYCMko
 DObg==
X-Gm-Message-State: APjAAAWYUdf+YIZdxM4zq9gml93VFH6RU6Kahsp8vvZsu/urfgVCiBpf
 aLcCVYMD3BvI+aSbvwGNs7onMktnkTMR/TKWWL86IQ==
X-Google-Smtp-Source: APXvYqyeWORWwpXBJ61AzFsQrkbSqVFYb7aklN+03gAJ1CLO/PtiZlpv881bgIm/MBUK2g/zQpMyW1Aj2ZZ6sboXIko=
X-Received: by 2002:a24:e046:: with SMTP id c67mr66255ith.16.1557785191476;
 Mon, 13 May 2019 15:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190402181505.25037-1-cclaudio@linux.ibm.com>
 <CACdnJuumhkqTb4+1=QBiLmbW4xd3wW=MZu6Tj_KdaoTMhCN+Tg@mail.gmail.com>
 <4ce5e057-0702-b0d5-7bb2-cea5b22e2efa@linux.ibm.com>
 <CACdnJusBm93zwDqTXTx_QYsg1-aGUAAHm_qq8Lcx3TvGTxdmbg@mail.gmail.com>
 <2208f156-d441-3082-2f4c-8030c84ef788@linux.ibm.com>
 <CACdnJuu8OqMrSs0esOmf=ro9n00aYEQ-nikAh6v6sk+YAQw4cQ@mail.gmail.com>
 <d79f47f8-9006-3a47-2bdc-58012cef5c7e@linux.ibm.com>
 <CACdnJuv_5A1_6CH1+Jn7SCrmW8Y6JuzsMmJoc1=_vn0nKdYMjQ@mail.gmail.com>
 <28bfc0a7-9ae5-2c99-e472-ea53f856bafc@linux.ibm.com>
 <CACdnJuvpUKiX5UgSOrzh+B9y68zKm+Bzu1c8KFJHd8diz=sm2Q@mail.gmail.com>
 <e845d9f5-00bb-e68d-9d24-da802dd05549@linux.ibm.com>
In-Reply-To: <e845d9f5-00bb-e68d-9d24-da802dd05549@linux.ibm.com>
From: Matthew Garrett <mjg59@google.com>
Date: Mon, 13 May 2019 15:06:20 -0700
Message-ID: <CACdnJutaDXsi5N-npinkzYfikFCGFDpZk52uVArf4JRxU9WFLw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enabling secure boot on PowerNV systems
To: Claudio Carvalho <cclaudio@linux.ibm.com>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Nayna Jain <nayna@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Peter Jones <pjones@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, linux-integrity <linux-integrity@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2019 at 2:31 PM Claudio Carvalho <cclaudio@linux.ibm.com> wrote:
> On 4/10/19 2:36 PM, Matthew Garrett wrote:
> > I don't see the benefit in attempting to maintain compatibility with
> > existing tooling unless you're going to be *completely* compatible
> > with existing tooling. That means supporting dbx and dbt.

(snip)

> In OS secure boot domain (work in progress):
> - The skiroot container is verified as part of firmware secure boot.
> - Skiroot uses UEFI-like secure variables (PK, KEK and db) to verify OS
> kernels. Only X.509 certificates will be supported for these secure variables.

You don't support hashes? If so, this isn't compatible with UEFI
Secure Boot and we shouldn't try to make it look like UEFI Secure
Boot.

> How about dbx and dbt?
>
> The db keys will be used to verify only OS kernels via kexecs initiated by
> petitboot. So we only need the dbx to revoke kernel images, either via
> certs or hashes. Currently, the kernel loads certs and hashes from the dbx
> to the system blacklist keyring. The revoked certs are checked during pkcs7
> signature verification and loading of keys. However, there doesn't appear
> to be any verification against blacklisted hashes. Should kernel images be
> revoked only by keys and not hashes? We tried to find published revoked
> kernel lists but couldn't find any. How is kernel image revocation handled
> in practice?

Hash-based revocation is in active use in the UEFI world - to the best
of my knowledge, all existing dbx entries are hashes with the
exception of the invalidation of the Microsoft Windows 2010 CA.

> Also, we didn't see the shim or kernel loading anything from dbt.

dbt is currently only used for validation at the firmware level - the
way grub and kernel signatures are currently managed means it doesn't
make a huge amount of sense to use it in shim, but it would probably
be reasonable to extend shim's validation to include dbt.

> > So I do the following:
> >
> > 1) Boot
> > 2) Extend the contents of db
> > 3) Extend the contents of db again
> > 4) Read back the contents of db through efivarfs
> > 5) Reboot
> > 6) Read back the contents of db through efivarfs
> >
> > Is what I see in (4) and (6) the same? Does it contain the values form
> > both extensions?
>
> In (2) and (3) the extensions are added to the update queue, which is
> processed only in (5) by firmware. So, in (4) you should see the db content
> without the extensions.

Ok, this is not what we expect from UEFI systems. I'm strongly against
providing what looks like the same ABI on multiple platforms but
carrying subtle differences between those platforms - it's guaranteed
to break tooling in unexpected ways.

> In (5), firmware (skiboot) will process the update queue. The extensions
> will be applied only if *all* of them are valid and pass signature
> verification. Only in this case should you be able to see the extensions in
> (6). If any of the extensions fail, firmware will discard all of them,
> clear the queue, and do the proper logging.

I believe that this is also a violation of expectations.

> > Why would the intermediate level organisations not just have entries
> > in db?
>
> Because that seems to add more complexity than having three levels (PK, KEK
> and db).
>
> Typically, the intermediate level organisations (or KEK) are used to
> authorize new additions to db. However, if we also have them in the db, who
> would authorize the new additions to db. If that would be the intermediate
> level organisation entries now in the db, it seems we would need to
> implement a mechanism to determine which entries are for authorizing new
> additions and which are for kernel signature verification. If that would be
> the PK, we'd be burdening the PK owner to sign every new db addition if the
> platform is owned by a company that has intermediate level organizations.

Ok, in this scenario I don't understand why you wouldn't just want the
intermediates in PK. Or, put another way - if you have a business
justification for three layers of hierarchy, what do you do when
someone has a business justification for four? The three layer
hierarchy represents the weirdness of the PC industry where you have
Microsoft needing to be in KEK (because they need to be able to issue
updates to machines from multiple vendors) but not wanting to be in PK
(because vendors don't want Microsoft to have ultimate control over
their systems). If it weren't for this conflict, we'd just have a two
layer hierarchy, and if some other aspect of the market had evolved
over time we'd have a four layer hierarchy.

>
> >  The main reason we don't do it this way in UEFI is because we
> > need to support dbx, and if you're not supporting dbx I'm not sure I
> > see the benefit.
>
> I'm not sure I understand your question.  We would be using dbx to prevent
> kernels from being loaded. How is that related to having three levels in
> the key hierarchy (PK, KEK and db)?

dbx entries come from Microsoft, so we need the KEK layer so Microsoft
can update dbx. If Microsoft didn't need to update dbx then we'd leave
Microsoft out of KEK, and then KEK and PK would be the same and we'd
be able to get rid of KEK.
