Return-Path: <linuxppc-dev+bounces-9016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC015AC8170
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 19:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7XnL6Ny3z2xDD;
	Fri, 30 May 2025 03:05:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748538342;
	cv=none; b=iS+bKEW2QidraZC/jj1dXLB40I+j32UyQK2AChNGC5O8AtsmlmcfTP5LI212v7Jyz3N9DFQxCuIJJ8W9v19cR0i4DIBQHAPdr4subx4diz9K4IMX58MvRbLOem+Rz3mcHQ+aq0GgE3OV7m3POyaj6+0tAwn0KbNdawH1cKBR7qLXWKuzwA2HLPCyAQulYjlltgWQ2bg2FsmK72GNclHZbHBXavXwAZ9sFm/au03yhRPx2XpEp5WTWmzE9usufbQ4/pMYY+pP7GOEqghYeTek/YzkFFxHcjGRhXZ5ClV+NdA75PjFkVEPub2mUB8EPsb6waGpWFfdc+i2+rqnXOCwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748538342; c=relaxed/relaxed;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxHLUm+TrJUcVT0mm804+gJLkfTGsQuBPWK7CcLhsauHnMFzfxu7P2A7vjiKBqCSqygtkUNcDLNQ9fzqGQfsIlQK+W9N5DI0y0GZhKdZuDzs+siqeIB8AbxWjDVTfFkl996rJbZQjzIHxDPz1rLsoSkd18TPljPyIYDMBEL36/ZFaIzTbIaXuGWyUGhzyMa7J8t93/+WxtJUGkcijrQ1m5D/915LIl/ll3h2SjeKFiqM2itfVzPLjFXFRTHAp+lM1zhu9voSqzabDarBS4MW833xcSp4jdtKlcBistC6vVNAyAQbcpoSc5sS8GXG9xe3c63kXsbJBD11lE8LBOAL7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HA0dzhYg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HA0dzhYg; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HA0dzhYg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HA0dzhYg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7XnH4Xygz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 03:05:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748538332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
	b=HA0dzhYg2/d2e9xCOQ6+qrQfdSIoIjKIE54Hfm2mZGs9AEUR7zBotVe4IYg8usT0jPM5Rv
	vNgz+nUnERNME4jNE7M6Q0KewvGDiq/+8HnWr/vRa9F/jswDSiBHMYPvH6yxP4MB2h/8on
	oBX5gNXG+HXcEacttTNL6TZSFOW/pGk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748538332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
	b=HA0dzhYg2/d2e9xCOQ6+qrQfdSIoIjKIE54Hfm2mZGs9AEUR7zBotVe4IYg8usT0jPM5Rv
	vNgz+nUnERNME4jNE7M6Q0KewvGDiq/+8HnWr/vRa9F/jswDSiBHMYPvH6yxP4MB2h/8on
	oBX5gNXG+HXcEacttTNL6TZSFOW/pGk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-QLGWcFA9PoCA_CN6csaV5g-1; Thu, 29 May 2025 13:05:30 -0400
X-MC-Unique: QLGWcFA9PoCA_CN6csaV5g-1
X-Mimecast-MFC-AGG-ID: QLGWcFA9PoCA_CN6csaV5g_1748538330
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dd77fda439so1101985ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538330; x=1749143130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
        b=jnUuz71jHCkB1SMdA7CLC4NmYhhQp+BdqV6SCEA0f7wdbTQFGWoJClRCTH3G8SJwij
         g/rkPgcMqv9aGszjaSc/VjicQSMGNeGopdHgFkaxy8Mt1QnygnRcrYylM1A2PRnFdZsk
         ci25VtkaawFqusHJdAupMaoq514Guo31HO/MBdqEdju2YlGpGHBtP9acT+XS2r3tpfPW
         83Lrhk15QPMbhN64w/JdzCMdvFopOo3yVS2bzx2c08ryLg49Qw4Cwmj+vEeC66pjINvn
         H6upugZQuAvn+DMBU0+DS9IVOSJyO3MAZr552dVTUyAwhBMxHImKZEu9VcG2tiCfhaHT
         PEDA==
X-Forwarded-Encrypted: i=1; AJvYcCXJvXAl/CMqviyqrLNeUkSzbV7p6PV8ISaydh5yVs1pA2QcaLbQRVAQo9W050blGQX6iJOxkAbkrNjEun8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6nurFfgnnYoqa27PxZZjrLnitIgvn8T6ijo++W7+TCEe8eWEk
	N5UNjylsBuQDKj7QBQ5Ddn+o2v1cJLU6gzCZT+CateoMQN28a7kJrbaPo7+1gAk2Pc6G7RkrHfn
	e9Q7pGvglkTgdBuduvaABsd2MJO9l5b14cXno3mT2uSgaWm+hXydM6oa9iFF+TBZB7hU=
X-Gm-Gg: ASbGncvPwl2Fg793NjefYmqGRdug+2eKzdcHFraA9jwPmmcEfFKOng1FxWtTBMdKdoN
	5uOSQsEcrDtdLCGRgxLo2m38oUhmaZ6RjaEbhIsEATqbGc1EqYge/eO4NH6CIuH3x+yjKnzfsaw
	Y2LeDWmqh4phIAG6hWj4CxGpSq9FU7swbhppiglWFGnyT9PD7qig4Bd+2jpJntuVKUfWE9r02Vt
	At81xmZeoYlt+3AV7B76xQHIVekkvq8cMoLehv2vCEZ1Hl2BdCV6eXBsvatApcgcWcKeudw0dil
	aMLU6PzF3211lo4=
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264975ab.1.1748538329937;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfF2IypLjTHDTvX90AOSKarc6ttkVaDkLoPGB0d3lYBRme4WFH0Ya+stqq3YBkEYUuHUQECg==
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264795ab.1.1748538329510;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935462c8sm3928805ab.36.2025.05.29.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:05:28 -0700 (PDT)
Date: Thu, 29 May 2025 11:05:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library
 instead of shash
Message-ID: <20250529110526.6d2959a9.alex.williamson@redhat.com>
In-Reply-To: <20250428170040.423825-9-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
	<20250428170040.423825-9-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tdonp2lQghpAwlPnL5IkQCzii132-YS7pE114ilHx9U_1748538330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 28 Apr 2025 10:00:33 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.

I can get to the following error after this patch, now merged as commit
b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):

error: the following would cause module name conflict:
  crypto/sha256.ko
  arch/s390/lib/crypto/sha256.ko

Base config file is generated from:

$ CONFIG=$(mktemp)
$ cat << EOF > $CONFIG
CONFIG_MODULES=y
CONFIG_CRYPTO=y
CONFIG_CRYPTO_SHA256=m
EOF

Base config applied to allnoconfig:

$ KCONFIG_ALLCONFIG=$CONFIG make ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- allnoconfig

Resulting in:

$ grep SHA256 .config
CONFIG_CRYPTO_SHA256=m
CONFIG_CRYPTO_LIB_SHA256=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA256_GENERIC=m
CONFIG_CRYPTO_SHA256_S390=m

Thanks,
Alex


