Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2287DA098
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:36:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NqveTysS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SHBFQ0Rtcz3vrV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 05:36:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NqveTysS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3__87zqykdcaoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9yB4pfCz3cVb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:22:58 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5b87150242cso2060205a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430975; x=1699035775; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pX02ozc7lSRzYa356XIJ+CMNCgv5fZ3NEfG1CClMU1M=;
        b=NqveTysS/27obkt4GNf5SzCoOXWeeQfQ21oiFZdRjVwUJ+H/NIfQSpJLZV6rkRX601
         6IWnmu+5TOxeYdISyxiOX6qLTEJcJchIFFNR2XzaZA3iMIZmgS14xv7H9wegh5Fucv1g
         1awPbCSj0W0iFuQTR+CfFTjd+TLKErt/IDVyxYXcXrKCvxxBq/JegfB2AOtN3ybKTJrV
         IRngPzo97zPaWhfFrmC9rHVoSL2SmLtY33QPzBpiYZ8E3TrWPwip8a+TXnxUQMRxRF7q
         2tdQQkwkGgvhH+ahG6nWpbaL6kIO1U3Coxckrukv3Tfr97g18I2IrJDjrQwLpf4NU5tx
         u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430975; x=1699035775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX02ozc7lSRzYa356XIJ+CMNCgv5fZ3NEfG1CClMU1M=;
        b=idzvWNV8+pxENexw69mvOlnXCmv3UT0oK2VQngX7VejQ2epRSzDQWTy8ZaYzInS4aR
         1EuPCAiNC5yooRUfR4KHTozenBLuC11jIeOJOAn4LSZer3diKAPMm+OAFePosciMAaLi
         BYw1JOmKZCmC9VIPbwE3+KJ6lalxYmBbIwFS/jex4YLcoUZaBUwSWxanyEPU4DktKhmg
         J8L9waGMtaexhURYr1piOJOEceArZa4r9jyNPW3kL5bDnRkg/U3jhvtydHSkwwRneD8Q
         xOAiy/hZpHt+TV9dPmtBbpkee/h4mACpRIwE9/ZoUzLM07Cj3dkmBZfx4zPw/4nulf2C
         A4Tw==
X-Gm-Message-State: AOJu0YzzJzwfdt4xwz3dgJtWQtqsenULflYaruz5YrZ3RgFMoXLeZk0q
	JKtY9eVb0SHw659BqpdF+U3RP62cKOI=
X-Google-Smtp-Source: AGHT+IEZ2DkPV4b8zDYsItSE8S6PNMt34EGJVQ4YpOaZs5hBhRUHv0wBQpomiC7JG41zMwbv7hAHGw5rsZI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f7d6:b0:1cc:23d2:bb94 with SMTP id
 h22-20020a170902f7d600b001cc23d2bb94mr38516plw.1.1698430975510; Fri, 27 Oct
 2023 11:22:55 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:57 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-16-seanjc@google.com>
Subject: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use by KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve
  <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Export anon_inode_getfile_secure() so that it can be used by KVM to create
and manage file-based guest memory without need a fullblow filesystem.
The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
needs a unique inode for each file, e.g. to be able to independently
manage the size and lifecycle of a given file.

Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
the name.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 fs/anon_inodes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 24192a7667ed..4190336180ee 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -176,6 +176,7 @@ struct file *anon_inode_getfile_secure(const char *name,
 	return __anon_inode_getfile(name, fops, priv, flags,
 				    context_inode, true);
 }
+EXPORT_SYMBOL_GPL(anon_inode_getfile_secure);
 
 static int __anon_inode_getfd(const char *name,
 			      const struct file_operations *fops,
-- 
2.42.0.820.g83a721a137-goog

