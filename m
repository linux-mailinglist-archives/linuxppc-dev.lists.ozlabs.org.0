Return-Path: <linuxppc-dev+bounces-2066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AE999089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXf5Htrz3cVK;
	Fri, 11 Oct 2024 05:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584866;
	cv=none; b=mqpaPKNYSIdS/Emui9mHWVh5HtCJs1zWmdNOFz0ja5jLUc5vsCg6nJ5vhVEvK+y/gBR8t2jVSkVRhRmY7xZKHNwRkM5JMt3F2hW3CZQ5GZwT5nGTGmLDgn7fb+mjqAYglyPfQbhmNIZ4yzzO6BYHJknIjAT01E5B/Aiejp+ISpTG2Oxdgp+gWVGkdy9+emQyjnbDj3uQGCXavkkV7Jjo7w98wpnOOXYj5l5dB+JIui9eOig8yGD96c6AIwhRxfYXBbUm2fzruEv0fI8T0DXSoT3XCXoTIaXAu+li33xhY720oZlySEHyulOtCxYpa/Q/G5jldxgUuNCohfgm3A4I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584866; c=relaxed/relaxed;
	bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WIJnEy0tEGXM+yXltEJobyGR+9waLIj92LWqin/1553IQchdnaMiipof+QmZ4a5IdtUe9SObJiqcSc0cpMgJkyJfQcWiGELIxG/XMb8l/xUNYMBIEeiPGjoCRpF5nWv4Qs+IWHVMasoSBgRsNHghvH2Onmcda5vxRdRcAD6lB/OdxQbiwevMrw6UTfsBQ0r+CSmdK8xu4E645+ZZF3pQmPWJGhkdbQ1Idy4AxHoV1AvvJ4vCKpQQIhGlINyU2Q5sM+xmfolIyebZ84PJS+/SRJwqnZaaGln+iYBHR4408kIApvrWHDLkekPetw1mPy9etYUq0q83J8X1iyySRCf/gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cRK/58YM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3nxwizwykddgmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cRK/58YM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3nxwizwykddgmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXd6jNNz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:45 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28edea9af6so1640234276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584864; x=1729189664; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=cRK/58YMyAJKPkMW4YkyvQ2M9P4odnyeux4vSyXewzF5ltznvo8WEMumec6FcamfZZ
         0n5Kbns2cZIGw2lPL9ngQ47GsTh8G9jioMshYCzuHCeVYfbwElFIGUmG0ZX5oH9o405n
         vgrW/UdoxW1hppp2JGIVnrWTl5NOLDP+e22zBaibdl9RnrDZ0DDrpPp0AFEL/MJ+19iq
         Q/tl9GlSN91ktpMzg5LJJjPs2/dYJI/gBaACyju3svr+nMQPNMoWFQ8DkL7v8YaDxYOx
         jMUno0t77RBLMyVTfw+jY0mWxfjh+QrbJ4LFesb115BtqyDerRv9AUWKyohE10dUqdYL
         Bpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584864; x=1729189664;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=cqEtqCoz274pQUgsuH5BY4pS9lTQpjosGBZOAMUP8QeHCAJ18ZldW+tXIcvtXcUIm0
         kjx97Bc1acg7PaVQBZIYsGariYL38AEGjwypv9yt4wau7aeKwm3Jp6Sc/pSKfxQY8SJO
         HMjuoAJu2BsFOnyGfk9VfYM3WTWFO4iHkZJ6kdEoXQRHBtjqsYkDNtGOVnxdYHOGJ+Gz
         7Og9UpXTAiA41eLFc9etHAp9YHRfKdoY8IwVPC9m3/fH0IYoQE/Yyf/0AFPXmQXu0Cla
         q6coGelNfVxfU8rW6DvER7txPqqt0SIpwlnLfICJyMEL5k93q0BmbC1u8jMTsEh5a0G6
         pCRA==
X-Forwarded-Encrypted: i=1; AJvYcCVk85iTcQ8lP+m0K0lPW0hv6EpGgoEBtpNevKMaPY12MQvEskt0nGf1f4WriMpMqVv03Ecx1QR+E9vfITM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxE4vf58LaQsDEz5MkHibP+ObZl9dvPvc+Ost7sKUeoHq7bzQyv
	tQssfhq8Wq8rLdjgLOAwcsRfPHAyA3WdeLTEtEUDRZ2fbGieStDy8IBjLx/J4XmM5zgwNyCWBqz
	jQQ==
X-Google-Smtp-Source: AGHT+IEHmTL+CF0lwT1L0/srW8AumAgUZ3z+xXpT6s6F1mY7sAC4x3PdYh5uuuYsI/CKxaNz7ipzx99kqDg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ed0b:0:b0:e17:8e73:866c with SMTP id
 3f1490d57ef6-e28fe421ddfmr136730276.10.1728584863963; Thu, 10 Oct 2024
 11:27:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-82-seanjc@google.com>
Subject: [PATCH v13 81/85] KVM: Make kvm_follow_pfn.refcounted_page a required field
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that the legacy gfn_to_pfn() APIs are gone, and all callers of
hva_to_pfn() pass in a refcounted_page pointer, make it a required field
to ensure all future usage in KVM plays nice.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b2c8d429442d..a483da96f4be 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2834,8 +2834,7 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pf=
n *kfp, struct page *page,
 		pfn =3D page_to_pfn(page);
 	}
=20
-	if (kfp->refcounted_page)
-		*kfp->refcounted_page =3D page;
+	*kfp->refcounted_page =3D page;
=20
 	return pfn;
 }
@@ -2986,6 +2985,9 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
=20
 	might_sleep();
=20
+	if (WARN_ON_ONCE(!kfp->refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
 	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


