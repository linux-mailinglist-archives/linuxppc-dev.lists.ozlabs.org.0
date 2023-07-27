Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCD76529E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:38:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BRo0MX+z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBTKs3N6Vz3cNc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 21:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BRo0MX+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBS2q5K6Qz3c3c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:40:18 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-63d09d886a6so5741036d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=BRo0MX+z2r1SS6yWvALim/6/nbcuIraz/dvlfYWOZ9asJfVrKNdNm2FzRqaxLf+dSr
         gd8iH6tStNBkd23/w31KCfLL9pbPEeNVyPTR03aUqTDZY6wZTMoqJSnBUDPOFUCLZI8l
         DGkcMHGLOMeyEEgRm2q9vaf0Y5Q5Azvv1tkZ/xFOCXwAaoOvebuUDqbcoCdnlpWZyTyX
         q38zkUOHeP0Tt+nEWAcZ8JszB60VlCahpErQX1nO7BawFSz3QtUcVh1o5Am/iWB313H6
         H0uJV9FuYrV0GCIZde+45ERDs3S4qD78OMMR7S/b1svm4zQQyj/BCkUn3DI2PJoOlxx+
         Zjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690454415; x=1691059215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sndfUp5VQwyYdDkfd9c4UQTPXsXPqaVmv/x1Ijy8DrI=;
        b=jR5UcamHkjpSyvIcbvykrFci7CsIKVbqYS+eoaDvWSzvFB53a6iOV3tmt+1n2YMFvp
         qzr7CAN+BxYV2ny/dyJThDgv0S/YRLl+UwLgqLCwhv4pmZvfLmMI+OKIyq5kfxgFLY1p
         /GMy5u6g0JuFBTRntmfHo5IOsKoWZA7S5kvw28yo1155Xwcl/xmvPQGEI53OTW0LUOSx
         iP1N1ZLzyIkUdGPnnJyzyfrqy4Qn8yzcKiQoxSNO+CWzXnqOCZ5SwV86tkhb2IKmXrBW
         A0UlPcAHcQKpxVa4sNXqyVyO+sRm4Qj91ZXTBoQ7k8FSCwzpPXzunLTojYFG34w5PoZv
         ww9g==
X-Gm-Message-State: ABy/qLbl6Y6WFVzciG8rWaLuGYLTYt2KphOeCISgN4dlP1DIBNcrlyIF
	PAgeyNZMx16pYv0reSEPMoie9KK8dvW77Yq/S4vsSw==
X-Google-Smtp-Source: APBJJlE+0dXFxcWiQX8kiDXJfKau+LxjypHc8uOGBYfuDsHhoPcJDBpq4NHTu2yqyvhkPVt07nS69cNqQCueoayyUeg=
X-Received: by 2002:a05:6214:12b:b0:63d:218:c83f with SMTP id
 w11-20020a056214012b00b0063d0218c83fmr4306083qvs.36.1690454414736; Thu, 27
 Jul 2023 03:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Jul 2023 11:39:38 +0100
Message-ID: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 27 Jul 2023 21:35:36 +1000
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>
 , linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

<snip>
...

> @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
>         case KVM_GET_STATS_FD:
>                 r = kvm_vm_ioctl_get_stats_fd(kvm);
>                 break;
> +       case KVM_CREATE_GUEST_MEMFD: {
> +               struct kvm_create_guest_memfd guest_memfd;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> +                       goto out;
> +
> +               r = kvm_gmem_create(kvm, &guest_memfd);
> +               break;
> +       }

I'm thinking line of sight here, by having this as a vm ioctl (rather
than a system iocl), would it complicate making it possible in the
future to share/donate memory between VMs?

Cheers,
/fuad
