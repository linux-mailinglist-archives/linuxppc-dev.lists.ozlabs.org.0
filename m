Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90907F3469
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 18:02:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PxriTdLA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sxr1AGai;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZVzR5qZ0z3clH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 04:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PxriTdLA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sxr1AGai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZVyX07vsz3cT7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 04:01:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700586078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
	b=PxriTdLAuJq62GjFjnvroFIK95wCDarDaGOvAtVu5MZCQ4BWcKpUMtjhkRBnn8m917m2sf
	gyP+gfVdnUNNnYILapQcNz7/iuQ8CXjQugj4QSWyzcYtXnBE9toOQ4JaIAWW1a9xeunC9d
	x49B6PelrfzkaENjJyBDfp4VaN54lkE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700586079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
	b=Sxr1AGaigMR4E84yXwgzciS2FkVr0LnbIvidpZc0UKV9YGowa2PNrxbPAUXkJNE/04oQ1V
	F3OakXZrxKHHyNzBtRlw9PU374AOUEOLesOpkaCtOF+24LP1G6jk4Btm6UlH7R6fIJzvs7
	z/SLvmNuuUPgXqc6jbmbipqjA3U6KOI=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-tMJ6tb5lN5aFmSWDMmnWDA-1; Tue, 21 Nov 2023 12:01:15 -0500
X-MC-Unique: tMJ6tb5lN5aFmSWDMmnWDA-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-587ac1e8eb1so6093212eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 09:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586069; x=1701190869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
        b=bmuqu9wIN2QZbvCHQJEW0iwG8nTjGnM5EoTnV0GvhYOuVhvrG/XARI9pp6j74SZ8vE
         vS2FHODA/nZ8SQ1aVhBCAbLdOF/jhpPPulNqbIMv+uAw82zW60ZiHWFz6rkXbccZ5NRm
         DIdSA1Dg9IeQa8dS84ApjwadmXD6zYcLFzNGhuJRtub9gMIyvr4vfiUHlD2/Iky6qtCw
         b1ez7kX9bKVbyci8NPZfWJuVv/Vrc1zy8qVM0EW8OhmO7rPv8DQvVx+1h3w5Yy6ijOCc
         aHqeuVX3L1htOzjsesT5zxsIWpaYgdtmEiIOKyS04lDFZd4trrtUmT7+ne5yS5pc8TpH
         MPBw==
X-Gm-Message-State: AOJu0YymSJ8jCokCzpz/MrVas0prrFBGpds7CO6p60DoZ9kDKBHM0Eh/
	zWNu5PvSe43kVAnlgHQI1I11zGrwpcMfUW7H5InzTwJlAIKmIaxUoyNJ97YY8xr5/gw6q+29koZ
	755e8Yj1DA3KUwzpHCsbdIsZHh4L8sIrNJLkblFSDCg==
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id p7-20020a0563587e4700b00169a9d43fafmr12581526rwm.11.1700586069082;
        Tue, 21 Nov 2023 09:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzwqwXTcQOMVq6+W/ToO1AFQnqdGCzNKV3DK3CezCKFyIOZTTVBddsfYxnVHAme/q2N84DW6rxhPtI5xPi31c=
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id
 p7-20020a0563587e4700b00169a9d43fafmr12581454rwm.11.1700586068588; Tue, 21
 Nov 2023 09:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com> <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
In-Reply-To: <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Nov 2023 18:00:56 +0100
Message-ID: <CABgObfZdk9Jn60QLJGweVZMN_yWsxo1d7W3Mu-NNTPZVO0uCnw@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Mark Brown <broonie@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Sean Christopherson <seanjc@google.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org
 >, Quentin Perret <qperret@google.com>, Anup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023 at 3:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 08, 2023 at 05:08:01PM -0800, Anish Moorthy wrote:
> > Applying [1] and [2] reveals that this also breaks non-x86 builds- the
> > MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
> > __x86_64__, while the usages introduced here aren't.
> >
> > Should
> >
> > On Sun, Nov 5, 2023 at 8:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > >
> > > +       test_invalid_memory_region_flags();
> >
> > be #ifdef'd, perhaps? I'm not quite sure what the intent is.
>
> This has been broken in -next for a week now, do we have any progress
> on a fix or should we just revert the patch?

Sorry, I was away last week. I have now posted a patch.

Paolo

