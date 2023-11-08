Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D877E6114
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 00:38:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VM46tU58;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQhNV3GPvz3cTc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 10:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VM46tU58;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--amoorthy.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3trtmzqgkde4q24479xew44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--amoorthy.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQhMb3N8Jz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 10:37:29 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9cb79eb417so309246276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Nov 2023 15:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699486645; x=1700091445; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIcgmcP1EY6htEGo1pN6EVJRVE+qt/I8BKL1s/KEy5I=;
        b=VM46tU58x1h8l/KcjCFlRemZzYmo0YNmtiCIhgmZZPwh0PRi5A4JanP+qSjtP+fZAW
         +DfURcN3Xo/49jnm2VmkeGqdysqZhEZq/Dj38lYmodH+8JUI2qwusk3bak0cIr52tEWN
         n+GUTZbW2h8g2iMGt7YqQKZFM93cojE6TNlK+HO4NWWVhSV36xZRl7cgHKKXaRVdQ5iX
         lykR5b8I9VyuD3/p0ByUd9g5/UdV8kRPL5lYVBVyqNalPyl2QcleJO3KVHW1S0wHRRnH
         gH99ejdOgdaal9HB8pmxt6/RaTqud/WbhuZ4Cj2xN+T3fmOn/7jzSeQftwknBLqegPwl
         5pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699486645; x=1700091445;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oIcgmcP1EY6htEGo1pN6EVJRVE+qt/I8BKL1s/KEy5I=;
        b=tkzAeIw9I/C6Yv3jmanCHU+DBLZqr508K8kb70oAs8H/baF0HLxntdl2ZH4e75DHPj
         B9qF5KGGQtKlhs12/rxWwf+XwIZ+LWLBP8BhOswH5XWw43yLnRCp9lro+2gmtbbatZ8+
         lxvaYva9qabLgajVWz6t72gsW2nwy4bX6XCgzFxEst7cswga2pdcT2HepFFwMh02K6Ow
         KBgN4dNTXrHmkqqd7+7Ws1kEpj3bIcWfaO15bStYoPSn4Hmbh7s9GZQ2AVNxMLyv2LqA
         cTZni1gZZFukKGAK0rgckwba2EEeaJ9iS9X0pRNOREizPMLs2BMp1b6kyKT92Sn8BuQt
         bqLw==
X-Gm-Message-State: AOJu0Yw6pzL468X0tSfqunqf6fP3qAuTQfbJeuCz0VElfgk7TU2sbrXZ
	i97qZzepH6pEbeoG96R6zct6n+a4Nw2gpQ==
X-Google-Smtp-Source: AGHT+IEQyf2yih5ALlCfgSEkVLSLt0Zq5IBGBmP/Cna+y8K3zSa/6bcCrG6olPCsXpdGmctjh3MSlNk2LvNOvw==
X-Received: from laogai.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2c9])
 (user=amoorthy job=sendgmr) by 2002:a05:6902:102:b0:da3:723b:b2a4 with SMTP
 id o2-20020a056902010200b00da3723bb2a4mr72222ybh.7.1699486645232; Wed, 08 Nov
 2023 15:37:25 -0800 (PST)
Date: Wed,  8 Nov 2023 23:37:19 +0000
In-Reply-To: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Mime-Version: 1.0
References: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108233723.3380042-1-amoorthy@google.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
From: Anish Moorthy <amoorthy@google.com>
To: amoorthy@google.com
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
Cc: kvm@vger.kernel.org, david@redhat.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, anup@brainfault.org, chenhuacai@kernel.org, xiaoyao.li@intel.com, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, yu.c.zhang@linux.intel.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, ackerleytng@google.com, viro@zeniv.linux.org.uk, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, mic@digikod.net, isaku.yamahata@intel.com, brauner@kernel.org, qperret@google.com, seanjc@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, dmatlack@google.com, jarkko@kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.co
 m, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 8, 2023 at 9:00=E2=80=AFAM Anish Moorthy <amoorthy@google.com> =
wrote:
>
> This commit breaks the arm64 selftests build btw: looks like a simple ove=
rsight?

Yup, fix is a one-liner. Posted below.

diff --git a/tools/testing/selftests/kvm/aarch64/page_fault_test.c b/tools/=
testing/selftests/kvm/aarch64/page_fault_test.c
index eb4217b7c768..08a5ca5bed56 100644
--- a/tools/testing/selftests/kvm/aarch64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
@@ -705,7 +705,7 @@ static void run_test(enum vm_guest_mode mode, void *arg=
)
=20
 	print_test_banner(mode, p);
=20
-	vm =3D ____vm_create(mode);
+	vm =3D ____vm_create(VM_SHAPE(mode));
 	setup_memslots(vm, p);
 	kvm_vm_elf_load(vm, program_invocation_name);
 	setup_ucall(vm);
