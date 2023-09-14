Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832879F790
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:08:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Grgs+LWR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLMm5FBDz3dl3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Grgs+LWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3mmgczqykddspbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5J2b1Zz3c5Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:04 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c0c3ccd3d6so3997755ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656563; x=1695261363; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pjDK4myqRW/1aonXWMm2h3oZGIvtROhN9F/LidQar5g=;
        b=Grgs+LWRsi/oqn1eGzshY0EvEArjP4fHXpnqSVcTDAg6sdOIwTewG/vrU2C6w1jlwV
         BzyCOnK0au5KfoZkAbZiHknicpRbDr3jfuEQOhFIe9F0TLBnAvVdLnh/jslZcdfAP4t1
         bDemYvJukHYoOcmGoEbCMl1td6TUnDzy1IhVDwOUiqU2MM8bUiewFETbwragcjxmTt3O
         xtwFeKNu7wR5A7zUALfGqGO1bo8BkFA6o4fA/HI66yZJDcWCDzfl7+5miPUWQqsEuh6m
         ZicM6z2apLFy/MXWYqrWmTg5gSnv/cSe3evt//i9au4uujebtSm8ShLaSpQER/headbS
         rJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656563; x=1695261363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjDK4myqRW/1aonXWMm2h3oZGIvtROhN9F/LidQar5g=;
        b=WwVJF363opyZYO9uIqZ5JxISAogjvu9doKK+rTPMLXAnEPHSPEM8pq+nPghScSd0fy
         8y7BcPurxJRJtC6LPtGx+emzyZzuiSerwqMKTF4mhOMQWtIXq93amlHHXoEgrtD5GVQS
         SC88kNma5K9Foax7q8kO2nLrKCMrwTkklPbsKqkzUMT009ilO0qW6el2AtZL/O/XqBCx
         9Om2TPvxOIIBh50mmayxUsy+vU+67ehBR/lO1OuH0slDmSV3qqdnNidjZkh6ZJke7fe6
         jrfnm1on9i5CPMUgY2iA5UAJWI9JFe6bnfyIYKLx8qoIhQr3d9tRkIb+zxhqkjckEenQ
         hq6g==
X-Gm-Message-State: AOJu0YzPUwuxitoG6IfJC5RCTTpTaAhCuekKmK0Dai7FDs/lilDRrv8F
	EkBBrHpkXuH6ZGEbmXYJl9XA38CTq6I=
X-Google-Smtp-Source: AGHT+IGkqKKLF+YNvEneEdPalVclX+vMSg6CmJX8h6r/u0gfxt18eBEohuQohG5dATROkCqosWZykFZT8R8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fa8b:b0:1ae:6895:cb96 with SMTP id
 lc11-20020a170902fa8b00b001ae6895cb96mr149990plb.5.1694656562630; Wed, 13 Sep
 2023 18:56:02 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:11 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-14-seanjc@google.com>
Subject: [RFC PATCH v12 13/33] security: Export security_inode_init_security_anon()
 for use by KVM
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

TODO: Throw this away, assuming KVM drops its dedicated file system.

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 security/security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/security.c b/security/security.c
index 23b129d482a7..0024156f867a 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1693,6 +1693,7 @@ int security_inode_init_security_anon(struct inode *inode,
 	return call_int_hook(inode_init_security_anon, 0, inode, name,
 			     context_inode);
 }
+EXPORT_SYMBOL_GPL(security_inode_init_security_anon);
 
 #ifdef CONFIG_SECURITY_PATH
 /**
-- 
2.42.0.283.g2d96d420d3-goog

