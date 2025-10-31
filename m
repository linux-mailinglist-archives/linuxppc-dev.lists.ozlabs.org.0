Return-Path: <linuxppc-dev+bounces-13646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C5C264BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 18:12:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cynbC3H8sz2xxS;
	Sat,  1 Nov 2025 04:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761930727;
	cv=none; b=k24qtqGxf1eRZ3YgPp4dQ4qkPAHNQfqzqz1h9aCxG06f8JD46SLb4ImzKLy0spvrsKoRKkyGK64hQxPdNx6ArvgdKUh06UwgLxshQoQltX8RXhqfWP+VbshdlVNo7JTnG8sQOgfn5Dfh0n0+XOJ/j/X3BeU+DLR7Il0DnFbmQBO5tR9gB91KCKwGJOdWDlDJF7LhKDQ8Jb39D6FUyBCQEP3YBh/pVhe/hXtRblZmRybjrF9g5AxBsqOEAqqJ1XQop+GTZqvxSQNPW7xtINe+3y/ZsUzPOWSpRZzeglTQiWM8RbO0w1vIOT0R+axMWDHf3E5oBQer26fb1RkSw1AoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761930727; c=relaxed/relaxed;
	bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eozONLT9jodqGLp3ybuDVvmC9yhXFBvnWCsJ7xApjWVor2Bw9GYnC3svjeivPwdA2LFfKznYj2vubotY2kCJDe2yLiW3uM1o5y6jXP80a5Lra9ZRS4dvkjcdzTea4yk/aAEYbBit76l/hRKCYJ4rdLIsK+djBVYjabl1P/yv9PIsmjENJpwsn9YID22gkFxycyhaOQrz0VmvJ9vUwFfr6Q8HWLw5c262INgWfCQDuCdO9XWPmdhUiAtwjT3dfzJGiIUSKQE1Bvrut7w0y8QMfbZmlrkTEWOo6w1OnPCbnWk5wFUKq1N2kQWQXgT6f1s6YazACiB06uzCiuD8NmzDYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vKRAhhd0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=34-0eaqykdciqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vKRAhhd0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=34-0eaqykdciqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cynbB12lvz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 04:12:05 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3407734d98bso1837575a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761930723; x=1762535523; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=vKRAhhd0KMkCZbfjZhmO8ARiloAiUAMnRffpggOBRt6ZjjETGbC23lYRIIcMfa2JFE
         M+n2/bFGllvN9glzwH+JnEhQQeS2mdIeYG5uAd0zs/WJ114x7Zn7IuWF+I2NFcyYkanz
         d1R21Bs+PCF0dyESakoLMkwXj7MhbBzqJ3nAl2i/rfsrbRHAwy6syJcCE8Mjh+kTtBRX
         gT++FXBCbfwA3qGBTep8xpYXSNkfgZWN1aTGJ/ZNLtgsaQhKwpAJs88htDBusR5nYtdq
         4wioC/nPNjFtjUuVClqg+fqDrUHBlwDrFl3VLyqPzXrwGZQgygw/rKQvc0B0sYgMuWk4
         IRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930723; x=1762535523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXjY8ls4xQvqV6pquPYuHe7QqNVj5FW0YEflavTuCM=;
        b=RzYPaBb3IvIFG3S7ygpFMi8QeRj70qV2K3YewC5mpBvLZ4LvqIDCEu1W0HlQonaphg
         pGTPJga1H18B9+bVL8Ur/Rdj6izKu7u9oKkAQ51s6XlzOUr7rTlqwDIguLF9W2MvnAHw
         eRkdODtgORKIdM3b8A57wcHo+2HkJIRxm7s6Jl151haIx5k1hjolHHhjn9+q70lOejM/
         IsKMlHOXZSVRVbVmLZMB5w3rp/++pEBPr+HPByn8OQQX+jlhVnQFlDjQU9ZFHLcsvLrz
         Gs164WmiqtVqWU7eg9wJ92ui074LGFDI7ouZqXhmd3y0jQMZyFvwWNp+LkQXM3UghKxx
         3SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhtJHGruTbVb24MDtgbUZ3CUxopWvo8r4Eybi+5pTcSISJdxJYOeoG79bpiDHDNwqyozOmNJeo29am2Pw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0AySvXjT9IFsM8sw3IwFAJpyd+8SqPV5JgOq5EYKyxyudgDwI
	Arlmzwmy+PuQJvTcKL4Ecr+pxw9GKnsOqw46ZJfweDzCQKZvV91+NQpndovPS4RnSBVRH+GgamV
	4MBBGEg==
X-Google-Smtp-Source: AGHT+IGfSgMUQo+5u2P6PetuRGaKK3ywl60OSkXvDDKeMxjcSsBTGVvS+p3TiopL8XWw5d9McqxPGzj/wX4=
X-Received: from pjbsr13.prod.google.com ([2002:a17:90b:4e8d:b0:340:b55d:7a07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:32e:d599:1f66
 with SMTP id 98e67ed59e1d1-34083089300mr5226937a91.30.1761930723259; Fri, 31
 Oct 2025 10:12:03 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:12:01 -0700
In-Reply-To: <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
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
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-9-seanjc@google.com>
 <aQRzWb3Fu6ywdE9t@yzhao56-desk.sh.intel.com>
Message-ID: <aQTt4R4CflSuVnCX@google.com>
Subject: Re: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 31, 2025, Yan Zhao wrote:
> >   - Increasing the folio reference count only upon S-EPT zapping failure[5].
> Nit: There's a warning:
> 
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)

Checkpatch is a (very helpful) tool, but it is not authoritative in any way.
Similar to the how "wrap at 80 chars" is a soft rule that can and should be
broken depending on context, checkpatch should also be ignored for things like
this.  If someone says that the period making the line "too long" actually makes
this unreadable for them, then they're just trolling at that point :-)

