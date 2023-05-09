Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD826FD04B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 22:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG9NB24rqz3fMn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rVJW9XdH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=dmatlack@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rVJW9XdH;
	dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG9MK0rFnz3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 06:52:11 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-43483520faaso3471285137.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 13:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683665528; x=1686257528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=rVJW9XdHV4bhVBpENigqqik2I2pCncaz794aO5r0GaFD6EOogLB5GsTpjkOXXFk1cl
         BLaajyFwcHYbDsMksrmy46rkJ8Xg5XgSiPcKIeqTk5sc4i6ByJVNSNE661bfq0lTqdr5
         15qPLPCf/jWgZf76j7FinTn4I6xu8cSDiM5g9kSu8JtTXKgSM8OwYPMKVaG7suYL8InA
         DMrcHjABRjgiApDllMJEgP/iLFCOFcqlwydZH35zZAE5dGhLWBf35Ag5dGmDJHpUzL+l
         I6D5uZx78KFyGlmPQFh+q8W5REGbWvTcrIRfpmnEKUzBt+OarAE0cEQNLkGT/+HDIP0z
         HuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683665528; x=1686257528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ek4N4zhVnFp0OjD2e91cJw6qEMFFDQc5/FTgmHiGak=;
        b=YSz+GTdL5TGy9bjPTLfObf4Uh1ta6vOnhjxFMZoTPXxBIRaAnImbeqISh5Ul+2MbQ6
         qRn858nFmxmK40LlR1a+4Jt3sMDf782b7QBQYsnXXH+OqTOogjjL/8q1w6qmnyNWd/IS
         FFozWC/lWOZcEmybPld6LTNGKZFCNfEreeWVomOE2Q3XHQoRqd4g86839nM8D+OnDiDK
         YM9G+6fDFt2UFla998L+znLBc7Ex8B8AWLjJM2zlnzJiTv9zdK8cyncj/sywOQzfdtOl
         gnVaGNAjDkDSBNs2k1V0Yj7VXIbb+w+0d+w1rZwxd2K3HTqbUjk3rxKVzMTkGH+TJZjv
         GbIw==
X-Gm-Message-State: AC+VfDygKPwjY+0nFA7X9KuYYPBNo5C5eKQFoKM5zc3eLP/WPQiN3h3q
	NtxNaIYeFmicZcbJBwif0RyGGVoINAay5ww8AIqU1w==
X-Google-Smtp-Source: ACHHUZ5qUtibgquXG1CHXn5rsYEnNugGuamTPmXoGAjYsiSltyM3mefeFrXCpD+c8boXnApqrdpstv0ZlJ4ZhdJ1iOQ=
X-Received: by 2002:a67:f291:0:b0:42e:6748:13dc with SMTP id
 m17-20020a67f291000000b0042e674813dcmr5348659vsk.0.1683665528538; Tue, 09 May
 2023 13:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 9 May 2023 13:51:42 -0700
Message-ID: <CALzav=fZFpzw57hNmg2fqYG-0ddtvQd9+=7cw8tzuOGbZW1A1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm
 -riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 6, 2023 at 11:01=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> This series refactors the KVM stats macros to reduce duplication and
> adds the support for choosing custom names for stats.

Hi Paolo,

I just wanted to double-check if this series is on your radar
(probably for 6.5)?
