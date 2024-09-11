Return-Path: <linuxppc-dev+bounces-1226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E591974757
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Lw747Nrz2yV3;
	Wed, 11 Sep 2024 10:26:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726014375;
	cv=none; b=eeIHyMW29EIgLFW5YK00kDvSXicX+99/smNO6Hy/DSOx+7w4pWF8wjPULa3KXzQv4SLJm7ujQnkh41sMEcJRY/6hm61nDjkc6WhxsddaXEwEsB5LGlSBZwCFJVHslPEAi9H+dFSk2/4f7djN97RH6FTJLZSiidTYWvRUqtv0eRUmJOb59zlOBdjjW5j/iOtJ20oj6DwxI7AjkCO0v4NVY6W/6f2PGbofFdd8Tikl8+B08ZD0fLk1husQTcgE3bq2RBZELfs0QaYhLZCDsKyxv1Zrg+saX1wMz2S0W0JAvWfyuHIBQSudr5pjGIlJcCl7BL4IQamPs9t4zygU+7czbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726014375; c=relaxed/relaxed;
	bh=cEyXAdKeEJQoAHfFQf1BZ5A9dLRXujoz25bWx+9TXyc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=d9op/fOtnr2dH5eilnsFyohIFrZaaOaSelflDaGBru2O2HgxMIpUoSGK1Hj9N7E8WOYUKoxSsOl5Vfcu7Hagn+WRxftzOD4aEwWO6VpC6ChwGxrQk+VJVgExQDI0/xN2pnJ7YdzKJSb9LTs0Mt6QqQaln4Kel6uzWI8JAmLMbQuZyXuprBsgVF0ZjERN2Zc5AUiNNXcUBCIV6sRMJM5vqlBI65yxrsHdFX+thyCHV0gyxv/7VnzEijWmvj0EOlnX4nyqUGytk6BYlWKXwOSGdFnU+jDFkeoZ5MI6kBh5s9zLjm6fTR05uMZRJ0zfO+MqfPi1/404ejjJq1nyZjkfkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nXZ/HKMY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nXZ/HKMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Lw71wL9z2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:26:15 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20688fbaeafso62896355ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726014373; x=1726619173; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEyXAdKeEJQoAHfFQf1BZ5A9dLRXujoz25bWx+9TXyc=;
        b=nXZ/HKMY6eetGQE0PlsKRLUkzZFO53NaGKo6cQW40YLsnCXBzkLbq5nlEqyFE3X0Wq
         hJHawji2MPqLvuS8zzvRn+pzAP8Ogq5Z9uiFcMznnb7JqCka5lwNmyqmj7Zydpgk1lEU
         0le1A6XmRgtv2EEle+fjuYmSK1BVkiJWRK8t0u5zmrUD1trFB8FrL1T2fHm8Ht3lYn6/
         OKU6u4QNz+nyBm0r+suzQKgZ6DtOFgYmFTTi+NQwaV0K3D6kMqn+ZxuEviHi6JNCTyiD
         60Aqp302bb55OS26tRErVDlipBjRKJIFeF9Ci23ssyltQP2LF5SqyI0g7SywIHejk+Zp
         3/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726014373; x=1726619173;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEyXAdKeEJQoAHfFQf1BZ5A9dLRXujoz25bWx+9TXyc=;
        b=tKrWbdtYLPdjjZUkDiBh48Kxkl6FxjWsYuuK7lhuHKHilrdPor+S9HvpQ3XQkTsr6H
         RmWCfqME+2h0VR7VQES5PkI+V/ZNJvGvAgAVrTvTirHLn4s41Vu5UjB8h7vtps63ECtN
         Yw6LzyOxc5QUWlLlc4sH+klJBdnv8zg9zlxqynTgpZT18kPTN/k+yN5ecu0o71qYfhBL
         dZDLCfv97J95INlcKSz5IRsUW3DKX30Ic709Ar1RJHf3BWIAU+4zSu02kznphrdseCIl
         5LmSXvcJ24sgvJZvbM13sppuzdrpcaN8jcOtIyeNe0uF7yZqY2IvjCyKxuIGK0zON7rJ
         b+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBeV2D0im86Mr5xStdADoJRpcRa9Ww7FVOjc2TPWChXOZ3eRUKkQGXhlgSxOOgQnwU1kLKj7Sjx3XkCk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywbm8NLk2EVzPtJ2Ef0SWEqX2w9oEmYQyblxEXurtZvtTHt8ZSz
	7dkP1R1BiLPlqQG2X/LMUkxFS14vzpWWA5kEm32GuwNbRCLB5AZt
