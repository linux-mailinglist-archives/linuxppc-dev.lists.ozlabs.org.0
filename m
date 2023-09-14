Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1379F7E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:23:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=r7tOXpua;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLj22pscz3dgJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:23:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=r7tOXpua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3t2gczqykdfgi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5t6H9xz3cSR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:34 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-56c2d67da6aso297810a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656592; x=1695261392; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjv0zC4RrtxbIkJLIAO5e3EhKuQZW28HjcF6ypERxIg=;
        b=r7tOXpuaKDTZXuUz+sH3amxop4Jl0pG7OTLuUCNRXQM91nSU81U9+NvP3UxALM8mPM
         mdJWMV6V9UjFw+2sdVdjm78tn7NqhHpkB+pmiG8LhpB1Xsp3KNYMNGPgGxkFxZ7cxWR9
         bH0RlJgGbJJSOLTZwGy/DHxuOjAly/Xqxzy2LXQoNQV8LuEszkZTq2hzREctPoYPIRMP
         +B8fisfkIIZpAVyrEDIK3XQTlW5I5PlJNKafssM6+xmFPAGzBlmMP04rnG4K0Km/+nFQ
         osZ3OtS9TGW+zN/w4B1wvyu1HQKxPmZENImT/A4nzBoTpRZXKnXrEeKRjpkpW+nk8zIF
         ImkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656592; x=1695261392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vjv0zC4RrtxbIkJLIAO5e3EhKuQZW28HjcF6ypERxIg=;
        b=KJk27F0OnEapehtGeMu+SkU/JT6gImPD+PVW6bNqguI8QhEUeP+lJ4lLsZSUhQjkvV
         zQid6rKvY5bltV9PFP5dpsH39JafGH0OdJ+AyYbBlIjYuc38aFJQ3K6KuDuH6VPOBj8i
         pQK+YikDVj83okoiEFWP8t7yVW3dJ2EEzMTxroJkjDTMJTaDyZ65pzPtMIpWi5qK6N8z
         IQpVvGotg5mTmroOICD7+cUrwg9S8cAFFZBo3BlSo5lN1kNMDtPrW6tSQEpVDZKWH2N1
         VqYvt2XQR47TfAIAv+089MLK7PX1TTsp31e0Clum1tUnv/o75Iu7RtbCYRXtvyk9HNXM
         QvrA==
X-Gm-Message-State: AOJu0YyUA6ywD6zJhjWnGCDLqBBfN9oXz8T77TzNHumRAoNvYiaBVXLE
	xia5xE8I7pN3pRpV0RO4S/lBdJ8ZYn8=
X-Google-Smtp-Source: AGHT+IH29SvaM4IJ2/NXJnaPAeFMS+fjtgLQL7Rq48UqpO83PYLOZng2qV6FMiS0c4sL4jzOiYmTHdNxdV0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e551:b0:1c3:a4f2:7c85 with SMTP id
 n17-20020a170902e55100b001c3a4f27c85mr212223plf.6.1694656591946; Wed, 13 Sep
 2023 18:56:31 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:26 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-29-seanjc@google.com>
Subject: [RFC PATCH v12 28/33] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add GUEST_SYNC[1-6]() so that tests can pass the maximum amount of
information supported via ucall(), without needing to resort to shared
memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index 112bc1da732a..7cf40aba7add 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -54,6 +54,17 @@ int ucall_nr_pages_required(uint64_t page_size);
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
+#define GUEST_SYNC1(arg0)	ucall(UCALL_SYNC, 1, arg0)
+#define GUEST_SYNC2(arg0, arg1)	ucall(UCALL_SYNC, 2, arg0, arg1)
+#define GUEST_SYNC3(arg0, arg1, arg2) \
+				ucall(UCALL_SYNC, 3, arg0, arg1, arg2)
+#define GUEST_SYNC4(arg0, arg1, arg2, arg3) \
+				ucall(UCALL_SYNC, 4, arg0, arg1, arg2, arg3)
+#define GUEST_SYNC5(arg0, arg1, arg2, arg3, arg4) \
+				ucall(UCALL_SYNC, 5, arg0, arg1, arg2, arg3, arg4)
+#define GUEST_SYNC6(arg0, arg1, arg2, arg3, arg4, arg5) \
+				ucall(UCALL_SYNC, 6, arg0, arg1, arg2, arg3, arg4, arg5)
+
 #define GUEST_PRINTF(_fmt, _args...) ucall_fmt(UCALL_PRINTF, _fmt, ##_args)
 #define GUEST_DONE()		ucall(UCALL_DONE, 0)
 
-- 
2.42.0.283.g2d96d420d3-goog

