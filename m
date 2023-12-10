Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B280BDBB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Dec 2023 23:54:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pOmxu+L9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpKtv1dpwz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 09:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pOmxu+L9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=jmattson@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpKsv25qcz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 09:53:22 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c2db0ca48so42985e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Dec 2023 14:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702248794; x=1702853594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=pOmxu+L9zfD9xNqGgLlLzs5/d4Xo7QuxBTHWsVwLZfCzIv1HN9flW5WIx/oSYvrx18
         qTY4mQyyRne5Hl5NfZ85hRRuVCxrqgd+Wz2BaiQtYEYJaYBkAuSAR9ZndrWuJH5GZF9X
         5YmWTtl+mmJ6BDoA04WZxVX8Lk0uxhfZ0/91r4pq6IEF1xJwAJERC26wA6gel1ZnSJSI
         cNZHd9VpA8jeCsP0jWqCtPs+AtgK7KAkJRpd0w3t7ITUskP0W6gHNk+F4AKq5B3ITfMs
         kiiyhVKaExkMiwHqKO7JLCTdcIrxZMNBGKv+gO0vfRN+MzgyG8UCJba0YnrsS/FBUy+F
         XwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702248794; x=1702853594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKS/AHcM2NBWqMD4zsEUfP2kt6MSIwHJfrO8WzI99T8=;
        b=mEpPYNbanouV5sYwHrWPio+LEBvD1SbGPQlMBfwSmf2B+8DcrFImfjY6FZPRkrTCxG
         gFvYIAZL4dtoiSwc/+C9DnNs48GTO+9vpBxh+itICos61QXmQmECb2PVKrevhZGf1kVg
         cfm3rNY1CjagLjUfbbPMkPdETkIqVzJWCuAM8Fqjau80Kbx/S0Zg7GWDHktnGaRq8q6g
         4WPH5WMYvlcaKiXiwJ50/VndedZ9NJ7++/4hfPmkz83sZtRRgtw3dDNjn+1/kgCmukRf
         Ui+khNOVQnMnAl3kUT9Wrj0SOrygPx1TOQRcRj9+hv2OChA1DcqwtFyalE3rNUP6IEyq
         6Tsw==
X-Gm-Message-State: AOJu0Yx5nT5LnMyktZegAuE1QYZvtLyHLG8oLN4Jdv7Kq358V0b3Kkj+
	B9qcFmG8Du9wGXRZrUJWapX4DdrD0472IkvKRnQdaw==
X-Google-Smtp-Source: AGHT+IHfF/YK8dgWEfqDIfnTDLirkLeJB4fVu6OmnYB7yxbJvNgiVETL/lA8ongHRpHXQrS4L8RMiXwyvPov+eoWnK8=
X-Received: by 2002:a05:600c:5113:b0:40c:329:d498 with SMTP id
 o19-20020a05600c511300b0040c0329d498mr170595wms.1.1702248794289; Sun, 10 Dec
 2023 14:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com>
In-Reply-To: <ZXHw7tykubfG04Um@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Sun, 10 Dec 2023 14:52:59 -0800
Message-ID: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
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
Cc: kvm@vger.kernel.org, david@redhat.com, atishp@atishpatra.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, mlevitsk@redhat.com, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, paul.walmsley@sifive.com, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 7, 2023 at 8:21=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
> Doh.  We got the less obvious cases and missed the obvious one.
>
> Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().=
  That
> thing should really be folded into vmx_has_nested_events().
>
> Good gravy.  And vmx_interrupt_blocked() does the wrong thing because tha=
t
> specifically checks if L1 interrupts are blocked.
>
> Compile tested only, and definitely needs to be chunked into multiple pat=
ches,
> but I think something like this mess?

The proposed patch does not fix the problem. In fact, it messes things
up so much that I don't get any test results back.

Google has an internal K-U-T test that demonstrates the problem. I
will post it soon.
