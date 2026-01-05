Return-Path: <linuxppc-dev+bounces-15242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D30CF24BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 09:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl6GF1Fx5z2yCL;
	Mon, 05 Jan 2026 19:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767599316;
	cv=none; b=JLVfGz69no/TGeJSWMRW7QTX9dLUIYX81kLGZ0h3zuay6swzR+haGHnaVdvOaB3gj6wJFcDPxB/EIgcXNUb1hCTlqvPehjLreodPqiZDOBs7bYo/vZrya8COUtKXz8D8uJHsEZVV4LzD4rDTEi00FyueerC+ahLahgjRx3n1lcd7vYDtmqpKYh/jkM3djmr8O5MpC9rFKgDpDR3nK14PKkCzIslttxtyOjjvgopbiVlvVacwsv+qn8RyER1AnoVhJhIL2BGTVZ92OFwvYcrda4vemr/7r0PYa2f9uY6l2sV6MIN8VItd6eDq7OX2BMaBBbW7pcHu2V3YfzEy3K1dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767599316; c=relaxed/relaxed;
	bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YF+8ldZc5VHAAThQ/j09BxfiGKzQ8Y5nx4HMX4vPp/1xoyD/rMZAXoJDh3Ck9ZwRRKBE8gABbRf1iNLiQP56L7Lvjr8pGjEzbIXRmiWePbJK9qovbr+LUYw004SyzsP7HNizuRCUeXrKUfUhinbZXs7IOoEVrx8H8JWwB3GleiWUK4ULbJMi8ynbosfG0jt24l2LtxZTvcFrigNoy/FALB047LYseeU3SVKylLYBg4icWutroDHDnXfBKAzzDHvKh3jSOxPJfCUDQm8vEtG9b0OXQQkeJUgBRJVZNrbES62edaFeu2IxiiMFgu/KosRTB4yvqXLYOcxynvot9TNWwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H74uRyhD; dkim-atps=neutral; spf=pass (client-ip=209.85.215.179; helo=mail-pg1-f179.google.com; envelope-from=dqfext@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H74uRyhD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.179; helo=mail-pg1-f179.google.com; envelope-from=dqfext@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl5yW5gtxz2xS7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 18:48:34 +1100 (AEDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso14822977a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767599252; x=1768204052; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=H74uRyhDJ8zNaf4/tj+ESil298NWzTTRbFD2YeesTWxEr2GHwKQH/Fw/vdHLUE8XuV
         i/o5BQ1z3Y+DjkE+9N1zdQzPRDtKmpIy6M22AutG6CjrJiLk6Yo4rzXkLD1SIKWwhG3b
         2aenPznXl5Tbectu4RqV50qMVouUfhejt8nOYxoygy/wS7IAT+w+fZDigOVFflFHMGa8
         dPuYTFOgjLCNgim6rVQCMcM7Y2hZ2e4oy/YwpnflGQPklgxQoE1U078r0NJgWpGAVtjb
         q0U1+rmZhAWMMmVqxwdSq7FuvPR45PUC8BGvKmU1LPjr1LjevN2dPHt+7ZsMfJbelD2o
         1p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767599252; x=1768204052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=kVDyVsGiLjhTPd2AXo8LL9ubsecrQ/3H3pDonq1RW8Qf+HPuMZBY0zMqkFj9qZYHCu
         sEOZ2+3PgTAJJwhi8t51qxZwsnkyZEj4cY5sYm8F6vRQlkha/wJmpf5tkAweXiLRGR42
         1QJcRldSVII4Qb7N+/AnLvqLecsRnQc9T0rt8OYEMOScRyWm+1aA3LnLgeSQsDWg498E
         PurIwLxy3NqxVYCt2V6mIxSkhufc45NmV8L1gqgvAGYx2Sf/pxhD2CtGY/lzhnlqUomh
         aZGM9ZL22/bp4bFSTLyOWdSw0mT9R/mqQRIuwrRBCvbGyvgovj5aeav0sKqtzt75chJv
         VhRA==
X-Forwarded-Encrypted: i=1; AJvYcCXcCgStMCCM6Zl6+f9WXIJNSIu4esyFoTS4Cqseqe6bAJ/6twczcMad0xbdn6+uI5smusqlixJzuj7y5ig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz+oh2nLKLvN4cTZg7MaxWv9WpLTyuxrTY3WMhGSthcL+i4Ybq
	9mT3h35/yTVW+L5bdTrMuSuehnhMZfPSeJAT1TVp9ByHHUdv95FEqSne
X-Gm-Gg: AY/fxX7/7wHdRfWe//zovPMKxlBD66tXskanE6LU8TIyjF/nJK4Zu53IMJdsmp8ZzMQ
	CYA2oJy3BfMvDUOmSwKZnIJvtE7BmnLrMPs2fTJxv+KIr/i9zVVXk2jO3LOoPEAA3b5nIrBSRYn
	9pehdIhsczvciNoPBXwCQ5omuaV8hRAT1SeQdyhgrUxuzIa0C/N9HbbhHIC59BAKjb5ukzVfATP
	xIOeujW6q2XbXxHQCfzj6tg8oOO03uzUUomjIxRLIJNn1voJUG1f/aMp574EYI+F64G5Yp5F2wd
	zOMT8+QnzlvFOeo+6rF8WM15yS0odf7OohpVAseIqudOr4a2m/sqOadEcvO0NumKjptA0yLVgdH
	84ETvLvsg8jqF/qHIgcIyJF+8Rrw1X/QAfilnHQu7wXzColF73cggk1qlSadf2r1wiMfZ2l6MZQ
	==
X-Google-Smtp-Source: AGHT+IHVaBHzL3ldcoq10mQ0DvSoQNAzO29+h1IBrSy2gZY7Qh6quSoh5XWNmgIvhDzcT+gz+HyNHQ==
X-Received: by 2002:a05:693c:8008:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b05ebd7223mr36936529eec.6.1767599252090;
        Sun, 04 Jan 2026 23:47:32 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0f:28::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm101610210eec.4.2026.01.04.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:47:31 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 02/36] lib/crypto: aes: Introduce improved AES library
Date: Mon,  5 Jan 2026 15:47:12 +0800
Message-ID: <20260105074712.498-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105051311.1607207-3-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org> <20260105051311.1607207-3-ebiggers@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4 Jan 2026 21:12:35 -0800, Eric Biggers wrote:
>  extern const u8 crypto_aes_sbox[];
>  extern const u8 crypto_aes_inv_sbox[];
> +extern const u32 __cacheline_aligned aes_enc_tab[256];
> +extern const u32 __cacheline_aligned aes_dec_tab[256];
 
__cacheline_aligned puts the array in ".data..cacheline_aligned"
section. As a const array, it should be in ".rodata" section, so
____cacheline_aligned (note the extra underscores) should be used
instead.
You can also apply the same to crypto_aes_sbox and crypto_aes_inv_sbox
while at it.

Regards,
Qingfang