X-Google-Smtp-Source: AGHT+IHdupOZtZNvqV8Jq+ivzEDY7SaRBw9l5Q5S/ff1gCan8RdbB7OhqPF/t1bFYOvCzz+LolCTIQ==
X-Received: by 2002:a17:902:ce11:b0:206:c486:4c33 with SMTP id d9443c01a7336-2074c631b1amr37647145ad.30.1726014372538;
        Tue, 10 Sep 2024 17:26:12 -0700 (PDT)
Received: from localhost ([1.146.47.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710eea95esm53895415ad.161.2024.09.10.17.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:26:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 10:26:03 +1000
Message-Id: <D431108K19Z2.3EDZQCSG5RC4X@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>
Cc: <pbonzini@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <nrb@linux.ibm.com>,
 <atishp@rivosinc.com>, <cade.richard@berkeley.edu>, <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 4/4] riscv: gitlab-ci: Add clang build
 tests
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.18.2
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-10-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-10-andrew.jones@linux.dev>

On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> Test building 32 and 64-bit with clang. Throw a test of in- and out-
> of-tree building in too by swapping which is done to which (32-bit
> vs. 64-bit) with respect to the gcc build tests.
>
Acked-by: Nicholas Piggin <npiggin@gmail.com>

> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 67a9a15733f1..b7ad99870e5a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -176,6 +176,49 @@ build-riscv64-efi:
>        | tee results.txt
>   - grep -q PASS results.txt && ! grep -q FAIL results.txt
> =20
> +build-riscv32-clang:
> + extends: .intree_template
> + script:
> + - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu clang
> + - ./configure --arch=3Driscv32 --cc=3Dclang --cflags=3D'--target=3Drisc=
v32' --cross-prefix=3Driscv64-linux-gnu-
> + - make -j2
> + - printf "FOO=3Dfoo\nBAR=3Dbar\nBAZ=3Dbaz\nMVENDORID=3D0\nMARCHID=3D0\n=
MIMPID=3D0\n" >test-env
> + - ACCEL=3Dtcg KVM_UNIT_TESTS_ENV=3Dtest-env ./run_tests.sh
> +      selftest
> +      sbi
> +      | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> +
> +build-riscv64-clang:
> + extends: .outoftree_template
> + script:
> + - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu clang
> + - mkdir build
> + - cd build
> + - ../configure --arch=3Driscv64 --cc=3Dclang --cflags=3D'--target=3Dris=
cv64' --cross-prefix=3Driscv64-linux-gnu-
> + - make -j2
> + - printf "FOO=3Dfoo\nBAR=3Dbar\nBAZ=3Dbaz\nMVENDORID=3D0\nMARCHID=3D0\n=
MIMPID=3D0\n" >test-env
> + - ACCEL=3Dtcg KVM_UNIT_TESTS_ENV=3Dtest-env ./run_tests.sh
> +      selftest
> +      sbi
> +      | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> +
> +build-riscv64-clang-efi:
> + extends: .intree_template
> + script:
> + - dnf install -y edk2-riscv64 qemu-system-riscv gcc-riscv64-linux-gnu c=
lang
> + - cp /usr/share/edk2/riscv/RISCV_VIRT_CODE.fd .
> + - truncate -s 32M RISCV_VIRT_CODE.fd
> + - ./configure --arch=3Driscv64 --cc=3Dclang --cflags=3D'--target=3Drisc=
v64' --cross-prefix=3Driscv64-linux-gnu- --enable-efi
> + - make -j2
> + - printf "FOO=3Dfoo\nBAR=3Dbar\nBAZ=3Dbaz\nMVENDORID=3D0\nMARCHID=3D0\n=
MIMPID=3D0\n" >test-env
> + - ACCEL=3Dtcg KVM_UNIT_TESTS_ENV=3Dtest-env ./run_tests.sh
> +      selftest
> +      sbi
> +      | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> +
>  build-s390x:
>   extends: .outoftree_template
>   script:


