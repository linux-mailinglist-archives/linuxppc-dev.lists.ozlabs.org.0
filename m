Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C177D6DAE2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 15:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtKRy4rLxz3fVQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 23:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kX12iSDY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kX12iSDY;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtKR65sN2z3chd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 23:46:41 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-23b4291461dso160407a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZL321vaITWn9sq0TM/dZld2xfZM7ieaEWlwJnFULcKo=;
        b=kX12iSDYPTc/jNWI/Shc8ryP57t5aEJe6dCb/WMczQssEYLicItq9gB9dV7uM6EBZd
         HvxFSx8v/lDlcZRtF1tzF6whyY+6UrmmJUEzdC9ZLJR+dda2MvA/7oUSxpLgeInB/POm
         Su74NLfmxkvKDnKgdWXQqhWJqQ17l+u6wV8Q233LYvItrgXBUAjy0prMpNT+xDJgIxZ8
         HmgQB2Jdp1gSDuO3tpXsmjlL3edgxU6Vqi1mUHX5koE0q0XWVtIAQT8N//rrRnkC+yxv
         I4IMsbF6r3RAOo3rC5XYdjYa8/s5ShRBVLBmC4KcbEmQsXcigR+3E1wJTOuF1WVTjWak
         xilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZL321vaITWn9sq0TM/dZld2xfZM7ieaEWlwJnFULcKo=;
        b=0n7SukRDguRO3lhxOYPuty/knknpJOqkmksIhJzJWHenKzJ1y4k6va4Us2AqDqmrMO
         Uyx4fE1PxGlKraHD1E91M3b9k24P+yf+FFMs1P3xxk62N7snIRQV6i/dWNYKOexu4qFb
         rOM5fFSsfA/C0tFzptEGTW4POaQ9hxgyTcPLlINWo2AeMIF8v1nGWpa9KKLlsydjE/pY
         PVXBnDeyjnwjdeJwzzvlKlGamOtZjevh/Coojp7aymzRUbIJ2HMUANtTRsdJDC5rbA+U
         8Bv9Nr7Jn8+jbhKFQXGu8CUON0DTZn/WAz9obY604KnGnrC1AqA+46oMg85naElurt/5
         H4PQ==
X-Gm-Message-State: AAQBX9egsoq5fMLGyBemwKNEKOZq1JK3wc4/iKX8ano5aAL22gUpOdVw
	o9cUjRWJkYyWaf4vS1A1sn4=
X-Google-Smtp-Source: AKy350YaVuyemhEJIxnNyz0NWio4uKYlJsvlUnwsS6Msz0fskX2OH31jxejr8ZW2tYTR1B7iwI4pdw==
X-Received: by 2002:a62:1989:0:b0:626:1c2a:2805 with SMTP id 131-20020a621989000000b006261c2a2805mr2273160pfz.25.1680875197221;
        Fri, 07 Apr 2023 06:46:37 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-76.three.co.id. [180.214.233.76])
        by smtp.gmail.com with ESMTPSA id b8-20020aa78108000000b0062d7c0dc4f4sm3067550pfi.80.2023.04.07.06.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id BEB061067F2; Fri,  7 Apr 2023 20:46:32 +0700 (WIB)
Date: Fri, 7 Apr 2023 20:46:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: PPC: BOOK3S: book3s_hv_nested.c: improve branch
 prediction for k.alloc
Message-ID: <ZDAeuL2fz1aEW6rz@debian.me>
References: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6caTa8mxFTuMf/uP"
Content-Disposition: inline
In-Reply-To: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--6caTa8mxFTuMf/uP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2023 at 05:31:47AM -0400, Kautuk Consul wrote:
> I used the unlikely() macro on the return values of the k.alloc
> calls and found that it changes the code generation a bit.
> Optimize all return paths of k.alloc calls by improving
> branch prediction on return value of k.alloc.

What about below?

"Improve branch prediction on kmalloc() and kzalloc() call by using
unlikely() macro to optimize their return paths."

That is, try to avoid first-person construct (I).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6caTa8mxFTuMf/uP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDAetAAKCRD2uYlJVVFO
o8WRAQDI+qrr3elgQo4FKB1f8DWaii9J1c8omUyFNKUt/TOr0AEAvj3x7tljbC01
Cs/ZW4kFNxjJHwgIY5bhRfZr28QfbA4=
=4KC8
-----END PGP SIGNATURE-----

--6caTa8mxFTuMf/uP--
