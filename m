Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADAF7DD884
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 23:41:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B4aqSqRM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKlVC19xGz3cRc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 09:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B4aqSqRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKlTL3PRtz2yF9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 09:40:21 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40859c464daso47922325e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698792013; x=1699396813; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJWbuo+9TPVToDVPf96jeRxWUliwPBKXtZxQViTwJnU=;
        b=B4aqSqRMUfA5gUlQLAdjPrhR315+K7y9Z/vDtJaGEdHp7G3w2nROVpQ1Yas0oGi4pp
         N2k+wln8UCRjHfS4SmO2P2Qy0qlDIUmZqy/zcenz4Qqia+3nSVoeqX+oxvg7oPZMLuy7
         J7u/PwEcPCvGcbWjWbeCVXoruO0enAcCHQjs1X0SojRxIwbxrlRuqroBNAb56chk9eGG
         L63PZs5+GPIA8+U4EJ1eQm6A6axxSW1G0+oAHrQffVDAzCRLkXo+/FmGa7nUIQfhUjnk
         Yyc/fRbPTqajGVqEnPc19Uspk1XecT1hRgrIPxMMGeLIa7dFo1p1pvHZPzlJqyJQu6qW
         cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698792013; x=1699396813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJWbuo+9TPVToDVPf96jeRxWUliwPBKXtZxQViTwJnU=;
        b=ecGzP/hqVcemj2VHmfBXik5MLDAoTX6PyTDa+Gqv67miBZJi/RjFIAJembA+JG0/oO
         fV6aWkOgk/Skt5OMSsB962BC+ZLzDnDsmktoJzYlDgDiVB+qendSl2NeRrJ3ODjGWLf2
         zTE1w8TDtxu3T2MUxH53BTV/GvHqauRRaSs1T/ocFhHIynHz+YS5okpJWG/XxSkxQGod
         9yMYd2WX0jqJQX0D/xTn5Rsg0KXsLmJmL5sX9OVCyu756beexARQPRBGGqGpMLQNIu2J
         K/7nnE/UR3RPHpx169cRmQNeZWrtncAL/zvBUqrtQgTnji7RNn20kQq8rlW1wuXOC46t
         HOBw==
X-Gm-Message-State: AOJu0YwwXnp/4YkmVq8UDj/ij4mh/IpNXsETtvzmeahk+hB+OOI11wfD
	x3hSJh4YBOXEunKDH19UWGVnifQhTd9O8AHguMbIWQ==
X-Google-Smtp-Source: AGHT+IHkDiPkYLUipg1BNgD620eOceDAkQD+A32NnZclx+AVnVsN45AUMqsjx/qUof6Oj5kTmFWO4hEnjV9b1jDP2pc=
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id
 g15-20020adfd1ef000000b0032f7db122fbmr8716023wrd.28.1698792012937; Tue, 31
 Oct 2023 15:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
In-Reply-To: <ZUFzZf-YmCRYP6qo@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 31 Oct 2023 15:39:42 -0700
Message-ID: <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023 at 2:36=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> On Tue, Oct 31, 2023, David Matlack wrote:
> > On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > > Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-=
based
> > > memory that is tied to a specific KVM virtual machine and whose prima=
ry
> > > purpose is to serve guest memory.
>
> > Maybe can you sketch out how you see this proposal being extensible to
> > using guest_memfd for shared mappings?
>
> For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.=
  What's
> missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM nee=
ds to
> ensure there are no outstanding references when converting back to privat=
e.
>
> For TDX/SNP, assuming we don't find a performant and robust way to do in-=
place
> conversions, a second fd+offset pair would be needed.

Is there a way to support non-in-place conversions within a single guest_me=
mfd?
