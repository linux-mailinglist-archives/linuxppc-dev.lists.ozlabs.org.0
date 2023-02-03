Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E668950C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7WnC4Wbvz3f7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ywh4mnPV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ywh4mnPV;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7WmD01jfz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 21:16:57 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso8359907pjj.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZbAUGn0r6doN6zThP1Zquzlxw14avp8efmj05+Io/4=;
        b=Ywh4mnPVN3Y4k0f4DuulkG2miIzAXD2MOag6AoE9aqI4lk2/oCohsrtf8Gr8EPviVM
         w5YHMEJEeyxv4Kxv5i6v3b/lUpqXFNx1osYHGwcvd5Y6A4ASt/XYopzNc7ULMCnsOI6d
         IrSWoKHqFH3ZA9JFOpulvON/sgxK8lIDCGcFdofh7TQct/4Basch9lONK7Jz9jH6b2l5
         lG9ZdPMIFHQYLtBy4nRdrdwKqfTKG98jS03kSpv/G7uTjB62apnvK8P8uUgwZxEBoWt6
         TcPvwy+n7no1gkpCj3JC/uJM6ahYRPgSN0IO8wEZNDBK6v4Lg/AjhsnsKmGHKgxXIauL
         JR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ZbAUGn0r6doN6zThP1Zquzlxw14avp8efmj05+Io/4=;
        b=Z+unYrZwfAJmUAi61b0NXDAkCB8FGXRwO5OEfCWC7xNfahP0GGHqYEea35U1MAxPQA
         XVvUfbJ+Ehyp3hjflK8rvR1xQZfdgF/9oRLAhJ+QgqYY7TTN57REYJSr2BmP4uAQufJ2
         qsxVZK/BA+DSh6peIvu9vgRopwcPAx7sk/KgRY4SFZ9XRz01PEvDF7XO8lpWvwmCp+5C
         kFNfcRPYiDGVCoFgbJeBTn9JXEPtKV52lSn7cx321CtjQ9d27vwZoUrdWTA/MkdDXkxl
         NQOpnMlAzQH40FvbQxI3UXSgm/uEPN+pGZ6cPKRomOP5L811//DcJk06pLPheCGZFCIt
         1GPA==
X-Gm-Message-State: AO0yUKX0ou5EtA9WNjTPV+u5/y7Cm6Y+csGIGOEQ8ieF+IcmBRd3Z0cD
	h+wXjfT/sbybzwNxAlgJdsc=
X-Google-Smtp-Source: AK7set8WbQ1iPrN5HSlN4f706F1IqNht5RVf+MEFDgPYm7h/efSiL2BKY4uYWAK+N6jAmo/6Qh0viw==
X-Received: by 2002:a17:902:da92:b0:196:5839:b36a with SMTP id j18-20020a170902da9200b001965839b36amr11622683plx.8.1675419414829;
        Fri, 03 Feb 2023 02:16:54 -0800 (PST)
Received: from localhost (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id n19-20020a170902969300b00198e03c3ad4sm1002403plp.278.2023.02.03.02.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:16:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Feb 2023 20:16:45 +1000
Message-Id: <CQ8UM1FTPEUZ.3F2RONR3AJ5YP@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Sean Christopherson" <seanjc@google.com>
Subject: Re: [PATCH 3/7] KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation
 section
X-Mailer: aerc 0.13.0
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-4-thuth@redhat.com>
In-Reply-To: <20230203094230.266952-4-thuth@redhat.com>
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
Cc: Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Marc
 Zyngier <maz@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Zenghui Yu <yuzenghui@huawei.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 3, 2023 at 7:42 PM AEST, Thomas Huth wrote:
> The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
> since it fails to return the full 64 bits of the value that can be
> set with the corresponding KVM_SET_NR_MMU_PAGES call. This ioctl
> likely has also never really been used by userspace applications
> (at least not by QEMU and kvmtool which I checked), so it's better
> to move it to the deprecation section in kvm.h to make it clear for
> developers that this also should not be used in new code in the
> future anymore.

Did this get included in the series inadvertently?

Thanks,
Nick

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/uapi/linux/kvm.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 55155e262646..f55965a4cec7 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -83,6 +83,8 @@ struct kvm_debug_guest {
> =20
>  #define __KVM_DEPRECATED_VCPU_W_0x87 _IOW(KVMIO, 0x87, struct kvm_debug_=
guest)
> =20
> +#define KVM_GET_NR_MMU_PAGES _IO(KVMIO, 0x45)
> +
>  /* *** End of deprecated interfaces *** */
> =20
> =20
> @@ -1442,7 +1444,6 @@ struct kvm_vfio_spapr_tce {
>  #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
>  #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_lo=
g)
>  #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
> -#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
>  #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
>  					struct kvm_userspace_memory_region)
>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
> --=20
> 2.31.1

