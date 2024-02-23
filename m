Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B98615E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 16:32:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEUFeLJy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEUFeLJy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThDY248Y4z3dXM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 02:32:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEUFeLJy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEUFeLJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThDXJ1DWvz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 02:32:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708702330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltXfiFuoTEtZlQ375zaRTODYeS+HobqFtlM+RXnHddQ=;
	b=fEUFeLJy7wWCGpsIiw44ytq1MxrQn95Q8qS+X9SfrvuWRe09YCVAmK+wOeulUp2jRM+VmD
	wO9W+Hh+Y+4yDpJgbRlzyDVDDJ2HME5w+r4iCliYoMzQjCgnIw6RD3aC1iEKITUMz0lF9A
	5klySqb5NbQZTkujA+CmSs52nZDzW4E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708702330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltXfiFuoTEtZlQ375zaRTODYeS+HobqFtlM+RXnHddQ=;
	b=fEUFeLJy7wWCGpsIiw44ytq1MxrQn95Q8qS+X9SfrvuWRe09YCVAmK+wOeulUp2jRM+VmD
	wO9W+Hh+Y+4yDpJgbRlzyDVDDJ2HME5w+r4iCliYoMzQjCgnIw6RD3aC1iEKITUMz0lF9A
	5klySqb5NbQZTkujA+CmSs52nZDzW4E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-Axm70zb5N1WHtWgtndwTrg-1; Fri, 23 Feb 2024 10:32:08 -0500
X-MC-Unique: Axm70zb5N1WHtWgtndwTrg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33d9fe87c4aso473721f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 07:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708702327; x=1709307127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltXfiFuoTEtZlQ375zaRTODYeS+HobqFtlM+RXnHddQ=;
        b=PHJ4N1hH8Uqq4xjovIWtEKqf/YW5iks7dHBHkLlWeXx9LJaljZGxAOktkVUjnllpXF
         JX4IV+UZTYqsH8298HLpNOB65HxhzN4Pl/u6t4tEkh9BL5gni/KvpSF/GSAihQjN8wgH
         cOSmGqJjEMXjyO3hd3d6mR3piUdTv6mKnaUTr+kDsFpfYrG9v2kXGlZgpGumJraph1rG
         ngmKKKcYWrCp1q//0metrdsepuqhin9SDkU00v5FWhysJPVrZurp4ftECgqk9wfKJESj
         wUtNzgN4G8CtgDNxLQcUBJK+9oesSiTwSbav9M+gUrTDZDg4/vvc/rZUP1esescTj31z
         dMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9BZabWI7GpFXmYnPahrRgpMfM/K/M0tPy5/CZoYIoP2C2bjYBgn4bJmeUFdlQhwkFQHDlOCe7iCVN9iILfP1PPjAqAVLlAcMfxb1TfQ==
X-Gm-Message-State: AOJu0YzlNnIfrb4uD7p2F1P/ZwKYpV6ds3kKOOWdK0E84kZ3Fc440REy
	XFBH7MqxtNCf9JJf5QihofWs1mfP0Z8ltHS4A6jy6tj11r5lGohBd0IT8v+1Z2qM+BHJOyx2Iqd
	AXK/drEvuFc2okuyAE8r5RGnPuvFem5TBtBjXoYAC9Mqc081G92ePJl/xzeCFgv5IyIg/jVnvly
	MrNgAgrIy5rvnogGCwTf+qCXJr8g5SMwZCTpbNbA==
X-Received: by 2002:adf:e511:0:b0:33d:5ae5:f356 with SMTP id j17-20020adfe511000000b0033d5ae5f356mr94669wrm.20.1708702327608;
        Fri, 23 Feb 2024 07:32:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLm2G66Tw4sgodVUIb9Jzv+TjNHaof3FgriahBQfesSvJsXof4hqEVZ82kEIdVUXv/1jq4kYYkRea+6qJNwbM=
X-Received: by 2002:adf:e511:0:b0:33d:5ae5:f356 with SMTP id
 j17-20020adfe511000000b0033d5ae5f356mr94647wrm.20.1708702327323; Fri, 23 Feb
 2024 07:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20240216155941.2029458-1-oliver.upton@linux.dev>
In-Reply-To: <20240216155941.2029458-1-oliver.upton@linux.dev>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 23 Feb 2024 16:31:55 +0100
Message-ID: <CABgObfYZBnTjXh4TqH77HjO3zTMRfekaorTUVqQoFOMPJLjJTg@mail.gmail.com>
Subject: Re: [PATCH] KVM: Get rid of return value from kvm_arch_create_vm_debugfs()
To: Oliver Upton <oliver.upton@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sebastian Ene <sebastianene@google.com>, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, kvmarm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, Sean Christopherson <seanjc@google.com>, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 16, 2024 at 5:00=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> The general expectation with debugfs is that any initialization failure
> is nonfatal. Nevertheless, kvm_arch_create_vm_debugfs() allows
> implementations to return an error and kvm_create_vm_debugfs() allows
> that to fail VM creation.
>
> Change to a void return to discourage architectures from making debugfs
> failures fatal for the VM. Seems like everyone already had the right
> idea, as all implementations already return 0 unconditionally.
>
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Feel free to place it in kvm-arm.

Paolo

