Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059720ED9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:36:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtQP5PKgzDqlK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:36:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GXVYAQau; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtNk25hMzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:35:18 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d4so9406887pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=s00P0DjaGSC7vdiXdVQwK+g6WJ0VNDWILQPhUuEX0K4=;
 b=GXVYAQau0kxqZWFt//4uddyCAlpqvNlXjO+K74nVM0iUlZr7FuGDsSTvDbOCYtISE8
 +yV7mTNtOmeKqrpuVpTvV4SKFPF8MkWUoyWIJ1oMqAPxpyv/8zHdyMDq24/w7ti3/KDn
 upoEKvmXXxSFPbiQWEcpGxJoq1RZJtxVLsqWSW3cJA2zWP1SOQjheciySIH7kQaYJgUb
 HQEdluIniVpZG36Zp4lmjRqcfUIxnDlTpp4e5wlpyTyVigCzP5qKlJHQvroAVW03l6iw
 u6G4MAUpkctI/VTUi+suuncsB8bg7YAqwQtdQuiYC1EYjutl/iJe+TQWe46AyxJVIX4r
 xwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=s00P0DjaGSC7vdiXdVQwK+g6WJ0VNDWILQPhUuEX0K4=;
 b=MjBWLb635cc6wltS0Nq5BCwuPF4JjwAm55DcypFqVe2FFFyI3RMqUY4BpAFI5J4cjO
 YGe6kcM4WWf6rR8soI9HyfZta8dLKHDspDyqp6+MQEckGXdVFOkMiWpUqKj7uLDcwGL4
 e2qg/1nd8fqwZT1F91N3IYa16mIm8r/Cr3J4wWL627kViZ/HJBEQwxcQlLN/kXsIp3/j
 6B8KEolDBpT2WicaYfk35HmyFHHEGe/lyR83i6k9ISqsgvViYAWEuIWUIN+UlS7V9Ha+
 di1m0LEpm5I9flYi9FzUEphRkh+i19q7ZtWHRnHQVQrPw7LL2RY61hR//45nV+kwyAmu
 kOdA==
X-Gm-Message-State: AOAM531hL1OsuCYA7sdS3pnG9bB2IqP3+ZZ6Wm7iZ0ODTulhruM8leuT
 zDm3j2Ztu7TpgiEW7YR6giWm+4Ve
X-Google-Smtp-Source: ABdhPJzHwwNeTokySopi+E1W3pQs42+38f8CKWP93EMiZw3DeA3Fdk/LyfS5+OPvl5Fa/XvAz29zdA==
X-Received: by 2002:a63:aa42:: with SMTP id x2mr13017666pgo.361.1593495314689; 
 Mon, 29 Jun 2020 22:35:14 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c12sm1292038pfn.162.2020.06.29.22.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 22:35:13 -0700 (PDT)
Date: Tue, 30 Jun 2020 15:35:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200627150428.2525192-1-npiggin@gmail.com>
 <20200627150428.2525192-4-npiggin@gmail.com>
 <20200630022713.GA618342@thinks.paulus.ozlabs.org>
In-Reply-To: <20200630022713.GA618342@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1593495049.cacw882re0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: kvm-ppc@vger.kernel.org, Anton Blanchard <anton@linux.ibm.com>,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 30, 2020 12:27 pm:
> On Sun, Jun 28, 2020 at 01:04:28AM +1000, Nicholas Piggin wrote:
>> KVM guests have certain restrictions and performance quirks when
>> using doorbells. This patch tests for KVM environment in doorbell
>> setup, and optimises IPI performance:
>>=20
>>  - PowerVM guests may now use doorbells even if they are secure.
>>=20
>>  - KVM guests no longer use doorbells if XIVE is available.
>=20
> It seems, from the fact that you completely remove
> kvm_para_available(), that you perhaps haven't tried building with
> CONFIG_KVM_GUEST=3Dy.

It's still there and builds:

static inline int kvm_para_available(void)
{
        return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
}

but...

> Somewhat confusingly, that option is not used or
> needed when building for a PAPR guest (i.e. the "pseries" platform)
> but is used on non-IBM platforms using the "epapr" hypervisor
> interface.

... is_kvm_guest() returns false on !PSERIES now. Not intended
to break EPAPR. I'm not sure of a good way to share this between
EPAPR and PSERIES, I might just make a copy of it but I'll see.

Thanks,
Nick
