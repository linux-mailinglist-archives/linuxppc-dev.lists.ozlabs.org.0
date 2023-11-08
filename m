Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 576127E604A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 23:02:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TNZyI7bC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQfFN1m7Lz3wVf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 09:02:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TNZyI7bC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=amoorthy@google.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQWYq4JJ6z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 04:00:46 +1100 (AEDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-58686e94ad7so3845206eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Nov 2023 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699462842; x=1700067642; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=TNZyI7bCONx47On3/lHyaZhkBHddgWTYFiHcrbIHOemNvvGaeDo2m4A5W3Mm4dyS0S
         igGyGcmn6Rkz4EhUsClzQ0qaBbCAD9p2iHkEzbQG7NLSBQbyVZqA5avssnMUtw3l+u5h
         wKK3ito3iyZxPVNdjagZUu2bkvkCVMLlQsNNg91mbAYxt9ChP9N7nhM1Jcve0mcWQGDM
         uVAfbHm7p4qbFN/bPiFXjoFFXgNv+VKX9wyrJ7c5Sp27VSzKPAwdjbOvQQKKAwUyWUVe
         voEbtYvYtzDD8oZrkwCmBx7QoSaVMH0aEvGvbUvCGr4pOptTRkw6nH4rtCpybAajf0JD
         ht/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462842; x=1700067642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LRS4MOzwpv79nEdyxX9W+Fzi/lnfht07XTGfi+1KqQ=;
        b=XGTlxu+JxZG6kmGK7gS6l5fm35vWBcZwm4+oQcm0F113XfH5sKdb/bBXNSl3/FZ8It
         iUmxFDSe8f/cWNtVZDzSh/m8Sbb0YYI+Ebk+eTpAAxxszgcOE0ePmCwG7psjAAlzS0SX
         wlNup0Ge15trYU3/vBah+NVGO6JLZGWe66xY9hyRuaehex3eS/3KeHDzygkN4nSLNwKn
         FeCIbUtC4hGuSSP7GmwRGs4DA9opFpkFqWmUzjOvxakZNtlpbqYOiQrq0Vw/ukdmHfMu
         xZBXW7Dg7K94VRnAF3p1HaDFNu2CEgeaAACLO2cDIwAOjw+4mdONz0E6Z4mqlNQ0Txb3
         Xeyg==
X-Gm-Message-State: AOJu0YyfV735UtVaZx6rRgi7AiBqv/BYxs7DHXjb3fKciq8VjAUrfKq2
	/Xkp7UBgpSX18tZz9eBqLpFR8E6FptGd6fJ32kWyDw==
X-Google-Smtp-Source: AGHT+IFUowk4ELsOivnzaXxc0QlUV4Wvcfh03Hm5SSyMQjwcPTJCFQB+7xIvrXwxFUaSBNJXJhJv8dNqTjB0k78gAdI=
X-Received: by 2002:a4a:bd87:0:b0:589:df75:2d83 with SMTP id
 k7-20020a4abd87000000b00589df752d83mr1373195oop.1.1699462842423; Wed, 08 Nov
 2023 09:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-28-pbonzini@redhat.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Wed, 8 Nov 2023 09:00:00 -0800
Message-ID: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit breaks the arm64 selftests build btw: looks like a simple overs=
ight?

$ cd ${LINUX_ROOT}/tools/testing/selftests/kvm
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
# ...
aarch64/page_fault_test.c: In function =E2=80=98run_test=E2=80=99:
aarch64/page_fault_test.c:708:28: error: incompatible type for
argument 1 of =E2=80=98____vm_create=E2=80=99
  708 |         vm =3D ____vm_create(mode);
         |                            ^~~~
         |                            |
         |                            enum vm_guest_mode
In file included from include/kvm_util.h:10,
                 from aarch64/page_fault_test.c:14:
include/kvm_util_base.h:806:46: note: expected =E2=80=98struct vm_shape=E2=
=80=99 but
argument is of type =E2=80=98enum vm_guest_mode=E2=80=99
  806 | struct kvm_vm *____vm_create(struct vm_shape shape);
