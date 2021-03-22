Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637EC344E2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:14:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F42h02Q7hz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:14:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OuAiyERm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OuAiyERm; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F42gc28hBz2xfQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 05:13:47 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id w8so8918609pjf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Qq8raOlLG9v3LgEz+Fj0Q18e7Dl2YyDOZyF1mZtkVlo=;
 b=OuAiyERmsYYOhOXnyNL4DS25SMQYNvHknavb1QJwjwrLATpGojEOk/JZ8ITnWDVSuD
 miligP7rq17+CX37qnq7bCq2YgglBXT2RgQP62V7HGE91TIDD8/sOAsGyPxeEiwvhJX9
 OY1d+1AQfJ9Bc0HXR5Fv7SkcSicZi7bBoJp4z8A9f6QT/h5DkKusa+GycVhKRfYIRwwh
 M/R6a7JW8Qa3whHXDlEZF0fTEiGGpl9lM89eIG6MJp2dPGuQFp3vyXslspCZnc/Nj0X8
 lHWU2e95Q/dt7eCbe/xz0V/20LMd0Sp9PUZqbPv+PcFf9PprMErx89yJ0vP4N4XgcohV
 Lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Qq8raOlLG9v3LgEz+Fj0Q18e7Dl2YyDOZyF1mZtkVlo=;
 b=rtmYslGirsl4kdEt4reX4w68o4E8y2zcZPvSdnKNTN2dNOPQZf+7U1wwwill+COOVI
 VvG2NjO6iJx9SgNG3YgGi/3CDBksABjQlrSAKNQDXd1pBe9lAJNh71PaxEzmNud94sbQ
 UMZCXUy48SgfSSJe7QId6+QalEbzO0Y2T1dCk0gRWockdkQYisVJ9euBcfv+Iwc8p3sC
 gn1D4GSMNWqp6VRz4ZLV/x/j87n6M2DkWww8WAIVZWhl9b/LGbyi5RITaaNAlqdhhrJb
 WDyZFjJkFGY8rQntKSdjgmhqqClCodKSCFNJnTi47MCXovuN6VgDS0tJPZDFRU/ZdjCH
 7SjA==
X-Gm-Message-State: AOAM531u6S5DFhaiP3YN1je1UKzRlYqqvp+t1dPdKi9wNIk5epqnvLw+
 DXMp1ig3EqHIRbV3oMjCvAU=
X-Google-Smtp-Source: ABdhPJyLc8hsm4YQnGwcJtuT2J5r6Vv7n+9Ww9+yJQhgy5V3kQxuozM7MRkXXuMBDbSRVO0dwEURdw==
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr375039pjq.122.1616436826270; 
 Mon, 22 Mar 2021 11:13:46 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id n25sm4513370pgv.66.2021.03.22.11.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 11:13:45 -0700 (PDT)
Date: Tue, 23 Mar 2021 04:13:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 17/41] KVM: PPC: Book3S HV P9: implement
 kvmppc_xive_pull_vcpu in C
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-18-npiggin@gmail.com>
 <11823cfb-3d10-8f2f-4caf-9b38a010ed31@kaod.org>
In-Reply-To: <11823cfb-3d10-8f2f-4caf-9b38a010ed31@kaod.org>
MIME-Version: 1.0
Message-Id: <1616436715.ynrx4scuw6.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of March 23, 2021 2:19 am:
> On 3/5/21 4:06 PM, Nicholas Piggin wrote:
>> This is more symmetric with kvmppc_xive_push_vcpu. The extra test in
>> the asm will go away in a later change.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xi=
ve.c
>> index e7219b6f5f9a..52cdb9e2660a 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -127,6 +127,37 @@ void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu)
>>  }
>>  EXPORT_SYMBOL_GPL(kvmppc_xive_push_vcpu);
>> =20
>> +/*
>> + * Pull a vcpu's context from the XIVE on guest exit.
>> + * This assumes we are in virtual mode (MMU on)
>=20
> should we add an assert on is_rm() ?=20

I thought the same thing at first, but I think it should be okay.
kvmppc_xive_push_cpu does not have an assert, and in the next
patch the push and pull get moved out to where it is much clearer
to see the MMU is on.

Thanks,
Nick
